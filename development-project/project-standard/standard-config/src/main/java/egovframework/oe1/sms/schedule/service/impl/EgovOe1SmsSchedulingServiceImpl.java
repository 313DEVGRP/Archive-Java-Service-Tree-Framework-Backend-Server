/*
 * Copyright 2010 MOPAS(Ministry of Public Administration and Security).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.oe1.sms.schedule.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.quartz.CronTrigger;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SimpleTrigger;
import org.quartz.Trigger;
import org.quartz.impl.StdScheduler;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import egovframework.oe1.sms.schedule.service.EgovOe1SmsSchedulerVO;
import egovframework.oe1.sms.schedule.service.EgovOe1SmsSchedulingService;
import egovframework.rte.fdl.cmmn.exception.FdlException;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * 스케줄링 Job 이력 관리를 위한 Service Impl 클래스
 * @author 운영환경개발팀
 * @since 2010.06.29
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2010.06.29   운영환경개발팀                최초 생성
 *
 * </pre>
 */

@Service("schedulingService")
public class EgovOe1SmsSchedulingServiceImpl implements EgovOe1SmsSchedulingService{

        /** SimpleDateFormat */
	SimpleDateFormat	sdf = new SimpleDateFormat("yy/MM/dd HH:mm:ss",Locale.getDefault());
	
	/** EgovOe1SmsScheduleDAO */
	@Resource(name="egovScheduleDAO")
	private EgovOe1SmsScheduleDAO egovScheduleDAO;
	
	/** 스케줄링 업무 리스트
	 * @param
	 * @return ArrayList
	 * @throws SchedulerException
	 * @throws FdlException 
	 */
	public ArrayList getJobList(HttpServletRequest request) throws Exception {
		ApplicationContext applicationContext = null; 

		WebApplicationContext webApplicationContext;
        webApplicationContext = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getSession().getServletContext());
        Scheduler scheduler = (StdScheduler)webApplicationContext.getBean("SchedulerFactory");
        
        String[] groupNames = scheduler.getJobGroupNames();
        ArrayList<EgovOe1SmsSchedulerVO> result = new ArrayList<EgovOe1SmsSchedulerVO>();
        EgovOe1SmsSchedulerVO scheVo;
        
        for (int i = 0; i < groupNames.length; i++) {

			String jobNames[] = scheduler.getJobNames(groupNames[i]);
	        for (int j = 0; j < jobNames.length; j++) {
	        	
				JobDetail job = scheduler.getJobDetail(jobNames[j],
						groupNames[i]);
				Trigger[] trigger = scheduler.getTriggersOfJob(jobNames[j],
						groupNames[i]);
	
				for (int k = 0; k < trigger.length; k++) {
					scheVo = new EgovOe1SmsSchedulerVO();
					
					scheVo.setJobGroupNm(groupNames[i]);
					scheVo.setJobNm(jobNames[j]);
					scheVo.setJobDescription(job.getDescription());
					scheVo.setJobClass(job.getJobClass().getName());
					if (trigger[k].getStartTime() != null) {
						scheVo.setStartDate(sdf.format(trigger[k]	.getStartTime()));
					}
					if (trigger[k].getEndTime() != null) {
						scheVo.setEndDate(sdf.format(trigger[k].getEndTime()));
					}
					if (trigger[k] instanceof SimpleTrigger) {
						scheVo.setTriggerType("SimpleTrigger");
						scheVo.setRepeatInterval(String.valueOf((((SimpleTrigger) trigger[k])	.getRepeatInterval() / 1000L)));
					}
				
					if (trigger[k] instanceof CronTrigger) {
						scheVo.setTriggerType("cronTrigger");
						scheVo.setCronExp(((CronTrigger) trigger[k])	.getCronExpression());
					}
					if (trigger[k].getPreviousFireTime() != null){
						scheVo.setPreviousFireTime(sdf.format(trigger[k].getPreviousFireTime()));
					}
						
					if (trigger[k].getNextFireTime() != null){
						scheVo.setNextFireTime(sdf.format(trigger[k].getNextFireTime()));
					}
					
					result.add(scheVo);
				}
			}
        }

		return result;
	}
	
	/** 그룹별 스케줄링 업무 리스트
	 * @paramString
	 * @return ArrayList
	 * @throws SchedulerException
	 */
	public EgovOe1SmsSchedulerVO getJobList(HttpServletRequest request,String JobName) throws SchedulerException {
		ApplicationContext applicationContext = null; 

		WebApplicationContext webApplicationContext;
        webApplicationContext = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getSession().getServletContext());
        Scheduler scheduler = (StdScheduler)webApplicationContext.getBean("SchedulerFactory");
        
        String[] groupNames = scheduler.getJobGroupNames();
        EgovOe1SmsSchedulerVO scheVo  = new EgovOe1SmsSchedulerVO();
        
        for (int i = 0; i < groupNames.length; i++) {

			String jobNames[] = scheduler.getJobNames(groupNames[i]);
	        for (int j = 0; j < jobNames.length; j++) {
	        	
				JobDetail job = scheduler.getJobDetail(jobNames[j],
						groupNames[i]);
				Trigger[] trigger = scheduler.getTriggersOfJob(jobNames[j],
						groupNames[i]);
	
				for (int k = 0; k < trigger.length; k++) {
					
					
					if(JobName.equals(jobNames[j])){
						scheVo.setJobGroupNm(groupNames[i]);
						scheVo.setJobNm(jobNames[j]);
						scheVo.setJobDescription(job.getDescription());
						scheVo.setJobClass(job.getJobClass().getName());
											
						if (trigger[k].getStartTime() != null) {
							scheVo.setStartDate(sdf.format(trigger[k]	.getStartTime()));
						}
						if (trigger[k].getEndTime() != null) {
							scheVo.setEndDate(sdf.format(trigger[k].getEndTime()));
						}
						if (trigger[k] instanceof SimpleTrigger) {
							scheVo.setTriggerType("SimpleTrigger");
							
							scheVo.setRepeatInterval(String.valueOf((((SimpleTrigger) trigger[k])	.getRepeatInterval() / 1000L)));
						}
					
						if (trigger[k] instanceof CronTrigger) {
							scheVo.setTriggerType("cronTrigger");
							scheVo.setCronExp(((CronTrigger) trigger[k])	.getCronExpression());
						}
						if (trigger[k].getPreviousFireTime() != null){
							scheVo.setPreviousFireTime(sdf.format(trigger[k].getPreviousFireTime()));
						}
							
						if (trigger[k].getNextFireTime() != null){
							scheVo.setNextFireTime(sdf.format(trigger[k].getNextFireTime()));
						}
					}
				}
			}
        }

		return scheVo;
	}

	/** 스케줄 이력 로그 조회
	 * EgovOe1SmsSchedulerVO
	 * @return EgovOe1SmsSchedulerVO
	 * @throws Exception
	 */
	public EgovOe1SmsSchedulerVO selectScheduleLog(EgovOe1SmsSchedulerVO vo)
			throws Exception {
		EgovOe1SmsSchedulerVO resultVO = egovScheduleDAO.selectScheduleLog(vo);
        
        return resultVO;
	}

	/** 스케줄 이력 로그 목록 조회
	 * @param EgovOe1SmsSchedulerVO
	 * @return List
	 * @throws SchedulerException
	 */
	public List selectScheduleLogList(EgovOe1SmsSchedulerVO vo)
			throws Exception {
		 return egovScheduleDAO.selectScheduleLogList(vo);
	}

	/** 스케줄 이력 로그 총 갯수 조회
	 * int
	 * @return EgovOe1SmsSchedulerVO
	 * @throws Exception
	 */
	public int selectScheduleLogListTotCnt(EgovOe1SmsSchedulerVO vo) {
		return egovScheduleDAO.selectScheduleLogListTotCnt(vo);
	}
	
	
	
}
