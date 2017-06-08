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

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.quartz.JobListener;

import egovframework.oe1.sms.schedule.service.impl.EgovOe1SmsScheduleLogUtil;

/**
 * 스케줄링 Job 실행을 관장하는 Listener
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

public class EgovOe1SmsGlobalJobListener implements JobListener {

    @Resource(name = "scheduleLogService")
    private EgovOe1SmsScheduleLogUtil scheduleLogService; // 스케줄  서비스

    Logger log = Logger.getLogger(this.getClass()); // 로거

    String listenerType = "Global"; // 리스너 타입

    public void setListenerType(String listenerType) { // 리스너 타입
        this.listenerType = listenerType;
    }

    public String getName() { // 리스너 타입 getName
        return "EgovOe1SmsGlobalJobListener";
    }

    /**
     * JobListener jobExecutionVetoed 재정의
     * @param Trigger
     *        , JobExecutionContext
     * @return void
     * @exception Exception
     */
    public void jobExecutionVetoed(JobExecutionContext arg0) {
        // TODO Auto-generated method stub

    }

    /**
     * JobListener jobToBeExecuted 재정의
     * @param Trigger
     *        , JobExecutionContext
     * @return void
     * @exception Exception
     */
    public void jobToBeExecuted(JobExecutionContext arg0) {
        // TODO Auto-generated method stub
    }

    /**
     * JobListener jobWasExecuted 재정의
     * @param Trigger
     *        , JobExecutionContext
     * @return void
     * @exception Exception
     */
    public void jobWasExecuted(JobExecutionContext arg0,
            JobExecutionException arg1) {
        if (arg1 == null) {
            try {
                scheduleLogService
                    .scheduleBizLogger("[INFO]", arg0, "Job 실행완료");
            } catch (Exception e) {
                log.debug(e.getMessage());
            }

            // LogUtil.scheduleBizLogger("[INFO]",
            // arg0, "배치실행완료");
        } else {
            log.debug("arg0===>" + arg0.getJobDetail().getFullName());
            log.debug("arg1.getMessage()===>" + arg1.getMessage());
            // Job 클래스에서 JobExecutionException 발생 시
            try {
                scheduleLogService.scheduleBizLogger("[ERROR]", arg0, arg1
                    .getMessage());
            } catch (Exception e) {
                // TODO Auto-generated catch block
                log.debug(e.getMessage());
            }

        }

    }
}
