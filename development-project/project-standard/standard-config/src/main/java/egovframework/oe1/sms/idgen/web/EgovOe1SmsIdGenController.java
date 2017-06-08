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
package egovframework.oe1.sms.idgen.web;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.jdom.Document;
import org.jdom.Namespace;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.oe1.sms.com.file.EgovOe1SmsConfigReader;
import egovframework.oe1.sms.com.service.EgovOe1SmsComBeanVO;
import egovframework.oe1.sms.com.service.EgovOe1SmsComPropertyVO;
import egovframework.oe1.sms.com.service.EogvOe1SmsComPorpertyInfoService;
import egovframework.oe1.sms.idgen.service.EgovOe1SmsIdGenService;

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
public class EgovOe1SmsIdGenController {

    /** EgovSampleService */
    @Resource(name = "idGenService")
    private EgovOe1SmsIdGenService idGenService;

    /** EgovOe1SmsConfigReader */
    @Resource(name = "configReader")
    private EgovOe1SmsConfigReader configReader;

    /** EogvOe1SmsComPorpertyInfoService */
    @Resource(name = "porpertyInfoService")
    private EogvOe1SmsComPorpertyInfoService pInfoService;

    /** Logger */
    Logger log = Logger.getLogger(this.getClass());

    /**
     * ID Gen 설정 목록 조회
     * @param EgovOe1SmsComBeanVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/selectIdGenServiceBeanList.sms")
    public String selectIdGenServiceBeanList(
            @ModelAttribute("beanVO") EgovOe1SmsComBeanVO beanVO, ModelMap model)
            throws Exception {

        Document jdoc = null;
        beanVO.setServiceNm("idGen");

        jdoc = configReader.readConfigFile(beanVO.getServiceNm());

        List<EgovOe1SmsComBeanVO> list = new ArrayList<EgovOe1SmsComBeanVO>();

        list = idGenService.selectIdGenServiceBeanList(beanVO, jdoc);
        model.addAttribute("bean_list", list);

        return "idgen/EgovSmsIdGenList";
    }

    /**
     * ID Gen 설정 상세 조회
     * @param EgovOe1SmsComBeanVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/selectIdGenServiceBean.sms")
    public String selectIdGenServiceBean(
            @ModelAttribute("beanVO") EgovOe1SmsComBeanVO beanVO, ModelMap model)
            throws Exception {

        Document jdoc = null;
        EgovOe1SmsComBeanVO vo = new EgovOe1SmsComBeanVO();

        List<EgovOe1SmsComBeanVO> list = new ArrayList<EgovOe1SmsComBeanVO>();
        List<EgovOe1SmsComPropertyVO> list_property =
            new ArrayList<EgovOe1SmsComPropertyVO>();

        List tableIdGnr_List =
            pInfoService
                .getPropertyInfo("egovframework.rte.fdl.idgnr.impl.EgovTableIdGnrService");
        List sequenceIdGnr_List =
            pInfoService
                .getPropertyInfo("egovframework.rte.fdl.idgnr.impl.EgovSequenceIdGnrService");
        List uUIdGnr_List =
            pInfoService
                .getPropertyInfo("egovframework.rte.fdl.idgnr.impl.EgovUUIdGnrService");
        List stretegy_List =
            pInfoService
                .getPropertyInfo("egovframework.rte.fdl.idgnr.impl.strategy.EgovIdGnrStrategyImpl");

        jdoc = configReader.readConfigFile(beanVO.getServiceNm());

        vo = idGenService.selectIdGenServiceBean(beanVO, jdoc);

        List list_vo = pInfoService.getPropertyInfoVo(vo.getBeanClassNm());

        String tableIdGen = makeHtmlString(tableIdGnr_List);
        String seqIdGen = makeHtmlString(sequenceIdGnr_List);
        String uuIdGen = makeHtmlString(uUIdGnr_List);
        String stretegy = makeHtmlString(stretegy_List);

        model.addAttribute("bean_list", vo.getProperties());
        model.addAttribute("beanVO", vo);
        model.addAttribute("list_vo", list_vo);
        model.addAttribute("tableIdGen", tableIdGen);
        model.addAttribute("seqIdGen", seqIdGen);
        model.addAttribute("uuIdGen", uuIdGen);
        model.addAttribute("stretegy", stretegy);

        return "idgen/EgovSmsIdGenDetail";
    }

    /**
     * ID Gen 설정 수정
     * @param EgovOe1SmsComBeanVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/updateIdGenServiceBean.sms")
    public String updateIdGenServiceBean(
            @ModelAttribute("beanVO") EgovOe1SmsComBeanVO beanVO, ModelMap model)
            throws Exception {

        Document jdoc = null;
        EgovOe1SmsComBeanVO vo = new EgovOe1SmsComBeanVO();

        List<EgovOe1SmsComBeanVO> list = new ArrayList<EgovOe1SmsComBeanVO>();
        List<EgovOe1SmsComPropertyVO> list_property =
            new ArrayList<EgovOe1SmsComPropertyVO>();

        jdoc = configReader.readConfigFile(beanVO.getServiceNm());

        idGenService.updateIdGenServiceBean(beanVO, jdoc);

        model.addAttribute("beanVO", vo);

        return "forward:/ole/sms/selectIdGenServiceBean.sms";
    }

    /**
     * ID Gen 설정 미리보기 (상세화면 미리보기)
     * @param EgovOe1SmsComBeanVO
     *        , HttpServletResponse, ModelMap
     * @return void
     * @exception Exception
     */
    @RequestMapping("/ole/sms/previewIdGenServiceBean.sms")
    public void previewIdGenServiceBean(
            @ModelAttribute("beanVO") EgovOe1SmsComBeanVO beanVO,
            HttpServletResponse response, ModelMap model) throws Exception {

        log.debug("===========  previewIdGenServiceBean START ===========");

        Document jdoc = null;

        jdoc = configReader.readConfigFile(beanVO.getServiceNm());

        String preview = idGenService.previewIdGenServiceBean(beanVO, jdoc);

        response.setContentType("application/xml");
        PrintWriter out = response.getWriter();
        out.println(preview);

        log.debug("===========  previewIdGenServiceBean END ===========");
    }

    /**
     * ID Gen 설정 미리보기 (상세화면 미리보기)
     * @param EgovOe1SmsComBeanVO
     *        , HttpServletResponse, ModelMap
     * @return void
     * @exception Exception
     */
    @RequestMapping("/ole/sms/previewNewIdGenService.sms")
    public void previewNewIdGenService(
            @ModelAttribute("beanVO") EgovOe1SmsComBeanVO beanVO,
            HttpServletResponse response, ModelMap model) throws Exception {

        log.debug("===========  previewNewIdGenService START ===========");

        String preview = idGenService.previewNewIdGenService(beanVO);

        response.setContentType("application/xml");
        PrintWriter out = response.getWriter();
        out.println(preview);

        log.debug("===========  previewNewIdGenService END ===========");
    }

    /**
     * ID Gen 설정 삭제
     * @param EgovOe1SmsComBeanVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/deleteIdGenServiceBean.sms")
    public String deleteIdGenServiceBean(
            @ModelAttribute("beanVO") EgovOe1SmsComBeanVO beanVO, ModelMap model)
            throws Exception {

        Document jdoc = null;
        EgovOe1SmsComBeanVO vo = new EgovOe1SmsComBeanVO();

        List<EgovOe1SmsComBeanVO> list = new ArrayList<EgovOe1SmsComBeanVO>();
        List<EgovOe1SmsComPropertyVO> list_property =
            new ArrayList<EgovOe1SmsComPropertyVO>();

        jdoc = configReader.readConfigFile(beanVO.getServiceNm());

        idGenService.deleteServiceBean(beanVO, jdoc);

        model.addAttribute("beanVO", vo);

        return "forward:/ole/sms/selectIdGenServiceBeanList.sms";
    }

    /**
     * ID Gen 설정 신규 입력 화면 이동
     * @param EgovOe1SmsComBeanVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/insertNewIdGenServiceBeanView.sms")
    public String insertNewIdGenServiceBeanView(
            @ModelAttribute("beanVO") EgovOe1SmsComBeanVO beanVO, ModelMap model)
            throws Exception {

        List tableIdGnr_List =
            pInfoService
                .getPropertyInfo("egovframework.rte.fdl.idgnr.impl.EgovTableIdGnrService");
        List sequenceIdGnr_List =
            pInfoService
                .getPropertyInfo("egovframework.rte.fdl.idgnr.impl.EgovSequenceIdGnrService");
        List uUIdGnr_List =
            pInfoService
                .getPropertyInfo("egovframework.rte.fdl.idgnr.impl.EgovUUIdGnrService");
        List stretegy_List =
            pInfoService
                .getPropertyInfo("egovframework.rte.fdl.idgnr.impl.strategy.EgovIdGnrStrategyImpl");

        List tableIdGnr_List_vo =
            pInfoService
                .getPropertyInfoVo("egovframework.rte.fdl.idgnr.impl.EgovTableIdGnrService");

        String tableIdGen = makeHtmlString(tableIdGnr_List);
        String seqIdGen = makeHtmlString(sequenceIdGnr_List);
        String uuIdGen = makeHtmlString(uUIdGnr_List);
        String stretegy = makeHtmlString(stretegy_List);

        model.addAttribute("tableIdGen", tableIdGen);
        model.addAttribute("seqIdGen", seqIdGen);
        model.addAttribute("uuIdGen", uuIdGen);
        model.addAttribute("stretegy", stretegy);
        model.addAttribute("table_list", tableIdGnr_List_vo);

        return "idgen/EgovSmsIdGenRegist";
    }

    /**
     * ID Gen 설정 신규 입력
     * @param EgovOe1SmsComBeanVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/insertNewIdGenServiceBean.sms")
    public String insertNewIdGenServiceBean(
            @ModelAttribute("beanVO") EgovOe1SmsComBeanVO beanVO, ModelMap model)
            throws Exception {

        Document jdoc = null;
        EgovOe1SmsComBeanVO vo = new EgovOe1SmsComBeanVO();

        List<EgovOe1SmsComBeanVO> list = new ArrayList<EgovOe1SmsComBeanVO>();
        List<EgovOe1SmsComPropertyVO> list_property =
            new ArrayList<EgovOe1SmsComPropertyVO>();

        jdoc = configReader.readConfigFile(beanVO.getServiceNm());

        int result = idGenService.insertNewIdGenServiceBean(beanVO, jdoc);
        
        if (result < 1) {
            model.addAttribute("beanVO", vo);

            return "forward:/ole/sms/selectIdGenServiceBean.sms";
        } else {
            return "forward:/ole/sms/insertNewIdGenServiceBeanView.sms";
        }
    }

    /**
     * ID Gen 서비스 신규 입력화면 이동
     * @param EgovOe1SmsComBeanVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/insertNewIdGenServiceView.sms")
    public String insertNewIdGenServiceView(
            @ModelAttribute("beanVO") EgovOe1SmsComBeanVO beanVO, ModelMap model)
            throws Exception {

        List tableIdGnr_List =
            pInfoService
                .getPropertyInfo("egovframework.rte.fdl.idgnr.impl.EgovTableIdGnrService");
        List sequenceIdGnr_List =
            pInfoService
                .getPropertyInfo("egovframework.rte.fdl.idgnr.impl.EgovSequenceIdGnrService");
        List uUIdGnr_List =
            pInfoService
                .getPropertyInfo("egovframework.rte.fdl.idgnr.impl.EgovUUIdGnrService");
        List stretegy_List =
            pInfoService
                .getPropertyInfo("egovframework.rte.fdl.idgnr.impl.strategy.EgovIdGnrStrategyImpl");

        List tableIdGnr_List_vo =
            pInfoService
                .getPropertyInfoVo("egovframework.rte.fdl.idgnr.impl.EgovTableIdGnrService");

        String tableIdGen = makeHtmlString(tableIdGnr_List);
        String seqIdGen = makeHtmlString(sequenceIdGnr_List);
        String uuIdGen = makeHtmlString(uUIdGnr_List);
        String stretegy = makeHtmlString(stretegy_List);

        model.addAttribute("tableIdGen", tableIdGen);
        model.addAttribute("seqIdGen", seqIdGen);
        model.addAttribute("uuIdGen", uuIdGen);
        model.addAttribute("stretegy", stretegy);
        model.addAttribute("table_list", tableIdGnr_List_vo);

        return "idgen/EgovSmsIdGenNewRegist";
    }

    /**
     * ID Gen 서비스 신규 입력
     * @param EgovOe1SmsComBeanVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/insertNewIdGenService.sms")
    public String insertNewIdGenService(
            @ModelAttribute("beanVO") EgovOe1SmsComBeanVO beanVO, ModelMap model)
            throws Exception {

        Document jdoc = null;
        EgovOe1SmsComBeanVO vo = new EgovOe1SmsComBeanVO();

        jdoc = configReader.readConfigFile(beanVO.getServiceNm());

        idGenService.insertNewIdGenService(beanVO);

        model.addAttribute("beanVO", vo);

        return "forward:/ole/sms/selectIdGenServiceBean.sms";
    }

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
