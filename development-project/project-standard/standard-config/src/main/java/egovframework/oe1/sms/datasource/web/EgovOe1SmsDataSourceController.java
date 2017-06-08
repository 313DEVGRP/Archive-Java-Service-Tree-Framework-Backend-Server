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
package egovframework.oe1.sms.datasource.web;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.jdom.Document;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.oe1.sms.com.file.EgovOe1SmsConfigReader;
import egovframework.oe1.sms.com.service.EgovOe1SmsComBeanVO;
import egovframework.oe1.sms.com.service.EgovOe1SmsComPropertyVO;
import egovframework.oe1.sms.com.service.EogvOe1SmsComPorpertyInfoService;
import egovframework.oe1.sms.datasource.service.EgovOe1SmsDataSourceService;

/**
 * ID Gen 설정관리를 위한 Controller 클래스
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

@Controller
public class EgovOe1SmsDataSourceController {

    /** EgovSampleService */
    @Resource(name = "dsService")
    private EgovOe1SmsDataSourceService dsService;

    /** EgovOe1SmsConfigReader */
    @Resource(name = "configReader")
    private EgovOe1SmsConfigReader configReader;

    @Resource(name = "porpertyInfoService")
    private EogvOe1SmsComPorpertyInfoService pInfoService;

    /**
     * DataSource 설정 목록 조회
     * @param EgovOe1SmsComBeanVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/selectDsServiceBeanList.sms")
    public String selectDsServiceBeanList(
            @ModelAttribute("beanVO") EgovOe1SmsComBeanVO beanVO, ModelMap model)
            throws Exception {

        Document jdoc = null;
        // Namespace schemaNamespace = null;
        beanVO.setServiceNm("dataSource");

        jdoc = configReader.readConfigFile(beanVO.getServiceNm());

        List<EgovOe1SmsComBeanVO> list = new ArrayList<EgovOe1SmsComBeanVO>();

        list = dsService.selectDsServiceBeanList(beanVO, jdoc);
        model.addAttribute("bean_list", list);

        return "datasource/EgovSmsDataSourceList";
    }

    /**
     * DataSource 설정 상세 조회
     * @param EgovOe1SmsComBeanVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/selectDsServiceBean.sms")
    public String selectDsServiceBean(
            @ModelAttribute("beanVO") EgovOe1SmsComBeanVO beanVO, ModelMap model)
            throws Exception {

        Document jdoc = null;
        // Namespace schemaNamespace = null;
        EgovOe1SmsComBeanVO vo = new EgovOe1SmsComBeanVO();

        int i = 0;
        int size = 0;

        List<EgovOe1SmsComBeanVO> list = new ArrayList<EgovOe1SmsComBeanVO>();
        List<EgovOe1SmsComPropertyVO> list_property =
            new ArrayList<EgovOe1SmsComPropertyVO>();

        List jdbcDs_List =
            pInfoService
                .getPropertyInfo("org.springframework.jdbc.datasource.DriverManagerDataSource");
        List dbcpDs_List =
            pInfoService
                .getPropertyInfo("org.apache.commons.dbcp.BasicDataSource");
        List c3Ds_List =
            pInfoService
                .getPropertyInfo("com.mchange.v2.c3p0.ComboPooledDataSource");
        List jndiDs_List =
            pInfoService
                .getPropertyInfo("org.springframework.jndi.JndiObjectFactoryBean");

        jdoc = configReader.readConfigFile(beanVO.getServiceNm());

        vo = dsService.selectDsServiceBean(beanVO, jdoc);

        List list_vo = pInfoService.getPropertyInfoVo(vo.getBeanClassNm());

        String jdbcDs = makeHtmlString(jdbcDs_List);
        String dbcpDs = makeHtmlString(dbcpDs_List);
        String c3Ds = makeHtmlString(c3Ds_List);
        String jndiDs = makeHtmlString(jndiDs_List);

        model.addAttribute("bean_list", vo.getProperties());
        model.addAttribute("beanVO", vo);
        model.addAttribute("list_vo", list_vo);
        model.addAttribute("jdbcDs", jdbcDs);
        model.addAttribute("dbcpDs", dbcpDs);
        model.addAttribute("c3Ds", c3Ds);
        model.addAttribute("jndiDs", jndiDs);

        return "datasource/EgovSmsDataSourceDetail";
    }

    /**
     * DataSource 설정 수정
     * @param EgovOe1SmsComBeanVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/updateDsServiceBean.sms")
    public String updateDsServiceBean(
            @ModelAttribute("beanVO") EgovOe1SmsComBeanVO beanVO, ModelMap model)
            throws Exception {

        Document jdoc = null;
        // Namespace schemaNamespace = null;
        EgovOe1SmsComBeanVO vo = new EgovOe1SmsComBeanVO();

        int i = 0;
        int size = 0;

        List<EgovOe1SmsComBeanVO> list = new ArrayList<EgovOe1SmsComBeanVO>();
        List<EgovOe1SmsComPropertyVO> list_property =
            new ArrayList<EgovOe1SmsComPropertyVO>();

        jdoc = configReader.readConfigFile(beanVO.getServiceNm());

        dsService.updateDsServiceBean(beanVO, jdoc);

        model.addAttribute("beanVO", vo);

        return "forward:/ole/sms/selectDsServiceBean.sms";
    }

    /**
     * DataSource 설정 미리보기
     * @param EgovOe1SmsComBeanVO
     *        , HttpServletResponse, ModelMap
     * @return void
     * @exception Exception
     */
    @RequestMapping("/ole/sms/previewDsServiceBean.sms")
    public void previewDsServiceBean(
            @ModelAttribute("beanVO") EgovOe1SmsComBeanVO beanVO,
            HttpServletResponse response, ModelMap model) throws Exception {

        Document jdoc = null;
        EgovOe1SmsComBeanVO vo = new EgovOe1SmsComBeanVO();

        int i = 0;
        int size = 0;

        List<EgovOe1SmsComBeanVO> list = new ArrayList<EgovOe1SmsComBeanVO>();
        List<EgovOe1SmsComPropertyVO> list_property =
            new ArrayList<EgovOe1SmsComPropertyVO>();

        jdoc = configReader.readConfigFile(beanVO.getServiceNm());

        String preview = dsService.previewDsServiceBean(beanVO, jdoc);

        response.setContentType("application/xml");
        PrintWriter out = response.getWriter();
        out.println(preview);
    }

    /**
     * DataSource 설정 미리보기
     * @param EgovOe1SmsComBeanVO
     *        , HttpServletResponse, ModelMap
     * @return void
     * @exception Exception
     */
    @RequestMapping("/ole/sms/previewNewDsServiceBean.sms")
    public void previewNewDsServiceBean(
            @ModelAttribute("beanVO") EgovOe1SmsComBeanVO beanVO,
            HttpServletResponse response, ModelMap model) throws Exception {

        String preview = dsService.previewNewDsServiceBean(beanVO);

        response.setContentType("application/xml");
        PrintWriter out = response.getWriter();
        out.println(preview);
    }

    /**
     * DataSource 설정 삭제
     * @param EgovOe1SmsComBeanVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/deleteDsServiceBean.sms")
    public String deleteDsServiceBean(
            @ModelAttribute("beanVO") EgovOe1SmsComBeanVO beanVO, ModelMap model)
            throws Exception {

        Document jdoc = null;
        EgovOe1SmsComBeanVO vo = new EgovOe1SmsComBeanVO();

        List<EgovOe1SmsComBeanVO> list = new ArrayList<EgovOe1SmsComBeanVO>();
        List<EgovOe1SmsComPropertyVO> list_property =
            new ArrayList<EgovOe1SmsComPropertyVO>();

        jdoc = configReader.readConfigFile(beanVO.getServiceNm());

        dsService.deleteDsServiceBean(beanVO, jdoc);

        model.addAttribute("beanVO", vo);

        return "forward:/ole/sms/selectDsServiceBeanList.sms";
    }

    /**
     * DataSource 설정 신규 입력 화면 이동
     * @param EgovOe1SmsComBeanVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/insertNewDsServiceBeanView.sms")
    public String insertNewDsServiceBeanView(
            @ModelAttribute("beanVO") EgovOe1SmsComBeanVO beanVO, ModelMap model)
            throws Exception {

        List jdbcDs_List =
            pInfoService
                .getPropertyInfo("org.springframework.jdbc.datasource.DriverManagerDataSource");
        List dbcpDs_List =
            pInfoService
                .getPropertyInfo("org.apache.commons.dbcp.BasicDataSource");
        List c3Ds_List =
            pInfoService
                .getPropertyInfo("com.mchange.v2.c3p0.ComboPooledDataSource");
        List jndiDs_List =
            pInfoService
                .getPropertyInfo("org.springframework.jndi.JndiObjectFactoryBean");

        String jdbcDs = makeHtmlString(jdbcDs_List);
        String dbcpDs = makeHtmlString(dbcpDs_List);
        String c3Ds = makeHtmlString(c3Ds_List);
        String jndiDs = makeHtmlString(jndiDs_List);

        model.addAttribute("jdbcDs", jdbcDs);
        model.addAttribute("dbcpDs", dbcpDs);
        model.addAttribute("c3Ds", c3Ds);
        model.addAttribute("jndiDs", jndiDs);

        return "datasource/EgovSmsDataSourceRegist";
    }

    /**
     * DataSource 설정 신규 입력
     * @param EgovOe1SmsComBeanVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/insertNewDsServiceBean.sms")
    public String insertNewDsServiceBean(
            @ModelAttribute("beanVO") EgovOe1SmsComBeanVO beanVO, ModelMap model)
            throws Exception {

        Document jdoc = null;
        EgovOe1SmsComBeanVO vo = new EgovOe1SmsComBeanVO();

        int i = 0;
        int size = 0;

        List<EgovOe1SmsComBeanVO> list = new ArrayList<EgovOe1SmsComBeanVO>();
        List<EgovOe1SmsComPropertyVO> list_property =
            new ArrayList<EgovOe1SmsComPropertyVO>();

        jdoc = configReader.readConfigFile(beanVO.getServiceNm());

        int result = dsService.insertNewDsServiceBean(beanVO, jdoc);
        
        if (result < 1) {
            model.addAttribute("beanVO", vo);

            return "forward:/ole/sms/selectDsServiceBean.sms";
        } else {
            return "forward:/ole/sms/insertNewDsServiceBeanView.sms";
        }
        
       

       
    }

    /**
     * DataSource 서비스 신규 입력화면 이동
     * @param EgovOe1SmsComBeanVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/insertNewDsServiceView.sms")
    public String insertNewDsServiceView(
            @ModelAttribute("beanVO") EgovOe1SmsComBeanVO beanVO, ModelMap model)
            throws Exception {

        List jdbcDs_List =
            pInfoService
                .getPropertyInfo("org.springframework.jdbc.datasource.DriverManagerDataSource");
        List dbcpDs_List =
            pInfoService
                .getPropertyInfo("org.apache.commons.dbcp.BasicDataSource");
        List c3Ds_List =
            pInfoService
                .getPropertyInfo("com.mchange.v2.c3p0.ComboPooledDataSource");
        List jndiDs_List =
            pInfoService
                .getPropertyInfo("org.springframework.jndi.JndiObjectFactoryBean");

        String jdbcDs = makeHtmlString(jdbcDs_List);
        String dbcpDs = makeHtmlString(dbcpDs_List);
        String c3Ds = makeHtmlString(c3Ds_List);
        String jndiDs = makeHtmlString(jndiDs_List);

        model.addAttribute("jdbcDs", jdbcDs);
        model.addAttribute("dbcpDs", dbcpDs);
        model.addAttribute("c3Ds", c3Ds);
        model.addAttribute("jndiDs", jndiDs);

        return "datasource/EgovSmsDataSourceNewRegist";
    }

    /**
     * DataSource 서비스 신규 입력
     * @param EgovOe1SmsComBeanVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/insertNewDsService.sms")
    public String insertNewDsService(
            @ModelAttribute("beanVO") EgovOe1SmsComBeanVO beanVO, ModelMap model)
            throws Exception {

        Document jdoc = null;
        EgovOe1SmsComBeanVO vo = new EgovOe1SmsComBeanVO();

        jdoc = configReader.readConfigFile(beanVO.getServiceNm());

        dsService.insertNewDsService(beanVO);

        model.addAttribute("beanVO", vo);

        return "forward:/ole/sms/selectDsServiceBean.sms";
    }

    /**
     * List를 읽어서 selectBox 로 뿌릴수 있는 형태로 변환
     * @param List
     * @return String
     * @exception Exception
     */
    private String makeHtmlString(List result_List) throws Exception {

        String htmlString = "";
        String tempString = "";

        for (int i = 0; i < result_List.size(); i++) {
            tempString += "\"" + result_List.get(i) + "\",";
        }
        htmlString = tempString.substring(0, tempString.lastIndexOf(","));

        return htmlString;
    }

}
