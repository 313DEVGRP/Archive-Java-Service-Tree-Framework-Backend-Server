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
package egovframework.oe1.sms.sample.service;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("SampleService3")
public class EgovOe1ScheduleSample3 {
	
    Logger log = Logger.getLogger(this.getClass());
    
	public void insertSmple(){
		log.debug("insertEmployee 실행 USING CRON TRIGGER");
	}
}
