package egovframework.com.cop.cmy.web;

import java.util.Map;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cop.bbs.service.BoardUseInf;
import egovframework.com.cop.bbs.service.BoardUseInfVO;
import egovframework.com.cop.clb.service.ClubUser;
import egovframework.com.cop.clb.service.EgovClubManageService;
import egovframework.com.cop.cmy.service.CommunityUser;
import egovframework.com.cop.cmy.service.EgovCmyBBSUseInfoManageService;
import egovframework.com.cop.cmy.service.EgovCommunityManageService;
import egovframework.com.cop.com.service.UserInfVO;

import egovframework.rte.fdl.cmmn.exception.EgovBizException;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

/**
 * 게시판의 이용정보를 관리하기 위한 컨트롤러 클래스
 * @author 공통서비스개발팀 이삼섭
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.4.2   이삼섭          최초 생성
 *   2011.07.21 안민정          커뮤니티 관련 메소드 분리 (-> EgovCmyUserInfController)
 *   
 * </pre>
 */
@Controller
public class EgovCmyBBSUseInfoManageController {

	@Resource(name = "EgovCmyBBSUseInfoManageService")
	private EgovCmyBBSUseInfoManageService bbsUseService;
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;
	@Resource(name = "EgovClubManageService")
	private EgovClubManageService clbService;			// 동호회 운영자 권한 확인
	@Resource(name = "EgovCommunityManageService")
	private EgovCommunityManageService cmmntyService;	// 커뮤니티 관리자 권한 확인

	/**
	 * 커뮤니티, 동호회에 사용되는 게시판 사용정보를 수정한다.
	 * 
	 * @param bdUseVO
	 * @param boardUseInf
	 * @param status
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/cop/com/updateBBSUseInfByTrget.do")
	public String updateBBSUseInfByTrget(@ModelAttribute("searchVO") BoardUseInfVO bdUseVO, @ModelAttribute("boardUseInf") BoardUseInf boardUseInf,
			@RequestParam Map<String, Object> commandMap, SessionStatus status, ModelMap model) throws Exception {
	
	checkAuthority(bdUseVO);	// server-side 권한 확인
	
	String param_trgetId = (String)commandMap.get("param_trgetId");
	
	//LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	
	if (isAuthenticated) {
	    boardUseInf.setTrgetId(param_trgetId);
	    bbsUseService.updateBBSUseInfByTrget(boardUseInf);
	}
	
	return "forward:/cop/com/selectCmyBBSUseInfsByTrget.do";
	}

	/**
	 * 커뮤니티, 동호회에 사용되는 게시판 사용정보에 대한 목록을 조회한다.
	 * 
	 * @param bdUseVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/cop/com/selectCmyBBSUseInfsByTrget.do")
	public String selectBBSUseInfsByTrget(@ModelAttribute("searchVO") BoardUseInfVO bdUseVO, ModelMap model) throws Exception {
	checkAuthority(bdUseVO);	// server-side 권한 확인
	
	bdUseVO.setPageUnit(propertyService.getInt("pageUnit"));
	bdUseVO.setPageSize(propertyService.getInt("pageSize"));
	
	PaginationInfo paginationInfo = new PaginationInfo();
	
	paginationInfo.setCurrentPageNo(bdUseVO.getPageIndex());
	paginationInfo.setRecordCountPerPage(bdUseVO.getPageUnit());
	paginationInfo.setPageSize(bdUseVO.getPageSize());
	
	bdUseVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	bdUseVO.setLastIndex(paginationInfo.getLastRecordIndex());
	bdUseVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	
	Map<String, Object> map = bbsUseService.selectBBSUseInfsByTrget(bdUseVO);
	int totCnt = Integer.parseInt((String)map.get("resultCnt"));
	
	paginationInfo.setTotalRecordCount(totCnt);
	
	model.addAttribute("resultList", map.get("resultList"));
	model.addAttribute("resultCnt", map.get("resultCnt"));
	model.addAttribute("trgetId", bdUseVO.getTrgetId());
	model.addAttribute("trgetType", bdUseVO.getTrgetType());
	model.addAttribute("paginationInfo", paginationInfo);
	
	return "egovframework/com/cop/com/EgovBdUseInfListByTrget";
	}

	/**
	 * 커뮤니티, 동호회에 사용되는 게시판 사용정보를 등록한다.
	 * 
	 * @param bdUseVO
	 * @param boardUseInf
	 * @param status
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/cop/com/insertBBSUseInfByTrget.do")
	public String insertBBSUseInfByTrget(@ModelAttribute("searchVO") BoardUseInfVO bdUseVO, @ModelAttribute("boardUseInf") BoardUseInf boardUseInf,
			@RequestParam Map<String, Object> commandMap, SessionStatus status, ModelMap model) throws Exception {
	
	checkAuthority(bdUseVO);	// server-side 권한 확인
	
	String paramTrgetId = (String)commandMap.get("param_trgetId");
	String bbsId = (String)commandMap.get("bbsId");
	
	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	
	if (isAuthenticated) {
	    boardUseInf.setUseAt("Y");
	    boardUseInf.setFrstRegisterId(user.getUniqId());
	    boardUseInf.setRegistSeCode("REGC07");
	    boardUseInf.setBbsId(bbsId);
	    boardUseInf.setTrgetId(paramTrgetId);
	
	    bbsUseService.insertBBSUseInf(boardUseInf);
	}
	
	return "forward:/cop/com/selectCmyBBSUseInfsByTrget.do";
	}

	/**
	 * 커뮤니티 관리자 및 동호회 운영자 권한을 확인한다.
	 * 
	 * @param userVO
	 * @throws EgovBizException
	 */
	protected void checkAuthority(UserInfVO userVO) throws Exception {
	String targetId = userVO.getTrgetId();
	
	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	
	
	if (user == null) {
	    throw new EgovBizException("인증된 사용자 정보가 존재하지 않습니다.");
	}
	
	if (targetId.startsWith("CMMNTY_")) {
	    CommunityUser cmmntyUser = new CommunityUser();
	    
	    cmmntyUser.setCmmntyId(userVO.getTrgetId());
	    cmmntyUser.setEmplyrId(user.getUniqId());
	    
	    if (!cmmntyService.isManager(cmmntyUser)) {
		throw new EgovBizException("해당 커뮤니티 관리자만 사용하실 수 있습니다.");
	    }
	} else if (targetId.startsWith("CLB_")) {
	    ClubUser clubUser = new ClubUser();
	    
	    clubUser.setClbId(userVO.getTrgetId());
	    clubUser.setEmplyrId(user.getUniqId());
	    
	    if (!clbService.isOperator(clubUser)) {
		throw new EgovBizException("해당 동호회 운영자만 사용하실 수 있습니다.");
	    }
	} else {
	    throw new EgovBizException("대상ID 정보가 정확하지 않습니다.");
	}
	}

	/**
	 * 커뮤니티 관리자 및 동호회 운영자 권한을 확인한다.
	 * 
	 * @param boardUseInf
	 * @throws EgovBizException
	 */
	protected void checkAuthority(BoardUseInf boardUseInf) throws Exception {
	String targetId = boardUseInf.getTrgetId();
	
	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	
	if (user == null) {
	    throw new EgovBizException("인증된 사용자 정보가 존재하지 않습니다.");
	}
	
	if (targetId.startsWith("CMMNTY_")) {
	    CommunityUser cmmntyUser = new CommunityUser();
	    
	    cmmntyUser.setCmmntyId(boardUseInf.getTrgetId());
	    cmmntyUser.setEmplyrId(user.getUniqId());
	    
	    if (!cmmntyService.isManager(cmmntyUser)) {
		throw new EgovBizException("해당 커뮤니티 관리자만 사용하실 수 있습니다.");
	    }
	} else if (targetId.startsWith("CLB_")) {
	    ClubUser clubUser = new ClubUser();
	    
	    clubUser.setClbId(boardUseInf.getTrgetId());
	    clubUser.setEmplyrId(user.getUniqId());
	    
	    if (!clbService.isOperator(clubUser)) {
		throw new EgovBizException("해당 동호회 운영자만 사용하실 수 있습니다.");
	    }
	} else {
	    throw new EgovBizException("대상ID 정보가 정확하지 않습니다.");
	}
	}
}
