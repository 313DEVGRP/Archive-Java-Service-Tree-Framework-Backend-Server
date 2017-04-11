package egovframework.com.cop.cmy.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import egovframework.com.cop.bbs.service.BoardMaster;
import egovframework.com.cop.bbs.service.BoardUseInf;
import egovframework.com.cop.bbs.service.BoardUseInfVO;
import egovframework.com.cop.bbs.service.EgovBBSAttributeManageService;
import egovframework.com.cop.cmy.service.Community;
import egovframework.com.cop.cmy.service.CommunityUser;
import egovframework.com.cop.cmy.service.CommunityUserVO;
import egovframework.com.cop.cmy.service.CommunityVO;
import egovframework.com.cop.cmy.service.EgovCmyBBSUseInfoManageService;
import egovframework.com.cop.cmy.service.EgovCommunityManageService;
import egovframework.com.utl.fcc.service.EgovDateUtil;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

/**
 * 커뮤니티 정보를 관리하기 위한 서비스 구현  클래스
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
 *   2011.07.27 안민정 		    동호회, 커뮤니티 종속성 제거 (EgovBBSUseInfoManageService -> EgovCmyBBSUseInfoManageService)
 *
 * </pre>
 */
@Service("EgovCommunityManageService")
public class EgovCommunityManageServiceImpl extends EgovAbstractServiceImpl implements EgovCommunityManageService {

    @Resource(name = "EgovBBSAttributeManageService")
    private EgovBBSAttributeManageService bbsAttrbService;

    @Resource(name = "EgovCmyBBSUseInfoManageService")
    private EgovCmyBBSUseInfoManageService bbsUseService;

    @Resource(name = "CommunityManageDAO")
    private CommunityManageDAO cmmntyDAO;

    @Resource(name = "egovCmmntyIdGnrService")
    private EgovIdGnrService idgenService;

    private static final Logger LOGGER = LoggerFactory.getLogger(EgovCommunityManageServiceImpl.class);

    /**
     * 커뮤니티에 대한 정보를 삭제한다.
     *
     * @see egovframework.com.cop.cmy.service.EgovCommunityManageService#deleteCommunityInf(egovframework.com.cop.cmy.service.Community)
     */
    public void deleteCommunityInf(Community cmmnty) throws Exception {
	cmmntyDAO.deleteCommunityInf(cmmnty);

	BoardUseInfVO bdUseVO = new BoardUseInfVO();

	bdUseVO.setLastUpdusrId(cmmnty.getLastUpdusrId());
	bdUseVO.setCmmntyId(cmmnty.getCmmntyId());

	bbsUseService.deleteAllBBSUseInfByCmmnty(bdUseVO);

	//커뮤티니 사용자도 삭제처리해야 한다.
	CommunityUser cmmntyUser = new CommunityUser();
	cmmntyUser.setSecsnDe(EgovDateUtil.getToday());
	cmmntyUser.setCmmntyId(cmmnty.getCmmntyId());
	cmmntyUser.setLastUpdusrId(cmmnty.getLastUpdusrId());

	cmmntyDAO.deleteAllCommunityUserInf(cmmntyUser);
    }

    /**
     * 커뮤니티 사용정보를 삭제한다.
     *
     * @see egovframework.com.cop.cmy.service.EgovCommunityManageService#deleteCommunityUserInf(egovframework.com.cop.cmy.service.CommunityUser)
     */
    public void deleteCommunityUserInf(CommunityUser cmmntyUser) throws Exception {
	cmmntyDAO.deleteCommunityUserInf(cmmntyUser);

	BoardUseInfVO bdUseVO = new BoardUseInfVO();

	bdUseVO.setLastUpdusrId(cmmntyUser.getLastUpdusrId());
	bdUseVO.setCmmntyId(cmmntyUser.getCmmntyId());
	bdUseVO.setTrgetId(cmmntyUser.getEmplyrId());

	bbsUseService.deleteBBSUseInfByCmmnty(bdUseVO);
    }

    /**
     * 커뮤니티에 대한 게시판 사용정보를 등록한다.
     *
     * @see egovframework.com.cop.cmy.service.EgovCommunityManageService#insertCommunityBBSUseInf(egovframework.com.cop.bbs.service.com.service.BoardUseInf)
     */
    public void insertCommunityBBSUseInf(BoardUseInf bdUseInf) throws Exception {
	//cmmntyDAO.insertCommunityBBSUseInf(bdUseInf);
	//커뮤니티에 게시판을 하나 추가하게 되면 - _- 해당 게시판이 등록된 커뮤니티의
	//모든 소속사용자에게 사용 권한을 줘야하나 - _-? 일단 그렇게 진행
    }

    /**
     * 커뮤니티에 대한 정보를 등록한다.
     *
     * @see egovframework.com.cop.cmy.service.EgovCommunityManageService#insertCommunityInf(egovframework.com.cop.cmy.service.Community)
     */
    public void insertCommunityInf(Community cmmnty) throws Exception {
	/*
	* 커뮤니티 생성 시 기본 게시판으로 1. 공지게시판, 2.자료실, 3.갤러리, 4.자유게시판, 5. 방명록을 자동 생성하고
	* 사용이 가능하도록 사용등록 처리한다.
	* 공지게시판(답변불가/파일첨부가능/유기한) 0
	* 자료실(답변불가/파일첨부가능) 1
	* 갤러리(답변불가/파일첨부가능) 2
	* 자유게시판(답변가능/파일첨부불가) 3
	* 방명록(답변불가/파일첨부불가) 4
	*/

	cmmnty.setCmmntyId(idgenService.getNextStringId());

	cmmntyDAO.insertCommunityInf(cmmnty);

	CommunityUser cmmntyUser = new CommunityUser();

	cmmntyUser.setCmmntyId(cmmnty.getCmmntyId());
	cmmntyUser.setEmplyrId(cmmnty.getEmplyrId());
	cmmntyUser.setMngrAt("Y");
	cmmntyUser.setUseAt("Y");
	cmmntyUser.setFrstRegisterId(cmmnty.getFrstRegisterId());

	cmmntyDAO.insertCommunityUserInf(cmmntyUser);

	List<BoardMaster> result = makeBdMstrListforCmmnty(cmmnty);

	BoardMaster bdMstr;
	//BoardUseInf bdUseInf;

	Iterator<BoardMaster> iter = result.iterator();
	while (iter.hasNext()) {
	    //게시판 생성
	    bdMstr = (BoardMaster)iter.next();

	    @SuppressWarnings("unused")
	    String bbsId = bbsAttrbService.insertBBSMastetInf(bdMstr);

	    /*
	    //게시판 이용정보 생성
	    bdUseInf = new BoardUseInf();
	    bdUseInf.setBbsId(_bbsId);
	    bdUseInf.setTrgetId(cmmnty.getCmmntyId());
	    bdUseInf.setRegistSeCode("REGC06");
	    bdUseInf.setUseAt("Y"); //커뮤니티 생성 시 기본 게시판을 이용정보로 등록하는 것이므로 생성시 사용으로 등록
	    bdUseInf.setFrstRegisterId(cmmnty.getFrstRegisterId());

	    bbsUseService.insertBBSUseInf(bdUseInf);
	    //*/


	    /* 이미 bbsAttrbService.insertBBSMastetInf() 부분에서 REGC07을 등록함...
	    bdUseInf = new BoardUseInf();
	    bdUseInf.setBbsId(_bbsId);
	    bdUseInf.setTrgetId(cmmnty.getEmplyrId());
	    bdUseInf.setRegistSeCode("REGC07");
	    bdUseInf.setUseAt("Y"); //커뮤니티 생성 시 생성된 기본 게시판을 최초등록 운영자에게 부여한다
	    bdUseInf.setFrstRegisterId(cmmnty.getFrstRegisterId());

	    bbsUseService.insertBBSUseInf(bdUseInf);
	    //*/
	}
    }

    /**
     * 커뮤니티용 게사판 정보를 생성한다.
     *
     * @param cmmnty
     * @return
     */
    private List<BoardMaster> makeBdMstrListforCmmnty(Community cmmnty) {
	BoardMaster bdMstr;
	ArrayList<BoardMaster> result = new ArrayList<BoardMaster>();

	for (int i = 0; i < 5; i++) {
	    bdMstr = new BoardMaster();

	    bdMstr.setFrstRegisterId(cmmnty.getFrstRegisterId());
	    bdMstr.setUseAt("Y");
	    bdMstr.setBbsUseFlag("Y");
	    bdMstr.setTrgetId(cmmnty.getCmmntyId());
	    bdMstr.setRegistSeCode("REGC06");

	    if (i == 0) {
		bdMstr.setBbsTyCode("BBST04");
		bdMstr.setReplyPosblAt("N");
		bdMstr.setFileAtchPosblAt("N");
		bdMstr.setBbsAttrbCode("BBSA03");
		bdMstr.setBbsNm("방명록");
	    } else if (i == 1) {
		bdMstr.setBbsTyCode("BBST03");
		bdMstr.setReplyPosblAt("N");
		bdMstr.setFileAtchPosblAt("Y");
		bdMstr.setPosblAtchFileNumber(3);
		bdMstr.setBbsAttrbCode("BBSA01");
		bdMstr.setBbsNm("공지게시판");
	    } else if (i == 3) {
		bdMstr.setBbsTyCode("BBST01");
		bdMstr.setReplyPosblAt("Y");
		bdMstr.setFileAtchPosblAt("N");
		bdMstr.setBbsAttrbCode("BBSA03");
		bdMstr.setBbsNm("자유게시판");
	    } else if (i == 4) {
		bdMstr.setBbsTyCode("BBST01");
		bdMstr.setReplyPosblAt("N");
		bdMstr.setFileAtchPosblAt("Y");
		bdMstr.setPosblAtchFileNumber(5);
		bdMstr.setBbsAttrbCode("BBSA03");
		bdMstr.setBbsNm("자료실");
	    } else {
		bdMstr.setBbsTyCode("BBST01");
		bdMstr.setReplyPosblAt("N");
		bdMstr.setFileAtchPosblAt("Y");
		bdMstr.setPosblAtchFileNumber(5);
		bdMstr.setBbsAttrbCode("BBSA02");
		bdMstr.setBbsNm("갤러리");
	    }

	    bdMstr.setBbsIntrcn(cmmnty.getCmmntyNm() + " - " + bdMstr.getBbsNm());

	    result.add(bdMstr);
	}

	return result;
    }

    /**
     * 커뮤니티 사용자 정보를 등록한다.
     *
     * @see egovframework.com.cop.cmy.service.EgovCommunityManageService#insertCommunityUserInf(egovframework.com.cop.cmy.service.CommunityUser)
     */
    public String insertCommunityUserInf(CommunityUser cmmntyUser) throws Exception {
	//cmmntyId
	CommunityVO vo = new CommunityVO();

	vo.setCmmntyId(cmmntyUser.getCmmntyId());

	String retVal = "";
	int cnt = cmmntyDAO.checkExistUser(cmmntyUser);
	if (cnt == 0) {
	    cmmntyDAO.insertCommunityUserInf(cmmntyUser);

	    List<CommunityVO> tmpList = cmmntyDAO.selectCommunityBBSUseInf(vo);

	    BoardUseInf bdUseInf;
	    //신규로 추가된 사용자에 대해서 현재 커뮤니티의 모든 게시판에 대한 사용정보를 입력한다.

	    Iterator<CommunityVO> iter = tmpList.iterator();
	    while (iter.hasNext()) {
		bdUseInf = new BoardUseInf();

		bdUseInf.setFrstRegisterId(cmmntyUser.getFrstRegisterId());
		bdUseInf.setBbsId(((CommunityVO)iter.next()).getBbsId());
		bdUseInf.setTrgetId(cmmntyUser.getEmplyrId());
		bdUseInf.setRegistSeCode("REGC07");
		bdUseInf.setUseAt("Y");

		bbsUseService.insertBBSUseInf(bdUseInf);
	    }
	} else {
	    retVal = "EXIST";
	}

	return retVal;
    }

	/**
     * 커뮤니티 사용자 정보를 확인한다.
     *
     * @see egovframework.com.cop.cmy.service.EgovCommunityManageService#checkCommunityUserInf(egovframework.com.cop.cmy.service.CommunityUser)
     */
    public String checkCommunityUserInf(CommunityUser cmmntyUser) throws Exception {
	// 회원가입 승인처리 적용시 기존 insertCommunityUserInf 대신 사용자 확인만 확인

	//cmmntyId
	CommunityVO vo = new CommunityVO();
	vo.setCmmntyId(cmmntyUser.getCmmntyId());

	if (cmmntyDAO.checkExistUser(cmmntyUser) == 0) {
	    return "";
	} else {
	    return "EXIST";
	}
    }

    /**
     * 커뮤니티 게사판 사용정보 목록을 조회한다.
     *
     * @see egovframework.com.cop.cmy.service.EgovCommunityManageService#selectCommunityBBSUseInf(egovframework.com.cop.cmy.service.CommunityVO)
     */
    public List<CommunityVO> selectCommunityBBSUseInf(CommunityVO cmmntyVO) throws Exception {
	return cmmntyDAO.selectCommunityBBSUseInf(cmmntyVO);
    }

	/**
     * 커뮤니티에 대한 특정 사용자 정보를 조회한다.
     *
     * @see egovframework.com.cop.cmy.service.EgovCommunityManageService#selectCommunityInf(egovframework.com.cop.cmy.service.CommunityVO)
     */
    public Map<String, Object> selectCommunityInf(CommunityVO cmmntyVO) throws Exception {

	CommunityVO vo = cmmntyDAO.selectCommunityInf(cmmntyVO);

	List<CommunityVO> result = cmmntyDAO.selectCommunityBBSUseInf(cmmntyVO);

	CommunityUser cmmntyUser = new CommunityUser();

	cmmntyUser.setCmmntyId(cmmntyVO.getCmmntyId());
	cmmntyUser.setEmplyrId(cmmntyVO.getEmplyrId());

	cmmntyUser = cmmntyDAO.selectSingleCommunityUserInf(cmmntyUser);

	//-----------------------------------------------------------------
	// 관리자 정보를 처리한다. (여러 명이 있을 수 있음 - DB 설계 문제상 문제)
	// 위의 처리는 cmmntyVO.getEmplyrId()가 ""이기 때문에 의미 없음..
	//-----------------------------------------------------------------
	List<CommunityUser> managers = cmmntyDAO.selectCommunityManagerInfs(cmmntyVO);

	if (cmmntyUser == null) {
	    cmmntyUser = new CommunityUser();
	}
	if (managers.size() == 1) {
	    cmmntyUser.setEmplyrId(managers.get(0).getEmplyrId());
	    cmmntyUser.setEmplyrNm(managers.get(0).getEmplyrNm());
	} else if (managers.size() > 1) {
	    cmmntyUser.setEmplyrId(managers.get(0).getEmplyrId());
	    cmmntyUser.setEmplyrNm(managers.get(0).getEmplyrNm() + "외 " + (managers.size() - 1) + "명");
	} else {
		LOGGER.debug("No managers...");
	}
	////---------------------------------------------------------------

	Map<String, Object> map = new HashMap<String, Object>();

	map.put("resultList", result);
	map.put("cmmntyVO", vo);
	map.put("cmmntyUser", cmmntyUser);

	return map;
    }

    /**
     * 커뮤니티 관리자 정보를 조회한다.
     *
     * @param cmmntyVO
     * @return
     * @throws Exception
     */
    public CommunityUser selectManager(CommunityVO cmmntyVO) throws Exception {
	CommunityUser cmmntyUser = new CommunityUser();

	List<CommunityUser> managers = cmmntyDAO.selectCommunityManagerInfs(cmmntyVO);

	if (managers.size() == 1) {
	    cmmntyUser.setEmplyrId(managers.get(0).getEmplyrId());
	    cmmntyUser.setEmplyrNm(managers.get(0).getEmplyrNm());
	} else if (managers.size() > 1) {
	    cmmntyUser.setEmplyrId(managers.get(0).getEmplyrId());
	    cmmntyUser.setEmplyrNm(managers.get(0).getEmplyrNm() + "외 " + (managers.size() - 1) + "명");
	} else {
		LOGGER.debug("No managers...");
	}

	return cmmntyUser;
    }

    /**
     * 커뮤니티 정보 목록을 조회한다.
     *
     * @see egovframework.com.cop.cmy.service.EgovCommunityManageService#selectCommunityInfs(egovframework.com.cop.cmy.service.CommunityVO)
     */
    public Map<String, Object> selectCommunityInfs(CommunityVO cmmntyVO) throws Exception {

	List<CommunityVO> result = cmmntyDAO.selectCommunityInfs(cmmntyVO);
	int cnt = cmmntyDAO.selectCommunityInfsCnt(cmmntyVO);

	Map<String, Object> map = new HashMap<String, Object>();

	map.put("resultList", result);
	map.put("resultCnt", Integer.toString(cnt));

	return map;
    }

    /**
     * 커뮤니티 사용자 정보에 대한 목록을 조회한다.
     *
     * @see egovframework.com.cop.cmy.service.EgovCommunityManageService#selectCommunityUserInfs(egovframework.com.cop.cmy.service.CommunityUserVO)
     */
    public Map<String, Object> selectCommunityUserInfs(CommunityUserVO cmmntyUserVO) throws Exception {
	return null;
    }

    /**
     * 커뮤니티 게시판 사용정보를 수정한다.
     *
     * @see egovframework.com.cop.cmy.service.EgovCommunityManageService#updateCommunityBBSUseInf(egovframework.com.cop.bbs.service.com.service.BoardUseInf)
     */
    public void updateCommunityBBSUseInf(BoardUseInf bdUseInf) throws Exception {
	cmmntyDAO.updateCommunityBBSUseInf(bdUseInf);
    }

    /**
     * 커뮤니티 정보를 수정한다.
     *
     * @see egovframework.com.cop.cmy.service.EgovCommunityManageService#updateCommunityInf(egovframework.com.cop.cmy.service.Community)
     */
    public void updateCommunityInf(Community cmmnty) throws Exception {
	CommunityUser cmmntyUser = new CommunityUser();

	cmmntyUser.setUseAt("Y");
	cmmntyUser.setMngrAt("Y");
	cmmntyUser.setLastUpdusrId(cmmnty.getLastUpdusrId());
	cmmntyUser.setCmmntyId(cmmnty.getCmmntyId());
	cmmntyUser.setEmplyrId(cmmnty.getEmplyrId());

	cmmntyDAO.updateCommunityInf(cmmnty);
	cmmntyDAO.updateCommunityUserInf(cmmntyUser);
    }

    /**
     * 커뮤니티 사용자 정보를 수정한다.
     *
     * @see egovframework.com.cop.cmy.service.EgovCommunityManageService#updateCommunityUserInf(egovframework.com.cop.cmy.service.CommunityUser)
     */
    public void updateCommunityUserInf(CommunityUser cmmntyUser) throws Exception {
	cmmntyDAO.updateCommunityUserInf(cmmntyUser);
    }

    /**
     * 포트릿을 위한 커뮤니티 정보 목록 정보를 조회한다.
     *
     * @see egovframework.com.cop.cmy.service.EgovCommunityManageService#selectCmmntyListPortlet(egovframework.com.cop.cmy.service.CommunityVO)
     */
    public List<CommunityVO> selectCmmntyListPortlet(CommunityVO cmmntyVO) throws Exception {
	return cmmntyDAO.selectCmmntyListPortlet(cmmntyVO);
    }

    /**
     * 커뮤니티용 템플릿 경로명을 조회한다.
     *
     * @see egovframework.com.cop.cmy.service.EgovCommunityManageService#selectCmmntyTemplat(egovframework.com.cop.cmy.service.CommunityVO)
     */
    public String selectCmmntyTemplat(CommunityVO cmmntyVO) throws Exception {
	return cmmntyDAO.selectCmmntyTemplat(cmmntyVO);
    }

    /**
     * 모든 커뮤니티 목록을 조회한다.
     *
     * @see egovframework.com.cop.cmy.service.EgovCommunityManageService#selectAllCmmnty(egovframework.com.cop.cmy.service.CommunityVO)
     */
    public List<CommunityVO> selectAllCmmnty(CommunityVO cmmntyVO) throws Exception {
	return cmmntyDAO.selectAllCmmnty(cmmntyVO);
    }

    /**
     * 관리자 여부를 확인한다.
     */
    public boolean isManager(CommunityUser cmmntyUser) throws Exception {
	CommunityUser result = cmmntyDAO.selectSingleCommunityUserInf(cmmntyUser);

	if (result.getMngrAt().equals("Y") && result.getUseAt().equals("Y")) {
	    return true;
	}

	return false;
    }
}
