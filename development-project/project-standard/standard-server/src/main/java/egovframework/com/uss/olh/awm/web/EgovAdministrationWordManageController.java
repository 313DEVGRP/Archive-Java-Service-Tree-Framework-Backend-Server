package egovframework.com.uss.olh.awm.web;

import java.util.List;
import java.util.Map;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.uss.olh.awm.service.AdministrationWordManage;
import egovframework.com.uss.olh.awm.service.EgovAdministrationWordManageService;

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
 * 행정전문용어사전관리를 처리하는 Controller Class 구현
 * @author 공통서비스 장동한
 * @since 2009.07.03
 * @version 1.0
 * @see <pre>
 * &lt;&lt; 개정이력(Modification Information) &gt;&gt;
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.07.03  장동한          최초 생성
 *   2011.8.26	 정진오			IncludedInfo annotation 추가
 *   2011.09.19  서준식          삭제 후 리스트 상세조회시 다시 삭제되는 문제 수정
 * </pre>
 */

@Controller
public class EgovAdministrationWordManageController {

	private static final Logger LOGGER = LoggerFactory.getLogger(EgovAdministrationWordManageController.class);

    @Autowired
    private DefaultBeanValidator beanValidator;

    /** EgovMessageSource */
    @Resource(name = "egovMessageSource")
    EgovMessageSource egovMessageSource;

    /** egovOnlinePollService */
    @Resource(name = "egovAdministrationWordManageService")
    private EgovAdministrationWordManageService egovAdministrationWordManageService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    /**
     * 행정전문용어사전관리 목록을 조회한다.
     * @param searchVO
     * @param commandMap
     * @param administrationWordManage
     * @param model
     * @return "egovframework/com/uss/olh/awm/EgovAdministrationWordManageList"
     * @throws Exception
     */
    @SuppressWarnings("unused")
	@IncludedInfo(name="행정전문용어사전관리", order = 561 ,gid = 50)
    @RequestMapping(value = "/uss/olh/awm/listAdministrationWordManage.do")
    public String egovAdministrationWordManageList(
    		@RequestParam Map<?, ?> commandMap,
            @ModelAttribute("searchVO") AdministrationWordManage searchVO,
            ModelMap model)
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

        //검색 초기설정
        model.addAttribute("searchKeyword", commandMap.get("searchKeyword") == null ? "" : (String) commandMap.get("searchKeyword"));
        model.addAttribute("searchCondition", commandMap.get("searchCondition") == null ? "" : (String) commandMap.get("searchCondition"));
        //초성 검색 설정
        model.addAttribute("choseongA", commandMap.get("choseongA") == null ? "" : (String) commandMap.get("choseongA"));
        model.addAttribute("choseongB", commandMap.get("choseongB") == null ? "" : (String) commandMap.get("choseongB"));
        model.addAttribute("cmd", commandMap.get("cmd") == null ? "" : (String) commandMap.get("cmd"));

        List<?> reusltList = egovAdministrationWordManageService.selectAdministrationWordManageList(searchVO);
        model.addAttribute("resultList", reusltList);

        int totCnt = egovAdministrationWordManageService.selectAdministrationWordManageListCnt(searchVO);
        paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);

        return "egovframework/com/uss/olh/awm/EgovAdministrationWordManageList";
    }

    /**
     * 행정전문용어사전관리 목록을 상세조회 조회한다.
     * @param searchVO
     * @param administrationWordManage
     * @param commandMap
     * @param model
     * @return
     *         "/uss/olh/awm/EgovAdministrationWordManageDetail"
     * @throws Exception
     */
    @RequestMapping(value = "/uss/olh/awm/detailAdministrationWordManage.do")
    public String egovAdministrationWordManageDetail(
            @ModelAttribute("searchVO") ComDefaultVO searchVO,
            AdministrationWordManage administrationWordManage, @RequestParam Map<?, ?> commandMap,
            ModelMap model) throws Exception {

        String sLocationUrl = "egovframework/com/uss/olh/awm/EgovAdministrationWordManageDetail";

        String sCmd = commandMap.get("cmd") == null ? "" : (String) commandMap.get("cmd");

        if (sCmd.equals("del")) {
            egovAdministrationWordManageService.deleteAdministrationWordManage(administrationWordManage);
            sLocationUrl = "redirect:/uss/olh/awm/listAdministrationWordManage.do";//2011.09.19
        } else {
            AdministrationWordManage administrationWordManageVO = egovAdministrationWordManageService.selectAdministrationWordManageDetail(administrationWordManage);
            model.addAttribute("administrationWordManage", administrationWordManageVO);
        }

        return sLocationUrl;
    }

    /**
     * 행정전문용어사전관리를 수정한다.
     * @param searchVO
     * @param commandMap
     * @param administrationWordManage
     * @param bindingResult
     * @param model
     * @return
     *         "/uss/olh/awm/EgovAdministrationWordManageUpdt"
     * @throws Exception
     */
    @RequestMapping(value = "/uss/olh/awm/updtAdministrationWordManage.do")
    public String egovAdministrationWordManageModify(
            @ModelAttribute("searchVO") ComDefaultVO searchVO,
            @RequestParam Map<?, ?> commandMap,
            AdministrationWordManage administrationWordManage,
            BindingResult bindingResult, ModelMap model) throws Exception {
        // 0. Spring Security 사용자권한 처리
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        if (!isAuthenticated) {
            model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
            return "egovframework/com/uat/uia/EgovLoginUsr";
        }

        // 로그인 객체 선언
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        String sLocationUrl = "egovframework/com/uss/olh/awm/EgovAdministrationWordManageUpdt";

        String sCmd = commandMap.get("cmd") == null ? "" : (String) commandMap.get("cmd");

        if (sCmd.equals("save")) {
            //서버  validate 체크
            beanValidator.validate(administrationWordManage, bindingResult);
            if(bindingResult.hasErrors()){
                return sLocationUrl;
            }
            //아이디 설정
            administrationWordManage.setFrstRegisterId(loginVO.getUniqId());
            administrationWordManage.setLastUpdusrId(loginVO.getUniqId());

            egovAdministrationWordManageService.updateAdministrationWordManage(administrationWordManage);

            sLocationUrl = "forward:/uss/olh/awm/listAdministrationWordManage.do";
        } else {
            AdministrationWordManage administrationWordManageVO = egovAdministrationWordManageService.selectAdministrationWordManageDetail(administrationWordManage);
            model.addAttribute("administrationWordManage", administrationWordManageVO);
        }

        return sLocationUrl;
    }

    /**
     * 행정전문용어사전관리를 등록한다.
     * @param searchVO
     * @param commandMap
     * @param administrationWordManage
     * @param bindingResult
     * @param model
     * @return
     *         "/uss/olh/awm/EgovAdministrationWordManageRegist"
     * @throws Exception
     */
    @RequestMapping(value = "/uss/olh/awm/registAdministrationWordManage.do")
    public String egovAdministrationWordManageRegist(
            @ModelAttribute("searchVO") ComDefaultVO searchVO,
            @RequestParam Map<?, ?> commandMap,
            @ModelAttribute("administrationWordManage") AdministrationWordManage administrationWordManage,
            BindingResult bindingResult, ModelMap model) throws Exception {
        // 0. Spring Security 사용자권한 처리
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        if (!isAuthenticated) {
            model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
            return "egovframework/com/uat/uia/EgovLoginUsr";
        }

        // 로그인 객체 선언
        LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

        String sLocationUrl = "egovframework/com/uss/olh/awm/EgovAdministrationWordManageRegist";

        String sCmd = commandMap.get("cmd") == null ? "" : (String) commandMap.get("cmd");
        LOGGER.info("cmd => {}", sCmd);

        if (sCmd.equals("save")) {
            //서버  validate 체크
            beanValidator.validate(administrationWordManage, bindingResult);
            if(bindingResult.hasErrors()){
                return sLocationUrl;
            }
            //아이디 설정
            administrationWordManage.setFrstRegisterId(loginVO.getUniqId());
            administrationWordManage.setLastUpdusrId(loginVO.getUniqId());

            egovAdministrationWordManageService.insertAdministrationWordManage(administrationWordManage);

            sLocationUrl = "forward:/uss/olh/awm/listAdministrationWordManage.do";
        }

        return sLocationUrl;
    }


    /**
     * 행정전문용어사전 목록을 조회한다.
     * @param searchVO
     * @param commandMap
     * @param administrationWord
     * @param model
     * @return "egovframework/com/uss/olh/awm/EgovAdministrationWordList"
     * @throws Exception
     */
    @SuppressWarnings("unused")
	@IncludedInfo(name="행정전문용어사전", order = 560 ,gid = 50)
    @RequestMapping(value = "/uss/olh/awm/listAdministrationWord.do")
    public String egovAdministrationWordList(
    		@RequestParam Map<?, ?> commandMap,
            @ModelAttribute("searchVO") AdministrationWordManage searchVO,
            ModelMap model)
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

        //검색 초기설정
        model.addAttribute("searchKeyword", commandMap.get("searchKeyword") == null ? "" : (String) commandMap.get("searchKeyword"));
        model.addAttribute("searchCondition", commandMap.get("searchCondition") == null ? "" : (String) commandMap.get("searchCondition"));
        //초성 검색 설정
        model.addAttribute("choseongA", commandMap.get("choseongA") == null ? "" : (String) commandMap.get("choseongA"));
        model.addAttribute("choseongB", commandMap.get("choseongB") == null ? "" : (String) commandMap.get("choseongB"));
        model.addAttribute("cmd", commandMap.get("cmd") == null ? "" : (String) commandMap.get("cmd"));

        List<?> reusltList = egovAdministrationWordManageService.selectAdministrationWordManageList(searchVO);
        model.addAttribute("resultList", reusltList);

        int totCnt = egovAdministrationWordManageService.selectAdministrationWordManageListCnt(searchVO);
        paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);

        return "egovframework/com/uss/olh/awm/EgovAdministrationWordList";
    }

    /**
     * 행정전문용어사전 목록을 상세조회 조회한다.
     * @param searchVO
     * @param administrationWord
     * @param commandMap
     * @param model
     * @return
     *         "/uss/olh/awm/EgovAdministrationWordDetail"
     * @throws Exception
     */
    @SuppressWarnings("unused")
	@RequestMapping(value = "/uss/olh/awm/detailAdministrationWord.do")
    public String egovAdministrationWordDetail(
            @ModelAttribute("searchVO") ComDefaultVO searchVO,
            AdministrationWordManage administrationWordManage, @RequestParam Map<?, ?> commandMap,
            ModelMap model) throws Exception {

        String sLocationUrl = "egovframework/com/uss/olh/awm/EgovAdministrationWordDetail";

        String sCmd = commandMap.get("cmd") == null ? "" : (String) commandMap.get("cmd");

        AdministrationWordManage administrationWordManageVO = egovAdministrationWordManageService.selectAdministrationWordManageDetail(administrationWordManage);
        model.addAttribute("administrationWordManage", administrationWordManageVO);

        return sLocationUrl;
    }

    /**
     * 행정전문용어사전관리 메인 목록을 조회한다.
     * @param searchVO
     * @param commandMap
     * @param administrationWordManage
     * @param model
     * @return "egovframework/com/uss/olh/awm/EgovAdministrationWordManageList"
     * @throws Exception
     */
    @SuppressWarnings("unused")
	@RequestMapping(value = "/uss/olh/awm/listAdministrationWordMain.do")
    public String egovAdministrationWordManageListMain(
    		@RequestParam Map<?, ?> commandMap,
            @ModelAttribute("searchVO") AdministrationWordManage searchVO,
            ModelMap model)
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

        List<?> reusltList = egovAdministrationWordManageService.selectAdministrationWordManageList(searchVO);
        model.addAttribute("resultList", reusltList);

        return "egovframework/com/uss/olh/awm/EgovAdministrationWordMainList";
    }
}
