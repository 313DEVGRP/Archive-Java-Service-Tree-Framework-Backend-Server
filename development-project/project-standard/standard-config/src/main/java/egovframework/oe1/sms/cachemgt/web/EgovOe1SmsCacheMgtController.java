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
package egovframework.oe1.sms.cachemgt.web;

import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.oe1.sms.cachemgt.service.EgovOe1SmsCacheMgtService;
import egovframework.oe1.sms.cachemgt.service.EgovOe1SmsCacheMgtVO;

/**
 * 캐시 관리를 위한 Controller 클래스
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
public class EgovOe1SmsCacheMgtController {

    /** EgovSampleService */
    @Resource(name = "cacheMgtService")
    private EgovOe1SmsCacheMgtService cacheMgtService;

    /**
     * 캐시 입력 등록 화면 이동
     * @param EgovOe1SmsCacheMgtVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/insertCacheMgtRegistView.sms")
    public String insertCacheMgtRegistView(
            @ModelAttribute("mgtVO") EgovOe1SmsCacheMgtVO mgtVo, ModelMap model)
            throws Exception {

        return "cachemgt/EgovSmsCacheMgtRegist";
    }

    /**
     * 캐시 삭제 화면 이동
     * @param EgovOe1SmsCacheMgtVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/removeCacheMgtView.sms")
    public String removeCacheMgtView(
            @ModelAttribute("mgtVO") EgovOe1SmsCacheMgtVO mgtVo, ModelMap model)
            throws Exception {

        return "cachemgt/EgovSmsCacheMgtDelete";
    }

    /**
     * 캐시 조회 화면 이동
     * @param EgovOe1SmsCacheMgtVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/selectCacheMgtView.sms")
    public String selectCacheMgtView(
            @ModelAttribute("mgtVO") EgovOe1SmsCacheMgtVO mgtVo, ModelMap model)
            throws Exception {

        return "cachemgt/EgovSmsCacheMgtSelect";
    }

    /**
     * 캐시 리로딩 화면 이동
     * @param EgovOe1SmsCacheMgtVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/reloadCacheMgtView.sms")
    public String reloadCacheMgtView(
            @ModelAttribute("mgtVO") EgovOe1SmsCacheMgtVO mgtVo, ModelMap model)
            throws Exception {

        return "cachemgt/EgovSmsCacheMgtReload";
    }

    /**
     * 캐시 등록 템플릿 생성
     * @param EgovOe1SmsCacheMgtVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/insertCacheMgtRegist.sms")
    public void insertCacheMgtRegist(
            @ModelAttribute("mgtVO") EgovOe1SmsCacheMgtVO mgtVo,
            HttpServletResponse response, ModelMap model) throws Exception {
        String codeTemplate = "";

        codeTemplate = cacheMgtService.insertCacheMgtRegist(mgtVo);

        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.println(codeTemplate);
    }

    /**
     * 캐시 삭제 템플릿 생성
     * @param EgovOe1SmsCacheMgtVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/removeCacheMgt.sms")
    public void removeCacheMgt(
            @ModelAttribute("mgtVO") EgovOe1SmsCacheMgtVO mgtVo,
            HttpServletResponse response, ModelMap model) throws Exception {
        String codeTemplate = "";

        codeTemplate = cacheMgtService.deleteCacheMgt(mgtVo);

        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.println(codeTemplate);
    }

    /**
     * 캐시 조회 템플릿 생성
     * @param EgovOe1SmsCacheMgtVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/selectCacheMgt.sms")
    public void selectCacheMgt(
            @ModelAttribute("mgtVO") EgovOe1SmsCacheMgtVO mgtVo,
            HttpServletResponse response, ModelMap model) throws Exception {
        String codeTemplate = "";

        codeTemplate = cacheMgtService.selectCacheMgt(mgtVo);

        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.println(codeTemplate);
    }

    /**
     * 캐시 리로딩 템플릿 생성
     * @param EgovOe1SmsCacheMgtVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/reloadCacheMgt.sms")
    public void reloadCacheMgt(
            @ModelAttribute("mgtVO") EgovOe1SmsCacheMgtVO mgtVo,
            HttpServletResponse response, ModelMap model) throws Exception {
        String codeTemplate = "";

        codeTemplate = cacheMgtService.reloadCacheMgt(mgtVo);

        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.println(codeTemplate);
    }
}
