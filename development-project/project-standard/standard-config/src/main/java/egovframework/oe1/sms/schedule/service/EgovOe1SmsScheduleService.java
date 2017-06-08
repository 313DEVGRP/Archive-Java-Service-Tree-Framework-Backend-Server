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

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.Namespace;
import org.springframework.stereotype.Service;

import egovframework.oe1.sms.com.file.EgovOe1SmsConfigWriter;
import egovframework.oe1.sms.com.service.EgovOe1SmsComBeanVO;
import egovframework.oe1.sms.com.service.EgovOe1SmsComPropertyVO;

/**
 * 스케줄 설정관리를 위한 서비스 클래스
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

@Service("scheService")
public class EgovOe1SmsScheduleService {

    /** EgovOleSmsConfigWriter */
    @Resource(name = "configWriter")
    private EgovOe1SmsConfigWriter configWriter;

    /** Logger */
    Logger log = Logger.getLogger(this.getClass());

    /**
     * 스케줄 설정 목록 조회
     * @param EgovOe1SmsComBeanVO
     *        , Document ,Namespace
     * @return List
     * @exception Exception
     */
    public List selectScheduleServiceList(EgovOe1SmsComBeanVO beanVO,
            Document jdoc, Namespace schemaNamespace) throws Exception {
        List<EgovOe1SmsComBeanVO> list = new ArrayList<EgovOe1SmsComBeanVO>();

        if (jdoc != null) {
            // Change JDOM Tree cronExpression value
            Element beans_root = jdoc.getRootElement();
            List beans_element =
                beans_root.getChildren("bean", schemaNamespace);

            String searchCondition = beanVO.getSearchCondition(); // 0:class명
                                                                  // ,
            // 1:BeanID
            String searchKeyword = beanVO.getSearchKeyword();

            for (int i = 0; i < beans_element.size(); i++) {
                EgovOe1SmsComBeanVO bVo = new EgovOe1SmsComBeanVO();

                Element bean = (Element) beans_element.get(i);
                String id = bean.getAttributeValue("id");
                String classNm = bean.getAttributeValue("class");

                if (!"".equals(searchKeyword)) {
                    if (searchCondition.equals("0")) { // 0:class명
                        if (classNm.trim().contains(searchKeyword.trim())) {// 0:class명
                            // like
                            // 검색

                            bVo.setBeanNm(id);
                            bVo.setBeanClassNm(classNm);
                            bVo.setBeanCount(i + 1);

                            list.add(bVo);
                            // break;
                        } else if (classNm.trim().equals(searchKeyword.trim())) {

                            bVo.setBeanNm(id);
                            bVo.setBeanClassNm(classNm);
                            bVo.setBeanCount(i + 1);

                            list.add(bVo);
                            // break;
                        }
                    } else if (searchCondition.equals("1")) { //  

                        if (id.trim().contains(searchKeyword.trim())) { // 1:BeanID
                            // like 검색
                            bVo.setBeanNm(id);
                            bVo.setBeanClassNm(classNm);
                            bVo.setBeanCount(i + 1);

                            list.add(bVo);
                            // break;

                        } else if (id.trim().equals(searchKeyword.trim())) {
                            bVo.setBeanNm(id);
                            bVo.setBeanClassNm(classNm);
                            bVo.setBeanCount(i + 1);

                            list.add(bVo);
                            // break;
                        }
                    }

                } else {
                    bVo.setBeanNm(id);
                    bVo.setBeanClassNm(classNm);
                    bVo.setBeanCount(i + 1);

                    list.add(bVo);
                }

            }
        }

        return list;
    }

    /**
     * 스케줄 설정 상세 조회
     * @param EgovOe1SmsComBeanVO
     *        , Document ,Namespace
     * @return EgovOe1SmsComBeanVO
     * @exception Exception
     */
    /**
     * @param beanVO
     * @param jdoc
     * @param schemaNamespace
     * @return
     * @throws Exception
     */
    public EgovOe1SmsComBeanVO selectScheduleService(
            EgovOe1SmsComBeanVO beanVO, Document jdoc) throws Exception {

        Namespace schemaNamespace = null;

        schemaNamespace =
            Namespace.getNamespace("xsd",
                "http://www.springframework.org/schema/beans");

        // Change JDOM Tree cronExpression value
        Element beans_root = jdoc.getRootElement();
        List beans_element = beans_root.getChildren("bean", schemaNamespace);

        List<EgovOe1SmsComBeanVO> list = new ArrayList<EgovOe1SmsComBeanVO>();

        String searchBeanNm = beanVO.getBeanNm();
        String searchBeanClassNm = beanVO.getBeanClassNm();

        EgovOe1SmsComBeanVO bVo = new EgovOe1SmsComBeanVO();

        for (int i = 0; i < beans_element.size(); i++) {

            Element bean = (Element) beans_element.get(i);
            String id = bean.getAttributeValue("id");
            String classNm = bean.getAttributeValue("class");
            String destroy = bean.getAttributeValue("destroy-method");

            if (!"".equals(searchBeanNm)) {

                if (id.trim().equals(searchBeanNm.trim())) {
                    bVo.setBeanNm(id);
                    bVo.setBeanClassNm(classNm);
                    bVo.setDestroyMethodNm(destroy);

                    List propertys =
                        bean.getChildren("property", schemaNamespace);

                    if (searchBeanClassNm
                        .trim()
                        .equals(
                            "org.springframework.scheduling.quartz.SchedulerFactoryBean")) {
                        for (int p = 0; p < propertys.size(); p++) {
                            EgovOe1SmsComPropertyVO pVo =
                                new EgovOe1SmsComPropertyVO();

                            Element property = (Element) propertys.get(p);
                            String propName =
                                property.getAttributeValue("name");

                            pVo.setPropertyNm(propName);

                            Element props;
                            Element sub_list;

                            if (propName.equals("triggers")) {
                                sub_list =
                                    property.getChild("list", schemaNamespace);
                                List refList =
                                    sub_list
                                        .getChildren("ref", schemaNamespace);

                                for (int j = 0; j < refList.size(); j++) {
                                    EgovOe1SmsTriggersVO triggerVo =
                                        new EgovOe1SmsTriggersVO();
                                    Element listElement =
                                        (Element) refList.get(j);

                                    String listRef =
                                        listElement.getAttributeValue("bean");

                                    triggerVo.setTriggerPropRef(listRef);

                                    pVo.setTrigger(triggerVo);
                                }
                            } else if (propName.equals("quartzProperties")) {
                                props =
                                    property.getChild("props", schemaNamespace);
                                List propList =
                                    props.getChildren("prop", schemaNamespace);

                                for (int j = 0; j < propList.size(); j++) {
                                    EgovOe1SmsQuartzsVO quartzVo =
                                        new EgovOe1SmsQuartzsVO();
                                    Element propElement =
                                        (Element) propList.get(j);

                                    String propKey =
                                        propElement.getAttributeValue("key");
                                    String propValue = propElement.getText();

                                    quartzVo.setQuartzPropKey(propKey);
                                    quartzVo.setQuartzPropValue(propValue);

                                    pVo.setQuartz(quartzVo);
                                }
                            } else {
                                String propertyName =
                                    property.getAttributeValue("name");
                                String propValue =
                                    property.getAttributeValue("value");
                                String propRef =
                                    property.getAttributeValue("ref");
                                pVo.setPropertyNm(propertyName);
                                pVo.setPropertyValue(propValue);
                                pVo.setPropertyRef(propRef);
                            }

                            bVo.setProperty(pVo);
                        }
                        break;

                    } else if (searchBeanClassNm.trim().equals(
                        "org.springframework.scheduling.quartz.JobDetailBean")) {
                        for (int p = 0; p < propertys.size(); p++) {
                            EgovOe1SmsComPropertyVO pVo =
                                new EgovOe1SmsComPropertyVO();

                            Element property = (Element) propertys.get(p);
                            String propName =
                                property.getAttributeValue("name");

                            pVo.setPropertyNm(propName);

                            Element props;
                            Element sub_list;

                            if (propName.equals("jobDataAsMap")) {
                                sub_list =
                                    property.getChild("map", schemaNamespace);
                                List entryList =
                                    sub_list.getChildren("entry",
                                        schemaNamespace);

                                for (int j = 0; j < entryList.size(); j++) {
                                    EgovOe1SmsDataAsMapVO dataAsMap =
                                        new EgovOe1SmsDataAsMapVO();
                                    Element listElement =
                                        (Element) entryList.get(j);

                                    String listkey =
                                        listElement.getAttributeValue("key");
                                    String listvalue =
                                        listElement.getAttributeValue("value");
                                    String listref =
                                        listElement
                                            .getAttributeValue("value-ref");

                                    dataAsMap.setDataAsMapKeyNm(listkey);
                                    dataAsMap.setDataAsMapKeyValue(listvalue);
                                    dataAsMap.setDataAsMapRef(listref);

                                    pVo.setJobDataAsMap(dataAsMap);
                                }
                            } else if (propName.equals("jobDataMap")) {
                                sub_list =
                                    property.getChild("map", schemaNamespace);
                                List entryList =
                                    sub_list.getChildren("entry",
                                        schemaNamespace);

                                for (int j = 0; j < entryList.size(); j++) {
                                    EgovOe1SmsDataMapVO dataMap =
                                        new EgovOe1SmsDataMapVO();

                                    Element listElement =
                                        (Element) entryList.get(j);

                                    String listkey =
                                        listElement.getAttributeValue("key");
                                    String listvalue =
                                        listElement.getAttributeValue("value");
                                    String listref =
                                        listElement
                                            .getAttributeValue("value-ref");

                                    dataMap.setDataMapKeyNm(listkey);
                                    dataMap.setDataMapKeyValue(listvalue);
                                    dataMap.setDataMapRef(listref);

                                    pVo.setJobDataMap(dataMap);
                                }
                            } else {
                                String propertyName =
                                    property.getAttributeValue("name");
                                String propValue =
                                    property.getAttributeValue("value");
                                String propRef =
                                    property.getAttributeValue("ref");
                                pVo.setPropertyNm(propertyName);
                                pVo.setPropertyValue(propValue);
                                pVo.setPropertyRef(propRef);
                            }

                            bVo.setProperty(pVo);
                        }
                    } else {
                        for (int p = 0; p < propertys.size(); p++) {
                            EgovOe1SmsComPropertyVO pVo =
                                new EgovOe1SmsComPropertyVO();

                            Element property = (Element) propertys.get(p);
                            String propName =
                                property.getAttributeValue("name");
                            String propValue =
                                property.getAttributeValue("value");
                            String propRef = property.getAttributeValue("ref");

                            pVo.setPropertyNm(propName);
                            pVo.setPropertyValue(propValue);
                            pVo.setPropertyRef(propRef);

                            bVo.setProperty(pVo);
                        }
                        break;
                    }

                }

            }
        }
        return bVo;
    }

    /**
     * 스케줄 설정 수정
     * @param EgovOe1SmsComBeanVO
     *        , Document ,Namespace
     * @return void
     * @exception Exception
     */
    public void updateScheduleService(EgovOe1SmsComBeanVO beanVO, Document jdoc)
            throws Exception {

        Namespace schemaNamespace = null;
        schemaNamespace =
            Namespace.getNamespace("",
                "http://www.springframework.org/schema/beans");

        // Change JDOM Tree cronExpression value
        Element beans_root = jdoc.getRootElement();
        List beans_element = beans_root.getChildren("bean", schemaNamespace);

        String updateBeanNm = beanVO.getBeanNm();
        String updateClassNm = beanVO.getBeanClassNm();
        String updateDestoryMethodNm = beanVO.getDestroyMethodNm();

        /* Bean Delete */
        for (int i = 0; i < beans_element.size(); i++) {
            Element bean = (Element) beans_element.get(i);
            if (bean.getAttributeValue("id").trim().equals(updateBeanNm.trim())) {
                beans_element.remove(bean);
                break;
            }
        }

        /* Bean Create */
        Element newBean = new Element("bean", schemaNamespace);
        newBean.setAttribute("id", updateBeanNm);
        newBean.setAttribute("class", updateClassNm);

        if (!updateDestoryMethodNm.equals("")) {
            newBean.setAttribute("destroy-method", updateDestoryMethodNm);
        }
        beans_root.addContent(newBean);

        for (int i = 0; i < beans_element.size(); i++) {

            Element bean = (Element) beans_element.get(i);

            String id = bean.getAttributeValue("id");

            if (id.trim().equals(updateBeanNm.trim())) {
                if (updateClassNm
                    .trim()
                    .equals(
                        "org.springframework.scheduling.quartz.SchedulerFactoryBean")) {

                    if (beanVO.getQuartzPropKey() != null) {

                        Element newP = new Element("property", schemaNamespace);
                        newP.setAttribute("name", "quartzProperties");

                        bean.addContent(newP);

                        Element props = new Element("props", schemaNamespace);
                        newP.addContent(props);

                        for (int j = 0; j < beanVO.getQuartzPropKey().length; j++) {
                            Element prop = new Element("prop", schemaNamespace);
                            prop.setAttribute("key",
                                beanVO.getQuartzPropKey()[j]);
                            prop.setText(beanVO.getQuartzPropValue()[j]);

                            props.addContent(prop);
                        }
                    }

                    if (beanVO.getTriggerPropRef() != null) {

                        Element newP = new Element("property", schemaNamespace);
                        newP.setAttribute("name", "triggers");

                        bean.addContent(newP);

                        Element list = new Element("list", schemaNamespace);
                        newP.addContent(list);

                        for (int j = 0; j < beanVO.getTriggerPropRef().length; j++) {
                            Element ref = new Element("ref", schemaNamespace);
                            ref.setAttribute("bean",
                                beanVO.getTriggerPropRef()[j]);

                            list.addContent(ref);
                        }
                    }

                    for (int p = 0; p < beanVO.getPropertyNm().length; p++) {
                        Element newP = new Element("property", schemaNamespace);
                        newP.setAttribute("name", beanVO.getPropertyNm()[p]);

                        if (beanVO.getPropertyValue() != null
                            || beanVO.getPropertyRef() != null) {
                            if (beanVO.getPropertyValue() != null
                                && !beanVO.getPropertyValue()[p].equals("")) {
                                newP.setAttribute("value", beanVO
                                    .getPropertyValue()[p]);
                            } else if (beanVO.getPropertyRef() != null
                                && !beanVO.getPropertyRef()[p].equals("")) {
                                newP.setAttribute("ref", beanVO
                                    .getPropertyRef()[p]);
                            }
                        }
                        bean.addContent(newP);
                    }

                    break;

                } else if (updateClassNm.trim().equals(
                    "org.springframework.scheduling.quartz.JobDetailBean")) {

                    if (beanVO.getDataAsMapKeyNm() != null) {

                        Element newP = new Element("property", schemaNamespace);
                        newP.setAttribute("name", "jobDataAsMap");

                        bean.addContent(newP);

                        Element map = new Element("map", schemaNamespace);
                        newP.addContent(map);

                        if (beanVO.getDataAsMapKeyNm().length > 0) {

                            for (int j = 0; j < beanVO.getDataAsMapKeyNm().length; j++) {
                                if (!"".equals(beanVO.getDataAsMapKeyNm()[j])
                                    && beanVO.getDataAsMapKeyNm()[j] != null) {
                                    Element entry =
                                        new Element("entry", schemaNamespace);
                                    entry.setAttribute("key", beanVO
                                        .getDataAsMapKeyNm()[j]);
                                    entry.setAttribute("value", beanVO
                                        .getDataAsMapKeyValue()[j]);

                                    map.addContent(entry);
                                }
                            }

                        }

                    }

                    if (beanVO.getDataMapKeyNm() != null) {
                        Element newP = new Element("property", schemaNamespace);
                        newP.setAttribute("name", "jobDataMap");

                        bean.addContent(newP);

                        Element map = new Element("map", schemaNamespace);
                        newP.addContent(map);

                        if (beanVO.getDataMapKeyNm().length > 0) {

                            for (int j = 0; j < beanVO.getDataMapKeyNm().length; j++) {
                                if (!"".equals(beanVO.getDataMapKeyNm()[j])
                                    && beanVO.getDataMapKeyNm()[j] != null) {
                                    Element entry =
                                        new Element("entry", schemaNamespace);
                                    entry.setAttribute("key", beanVO
                                        .getDataMapKeyNm()[j]);
                                    entry.setAttribute("value", beanVO
                                        .getDataMapKeyValue()[j]);

                                    map.addContent(entry);
                                }
                            }

                        }
                    }

                    if (beanVO.getPropertyNm() != null) {
                        for (int p = 0; p < beanVO.getPropertyNm().length; p++) {
                            Element newP =
                                new Element("property", schemaNamespace);
                            newP
                                .setAttribute("name", beanVO.getPropertyNm()[p]);

                            if (!beanVO.getPropertyValue()[p].equals("")) {
                                newP.setAttribute("value", beanVO
                                    .getPropertyValue()[p]);
                            } else {
                                newP.setAttribute("ref", beanVO
                                    .getPropertyRef()[p]);
                            }

                            bean.addContent(newP);
                        }
                    }

                } else {
                    for (int p = 0; p < beanVO.getPropertyNm().length; p++) {
                        Element newP = new Element("property", schemaNamespace);
                        newP.setAttribute("name", beanVO.getPropertyNm()[p]);
                        if (!beanVO.getPropertyValue()[p].equals("")) {
                            newP.setAttribute("value", beanVO
                                .getPropertyValue()[p]);
                        } else {
                            newP
                                .setAttribute("ref", beanVO.getPropertyRef()[p]);
                        }

                        bean.addContent(newP);
                    }
                    break;
                }

            }
        }

        configWriter.writeConfigXml(jdoc, beanVO.getServiceNm());
    }

    /**
     * 스케줄 설정 미리보기
     * @param EgovOe1SmsComBeanVO
     *        , Document ,Namespace
     * @return String
     * @exception Exception
     */
    public String previewScheduleService(EgovOe1SmsComBeanVO beanVO,
            Document jdoc) throws Exception {

        Namespace schemaNamespace = null;
        schemaNamespace =
            Namespace.getNamespace("",
                "http://www.springframework.org/schema/beans");

        // Change JDOM Tree cronExpression value
        Element beans_root = jdoc.getRootElement();
        List beans_element = beans_root.getChildren("bean", schemaNamespace);

        String updateBeanNm = beanVO.getBeanNm();
        String updateClassNm = beanVO.getBeanClassNm();
        String updateDestoryMethodNm = beanVO.getDestroyMethodNm();
        HashMap jobDetail = new HashMap();
        /* Bean Delete */
        for (int i = 0; i < beans_element.size(); i++) {
            Element bean = (Element) beans_element.get(i);
            if (bean.getAttributeValue("id").trim().equals(updateBeanNm.trim())) {
                beans_element.remove(bean);
                break;
            }
        }

        /* Bean Create */
        Element newBean = new Element("bean", schemaNamespace);
        newBean.setAttribute("id", updateBeanNm);
        newBean.setAttribute("class", updateClassNm);
        if (!updateDestoryMethodNm.equals("")) {
            newBean.setAttribute("destroy-method", updateDestoryMethodNm);
        }
        beans_root.addContent(newBean);

        for (int i = 0; i < beans_element.size(); i++) {

            Element bean = (Element) beans_element.get(i);

            String id = bean.getAttributeValue("id");

            if (id.trim().equals(updateBeanNm.trim())) {

                if (updateClassNm
                    .trim()
                    .equals(
                        "org.springframework.scheduling.quartz.SchedulerFactoryBean")) {
                    if (beanVO.getQuartzPropKey() != null) {

                        Element newP = new Element("property", schemaNamespace);
                        newP.setAttribute("name", "quartzProperties");

                        bean.addContent(newP);

                        Element props = new Element("props", schemaNamespace);
                        newP.addContent(props);

                        for (int j = 0; j < beanVO.getQuartzPropKey().length; j++) {
                            Element prop = new Element("prop", schemaNamespace);
                            prop.setAttribute("key",
                                beanVO.getQuartzPropKey()[j]);
                            prop.setText(beanVO.getQuartzPropValue()[j]);

                            props.addContent(prop);
                        }
                    }

                    if (beanVO.getTriggerPropRef() != null) {

                        Element newP = new Element("property", schemaNamespace);
                        newP.setAttribute("name", "triggers");

                        bean.addContent(newP);

                        Element list = new Element("list", schemaNamespace);
                        newP.addContent(list);

                        for (int j = 0; j < beanVO.getTriggerPropRef().length; j++) {
                            Element ref = new Element("ref", schemaNamespace);
                            ref.setAttribute("bean",
                                beanVO.getTriggerPropRef()[j]);

                            list.addContent(ref);
                        }
                    }

                    if (beanVO.getPropertyNm() != null) {
                        for (int p = 0; p < beanVO.getPropertyNm().length; p++) {
                            Element newP =
                                new Element("property", schemaNamespace);
                            newP
                                .setAttribute("name", beanVO.getPropertyNm()[p]);

                            bean.addContent(newP);

                            if (beanVO.getPropertyValue() != null
                                || beanVO.getPropertyRef() != null) {
                                if (beanVO.getPropertyValue() != null
                                    && !beanVO.getPropertyValue()[p].equals("")) {
                                    newP.setAttribute("value", beanVO
                                        .getPropertyValue()[p]);
                                } else if (beanVO.getPropertyRef() != null
                                    && !beanVO.getPropertyRef()[p].equals("")) {
                                    newP.setAttribute("ref", beanVO
                                        .getPropertyRef()[p]);
                                }
                            }
                        }
                    }

                    break;
                } else if (updateClassNm.trim().equals(
                    "org.springframework.scheduling.quartz.JobDetailBean")) {
                    /*
                     * org.springframework.scheduling.quartz
                     * .JobDetailBean 의경우 Map 형태의 프로퍼티인
                     * JobDataAsMap , JobDataMap 을 두가지로
                     * 나누어 구현 Map 형태와 일반적인 프로퍼티 형태를 함께
                     * 구현하기 위하여 Map 형태의 경우 VO 에서 받은 값을
                     * Hash Map 형태로 변환하여 설정파일을 생성함
                     */

                    jobDetail = makeJobDetailHashMap(beanVO);

                    ArrayList jobDataAsMapKey = null;
                    ArrayList jobDataAsMapValue = null;
                    ArrayList jobDataAsMapRef = null;
                    ArrayList jobDataMapKey = null;
                    ArrayList jobDataMapValue = null;
                    ArrayList jobDataMapRef = null;

                    /*
                     * Map 형태의 데이터를 HashMap 형태로 만들어서 반환
                     */
                    if (jobDetail.get("jobDataAsMapKey") != null) {
                        jobDataAsMapKey =
                            (ArrayList) jobDetail.get("jobDataAsMapKey");
                    }
                    if (jobDetail.get("jobDataAsMapValue") != null) {
                        jobDataAsMapValue =
                            (ArrayList) jobDetail.get("jobDataAsMapValue");
                    }
                    if (jobDetail.get("jobDataAsMapRef") != null) {
                        jobDataAsMapRef =
                            (ArrayList) jobDetail.get("jobDataAsMapRef");
                    }
                    if (jobDetail.get("jobDataMapKey") != null) {
                        jobDataMapKey =
                            (ArrayList) jobDetail.get("jobDataMapKey");
                    }
                    if (jobDetail.get("jobDataMapValue") != null) {
                        jobDataMapValue =
                            (ArrayList) jobDetail.get("jobDataMapValue");
                    }
                    if (jobDetail.get("jobDataMapRef") != null) {
                        jobDataMapRef =
                            (ArrayList) jobDetail.get("jobDataMapRef");
                    }
                    // *******************************************************************************************

                    if (jobDataAsMapKey != null) { // JobDataAsMap
                                                   // 의
                                                   // 경우
                        Element newP = new Element("property", schemaNamespace);
                        newP.setAttribute("name", "jobDataAsMap");

                        newBean.addContent(newP);

                        Element map = new Element("map", schemaNamespace);
                        newP.addContent(map);

                        if (jobDataAsMapKey.size() > 0) {

                            for (int j = 0; j < jobDataAsMapKey.size(); j++) {

                                Element entry =
                                    new Element("entry", schemaNamespace);
                                entry.setAttribute("key",
                                    (String) jobDataAsMapKey.get(j));
                                
                                if(jobDataAsMapValue != null){
                                    if (jobDataAsMapValue.size() > 0) {
                                        if (!jobDataAsMapValue.get(j).equals("")) {
                                            entry.setAttribute("value",
                                                (String) jobDataAsMapValue.get(j));
                                        }
                                    }
                                }

                                if(jobDataAsMapRef != null){
                                    if (jobDataAsMapRef.size() > 0) {
                                        if (!jobDataAsMapRef.get(j).equals("")) {
                                            entry.setAttribute("value-ref",
                                                (String) jobDataAsMapRef.get(j));
                                        }
                                    }
                                }
                                map.addContent(entry);
                            }
                        }
                    }

                    if (jobDataMapKey != null) { // JobDataMap
                                                 // 의
                                                 // 경우
                        Element newP = new Element("property", schemaNamespace);
                        newP.setAttribute("name", "jobDataMap");

                        newBean.addContent(newP);

                        Element map = new Element("map", schemaNamespace);
                        newP.addContent(map);

                        if (jobDataMapKey.size() > 0) {

                            for (int j = 0; j < jobDataMapKey.size(); j++) {

                                Element entry =
                                    new Element("entry", schemaNamespace);
                                entry.setAttribute("key",
                                    (String) jobDataMapKey.get(j));
                                
                                if(jobDataMapValue != null){
                                    if (jobDataMapValue.size() > 0) {
                                        if (!jobDataMapValue.get(j).equals("")) {
                                            entry.setAttribute("value",
                                                (String) jobDataMapValue.get(j));
                                        }
                                    }
                                }

                                if(jobDataMapRef != null){
                                    if (jobDataMapRef.size() > 0) {
                                        if (!jobDataMapRef.get(j).equals("")) {
                                            entry.setAttribute("value-ref",
                                                (String) jobDataMapRef.get(j));
                                        }
                                    }
                                }

                                map.addContent(entry);
                            }
                        }
                    }

                    if (beanVO.getPropertyNm() != null) {
                        for (int p = 0; p < beanVO.getPropertyNm().length; p++) {

                            if (!beanVO.getPropertyNm()[p]
                                .equals("jobDataAsMap")
                                && !beanVO.getPropertyNm()[p]
                                    .equals("jobDataMap")) {
                                // Map 형태가 아닌일반 프로퍼티의
                                // 경우

                                if (!beanVO.getPropertyNm()[p].equals("")) {
                                    Element newP =
                                        new Element("property", schemaNamespace);
                                    newP.setAttribute("name", beanVO
                                        .getPropertyNm()[p]);

                                    newBean.addContent(newP);

                                    if (!beanVO.getPropertyValue()[p].equals("")) {
                                        newP.setAttribute("value", beanVO
                                            .getPropertyValue()[p]);
                                    } else if (!beanVO.getPropertyRef()[p].equals("")) {
                                        newP.setAttribute("ref", beanVO
                                            .getPropertyRef()[p]);
                                    }
                                }

                            }
                        }
                    }
                    break;

                } else {

                    if (beanVO.getPropertyNm() != null) {
                        for (int p = 0; p < beanVO.getPropertyNm().length; p++) {
                            Element newP =
                                new Element("property", schemaNamespace);
                            newP
                                .setAttribute("name", beanVO.getPropertyNm()[p]);
                            if (!beanVO.getPropertyValue()[p].equals("")) {
                                newP.setAttribute("value", beanVO
                                    .getPropertyValue()[p]);
                            } else {
                                newP.setAttribute("ref", beanVO
                                    .getPropertyRef()[p]);
                            }

                            bean.addContent(newP);
                        }
                    }
                    break;
                }

            }
        }

        return configWriter.previewConfigXml(jdoc);
    }

    /**
     * 스케줄 설정 미리보기
     * @param EgovOe1SmsComBeanVO
     *        , Document ,Namespace
     * @return String
     * @exception Exception
     */
    public String previewDetailScheduleService(EgovOe1SmsComBeanVO beanVO,
            Document jdoc) throws Exception {

        Namespace schemaNamespace = null;
        schemaNamespace =
            Namespace.getNamespace("",
                "http://www.springframework.org/schema/beans");

        // Change JDOM Tree cronExpression value
        Element beans_root = jdoc.getRootElement();
        List beans_element = beans_root.getChildren("bean", schemaNamespace);

        String updateBeanNm = beanVO.getBeanNm();
        String updateClassNm = beanVO.getBeanClassNm();
        String updateDestoryMethodNm = beanVO.getDestroyMethodNm();

        /* Bean Delete */
        for (int i = 0; i < beans_element.size(); i++) {
            Element bean = (Element) beans_element.get(i);
            if (bean.getAttributeValue("id").trim().equals(updateBeanNm.trim())) {
                beans_element.remove(bean);
                break;
            }
        }

        /* Bean Create */
        Element newBean = new Element("bean", schemaNamespace);
        newBean.setAttribute("id", updateBeanNm);
        newBean.setAttribute("class", updateClassNm);
        HashMap jobDetail = new HashMap();

        if (!updateDestoryMethodNm.equals("")) {
            newBean.setAttribute("destroy-method", updateDestoryMethodNm);
        }
        beans_root.addContent(newBean);

        for (int i = 0; i < beans_element.size(); i++) {
            Element bean = (Element) beans_element.get(i);

            String id = bean.getAttributeValue("id");

            if (id.trim().equals(updateBeanNm.trim())) {
                if (updateClassNm
                    .trim()
                    .equals(
                        "org.springframework.scheduling.quartz.SchedulerFactoryBean")) {

                    if (beanVO.getQuartzPropKey() != null) {

                        Element newP = new Element("property", schemaNamespace);
                        newP.setAttribute("name", "quartzProperties");

                        bean.addContent(newP);

                        Element props = new Element("props", schemaNamespace);
                        newP.addContent(props);

                        for (int j = 0; j < beanVO.getQuartzPropKey().length; j++) {
                            Element prop = new Element("prop", schemaNamespace);
                            prop.setAttribute("key",
                                beanVO.getQuartzPropKey()[j]);
                            prop.setText(beanVO.getQuartzPropValue()[j]);

                            props.addContent(prop);
                        }
                    }

                    if (beanVO.getTriggerPropRef() != null) {

                        Element newP = new Element("property", schemaNamespace);
                        newP.setAttribute("name", "triggers");

                        bean.addContent(newP);

                        Element list = new Element("list", schemaNamespace);
                        newP.addContent(list);

                        for (int j = 0; j < beanVO.getTriggerPropRef().length; j++) {
                            Element ref = new Element("ref", schemaNamespace);
                            ref.setAttribute("bean",
                                beanVO.getTriggerPropRef()[j]);

                            list.addContent(ref);
                        }
                    }

                    if (beanVO.getPropertyNm() != null) {
                        for (int p = 0; p < beanVO.getPropertyNm().length; p++) {
                            Element newP =
                                new Element("property", schemaNamespace);
                            newP
                                .setAttribute("name", beanVO.getPropertyNm()[p]);

                            bean.addContent(newP);

                            if (beanVO.getPropertyValue() != null
                                || beanVO.getPropertyRef() != null) {
                                if (beanVO.getPropertyValue() != null
                                    && !beanVO.getPropertyValue()[p].equals("")) {
                                    newP.setAttribute("value", beanVO
                                        .getPropertyValue()[p]);
                                } else if (beanVO.getPropertyRef() != null
                                    && !beanVO.getPropertyRef()[p].equals("")) {
                                    newP.setAttribute("ref", beanVO
                                        .getPropertyRef()[p]);
                                }
                            }
                        }
                    }
                    break;

                } else if (updateClassNm.trim().equals(
                    "org.springframework.scheduling.quartz.JobDetailBean")) {

                    /*
                     * org.springframework.scheduling.quartz
                     * .JobDetailBean 의경우 Map 형태의 프로퍼티인
                     * JobDataAsMap , JobDataMap 을 두가지로
                     * 나누어 구현 Map 형태와 일반적인 프로퍼티 형태를 함께
                     * 구현하기 위하여 Map 형태의 경우 VO 에서 받은 값을
                     * Hash Map 형태로 변환하여 설정파일을 생성함
                     */

                    jobDetail = makeJobDetailHashMap(beanVO);

                    ArrayList jobDataAsMapKey = null;
                    ArrayList jobDataAsMapValue = null;
                    ArrayList jobDataAsMapRef = null;
                    ArrayList jobDataMapKey = null;
                    ArrayList jobDataMapValue = null;
                    ArrayList jobDataMapRef = null;

                    /*
                     * Map 형태의 데이터를 HashMap 형태로 만들어서 반환
                     */
                    if (jobDetail.get("jobDataAsMapKey") != null) {
                        jobDataAsMapKey =
                            (ArrayList) jobDetail.get("jobDataAsMapKey");
                    }
                    if (jobDetail.get("jobDataAsMapValue") != null) {
                        jobDataAsMapValue =
                            (ArrayList) jobDetail.get("jobDataAsMapValue");
                    }
                    if (jobDetail.get("jobDataAsMapRef") != null) {
                        jobDataAsMapRef =
                            (ArrayList) jobDetail.get("jobDataAsMapRef");
                    }
                    if (jobDetail.get("jobDataMapKey") != null) {
                        jobDataMapKey =
                            (ArrayList) jobDetail.get("jobDataMapKey");
                    }
                    if (jobDetail.get("jobDataMapValue") != null) {
                        jobDataMapValue =
                            (ArrayList) jobDetail.get("jobDataMapValue");
                    }
                    if (jobDetail.get("jobDataMapRef") != null) {
                        jobDataMapRef =
                            (ArrayList) jobDetail.get("jobDataMapRef");
                    }
                    // *******************************************************************************************

                    if (jobDataAsMapKey != null) { // JobDataAsMap
                                                   // 의
                                                   // 경우
                        Element newP = new Element("property", schemaNamespace);
                        newP.setAttribute("name", "jobDataAsMap");

                        newBean.addContent(newP);

                        Element map = new Element("map", schemaNamespace);
                        newP.addContent(map);

                        if (jobDataAsMapKey.size() > 0) {

                            for (int j = 0; j < jobDataAsMapKey.size(); j++) {

                                Element entry =
                                    new Element("entry", schemaNamespace);
                                entry.setAttribute("key",
                                    (String) jobDataAsMapKey.get(j));
                                
                                if(jobDataAsMapValue != null){
                                    if (jobDataAsMapValue.size() > 0) {
                                        if (!jobDataAsMapValue.get(j).equals("")) {
                                            entry.setAttribute("value",
                                                (String) jobDataAsMapValue.get(j));
                                        }
                                    }
                                }

                                if(jobDataAsMapRef != null){
                                    if (jobDataAsMapRef.size() > 0) {
                                        if (!jobDataAsMapRef.get(j).equals("")) {
                                            entry.setAttribute("value-ref",
                                                (String) jobDataAsMapRef.get(j));
                                        }
                                    }
                                }
                                map.addContent(entry);
                            }
                        }
                    }

                    if (jobDataMapKey != null) { // JobDataMap
                                                 // 의
                                                 // 경우
                        Element newP = new Element("property", schemaNamespace);
                        newP.setAttribute("name", "jobDataMap");

                        newBean.addContent(newP);

                        Element map = new Element("map", schemaNamespace);
                        newP.addContent(map);

                        if (jobDataMapKey.size() > 0) {

                            for (int j = 0; j < jobDataMapKey.size(); j++) {

                                Element entry =
                                    new Element("entry", schemaNamespace);
                                entry.setAttribute("key",
                                    (String) jobDataMapKey.get(j));
                                
                                if(jobDataMapValue != null){
                                    if (jobDataMapValue.size() > 0) {
                                        if (!jobDataMapValue.get(j).equals("")) {
                                            entry.setAttribute("value",
                                                (String) jobDataMapValue.get(j));
                                        }
                                    }
                                }

                                if(jobDataMapRef != null){
                                    if (jobDataMapRef.size() > 0) {
                                        if (!jobDataMapRef.get(j).equals("")) {
                                            entry.setAttribute("value-ref",
                                                (String) jobDataMapRef.get(j));
                                        }
                                    }
                                }

                                map.addContent(entry);
                            }
                        }
                    }

                    for (int p = 0; p < beanVO.getPropertyNm().length; p++) {

                        if (!beanVO.getPropertyNm()[p].equals("jobDataAsMap")
                            && !beanVO.getPropertyNm()[p].equals("jobDataMap")) {
                            // Map 형태가 아닌일반 프로퍼티의 경우

                            if (!beanVO.getPropertyNm()[p].equals("")) {
                                Element newP =
                                    new Element("property", schemaNamespace);
                                newP.setAttribute("name", beanVO
                                    .getPropertyNm()[p]);

                                newBean.addContent(newP);

                                if (!beanVO.getPropertyValue()[p].equals("")) {
                                    newP.setAttribute("value", beanVO
                                        .getPropertyValue()[p]);
                                } else if (!beanVO.getPropertyRef()[p].equals("")) {
                                    newP.setAttribute("ref", beanVO
                                        .getPropertyRef()[p]);
                                }
                            }

                        }
                    }

                } else {
                    for (int p = 0; p < beanVO.getPropertyNm().length; p++) {
                        Element newP = new Element("property", schemaNamespace);
                        newP.setAttribute("name", beanVO.getPropertyNm()[p]);
                        if (!beanVO.getPropertyValue()[p].equals("")) {
                            newP.setAttribute("value", beanVO
                                .getPropertyValue()[p]);
                        } else {
                            newP
                                .setAttribute("ref", beanVO.getPropertyRef()[p]);
                        }

                        bean.addContent(newP);
                    }
                    break;
                }

            }
        }

        return configWriter.previewConfigXml(jdoc);
    }

    /**
     * 스케줄 설정 삭제
     * @param EgovOe1SmsComBeanVO
     *        , Document ,Namespace
     * @return void
     * @exception Exception
     */
    public void deleteServiceBean(EgovOe1SmsComBeanVO beanVO, Document jdoc)
            throws Exception {

        Namespace schemaNamespace = null;
        schemaNamespace =
            Namespace.getNamespace("xsd",
                "http://www.springframework.org/schema/beans");

        // Change JDOM Tree cronExpression value
        Element beans_root = jdoc.getRootElement();
        List beans_element = beans_root.getChildren("bean", schemaNamespace);
        String deleteNm = beanVO.getBeanNm();

        for (int i = 0; i < beans_element.size(); i++) {
            Element a = (Element) beans_element.get(i);

            if (a.getAttributeValue("id").trim().equals(deleteNm.trim())) {
                beans_element.remove(a);
                break;
            }

        }

        configWriter.writeConfigXml(jdoc, beanVO.getServiceNm());

    }

    /**
     * 신규 스케줄 서비스 설정 저장
     * @param EgovOe1SmsComBeanVO
     *        , Document ,Namespace
     * @return void
     * @exception Exception
     */
    public void addNewScheduleService(EgovOe1SmsComBeanVO beanVO, Document jdoc)
            throws Exception {

        Namespace schemaNamespace = null;
        schemaNamespace =
            Namespace.getNamespace("",
                "http://www.springframework.org/schema/beans");

        // Change JDOM Tree cronExpression value
        Element beans_root = jdoc.getRootElement();
        List beans_element = beans_root.getChildren("bean", schemaNamespace);

        String updateBeanNm = beanVO.getBeanNm();
        String updateClassNm = beanVO.getBeanClassNm();
        String updateDestoryMethodNm = beanVO.getDestroyMethodNm();
        HashMap jobDetail = new HashMap();

        /* Bean Create */
        Element newBean = new Element("bean", schemaNamespace);
        newBean.setAttribute("id", updateBeanNm);
        newBean.setAttribute("class", updateClassNm);
        if (!updateDestoryMethodNm.equals("")) {
            newBean.setAttribute("destroy-method", updateDestoryMethodNm);
        }
        beans_root.addContent(newBean);

        // 클래스 명이 스케줄러 팩토리의 경우
        if (updateClassNm.trim().equals(
            "org.springframework.scheduling.quartz.SchedulerFactoryBean")) {

            if (beanVO.getQuartzPropKey() != null) {

                Element newP = new Element("property", schemaNamespace);
                newP.setAttribute("name", "quartzProperties");

                newBean.addContent(newP);

                Element props = new Element("props", schemaNamespace);
                newP.addContent(props);

                for (int j = 0; j < beanVO.getQuartzPropKey().length; j++) {
                    Element prop = new Element("prop", schemaNamespace);
                    prop.setAttribute("key", beanVO.getQuartzPropKey()[j]);
                    prop.setText(beanVO.getQuartzPropValue()[j]);

                    props.addContent(prop);
                }
            }

            if (beanVO.getTriggerPropRef() != null) {

                Element newP = new Element("property", schemaNamespace);
                newP.setAttribute("name", "triggers");

                newBean.addContent(newP);

                Element list = new Element("list", schemaNamespace);
                newP.addContent(list);

                for (int j = 0; j < beanVO.getTriggerPropRef().length; j++) {
                    Element ref = new Element("ref", schemaNamespace);
                    ref.setAttribute("bean", beanVO.getTriggerPropRef()[j]);

                    list.addContent(ref);
                }
            }

            if (beanVO.getPropertyNm() != null) {
                for (int p = 0; p < beanVO.getPropertyNm().length; p++) {

                    if (!beanVO.getPropertyNm()[p].equals("quartzProperties")
                        && !beanVO.getPropertyNm()[p].equals("triggers")) {
                        Element newP = new Element("property", schemaNamespace);
                        newP.setAttribute("name", beanVO.getPropertyNm()[p]);

                        newBean.addContent(newP);

                        if (beanVO.getPropertyValue() != null
                            || beanVO.getPropertyRef() != null) {
                            if (beanVO.getPropertyValue() != null
                                && !beanVO.getPropertyValue()[p].equals("")) {
                                newP.setAttribute("value", beanVO
                                    .getPropertyValue()[p]);
                            } else if (beanVO.getPropertyRef() != null
                                && !beanVO.getPropertyRef()[p].equals("")) {
                                newP.setAttribute("ref", beanVO
                                    .getPropertyRef()[p]);
                            }
                        }
                    }
                }
            }

        } else if (updateClassNm.trim().equals(
            "org.springframework.scheduling.quartz.JobDetailBean")) {

            /*
             * org.springframework.scheduling.quartz.JobDetailBean
             * 의경우 Map 형태의 프로퍼티인 JobDataAsMap ,
             * JobDataMap 을 두가지로 나누어 구현 Map 형태와 일반적인
             * 프로퍼티 형태를 함께 구현하기 위하여 Map 형태의 경우 VO 에서 받은
             * 값을 Hash Map 형태로 변환하여 설정파일을 생성함
             */

            jobDetail = makeJobDetailHashMap(beanVO);

            ArrayList jobDataAsMapKey = null;
            ArrayList jobDataAsMapValue = null;
            ArrayList jobDataAsMapRef = null;
            ArrayList jobDataMapKey = null;
            ArrayList jobDataMapValue = null;
            ArrayList jobDataMapRef = null;

            /*
             * Map 형태의 데이터를 HashMap 형태로 만들어서 반환
             */
            if (jobDetail.get("jobDataAsMapKey") != null) {
                jobDataAsMapKey = (ArrayList) jobDetail.get("jobDataAsMapKey");
            }
            if (jobDetail.get("jobDataAsMapValue") != null) {
                jobDataAsMapValue =
                    (ArrayList) jobDetail.get("jobDataAsMapValue");
            }
            if (jobDetail.get("jobDataAsMapRef") != null) {
                jobDataAsMapRef = (ArrayList) jobDetail.get("jobDataAsMapRef");
            }
            if (jobDetail.get("jobDataMapKey") != null) {
                jobDataMapKey = (ArrayList) jobDetail.get("jobDataMapKey");
            }
            if (jobDetail.get("jobDataMapValue") != null) {
                jobDataMapValue = (ArrayList) jobDetail.get("jobDataMapValue");
            }
            if (jobDetail.get("jobDataMapRef") != null) {
                jobDataMapRef = (ArrayList) jobDetail.get("jobDataMapRef");
            }
            // *******************************************************************************************

            if (jobDataAsMapKey != null) { // JobDataAsMap
                                           // 의 경우
                Element newP = new Element("property", schemaNamespace);
                newP.setAttribute("name", "jobDataAsMap");

                newBean.addContent(newP);

                Element map = new Element("map", schemaNamespace);
                newP.addContent(map);

                if (jobDataAsMapKey.size() > 0) {

                    for (int j = 0; j < jobDataAsMapKey.size(); j++) {

                        Element entry = new Element("entry", schemaNamespace);
                        entry.setAttribute("key", (String) jobDataAsMapKey
                            .get(j));
                        
                        if(jobDataAsMapValue != null){
                            if (jobDataAsMapValue.size() > 0) {
                                if (!jobDataAsMapValue.get(j).equals("")) {
                                    entry.setAttribute("value",
                                        (String) jobDataAsMapValue.get(j));
                                }
                            }
                        }

                        if(jobDataAsMapRef != null){
                            if (jobDataAsMapRef.size() > 0) {
                                if (!jobDataAsMapRef.get(j).equals("")) {
                                    entry.setAttribute("value-ref",
                                        (String) jobDataAsMapRef.get(j));
                                }
                            }
                        }
                        map.addContent(entry);
                    }
                }
            }

            if (jobDataMapKey != null) { // JobDataMap
                                         // 의 경우
                Element newP = new Element("property", schemaNamespace);
                newP.setAttribute("name", "jobDataMap");

                newBean.addContent(newP);

                Element map = new Element("map", schemaNamespace);
                newP.addContent(map);

                if (jobDataMapKey.size() > 0) {

                    for (int j = 0; j < jobDataMapKey.size(); j++) {

                        Element entry = new Element("entry", schemaNamespace);
                        entry
                            .setAttribute("key", (String) jobDataMapKey.get(j));
                        
                        if(jobDataMapValue != null){
                            if (jobDataMapValue.size() > 0) {
                                if (!jobDataMapValue.get(j).equals("")) {
                                    entry.setAttribute("value",
                                        (String) jobDataMapValue.get(j));
                                }
                            }
                        }

                        if(jobDataMapRef != null){
                            if (jobDataMapRef.size() > 0) {
                                if (!jobDataMapRef.get(j).equals("")) {
                                    entry.setAttribute("value-ref",
                                        (String) jobDataMapRef.get(j));
                                }
                            }
                        }

                        map.addContent(entry);
                    }
                }
            }

            if (beanVO.getPropertyNm() != null) {
                for (int p = 0; p < beanVO.getPropertyNm().length; p++) {

                    if (!beanVO.getPropertyNm()[p].equals("jobDataAsMap")
                        && !beanVO.getPropertyNm()[p].equals("jobDataMap")) {
                        // Map 형태가 아닌일반 프로퍼티의 경우

                        if (!beanVO.getPropertyNm()[p].equals("")) {
                            Element newP =
                                new Element("property", schemaNamespace);
                            newP
                                .setAttribute("name", beanVO.getPropertyNm()[p]);

                            newBean.addContent(newP);

                            if (!beanVO.getPropertyValue()[p].equals("")) {
                                newP.setAttribute("value", beanVO
                                    .getPropertyValue()[p]);
                            } else if (!beanVO.getPropertyRef()[p].equals("")) {
                                newP.setAttribute("ref", beanVO
                                    .getPropertyRef()[p]);
                            }
                        }

                    }
                }
            }

        } else {
            for (int p = 0; p < beanVO.getPropertyNm().length; p++) {
                Element newP = new Element("property", schemaNamespace);
                newP.setAttribute("name", beanVO.getPropertyNm()[p]);
                if (!beanVO.getPropertyValue()[p].equals("")) {
                    newP.setAttribute("value", beanVO.getPropertyValue()[p]);
                } else {
                    newP.setAttribute("ref", beanVO.getPropertyRef()[p]);
                }

                newBean.addContent(newP);
            }
        }

        configWriter.writeConfigXml(jdoc, beanVO.getServiceNm());
    }

    /**
     * 신규 스케줄 서비스 미리보기(신규파일 생성)
     * @param EgovOe1SmsComBeanVO
     *        , Document ,Namespace
     * @return void
     * @exception Exception
     */
    public String previewNewScheduleService(EgovOe1SmsComBeanVO beanVO)
            throws Exception {

        Namespace schemaNamespace = null;
        Document jdoc = null;
        schemaNamespace =
            Namespace.getNamespace("",
                "http://www.springframework.org/schema/beans");

        Element rootElement =
            new Element("beans", Namespace.getNamespace("",
                "http://www.springframework.org/schema/beans"));
        jdoc = new Document(rootElement);

        String insertBeanNm = beanVO.getBeanNm();
        String insertClassNm = beanVO.getBeanClassNm();
        String insertDestoryMethodNm = beanVO.getDestroyMethodNm();
        String[] insertPropertyNm = beanVO.getPropertyNm();
        String[] insertPropertyValue = beanVO.getPropertyValue();
        String[] insertPropertyRef = beanVO.getPropertyRef();
        String[] insertPropsKeyNm = beanVO.getPropskeyNm();
        String[] insertPropekeyValue = beanVO.getPropsKeyValue();
        String[] inserRefBeanNm = beanVO.getRefBeanNm();
        HashMap jobDetail = new HashMap();

        Element beanElement = new Element("bean", schemaNamespace);

        beanElement.setAttribute("id", insertBeanNm);
        beanElement.setAttribute("class", insertClassNm);
        if (!insertDestoryMethodNm.equals("")) {
            beanElement.setAttribute("destroy-method", insertDestoryMethodNm);
        }

        rootElement.addContent(beanElement);
        rootElement.addNamespaceDeclaration(Namespace.getNamespace("xsi",
            "http://www.w3.org/2001/XMLSchema-instance"));
        rootElement
            .addNamespaceDeclaration(Namespace
                .getNamespace(
                    "schemaLocation",
                    "http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-2.5.xsd"));

        if (insertClassNm.trim().equals(
            "org.springframework.scheduling.quartz.SchedulerFactoryBean")) {

            if (beanVO.getQuartzPropKey() != null) {

                Element newP = new Element("property", schemaNamespace);
                newP.setAttribute("name", "quartzProperties");

                beanElement.addContent(newP);

                Element props = new Element("props", schemaNamespace);
                newP.addContent(props);

                for (int j = 0; j < beanVO.getQuartzPropKey().length; j++) {
                    Element prop = new Element("prop", schemaNamespace);
                    prop.setAttribute("key", beanVO.getQuartzPropKey()[j]);
                    prop.setText(beanVO.getQuartzPropValue()[j]);

                    props.addContent(prop);
                }
            }

            if (beanVO.getTriggerPropRef() != null) {

                Element newP = new Element("property", schemaNamespace);
                newP.setAttribute("name", "triggers");

                beanElement.addContent(newP);

                Element list = new Element("list", schemaNamespace);
                newP.addContent(list);

                for (int j = 0; j < beanVO.getTriggerPropRef().length; j++) {
                    Element ref = new Element("ref", schemaNamespace);
                    ref.setAttribute("bean", beanVO.getTriggerPropRef()[j]);

                    list.addContent(ref);
                }
            }

            for (int p = 0; p < beanVO.getPropertyNm().length; p++) {

                if (!beanVO.getPropertyNm()[p].equals("quartzProperties")
                    && !beanVO.getPropertyNm()[p].equals("triggers")) {
                    Element newP = new Element("property", schemaNamespace);
                    newP.setAttribute("name", beanVO.getPropertyNm()[p]);

                    beanElement.addContent(newP);

                    if (beanVO.getPropertyValue() != null
                        || beanVO.getPropertyRef() != null) {
                        if (beanVO.getPropertyValue() != null
                            && !beanVO.getPropertyValue()[p].equals("")) {
                            newP.setAttribute("value", beanVO
                                .getPropertyValue()[p]);
                        } else if (beanVO.getPropertyRef() != null
                            && !beanVO.getPropertyRef()[p].equals("")) {
                            newP
                                .setAttribute("ref", beanVO.getPropertyRef()[p]);
                        }
                    }
                }
            }

        } else if (insertClassNm.trim().equals(
            "org.springframework.scheduling.quartz.JobDetailBean")) {
            /*
             * org.springframework.scheduling.quartz.JobDetailBean
             * 의경우 Map 형태의 프로퍼티인 JobDataAsMap ,
             * JobDataMap 을 두가지로 나누어 구현 Map 형태와 일반적인
             * 프로퍼티 형태를 함께 구현하기 위하여 Map 형태의 경우 VO 에서 받은
             * 값을 Hash Map 형태로 변환하여 설정파일을 생성함
             */

            jobDetail = makeJobDetailHashMap(beanVO);

            ArrayList jobDataAsMapKey = null;
            ArrayList jobDataAsMapValue = null;
            ArrayList jobDataAsMapRef = null;
            ArrayList jobDataMapKey = null;
            ArrayList jobDataMapValue = null;
            ArrayList jobDataMapRef = null;

            /*
             * Map 형태의 데이터를 HashMap 형태로 만들어서 반환
             */
            if (jobDetail.get("jobDataAsMapKey") != null) {
                jobDataAsMapKey = (ArrayList) jobDetail.get("jobDataAsMapKey");
            }
            if (jobDetail.get("jobDataAsMapValue") != null) {
                jobDataAsMapValue =
                    (ArrayList) jobDetail.get("jobDataAsMapValue");
            }
            if (jobDetail.get("jobDataAsMapRef") != null) {
                jobDataAsMapRef = (ArrayList) jobDetail.get("jobDataAsMapRef");
            }
            if (jobDetail.get("jobDataMapKey") != null) {
                jobDataMapKey = (ArrayList) jobDetail.get("jobDataMapKey");
            }
            if (jobDetail.get("jobDataMapValue") != null) {
                jobDataMapValue = (ArrayList) jobDetail.get("jobDataMapValue");
            }
            if (jobDetail.get("jobDataMapRef") != null) {
                jobDataMapRef = (ArrayList) jobDetail.get("jobDataMapRef");
            }
            // *******************************************************************************************

            if (jobDataAsMapKey != null) { // JobDataAsMap
                                           // 의 경우
                Element newP = new Element("property", schemaNamespace);
                newP.setAttribute("name", "jobDataAsMap");

                beanElement.addContent(newP);

                Element map = new Element("map", schemaNamespace);
                newP.addContent(map);

                if (jobDataAsMapKey.size() > 0) {

                    for (int j = 0; j < jobDataAsMapKey.size(); j++) {

                        Element entry = new Element("entry", schemaNamespace);
                        entry.setAttribute("key", (String) jobDataAsMapKey
                            .get(j));
                        
                        if(jobDataAsMapValue != null){
                            if (jobDataAsMapValue.size() > 0) {
                                if (!jobDataAsMapValue.get(j).equals("")) {
                                    entry.setAttribute("value",
                                        (String) jobDataAsMapValue.get(j));
                                }
                            }
                        }

                        if(jobDataAsMapRef != null){
                            if (jobDataAsMapRef.size() > 0) {
                                if (!jobDataAsMapRef.get(j).equals("")) {
                                    entry.setAttribute("value-ref",
                                        (String) jobDataAsMapRef.get(j));
                                }
                            }
                        }
                        map.addContent(entry);
                    }
                }
            }

            if (jobDataMapKey != null) { // JobDataMap
                                         // 의 경우
                Element newP = new Element("property", schemaNamespace);
                newP.setAttribute("name", "jobDataMap");

                beanElement.addContent(newP);

                Element map = new Element("map", schemaNamespace);
                newP.addContent(map);

                if (jobDataMapKey.size() > 0) {

                    for (int j = 0; j < jobDataMapKey.size(); j++) {

                        Element entry = new Element("entry", schemaNamespace);
                        entry
                            .setAttribute("key", (String) jobDataMapKey.get(j));
                        
                        if(jobDataMapValue != null){
                            if (jobDataMapValue.size() > 0) {
                                if (!jobDataMapValue.get(j).equals("")) {
                                    entry.setAttribute("value",
                                        (String) jobDataMapValue.get(j));
                                }
                            }
                        }

                        if(jobDataMapRef != null){
                            if (jobDataMapRef.size() > 0) {
                                if (!jobDataMapRef.get(j).equals("")) {
                                    entry.setAttribute("value-ref",
                                        (String) jobDataMapRef.get(j));
                                }
                            }
                        }

                        map.addContent(entry);
                    }
                }
            }

            if (beanVO.getPropertyNm() != null) {
                for (int p = 0; p < beanVO.getPropertyNm().length; p++) {

                    if (!beanVO.getPropertyNm()[p].equals("jobDataAsMap")
                        && !beanVO.getPropertyNm()[p].equals("jobDataMap")) {
                        // Map 형태가 아닌일반 프로퍼티의 경우

                        if (!beanVO.getPropertyNm()[p].equals("")) {
                            Element newP =
                                new Element("property", schemaNamespace);
                            newP
                                .setAttribute("name", beanVO.getPropertyNm()[p]);

                            beanElement.addContent(newP);

                            if (!beanVO.getPropertyValue()[p].equals("")) {
                                newP.setAttribute("value", beanVO
                                    .getPropertyValue()[p]);
                            } else if (!beanVO.getPropertyRef()[p].equals("")) {
                                newP.setAttribute("ref", beanVO
                                    .getPropertyRef()[p]);
                            }
                        }

                    }
                }
            }

        } else {
            for (int p = 0; p < beanVO.getPropertyNm().length; p++) {
                Element newP = new Element("property", schemaNamespace);
                newP.setAttribute("name", beanVO.getPropertyNm()[p]);
                if (!beanVO.getPropertyValue()[p].equals("")) {
                    newP.setAttribute("value", beanVO.getPropertyValue()[p]);
                } else {
                    newP.setAttribute("ref", beanVO.getPropertyRef()[p]);
                }

                beanElement.addContent(newP);
            }
        }

        return configWriter.previewConfigXml(jdoc);
    }

    /**
     * 신규 스케줄 설정 빈 등록
     * @param EgovOe1SmsComBeanVO
     *        , Document ,Namespace
     * @return void
     * @exception Exception
     */
    public void insertNewSchedule(EgovOe1SmsComBeanVO beanVO) throws Exception {

        Namespace schemaNamespace = null;
        Document jdoc = null;
        schemaNamespace =
            Namespace.getNamespace("",
                "http://www.springframework.org/schema/beans");

        Element rootElement =
            new Element("beans", Namespace.getNamespace("",
                "http://www.springframework.org/schema/beans"));
        jdoc = new Document(rootElement);

        String insertBeanNm = beanVO.getBeanNm();
        String insertClassNm = beanVO.getBeanClassNm();
        String insertDestoryMethodNm = beanVO.getDestroyMethodNm();
        String[] insertPropertyNm = beanVO.getPropertyNm();
        String[] insertPropertyValue = beanVO.getPropertyValue();
        String[] insertPropertyRef = beanVO.getPropertyRef();
        String[] insertPropsKeyNm = beanVO.getPropskeyNm();
        String[] insertPropekeyValue = beanVO.getPropsKeyValue();
        String[] inserRefBeanNm = beanVO.getRefBeanNm();
        HashMap jobDetail = new HashMap();

        Element beanElement = new Element("bean", schemaNamespace);

        beanElement.setAttribute("id", insertBeanNm);
        beanElement.setAttribute("class", insertClassNm);
        if (!insertDestoryMethodNm.equals("")) {
            beanElement.setAttribute("destroy-method", insertDestoryMethodNm);
        }

        rootElement.addContent(beanElement);
        rootElement.addNamespaceDeclaration(Namespace.getNamespace("xsi",
            "http://www.w3.org/2001/XMLSchema-instance"));
        rootElement
            .addNamespaceDeclaration(Namespace
                .getNamespace(
                    "schemaLocation",
                    "http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-2.5.xsd"));

        if (insertClassNm.trim().equals(
            "org.springframework.scheduling.quartz.SchedulerFactoryBean")) {

            if (beanVO.getQuartzPropKey() != null) {

                Element newP = new Element("property", schemaNamespace);
                newP.setAttribute("name", "quartzProperties");

                beanElement.addContent(newP);

                Element props = new Element("props", schemaNamespace);
                newP.addContent(props);

                for (int j = 0; j < beanVO.getQuartzPropKey().length; j++) {
                    Element prop = new Element("prop", schemaNamespace);
                    prop.setAttribute("key", beanVO.getQuartzPropKey()[j]);
                    prop.setText(beanVO.getQuartzPropValue()[j]);

                    props.addContent(prop);
                }
            }

            if (beanVO.getTriggerPropRef() != null) {

                Element newP = new Element("property", schemaNamespace);
                newP.setAttribute("name", "triggers");

                beanElement.addContent(newP);

                Element list = new Element("list", schemaNamespace);
                newP.addContent(list);

                for (int j = 0; j < beanVO.getTriggerPropRef().length; j++) {
                    Element ref = new Element("ref", schemaNamespace);
                    ref.setAttribute("bean", beanVO.getTriggerPropRef()[j]);

                    list.addContent(ref);
                }
            }

            if (beanVO.getPropertyNm() != null) {
                for (int p = 0; p < beanVO.getPropertyNm().length; p++) {

                    if (!beanVO.getPropertyNm()[p].equals("quartzProperties")
                        && !beanVO.getPropertyNm()[p].equals("triggers")) {
                        Element newP = new Element("property", schemaNamespace);
                        newP.setAttribute("name", beanVO.getPropertyNm()[p]);

                        beanElement.addContent(newP);

                        if (beanVO.getPropertyValue() != null
                            || beanVO.getPropertyRef() != null) {
                            if (beanVO.getPropertyValue() != null
                                && !beanVO.getPropertyValue()[p].equals("")) {
                                newP.setAttribute("value", beanVO
                                    .getPropertyValue()[p]);
                            } else if (beanVO.getPropertyRef() != null
                                && !beanVO.getPropertyRef()[p].equals("")) {
                                newP.setAttribute("ref", beanVO
                                    .getPropertyRef()[p]);
                            }
                        }
                    }
                }
            }

        } else if (insertClassNm.trim().equals(
            "org.springframework.scheduling.quartz.JobDetailBean")) {
            /*
             * org.springframework.scheduling.quartz.JobDetailBean
             * 의경우 Map 형태의 프로퍼티인 JobDataAsMap ,
             * JobDataMap 을 두가지로 나누어 구현 Map 형태와 일반적인
             * 프로퍼티 형태를 함께 구현하기 위하여 Map 형태의 경우 VO 에서 받은
             * 값을 Hash Map 형태로 변환하여 설정파일을 생성함
             */

            jobDetail = makeJobDetailHashMap(beanVO);

            ArrayList jobDataAsMapKey = null;
            ArrayList jobDataAsMapValue = null;
            ArrayList jobDataAsMapRef = null;
            ArrayList jobDataMapKey = null;
            ArrayList jobDataMapValue = null;
            ArrayList jobDataMapRef = null;

            /*
             * Map 형태의 데이터를 HashMap 형태로 만들어서 반환
             */
            if (jobDetail.get("jobDataAsMapKey") != null) {
                jobDataAsMapKey = (ArrayList) jobDetail.get("jobDataAsMapKey");
            }
            if (jobDetail.get("jobDataAsMapValue") != null) {
                jobDataAsMapValue =
                    (ArrayList) jobDetail.get("jobDataAsMapValue");
            }
            if (jobDetail.get("jobDataAsMapRef") != null) {
                jobDataAsMapRef = (ArrayList) jobDetail.get("jobDataAsMapRef");
            }
            if (jobDetail.get("jobDataMapKey") != null) {
                jobDataMapKey = (ArrayList) jobDetail.get("jobDataMapKey");
            }
            if (jobDetail.get("jobDataMapValue") != null) {
                jobDataMapValue = (ArrayList) jobDetail.get("jobDataMapValue");
            }
            if (jobDetail.get("jobDataMapRef") != null) {
                jobDataMapRef = (ArrayList) jobDetail.get("jobDataMapRef");
            }
            // *******************************************************************************************

            if (jobDataAsMapKey != null) { // JobDataAsMap
                                           // 의 경우
                Element newP = new Element("property", schemaNamespace);
                newP.setAttribute("name", "jobDataAsMap");

                beanElement.addContent(newP);

                Element map = new Element("map", schemaNamespace);
                newP.addContent(map);

                if (jobDataAsMapKey.size() > 0) {

                    for (int j = 0; j < jobDataAsMapKey.size(); j++) {

                        Element entry = new Element("entry", schemaNamespace);
                        entry.setAttribute("key", (String) jobDataAsMapKey
                            .get(j));
                        
                        if(jobDataAsMapValue != null){
                            if (jobDataAsMapValue.size() > 0) {
                                if (!jobDataAsMapValue.get(j).equals("")) {
                                    entry.setAttribute("value",
                                        (String) jobDataAsMapValue.get(j));
                                }
                            }
                        }

                        if(jobDataAsMapRef != null){
                            if (jobDataAsMapRef.size() > 0) {
                                if (!jobDataAsMapRef.get(j).equals("")) {
                                    entry.setAttribute("value-ref",
                                        (String) jobDataAsMapRef.get(j));
                                }
                            }
                        }
                        map.addContent(entry);
                    }
                }
            }

            if (jobDataMapKey != null) { // JobDataMap
                                         // 의 경우
                Element newP = new Element("property", schemaNamespace);
                newP.setAttribute("name", "jobDataMap");

                beanElement.addContent(newP);

                Element map = new Element("map", schemaNamespace);
                newP.addContent(map);

                if (jobDataMapKey.size() > 0) {

                    for (int j = 0; j < jobDataMapKey.size(); j++) {

                        Element entry = new Element("entry", schemaNamespace);
                        entry
                            .setAttribute("key", (String) jobDataMapKey.get(j));
                        
                        if (jobDataMapValue != null) {
                            if (jobDataMapValue.size() > 0) {
                                if (!jobDataMapValue.get(j).equals("")) {
                                    entry.setAttribute("value",
                                        (String) jobDataMapValue.get(j));
                                }
                            }
                        }
                        
                        if(jobDataMapRef != null){
                            if (jobDataMapRef.size() > 0) {
                                if (!jobDataMapRef.get(j).equals("")) {
                                    entry.setAttribute("value-ref",
                                        (String) jobDataMapRef.get(j));
                                }
                            }
                        }

                        map.addContent(entry);
                    }
                }
            }

            if (beanVO.getPropertyNm() != null) {
                for (int p = 0; p < beanVO.getPropertyNm().length; p++) {

                    if (!beanVO.getPropertyNm()[p].equals("jobDataAsMap")
                        && !beanVO.getPropertyNm()[p].equals("jobDataMap")) {
                        // Map 형태가 아닌일반 프로퍼티의 경우

                        if (!beanVO.getPropertyNm()[p].equals("")) {
                            Element newP =
                                new Element("property", schemaNamespace);
                            newP
                                .setAttribute("name", beanVO.getPropertyNm()[p]);

                            beanElement.addContent(newP);

                            if (!beanVO.getPropertyValue()[p].equals("")) {
                                newP.setAttribute("value", beanVO
                                    .getPropertyValue()[p]);
                            } else if (!beanVO.getPropertyRef()[p].equals("")) {
                                newP.setAttribute("ref", beanVO
                                    .getPropertyRef()[p]);
                            }
                        }

                    }
                }
            }
        } else {
            for (int p = 0; p < beanVO.getPropertyNm().length; p++) {
                Element newP = new Element("property", schemaNamespace);
                newP.setAttribute("name", beanVO.getPropertyNm()[p]);
                if (!beanVO.getPropertyValue()[p].equals("")) {
                    newP.setAttribute("value", beanVO.getPropertyValue()[p]);
                } else {
                    newP.setAttribute("ref", beanVO.getPropertyRef()[p]);
                }

                beanElement.addContent(newP);
            }
        }

        configWriter.writeConfigXml(jdoc, beanVO.getServiceNm());
    }

    
    private HashMap makeJobDetailHashMap(EgovOe1SmsComBeanVO vo) {

        String[] insertPropertyNm = vo.getPropertyNm();
        String[] insertPropertyValue = vo.getPropertyValue();
        String[] insertPropertyRef = vo.getPropertyRef();

        String[] inserRefBeanNm = vo.getRefBeanNm();

        String[] insertDataAsMapKeyNm = vo.getDataAsMapKeyNm();
        String[] insertDataAsMapKeyValue = vo.getDataAsMapKeyValue();
        String[] insertDataAsMapRef = vo.getDataAsMapRef();
        String[] insertDataMapKeyNm = vo.getDataMapKeyNm();
        String[] insertDataMapKeyValue = vo.getDataMapKeyValue();
        String[] insertDataMapRef = vo.getDataMapRef();

        ArrayList inserDataAsMapNmTmp1 = new ArrayList();
        ArrayList inserDataAsMapValueTmp1 = new ArrayList();
        ArrayList inserDataAsMapRefTmp1 = new ArrayList();

        ArrayList inserDataMapNmTmp2 = new ArrayList();
        ArrayList inserDataMapValueTmp2 = new ArrayList();
        ArrayList inserDataMapRefTmp2 = new ArrayList();

        HashMap jobDetail = new HashMap();

        if (insertDataAsMapKeyNm != null) {
            if (insertDataAsMapKeyNm.length > 0) {
                for (int j = 0; j < insertDataAsMapKeyNm.length; j++) {
                    if (!"".equals(insertDataAsMapKeyNm[j])
                        && insertDataAsMapKeyNm[j] != null) {
                        inserDataAsMapNmTmp1.add(insertDataAsMapKeyNm[j]);
                        inserDataAsMapValueTmp1.add(insertDataAsMapKeyValue[j]);
                        inserDataAsMapRefTmp1.add(insertDataAsMapRef[j]);
                    }
                }

                jobDetail.put("jobDataAsMapKey", inserDataAsMapNmTmp1);
                jobDetail.put("jobDataAsMapValue", inserDataAsMapValueTmp1);
                jobDetail.put("jobDataAsMapRef", inserDataAsMapRefTmp1);
            }
        }
        if (insertDataMapKeyNm != null) {
            if (insertDataMapKeyNm.length > 0) {
                for (int j = 0; j < insertDataMapKeyNm.length; j++) {
                    if (!"".equals(insertDataMapKeyNm[j])
                        && insertDataMapKeyNm[j] != null) {
                        inserDataMapNmTmp2.add(insertDataMapKeyNm[j]);
                        inserDataMapValueTmp2.add(insertDataMapKeyValue[j]);
                        inserDataMapRefTmp2.add(insertDataMapRef[j]);
                    }
                }

                jobDetail.put("jobDataMapKey", inserDataMapNmTmp2);
                jobDetail.put("jobDataMapValue", inserDataMapValueTmp2);
                jobDetail.put("jobDataMapRef", inserDataMapRefTmp2);
            }
        }

        return jobDetail;
    }
}
