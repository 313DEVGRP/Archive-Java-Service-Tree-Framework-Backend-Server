package egovframework.com.cop.cmy.web;

import java.util.Map;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cop.bbs.service.BoardUseInf;
import egovframework.com.cop.clb.service.ClubUser;
import egovframework.com.cop.clb.service.EgovClubManageService;
import egovframework.com.cop.cmy.service.CommunityUser;
import egovframework.com.cop.cmy.service.EgovCommunityManageService;
import egovframework.com.cop.com.service.EgovUserInfManageService;
import egovframework.com.cop.com.service.UserInfVO;
import egovframework.com.utl.fcc.service.EgovDateUtil;

import egovframework.rte.fdl.cmmn.exception.EgovBizException;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


/**
 * 협업기능에서 활용하는 사용자 정보 조회용 컨트롤러 클래스
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
 *   2009.4.6   이삼섭    	최초 생성
 *	 2011.07.21 안민정     	커뮤니티 관련 메소드 분리
 *	 2011.9.7	정진오		재가입시 발생하는 오류를 수정하기 위하여
 *							운영자가 아닌 사용자(클럽, 커뮤니티 모두)로 초기화함.
 *
 * </pre>
 */
@Controller
public class EgovCmyUserInfController {




    @Resource(name = "EgovUserInfManageService")
    private EgovUserInfManageService userInfService;

    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;

    //Logger log = Logger.getLogger(this.getClass());

    @Resource(name = "EgovCommunityManageService")
    private EgovCommunityManageService cmmntyService;	// 커뮤니티 관리자 권한 확인

    @Resource(name = "EgovClubManageService")
    private EgovClubManageService clbService;			// 동호회 운영자 권한 확인





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
     * 커뮤니티 사용자 목록을 조회한다.
     *
     * @param userVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/com/selectCmmntyUserList.do")
    public String selectCmmntyUserList(@ModelAttribute("searchVO") UserInfVO userVO, @RequestParam Map<String, Object> commandMap, ModelMap model) throws Exception {

	String popFlag = (String)commandMap.get("PopFlag");
	String returnUrl = "egovframework/com/cop/com/EgovUserList";

	if ("Y".equals(popFlag)) {
	    returnUrl = "egovframework/com/cop/com/EgovUserListPop";
	}

	if (! "Y".equals(popFlag)) {
	    checkAuthority(userVO);	// server-side 권한 확인
	}

	String trgetId = (String)commandMap.get("trgetId");

	userVO.setTrgetId(trgetId);
	userVO.setPageUnit(propertyService.getInt("pageUnit"));
	userVO.setPageSize(propertyService.getInt("pageSize"));

	PaginationInfo paginationInfo = new PaginationInfo();

	paginationInfo.setCurrentPageNo(userVO.getPageIndex());
	paginationInfo.setRecordCountPerPage(userVO.getPageUnit());
	paginationInfo.setPageSize(userVO.getPageSize());

	userVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	userVO.setLastIndex(paginationInfo.getLastRecordIndex());
	userVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

	Map<String, Object> map = userInfService.selectCmmntyUserList(userVO);
	int totCnt = Integer.parseInt((String)map.get("resultCnt"));

	paginationInfo.setTotalRecordCount(totCnt);

	model.addAttribute("resultList", map.get("resultList"));
	model.addAttribute("resultCnt", map.get("resultCnt"));
	model.addAttribute("targetMethod", "selectCmmntyUserList");
	model.addAttribute("trgetId", trgetId);
	model.addAttribute("paginationInfo", paginationInfo);

	return returnUrl;
    }

    /**
     * 커뮤니티 관리자 목록을 조회한다.
     *
     * @param userVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/com/selectCmmntyMngrList.do")
    public String selectCmmntyMngrList(@ModelAttribute("searchVO") UserInfVO userVO, @RequestParam  Map<String, Object> commandMap, ModelMap model) throws Exception {

	String popFlag = (String)commandMap.get("PopFlag");
	String returnUrl = "egovframework/com/cop/com/EgovUserList";

	if ("Y".equals(popFlag)) {
	    returnUrl = "egovframework/com/cop/com/EgovUserListPop";
	} else if ("S".equals(popFlag)) {
	    returnUrl = "egovframework/com/cop/com/EgovCmmntyMngrListPop";
	}

	String trgetId = (String)commandMap.get("trgetId");

	userVO.setTrgetId(trgetId);
	userVO.setPageUnit(propertyService.getInt("pageUnit"));
	userVO.setPageSize(propertyService.getInt("pageSize"));

	PaginationInfo paginationInfo = new PaginationInfo();

	paginationInfo.setCurrentPageNo(userVO.getPageIndex());
	paginationInfo.setRecordCountPerPage(userVO.getPageUnit());
	paginationInfo.setPageSize(userVO.getPageSize());

	userVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	userVO.setLastIndex(paginationInfo.getLastRecordIndex());
	userVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

	Map<String, Object> map = userInfService.selectCmmntyMngrList(userVO);
	int totCnt = Integer.parseInt((String)map.get("resultCnt"));

	paginationInfo.setTotalRecordCount(totCnt);

	model.addAttribute("resultList", map.get("resultList"));
	model.addAttribute("resultCnt", map.get("resultCnt"));
	model.addAttribute("targetMethod", "selectCmmntyMngrList");
	model.addAttribute("trgetId", trgetId);
	model.addAttribute("paginationInfo", paginationInfo);

	return returnUrl;
    }
	/**
	 * 동호회 운영자 목록을 조회한다.
	 *
	 * @param userVO
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/cop/com/selectClubOprtrList.do")
	public String selectClubOprtrList(@ModelAttribute("searchVO") UserInfVO userVO, @RequestParam Map<String, Object> commandMap, ModelMap model) throws Exception {

	String popFlag = (String)commandMap.get("PopFlag");
	String returnUrl = "egovframework/com/cop/com/EgovUserList";

	if ("Y".equals(popFlag)) {
	    returnUrl = "egovframework/com/cop/com/EgovUserListPop";
	} else if ("S".equals(popFlag)) {
	    returnUrl = "egovframework/com/cop/com/EgovClbOprtrListPop";
	}

	String trgetId = (String)commandMap.get("trgetId");

	userVO.setTrgetId(trgetId);
	userVO.setPageUnit(propertyService.getInt("pageUnit"));
	userVO.setPageSize(propertyService.getInt("pageSize"));

	PaginationInfo paginationInfo = new PaginationInfo();

	paginationInfo.setCurrentPageNo(userVO.getPageIndex());
	paginationInfo.setRecordCountPerPage(userVO.getPageUnit());
	paginationInfo.setPageSize(userVO.getPageSize());

	userVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	userVO.setLastIndex(paginationInfo.getLastRecordIndex());
	userVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

	Map<String, Object> map = userInfService.selectClubOprtrList(userVO);
	int totCnt = Integer.parseInt((String)map.get("resultCnt"));

	paginationInfo.setTotalRecordCount(totCnt);

	model.addAttribute("resultList", map.get("resultList"));
	model.addAttribute("resultCnt", map.get("resultCnt"));
	model.addAttribute("targetMethod", "selectClubOprtrList");
	model.addAttribute("trgetId", trgetId);
	model.addAttribute("paginationInfo", paginationInfo);

	return returnUrl;
	}
	/**
	 * 동호회 사용자 목록을 조회한다.
	 *
	 * @param userVO
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/cop/com/selectClubUserList.do")
	public String selectClubUserList(@ModelAttribute("searchVO") UserInfVO userVO, @RequestParam Map<String, Object> commandMap, ModelMap model) throws Exception {

	String popFlag = (String)commandMap.get("PopFlag");
	String returnUrl = "egovframework/com/cop/com/EgovUserList";

	if ("Y".equals(popFlag)) {
	    returnUrl = "egovframework/com/cop/com/EgovUserListPop";
	}

	if (! "Y".equals(popFlag)) {
	    checkAuthority(userVO);	// server-side 권한 확인
	}

	String trgetId = (String)commandMap.get("trgetId");

	userVO.setTrgetId(trgetId);
	userVO.setPageUnit(propertyService.getInt("pageUnit"));
	userVO.setPageSize(propertyService.getInt("pageSize"));

	PaginationInfo paginationInfo = new PaginationInfo();

	paginationInfo.setCurrentPageNo(userVO.getPageIndex());
	paginationInfo.setRecordCountPerPage(userVO.getPageUnit());
	paginationInfo.setPageSize(userVO.getPageSize());

	userVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	userVO.setLastIndex(paginationInfo.getLastRecordIndex());
	userVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

	Map<String, Object> map = userInfService.selectClubUserList(userVO);
	int totCnt = Integer.parseInt((String)map.get("resultCnt"));

	paginationInfo.setTotalRecordCount(totCnt);

	model.addAttribute("resultList", map.get("resultList"));
	model.addAttribute("resultCnt", map.get("resultCnt"));
	model.addAttribute("targetMethod", "selectClubUserList");
	model.addAttribute("trgetId", trgetId);
	model.addAttribute("paginationInfo", paginationInfo);

	return returnUrl;
	}


    /**
     * 커뮤니티 사용정보를 삭제한다.
     *
     * @param userVO
     * @param commandMap
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/com/deleteCmmntyUser.do")
    public String deleteCmmntyUser(@ModelAttribute("searchVO") UserInfVO userVO, @RequestParam Map<String, Object> commandMap, ModelMap model) throws Exception {

	checkAuthority(userVO);	// server-side 권한 확인

	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

	String cmmntyId = (String)commandMap.get("param_cmmntyId");
	String emplyrId = (String)commandMap.get("param_emplyrId");

	CommunityUser cmmntyUser = new CommunityUser();

	cmmntyUser.setLastUpdusrId(user.getUniqId());
	cmmntyUser.setCmmntyId(cmmntyId);
	cmmntyUser.setEmplyrId(emplyrId);
	cmmntyUser.setSecsnDe(EgovDateUtil.getToday());

	if (isAuthenticated) {
	    cmmntyService.deleteCommunityUserInf(cmmntyUser);
	}

	return "forward:/cop/com/selectCmmntyUserList.do";
    }

    /**
     * 커뮤니티 사용자 정보를 수정한다.
     *
     * @param userVO
     * @param commandMap
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/com/reRegistCmmntyUser.do")
    public String reRegisterCmmntyUser(@ModelAttribute("searchVO") UserInfVO userVO, @RequestParam Map<String, Object> commandMap, ModelMap model) throws Exception {

	checkAuthority(userVO);	// server-side 권한 확인

	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

	String cmmntyId = (String)commandMap.get("param_cmmntyId");
	String emplyrId = (String)commandMap.get("param_emplyrId");

	CommunityUser cmmntyUser = new CommunityUser();

	cmmntyUser.setLastUpdusrId(user.getUniqId());
	cmmntyUser.setCmmntyId(cmmntyId);
	cmmntyUser.setEmplyrId(emplyrId);
	cmmntyUser.setUseAt("Y");
	cmmntyUser.setMngrAt("N");		//재가입시 운영자가 아닌 사용자로 초기화함. 값 설정 없을 시 SQL 에러 발생(2011.9.7 추가사항)

	if (isAuthenticated) {
	    cmmntyService.updateCommunityUserInf(cmmntyUser);
	}

	return "forward:/cop/com/selectCmmntyUserList.do";
    }

    /**
     * 커뮤니티 사용자 정보를 수정한다.
     *
     * @param userVO
     * @param commandMap
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/com/registCmmntyManager.do")
    public String registCmmntyManager(@ModelAttribute("searchVO") UserInfVO userVO, @RequestParam Map<String, Object> commandMap, ModelMap model) throws Exception {

	checkAuthority(userVO);	// server-side 권한 확인

	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

	String cmmntyId = (String)commandMap.get("param_cmmntyId");
	String emplyrId = (String)commandMap.get("param_emplyrId");

	CommunityUser cmmntyUser = new CommunityUser();

	cmmntyUser.setLastUpdusrId(user.getUniqId());
	cmmntyUser.setCmmntyId(cmmntyId);
	cmmntyUser.setEmplyrId(emplyrId);
	cmmntyUser.setUseAt("Y");
	cmmntyUser.setMngrAt("Y");

	if (isAuthenticated) {
	    cmmntyService.updateCommunityUserInf(cmmntyUser);
	}

	return "forward:/cop/com/selectCmmntyUserList.do";
    }

    /**
     * 동호회 사용자 정보를 삭제한다.
     *
     * @param userVO
     * @param commandMap
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/com/deleteClbUser.do")
    public String deleteClbUser(@ModelAttribute("searchVO") UserInfVO userVO, @RequestParam Map<String, Object> commandMap, ModelMap model) throws Exception {

	checkAuthority(userVO);	// server-side 권한 확인

	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

	String clbId = (String)commandMap.get("param_clbId");
	String emplyrId = (String)commandMap.get("param_emplyrId");

	ClubUser clubUser = new ClubUser();

	clubUser.setLastUpdusrId(user.getUniqId());
	clubUser.setClbId(clbId);
	clubUser.setEmplyrId(emplyrId);
	clubUser.setSecsnDe(EgovDateUtil.getToday());

	if (isAuthenticated) {
	    clbService.deleteClubUserInf(clubUser);
	}

	return "forward:/cop/com/selectClubUserList.do";
    }

    /**
     * 동호회에 대한 사용자를 재가입 신청한다.
     *
     * @param userVO
     * @param commandMap
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/com/reRegistClbUser.do")
    public String reRegistClbUser(@ModelAttribute("searchVO") UserInfVO userVO, @RequestParam Map<String, Object> commandMap, ModelMap model) throws Exception {

	checkAuthority(userVO);	// server-side 권한 확인

	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

	String clbId = (String)commandMap.get("param_clbId");
	String emplyrId = (String)commandMap.get("param_emplyrId");

	ClubUser clubUser = new ClubUser();
	clubUser.setLastUpdusrId(user.getUniqId());
	clubUser.setClbId(clbId);
	clubUser.setEmplyrId(emplyrId);
	clubUser.setUseAt("Y");
	clubUser.setOprtrAt("N");	//재가입시 운영자가 아닌 사용자로 초기화함. 값 설정 없을 시 SQL 에러 발생(2011.9.7 추가사항)

	if (isAuthenticated) {
	    clbService.updateClubUserInf(clubUser);
	}

	return "forward:/cop/com/selectClubUserList.do";
    }

    /**
     * 동호회에 대한 운영진 등록을 처리한다.
     *
     * @param userVO
     * @param commandMap
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/com/registClbOprtr.do")
    public String registClbOprtr(@ModelAttribute("searchVO") UserInfVO userVO, @RequestParam Map<String, Object> commandMap, ModelMap model) throws Exception {

	checkAuthority(userVO);	// server-side 권한 확인

	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	isAuthenticated = true;

	String clbId = (String)commandMap.get("param_clbId");
	String emplyrId = (String)commandMap.get("param_emplyrId");

	ClubUser clubUser = new ClubUser();

	clubUser.setLastUpdusrId(user.getUniqId());
	clubUser.setClbId(clbId);
	clubUser.setEmplyrId(emplyrId);
	clubUser.setUseAt("Y");
	clubUser.setOprtrAt("Y");

	if (isAuthenticated) {
	    clbService.updateClubUserInf(clubUser);
	}

	return "forward:/cop/com/selectClubUserList.do";
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
