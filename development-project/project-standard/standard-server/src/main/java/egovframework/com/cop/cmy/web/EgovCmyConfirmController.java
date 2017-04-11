package egovframework.com.cop.cmy.web;

import java.util.Map;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cop.clb.service.ClubUser;
import egovframework.com.cop.clb.service.EgovClubManageService;
import egovframework.com.cop.cmy.service.CommunityUser;
import egovframework.com.cop.cmy.service.ConfirmHistory;
import egovframework.com.cop.cmy.service.ConfirmHistoryVO;
import egovframework.com.cop.cmy.service.EgovCommunityManageService;
import egovframework.com.cop.cmy.service.EgovConfirmManageService;

import egovframework.rte.fdl.cmmn.exception.EgovBizException;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

/**
 * 커뮤니티 관련 승인정보 관리를 위한 컨트롤러 클래스
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
 *   2009.4.10  이삼섭          최초 생성
 *   2011.07.21 안민정          커뮤니티 관련 메소드 분리 
 *
 * </pre>
 */
@Controller
public class EgovCmyConfirmController {
	
	 
	 

    @Resource(name = "EgovConfirmManageService")
    private EgovConfirmManageService confmService;

    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;
    
    @Resource(name = "EgovCommunityManageService")
    private EgovCommunityManageService cmmntyService;	// 커뮤니티 관리자 권한 확인
    
    @Resource(name = "EgovClubManageService")
    private EgovClubManageService clubService;		// 동호회 운영자 권한 확인

    //Logger log = Logger.getLogger(this.getClass());
    
    /**
     * 커뮤니티 관리자 및 동호회 운영자 권한을 확인한다.
     * 
     * @param history
     * @throws EgovBizException
     */
    protected void checkAuthority(ConfirmHistory history) throws Exception {
	String targetId = history.getTrgetId();
	
	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	
	if (user == null) {
	    throw new EgovBizException("인증된 사용자 정보가 존재하지 않습니다.");
	}
	
	if (targetId.startsWith("CMMNTY_")) {
	    CommunityUser cmmntyUser = new CommunityUser();
	    
	    cmmntyUser.setCmmntyId(history.getTrgetId());
	    cmmntyUser.setEmplyrId(user.getUniqId());
	    
	    if (!cmmntyService.isManager(cmmntyUser)) {
		throw new EgovBizException("해당 커뮤니티 관리자만 사용하실 수 있습니다.");
	    }
	} else if (targetId.startsWith("CLB_")) {
	    ClubUser clubUser = new ClubUser();
	    
	    clubUser.setClbId(history.getTrgetId());
	    clubUser.setEmplyrId(user.getUniqId());
	    
	    if (!clubService.isOperator(clubUser)) {
		throw new EgovBizException("해당 동호회 운영자만 사용하실 수 있습니다.");
	    }
	} else {
	    throw new EgovBizException("대상ID 정보가 정확하지 않습니다.");
	}
    }

    /**
     * 승인(탈퇴)요청에 대한 확인을 처리한다.
     * 
     * @param history
     * @param sessionVO
     * @param status
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/com/updateConfirmRequest.do")
    public String updateConfirmRequest(@ModelAttribute("history") ConfirmHistory history, SessionStatus status, ModelMap model) throws Exception {
	if (! "".equals(history.getTrgetId())) {
	    checkAuthority(history);	// server-side 권한 확인
	}
	
	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

	history.setConfmerId(user.getUniqId());
	
	if (isAuthenticated) {
	    confmService.updateConfirmRequest(history);
	}

	if ("".equals(history.getTrgetId())) {
	    return "forward:/cop/com/selectConfirmRequest.do";
	} else {
	    return "forward:/cop/com/selectConfirmRequestByTrget.do";
	}
    }

    /**
     * 커뮤니티/동호회 관리부분에서 승인(탈퇴)요청에 대한 목록을 조회한다.
     * 
     * @param historyvO
     * @param sessionVO
     * @param status
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/com/selectConfirmRequestByTrget.do")
    public String selectConfirmRequestByTrget(@ModelAttribute("searchVO") ConfirmHistoryVO historyVO, SessionStatus status, ModelMap model)
	    throws Exception {

	checkAuthority(historyVO);	// server-side 권한 확인
	
	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	@SuppressWarnings("unused")
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

	historyVO.setPageUnit(propertyService.getInt("pageUnit"));
	historyVO.setPageSize(propertyService.getInt("pageSize"));

	PaginationInfo paginationInfo = new PaginationInfo();
	
	paginationInfo.setCurrentPageNo(historyVO.getPageIndex());
	paginationInfo.setRecordCountPerPage(historyVO.getPageUnit());
	paginationInfo.setPageSize(historyVO.getPageSize());

	historyVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	historyVO.setLastIndex(paginationInfo.getLastRecordIndex());
	historyVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	historyVO.setConfmerId(user.getUniqId());

	Map<String, Object> map = confmService.selectConfirmRequest(historyVO);
	int totCnt = Integer.parseInt((String)map.get("resultCnt"));
	
	paginationInfo.setTotalRecordCount(totCnt);

	model.addAttribute("resultList", map.get("resultList"));
	model.addAttribute("resultCnt", map.get("resultCnt"));
	model.addAttribute("paginationInfo", paginationInfo);

	return "egovframework/com/cop/com/EgovConfirmList";
    }
	
}
