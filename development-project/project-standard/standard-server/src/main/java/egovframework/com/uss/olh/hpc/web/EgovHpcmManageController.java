package egovframework.com.uss.olh.hpc.web;

import java.util.List;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.uss.olh.hpc.service.EgovHpcmManageService;
import egovframework.com.uss.olh.hpc.service.HpcmManageDefaultVO;
import egovframework.com.uss.olh.hpc.service.HpcmManageVO;

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
 * 도움말을 처리하는 비즈니스 구현 클래스
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
 *   2011.8.26	 정진오			IncludedInfo annotation 추가
 *   2011.09.28  서준식          return값 오류 수정
 * </pre>
 */

@Controller
public class EgovHpcmManageController {

    @Resource(name = "HpcmManageService")
    private EgovHpcmManageService hpcmManageService;

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
     * @return	"/uss/olh/hpc/"
     * @throws Exception
     */
    @RequestMapping(value="/uss/olh/hpc/EgovMain.do")
    public String egovMain(ModelMap model) throws Exception {
    	return "egovframework/com/uss/olh/hpc/EgovMain";
    }

    /**
     * 메뉴를 조회한다.
     * @param model
     * @return	"/uss/olh/hpc/EgovLeft"
     * @throws Exception
     */
    @RequestMapping(value="/uss/olh/hpc/EgovLeft.do")
    public String egovLeft(ModelMap model) throws Exception {
    	return "egovframework/com/uss/olh/hpc/EgovLeft";
    }

    /**
     * 도움말내용 목록을 조회한다. (pageing)
     * @param searchVO
     * @param model
     * @return	"/uss/olh/hpc/EgovHpcmListInqire"
     * @throws Exception
     */
    @IncludedInfo(name="도움말", order = 520 ,gid = 50)
    @RequestMapping(value="/uss/olh/hpc/HpcmListInqire.do")
    public String selectHpcmList(@ModelAttribute("searchVO") HpcmManageDefaultVO searchVO, ModelMap model) throws Exception {

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

        List<?> HpcmList = hpcmManageService.selectHpcmList(searchVO);
        model.addAttribute("resultList", HpcmList);

        int totCnt = hpcmManageService.selectHpcmListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);

        return "egovframework/com/uss/olh/hpc/EgovHpcmListInqire";
    }

    /**
     * 도움말내용 목록에 대한 상세정보를 조회한다.
     * @param hpcmManageVO
     * @param searchVO
     * @param model
     * @return	"/uss/olh/hpc/EgovHpcmDetailInqire"
     * @throws Exception
     */
    @RequestMapping("/uss/olh/hpc/HpcmDetailInqire.do")
    public String	selectHpcmDetail(HpcmManageVO hpcmManageVO,
            @ModelAttribute("searchVO") HpcmManageDefaultVO searchVO,
            ModelMap model) throws Exception {

		HpcmManageVO vo = hpcmManageService.selectHpcmDetail(hpcmManageVO);

		model.addAttribute("result", vo);

        return	"egovframework/com/uss/olh/hpc/EgovHpcmDetailInqire";
    }

    /**
     * 도움말내용를 등록하기 위한 전 처리(공통코드 처리)
     * @param searchVO
     * @param model
     * @return	"/uss/olh/hpc/EgovHpcmCnRegist"
     * @throws Exception
     */
    @RequestMapping("/uss/olh/hpc/HpcmCnRegistView.do")
    public String insertHpcmCnView(
            @ModelAttribute("searchVO") HpcmManageDefaultVO searchVO, Model model)
            throws Exception {

    	// 공통코드를 가져오기 위한 Vo
    	ComDefaultCodeVO vo = new ComDefaultCodeVO();
		vo.setCodeId("COM021");

		List<?> _result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("resultList", _result);


        model.addAttribute("hpcmManageVO", new HpcmManageVO());

        return "egovframework/com/uss/olh/hpc/EgovHpcmCnRegist";

    }

    /**
     * 도움말내용를 등록한다.
     * @param searchVO
     * @param hpcmManageVO
     * @param bindingResult
     * @return	"forward:/uss/olh/hpc/HpcmListInqire.do"
     * @throws Exception
     */
    @RequestMapping("/uss/olh/hpc/HpcmCnRegist.do")
    public String insertHpcmCn(
            @ModelAttribute("searchVO") HpcmManageDefaultVO searchVO,
            @ModelAttribute("hpcmManageVO") HpcmManageVO hpcmManageVO,
            BindingResult bindingResult)
            throws Exception {

    	beanValidator.validate(hpcmManageVO, bindingResult);

		if(bindingResult.hasErrors()){

			return "egovframework/com/uss/olh/hpc/EgovHpcmCnRegist";//2011.09.28

		}

    	// 로그인VO에서  사용자 정보 가져오기
    	LoginVO	loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

    	String	frstRegisterId = loginVO.getUniqId();

    	hpcmManageVO.setFrstRegisterId(frstRegisterId);		// 최초등록자ID
    	hpcmManageVO.setLastUpdusrId(frstRegisterId);    	// 최종수정자ID

        hpcmManageService.insertHpcmCn(hpcmManageVO);

        return "forward:/uss/olh/hpc/HpcmListInqire.do";
    }

    /**
     * 도움말내용를 수정하기 위한 전 처리(공통코드 처리)
     * @param hpcmId
     * @param searchVO
     * @param model
     * @return	"/uss/olh/hpc/EgovHpcmCnUpdt"
     * @throws Exception
     */
    @RequestMapping("/uss/olh/hpc/HpcmCnUpdtView.do")
    public String updateHpcmCnView(@RequestParam("hpcmId") String hpcmId ,
            @ModelAttribute("searchVO") HpcmManageDefaultVO searchVO, ModelMap model)
            throws Exception {

    	// 공통코드를 가져오기 위한 Vo
    	ComDefaultCodeVO vo = new ComDefaultCodeVO();
		vo.setCodeId("COM021");

		List<?> _result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("resultList", _result);

        HpcmManageVO hpcmManageVO = new HpcmManageVO();

        // Primary Key 값 세팅
        hpcmManageVO.setHpcmId(hpcmId);

        // 변수명은 CoC 에 따라 sampleVO
        model.addAttribute(selectHpcmDetail(hpcmManageVO, searchVO, model));

        // 변수명은 CoC 에 따라 JSTL사용을 위해
        model.addAttribute("hpcmManageVO", hpcmManageService.selectHpcmDetail(hpcmManageVO));


        return "egovframework/com/uss/olh/hpc/EgovHpcmCnUpdt";
    }

    /**
     * 도움말내용를 수정한다.
     * @param searchVO
     * @param hpcmManageVO
     * @param bindingResult
     * @return	"forward:/uss/olh/hpc/HpcmListInqire.do"
     * @throws Exception
     */
    @RequestMapping("/uss/olh/hpc/HpcmCnUpdt.do")
    public String updateHpcmCn(
            @ModelAttribute("searchVO") HpcmManageDefaultVO searchVO,
            @ModelAttribute("hpcmManageVO") HpcmManageVO hpcmManageVO,
            BindingResult bindingResult)
            throws Exception {

    	// Validation
    	beanValidator.validate(hpcmManageVO, bindingResult);

		if(bindingResult.hasErrors()){

			return "egovframework/com/uss/olh/hpc/EgovHpcmCnUpdt";//2011.09.28

		}

    	// 로그인VO에서  사용자 정보 가져오기
    	LoginVO	loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

    	String	lastUpdusrId = loginVO.getUniqId();

    	hpcmManageVO.setLastUpdusrId(lastUpdusrId);    	// 최종수정자ID

    	hpcmManageService.updateHpcmCn(hpcmManageVO);


        return "forward:/uss/olh/hpc/HpcmListInqire.do";

    }

    /**
     * 도움말내용를 삭제한다.
     * @param hpcmManageVO
     * @param searchVO
     * @return	"forward:/uss/olh/hpc/HpcmListInqire.do"
     * @throws Exception
     */
    @RequestMapping("/uss/olh/hpc/HpcmCnDelete.do")
    public String deleteHpcmCn(
            HpcmManageVO hpcmManageVO,
            @ModelAttribute("searchVO") HpcmManageDefaultVO searchVO)
            throws Exception {

    	hpcmManageService.deleteHpcmCn(hpcmManageVO);

        return "forward:/uss/olh/hpc/HpcmListInqire.do";
    }

}
