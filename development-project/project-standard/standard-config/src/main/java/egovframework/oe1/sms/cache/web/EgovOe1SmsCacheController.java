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
package egovframework.oe1.sms.cache.web;

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

import egovframework.oe1.sms.cache.service.EgovOe1SmsCacheService;
import egovframework.oe1.sms.cache.service.EgovOe1SmsCacheVO;
import egovframework.oe1.sms.cache.service.EgovOe1SmsEhCacheVO;
import egovframework.oe1.sms.com.file.EgovOe1SmsConfigReader;

/**
 * 캐시 설정 관리를 위한 Controller 클래스
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
public class EgovOe1SmsCacheController {

    @Resource(name = "configReader")
    private EgovOe1SmsConfigReader configReader;

    @Resource(name = "cacheService")
    private EgovOe1SmsCacheService cacheService;

    Logger log = Logger.getLogger(this.getClass());

    /**
     * EhCache 목록 조회
     * @param EgovOe1SmsEhCacheVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/selectEhCacheList.sms")
    public String selectEhCacheList(
            @ModelAttribute("ehCacheVO") EgovOe1SmsEhCacheVO ehCacheVO,
            ModelMap model) throws Exception {

        Document jdoc = null;
        // Namespace schemaNamespace = null;
        ehCacheVO.setServiceNm("ehCache");

        jdoc = configReader.readConfigFile(ehCacheVO.getServiceNm());

        List<EgovOe1SmsEhCacheVO> list = new ArrayList<EgovOe1SmsEhCacheVO>();

        list = cacheService.selectEhCacheList(ehCacheVO, jdoc);
        model.addAttribute("cache_list", list);

        return "cache/EgovSmsEhCacheList";
    }

    /**
     * EhCache 상세 조회
     * @param EgovOe1SmsEhCacheVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/selectEhCache.sms")
    public String selectEhCache(
            @ModelAttribute("ehCacheVO") EgovOe1SmsEhCacheVO ehCacheVO,
            ModelMap model) throws Exception {

        log.debug("selectEhCache START");
        Document jdoc = null;
        Namespace schemaNamespace = null;
        ehCacheVO.setServiceNm("ehCache");

        jdoc = configReader.readConfigFile(ehCacheVO.getServiceNm());

        EgovOe1SmsEhCacheVO resultVO = new EgovOe1SmsEhCacheVO();

        resultVO = cacheService.selectEhCache(ehCacheVO, jdoc, schemaNamespace);

        model.addAttribute("ehCacheVO", resultVO);

        return "cache/EgovSmsEhCacheDetail";
    }

    /**
     * EhCache 수정
     * @param EgovOe1SmsEhCacheVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/updateEhCacheService.sms")
    public String updateEhCacheService(
            @ModelAttribute("ehCacheVO") EgovOe1SmsEhCacheVO ehCacheVO,
            ModelMap model) throws Exception {

        Document jdoc = null;
        Namespace schemaNamespace = null;
        ehCacheVO.setServiceNm("ehCache");
        EgovOe1SmsEhCacheVO vo = new EgovOe1SmsEhCacheVO();

        jdoc = configReader.readConfigFile(ehCacheVO.getServiceNm());

        cacheService.updateEhCacheService(ehCacheVO, jdoc, schemaNamespace);

        model.addAttribute("ehCacheVO", vo);

        return "forward:/ole/sms/selectEhCache.sms";
    }

    /**
     * EhCache 미리 보기(상세, 신규 캐시 추가)
     * @param EgovOe1SmsEhCacheVO
     *        , HttpServletResponse, ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/selectEhCachePreview.sms")
    public void selectEhCachePreview(
            @ModelAttribute("ehCacheVO") EgovOe1SmsEhCacheVO ehCacheVO,
            HttpServletResponse response, ModelMap model) throws Exception {

        Document jdoc = null;
        Namespace schemaNamespace = null;
        ehCacheVO.setServiceNm("ehCache");

        jdoc = configReader.readConfigFile(ehCacheVO.getServiceNm());

        String preview = "";

        preview =
            cacheService
                .previewEhCacheService(ehCacheVO, jdoc, schemaNamespace);

        response.setContentType("application/xml");
        PrintWriter out = response.getWriter();
        out.println(preview);

    }

    /**
     * EhCache 미리 보기 (파일 생성)
     * @param EgovOe1SmsEhCacheVO
     *        , HttpServletResponse, ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/selectNewEhCachePreview.sms")
    public void selectNewEhCachePreview(
            @ModelAttribute("ehCacheVO") EgovOe1SmsEhCacheVO ehCacheVO,
            HttpServletResponse response, ModelMap model) throws Exception {

        ehCacheVO.setServiceNm("ehCache");

        String preview = "";

        preview = cacheService.previewNewEhCacheService(ehCacheVO);

        response.setContentType("application/xml");
        PrintWriter out = response.getWriter();
        out.println(preview);

    }

    /**
     * EhCache 삭제
     * @param EgovOe1SmsEhCacheVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/deleteEhCacheService.sms")
    public String deleteEhCacheService(
            @ModelAttribute("ehCacheVO") EgovOe1SmsEhCacheVO ehCacheVO,
            HttpServletResponse response, ModelMap model) throws Exception {

        Document jdoc = null;
        Namespace schemaNamespace = null;
        EgovOe1SmsEhCacheVO vo = new EgovOe1SmsEhCacheVO();

        jdoc = configReader.readConfigFile(ehCacheVO.getServiceNm());

        cacheService.deleteEhCacheService(ehCacheVO, jdoc, schemaNamespace);

        model.addAttribute("ehCacheVO", vo);

        return "forward:/ole/sms/selectEhCacheList.sms";
    }

    /**
     * 캐시 설정 목록 조회
     * @param EgovOe1SmsCacheVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/selectCacheBeanList.sms")
    public String selectCacheBeanList(
            @ModelAttribute("beanVO") EgovOe1SmsCacheVO beanVO, ModelMap model)
            throws Exception {

        Document jdoc = null;
        // Namespace schemaNamespace = null;
        beanVO.setServiceNm("cache");

        jdoc = configReader.readConfigFile(beanVO.getServiceNm());

        List<EgovOe1SmsCacheVO> list = new ArrayList<EgovOe1SmsCacheVO>();

        list = cacheService.selectCacheListBean(beanVO, jdoc);

        beanVO.setBeanTotCount(list.size());
        model.addAttribute("cache_list", list);
        model.addAttribute("beanVO", beanVO);

        return "cache/EgovSmsCacheBeanList";
    }

    /**
     * 캐시 설정 상세 조회
     * @param EgovOe1SmsCacheVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/selectCacheBean.sms")
    public String selectCacheBean(
            @ModelAttribute("beanVO") EgovOe1SmsCacheVO beanVO, ModelMap model)
            throws Exception {
        log.debug("selectCacheBean START");
        Document jdoc = null;
        // Namespace schemaNamespace = null;
        EgovOe1SmsCacheVO vo = new EgovOe1SmsCacheVO();

        int i = 0;
        int size = 0;

        List<EgovOe1SmsCacheVO> list = new ArrayList<EgovOe1SmsCacheVO>();

        jdoc = configReader.readConfigFile(beanVO.getServiceNm());

        vo = cacheService.selectCacheServiceBean(beanVO, jdoc);

        model.addAttribute("beanVO", vo);

        return "cache/EgovSmsCacheDetail";
    }

    /**
     * 캐시 설정 미리보기
     * @param EgovOe1SmsCacheVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/selectCachePreview.sms")
    public void selectCachePreview(
            @ModelAttribute("beanVO") EgovOe1SmsCacheVO beanVO,
            HttpServletResponse response, ModelMap model) throws Exception {

        Document jdoc = null;
        // Namespace schemaNamespace = null;
        beanVO.setServiceNm("cache");

        jdoc = configReader.readConfigFile(beanVO.getServiceNm());

        String preview = "";

        preview = cacheService.previewCacheService(beanVO, jdoc);

        response.setContentType("application/xml");
        PrintWriter out = response.getWriter();
        out.println(preview);

    }

    /**
     * 캐시 설정 미리보기(신규 입력)
     * @param EgovOe1SmsCacheVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/selectNewCachePreview.sms")
    public void selectNewCachePreview(
            @ModelAttribute("beanVO") EgovOe1SmsCacheVO beanVO,
            HttpServletResponse response, ModelMap model) throws Exception {

        // Namespace schemaNamespace = null;
        beanVO.setServiceNm("cache");

        String preview = "";

        preview = cacheService.previewNewCacheService(beanVO);

        response.setContentType("application/xml");
        PrintWriter out = response.getWriter();
        out.println(preview);

    }

    /**
     * 캐시 설정 수정
     * @param EgovOe1SmsCacheVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/updateCacheService.sms")
    public String updateCacheServiceBean(
            @ModelAttribute("beanVO") EgovOe1SmsCacheVO beanVO, ModelMap model)
            throws Exception {

        Document jdoc = null;
        // Namespace schemaNamespace = null;
        beanVO.setServiceNm("cache");
        EgovOe1SmsEhCacheVO vo = new EgovOe1SmsEhCacheVO();

        jdoc = configReader.readConfigFile(beanVO.getServiceNm());

        cacheService.updateCacheService(beanVO, jdoc);

        model.addAttribute("beanVO", vo);

        return "forward:/ole/sms/selectCacheBean.sms";
    }

    /**
     * 캐시 설정 삭제
     * @param EgovOe1SmsCacheVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/deleteCacheService.sms")
    public String deleteCacheService(
            @ModelAttribute("beanVO") EgovOe1SmsCacheVO beanVO, ModelMap model)
            throws Exception {

        Document jdoc = null;
        Namespace schemaNamespace = null;
        EgovOe1SmsCacheVO vo = new EgovOe1SmsCacheVO();

        jdoc = configReader.readConfigFile(beanVO.getServiceNm());

        cacheService.deleteCacheService(beanVO, jdoc, schemaNamespace);

        model.addAttribute("beanVO", vo);

        return "forward:/ole/sms/selectCacheBeanList.sms";
    }

    /**
     * 캐시 입력 화면 이동
     * @param EgovOe1SmsCacheVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/insertCacheServiceView.sms")
    public String insertCacheServiceView(
            @ModelAttribute("beanVO") EgovOe1SmsCacheVO beanVO, ModelMap model)
            throws Exception {

        beanVO
            .setBeanClassNm("org.springframework.cache.ehcache.EhCacheFactoryBean");
        beanVO
            .setSubBeanClassNm("org.springframework.cache.ehcache.EhCacheManagerFactoryBean");
        beanVO.setPropertyNm("cacheManager");
        beanVO.setPropertyNm("cacheManager");
        beanVO.setSubPropertyNm("configLocation");

        return "cache/EgovSmsCacheRegist";
    }

    /**
     * 캐시 설정 입력
     * @param EgovOe1SmsCacheVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/insertNewCacheService.sms")
    public String insertNewCacheService(
            @ModelAttribute("beanVO") EgovOe1SmsCacheVO beanVO, ModelMap model)
            throws Exception {

        // Namespace schemaNamespace = null;

        cacheService.insertNewCacheBean(beanVO);

        return "forward:/ole/sms/selectCacheBean.sms";
    }

    /**
     * Eh 캐시 설정 입력 화면 이동
     * @param EgovOe1SmsEhCacheVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/insertNewEhCacheServicesView.sms")
    public String insertNewEhCacheServiceView(
            @ModelAttribute("ehCacheVO") EgovOe1SmsEhCacheVO ehCacheVO,
            ModelMap model) throws Exception {

        return "cache/EgovSmsEhCacheNewRegist";
    }

    /**
     * 신규 EhCache 서비스 저장
     * @param EgovOe1SmsEhCacheVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/saveNewEhCacheServices.sms")
    public String saveNewEhCacheServices(
            @ModelAttribute("ehCacheVO") EgovOe1SmsEhCacheVO ehCacheVO,
            ModelMap model) throws Exception {

        Namespace schemaNamespace = null;
        ehCacheVO.setServiceNm("ehCache");
        EgovOe1SmsEhCacheVO vo = new EgovOe1SmsEhCacheVO();

        cacheService.saveNewEhCacheServices(ehCacheVO);

        model.addAttribute("ehCacheVO", vo);

        return "forward:/ole/sms/selectEhCache.sms";
    }

    /**
     * 신규 EhCache 입력화면 이동
     * @param EgovOe1SmsEhCacheVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/insertNewEhCacheView.sms")
    public String insertNewEhCacheView(
            @ModelAttribute("ehCacheVO") EgovOe1SmsEhCacheVO ehCacheVO,
            ModelMap model) throws Exception {

        return "cache/EgovSmsEhCacheRegist";
    }

    /**
     * 신규 EhCache 저장
     * @param EgovOe1SmsEhCacheVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/saveNewEhCache.sms")
    public String saveNewEhCache(
            @ModelAttribute("ehCacheVO") EgovOe1SmsEhCacheVO ehCacheVO,
            ModelMap model) throws Exception {

        Document jdoc = null;
        Namespace schemaNamespace = null;
        ehCacheVO.setServiceNm("ehCache");
        EgovOe1SmsEhCacheVO vo = new EgovOe1SmsEhCacheVO();

        jdoc = configReader.readConfigFile(ehCacheVO.getServiceNm());

        int result = cacheService.saveNewEhCache(ehCacheVO, jdoc, schemaNamespace);
        
        if (result < 1) {
            model.addAttribute("ehCacheVO", vo);

            return "forward:/ole/sms/selectEhCache.sms";
        } else {
            return "forward:/ole/sms/insertNewEhCacheView.sms";
        }
        
    }

}
