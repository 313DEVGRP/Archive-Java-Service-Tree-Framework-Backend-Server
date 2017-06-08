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
package egovframework.oe1.sms.schedule.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.quartz.SchedulerException;

/**
 * 스케줄링 이력 관리를 위한 서비스 Interface
 * @author 운영환경개발팀
 * @since 2010.06.29
 * @version 1.0
 * @see <pre>
 * &lt;&lt; 개정이력(Modification Information) &gt;&gt;
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2010.06.29   운영환경개발팀                최초 생성
 * 
 * </pre>
 */

public interface EgovOe1SmsSchedulingService {

    /**
     * Job 목록 얻음
     * @return
     * @throws SchedulerException
     * @throws Exception
     */
    public ArrayList getJobList(HttpServletRequest request) throws Exception;

    /**
     * 스케줄 이력 로그 조회 EgovOe1SmsSchedulerVO
     * @return EgovOe1SmsSchedulerVO
     * @throws Exception
     */
    public EgovOe1SmsSchedulerVO selectScheduleLog(EgovOe1SmsSchedulerVO vo)
            throws Exception;

    /**
     * 스케줄링 상세 조회 EgovOe1SmsSchedulerVO
     * @return EgovOe1SmsSchedulerVO
     * @throws Exception
     */
    public EgovOe1SmsSchedulerVO getJobList(HttpServletRequest request,
            String jobName) throws Exception;

    /**
     * 스케줄 이력 로그 목록 조회
     * @param EgovOe1SmsSchedulerVO
     * @return List
     * @throws SchedulerException
     */
    public List selectScheduleLogList(EgovOe1SmsSchedulerVO vo)
            throws Exception;

    /**
     * 스케줄 이력 로그 총 갯수 조회 int
     * @return EgovOe1SmsSchedulerVO
     * @throws Exception
     */
    public int selectScheduleLogListTotCnt(EgovOe1SmsSchedulerVO vo);
}
