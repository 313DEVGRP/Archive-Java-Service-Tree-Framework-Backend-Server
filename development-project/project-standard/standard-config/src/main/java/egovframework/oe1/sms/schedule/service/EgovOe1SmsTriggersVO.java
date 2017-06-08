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

/**
 * 스케줄링 서비스의 트리거 프로퍼티 정보를 위한 VO 클래스
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
public class EgovOe1SmsTriggersVO {

    private String triggerPropRef; // triggerPropRef

    /**
     * triggerPropRef Getter 메소드
     * @return String
     */
    public String getTriggerPropRef() {
        return triggerPropRef;
    }

    /**
     * triggerPropRef setter 메소드
     * @return void
     */
    public void setTriggerPropRef(String triggerPropRef) {
        this.triggerPropRef = triggerPropRef;
    }

}
