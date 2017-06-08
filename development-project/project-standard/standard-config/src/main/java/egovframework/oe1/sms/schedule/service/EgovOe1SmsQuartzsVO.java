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

public class EgovOe1SmsQuartzsVO {

    private String quartzPropertyNm; //quartzPropertyNm
    private String quartzPropKey; //quartzPropKey
    private String quartzPropValue; //quartzPropValue

    /**
     * quartzPropertyNm Getter 메소드
     * @return String
     */
    public String getQuartzPropertyNm() {
        return quartzPropertyNm;
    }

    /**
     * quartzPropertyNm setter 메소드
     * @return void
     */
    public void setQuartzPropertyNm(String quartzPropertyNm) {
        this.quartzPropertyNm = quartzPropertyNm;
    }

    /**
     * quartzPropKey Getter 메소드
     * @return String
     */
    public String getQuartzPropKey() {
        return quartzPropKey;
    }

    /**
     * quartzPropKey setter 메소드
     * @return void
     */
    public void setQuartzPropKey(String quartzPropKey) {
        this.quartzPropKey = quartzPropKey;
    }

    /**
     * quartzPropValue Getter 메소드
     * @return String
     */
    public String getQuartzPropValue() {
        return quartzPropValue;
    }

    /**
     * quartzPropValue setter 메소드
     * @return void
     */
    public void setQuartzPropValue(String quartzPropValue) {
        this.quartzPropValue = quartzPropValue;
    }

}
