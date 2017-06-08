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
package egovframework.oe1.sms.property.service;

import java.util.ArrayList;

import egovframework.oe1.sms.com.service.EgovOe1SmsComDefaultVO;

/**
 * 프로퍼티 설정관리를 위한 VO 클래스
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
public class EgovOe1SmsPropertyVO extends EgovOe1SmsComDefaultVO {

    private String beanNm; // 빈 명
    private String beanClassNm; // 빈 클래스 명
    private String destroyMethodNm; // 디스트로이 메소드 명
    private String propertyNm; // 프로퍼티 명
    private int propertyCnt; // 프로퍼티 갯수
    private String serviceNm; // 서비스 명

    private String[] propEntryKey; // 프로퍼티 엔티티 키
    private String[] propEntryValue; // 프로퍼티 엔티티 값

    private String[] newPropEntryKey; // 신규 프로퍼티 엔티티 키
    private String[] newPropEntryValue; // 신규 프로퍼티 엔티티 

    private ArrayList entries; // 엔트리즈

    private String extGbn; //external 구분

    /**
     * extGbn Getter 메소드
     * @return String[]
     */
    public String getExtGbn() {
        return extGbn;
    }

    
    /**
     * extGbn 엔티티 값 setter 메소드
     * @return void
     */
    public void setExtGbn(String extGbn) {
        this.extGbn = extGbn;
    }

    /**
     * 프로퍼티 엔티티 키 값 Getter 메소드
     * @return String[]
     */
    public String[] getPropEntryKey() {
        return propEntryKey;
    }

    /**
     * 프로퍼티 엔티티 값 setter 메소드
     * @return void
     */
    public void setPropEntryKey(String[] propEntryKey) {
        this.propEntryKey = propEntryKey;
    }

    /**
     * 프로퍼티 엔티티 값 Getter 메소드
     * @return String[]
     */
    public String[] getPropEntryValue() {
        return propEntryValue;
    }

    /**
     * 프로퍼티 엔티티 값 setter 메소드
     * @return void
     */
    public void setPropEntryValue(String[] propEntryValue) {
        this.propEntryValue = propEntryValue;
    }

    /**
     * 신규 프로퍼티 엔트리 키 Getter 메소드
     * @return String[]
     */
    public String[] getNewPropEntryKey() {
        return newPropEntryKey;
    }

    /**
     * 신규 프로퍼티 엔트리 키 setter 메소드
     * @return void
     */
    public void setNewPropEntryKey(String[] newPropEntryKey) {
        this.newPropEntryKey = newPropEntryKey;
    }

    /**
     * 신규 프로퍼티 엔트리 값 Getter 메소드
     * @return String[]
     */
    public String[] getNewPropEntryValue() {
        return newPropEntryValue;
    }

    /**
     * 신규 프로퍼티 엔트리 값 setter 메소드
     * @return void
     */
    public void setNewPropEntryValue(String[] newPropEntryValue) {
        this.newPropEntryValue = newPropEntryValue;
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
     * 빈 클래스 명 값 Getter 메소드
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
     * 디스트로이 메소드 명 Getter 메소드
     * @return String
     */
    public String getDestroyMethodNm() {
        return destroyMethodNm;
    }

    /**
     * 디스트로이 메소드 명 setter 메소드
     * @return void
     */
    public void setDestroyMethodNm(String destroyMethodNm) {
        this.destroyMethodNm = destroyMethodNm;
    }

    /**
     * 프로퍼티 명 Getter 메소드
     * @return String
     */
    public String getPropertyNm() {
        return propertyNm;
    }

    /**
     * 프로퍼티 명 setter 메소드
     * @return void
     */
    public void setPropertyNm(String propertyNm) {
        this.propertyNm = propertyNm;
    }

    /**
     * 프로퍼티 갯수 Getter 메소드
     * @return String
     */
    public int getPropertyCnt() {
        return propertyCnt;
    }

    /**
     * 프로퍼티 갯수 setter 메소드
     * @return void
     */
    public void setPropertyCnt(int propertyCnt) {
        this.propertyCnt = propertyCnt;
    }

    /**
     * 엔트리즈 Getter 메소드
     * @return ArrayList
     */
    public ArrayList getEntries() {
        return entries;
    }

    /**
     * 엔트리즈 setter 메소드
     * @return void
     */
    public void setEntries(ArrayList entries) {
        this.entries = entries;
    }

    /**
     * 엔트리즈 Getter 메소드
     * @return Object
     */
    public Object getProperty(int index) {
        return this.entries.get(index);
    }

    /**
     * 엔트리즈 setter 메소드
     * @return void
     */
    public void setProperty(Object o) {
        if (this.entries == null)
            this.entries = new ArrayList();
        this.entries.add(o);
    }

}
