package egovframework.com.cop.bbs.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cop.bbs.service.BoardMaster;
import egovframework.com.cop.bbs.service.BoardMasterVO;
import egovframework.com.cop.bbs.service.EgovBBSMasterService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;


/**
 * 게시판 속성관리를 위한 컨트롤러  클래스
 * @author 공통서비스개발팀 이삼섭
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------       --------    ---------------------------
 *   2009.3.12  이삼섭          최초 생성
 *   2009.06.26	한성곤		    2단계 기능 추가 (댓글관리, 만족도조사)
 *	 2011.07.21 안민정          커뮤니티 관련 메소드 분리 (->EgovBBSAttributeManageController)
 *	 2011.8.26	정진오			IncludedInfo annotation 추가
 *   2011.09.15 서준식           2단계 기능 추가 (댓글관리, 만족도조사) 적용방법 변경
 *   2016.06.13 김연호          표준프레임워크 v3.6 개선
 * </pre>
 */

@Controller
public class EgovBBSMasterController {

    @Resource(name = "EgovBBSMasterService")
    private EgovBBSMasterService egovBBSMasterService;

    @Resource(name = "EgovCmmUseService")
    private EgovCmmUseService cmmUseService;

    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;
    


    @Autowired
    private DefaultBeanValidator beanValidator;

    //Logger log = Logger.getLogger(this.getClass());
    
    /**
     * 신규 게시판 마스터 등록을 위한 등록페이지로 이동한다.
     * 
     * @param boardMasterVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/insertBBSMasterView.do")
    public String insertBBSMasterView(@ModelAttribute("searchVO") BoardMasterVO boardMasterVO, ModelMap model) throws Exception {
		BoardMasterVO boardMaster = new BoardMasterVO();
	
		//공통코드(게시판유형)
		ComDefaultCodeVO vo = new ComDefaultCodeVO();
		vo.setCodeId("COM101");
		List<?> codeResult = cmmUseService.selectCmmCodeDetail(vo);
		
		model.addAttribute("bbsTyCode", codeResult);
		model.addAttribute("boardMasterVO", boardMaster);
	
	
		return "egovframework/com/cop/bbs/EgovBBSMasterRegist";
    }

    /**
     * 신규 게시판 마스터 정보를 등록한다.
     * 
     * @param boardMasterVO
     * @param boardMaster
     * @param status
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/insertBBSMaster.do")
    public String insertBBSMaster(@ModelAttribute("searchVO") BoardMasterVO boardMasterVO, @ModelAttribute("boardMaster") BoardMaster boardMaster,
	    BindingResult bindingResult, ModelMap model) throws Exception {
	
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	
		beanValidator.validate(boardMaster, bindingResult);
		if (bindingResult.hasErrors()) {
		    ComDefaultCodeVO vo = new ComDefaultCodeVO();
		    
		    //게시판유형코드
		    vo.setCodeId("COM101");
		    List<?> codeResult = cmmUseService.selectCmmCodeDetail(vo);
		    model.addAttribute("bbsTyCode", codeResult);
	
		    return "egovframework/com/cop/bbs/EgovBBSMasterRegist";
		}
		
		if (isAuthenticated) {
		    boardMaster.setFrstRegisterId(user.getUniqId());
//		    boardMaster.setUseAt("Y");
//		    boardMaster.setTrgetId("SYSTEMDEFAULT_REGIST");
	
		    egovBBSMasterService.insertBBSMasterInf(boardMaster);
		}
	
		return "forward:/cop/bbs/selectBBSMasterInfs.do";
    }

    /**
     * 게시판 마스터 목록을 조회한다.
     * 
     * @param boardMasterVO
     * @param model
     * @return
     * @throws Exception
     */
    @IncludedInfo(name="게시판관리",order = 180 ,gid = 40)
    @RequestMapping("/cop/bbs/selectBBSMasterInfs.do")
    public String selectBBSMasterInfs(@ModelAttribute("searchVO") BoardMasterVO boardMasterVO, ModelMap model) throws Exception {
	boardMasterVO.setPageUnit(propertyService.getInt("pageUnit"));
	boardMasterVO.setPageSize(propertyService.getInt("pageSize"));

	PaginationInfo paginationInfo = new PaginationInfo();
	
	paginationInfo.setCurrentPageNo(boardMasterVO.getPageIndex());
	paginationInfo.setRecordCountPerPage(boardMasterVO.getPageUnit());
	paginationInfo.setPageSize(boardMasterVO.getPageSize());

	boardMasterVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	boardMasterVO.setLastIndex(paginationInfo.getLastRecordIndex());
	boardMasterVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

	Map<String, Object> map = egovBBSMasterService.selectBBSMasterInfs(boardMasterVO);
	int totCnt = Integer.parseInt((String)map.get("resultCnt"));
	
	paginationInfo.setTotalRecordCount(totCnt);

	model.addAttribute("resultList", map.get("resultList"));
	model.addAttribute("resultCnt", map.get("resultCnt"));	
	model.addAttribute("paginationInfo", paginationInfo);

	return "egovframework/com/cop/bbs/EgovBBSMasterList";
    }

    /**
     * 게시판 마스터 상세내용을 조회한다.
     * 
     * @param boardMasterVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/selectBBSMasterDetail.do")
    public String selectBBSMasterDetail(@ModelAttribute("searchVO") BoardMasterVO searchVO, ModelMap model) throws Exception {
		BoardMasterVO vo = egovBBSMasterService.selectBBSMasterInf(searchVO);
		model.addAttribute("result", vo);
	
		return "egovframework/com/cop/bbs/EgovBBSMasterDetail";
    }
    
    /**
     * 게시판 마스터정보를 수정하기 위한 전 처리
     * @param bbsId
     * @param searchVO
     * @param model
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/updateBBSMasterView.do")
    public String updateBBSMasterView(@RequestParam("bbsId") String bbsId ,
            @ModelAttribute("searchVO") BoardMaster searchVO, ModelMap model)
            throws Exception {


        BoardMasterVO boardMasterVO = new BoardMasterVO();

        
        //게시판유형코드
        ComDefaultCodeVO vo = new ComDefaultCodeVO();
        vo.setCodeId("COM101");
        List<?> codeResult = cmmUseService.selectCmmCodeDetail(vo);
        model.addAttribute("bbsTyCode", codeResult);
        
        // Primary Key 값 세팅
        boardMasterVO.setBbsId(bbsId);

        model.addAttribute("boardMasterVO", egovBBSMasterService.selectBBSMasterInf(boardMasterVO));

        return "egovframework/com/cop/bbs/EgovBBSMasterUpdt";
    }
    

    /**
     * 게시판 마스터 정보를 수정한다.
     * 
     * @param boardMasterVO
     * @param boardMaster
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/updateBBSMaster.do")
    public String updateBBSMaster(@ModelAttribute("searchVO") BoardMasterVO boardMasterVO, @ModelAttribute("boardMaster") BoardMaster boardMaster,
	    BindingResult bindingResult, ModelMap model) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	
		beanValidator.validate(boardMaster, bindingResult);
		if (bindingResult.hasErrors()) {
		    BoardMasterVO vo = egovBBSMasterService.selectBBSMasterInf(boardMasterVO);
	
		    model.addAttribute("result", vo);
	
		    ComDefaultCodeVO comVo = new ComDefaultCodeVO();
	        comVo.setCodeId("COM101");
	        List<?> codeResult = cmmUseService.selectCmmCodeDetail(comVo);
	        model.addAttribute("bbsTyCode", codeResult);
		    
		    return "egovframework/com/cop/bbs/EgovBBSMasterUpdt";
		}
	
		if (isAuthenticated) {
		    boardMaster.setLastUpdusrId(user.getUniqId());
		    egovBBSMasterService.updateBBSMasterInf(boardMaster);
		}
	
		return "forward:/cop/bbs/selectBBSMasterInfs.do";
    }

    /**
     * 게시판 마스터 정보를 삭제한다.
     * 
     * @param boardMasterVO
     * @param boardMaster
     * @param status
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/deleteBBSMaster.do")
    public String deleteBBSMaster(@ModelAttribute("searchVO") BoardMasterVO boardMasterVO, @ModelAttribute("boardMaster") BoardMaster boardMaster
	    ) throws Exception {

	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

	if (isAuthenticated) {
	    boardMaster.setLastUpdusrId(user.getUniqId());
	    egovBBSMasterService.deleteBBSMasterInf(boardMaster);
	}
	// status.setComplete();
	return "forward:/cop/bbs/selectBBSMasterInfs.do";
    }

    
}
