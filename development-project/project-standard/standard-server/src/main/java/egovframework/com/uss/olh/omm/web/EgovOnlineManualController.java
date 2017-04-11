package egovframework.com.uss.olh.omm.web;

import java.util.List;
import java.util.Map;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.uss.olh.omm.service.EgovOnlineManualService;
import egovframework.com.uss.olh.omm.service.OnlineManual;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springmodules.validation.commons.DefaultBeanValidator;

/**
 * 온라인메뉴얼를 처리하는 Controller Class 구현
 * @author 공통서비스 장동한
 * @since 2009.07.03
 * @version 1.0
 * @see <pre>
 * &lt;&lt; 개정이력(Modification Information) &gt;&gt;
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.07.03  장동한          최초 생성
 *   2011.8.26	정진오			IncludedInfo annotation 추가
 *
 * </pre>
 */

@Controller
public class EgovOnlineManualController {

	private static final Logger LOGGER = LoggerFactory.getLogger(EgovOnlineManualController.class);

    @Autowired
    private DefaultBeanValidator beanValidator;

    /** EgovMessageSource */
    @Resource(name = "egovMessageSource")
    EgovMessageSource egovMessageSource;

    /** egovOnlinePollService */
    @Resource(name = "egovOnlineManualService")
    private EgovOnlineManualService egovOnlineManualService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    /** Egov Common Code Service */
    @Resource(name="EgovCmmUseService")
    private EgovCmmUseService cmmUseService;


    /**
     * 사용자 온라인메뉴얼 조회한다.
     * @param commandMap
     * @param model
     * @return
     *         "/uss/olh/omm/EgovOnlineManual"
     * @throws Exception
     */
    @RequestMapping(value = "/uss/olh/omn/setOnlineManual.do")
    public String egovOnlineManualUserDetail(
    		@RequestParam Map<?, ?> commandMap,
            ModelMap model) throws Exception {

        String sLocationUrl = "egovframework/com/uss/olh/omn/EgovOnlineManual";

        model.addAttribute("onlineMnlId", commandMap.get("onlineMnlId") == null ? "" : (String) commandMap.get("onlineMnlId"));

        return sLocationUrl;
    }

    /**
     * 사용자 온라인메뉴얼 목록을 조회한다.
     * @param searchVO
     * @param commandMap
     * @param onlineManual
     * @param model
     * @return "egovframework/com/uss/olh/omm/EgovOnlineManualList"
     * @throws Exception
     */
    @SuppressWarnings("unused")
	@IncludedInfo(name="사용자온라인매뉴얼", order = 571 ,gid = 50)
    @RequestMapping(value = "/uss/olh/omn/listOnlineManual.do")
    public String egovOnlineManualUserList(
            @ModelAttribute("searchVO") ComDefaultVO searchVO, @RequestParam Map<?, ?> commandMap,
            OnlineManual onlineManual, ModelMap model)
            throws Exception {

        String sSearchMode = commandMap.get("searchMode") == null ? "" : (String) commandMap.get("searchMode");

        /** EgovPropertyService.sample */
        searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
        searchVO.setPageSize(propertiesService.getInt("pageSize"));

        /** pageing */
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
        paginationInfo.setPageSize(searchVO.getPageSize());

        searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
        searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        List<?> reusltList = egovOnlineManualService.selectOnlineManualList(searchVO);
        model.addAttribute("resultList", reusltList);

        model.addAttribute("searchKeyword", commandMap.get("searchKeyword") == null ? "" : (String) commandMap.get("searchKeyword"));
        model.addAttribute("searchCondition", commandMap.get("searchCondition") == null ? "" : (String) commandMap.get("searchCondition"));

        int totCnt = egovOnlineManualService.selectOnlineManualListCnt(searchVO);
        paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);

        //온라인메뉴얼 구분 설정
        ComDefaultCodeVO voComCode = new ComDefaultCodeVO();
        voComCode = new ComDefaultCodeVO();
        voComCode.setCodeId("COM041");
        List<?> listComCode = cmmUseService.selectCmmCodeDetail(voComCode);
        model.addAttribute("onlineMnlSeCodeList", listComCode );

        return "egovframework/com/uss/olh/omn/EgovOnlineManualList";
    }

    /**
     * 사용자 온라인메뉴얼 목록을 상세조회 조회한다.
     * @param searchVO
     * @param onlineManual
     * @param commandMap
     * @param model
     * @return
     *         "/uss/olh/omm/EgovOnlineManualDetail"
     * @throws Exception
     */
    @SuppressWarnings("unused")
	@RequestMapping(value = "/uss/olh/omn/detailOnlineManual.do")
    public String egovOnlineManualUserDetail(
            @ModelAttribute("searchVO") ComDefaultVO searchVO,
            OnlineManual onlineManual, @RequestParam Map<?, ?> commandMap,
            ModelMap model) throws Exception {

        String sLocationUrl = "egovframework/com/uss/olh/omn/EgovOnlineManualDetail";

        String sCmd = commandMap.get("cmd") == null ? "" : (String) commandMap.get("cmd");

        //온라인메뉴얼 구분 설정
        ComDefaultCodeVO voComCode = new ComDefaultCodeVO();
        voComCode = new ComDefaultCodeVO();
        voComCode.setCodeId("COM041");
        List<?> listComCode = cmmUseService.selectCmmCodeDetail(voComCode);
        model.addAttribute("onlineMnlSeCodeList", listComCode );

        OnlineManual reusltList = egovOnlineManualService.selectOnlineManualDetail(onlineManual);
        model.addAttribute("onlineManual", reusltList);


        return sLocationUrl;
    }

    /**
     * 온라인메뉴얼 목록을 조회한다.
     * @param searchVO
     * @param commandMap
     * @param onlineManual
     * @param model
     * @return "egovframework/com/uss/olh/omm/EgovOnlineManualList"
     * @throws Exception
     */
    @SuppressWarnings("unused")
	@IncludedInfo(name="온라인매뉴얼", order = 570 ,gid = 50)
    @RequestMapping(value = "/uss/olh/omm/listOnlineManual.do")
    public String egovOnlineManualList(
            @ModelAttribute("searchVO") ComDefaultVO searchVO, @RequestParam Map<?, ?> commandMap,
            OnlineManual onlineManual, ModelMap model)
            throws Exception {

        String sSearchMode = commandMap.get("searchMode") == null ? "" : (String) commandMap.get("searchMode");

        /** EgovPropertyService.sample */
        searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
        searchVO.setPageSize(propertiesService.getInt("pageSize"));

        /** pageing */
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
        paginationInfo.setPageSize(searchVO.getPageSize());

        searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
        searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        List<?> reusltList = egovOnlineManualService.selectOnlineManualList(searchVO);
        model.addAttribute("resultList", reusltList);

        model.addAttribute("searchKeyword", commandMap.get("searchKeyword") == null ? "" : (String) commandMap.get("searchKeyword"));
        model.addAttribute("searchCondition", commandMap.get("searchCondition") == null ? "" : (String) commandMap.get("searchCondition"));

        int totCnt = egovOnlineManualService.selectOnlineManualListCnt(searchVO);
        paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);

        //온라인메뉴얼 구분 설정
        ComDefaultCodeVO voComCode = new ComDefaultCodeVO();
        voComCode = new ComDefaultCodeVO();
        voComCode.setCodeId("COM041");
        List<?> listComCode = cmmUseService.selectCmmCodeDetail(voComCode);
        model.addAttribute("onlineMnlSeCodeList", listComCode );

        return "egovframework/com/uss/olh/omm/EgovOnlineManualList";
    }

    /**
     * 온라인메뉴얼 목록을 상세조회 조회한다.
     * @param searchVO
     * @param onlineManual
     * @param commandMap
     * @param model
     * @return
     *         "/uss/olh/omm/EgovOnlineManualDetail"
     * @throws Exception
     */
    @RequestMapping(value = "/uss/olh/omm/detailOnlineManual.do")
    public String egovOnlineManualDetail(
            @ModelAttribute("searchVO") ComDefaultVO searchVO,
            OnlineManual onlineManual, @RequestParam Map<?, ?> commandMap,
            ModelMap model) throws Exception {

        String sLocationUrl = "egovframework/com/uss/olh/omm/EgovOnlineManualDetail";

        String sCmd = commandMap.get("cmd") == null ? "" : (String) commandMap.get("cmd");

        if (sCmd.equals("del")) {
            egovOnlineManualService.deleteOnlineManual(onlineManual);
            sLocationUrl = "forward:/uss/olh/omm/listOnlineManual.do";
        } else {
            //온라인메뉴얼 구분 설정
            ComDefaultCodeVO voComCode = new ComDefaultCodeVO();
            voComCode = new ComDefaultCodeVO();
            voComCode.setCodeId("COM041");
            List<?> listComCode = cmmUseService.selectCmmCodeDetail(voComCode);
            model.addAttribute("onlineMnlSeCodeList", listComCode );

            OnlineManual reusltList = egovOnlineManualService.selectOnlineManualDetail(onlineManual);
            model.addAttribute("onlineManual", reusltList);
        }

        return sLocationUrl;
    }

    /**
     * 온라인메뉴얼를 수정한다.
     * @param searchVO
     * @param commandMap
     * @param onlineManual
     * @param bindingResult
     * @param model
     * @return
     *         "/uss/olh/omm/EgovOnlineManualUpdt"
     * @throws Exception
     */
    @RequestMapping(value = "/uss/olh/omm/updtOnlineManual.do")
    public String egovOnlineManualModify(
            @ModelAttribute("searchVO") ComDefaultVO searchVO,
            @RequestParam Map<?, ?> commandMap,
            @ModelAttribute("onlineManual") OnlineManual onlineManual,
            BindingResult bindingResult, ModelMap model) throws Exception {
        // 0. Spring Security 사용자권한 처리
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        if (!isAuthenticated) {
            model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
            return "egovframework/com/uat/uia/EgovLoginUsr";
        }

        // 로그인 객체 선언
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        String sLocationUrl = "egovframework/com/uss/olh/omm/EgovOnlineManualUpdt";

        String sCmd = commandMap.get("cmd") == null ? "" : (String) commandMap.get("cmd");

        if (sCmd.equals("save")) {
            //서버  validate 체크
            beanValidator.validate(onlineManual, bindingResult);
            if(bindingResult.hasErrors()){
                return sLocationUrl;
            }
            //아이디 설정
            onlineManual.setFrstRegisterId(loginVO.getUniqId());
            onlineManual.setLastUpdusrId(loginVO.getUniqId());
            egovOnlineManualService.updateOnlineManual(onlineManual);
            sLocationUrl = "forward:/uss/olh/omm/listOnlineManual.do";
        } else {
            //온라인메뉴얼 구분 설정
            ComDefaultCodeVO voComCode = new ComDefaultCodeVO();
            voComCode = new ComDefaultCodeVO();
            voComCode.setCodeId("COM041");
            List<?> listComCode = cmmUseService.selectCmmCodeDetail(voComCode);
            model.addAttribute("onlineMnlSeCodeList", listComCode );
            //게시물 불러오기
            OnlineManual reusltList = egovOnlineManualService.selectOnlineManualDetail(onlineManual);
            model.addAttribute("onlineManual", reusltList);
        }

        return sLocationUrl;
    }

    /**
     * 온라인메뉴얼를 등록한다.
     * @param searchVO
     * @param commandMap
     * @param onlineManual
     * @param bindingResult
     * @param model
     * @return
     *         "/uss/olh/omm/EgovOnlineManualRegist"
     * @throws Exception
     */
    @RequestMapping(value = "/uss/olh/omm/registOnlineManual.do")
    public String egovOnlineManualRegist(
            @ModelAttribute("searchVO") ComDefaultVO searchVO,
            @RequestParam Map<?, ?> commandMap,
            @ModelAttribute("onlineManual") OnlineManual onlineManual,
            BindingResult bindingResult, ModelMap model) throws Exception {
        // 0. Spring Security 사용자권한 처리
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        if (!isAuthenticated) {
            model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
            return "egovframework/com/uat/uia/EgovLoginUsr";
        }

        // 로그인 객체 선언
        LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

        String sLocationUrl = "egovframework/com/uss/olh/omm/EgovOnlineManualRegist";

        String sCmd = commandMap.get("cmd") == null ? "" : (String) commandMap.get("cmd");
        LOGGER.info("cmd => {}", sCmd);

        if (sCmd.equals("save")) {
            //서버  validate 체크
            beanValidator.validate(onlineManual, bindingResult);
            if(bindingResult.hasErrors()){
                return sLocationUrl;
            }
            //아이디 설정
            onlineManual.setFrstRegisterId(loginVO.getUniqId());
            onlineManual.setLastUpdusrId(loginVO.getUniqId());
            //저장
            egovOnlineManualService.insertOnlineManual(onlineManual);
            sLocationUrl = "forward:/uss/olh/omm/listOnlineManual.do";
        } else {
            //온라인메뉴얼 구분 설정
            ComDefaultCodeVO voComCode = new ComDefaultCodeVO();
            voComCode = new ComDefaultCodeVO();
            voComCode.setCodeId("COM041");
            List<?> listComCode = cmmUseService.selectCmmCodeDetail(voComCode);
            model.addAttribute("onlineMnlSeCodeList", listComCode );
        }

        return sLocationUrl;
    }


}
