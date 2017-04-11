package egovframework.com.cop.cmy.web;

import java.util.HashMap;
import java.util.Map;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cop.clb.service.Club;
import egovframework.com.cop.clb.service.ClubVO;
import egovframework.com.cop.clb.service.EgovClubManageService;
import egovframework.com.cop.cmy.service.CommunityUser;
import egovframework.com.cop.cmy.service.EgovCommunityManageService;

import egovframework.rte.fdl.cmmn.exception.EgovBizException;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springmodules.validation.commons.DefaultBeanValidator;

/**
 * 커뮤니티, 동호회 정보를 관리하기 위한 컨트롤러 클래스
 * @author 공통서비스개발팀 이삼섭
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------        --------    ---------------------------
 *   2009. 4. 4  이삼섭          최초 생성
 *   2011. 07.21 안민정          커뮤니티 관련 메소드 분리
 * </pre>
 */


@Controller
public class EgovCmyClubManageController {

    @Resource(name = "EgovCommunityManageService")
    private EgovCommunityManageService cmmntyService;	// 커뮤니티 관리자 권한 확인
    
	@Resource(name = "EgovClubManageService")
	private EgovClubManageService clubService;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;

	@Autowired
	private DefaultBeanValidator beanValidator;
	
	/**
	 * 커뮤니티 관리자 및 동호회 운영자 권한을 확인한다.
	 * 
	 * @param boardMaster
	 * @throws EgovBizException
	 */
	protected void checkAuthority(Club club) throws Exception {
	String targetId = club.getTrgetId();

	
	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	
	if (user == null) {
	    throw new EgovBizException("인증된 사용자 정보가 존재하지 않습니다.");
	}
	
	if (targetId.startsWith("CMMNTY_")) {
	    CommunityUser cmmntyUser = new CommunityUser();
	    
	    cmmntyUser.setCmmntyId(club.getTrgetId());
	    cmmntyUser.setEmplyrId(user.getUniqId());
	    
	    if (!cmmntyService.isManager(cmmntyUser)) {
		throw new EgovBizException("해당 커뮤니티 관리자만 사용하실 수 있습니다.");
	    }
	} else if (targetId.startsWith("CLB_")) {
	    throw new EgovBizException("동호회에서 사용하실 수 없습니다.");
	} else {
	    throw new EgovBizException("대상ID 정보가 정확하지 않습니다.");
	}
	}

	/**
	 * 동호회 정보를 등록한다.
	 * 
	 * @param clubVO
	 * @param club
	 * @param bindingResult
	 * @param status
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/cop/clb/insertClubInfByTrget.do")
	public String insertClubInfByTrget(@ModelAttribute("searchVO") ClubVO clubVO, @ModelAttribute("club") Club club, BindingResult bindingResult,
	    SessionStatus status, ModelMap model) throws Exception {
	
	checkAuthority(clubVO);	// server-side 권한 확인
	
	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	
	beanValidator.validate(club, bindingResult);
	
	if (bindingResult.hasErrors()) {
	    model.addAttribute("clubVO", clubVO);
	    return "egovframework/com/cop/clb/EgovClubRegistByTrget";
	}
	
	club.setUseAt("Y");
	club.setRegistSeCode("REGC03");
	club.setFrstRegisterId(user.getUniqId());
	
	if (isAuthenticated) {
	    clubService.insertClubInf(club);
	}
	
	return "forward:/cop/clb/selectCmmntyClubList.do";
	}

	/**
	 * 특정 커뮤니티에 사용되는 동호회 목록을 조회한다.
	 * 
	 * @param clubVO
	 * @param sessionVO
	 * @param commandMap
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/cop/clb/selectCmmntyClubList.do")
	public String selectCmmntyClubList(@ModelAttribute("searchVO") ClubVO clubVO, @RequestParam Map<String, Object> commandMap, ModelMap model) throws Exception {
	checkAuthority(clubVO);	// server-side 권한 확인
	
	clubVO.setPageUnit(propertyService.getInt("pageUnit"));
	clubVO.setPageSize(propertyService.getInt("pageSize"));
	
	PaginationInfo paginationInfo = new PaginationInfo();
	
	paginationInfo.setCurrentPageNo(clubVO.getPageIndex());
	paginationInfo.setRecordCountPerPage(clubVO.getPageUnit());
	paginationInfo.setPageSize(clubVO.getPageSize());
	
	clubVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	clubVO.setLastIndex(paginationInfo.getLastRecordIndex());
	clubVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	
	HashMap<?, ?> _map = (HashMap<?, ?>)clubService.selectClubInfsByTrgetId(clubVO);
	int totCnt = Integer.parseInt((String)_map.get("resultCnt"));
	
	paginationInfo.setTotalRecordCount(totCnt);
	
	model.addAttribute("resultList", _map.get("resultList"));
	model.addAttribute("resultCnt", _map.get("resultCnt"));
	model.addAttribute("trgetId", clubVO.getTrgetId());
	model.addAttribute("trgetNm", clubVO.getCmmntyNm());
	model.addAttribute("paginationInfo", paginationInfo);
	
	return "egovframework/com/cop/clb/EgovClubListByTrget";
	}

	/**
	 * 커뮤니티에 사용되는 동호회 정보를 수정한다.
	 * 
	 * @param clubVO
	 * @param club
	 * @param sessionVO
	 * @param status
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/cop/clb/updateCmmntyClbInf.do")
	public String updateCmmntyClbInf(@ModelAttribute("searchVO") ClubVO clubVO, @ModelAttribute("club") Club club, BindingResult bindingResult,
	    SessionStatus status, ModelMap model) throws Exception {
	
	checkAuthority(clubVO);	// server-side 권한 확인
	
	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	
	beanValidator.validate(club, bindingResult);
	if (bindingResult.hasErrors()) {
	
	    Map<String, Object> map = clubService.selectClubInf(clubVO);
	    ClubVO vo = (ClubVO)map.get("clubVO");
	    
	    model.addAttribute("clubVO", vo);
	    model.addAttribute("result", map.get("resultList"));
	
	    return "egovframework/com/cop/clb/EgovClubUpdtByTrget";
	}
	
	club.setLastUpdusrId(user.getUniqId());
	
	if (isAuthenticated) {
	    clubService.updateClubInf(club);
	}
	
	return "forward:/cop/clb/selectCmmntyClubList.do";
	}

}
