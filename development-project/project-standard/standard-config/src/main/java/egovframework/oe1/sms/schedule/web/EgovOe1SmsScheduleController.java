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
package egovframework.oe1.sms.schedule.web;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jdom.Document;
import org.jdom.Namespace;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.oe1.sms.com.file.EgovOe1SmsConfigReader;
import egovframework.oe1.sms.com.service.EgovOe1SmsComBeanVO;
import egovframework.oe1.sms.com.service.EgovOe1SmsComPropertyVO;
import egovframework.oe1.sms.com.service.EogvOe1SmsComPorpertyInfoService;
import egovframework.oe1.sms.schedule.service.EgovOe1SmsScheduleService;
import egovframework.oe1.sms.schedule.service.EgovOe1SmsSchedulerVO;
import egovframework.oe1.sms.schedule.service.EgovOe1SmsSchedulingService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * 스케줄 서비스 설정관리를 위한 Controller 클래스
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
public class EgovOe1SmsScheduleController {

    /** EgovOe1SmsScheduleService */
    @Resource(name = "scheService")
    private EgovOe1SmsScheduleService scheduleService;

    /** EgovOe1SmsSchedulingService */
    @Resource(name = "schedulingService")
    private EgovOe1SmsSchedulingService schedulingService;

    /** EgovOe1SmsConfigReader */
    @Resource(name = "configReader")
    private EgovOe1SmsConfigReader configReader;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    /** EogvOe1SmsComPorpertyInfoService */
    @Resource(name = "porpertyInfoService")
    private EogvOe1SmsComPorpertyInfoService pInfoService;

    /**
     * 스케줄 설정 목록 조회
     * @param EgovOe1SmsComBeanVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/selectScheduleServiceList.sms")
    public String selectScheduleServiceList(
            @ModelAttribute("beanVO") EgovOe1SmsComBeanVO beanVO, ModelMap model)
            throws Exception {

        Document jdoc = null;
        Namespace schemaNamespace = null;
        beanVO.setServiceNm("schedule");
        String oldBeanId = "";

        jdoc = configReader.readConfigFile(beanVO.getServiceNm());

        List<EgovOe1SmsComBeanVO> list = new ArrayList<EgovOe1SmsComBeanVO>();

        list =
            scheduleService.selectScheduleServiceList(beanVO, jdoc,
                schemaNamespace);

        for (int i = 0; i < list.size(); i++) {
            oldBeanId = oldBeanId + list.get(i).getBeanNm() + ":";
        }

        model.addAttribute("oldBeanID", oldBeanId);
        model.addAttribute("bean_list", list);

        return "schedule/EgovSmsScheduleList";
    }

    /**
     * 스케줄 설정 상세 조회
     * @param EgovOe1SmsComBeanVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/selectScheduleService.sms")
    public String selectScheduleService(
            @ModelAttribute("beanVO") EgovOe1SmsComBeanVO beanVO, ModelMap model)
            throws Exception {

        List JobDetailBean_List =
            pInfoService
                .getPropertyInfo("org.springframework.scheduling.quartz.JobDetailBean");
        List simpleTrigger_List =
            pInfoService
                .getPropertyInfo("org.springframework.scheduling.quartz.SimpleTriggerBean");
        List cronTrigger_List =
            pInfoService
                .getPropertyInfo("org.springframework.scheduling.quartz.CronTriggerBean");
        List method_List =
            pInfoService
                .getPropertyInfo("org.springframework.scheduling.quartz.MethodInvokingJobDetailFactoryBean");
        List factory_List =
            pInfoService
                .getPropertyInfo("org.springframework.scheduling.quartz.SchedulerFactoryBean");

        String JobDetailBean = makeHtmlString(JobDetailBean_List);
        String simpleTrigger = makeHtmlString(simpleTrigger_List);
        String cronTrigger = makeHtmlString(cronTrigger_List);
        String method = makeHtmlString(method_List);
        String factory = makeHtmlString(factory_List);

        Document jdoc = null;
        EgovOe1SmsComBeanVO vo = new EgovOe1SmsComBeanVO();

        jdoc = configReader.readConfigFile(beanVO.getServiceNm());
        vo = scheduleService.selectScheduleService(beanVO, jdoc);

        List list_vo = pInfoService.getPropertyInfoVo(vo.getBeanClassNm());

        model.addAttribute("bean_list", vo.getProperties());
        model.addAttribute("beanVO", vo);

        model.addAttribute("list_vo", list_vo);
        model.addAttribute("JobDetailBean", JobDetailBean);
        model.addAttribute("simpleTrigger", simpleTrigger);
        model.addAttribute("cronTrigger", cronTrigger);
        model.addAttribute("method", method);
        model.addAttribute("factory", factory);

        if (vo.getBeanClassNm().trim().contains("SchedulerFactoryBean")) {
            return "schedule/EgovSmsScheduleFactDetail";
        } else if (vo.getBeanClassNm().trim().contains("JobDetailBean")) {
            return "schedule/EgovSmsScheduleJobDetail";
        } else {
            model.addAttribute("list_vo", list_vo);
        }

        return "schedule/EgovSmsScheduleDetail";
    }

    /**
     * 스케줄 설정 수정
     * @param EgovOe1SmsComBeanVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/updateScheduleService.sms")
    public String updateScheduleService(
            @ModelAttribute("beanVO") EgovOe1SmsComBeanVO beanVO, ModelMap model)
            throws Exception {

        Document jdoc = null;
        EgovOe1SmsComBeanVO vo = new EgovOe1SmsComBeanVO();

        List<EgovOe1SmsComBeanVO> list = new ArrayList<EgovOe1SmsComBeanVO>();
        List<EgovOe1SmsComPropertyVO> list_property =
            new ArrayList<EgovOe1SmsComPropertyVO>();

        jdoc = configReader.readConfigFile(beanVO.getServiceNm());

        scheduleService.updateScheduleService(beanVO, jdoc);

        model.addAttribute("beanVO", vo);

        return "forward:/ole/sms/selectScheduleService.sms";
    }

    /**
     * 스케줄 설정 미리보기
     * @param EgovOe1SmsComBeanVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/previewDetailScheduleService.sms")
    public void previewDetailScheduleService(
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

        String preview =
            scheduleService.previewDetailScheduleService(beanVO, jdoc);

        response.setContentType("application/xml");
        PrintWriter out = response.getWriter();
        out.println(preview);
    }

    /**
     * 스케줄 설정 미리보기
     * @param EgovOe1SmsComBeanVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/previewAddNewScheduleService.sms")
    public void previewScheduleService(
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

        String preview = scheduleService.previewScheduleService(beanVO, jdoc);

        response.setContentType("application/xml");
        PrintWriter out = response.getWriter();
        out.println(preview);
    }

    /**
     * 스케줄 설정 삭제
     * @param EgovOe1SmsComBeanVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/deleteScheduleService.sms")
    public String deleteScheduleService(
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

        scheduleService.deleteServiceBean(beanVO, jdoc);

        model.addAttribute("beanVO", vo);

        return "forward:/ole/sms/selectScheduleServiceList.sms";
    }

    /**
     * 신규 스케줄 서비스 설정 입력 화면 이동
     * @param EgovOe1SmsComBeanVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/insertNewScheduleServiceView.sms")
    public String insertNewScheduleServiceView(
            @ModelAttribute("beanVO") EgovOe1SmsComBeanVO beanVO, ModelMap model)
            throws Exception {

        List JobDetailBean_List =
            pInfoService
                .getPropertyInfo("org.springframework.scheduling.quartz.JobDetailBean");
        List simpleTrigger_List =
            pInfoService
                .getPropertyInfo("org.springframework.scheduling.quartz.SimpleTriggerBean");
        List cronTrigger_List =
            pInfoService
                .getPropertyInfo("org.springframework.scheduling.quartz.CronTriggerBean");
        List method_List =
            pInfoService
                .getPropertyInfo("org.springframework.scheduling.quartz.MethodInvokingJobDetailFactoryBean");
        List factory_List =
            pInfoService
                .getPropertyInfo("org.springframework.scheduling.quartz.SchedulerFactoryBean");

        String JobDetailBean = makeHtmlString(JobDetailBean_List);
        String simpleTrigger = makeHtmlString(simpleTrigger_List);
        String cronTrigger = makeHtmlString(cronTrigger_List);
        String method = makeHtmlString(method_List);
        String factory = makeHtmlString(factory_List);

        model.addAttribute("oldBeanID", beanVO.getOldBeanId());
        model.addAttribute("JobDetailBean", JobDetailBean);
        model.addAttribute("simpleTrigger", simpleTrigger);
        model.addAttribute("cronTrigger", cronTrigger);
        model.addAttribute("method", method);
        model.addAttribute("factory", factory);

        return "schedule/EgovSmsScheduleRegist";
    }

    /**
     * 신규 스케줄 서비스 설정 저장(ADD)
     * @param EgovOe1SmsComBeanVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/addNewScheduleService.sms")
    public String addNewScheduleService(
            @ModelAttribute("beanVO") EgovOe1SmsComBeanVO beanVO, ModelMap model)
            throws Exception {

        Document jdoc = null;
        EgovOe1SmsComBeanVO vo = new EgovOe1SmsComBeanVO();
        jdoc = configReader.readConfigFile(beanVO.getServiceNm());

        scheduleService.addNewScheduleService(beanVO, jdoc);

        model.addAttribute("beanVO", vo);

        return "forward:/ole/sms/selectScheduleService.sms";
    }

    /**
     * 신규 스케줄 서비스 설정 미리보기(신규파일)
     * @param EgovOe1SmsComBeanVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/previewNewScheduleService.sms")
    public void previewNewScheduleService(
            @ModelAttribute("beanVO") EgovOe1SmsComBeanVO beanVO,
            HttpServletResponse response, ModelMap model) throws Exception {

        EgovOe1SmsComBeanVO vo = new EgovOe1SmsComBeanVO();

        String preview = scheduleService.previewNewScheduleService(beanVO);

        response.setContentType("application/xml");
        PrintWriter out = response.getWriter();
        out.println(preview);
    }

    /**
     * 신규 스케줄 서비스 빈 입력 화면 이동
     * @param EgovOe1SmsComBeanVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/insertNewScheduleView.sms")
    public String insertNewScheduleView(
            @ModelAttribute("beanVO") EgovOe1SmsComBeanVO beanVO, ModelMap model)
            throws Exception {

        List JobDetailBean_List =
            pInfoService
                .getPropertyInfo("org.springframework.scheduling.quartz.JobDetailBean");
        List simpleTrigger_List =
            pInfoService
                .getPropertyInfo("org.springframework.scheduling.quartz.SimpleTriggerBean");
        List cronTrigger_List =
            pInfoService
                .getPropertyInfo("org.springframework.scheduling.quartz.CronTriggerBean");
        List method_List =
            pInfoService
                .getPropertyInfo("org.springframework.scheduling.quartz.MethodInvokingJobDetailFactoryBean");
        List factory_List =
            pInfoService
                .getPropertyInfo("org.springframework.scheduling.quartz.SchedulerFactoryBean");

        String JobDetailBean = makeHtmlString(JobDetailBean_List);
        String simpleTrigger = makeHtmlString(simpleTrigger_List);
        String cronTrigger = makeHtmlString(cronTrigger_List);
        String method = makeHtmlString(method_List);
        String factory = makeHtmlString(factory_List);

        model.addAttribute("JobDetailBean", JobDetailBean);
        model.addAttribute("simpleTrigger", simpleTrigger);
        model.addAttribute("cronTrigger", cronTrigger);
        model.addAttribute("method", method);
        model.addAttribute("factory", factory);

        return "schedule/EgovSmsScheduleNewRegist";
    }

    /**
     * 신규 스케줄 서비스 빈 등록(파일 신규로 생성)
     * @param EgovOe1SmsComBeanVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/insertNewSchedule.sms")
    public String insertNewSchedule(
            @ModelAttribute("beanVO") EgovOe1SmsComBeanVO beanVO, ModelMap model)
            throws Exception {

        scheduleService.insertNewSchedule(beanVO);

        return "forward:/ole/sms/selectScheduleServiceList.sms";
    }

    /**
     * 스케줄링 목록 조회
     * @param EgovOe1SmsSchedulerVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/selectSchedulingList.sms")
    public String selectSchedulingList(
            @ModelAttribute("schedulingVO") EgovOe1SmsSchedulerVO schedulingVO,
            HttpServletRequest request, ModelMap model) throws Exception {

        ArrayList list = new ArrayList();

        list = schedulingService.getJobList(request);

        model.addAttribute("jobList", list);

        return "schedule/EgovSmsSchedulingList";

    }

    /**
     * 스케줄링 목록 조회
     * @param EgovOe1SmsSchedulerVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/selectScheduling.sms")
    public String selectScheduling(@RequestParam("jobName") String jobName,
            @ModelAttribute("schedulingVO") EgovOe1SmsSchedulerVO schedulingVO,
            HttpServletRequest request, ModelMap model) throws Exception {

        EgovOe1SmsSchedulerVO resultVo = new EgovOe1SmsSchedulerVO();
        resultVo = schedulingService.getJobList(request, jobName);

        model.addAttribute("resultVo", resultVo);

        return "schedule/EgovSmsSchedulingDetail";

    }

    /**
     * 스케줄링 이력 목록 조회
     * @param EgovOe1SmsSchedulerVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    @RequestMapping("/ole/sms/selectScheduleHistList.sms")
    public String selectScheduleHistList(
            @ModelAttribute("schedulingVO") EgovOe1SmsSchedulerVO schedulingVO,
            ModelMap model) throws Exception {

        /** EgovPropertyService.sample */
        schedulingVO.setPageUnit(propertiesService.getInt("pageUnit"));
        schedulingVO.setPageSize(propertiesService.getInt("pageSize"));

        /** pageing setting */
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(schedulingVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(schedulingVO.getPageUnit());
        paginationInfo.setPageSize(schedulingVO.getPageSize());

        schedulingVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        schedulingVO.setLastIndex(paginationInfo.getLastRecordIndex());
        schedulingVO.setRecordCountPerPage(paginationInfo
            .getRecordCountPerPage());

        List resultList = schedulingService.selectScheduleLogList(schedulingVO);
        model.addAttribute("hist_list", resultList);

        int totCnt =
            schedulingService.selectScheduleLogListTotCnt(schedulingVO);
        paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);

        return "schedule/EgovSmsScheduleHistList";
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
