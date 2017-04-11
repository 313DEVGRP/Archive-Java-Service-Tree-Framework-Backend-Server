package egovframework.com.uss.ion.rec.web;

import java.util.List;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.uss.ion.rec.service.EgovRecomendSiteManageService;
import egovframework.com.uss.ion.rec.service.RecomendSiteManageDefaultVO;
import egovframework.com.uss.ion.rec.service.RecomendSiteManageVO;

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
 * 추천사이트처리를 하는 Controller 클래스
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
public class EgovRecomendSiteManageController {

    @Resource(name = "RecomendSiteManageService")
    private EgovRecomendSiteManageService recomendSiteManageService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

	/** EgovMessageSource */
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    // Validation 관련
	@Autowired
	private DefaultBeanValidator beanValidator;


    /**
     * 개별 배포시 메인메뉴를 조회한다.
     * @param model
     * @return	"/uss/ion/rec/"
     * @throws Exception
     */
    @RequestMapping(value="/uss/ion/rec/EgovMain.do")
    public String egovMain(ModelMap model) throws Exception {
    	return "egovframework/com/uss/ion/rec/EgovMain";
    }

    /**
     * 메뉴를 조회한다.
     * @param model
     * @return	"/uss/ion/rec/EgovLeft"
     * @throws Exception
     */
    @RequestMapping(value="/uss/ion/rec/EgovLeft.do")
    public String egovLeft(ModelMap model) throws Exception {
    	return "egovframework/com/uss/ion/rec/EgovLeft";
    }

    /**
     * 추천사이트정보 목록을 조회한다.
     * @param searchVO
     * @param model
     * @return	"/uss/ion/rec/EgovRecomendSiteListInqire"
     * @throws Exception
     */
    @IncludedInfo(name="추천사이트관리", order = 700 ,gid = 50)
    @RequestMapping(value="/uss/ion/rec/RecomendSiteListInqire.do")
    public String selectRecomendSiteList(@ModelAttribute("searchVO") RecomendSiteManageDefaultVO searchVO, ModelMap model) throws Exception {

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

        List<?> RecomendSiteList = recomendSiteManageService.selectRecomendSiteList(searchVO);
        model.addAttribute("resultList", RecomendSiteList);

        int totCnt = recomendSiteManageService.selectRecomendSiteListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);

        return "egovframework/com/uss/ion/rec/EgovRecomendSiteListInqire";
    }

    /**
     * 추천사이트정보 목록에 대한 상세정보를 조회한다.
     * @param recomendSiteManageVO
     * @param searchVO
     * @param model
     * @return	"/uss/ion/rec/EgovRecomendSiteDetailInqire"
     * @throws Exception
     */
    @RequestMapping("/uss/ion/rec/RecomendSiteDetailInqire.do")
    public String	selectRecomendSiteDetail(RecomendSiteManageVO recomendSiteManageVO,
            @ModelAttribute("searchVO") RecomendSiteManageDefaultVO searchVO,
            ModelMap model) throws Exception {

		RecomendSiteManageVO vo = recomendSiteManageService.selectRecomendSiteDetail(recomendSiteManageVO);

		model.addAttribute("result", vo);

        return	"egovframework/com/uss/ion/rec/EgovRecomendSiteDetailInqire";
    }

    /**
     * 추천사이트정보를 등록하기 전 처리
     * @param searchVO
     * @param model
     * @return	"/uss/ion/rec/EgovRecomendSiteInfoRegist"
     * @throws Exception
     */
    @RequestMapping("/uss/ion/rec/RecomendSiteRegistView.do")
    public String insertRecomendSiteInfoView(
            @ModelAttribute("searchVO") RecomendSiteManageDefaultVO searchVO, Model model)
            throws Exception {

        model.addAttribute("recomendSiteManageVO", new RecomendSiteManageVO());

        return "egovframework/com/uss/ion/rec/EgovRecomendSiteRegist";

    }

    /**
     * 추천사이트정보를 등록한다.
     * @param searchVO
     * @param recomendSiteManageVO
     * @param bindingResult
     * @return	"forward:/uss/ion/rec/RecomendSiteListInqire.do"
     * @throws Exception
     */
    @RequestMapping("/uss/ion/rec/RecomendSiteRegist.do")
    public String insertRecomendSiteInfo(
            @ModelAttribute("searchVO") RecomendSiteManageDefaultVO searchVO,
            @ModelAttribute("recomendSiteManageVO") RecomendSiteManageVO recomendSiteManageVO,
            BindingResult bindingResult)
            throws Exception {

    	beanValidator.validate(recomendSiteManageVO, bindingResult);

		if(bindingResult.hasErrors()){

			return "egovframework/com/uss/olh/wor/EgovRecomendSiteRegist";

		}

    	// 로그인VO에서  사용자 정보 가져오기
    	LoginVO	loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

    	String	frstRegisterId = loginVO.getUniqId();

    	recomendSiteManageVO.setFrstRegisterId(frstRegisterId);		// 최초등록자ID
    	recomendSiteManageVO.setLastUpdusrId(frstRegisterId);    	// 최종수정자ID

        recomendSiteManageService.insertRecomendSiteInfo(recomendSiteManageVO);


        return "forward:/uss/ion/rec/RecomendSiteListInqire.do";
    }

    /**
     * 추천사이트정보를 수정하기 전 처리
     * @param recomendSiteId
     * @param searchVO
     * @param model
     * @return	"/uss/ion/rec/EgovRecomendSiteInfoUpdt"
     * @throws Exception
     */
    @RequestMapping("/uss/ion/rec/RecomendSiteUpdtView.do")
    public String updateRecomendSiteInfoView(@RequestParam("recomendSiteId") String recomendSiteId ,
            @ModelAttribute("searchVO") RecomendSiteManageDefaultVO searchVO, ModelMap model)
            throws Exception {


        RecomendSiteManageVO recomendSiteManageVO = new RecomendSiteManageVO();

        // Primary Key 값 세팅
        recomendSiteManageVO.setRecomendSiteId(recomendSiteId);

        // 변수명은 CoC 에 따라 sampleVO
        model.addAttribute("recomendSiteManageVO", recomendSiteManageService.selectRecomendSiteDetail(recomendSiteManageVO));

        // 변수명은 CoC 에 따라
        model.addAttribute(selectRecomendSiteDetail(recomendSiteManageVO, searchVO, model));

        return "egovframework/com/uss/ion/rec/EgovRecomendSiteUpdt";
    }

    /**
     * 추천사이트정보를 수정처리한다.
     * @param searchVO
     * @param recomendSiteManageVO
     * @param bindingResult
     * @return	"forward:/uss/ion/rec/RecomendSiteListInqire.do"
     * @throws Exception
     */
    @RequestMapping("/uss/ion/rec/RecomendSiteUpdt.do")
    public String updateRecomendSiteInfo(
            @ModelAttribute("searchVO") RecomendSiteManageDefaultVO searchVO,
            @ModelAttribute("recomendSiteManageVO") RecomendSiteManageVO recomendSiteManageVO,
            BindingResult bindingResult)
            throws Exception {

    	// Validation
    	beanValidator.validate(recomendSiteManageVO, bindingResult);

		if(bindingResult.hasErrors()){

			return "egovframework/com/uss/olh/wor/EgovRecomendSiteUpdt";

		}

    	// 로그인VO에서  사용자 정보 가져오기
    	LoginVO	loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

    	String	lastUpdusrId = loginVO.getUniqId();

    	recomendSiteManageVO.setLastUpdusrId(lastUpdusrId);    	// 최종수정자ID

    	recomendSiteManageService.updateRecomendSiteInfo(recomendSiteManageVO);

        return "forward:/uss/ion/rec/RecomendSiteListInqire.do";

    }

    /**
     * 추천사이트정보를 삭제처리한다.
     * @param recomendSiteManageVO
     * @param searchVO
     * @return	"forward:/uss/ion/rec/RecomendSiteListInqire.do"
     * @throws Exception
     */
    @RequestMapping("/uss/ion/rec/RecomendSiteDelete.do")
    public String deleteRecomendSiteInfo(
            RecomendSiteManageVO recomendSiteManageVO,
            @ModelAttribute("searchVO") RecomendSiteManageDefaultVO searchVO)
            throws Exception {

    	recomendSiteManageService.deleteRecomendSiteInfo(recomendSiteManageVO);


        return "forward:/uss/ion/rec/RecomendSiteListInqire.do";
    }

}
