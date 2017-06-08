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
import java.util.Date;
import java.util.Locale;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.quartz.JobExecutionContext;
import org.springframework.stereotype.Service;

import egovframework.oe1.sms.schedule.service.EgovOe1SmsSchedulerVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * 스케줄링 Job 이력을 DB 에 저장하기 위한 로그 Util 클래스
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

@Service("scheduleLogService")
public class EgovOe1SmsScheduleLogUtil {
	
        /** SimpleDateFormat **/
	SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd HH:mm:ss",Locale.getDefault());
	
	/** EgovOe1SmsScheduleDAO **/
	@Resource(name="egovScheduleDAO")
	private EgovOe1SmsScheduleDAO scheduleDAO;
	
	/** EgovIdGnrService **/
	@Resource(name="egovScheIdGnrService")
	private EgovIdGnrService scheLogIdGnrService;
	
	/** Logger **/
        Logger log = Logger.getLogger(this.getClass());
	
	/**
	 * 
	 * @param gbn 로그 메세지 구분: [INFO], [ERROR]
	 * @param jobExeCtx Job 실행 컨텍스트
	 * @param msg 로그 메세지
	 * @throws Exception 
	 */
	public void scheduleBizLogger(String gbn, JobExecutionContext jobExeCtx, String msg) throws Exception{		
		
		EgovOe1SmsSchedulerVO vo = new EgovOe1SmsSchedulerVO();
		
		if(jobExeCtx != null){
			Date currentTime = new Date ( );
			
			String log_no = scheLogIdGnrService.getNextStringId();
						
			vo.setLogId(log_no);
			vo.setLogSe(gbn);
			vo.setJobNm(jobExeCtx.getTrigger().getJobName());
			vo.setJobGroupNm(jobExeCtx.getTrigger().getJobGroup());
			
			vo.setJobExecutTime(sdf.format(currentTime));
			
			vo.setLogMssage(msg);
			//항목 추가 필요					
			log.debug("gbngbngbn ==>" + gbn);
			log.debug("Class ==>" + jobExeCtx.getJobInstance());
			log.debug("Class ==>" + jobExeCtx.getClass());
			log.debug("getDescription ==>" + jobExeCtx.getTrigger().getDescription());
			log.debug("getFullJobName ==>" + jobExeCtx.getTrigger().getFullJobName());
			log.debug("getFullName ==>" + jobExeCtx.getTrigger().getFullName());
			log.debug("getGroup ==>" + jobExeCtx.getTrigger().getGroup());
			log.debug("getJobName ==>" + jobExeCtx.getTrigger().getJobName());
			log.debug("getJobGroup ==>" + jobExeCtx.getTrigger().getJobGroup());
			log.debug("getEndTime ==>" + jobExeCtx.getTrigger().getEndTime());
			log.debug("getStartTime ==>" + sdf.format(currentTime));
			log.debug("getNextFireTime ==>" + sdf.format(jobExeCtx.getTrigger().getNextFireTime()));
			log.debug("getPreviousFireTime ==>" + sdf.format(jobExeCtx.getTrigger().getPreviousFireTime()));
			log.debug("msg ===>" + msg);
			
			scheduleDAO.insertScheduleLog(vo);
		}

	}
	
}
