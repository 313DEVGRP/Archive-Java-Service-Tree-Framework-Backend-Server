package egovframework.com.uss.ion.sit.web;

import java.util.List;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.uss.ion.sit.service.EgovSiteManageService;
import egovframework.com.uss.ion.sit.service.SiteManageDefaultVO;
import egovframework.com.uss.ion.sit.service.SiteManageVO;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springmodules.validation.commons.DefaultBeanValidator;

/**
 *
 * 사이트정보를 처리하는 Controller 클래스
 * @author 공통서비스 개발팀 박정규
 * @since 2009.04.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.04.01  박정규          최초 생성
 *   2011.8.26	정진오			IncludedInfo annotation 추가
 *
 * </pre>
 */

@Controller
public class EgovSiteManageController {

    @Resource(name = "SiteManageService")
    private EgovSiteManageService siteManageService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

	@Resource(name="EgovCmmUseService")
	private EgovCmmUseService cmmUseService;

	/** EgovMessageSource */
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    // Validation 관련
	@Autowired
	private DefaultBeanValidator beanValidator;

    /**
     * 개별 배포시 메인메뉴를 조회한다.
     * @param model
     * @return	"/uss/ion/sit/EgovMain"
     * @throws Exception
     */
    @RequestMapping(value="/uss/ion/sit/EgovMain.do")
    public String egovMain(ModelMap model) throws Exception {
    	return "egovframework/com/uss/ion/sit/EgovMain";
    }

    /**
     * 메뉴를 조회한다.
     * @param model
     * @return	"/uss/ion/sit/EgovLeft"
     * @throws Exception
     */
    @RequestMapping(value="/uss/ion/sit/EgovLeft.do")
    public String egovLeft(ModelMap model) throws Exception {
    	return "egovframework/com/uss/ion/sit/EgovLeft";
    }

    /**
     * 사이트목록을 조회한다.
     * @param searchVO
     * @param model
     * @return	"/uss/ion/sit/EgovSiteListInqire"
     * @throws Exception
     */
    @IncludedInfo(name="사이트관리", order = 680 ,gid = 50)
    @RequestMapping(value="/uss/ion/sit/SiteListInqire.do")
    public String selectSiteList(@ModelAttribute("searchVO") SiteManageDefaultVO searchVO, ModelMap model) throws Exception {

    	/** EgovPropertyService.SiteList */
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

        List<?> SiteList = siteManageService.selectSiteList(searchVO);
        model.addAttribute("resultList", SiteList);

        int totCnt = siteManageService.selectSiteListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);

        return "egovframework/com/uss/ion/sit/EgovSiteListInqire";
    }

   /**
    * 사이트정보 목록에 대한 상세정보를 조회한다.
    * @param siteManageVO
    * @param searchVO
    * @param model
    * @return	"/uss/ion/sit/EgovSiteDetailInqire"
    * @throws Exception
    */
    @RequestMapping("/uss/ion/sit/SiteDetailInqire.do")
    public String	selectSiteDetail(SiteManageVO siteManageVO,
            @ModelAttribute("searchVO") SiteManageDefaultVO searchVO,
            ModelMap model) throws Exception {

		SiteManageVO vo = siteManageService.selectSiteDetail(siteManageVO);

		model.addAttribute("result", vo);

        return	"egovframework/com/uss/ion/sit/EgovSiteDetailInqire";
    }

    /**
     * 사이트정보 등록전 단계
     * @param searchVO
     * @param model
     * @return	"/uss/ion/sit/EgovSiteInfoRegist"
     * @throws Exception
     */
    @RequestMapping("/uss/ion/sit/SiteInfoRegistView.do")
    public String insertSiteInfoView(
            @ModelAttribute("searchVO") SiteManageDefaultVO searchVO, Model model)
            throws Exception {

    	// 공통코드를 가져오기 위한 Vo
    	ComDefaultCodeVO vo = new ComDefaultCodeVO();
		vo.setCodeId("COM023");

		List<?> _result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("resultList", _result);


        model.addAttribute("siteManageVO", new SiteManageVO());

        return "egovframework/com/uss/ion/sit/EgovSiteInfoRegist";

    }

   /**
    * 사이트정보를 등록한다.
    * @param searchVO
    * @param siteManageVO
    * @param bindingResult
    * @return	"forward:/uss/ion/sit/SiteListInqire.do"
    * @throws Exception
    */
    @RequestMapping("/uss/ion/sit/SiteInfoRegist.do")
    public String insertSiteInfo(
            @ModelAttribute("searchVO") SiteManageDefaultVO searchVO,
            @ModelAttribute("siteManageVO") SiteManageVO siteManageVO,
            BindingResult bindingResult)
            throws Exception {

    	beanValidator.validate(siteManageVO, bindingResult);

		if(bindingResult.hasErrors()){

			return "egovframework/com/uss/olh/wor/EgovSiteInfoRegist";

		}

    	// 로그인VO에서  사용자 정보 가져오기
    	LoginVO	loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

    	String	frstRegisterId = loginVO.getUniqId();

    	siteManageVO.setFrstRegisterId(frstRegisterId);		// 최초등록자ID
    	siteManageVO.setLastUpdusrId(frstRegisterId);    	// 최종수정자ID

        siteManageService.insertSiteInfo(siteManageVO);

        return "forward:/uss/ion/sit/SiteListInqire.do";
    }

    /**
     * 사이트정보 수정 전 처리
     * @param siteId
     * @param searchVO
     * @param model
     * @return	"/uss/ion/sit/EgovSiteInfoUpdt"
     * @throws Exception
     */
    @RequestMapping("/uss/ion/sit/SiteInfoUpdtView.do")
    public String updateSiteInfoView(@RequestParam("siteId") String siteId ,
            @ModelAttribute("searchVO") SiteManageDefaultVO searchVO, ModelMap model)
            throws Exception {

    	// 공통코드를 가져오기 위한 Vo
    	ComDefaultCodeVO vo = new ComDefaultCodeVO();
		vo.setCodeId("COM023");

		List<?> _result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("resultList", _result);

        SiteManageVO siteManageVO = new SiteManageVO();

        // Primary Key 값 세팅
        siteManageVO.setSiteId(siteId);

        // 변수명은 CoC 에 따라 sampleVO
        model.addAttribute("siteManageVO", siteManageService.selectSiteDetail(siteManageVO));

        // result에도 세팅(jstl 사용을 위해)
        model.addAttribute(selectSiteDetail(siteManageVO, searchVO, model));

        return "egovframework/com/uss/ion/sit/EgovSiteInfoUpdt";
    }

    /**
     * 사이트정보를 수정한다.
     * @param searchVO
     * @param siteManageVO
     * @param bindingResult
     * @return	"forward:/uss/ion/sit/SiteListInqire.do"
     * @throws Exception
     */
    @RequestMapping("/uss/ion/sit/SiteInfoUpdt.do")
    public String updateSiteInfo(
            @ModelAttribute("searchVO") SiteManageDefaultVO searchVO,
            @ModelAttribute("siteManageVO") SiteManageVO siteManageVO,
            BindingResult bindingResult)
            throws Exception {

    	// Validation
    	beanValidator.validate(siteManageVO, bindingResult);

		if(bindingResult.hasErrors()){

			return "egovframework/com/uss/olh/wor/EgovSiteInfoUpdt";

		}

    	// 로그인VO에서  사용자 정보 가져오기
    	LoginVO	loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

    	String	lastUpdusrId = loginVO.getUniqId();

    	siteManageVO.setLastUpdusrId(lastUpdusrId);    	// 최종수정자ID

    	siteManageService.updateSiteInfo(siteManageVO);

        return "forward:/uss/ion/sit/SiteListInqire.do";

    }

    /**
     * 사이트정보를 삭제처리한다.
     * @param siteManageVO
     * @param searchVO
     * @return	"forward:/uss/ion/sit/SiteListInqire.do"
     * @throws Exception
     */
    @RequestMapping("/uss/ion/sit/SiteInfoDelete.do")
    public String deleteSiteInfo(
            SiteManageVO siteManageVO,
            @ModelAttribute("searchVO") SiteManageDefaultVO searchVO)
            throws Exception {

    	siteManageService.deleteSiteInfo(siteManageVO);

        return "forward:/uss/ion/sit/SiteListInqire.do";
    }

}
