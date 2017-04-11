package egovframework.com.cop.cmy.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cop.bbs.service.BoardMasterVO;
import egovframework.com.cop.bbs.service.BoardVO;
import egovframework.com.cop.bbs.service.EgovBBSAttributeManageService;
import egovframework.com.cop.bbs.service.EgovBBSManageService;
import egovframework.com.cop.clb.service.Club;
import egovframework.com.cop.clb.service.ClubVO;
import egovframework.com.cop.clb.service.EgovClubManageService;
import egovframework.com.cop.cmy.service.Community;
import egovframework.com.cop.cmy.service.CommunityUser;
import egovframework.com.cop.cmy.service.CommunityVO;
import egovframework.com.cop.cmy.service.ConfirmHistory;
import egovframework.com.cop.cmy.service.EgovCommunityManageService;
import egovframework.com.cop.cmy.service.EgovConfirmManageService;
import egovframework.com.utl.fcc.service.EgovDateUtil;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
 * 커뮤니티 정보를 관리하기 위한 컨트롤러 클래스
 * @author 공통서비스개발팀 이삼섭
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *   -------       --------    ---------------------------
 *   2009.4.2	이삼섭          최초 생성
 *   2011.8.26	정진오			IncludedInfo annotation 추가
 *   2011.9.7	정진오			커뮤니티 탈퇴 요청이 정상적으로 이뤄지지 않은 사항 수정함
 *   							커뮤니티 탈퇴 요청시 승인자를 선택하므로 탈퇴 승인자가 자신이 될 수 없음에도
 *   							세션에서 가져온 값(탈퇴신청자)을 탈퇴승인자로 설정하도록 되어 있었음
 *
 * </pre>
 */

@Controller
public class EgovCommunityManageController {
	
    @Resource(name = "EgovCommunityManageService")
    private EgovCommunityManageService cmmntyService;

    @Resource(name = "EgovBBSAttributeManageService")
    private EgovBBSAttributeManageService bbsAttrbService;

    @Resource(name = "EgovClubManageService")
    private EgovClubManageService clubService;

    @Resource(name = "EgovConfirmManageService")
    private EgovConfirmManageService confmService;

    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;

    @Resource(name = "EgovBBSManageService")
    private EgovBBSManageService bbsMngService;

    @Autowired
    private DefaultBeanValidator beanValidator;

    //Logger log = Logger.getLogger(this.getClass());
	
	/**
     * 커뮤니티에 대한 목록을 조회한다.
     * 
     * @param cmmntyVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @IncludedInfo(name="커뮤니티관리", order = 270 ,gid = 40)
    @RequestMapping("/cop/cmy/selectCmmntyInfs.do")
    public String selectCmmntyInfs(@ModelAttribute("searchVO") CommunityVO cmmntyVO, ModelMap model) throws Exception {
	cmmntyVO.setPageUnit(propertyService.getInt("pageUnit"));
	cmmntyVO.setPageSize(propertyService.getInt("pageSize"));

	PaginationInfo paginationInfo = new PaginationInfo();
	
	paginationInfo.setCurrentPageNo(cmmntyVO.getPageIndex());
	paginationInfo.setRecordCountPerPage(cmmntyVO.getPageUnit());
	paginationInfo.setPageSize(cmmntyVO.getPageSize());

	cmmntyVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	cmmntyVO.setLastIndex(paginationInfo.getLastRecordIndex());
	cmmntyVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

	Map<String, Object> map = cmmntyService.selectCommunityInfs(cmmntyVO);
	int totCnt = Integer.parseInt((String)map.get("resultCnt"));
	
	paginationInfo.setTotalRecordCount(totCnt);

	model.addAttribute("resultList", map.get("resultList"));
	model.addAttribute("resultCnt", map.get("resultCnt"));
	model.addAttribute("paginationInfo", paginationInfo);

	return "egovframework/com/cop/cmy/EgovCmmntyList";
    }

    /**
     * 커뮤니티 등록을 위한 등록페이지로 이동한다.
     * 
     * @param cmmntyVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/cmy/addCmmntyInf.do")
    public String addCmmntyInf(@ModelAttribute("searchVO") CommunityVO cmmntyVO, ModelMap model) throws Exception {
	return "egovframework/com/cop/cmy/EgovCmmntyRegist";
    }

    /**
     * 커뮤니티 정보를 등록한다.
     * 
     * @param cmmntyVO
     * @param cmmnty
     * @param sessionVO
     * @param status
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/cmy/insertCmmntyInf.do")
    public String insertCmmntyInf(@ModelAttribute("searchVO") CommunityVO cmmntyVO, @ModelAttribute("community") Community community,
	    BindingResult bindingResult, SessionStatus status, ModelMap model) throws Exception {

	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

	beanValidator.validate(community, bindingResult);

	if (bindingResult.hasErrors()) {
	    return "egovframework/com/cop/cmy/EgovCmmntyRegist";
	}

	community.setUseAt("Y");
	community.setRegistSeCode("REGC02");
	community.setFrstRegisterId(user.getUniqId());

	
	if (isAuthenticated) {
	    cmmntyService.insertCommunityInf(community);
	}

	return "forward:/cop/cmy/selectCmmntyInfs.do";
    }

    /**
     * 커뮤니티에 대한 상세정보를 조회한다.
     * 
     * @param cmmntyVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/cmy/selectCmmntyInf.do")
    public String selectCmmntyInf(@ModelAttribute("searchVO") CommunityVO cmmntyVO, ModelMap model, HttpServletRequest request) throws Exception {
	Map<String, Object> map = cmmntyService.selectCommunityInf(cmmntyVO);
	CommunityVO vo = (CommunityVO)map.get("cmmntyVO");
	
	//-----------------------
	// 제공 URL 
	//-----------------------
	vo.setProvdUrl(request.getContextPath()+ "/cop/cmy/CmmntyMainPage.do?cmmntyId=" + vo.getCmmntyId());
	////---------------------

	model.addAttribute("cmmntyVO", vo);
	model.addAttribute("result", map.get("resultList"));

	return "egovframework/com/cop/cmy/EgovCmmntyInqire";
    }

    /**
     * 커뮤니티 정보 수정을 위한 수정페이지로 이동한다.
     * 
     * @param cmmntyVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/cmy/forUpdateCmmntyInf.do")
    public String forUpdateCmmntyInf(@ModelAttribute("searchVO") CommunityVO cmmntyVO, @RequestParam Map<String, Object> commandMap, ModelMap model)
	    throws Exception {

	String cmmntyId = (String)commandMap.get("param_cmmntyId");
	cmmntyVO.setCmmntyId(cmmntyId);
	
	Map<String, Object> map = cmmntyService.selectCommunityInf(cmmntyVO);
	
	model.addAttribute("cmmntyVO", (CommunityVO)map.get("cmmntyVO"));
	model.addAttribute("cmmntyUser", (CommunityUser)map.get("cmmntyUser"));
	model.addAttribute("result", map.get("resultList"));

	return "egovframework/com/cop/cmy/EgovCmmntyUpdt";
    }

    /**
     * 커뮤니티 정보를 수정한다.
     * 
     * @param cmmntyVO
     * @param sessionVO
     * @param status
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/cmy/updtCmmntyInf.do")
    public String updtCmmntyInf(@ModelAttribute("searchVO") CommunityVO cmmntyVO, @ModelAttribute("community") Community community,
	    BindingResult bindingResult, SessionStatus status, ModelMap model) throws Exception {

	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

	beanValidator.validate(community, bindingResult);
	if (bindingResult.hasErrors()) {

	    Map<String, Object> map = cmmntyService.selectCommunityInf(cmmntyVO);
	    CommunityVO vo = (CommunityVO)map.get("cmmntyVO");

	    model.addAttribute("cmmntyVO", vo);
	    model.addAttribute("result", map.get("resultList"));

	    return "egovframework/com/cop/cmy/EgovCmmntyUpdt";
	}

	community.setLastUpdusrId(user.getUniqId());
	
	if (isAuthenticated) {
	    if ("Y".equals(community.getUseAt())) {
		cmmntyService.updateCommunityInf(community);
	    } else {
		cmmntyService.deleteCommunityInf(community);
	    }

	}

	return "forward:/cop/cmy/selectCmmntyInfs.do";
    }

    /**
     * 포트릿을 위한 커뮤니티 정보 목록 정보를 조회한다.
     * 
     * @param cmmntyVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/cus/CmmntyListPortlet.do")
    public String selectCmmntyListPortlet(@ModelAttribute("searchVO") CommunityVO cmmntyVO, ModelMap model) throws Exception {
	List<CommunityVO> result = cmmntyService.selectCmmntyListPortlet(cmmntyVO);
	
	model.addAttribute("resultList", result);

	return "egovframework/com/cop/cmy/EgovCmmntyListPortlet";
    }

    /**
     * 커뮤니티 메인페이지를 조회한다.
     * 
     * @param cmmntyVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/cmy/CmmntyMainPage.do")
    public String selectCmmntyMainPage(@ModelAttribute("searchVO") CommunityVO cmmntyVO, ModelMap model) throws Exception {

	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

	cmmntyVO.setEmplyrId(user.getUniqId());

	String tmplatCours = cmmntyService.selectCmmntyTemplat(cmmntyVO);
	if ("".equals(tmplatCours) || tmplatCours == null) {
	    tmplatCours = "egovframework/com/cop/tpl/EgovCmmntyBaseTmpl";
	}
	Map<String, Object> map = cmmntyService.selectCommunityInf(cmmntyVO);

	//model.addAttribute("cmmntyVO", cmmntyVO);
	model.addAttribute("cmmntyVO", (CommunityVO)map.get("cmmntyVO"));
	model.addAttribute("cmmntyUser", (CommunityUser)map.get("cmmntyUser"));
		
	//--------------------------------
	// 게시판 목록 정보 처리
	//--------------------------------
	BoardMasterVO bbsVo = new BoardMasterVO();
	
	bbsVo.setTrgetId(cmmntyVO.getCmmntyId());
	
	List<BoardMasterVO> bbsResult = bbsAttrbService.selectAllBdMstrByTrget(bbsVo);

	model.addAttribute("bbsList", bbsResult);
	////------------------------------

	//--------------------------------
	// 동호회 목록 정보
	//--------------------------------
	Club clubVo = new Club();
	
	clubVo.setCmmntyId(cmmntyVO.getCmmntyId());
	
	List<ClubVO> clubResult = clubService.selectClubListPortletByTrget(clubVo);

	model.addAttribute("clubList", clubResult);
	////------------------------------

	if (isAuthenticated) {
	    model.addAttribute("isAuthenticated", "Y");
	} else {
	    model.addAttribute("isAuthenticated", "N");
	}
	
	return tmplatCours;
    }
	
    /**
     * 커뮤니티 메인페이지의 기본 내용(게시판 4개 표시) 조회한다.
     * 
     * @param cmmntyVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/cmy/CmmntyMainContents.do")
    public String selectCmmntyMainContents(@ModelAttribute("searchVO") CommunityVO cmmntyVO, ModelMap model) throws Exception {
	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	@SuppressWarnings("unused")
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

	cmmntyVO.setEmplyrId(user.getUniqId());

	//--------------------------------
	// 게시판 목록 정보 처리
	//--------------------------------
	BoardMasterVO bbsVo = new BoardMasterVO();
	
	bbsVo.setTrgetId(cmmntyVO.getCmmntyId());
	
	List<BoardMasterVO> bbsResult = bbsAttrbService.selectAllBdMstrByTrget(bbsVo);

	// 방명록 제외 처리
	for (int i = 0; i < bbsResult.size(); i++) {
	    if ("BBST04".equals(bbsResult.get(i).getBbsTyCode())) {
		bbsResult.remove(i);
	    }
	}

	model.addAttribute("bbsList", bbsResult);

	//--------------------------------
	// 게시물 목록 정보 처리
	//--------------------------------
	BoardVO boardVo = null;
	BoardMasterVO masterVo = null;
	
	ArrayList<Object> target = new ArrayList<Object>();	// Object => List<BoardVO>
	for (int i = 0; i < bbsResult.size() && i < 4; i++) {
	    masterVo = bbsResult.get(i);
	    boardVo = new BoardVO();

	    boardVo.setBbsId(masterVo.getBbsId());
	    boardVo.setBbsNm(masterVo.getBbsNm());

	    boardVo.setPageUnit(4);
	    boardVo.setPageSize(4);

	    boardVo.setFirstIndex(0);
	    boardVo.setRecordCountPerPage(4);

	    Map<String, Object> map = bbsMngService.selectBoardArticles(boardVo, masterVo.getBbsAttrbCode());

	    target.add(map.get("resultList"));
	}

	model.addAttribute("articleList", target);

	return "egovframework/com/cop/tpl/EgovCmmntyBaseTmplContents";
    }

    /**
     * 커뮤니티 사용신청을 등록한다.
     * 
     * @param cmmntyUser
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/cmy/insertCmmntyUserBySelf.do")
    public String insertCmmntyUserBySelf(@ModelAttribute("cmmntyUser") CommunityUser cmmntyUser, ModelMap model) throws Exception {
	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

	String retVal = "";

	if ("".equals(cmmntyUser.getMngrAt())) {
	    cmmntyUser.setMngrAt("N");
	}
	cmmntyUser.setUseAt("Y");
	cmmntyUser.setFrstRegisterId(user.getUniqId());
	cmmntyUser.setEmplyrId(user.getUniqId());

	if (isAuthenticated) {

	    //---------------------------------------------
	    // 승인요청 처리
	    //---------------------------------------------
	    //retVal = cmmntyService.insertCommunityUserInf(cmmntyUser);
	    retVal = cmmntyService.checkCommunityUserInf(cmmntyUser);

	    if (!retVal.equals("EXIST")) {
		
		CommunityVO cmmntyVO = new CommunityVO();
		
		cmmntyVO.setCmmntyId(cmmntyUser.getCmmntyId());
		
		CommunityUser manager = cmmntyService.selectManager(cmmntyVO);

		ConfirmHistory history = new ConfirmHistory();

		history.setConfmRqesterId(user.getUniqId()); 		// 요청자 ID
		history.setConfmerId(manager.getEmplyrId()); 		// 관리자
		history.setConfmTyCode("CF11"); 			// 커뮤니티사용자등록
		history.setConfmSttusCode("AP01"); 			// 승인요청
		history.setOpertTyCode("WC01"); 			// 회원가입
		history.setOpertId(""); 				// 작업자 ID
		history.setTrgetJobTyCode("CMY"); 			// 대상작업구분
		history.setTrgetJobId(cmmntyUser.getCmmntyId());	// 대상작업 ID

		int cnt = confmService.countConfirmRequest(history);

		if (cnt == 0) {
		    confmService.insertConfirmRequest(history);
		} else {
		    retVal = "ING";
		}
	    }
	    ////-------------------------------------------
	}

	model.addAttribute("returnMsg", retVal);
	
	return "egovframework/com/cop/cmy/EgovCmmntyMsg";
    }

    /**
     * 팝업을 위한 커뮤니티 목록 정보를 조회한다.
     * 
     * @param cmmntyVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/cmy/selectCmmntyInfsByPop.do")
    public String selectCmmntyInfsByPop(@ModelAttribute("searchVO") CommunityVO cmmntyVO, ModelMap model) throws Exception {
	cmmntyVO.setPageUnit(propertyService.getInt("pageUnit"));
	cmmntyVO.setPageSize(propertyService.getInt("pageSize"));

	PaginationInfo paginationInfo = new PaginationInfo();
	
	paginationInfo.setCurrentPageNo(cmmntyVO.getPageIndex());
	paginationInfo.setRecordCountPerPage(cmmntyVO.getPageUnit());
	paginationInfo.setPageSize(cmmntyVO.getPageSize());

	cmmntyVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	cmmntyVO.setLastIndex(paginationInfo.getLastRecordIndex());
	cmmntyVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

	HashMap<?, ?> _map = (HashMap<?, ?>)cmmntyService.selectCommunityInfs(cmmntyVO);
	int totCnt = Integer.parseInt((String)_map.get("resultCnt"));
	
	paginationInfo.setTotalRecordCount(totCnt);

	model.addAttribute("resultList", _map.get("resultList"));
	model.addAttribute("resultCnt", _map.get("resultCnt"));
	model.addAttribute("paginationInfo", paginationInfo);

	return "egovframework/com/cop/cmy/EgovCmmntyListPop";
    }

    /**
     * 커뮤니티 탈퇴신청을 처리한다.
     * 
     * @param cmmntyUser
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/cmy/deleteCmmntyUserBySelf.do")
    public String deleteCmmntyUserBySelf(@ModelAttribute("cmmntyUser") CommunityUser cmmntyUser, ModelMap model) throws Exception {
	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

	String retVal = "DEL_REQ_SUCCESS";

	cmmntyUser.setUseAt("N");
	cmmntyUser.setLastUpdusrId(user.getUniqId());
	//cmmntyUser.setEmplyrId(user.getUniqId());		//커뮤니티 탈퇴 요청시 승인자를 선택하므로 탈퇴 승인자가 자신이 될 수 없음(2011.9.7 수정분)
	cmmntyUser.setSecsnDe(EgovDateUtil.getToday());

	if (isAuthenticated) {
	    ConfirmHistory history = new ConfirmHistory();
	    
	    history.setConfmRqesterId(user.getUniqId());
	    history.setConfmerId(cmmntyUser.getEmplyrId());
	    history.setConfmTyCode("CF12"); //006
	    history.setConfmSttusCode("AP01"); //007
	    history.setOpertTyCode("WC03");
	    history.setOpertId("");
	    history.setTrgetJobTyCode("CMY");
	    history.setTrgetJobId(cmmntyUser.getCmmntyId());

	    confmService.insertConfirmRequest(history);

	    //cmmntyService.deleteCommunityUserInf(cmmntyUser);
	}

	model.addAttribute("returnMsg", retVal);
	
	return "egovframework/com/cop/cmy/EgovCmmntyMsg";
    }
    
    /**
     * 미리보기 커뮤니티 메인페이지를 조회한다.
     * 
     * @param cmmntyVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/cmy/previewCmmntyMainPage.do")
    public String previewCmmntyMainPage(@ModelAttribute("searchVO") CommunityVO cmmntyVO, ModelMap model) throws Exception {

	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

	cmmntyVO.setEmplyrId(user.getUniqId());

	String tmplatCours = cmmntyVO.getSearchWrd();
	
	CommunityVO vo = new CommunityVO();
	
	vo.setCmmntyNm("미리보기 커뮤니티");
	vo.setCmmntyIntrcn("미리보기를 위한 커뮤니티입니다.");
	vo.setUseAt("Y");
	vo.setFrstRegisterId(user.getUniqId());	// 본인
	
	CommunityUser cmmntyUser = new CommunityUser();
	
	cmmntyUser.setEmplyrId(user.getUniqId());
	cmmntyUser.setEmplyrNm("관리자");

	model.addAttribute("cmmntyVO", vo);
	model.addAttribute("cmmntyUser", cmmntyUser);
		
	//--------------------------------
	// 게시판 목록 정보 처리
	//--------------------------------
	List<BoardMasterVO> bbsResult = new ArrayList<BoardMasterVO>();
	
	BoardMasterVO target = null;
	
	target = new BoardMasterVO();
	target.setBbsNm("방명록");
	bbsResult.add(target);
	
	target = new BoardMasterVO();
	target.setBbsNm("공지게시판");
	bbsResult.add(target);
	
	target = new BoardMasterVO();
	target.setBbsNm("갤러리");
	bbsResult.add(target);
	
	target = new BoardMasterVO();
	target.setBbsNm("자유게시판");
	bbsResult.add(target);
	
	target = new BoardMasterVO();
	target.setBbsNm("자료실");
	bbsResult.add(target);
	
	model.addAttribute("bbsList", bbsResult);
	////------------------------------

	//--------------------------------
	// 동호회 목록 정보
	//--------------------------------
	List<ClubVO> clubResult = new ArrayList<ClubVO>();
	
	ClubVO club = new ClubVO();
	club.setClbNm("미리보기 동호회");
	clubResult.add(club);

	model.addAttribute("clubList", clubResult);
	////------------------------------

	if (isAuthenticated) {
	    model.addAttribute("isAuthenticated", "Y");
	} else {
	    model.addAttribute("isAuthenticated", "N");
	}
	
	model.addAttribute("preview", "true");
	
	return tmplatCours;
    }
    
    /**
     * 커뮤니티 메인페이지의 기본 내용(게시판 4개 표시) 조회한다.
     * 
     * @param cmmntyVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/cmy/previewCmmntyMainContents.do")
    public String previewCmmntyMainContents(@ModelAttribute("searchVO") CommunityVO cmmntyVO, ModelMap model) throws Exception {
	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	@SuppressWarnings("unused")
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

	cmmntyVO.setEmplyrId(user.getUniqId());

	//--------------------------------
	// 게시판 목록 정보 처리
	//--------------------------------
	List<BoardMasterVO> bbsResult = new ArrayList<BoardMasterVO>();

	BoardMasterVO master = null;
	
	master = new BoardMasterVO();
	master.setBbsNm("공지게시판");
	bbsResult.add(master);
	
	master = new BoardMasterVO();
	master.setBbsNm("갤러리");
	bbsResult.add(master);
	
	master = new BoardMasterVO();
	master.setBbsNm("자유게시판");
	bbsResult.add(master);
	
	master = new BoardMasterVO();
	master.setBbsNm("자료실");
	bbsResult.add(master);

	model.addAttribute("bbsList", bbsResult);

	//--------------------------------
	// 게시물 목록 정보 처리
	//--------------------------------	
	ArrayList<Object> target = new ArrayList<Object>();	// Object => List<BoardVO>
	for (int i = 0; i < bbsResult.size() && i < 4; i++) {

	    target.add(null);
	}

	model.addAttribute("articleList", target);
	
	model.addAttribute("preview", "true");

	return "egovframework/com/cop/tpl/EgovCmmntyBaseTmplContents";
    }
}
