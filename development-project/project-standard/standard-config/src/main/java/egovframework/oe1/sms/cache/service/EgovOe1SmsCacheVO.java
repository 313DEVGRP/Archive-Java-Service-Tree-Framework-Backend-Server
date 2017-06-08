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
package egovframework.oe1.sms.cache.service;

import egovframework.oe1.sms.com.service.EgovOe1SmsComDefaultVO;

/**
 * 캐시 설정 관리를 위한 VO 클래스
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
public class EgovOe1SmsCacheVO extends EgovOe1SmsComDefaultVO {

    private String beanNm; // 빈 명
    private String beanClassNm; // 빈 클래스 명
    private int beanCount; // 빈 갯수

    private String propertyNm; // 프로퍼티 명
    private String subPropertyNm; // 서브 프로퍼티 명
    private String subPropertyValue; // 서브 프로퍼티 값
    private String subBeanClassNm; // 서브 빈 클래스명

    private String serviceNm; // 서비스 명

    private int beanTotCount; // 빈 총 갯수

    /**
     * 빈 총갯수 Getter 메소드
     * @return int
     */
    public int getBeanTotCount() {
        return beanTotCount;
    }

    /**
     * 빈 총갯수setter 메소드
     * @return void
     */
    public void setBeanTotCount(int beanTotCount) {
        this.beanTotCount = beanTotCount;
    }

    /**
     * 프로퍼티 명 Getter 메소드
     * @return String
     */
    public String getSubPropertyValue() {
        return subPropertyValue;
    }

    /**
     * 프로퍼티 명 setter 메소드
     * @return void
     */
    public void setSubPropertyValue(String subPropertyValue) {
        this.subPropertyValue = subPropertyValue;
    }

    /**
     * 빈 명 Getter 메소드
     * @return String
     */
    public String getBeanNm() {
        return beanNm;
    }

    /**
     * 빈 명 setter 메소드
     * @return void
     */
    public void setBeanNm(String beanNm) {
        this.beanNm = beanNm;
    }

    /**
     * 빈 클래스 명 Getter 메소드
     * @return String
     */
    public String getBeanClassNm() {
        return beanClassNm;
    }

    /**
     * 빈 클래스 명 setter 메소드
     * @return void
     */
    public void setBeanClassNm(String beanClassNm) {
        this.beanClassNm = beanClassNm;
    }

    /**
     * 빈 갯수 Getter 메소드
     * @return int
     */
    public int getBeanCount() {
        return beanCount;
    }

    /**
     * 빈 갯수 setter 메소드
     * @return void
     */
    public void setBeanCount(int beanCount) {
        this.beanCount = beanCount;
    }

    /**
     * 프로퍼티명 Getter 메소드
     * @return String
     */
    public String getPropertyNm() {
        return propertyNm;
    }

    /**
     * 프로퍼티명 setter 메소드
     * @return void
     */
    public void setPropertyNm(String propertyNm) {
        this.propertyNm = propertyNm;
    }

    /**
     * 서브 프로퍼티명 Getter 메소드
     * @return String
     */
    public String getSubPropertyNm() {
        return subPropertyNm;
    }

    /**
     * 서브 프로퍼티명 setter 메소드
     * @return void
     */
    public void setSubPropertyNm(String subPropertyNm) {
        this.subPropertyNm = subPropertyNm;
    }

    /**
     * 서브 클래스 명 Getter 메소드
     * @return String
     */
    public String getSubBeanClassNm() {
        return subBeanClassNm;
    }

    /**
     * 서브 클래스 명 setter 메소드
     * @return void
     */
    public void setSubBeanClassNm(String subBeanClassNm) {
        this.subBeanClassNm = subBeanClassNm;
    }

    /**
     * 서비스 명 Getter 메소드
     * @return String
     */
    public String getServiceNm() {
        return serviceNm;
    }

    /**
     * 서비스 명 setter 메소드
     * @return void
     */
    public void setServiceNm(String serviceNm) {
        this.serviceNm = serviceNm;
    }

}
