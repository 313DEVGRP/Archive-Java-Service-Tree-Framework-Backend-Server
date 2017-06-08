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
package egovframework.oe1.sms.property.web;

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
import egovframework.oe1.sms.property.service.EgovOe1SmsPropertyService;
import egovframework.oe1.sms.property.service.EgovOe1SmsPropertyVO;

/**
 * 프로퍼티 서비스 설정관리를 위한 Controller 클래스
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
public class EgovOe1SmsPropertyController {

    /** EgovSampleService */
    @Resource(name = "proService")
    private EgovOe1SmsPropertyService proService;

    @Resource(name = "configReader")
    private EgovOe1SmsConfigReader configReader;

    /**
     * 프로퍼티 설정 목록 조회
     * @param EgovOe1SmsPropertyVO
     *        ,ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/selectPropertyList.sms")
    public String selectPropertyList(
            @ModelAttribute("propertyVO") EgovOe1SmsPropertyVO propertyVO,
            ModelMap model) throws Exception {

        Document jdoc = null;
        propertyVO.setServiceNm("property");

        jdoc = configReader.readConfigFile(propertyVO.getServiceNm());

        List<EgovOe1SmsPropertyVO> list = new ArrayList<EgovOe1SmsPropertyVO>();

        list = proService.selectPropertyServiceList(propertyVO, jdoc);

        model.addAttribute("property_list", list);

        return "property/EgovSmsPropertyList";
    }

    /**
     * 프로퍼티 설정 상세
     * @param EgovOe1SmsPropertyVO
     *        ,ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/selectPropertyService.sms")
    public String selectPropertyService(
            @ModelAttribute("propertyVO") EgovOe1SmsPropertyVO propertyVO,
            ModelMap model) throws Exception {

        Document jdoc = null;
        EgovOe1SmsPropertyVO vo = new EgovOe1SmsPropertyVO();

        jdoc = configReader.readConfigFile(propertyVO.getServiceNm());
        vo = proService.selectPropertyService(propertyVO, jdoc);

        model.addAttribute("entry_list", vo.getEntries());
        model.addAttribute("propertyVO", vo);

        if (vo.getExtGbn() != null && vo.getExtGbn().equals("ext")) {
            return "property/EgovSmsPropertyExtDetail";
        }

        return "property/EgovSmsPropertyDetail";
    }

    /**
     * 프로퍼티 설정 수정
     * @param EgovOe1SmsPropertyVO
     *        ,ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/updatePropertyService.sms")
    public String updatePropertyService(
            @ModelAttribute("propertyVO") EgovOe1SmsPropertyVO propertyVO,
            ModelMap model) throws Exception {

        Document jdoc = null;
        EgovOe1SmsComBeanVO vo = new EgovOe1SmsComBeanVO();

        int i = 0;
        int size = 0;

        List<EgovOe1SmsComBeanVO> list = new ArrayList<EgovOe1SmsComBeanVO>();
        List<EgovOe1SmsComPropertyVO> list_property =
            new ArrayList<EgovOe1SmsComPropertyVO>();

        jdoc = configReader.readConfigFile(propertyVO.getServiceNm());

        proService.updatePropertyService(propertyVO, jdoc);
        model.addAttribute("propertyVO", vo);

        return "forward:/ole/sms/selectPropertyService.sms";
    }

    /**
     * 프로퍼티 설정 미리보기(상세화면, 빈 추가)
     * @param EgovOe1SmsPropertyVO
     *        ,ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/previewPropertyService.sms")
    public void previewPropertyService(
            @ModelAttribute("propertyVO") EgovOe1SmsPropertyVO propertyVO,
            HttpServletResponse response, ModelMap model) throws Exception {

        Document jdoc = null;

        jdoc = configReader.readConfigFile(propertyVO.getServiceNm());

        String preview = proService.previewPropertyService(propertyVO, jdoc);

        response.setContentType("application/xml");
        PrintWriter out = response.getWriter();
        out.println(preview);
    }

    /**
     * 프로퍼티 설정 미리보기(신규 파일 생성)
     * @param EgovOe1SmsPropertyVO
     *        ,ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/previewNewPropertyService.sms")
    public void previewNewPropertyService(
            @ModelAttribute("propertyVO") EgovOe1SmsPropertyVO propertyVO,
            HttpServletResponse response, ModelMap model) throws Exception {

        String preview = proService.previewNewPropertyService(propertyVO);

        response.setContentType("application/xml");
        PrintWriter out = response.getWriter();
        out.println(preview);
    }

    /**
     * 신규 프로퍼티 설정 입력 화면 이동
     * @param EgovOe1SmsPropertyVO
     *        ,ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/insertNewPropertyBeanView.sms")
    public String insertNewPropertyBeanView(
            @ModelAttribute("propertyVO") EgovOe1SmsPropertyVO propertyVO,
            ModelMap model) throws Exception {
        
        Document jdoc = null;
        propertyVO.setServiceNm("property");
        jdoc = configReader.readConfigFile(propertyVO.getServiceNm());
        List<EgovOe1SmsPropertyVO> list = new ArrayList<EgovOe1SmsPropertyVO>();
        list = proService.selectPropertyServiceList(propertyVO, jdoc);
        
        EgovOe1SmsPropertyVO propertyTempVO = new EgovOe1SmsPropertyVO();
        if(list.size() > 0){
            propertyTempVO =  list.get(0);            
            propertyVO.setBeanNm(propertyTempVO.getBeanNm());
        }
        
        propertyVO
            .setBeanClassNm("egovframework.rte.fdl.property.impl.EgovPropertyServiceImpl");

        return "property/EgovSmsPropertyRegist";
    }

    /**
     * 신규 프로퍼티 서비스 설정 입력 화면 이동
     * @param EgovOe1SmsPropertyVO
     *        ,ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/insertNewPropertyServiceView.sms")
    public String insertNewPropertyServiceView(
            @ModelAttribute("propertyVO") EgovOe1SmsPropertyVO propertyVO,
            ModelMap model) throws Exception {
        propertyVO
            .setBeanClassNm("egovframework.rte.fdl.property.impl.EgovPropertyServiceImpl");

        return "property/EgovSmsPropertyNewRegist";
    }

    /**
     * 신규 프로퍼티 서비스 설정 입력
     * @param EgovOe1SmsPropertyVO
     *        ,ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/insertNewPropertyBean.sms")
    public String insertNewPropertyBean(
            @ModelAttribute("propertyVO") EgovOe1SmsPropertyVO propertyVO,
            ModelMap model) throws Exception {

        Document jdoc = null;
        EgovOe1SmsComBeanVO vo = new EgovOe1SmsComBeanVO();

        jdoc = configReader.readConfigFile(propertyVO.getServiceNm());
        int result = proService.insertNewPropertyServiceBean(propertyVO, jdoc);

        if (result < 1) {
            model.addAttribute("propertyVO", vo);

            return "forward:/ole/sms/selectPropertyService.sms";
        } else {
            return "property/EgovSmsPropertyRegist";
        }
    }

    @RequestMapping("/ole/sms/insertNewProperty.sms")
    public String insertNewProperty(
            @ModelAttribute("propertyVO") EgovOe1SmsPropertyVO propertyVO,
            ModelMap model) throws Exception {

        Document jdoc = null;
        EgovOe1SmsComBeanVO vo = new EgovOe1SmsComBeanVO();

        jdoc = configReader.readConfigFile(propertyVO.getServiceNm());
        proService.insertNewPropertyService(propertyVO);

        model.addAttribute("propertyVO", vo);

        return "forward:/ole/sms/selectPropertyService.sms";
    }

    /**
     * 프로퍼티 설정 삭제
     * @param EgovOe1SmsPropertyVO
     *        ,ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/deletePropertyServiceBean.sms")
    public String deletePropertyServiceBean(
            @ModelAttribute("propertyVO") EgovOe1SmsPropertyVO propertyVO,
            ModelMap model) throws Exception {

        Document jdoc = null;
        EgovOe1SmsComBeanVO vo = new EgovOe1SmsComBeanVO();

        jdoc = configReader.readConfigFile(propertyVO.getServiceNm());

        proService.deleteServiceBean(propertyVO, jdoc);
        model.addAttribute("propertyVO", vo);

        return "forward:/ole/sms/selectPropertyList.sms";
    }

}
