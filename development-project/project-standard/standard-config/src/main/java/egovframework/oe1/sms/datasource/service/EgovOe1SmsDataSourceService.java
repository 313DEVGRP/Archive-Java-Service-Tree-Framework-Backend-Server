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
package egovframework.oe1.sms.datasource.service;

import java.util.ArrayList;
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
 * DataSource 설정관리를 위한 서비스 클래스
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
@Service("dsService")
public class EgovOe1SmsDataSourceService {

    /** EgovOleSmsConfigWriter */
    @Resource(name = "configWriter")
    private EgovOe1SmsConfigWriter configWriter;

    /** Logger */
    Logger log = Logger.getLogger(this.getClass());

    /**
     * DataSource 설정 목록 조회
     * @param EgovOe1SmsComBeanVO
     *        , Document, Namespace
     * @return List
     * @exception Exception
     */
    public List selectDsServiceBeanList(EgovOe1SmsComBeanVO beanVO,
            Document jdoc) throws Exception {
        log.debug("selectDsServiceBeanList START");
        Namespace schemaNamespace = null;

        List<EgovOe1SmsComBeanVO> list = new ArrayList<EgovOe1SmsComBeanVO>();

        if (jdoc != null) {
            schemaNamespace =
                Namespace.getNamespace("xsd",
                    "http://www.springframework.org/schema/beans");

            // Change JDOM Tree cronExpression value
            Element beans_root = jdoc.getRootElement();
            List beans_element =
                beans_root.getChildren("bean", schemaNamespace);

            String searchCondition = beanVO.getSearchCondition(); // 0:class명
                                                                  // ,
                                                                  // 1:BeanID
            String searchKeyword = beanVO.getSearchKeyword();

            log.debug("searchCondition ===>" + searchCondition);
            log.debug("searchKeyWord ===>" + searchKeyword);

            for (int i = 0; i < beans_element.size(); i++) {
                EgovOe1SmsComBeanVO bVo = new EgovOe1SmsComBeanVO();

                Element bean = (Element) beans_element.get(i);
                String id = bean.getAttributeValue("id");
                String classNm = bean.getAttributeValue("class");
                String destroyMth = bean.getAttributeValue("destroy-method");

                if (!"".equals(searchKeyword)) {
                    log.debug("검색조건");

                    if (searchCondition.equals("0")) { // 0:class명
                        if (classNm.trim().contains(searchKeyword.trim())) {

                            log.debug("클래스로 검색");

                            bVo.setBeanNm(id);
                            bVo.setBeanClassNm(classNm);
                            bVo.setDestroyMethodNm(destroyMth);
                            bVo.setBeanCount(i + 1);

                            list.add(bVo);
                            // break;

                        } else if (classNm.trim().equals(searchKeyword.trim())) { // 0:class명
                                                                                  // like
                                                                                  // 검색

                            log.debug("클래스로like  검색");

                            bVo.setBeanNm(id);
                            bVo.setBeanClassNm(classNm);
                            bVo.setDestroyMethodNm(destroyMth);
                            bVo.setBeanCount(i + 1);

                            list.add(bVo);
                            // break;
                        }
                    } else if (searchCondition.equals("1")) { //  
                        log.debug("Bean명 검색 ===>" + searchCondition);
                        log.debug("id.trim()" + id.trim());
                        log.debug(searchKeyword.contains(id.trim()));

                        if (id.trim().contains(searchKeyword.trim())) {
                            log.debug("Bean명like 검색");
                            bVo.setBeanNm(id);
                            bVo.setBeanClassNm(classNm);
                            bVo.setDestroyMethodNm(destroyMth);
                            bVo.setBeanCount(i + 1);

                            list.add(bVo);

                        } else if (id.trim().equals(searchKeyword.trim())) { // 1:BeanID
                                                                             // like
                                                                             // 검색
                            log.debug("Bean명 검색");
                            bVo.setBeanNm(id);
                            bVo.setBeanClassNm(classNm);
                            bVo.setDestroyMethodNm(destroyMth);
                            bVo.setBeanCount(i + 1);

                            list.add(bVo);
                        }
                    }

                } else { // 검색조건 없을때,

                    log.debug("검색조건 없음 전체 검색");

                    bVo.setBeanNm(id);
                    bVo.setBeanClassNm(classNm);
                    bVo.setDestroyMethodNm(destroyMth);
                    bVo.setBeanCount(i + 1);

                    list.add(bVo);
                }
            }
        }
        return list;
    }

    /**
     * DataSource 설정 상세 조회
     * @param EgovOe1SmsComBeanVO
     *        , Document, Namespace
     * @return EgovOe1SmsComBeanVO
     * @exception Exception
     */
    public EgovOe1SmsComBeanVO selectDsServiceBean(EgovOe1SmsComBeanVO beanVO,
            Document jdoc) throws Exception {
        log.debug("selectDsServiceBean  START");
        Namespace schemaNamespace = null;

        schemaNamespace =
            Namespace.getNamespace("xsd",
                "http://www.springframework.org/schema/beans");

        // Change JDOM Tree cronExpression value
        Element beans_root = jdoc.getRootElement();
        List beans_element = beans_root.getChildren("bean", schemaNamespace);

        List<EgovOe1SmsComBeanVO> list = new ArrayList<EgovOe1SmsComBeanVO>();

        String searchBeanNm = beanVO.getBeanNm();
        // String searchBeanClassNm =
        // beanVO.getBeanClassNm();
        EgovOe1SmsComBeanVO bVo = new EgovOe1SmsComBeanVO();

        for (int i = 0; i < beans_element.size(); i++) {

            Element bean = (Element) beans_element.get(i);
            String id = bean.getAttributeValue("id");
            String classNm = bean.getAttributeValue("class");
            String destroyMth = bean.getAttributeValue("destroy-method");

            if (!"".equals(searchBeanNm)) {
                log.debug("찾을 Bean 존재");

                if (id.trim().equals(searchBeanNm.trim())) {
                    bVo.setBeanNm(id);
                    bVo.setBeanClassNm(classNm);
                    bVo.setDestroyMethodNm(destroyMth);

                    List propertys =
                        bean.getChildren("property", schemaNamespace);

                    if (classNm.trim().contains("EgovUUIdGnrService")) {
                        for (int p = 0; p < propertys.size(); p++) {
                            EgovOe1SmsComPropertyVO pVo =
                                new EgovOe1SmsComPropertyVO();

                            Element property = (Element) propertys.get(p);
                            String propName =
                                property.getAttributeValue("name");

                            pVo.setPropertyNm(propName);

                            Element value =
                                property.getChild("value", schemaNamespace);
                            String valueText = value.getText();
                            pVo.setPropertyValue(valueText);

                            bVo.setProperty(pVo);
                        }
                        break;
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
     * DataSource 설정 수정
     * @param EgovOe1SmsComBeanVO
     *        , Document, Namespace
     * @return void
     * @exception Exception
     */
    public void updateDsServiceBean(EgovOe1SmsComBeanVO beanVO, Document jdoc)
            throws Exception {
        log.debug("updateDsServiceBean START");

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

                for (int p = 0; p < beanVO.getPropertyNm().length; p++) {
                    Element newP = new Element("property", schemaNamespace);
                    newP.setAttribute("name", beanVO.getPropertyNm()[p]);
                    if (!beanVO.getPropertyValue()[p].equals("")) {
                        newP
                            .setAttribute("value", beanVO.getPropertyValue()[p]);
                    } else {
                        newP.setAttribute("ref", beanVO.getPropertyRef()[p]);
                    }

                    bean.addContent(newP);
                }
            }
        }

        configWriter.writeConfigXml(jdoc, beanVO.getServiceNm());
    }

    /**
     * DataSource 설정 미리보기(상세, 빈추가)
     * @param EgovOe1SmsComBeanVO
     *        , Document, Namespace
     * @return String
     * @exception Exception
     */
    public String previewDsServiceBean(EgovOe1SmsComBeanVO beanVO, Document jdoc)
            throws Exception {

        Namespace schemaNamespace = null;

        log.debug("previewDsServiceBean START");

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

                for (int p = 0; p < beanVO.getPropertyNm().length; p++) {
                    Element newP = new Element("property", schemaNamespace);
                    newP.setAttribute("name", beanVO.getPropertyNm()[p]);
                    if (!beanVO.getPropertyValue()[p].equals("")) {
                        newP
                            .setAttribute("value", beanVO.getPropertyValue()[p]);
                    } else {
                        newP.setAttribute("ref", beanVO.getPropertyRef()[p]);
                    }

                    bean.addContent(newP);
                }
            }
        }

        return configWriter.previewConfigXml(jdoc);
    }

    /**
     * DataSource 설정 미리보기(신규 파일 생성)
     * @param EgovOe1SmsComBeanVO
     *        , Document, Namespace
     * @return String
     * @exception Exception
     */
    public String previewNewDsServiceBean(EgovOe1SmsComBeanVO beanVO)
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

        String insertBeanNm = beanVO.getBeanNm();
        String insertClassNm = beanVO.getBeanClassNm();
        String insertDestoryMethodNm = beanVO.getDestroyMethodNm();

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

        if (insertClassNm.trim().contains("EgovUUIdGnrService")) {
            for (int p = 0; p < beanVO.getPropertyNm().length; p++) {
                Element newP = new Element("property", schemaNamespace);

                newP.setAttribute("name", beanVO.getPropertyNm()[p]);

                beanElement.addContent(newP);

                Element newPropValue = new Element("value", schemaNamespace);
                if (!beanVO.getPropertyValue()[p].equals("")) {
                    newPropValue.setAttribute("value", beanVO
                        .getPropertyValue()[p]);
                }

                newP.addContent(newPropValue);
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
     * DataSource 설정 삭제
     * @param EgovOe1SmsComBeanVO
     *        , Document, Namespace
     * @return void
     * @exception Exception
     */
    public void deleteDsServiceBean(EgovOe1SmsComBeanVO beanVO, Document jdoc)
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
     * 신규 DataSource 설정 등록
     * @param EgovOe1SmsComBeanVO
     *        , Document, Namespace
     * @return void
     * @exception Exception
     */
    public int insertNewDsServiceBean(EgovOe1SmsComBeanVO beanVO, Document jdoc)
            throws Exception {

        Namespace schemaNamespace = null;
        schemaNamespace =
            Namespace.getNamespace("",
                "http://www.springframework.org/schema/beans");

        // Change JDOM Tree cronExpression value
        Element beans_root = jdoc.getRootElement();
        List beans_element = beans_root.getChildren("bean", schemaNamespace);

        String insertBeanNm = beanVO.getBeanNm();
        String insertClassNm = beanVO.getBeanClassNm();
        String insertDestoryMethodNm = beanVO.getDestroyMethodNm();
        
        for (int J = 0; J < beans_element.size(); J++) {

            Element checkBean = (Element) beans_element.get(J);
            String checkId = checkBean.getAttributeValue("id");
            
            if (checkId.trim().equals(insertBeanNm.trim())) {
                return 1;
            }
        }
        
        /* Bean Create */
        Element newBean = new Element("bean", schemaNamespace);
        newBean.setAttribute("id", insertBeanNm);
        newBean.setAttribute("class", insertClassNm);
        if (!insertDestoryMethodNm.equals("")) {
            newBean.setAttribute("destroy-method", insertDestoryMethodNm);
        }
        beans_root.addContent(newBean);

        for (int i = 0; i < beans_element.size(); i++) {

            Element bean = (Element) beans_element.get(i);

            String id = bean.getAttributeValue("id");

            if (id.trim().equals(insertBeanNm.trim())) {

                for (int p = 0; p < beanVO.getPropertyNm().length; p++) {
                    Element newP = new Element("property", schemaNamespace);
                    newP.setAttribute("name", beanVO.getPropertyNm()[p]);
                    if (!beanVO.getPropertyValue()[p].equals("")) {
                        newP
                            .setAttribute("value", beanVO.getPropertyValue()[p]);
                    } else {
                        newP.setAttribute("ref", beanVO.getPropertyRef()[p]);
                    }

                    bean.addContent(newP);
                }
            }
        }

        configWriter.writeConfigXml(jdoc, beanVO.getServiceNm());
        return 0;
    }

    /**
     * 신규 DataSource 서비스 등록
     * @param EgovOe1SmsComBeanVO
     *        , Document, Namespace
     * @return void
     * @exception Exception
     */
    public void insertNewDsService(EgovOe1SmsComBeanVO beanVO) throws Exception {

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

        String insertBeanNm = beanVO.getBeanNm();
        String insertClassNm = beanVO.getBeanClassNm();
        String insertDestoryMethodNm = beanVO.getDestroyMethodNm();

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

        if (insertClassNm.trim().contains("EgovUUIdGnrService")) {
            for (int p = 0; p < beanVO.getPropertyNm().length; p++) {
                Element newP = new Element("property", schemaNamespace);

                newP.setAttribute("name", beanVO.getPropertyNm()[p]);

                beanElement.addContent(newP);

                Element newPropValue = new Element("value", schemaNamespace);
                if (!beanVO.getPropertyValue()[p].equals("")) {
                    newPropValue.setAttribute("value", beanVO
                        .getPropertyValue()[p]);
                }

                newP.addContent(newPropValue);
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
}
