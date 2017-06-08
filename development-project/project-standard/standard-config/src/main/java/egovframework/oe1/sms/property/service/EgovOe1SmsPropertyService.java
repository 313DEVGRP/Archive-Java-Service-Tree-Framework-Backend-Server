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
import java.util.List;

import javax.annotation.Resource;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.Namespace;
import org.springframework.stereotype.Service;

import egovframework.oe1.sms.com.file.EgovOe1SmsConfigWriter;

/**
 * 프로퍼티 설정관리를 서비스 클래스
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

@Service("proService")
public class EgovOe1SmsPropertyService {
    /** EgovOleSmsConfigWriter */
    @Resource(name = "configWriter")
    private EgovOe1SmsConfigWriter configWriter;

    /**
     * 프로퍼티 서비스 설정 목록 조회
     * @param EgovOe1SmsPropertyVO
     * @return List
     * @exception Exception
     */
    public List selectPropertyServiceList(EgovOe1SmsPropertyVO propertyVO,
            Document jdoc) throws Exception {

        Namespace schemaNamespace = null;
        List<EgovOe1SmsPropertyVO> list = new ArrayList<EgovOe1SmsPropertyVO>();

        if (jdoc != null) {
            schemaNamespace =
                Namespace.getNamespace("xsd",
                    "http://www.springframework.org/schema/beans");

            // Change JDOM Tree cronExpression value
            Element beans_root = jdoc.getRootElement();
            List beans_element =
                beans_root.getChildren("bean", schemaNamespace);

            String searchKeyword = propertyVO.getSearchKeyword();

            for (int i = 0; i < beans_element.size(); i++) {

                Element bean = (Element) beans_element.get(i);
                String id = bean.getAttributeValue("name");
                String classNm = bean.getAttributeValue("class");
                String destroyMth = bean.getAttributeValue("destroy-method");

                List propertys = bean.getChildren("property", schemaNamespace);

                for (int p = 0; p < propertys.size(); p++) {
                    EgovOe1SmsPropertyVO bVo = new EgovOe1SmsPropertyVO();
                    Element property = (Element) propertys.get(p);
                    String propName = property.getAttributeValue("name");

                    if (!"".equals(searchKeyword)) {

                        if (propName.trim().contains(searchKeyword.trim())) {
                            bVo.setBeanNm(id);
                            bVo.setBeanClassNm(classNm);
                            bVo.setDestroyMethodNm(destroyMth);

                            bVo.setPropertyNm(propName);
                            bVo.setPropertyCnt(p + 1);

                            list.add(bVo);
                            break;

                        } else if (propName.trim().equals(searchKeyword.trim())) { // 0:class명
                            bVo.setBeanNm(id);
                            bVo.setBeanClassNm(classNm);
                            bVo.setDestroyMethodNm(destroyMth);

                            bVo.setPropertyNm(propName);
                            bVo.setPropertyCnt(p + 1);

                            list.add(bVo);
                            break;
                        }
                    } else {
                        bVo.setBeanNm(id);
                        bVo.setBeanClassNm(classNm);
                        bVo.setDestroyMethodNm(destroyMth);

                        bVo.setPropertyNm(propName);
                        bVo.setPropertyCnt(p + 1);

                        list.add(bVo);
                    }

                }

            }
        }

        return list;
    }

    /**
     * 프로퍼티 서비스 설정 상세 조회
     * @param EgovOe1SmsPropertyVO
     *        ,Document , Namespace
     * @return EgovOe1SmsPropertyVO
     * @exception Exception
     */
    public EgovOe1SmsPropertyVO selectPropertyService(
            EgovOe1SmsPropertyVO propertyVO, Document jdoc) throws Exception {

        Namespace schemaNamespace = null;
        String tarPropertyNm = propertyVO.getPropertyNm();

        schemaNamespace =
            Namespace.getNamespace("xsd",
                "http://www.springframework.org/schema/beans");

        // Change JDOM Tree cronExpression value
        Element beans_root = jdoc.getRootElement();
        List beans_element = beans_root.getChildren("bean", schemaNamespace);
        EgovOe1SmsPropertyVO bVo = new EgovOe1SmsPropertyVO();

        // List<Bean> list = new ArrayList<Bean>();

        for (int i = 0; i < beans_element.size(); i++) {

            Element bean = (Element) beans_element.get(i);
            String id = bean.getAttributeValue("name");
            String classNm = bean.getAttributeValue("class");
            String destroyMth = bean.getAttributeValue("destroy-method");

            bVo.setBeanNm(id);
            bVo.setBeanClassNm(classNm);
            bVo.setDestroyMethodNm(destroyMth);

            List propertys = bean.getChildren("property", schemaNamespace);

            for (int p = 0; p < propertys.size(); p++) {

                Element property = (Element) propertys.get(p);
                String propName = property.getAttributeValue("name");
                String propValue = property.getAttributeValue("value");

                if (propName.trim().equals(tarPropertyNm.trim())) {
                    Element set;
                    Element map;

                    bVo.setPropertyNm(propName);

                    if (tarPropertyNm.equals("extFileName")) {
                        set = property.getChild("set", schemaNamespace);

                        List values = set.getChildren("value", schemaNamespace);

                        for (int j = 0; j < values.size(); j++) {

                            EgovOe1SmsPropEntryVO pVo =
                                new EgovOe1SmsPropEntryVO();
                            Element value = (Element) values.get(j);

                            String extValue = value.getText();
                            pVo.setPropEntryValue(extValue);
                            bVo.setProperty(pVo);
                        }
                        bVo.setExtGbn("ext");

                    } else if (tarPropertyNm.equals("properties")) {
                        map = property.getChild("map", schemaNamespace);

                        List entrys = map.getChildren("entry", schemaNamespace);

                        for (int j = 0; j < entrys.size(); j++) {

                            EgovOe1SmsPropEntryVO pVo =
                                new EgovOe1SmsPropEntryVO();
                            Element entry = (Element) entrys.get(j);

                            String entryKey = entry.getAttributeValue("key");
                            String entryValue =
                                entry.getAttributeValue("value");

                            pVo.setPropEntryKey(entryKey);
                            pVo.setPropEntryValue(entryValue);

                            bVo.setProperty(pVo);
                        }
                    } else {

                        EgovOe1SmsPropEntryVO pVo = new EgovOe1SmsPropEntryVO();

                        pVo.setPropEntryValue(propValue);

                        bVo.setProperty(pVo);

                    }

                }

            }
        }
        return bVo;
    }

    /**
     * 프로퍼티 서비스 설정 수정
     * @param EgovOe1SmsPropertyVO
     *        , Document, Namespace
     * @return List
     * @exception Exception
     */
    public void updatePropertyService(EgovOe1SmsPropertyVO propertyVO,
            Document jdoc) throws Exception {
        Namespace schemaNamespace = null;
        schemaNamespace =
            Namespace.getNamespace("",
                "http://www.springframework.org/schema/beans");

        // Change JDOM Tree cronExpression value
        Element beans_root = jdoc.getRootElement();
        List beans_element = beans_root.getChildren("bean", schemaNamespace);

        String updateBeanNm = propertyVO.getBeanNm();
        String updateClassNm = propertyVO.getBeanClassNm();
        String updateDestoryMethodNm = propertyVO.getDestroyMethodNm();
        String updPropertyNm = propertyVO.getPropertyNm();

        for (int i = 0; i < beans_element.size(); i++) {

            Element bean = (Element) beans_element.get(i);
            String id = bean.getAttributeValue("name");

            List propertys = bean.getChildren("property", schemaNamespace);

            /* 해당 프로퍼티 삭제 */
            for (int p = 0; p < propertys.size(); p++) {
                Element property = (Element) propertys.get(p);
                String propName = property.getAttributeValue("name");

                if (propName.trim().equals(updPropertyNm.trim())) {
                    propertys.remove(property);
                    break;
                }
            }
        }

        for (int i = 0; i < beans_element.size(); i++) {
            Element bean = (Element) beans_element.get(i);
            String id = bean.getAttributeValue("name");

            Element property = new Element("property", schemaNamespace);

            property.setAttribute("name", updPropertyNm);
            bean.addContent(property);

            if (updPropertyNm.trim().equals("extFileName")) {
                Element set = new Element("set", schemaNamespace);

                property.addContent(set);
                // Element map = new
                // Element("map",schemaNamespace);
                // set.addContent(map);

                for (int p = 0; p < propertyVO.getPropEntryValue().length; p++) {
                    Element value = new Element("value", schemaNamespace);

                    if (!propertyVO.getPropEntryValue()[p].equals("")) {
                        value.setText(propertyVO.getPropEntryValue()[p]);
                    }

                    set.addContent(value);
                }

            } else if (updPropertyNm.trim().equals("properties")) {
                Element map = new Element("map", schemaNamespace);
                property.addContent(map);

                for (int p = 0; p < propertyVO.getPropEntryKey().length; p++) {
                    Element entry = new Element("entry", schemaNamespace);

                    if (!propertyVO.getPropEntryKey()[p].equals("")
                        && !propertyVO.getPropEntryValue()[p].equals("")) {
                        entry.setAttribute("key",
                            propertyVO.getPropEntryKey()[p]);
                        entry.setAttribute("value", propertyVO
                            .getPropEntryValue()[p]);
                    }

                    map.addContent(entry);
                }
            }
        }

        configWriter.writeConfigXml(jdoc, propertyVO.getServiceNm());
    }

    /**
     * 프로퍼티 서비스 미리보기
     * @param EgovOe1SmsPropertyVO
     *        , Document, Namespace
     * @return String
     * @exception Exception
     */
    public String previewPropertyService(EgovOe1SmsPropertyVO propertyVO,
            Document jdoc) throws Exception {

        Namespace schemaNamespace = null;
        schemaNamespace =
            Namespace.getNamespace("",
                "http://www.springframework.org/schema/beans");

        // Change JDOM Tree cronExpression value
        Element beans_root = jdoc.getRootElement();
        List beans_element = beans_root.getChildren("bean", schemaNamespace);

        String updPropertyNm = propertyVO.getPropertyNm();

        for (int i = 0; i < beans_element.size(); i++) {

            Element bean = (Element) beans_element.get(i);
            String id = bean.getAttributeValue("name");

            List propertys = bean.getChildren("property", schemaNamespace);

            /* 해당 프로퍼티 삭제 */
            for (int p = 0; p < propertys.size(); p++) {
                Element property = (Element) propertys.get(p);
                String propName = property.getAttributeValue("name");

                if (propName.trim().equals(updPropertyNm.trim())) {
                    propertys.remove(property);
                    break;
                }
            }
        }

        for (int i = 0; i < beans_element.size(); i++) {
            Element bean = (Element) beans_element.get(i);
            String id = bean.getAttributeValue("name");

            Element property = new Element("property", schemaNamespace);

            property.setAttribute("name", updPropertyNm);
            bean.addContent(property);

            if (updPropertyNm.trim().equals("extFileName")) {
                Element set = new Element("set", schemaNamespace);

                property.addContent(set);
                // Element map = new
                // Element("map",schemaNamespace);
                // set.addContent(map);

                for (int p = 0; p < propertyVO.getPropEntryValue().length; p++) {
                    Element value = new Element("value", schemaNamespace);

                    if (!propertyVO.getPropEntryValue()[p].equals("")) {
                        value.setText(propertyVO.getPropEntryValue()[p]);
                    }

                    set.addContent(value);
                }

            } else if (updPropertyNm.trim().equals("properties")) {
                Element map = new Element("map", schemaNamespace);
                property.addContent(map);

                for (int p = 0; p < propertyVO.getPropEntryKey().length; p++) {
                    Element entry = new Element("entry", schemaNamespace);

                    if (!propertyVO.getPropEntryKey()[p].equals("")
                        && !propertyVO.getPropEntryValue()[p].equals("")) {
                        entry.setAttribute("key",
                            propertyVO.getPropEntryKey()[p]);
                        entry.setAttribute("value", propertyVO
                            .getPropEntryValue()[p]);
                    }

                    map.addContent(entry);
                }
            }
        }

        return configWriter.previewConfigXml(jdoc);
    }

    /**
     * 프로퍼티 서비스 미리보기
     * @param EgovOe1SmsPropertyVO
     *        , Document, Namespace
     * @return String
     * @exception Exception
     */
    public String previewNewPropertyService(EgovOe1SmsPropertyVO propertyVO)
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

        Element beanElement = new Element("bean", schemaNamespace);

        String insertBeanNm = propertyVO.getBeanNm();
        String insertClassNm = propertyVO.getBeanClassNm();
        String insertDestoryMethodNm = propertyVO.getDestroyMethodNm();
        String insertPropertyNm = propertyVO.getPropertyNm();

        beanElement.setAttribute("name", insertBeanNm);
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

        Element property = new Element("property", schemaNamespace);

        property.setAttribute("name", insertPropertyNm);
        beanElement.addContent(property);

        if (insertPropertyNm.trim().equals("extFileName")) {
            Element set = new Element("set", schemaNamespace);

            property.addContent(set);
            // Element map = new
            // Element("map",schemaNamespace);
            // set.addContent(map);

            for (int p = 0; p < propertyVO.getPropEntryValue().length; p++) {
                Element value = new Element("value", schemaNamespace);

                if (!propertyVO.getPropEntryValue()[p].equals("")) {
                    value.setText(propertyVO.getPropEntryValue()[p]);
                }

                set.addContent(value);
            }

        } else if (insertPropertyNm.trim().equals("properties")) {
            Element map = new Element("map", schemaNamespace);
            property.addContent(map);

            for (int p = 0; p < propertyVO.getPropEntryKey().length; p++) {
                Element entry = new Element("entry", schemaNamespace);

                if (!propertyVO.getPropEntryKey()[p].equals("")
                    && !propertyVO.getPropEntryValue()[p].equals("")) {
                    entry.setAttribute("key", propertyVO.getPropEntryKey()[p]);
                    entry.setAttribute("value",
                        propertyVO.getPropEntryValue()[p]);
                }

                map.addContent(entry);
            }
        }

        return configWriter.previewConfigXml(jdoc);
    }

    /**
     * 신규 프로퍼티 빈 등록
     * @param EgovOe1SmsPropertyVO
     *        , Document, Namespace
     * @return void
     * @exception Exception
     */
    public int insertNewPropertyServiceBean(EgovOe1SmsPropertyVO propertyVO,
            Document jdoc) throws Exception {

        Namespace schemaNamespace = null;
        schemaNamespace =
            Namespace.getNamespace("",
                "http://www.springframework.org/schema/beans");

        // Change JDOM Tree cronExpression value
        Element beans_root = jdoc.getRootElement();
        List beans_element = beans_root.getChildren("bean", schemaNamespace);

        String insertBeanNm = propertyVO.getBeanNm();
        String insertClassNm = propertyVO.getBeanClassNm();
        String insertDestoryMethodNm = propertyVO.getDestroyMethodNm();
        String insertPropertyNm = propertyVO.getPropertyNm();

        for (int i = 0; i < beans_element.size(); i++) {
            Element bean = (Element) beans_element.get(i);
            String id = bean.getAttributeValue("name");

            List propertys = bean.getChildren("property", schemaNamespace);

            for (int j = 0; j < propertys.size(); j++) {

                Element property = (Element) propertys.get(j);
                String propName = property.getAttributeValue("name");

                if (insertPropertyNm.equals(propName)) {
                    return 1;
                }

            }

            Element property = new Element("property", schemaNamespace);

            property.setAttribute("name", insertPropertyNm);
            bean.addContent(property);

            if (insertPropertyNm.trim().equals("extFileName")) {
                Element set = new Element("set", schemaNamespace);

                property.addContent(set);
                // Element map = new
                // Element("map",schemaNamespace);
                // set.addContent(map);

                for (int p = 0; p < propertyVO.getPropEntryValue().length; p++) {
                    Element value = new Element("value", schemaNamespace);

                    if (!propertyVO.getPropEntryValue()[p].equals("")) {
                        value.setText(propertyVO.getPropEntryValue()[p]);
                    }

                    set.addContent(value);
                }

            } else if (insertPropertyNm.trim().equals("properties")) {
                Element map = new Element("map", schemaNamespace);
                property.addContent(map);

                for (int p = 0; p < propertyVO.getPropEntryKey().length; p++) {
                    Element entry = new Element("entry", schemaNamespace);

                    if (!propertyVO.getPropEntryKey()[p].equals("")
                        && !propertyVO.getPropEntryValue()[p].equals("")) {
                        entry.setAttribute("key",
                            propertyVO.getPropEntryKey()[p]);
                        entry.setAttribute("value", propertyVO
                            .getPropEntryValue()[p]);
                    }

                    map.addContent(entry);
                }
            }
        }
        configWriter.writeConfigXml(jdoc, propertyVO.getServiceNm());

        return 0;
    }

    /**
     * 프로퍼티 설정 빈 삭제
     * @param EgovOe1SmsPropertyVO
     *        , Document, Namespace
     * @return void
     * @exception Exception
     */
    public void deleteServiceBean(EgovOe1SmsPropertyVO propertyVO, Document jdoc)
            throws Exception {

        Namespace schemaNamespace = null;
        schemaNamespace =
            Namespace.getNamespace("xsd",
                "http://www.springframework.org/schema/beans");

        // Change JDOM Tree cronExpression value
        Element beans_root = jdoc.getRootElement();
        List beans_element = beans_root.getChildren("bean", schemaNamespace);

        String deleteBeanNm = propertyVO.getBeanNm();
        String deletePropertyNm = propertyVO.getPropertyNm();

        for (int i = 0; i < beans_element.size(); i++) {
            Element bean = (Element) beans_element.get(i);

            List propertys = bean.getChildren("property", schemaNamespace);

            for (int p = 0; p < propertys.size(); p++) {

                Element property = (Element) propertys.get(p);
                String propName = property.getAttributeValue("name");

                if (propName.trim().equals(deletePropertyNm.trim())) {
                    propertys.remove(property);
                    break;
                }
            }

        }

        configWriter.writeConfigXml(jdoc, propertyVO.getServiceNm());

    }

    /**
     * 신규 프로퍼티 서비스 등록
     * @param EgovOe1SmsPropertyVO
     *        , Document, Namespace
     * @return void
     * @exception Exception
     */
    public void insertNewPropertyService(EgovOe1SmsPropertyVO propertyVO)
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

        Element beanElement = new Element("bean", schemaNamespace);

        String insertBeanNm = propertyVO.getBeanNm();
        String insertClassNm = propertyVO.getBeanClassNm();
        String insertDestoryMethodNm = propertyVO.getDestroyMethodNm();
        String insertPropertyNm = propertyVO.getPropertyNm();

        beanElement.setAttribute("name", insertBeanNm);
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

        Element property = new Element("property", schemaNamespace);

        property.setAttribute("name", insertPropertyNm);
        beanElement.addContent(property);

        if (insertPropertyNm.trim().equals("extFileName")) {
            Element set = new Element("set", schemaNamespace);

            property.addContent(set);
            // Element map = new
            // Element("map",schemaNamespace);
            // set.addContent(map);

            for (int p = 0; p < propertyVO.getPropEntryValue().length; p++) {
                Element value = new Element("value", schemaNamespace);

                if (!propertyVO.getPropEntryValue()[p].equals("")) {
                    value.setText(propertyVO.getPropEntryValue()[p]);
                }

                set.addContent(value);
            }

        } else if (insertPropertyNm.trim().equals("properties")) {
            Element map = new Element("map", schemaNamespace);
            property.addContent(map);

            for (int p = 0; p < propertyVO.getPropEntryKey().length; p++) {
                Element entry = new Element("entry", schemaNamespace);

                if (!propertyVO.getPropEntryKey()[p].equals("")
                    && !propertyVO.getPropEntryValue()[p].equals("")) {
                    entry.setAttribute("key", propertyVO.getPropEntryKey()[p]);
                    entry.setAttribute("value",
                        propertyVO.getPropEntryValue()[p]);
                }

                map.addContent(entry);
            }
        }

        configWriter.writeConfigXml(jdoc, propertyVO.getServiceNm());
    }

}
