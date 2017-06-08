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
 * 스케줄 설정 중  DataAsMap 프로퍼티를 처리하기 위한 VO 클래스
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

public class EgovOe1SmsDataAsMapVO {

    private String dataAsMapPropertyNm; //dataAsMapPropertyNm
    private String dataAsMapKeyNm; //dataAsMapKeyNm
    private String dataAsMapKeyValue; //dataAsMapKeyValue
    private String dataAsMapRef; //dataAsMapRef

    
    /**
     * dataAsMapRef Getter 메소드
     * @return String
     */
    public String getDataAsMapRef() {
        return dataAsMapRef;
    }

    /**
     * dataAsMapRef setter 메소드
     * @return void
     */
    public void setDataAsMapRef(String dataAsMapRef) {
        this.dataAsMapRef = dataAsMapRef;
    }

    /**
     * dataAsMapPropertyNm Getter 메소드
     * @return String
     */
    public String getDataAsMapPropertyNm() {
        return dataAsMapPropertyNm;
    }

    /**
     * dataAsMapPropertyNm setter 메소드
     * @return void
     */
    public void setDataAsMapPropertyNm(String dataAsMapPropertyNm) {
        this.dataAsMapPropertyNm = dataAsMapPropertyNm;
    }

    /**
     * dataAsMapKeyNm Getter 메소드
     * @return String
     */
    public String getDataAsMapKeyNm() {
        return dataAsMapKeyNm;
    }

    /**
     * dataAsMapKeyNm setter 메소드
     * @return void
     */
    public void setDataAsMapKeyNm(String dataAsMapKeyNm) {
        this.dataAsMapKeyNm = dataAsMapKeyNm;
    }

    /**
     * dataAsMapKeyValue Getter 메소드
     * @return String
     */
    public String getDataAsMapKeyValue() {
        return dataAsMapKeyValue;
    }

    /**
     * dataAsMapKeyValue setter 메소드
     * @return void
     */
    public void setDataAsMapKeyValue(String dataAsMapKeyValue) {
        this.dataAsMapKeyValue = dataAsMapKeyValue;
    }

}
