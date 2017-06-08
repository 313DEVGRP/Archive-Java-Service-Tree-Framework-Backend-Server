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
package egovframework.oe1.sms.com.service;

import java.util.ArrayList;

/**
 * 설정관리를 위한 빈정보 공통 VO 클래스
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
public class EgovOe1SmsComBeanVO extends EgovOe1SmsComDefaultVO {

    private String beanNm; // 빈 명
    private String beanClassNm; // 빈 클래스 명
    private String destroyMethodNm; // 빈 디스트로이 메소드 명
    private int beanCount; // 빈 갯수

    private String subBeanNm; // 서브 빈 명
    private String subBeanClassNm; // 서비 빈 클래스 명

    private String[] propertyValue; // 프로퍼티 값
    private String[] propertyNm; // 프로퍼티 명
    private String[] propertyRef; // 프로퍼티 레퍼런스

    private String[] newPropertyNm; // 신규 프로퍼티 명
    private String[] newpropertyValue; // 신규 프로퍼티 값
    private String[] newpropertyRef; // 신규 프로퍼티 레퍼런스

    private String[] propskeyNm; // props 키 명
    private String[] propsKeyValue; // props 키 값

    private String[] refBeanNm; // 레퍼린스 빈 명

    private String serviceNm; // 서비스 명

    private ArrayList properties; // 프로퍼티즈

    // private String[] dataAsMapPropertyNm;
    private String[] dataAsMapKeyNm;
    private String[] dataAsMapKeyValue;
    private String[] dataAsMapRef;

    // private String[] dataMapPropertyNm;
    private String[] dataMapKeyNm;
    private String[] dataMapKeyValue;
    private String[] dataMapRef;

    private String[] triggerPropRef;

    private String[] quartzPropKey;
    private String[] quartzPropValue;

    private String oldBeanId;

    public String getOldBeanId() {
        return oldBeanId;
    }

    public void setOldBeanId(String oldBeanId) {
        this.oldBeanId = oldBeanId;
    }

    public String[] getTriggerPropRef() {
        return triggerPropRef;
    }

    public void setTriggerPropRef(String[] triggerPropRef) {
        this.triggerPropRef = triggerPropRef;
    }

    public String[] getQuartzPropKey() {
        return quartzPropKey;
    }

    public void setQuartzPropKey(String[] quartzPropKey) {
        this.quartzPropKey = quartzPropKey;
    }

    public String[] getQuartzPropValue() {
        return quartzPropValue;
    }

    public void setQuartzPropValue(String[] quartzPropValue) {
        this.quartzPropValue = quartzPropValue;
    }

    // public String[] getDataAsMapPropertyNm() {
    // return dataAsMapPropertyNm;
    // }
    //
    // public void setDataAsMapPropertyNm(String[]
    // dataAsMapPropertyNm) {
    // this.dataAsMapPropertyNm = dataAsMapPropertyNm;
    // }
    //
    // public String[] getDataMapPropertyNm() {
    // return dataMapPropertyNm;
    // }
    //
    // public void setDataMapPropertyNm(String[]
    // dataMapPropertyNm) {
    // this.dataMapPropertyNm = dataMapPropertyNm;
    // }

    public String[] getDataAsMapKeyNm() {
        return dataAsMapKeyNm;
    }

    public void setDataAsMapKeyNm(String[] dataAsMapKeyNm) {
        this.dataAsMapKeyNm = dataAsMapKeyNm;
    }

    public String[] getDataAsMapKeyValue() {
        return dataAsMapKeyValue;
    }

    public void setDataAsMapKeyValue(String[] dataAsMapKeyValue) {
        this.dataAsMapKeyValue = dataAsMapKeyValue;
    }

    public String[] getDataAsMapRef() {
        return dataAsMapRef;
    }

    public void setDataAsMapRef(String[] dataAsMapRef) {
        this.dataAsMapRef = dataAsMapRef;
    }

    public String[] getDataMapKeyNm() {
        return dataMapKeyNm;
    }

    public void setDataMapKeyNm(String[] dataMapKeyNm) {
        this.dataMapKeyNm = dataMapKeyNm;
    }

    public String[] getDataMapKeyValue() {
        return dataMapKeyValue;
    }

    public void setDataMapKeyValue(String[] dataMapKeyValue) {
        this.dataMapKeyValue = dataMapKeyValue;
    }

    public String[] getDataMapRef() {
        return dataMapRef;
    }

    public void setDataMapRef(String[] dataMapRef) {
        this.dataMapRef = dataMapRef;
    }

    /**
     * props 키 명 Getter 메소드
     * @return String[]
     */
    public String[] getPropskeyNm() {
        return propskeyNm;
    }

    /**
     * props 키 명 setter 메소드
     * @return void
     */
    public void setPropskeyNm(String[] propskeyNm) {
        this.propskeyNm = propskeyNm;
    }

    /**
     * props 키 값 Getter 메소드
     * @return String[]
     */
    public String[] getPropsKeyValue() {
        return propsKeyValue;
    }

    /**
     * props 키 값 Getter setter 메소드
     * @return void
     */
    public void setPropsKeyValue(String[] propsKeyValue) {
        this.propsKeyValue = propsKeyValue;
    }

    /**
     * 레퍼린스 빈 명 Getter 메소드
     * @return String[]
     */
    public String[] getRefBeanNm() {
        return refBeanNm;
    }

    /**
     * 레퍼린스 빈 명 setter 메소드
     * @return void
     */
    public void setRefBeanNm(String[] refBeanNm) {
        this.refBeanNm = refBeanNm;
    }

    /**
     * 신규 프로퍼티 명 Getter 메소드
     * @return String[]
     */
    public String[] getNewPropertyNm() {
        return newPropertyNm;
    }

    /**
     * 신규 프로퍼티 명 setter 메소드
     * @return void
     */
    public void setNewPropertyNm(String[] newPropertyNm) {
        this.newPropertyNm = newPropertyNm;
    }

    /**
     * 신규 프로퍼티 값 Getter 메소드
     * @return String[]
     */
    public String[] getNewpropertyValue() {
        return newpropertyValue;
    }

    /**
     * 신규 프로퍼티 값 setter 메소드
     * @return void
     */
    public void setNewpropertyValue(String[] newpropertyValue) {
        this.newpropertyValue = newpropertyValue;
    }

    /**
     * 신규 프로퍼티 레퍼런스 Getter 메소드
     * @return String[]
     */
    public String[] getNewpropertyRef() {
        return newpropertyRef;
    }

    /**
     * 신규 프로퍼티 레퍼런스 setter 메소드
     * @return void
     */
    public void setNewpropertyRef(String[] newpropertyRef) {
        this.newpropertyRef = newpropertyRef;
    }

    /**
     * 서브 빈 명 Getter 메소드
     * @return String
     */
    public String getSubBeanNm() {
        return subBeanNm;
    }

    /**
     * 서브 빈 명 setter 메소드
     * @return void
     */
    public void setSubBeanNm(String subBeanNm) {
        this.subBeanNm = subBeanNm;
    }

    /**
     * 서브 빈 클래스 명 Getter 메소드
     * @return String
     */
    public String getSubBeanClassNm() {
        return subBeanClassNm;
    }

    /**
     * 서브 빈 클래스 명 setter 메소드
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

    /**
     * 프로퍼티 값 Getter 메소드
     * @return String[]
     */
    public String[] getPropertyValue() {
        return propertyValue;
    }

    /**
     * 프로퍼티 값 setter 메소드
     * @return void
     */
    public void setPropertyValue(String[] propertyValue) {
        this.propertyValue = propertyValue;
    }

    /**
     * 프로퍼티 명 Getter 메소드
     * @return String
     */
    public String[] getPropertyNm() {
        return propertyNm;
    }

    /**
     * 프로퍼티 명 setter 메소드
     * @return void
     */
    public void setPropertyNm(String[] propertyNm) {
        this.propertyNm = propertyNm;
    }

    /**
     * 프로퍼티 레퍼런스 Getter 메소드
     * @return String
     */
    public String[] getPropertyRef() {
        return propertyRef;
    }

    /**
     * 프로퍼티 레퍼런스 setter 메소드
     * @return void
     */
    public void setPropertyRef(String[] propertyRef) {
        this.propertyRef = propertyRef;
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
     * 프로퍼티즈 Getter 메소드
     * @return ArrayList
     */
    public ArrayList getProperties() {
        return properties;
    }

    /**
     * 프로퍼티즈 setter 메소드
     * @return void
     */
    public void setProperties(ArrayList properties) {
        this.properties = properties;
    }

    /**
     * 프로퍼티 Getter 메소드
     * @return Object
     */
    public Object getProperty(int index) {
        return this.properties.get(index);
    }

    /**
     * 프로퍼티 setter 메소드
     * @return void
     */
    public void setProperty(Object o) {
        if (this.properties == null)
            this.properties = new ArrayList();
        this.properties.add(o);
    }

    /**
     * 빈 갯수 Getter 메소드
     * @return String
     */
    public int getBeanCount() {
        return beanCount;
    }

    /**
     * 빈 갯수 명 setter 메소드
     * @return void
     */
    public void setBeanCount(int beanCount) {
        this.beanCount = beanCount;
    }

}
