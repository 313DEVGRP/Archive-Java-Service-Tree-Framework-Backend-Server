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
 * 설정관리를 위한 프로퍼티 정보 공통 VO 클래스
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
public class EgovOe1SmsComPropertyVO {
    private String propertyNm; // 프로퍼티 명
    private String propertyRef; // 프로퍼티 레퍼런스
    private String propertyValue; // 프로퍼티 값

    private ArrayList props; // 하위 props
    private ArrayList lists; // 하위 리스트

    private ArrayList quartzs;
    private ArrayList triggers;

    private ArrayList jobDataAsMaps;
    private ArrayList jobDataMaps;

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
     * 프로퍼티 레퍼런스 Getter 메소드
     * @return String
     */
    public String getPropertyRef() {
        return propertyRef;
    }

    /**
     * 프로퍼티 레퍼런스 setter 메소드
     * @return void
     */
    public void setPropertyRef(String propertyRef) {
        this.propertyRef = propertyRef;
    }

    /**
     * 프로퍼티 값 Getter 메소드
     * @return String
     */
    public String getPropertyValue() {
        return propertyValue;
    }

    /**
     * 프로퍼티 값 setter 메소드
     * @return void
     */
    public void setPropertyValue(String propertyValue) {
        this.propertyValue = propertyValue;
    }

    /**
     * 하위 props Getter 메소드
     * @return ArrayList
     */
    public ArrayList getProps() {
        return props;
    }

    /**
     * 하위 props setter 메소드
     * @return void
     */
    public void setProps(ArrayList props) {
        this.props = props;
    }

    /**
     * 하위 props Getter 메소드
     * @return Object
     */
    public Object getProp(int index) {
        return this.props.get(index);
    }

    /**
     * 하위 props setter 메소드
     * @return void
     */
    public void setProp(Object o) {
        if (this.props == null)
            this.props = new ArrayList();
        this.props.add(o);
    }

    /**
     * 하위 리스트 Getter 메소드
     * @return ArrayList
     */
    public ArrayList getLists() {
        return lists;
    }

    /**
     * 하위 리스트 setter 메소드
     * @return void
     */
    public void setLists(ArrayList lists) {
        this.lists = lists;
    }

    /**
     * 하위 리스트 Getter 메소드
     * @return Object
     */
    public Object getList(int index) {
        return this.lists.get(index);
    }

    /**
     * 하위 리스트 setter 메소드
     * @return void
     */
    public void setList(Object o) {
        if (this.lists == null)
            this.lists = new ArrayList();
        this.lists.add(o);
    }

    public ArrayList getQuartzs() {
        return quartzs;
    }

    public void setQuartzs(ArrayList quartzs) {
        this.quartzs = quartzs;
    }

    public Object getQuartz(int index) {
        return this.quartzs.get(index);
    }

    public void setQuartz(Object o) {
        if (this.quartzs == null)
            this.quartzs = new ArrayList();
        this.quartzs.add(o);
    }

    public ArrayList getTriggers() {
        return triggers;
    }

    public void setTriggers(ArrayList triggers) {
        this.triggers = triggers;
    }

    public Object getTrigger(int index) {
        return this.triggers.get(index);
    }

    public void setTrigger(Object o) {
        if (this.triggers == null)
            this.triggers = new ArrayList();
        this.triggers.add(o);
    }

    public ArrayList getJobDataAsMaps() {
        return jobDataAsMaps;
    }

    public void setJobDataAsMaps(ArrayList jobDataAsMaps) {
        this.jobDataAsMaps = jobDataAsMaps;
    }

    public Object getJobDataAsMap(int index) {
        return this.jobDataAsMaps.get(index);
    }

    public void setJobDataAsMap(Object o) {
        if (this.jobDataAsMaps == null)
            this.jobDataAsMaps = new ArrayList();
        this.jobDataAsMaps.add(o);
    }

    public ArrayList getJobDataMaps() {
        return jobDataMaps;
    }

    public void setJobDataMaps(ArrayList jobDataMaps) {
        this.jobDataMaps = jobDataMaps;
    }

    public Object getJobDataMap(int index) {
        return this.jobDataMaps.get(index);
    }

    public void setJobDataMap(Object o) {
        if (this.jobDataMaps == null)
            this.jobDataMaps = new ArrayList();
        this.jobDataMaps.add(o);
    }

}
