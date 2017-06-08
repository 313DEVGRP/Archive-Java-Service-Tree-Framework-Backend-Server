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

import org.apache.log4j.Logger;
import org.quartz.JobExecutionContext;
import org.quartz.Trigger;
import org.quartz.TriggerListener;

/**
 * 스케줄링 Job Trigger 리스너 클래스
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

public class EgovOe1SmsGlobalTriggerListener implements TriggerListener {
    Logger log = Logger.getLogger(this.getClass()); // 로거

    String listenerType = "Global"; //리스너 타입

    /**
     * 리스너 타입 정의 Setter
     * @param String
     * @return void
     * @exception Exception
     */
    public void setListenerType(String listenerType) {
        this.listenerType = listenerType;
    }

    /**
     * TriggerListener의 vetoJobExecution 재정의
     * @param Trigger
     *        , JobExecutionContext
     * @return void
     * @exception Exception
     */
    public void triggerFired(Trigger trigger, JobExecutionContext ctx) {
        log.debug("Description " + trigger.getDescription());
        log.debug("ireInstanc " + trigger.getFireInstanceId());
        log.debug("FullJobN " + trigger.getFullJobName());
        log.debug("getGroup " + trigger.getGroup());
        log.debug("getMisfireInstruction " + trigger.getMisfireInstruction());
        log.debug("getName " + trigger.getName());
        log.debug("getPriority " + trigger.getPriority());
        log.debug("getStartTime " + trigger.getStartTime());
        log.debug("getPreviousFireTime " + trigger.getPreviousFireTime());
        log.debug("getNextFireTime " + trigger.getNextFireTime());
        log.debug("EndTime " + trigger.getEndTime());

        log.debug("Scheduled " + trigger.getJobGroup() + " Fired!!");
        log.debug("Scheduled " + trigger.getJobName() + " Fired!!");
    }

    /**
     * TriggerListener의 vetoJobExecution 재정의
     * @param Trigger
     *        , JobExecutionContext
     * @return boolean
     * @exception Exception
     */
    public boolean vetoJobExecution(Trigger trigger, JobExecutionContext ctx) {
        log.debug("Scheduled " + trigger.getJobName() + " Executed!!");
        return false;
    }

    /**
     * TriggerListener의 triggerMisfired 재정의
     * @param Trigger
     * @return void
     * @exception Exception
     */
    public void triggerComplete(Trigger trigger, JobExecutionContext ctx,
            int arg) {
        log.debug("Scheduled " + trigger.getJobName() + " Completed!!");
    }

    /**
     * TriggerListener의 triggerMisfired 재정의
     * @param Trigger
     * @return void
     * @exception Exception
     */
    public void triggerMisfired(Trigger trigger) {

        log.debug("Description " + trigger.getDescription());
        log.debug("ireInstanc " + trigger.getFireInstanceId());
        log.debug("FullJobN " + trigger.getFullJobName());
        log.debug("getGroup " + trigger.getGroup());
        log.debug("getMisfireInstruction " + trigger.getMisfireInstruction());
        log.debug("getName " + trigger.getName());
        log.debug("getPriority " + trigger.getPriority());
        log.debug("getStartTime " + trigger.getStartTime());
        log.debug("getPreviousFireTime " + trigger.getPreviousFireTime());
        log.debug("getNextFireTime " + trigger.getNextFireTime());
        log.debug("EndTime " + trigger.getEndTime());
        log.debug("Scheduled " + trigger.getJobName() + " Misfired!!");
    }

    /**
     * 리스너 타입 정의 getter
     * @param
     * @return String
     * @exception Exception
     */
    public String getName() {
        return "EgovOe1SmsGlobalTriggerListener";
    }
}
