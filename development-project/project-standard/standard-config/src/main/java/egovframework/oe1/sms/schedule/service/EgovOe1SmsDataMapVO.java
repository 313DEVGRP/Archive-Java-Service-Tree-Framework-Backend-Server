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
 * 스케줄 설정 중  DataMap 프로퍼티를 처리하기 위한 VO 클래스
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
public class EgovOe1SmsDataMapVO {

    private String dataMapPropertyNm; //dataMapPropertyNm
    private String dataMapKeyNm; //dataMapKeyNm
    private String dataMapKeyValue; //dataMapKeyValue
    private String dataMapRef; //dataMapRef

    /**
     * dataMapRef Getter 메소드
     * @return String
     */
    public String getDataMapRef() {
        return dataMapRef;
    }

    /**
     * dataMapRef setter 메소드
     * @return void
     */
    public void setDataMapRef(String dataMapRef) {
        this.dataMapRef = dataMapRef;
    }

    /**
     * dataMapPropertyNm Getter 메소드
     * @return String
     */
    public String getDataMapPropertyNm() {
        return dataMapPropertyNm;
    }

    /**
     * dataMapPropertyNm setter 메소드
     * @return void
     */
    public void setDataMapPropertyNm(String dataMapPropertyNm) {
        this.dataMapPropertyNm = dataMapPropertyNm;
    }

    /**
     * dataMapKeyNm Getter 메소드
     * @return String
     */
    public String getDataMapKeyNm() {
        return dataMapKeyNm;
    }

    /**
     * dataMapKeyNm setter 메소드
     * @return void
     */
    public void setDataMapKeyNm(String dataMapKeyNm) {
        this.dataMapKeyNm = dataMapKeyNm;
    }

    /**
     * dataMapKeyValue Getter 메소드
     * @return String
     */
    public String getDataMapKeyValue() {
        return dataMapKeyValue;
    }

    /**
     * dataMapKeyValue setter 메소드
     * @return void
     */
    public void setDataMapKeyValue(String dataMapKeyValue) {
        this.dataMapKeyValue = dataMapKeyValue;
    }

}
