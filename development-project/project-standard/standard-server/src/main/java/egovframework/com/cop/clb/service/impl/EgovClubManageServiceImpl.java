package egovframework.com.cop.clb.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import egovframework.com.cop.bbs.service.BoardMaster;
import egovframework.com.cop.bbs.service.BoardUseInf;
import egovframework.com.cop.bbs.service.BoardUseInfVO;
import egovframework.com.cop.bbs.service.EgovBBSAttributeManageService;
import egovframework.com.cop.clb.service.Club;
import egovframework.com.cop.clb.service.ClubUser;
import egovframework.com.cop.clb.service.ClubUserVO;
import egovframework.com.cop.clb.service.ClubVO;
import egovframework.com.cop.clb.service.EgovClubManageService;
import egovframework.com.cop.cmy.service.EgovCmyBBSUseInfoManageService;
import egovframework.com.utl.fcc.service.EgovDateUtil;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;


/**
 * 동호회 정보를 관리하기 위한 서비스 구현  클래스
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
 *   2009.4.4  이삼섭          최초 생성
 *
 * </pre>
 */
@Service("EgovClubManageService")
public class EgovClubManageServiceImpl extends EgovAbstractServiceImpl implements EgovClubManageService {

    @Resource(name = "EgovBBSAttributeManageService")
    private EgovBBSAttributeManageService bbsAttrbService;

    @Resource(name = "EgovCmyBBSUseInfoManageService")
    private EgovCmyBBSUseInfoManageService bbsUseService;

    @Resource(name = "ClubManageDAO")
    private ClubManageDAO clubDAO;

    @Resource(name = "egovClbIdGnrService")
    private EgovIdGnrService idgenService;

    private static final Logger LOGGER = LoggerFactory.getLogger(EgovClubManageServiceImpl.class);

    /**
     * 동호회 정보를 삭제한다.
     *
     * @see EgovClubManageService#deleteClubInf(Club)
     */
    public void deleteClubInf(Club club) throws Exception {
	clubDAO.deleteClubInf(club);

	//여기에 추가로 해당 동호회에 속한 사용자를 사용중지하고 해당 동호회에 속한 게시판을 모두 사용중지 시킨다.
	BoardUseInfVO bdUseVO = new BoardUseInfVO();

	bdUseVO.setLastUpdusrId(club.getLastUpdusrId());
	bdUseVO.setCmmntyId(club.getClbId());

	bbsUseService.deleteAllBBSUseInfByClub(bdUseVO);

	ClubUser clubUser = new ClubUser();

	clubUser.setSecsnDe(EgovDateUtil.getToday());
	clubUser.setClbId(club.getClbId());
	clubUser.setLastUpdusrId(club.getLastUpdusrId());

	clubDAO.deleteAllClubUserInf(clubUser);
    }

    /**
     * 동호회 사용자 정보를 삭제한다.
     *
     * @see EgovClubManageService#deleteClubUserInf(ClubUser)
     */
    public void deleteClubUserInf(ClubUser clubUser) throws Exception {
	clubDAO.deleteClubUserInf(clubUser);

	BoardUseInfVO bdUseVO = new BoardUseInfVO();

	bdUseVO.setLastUpdusrId(clubUser.getLastUpdusrId());
	bdUseVO.setClbId(clubUser.getClbId());
	bdUseVO.setTrgetId(clubUser.getEmplyrId());

	bbsUseService.deleteBBSUseInfByClub(bdUseVO);
    }

    /**
     * 동호회 정보를 등록한다.
     *
     * @see EgovClubManageService#insertClubInf(Club)
     */
    public void insertClubInf(Club club) throws Exception {
	/*
	 * 동호회 생성 시 기본 게시판으로 1. 공지게시판, 2.자료실, 3.갤러리, 4.자유게시판, 5. 방명록을 자동 생성하고
	 * 사용이 가능하도록 사용등록 처리한다.
	 * 공지게시판(답변불가/파일첨부가능/유기한) 0
	 * 자료실(답변불가/파일첨부가능) 1
	 * 갤러리(답변불가/파일첨부가능) 2
	 * 자유게시판(답변가능/파일첨부불가) 3
	 * 방명록(답변불가/파일첨부불가) 4
	 */

	club.setClbId(idgenService.getNextStringId());

	clubDAO.insertClubInf(club);

	ClubUser clubUser = new ClubUser();

	clubUser.setClbId(club.getClbId());
	clubUser.setCmmntyId(club.getCmmntyId());
	clubUser.setEmplyrId(club.getEmplyrId());
	clubUser.setOprtrAt("Y");
	clubUser.setUseAt("Y");
	clubUser.setFrstRegisterId(club.getFrstRegisterId());

	clubDAO.insertClubUserInf(clubUser);

	List<BoardMaster> result = makeBdMstrListforCmmnty(club);

	BoardMaster bdMstr;
	//BoardUseInf bdUseInf;

	Iterator<BoardMaster> iter = result.iterator();
	while (iter.hasNext()) {
	    //게시판 생성
	    bdMstr = iter.next();

	    @SuppressWarnings("unused")
	    String bbsId = bbsAttrbService.insertBBSMastetInf(bdMstr);

	    /*
	    //게시판 이용정보 생성
	    bdUseInf = new BoardUseInf();
	    bdUseInf.setBbsId(bbsId);
	    bdUseInf.setTrgetId(club.getClbId());
	    bdUseInf.setRegistSeCode("REGC05");
	    bdUseInf.setUseAt("Y"); //동호회 생성 시 기본 게시판을 이용정보로 등록하는 것이므로 생성시 사용으로 등록
	    bdUseInf.setFrstRegisterId(club.getFrstRegisterId());

	    bbsUseService.insertBBSUseInf(bdUseInf);
	    //*/

	    /*
	    bdUseInf = new BoardUseInf();

	    bdUseInf.setBbsId(bbsId);
	    bdUseInf.setTrgetId(club.getEmplyrId());
	    bdUseInf.setRegistSeCode("REGC07");
	    bdUseInf.setUseAt("Y"); //동호회 생성 시 생성 시 생성된 기본 게시판을 최초등록 운영자에게 부여한다
	    bdUseInf.setFrstRegisterId(club.getFrstRegisterId());

	    bbsUseService.insertBBSUseInf(bdUseInf);
	    //*/
	}
    }

    /**
     * 커뮤니티 사용을 위한 게시판 정보를 생성한다.
     *
     * @param club
     * @return
     */
    private List<BoardMaster> makeBdMstrListforCmmnty(Club club) {
	BoardMaster bdMstr;
	ArrayList<BoardMaster> result = new ArrayList<BoardMaster>();

	for (int i = 0; i < 5; i++) {
	    bdMstr = new BoardMaster();

	    bdMstr.setFrstRegisterId(club.getFrstRegisterId());
	    bdMstr.setUseAt("Y");
	    bdMstr.setBbsUseFlag("Y");
	    bdMstr.setTrgetId(club.getClbId());
	    bdMstr.setRegistSeCode("REGC05");

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

	    bdMstr.setBbsIntrcn(club.getClbNm() + " - " + bdMstr.getBbsNm());

	    result.add(bdMstr);
	}

	return result;
    }

    /**
     * 동호회 사용자 정보를 생성한다.
     *
     * @see EgovClubManageService#insertClubUserInf(ClubUser)
     */
    public String insertClubUserInf(ClubUser clubUser) throws Exception {
	String retVal = "";

	ClubVO vo = new ClubVO();

	vo.setClbId(clubUser.getClbId());

	int cnt = clubDAO.checkExistUser(clubUser);

	if (cnt == 0) {
	    clubDAO.insertClubUserInf(clubUser);

	    List<ClubVO> tmpList = clubDAO.selectClubUseBBSInfs(vo);

	    BoardUseInf bdUseInf;
	    //신규로 추가된 사용자에 대해서 현재 커뮤니티의 모든 게시판에 대한 사용정보를 입력한다.

	    Iterator<ClubVO> iter = tmpList.iterator();
	    while (iter.hasNext()) {
		bdUseInf = new BoardUseInf();
		bdUseInf.setFrstRegisterId(clubUser.getFrstRegisterId());
		bdUseInf.setBbsId(((ClubVO)iter.next()).getBbsId());
		bdUseInf.setTrgetId(clubUser.getEmplyrId());
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
     * 동호회 사용자 정보를 확인한다.
     *
     * @see EgovClubManageService#checkClubUserInf(ClubUser)
     */
    public String checkClubUserInf(ClubUser clubUser) throws Exception {
	ClubVO vo = new ClubVO();

	vo.setClbId(clubUser.getClbId());

	if (clubDAO.checkExistUser(clubUser) == 0) {
	    return "";
	} else {
	    return "EXIST";
	}
    }

    /**
     * 동호회에 대한 게시판 정보 및 사용자 정보를 조회한다.
     *
     * @see EgovClubManageService#selectClubInf(ClubVO)
     */
    public Map<String, Object> selectClubInf(ClubVO clubVO) throws Exception {

	ClubVO vo = clubDAO.selectClubInf(clubVO);
	List<ClubVO> result = clubDAO.selectClubUseBBSInfs(clubVO);

	ClubUser clubUser = new ClubUser();

	clubUser.setClbId(clubVO.getClbId());
	clubUser.setEmplyrId(clubVO.getEmplyrId());

	clubUser = clubDAO.selectSingleClubUserInf(clubUser);

	//-----------------------------------------------------------------
	// 운영자정보를 처리한다. (여러 명이 있을 수 있음 - DB 설계 문제상 문제)
	// 위의 처리는 clubVO.getEmplyrId()가 ""이기 때문에 의미 없음..
	//-----------------------------------------------------------------
	List<ClubUser> operators = clubDAO.selectClubOperatorInfs(clubVO);

	if (clubUser == null) {
	    clubUser = new ClubUser();
	}
	if (operators.size() == 1) {
	    clubUser.setEmplyrId(operators.get(0).getEmplyrId());
	    clubUser.setEmplyrNm(operators.get(0).getEmplyrNm());
	} else if (operators.size() > 1) {
	    clubUser.setEmplyrId(operators.get(0).getEmplyrId());
	    clubUser.setEmplyrNm(operators.get(0).getEmplyrNm() + "외 " + (operators.size() - 1) + "명");
	} else {
	    LOGGER.debug("No operators...");
	}
	////---------------------------------------------------------------

	Map<String, Object> map = new HashMap<String, Object>();

	map.put("resultList", result);
	map.put("clubVO", vo);
	map.put("clubUser", clubUser);

	return map;
    }

    /**
     * 동호회 운영자 정보를 조회한다.
     *
     * @param clubVO
     * @return
     * @throws Exception
     */
    public ClubUser selectOperator(ClubVO clubVO) throws Exception {
	ClubUser clubUser = new ClubUser();

	List<ClubUser> operators = clubDAO.selectClubOperatorInfs(clubVO);

	if (operators.size() == 1) {
	    clubUser.setEmplyrId(operators.get(0).getEmplyrId());
	    clubUser.setEmplyrNm(operators.get(0).getEmplyrNm());
	} else if (operators.size() > 1) {
	    clubUser.setEmplyrId(operators.get(0).getEmplyrId());
	    clubUser.setEmplyrNm(operators.get(0).getEmplyrNm() + "외 " + (operators.size() - 1) + "명");
	} else {
	    LOGGER.debug("No operators...");
	}

	return clubUser;
    }

    /**
     * 동호회에 대한 목록을 조회한다.
     *
     * @see EgovClubManageService#selectClubInfs(ClubVO)
     */
    public Map<String, Object> selectClubInfs(ClubVO clubVO) throws Exception {
	List<ClubVO> result = clubDAO.selectClubInfs(clubVO);
	int cnt = clubDAO.selectClubInfsCnt(clubVO);

	Map<String, Object> map = new HashMap<String, Object>();

	map.put("resultList", result);
	map.put("resultCnt", Integer.toString(cnt));

	return map;
    }

    /**
     * 동호회에서 사용하는 게시판 목록을 조회한다.
     *
     * @see EgovClubManageService#selectClubUseBBSInfs(ClubVO)
     */
    public List<ClubVO> selectClubUseBBSInfs(ClubVO clubVO) throws Exception {
	return clubDAO.selectClubUseBBSInfs(clubVO);
    }

    /**
     * 동호회에 대한 사용자 목록을 조회한다.
     *
     * @see EgovClubManageService#selectClubUserInfs(ClubUserVO)
     */
    public Map<String, Object> selectClubUserInfs(ClubUserVO clubUserVO) throws Exception {

	List<ClubUserVO> result = clubDAO.selectClubUserInfs(clubUserVO);
	int cnt = clubDAO.selectClubUserInfsCnt(clubUserVO);

	Map<String, Object> map = new HashMap<String, Object>();

	map.put("resultList", result);
	map.put("resultCnt", Integer.toString(cnt));

	return map;
    }

    /**
     * 동호회 사용자 정보를 수정한다.
     *
     * @see EgovClubManageService#updateClubBBSUseInf(egovframework.com.cop.bbs.service.com.service.BoardUseInf)
     */
    public void updateClubBBSUseInf(BoardUseInf bdUseInf) throws Exception {
	clubDAO.updateClubBBSUseInf(bdUseInf);
    }

    /**
     * 동호회 내용 및 사용자 정보를 수정한다.
     *
     * @see EgovClubManageService#updateClubInf(Club)
     */
    public void updateClubInf(Club club) throws Exception {
	ClubUser clubUser = new ClubUser();

	clubUser.setUseAt("Y");
	clubUser.setOprtrAt("Y");
	clubUser.setClbId(club.getClbId());
	clubUser.setEmplyrId(club.getEmplyrId());

	clubDAO.updateClubInf(club);
	clubDAO.updateClubUserInf(clubUser);
    }

    /**
     * 동호회에 대한 사용자 내용을 수정한다.
     *
     * @see EgovClubManageService#updateClubUserInf(ClubUser)
     */
    public void updateClubUserInf(ClubUser clubUser) throws Exception {
	clubDAO.updateClubUserInf(clubUser);
    }

    /**
     * 특정 커뮤니티에 사용되는 동호회 목록을 조회한다.
     *
     * @param clubVO
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectClubInfsByCmmntyId(ClubVO clubVO) throws Exception {
	List<ClubVO> result = clubDAO.selectClubInfsByCmmntyId(clubVO);
	//int cnt = clubDAO.selectClubInfsCntByCmmntyId(clubVO);

	Map<String, Object> map = new HashMap<String, Object>();

	map.put("resultList", result);
	//map.put("resultCnt", Integer.toString(cnt));

	return map;
    }

    /**
     * 특정 커뮤니티에 사용되는 동호회 목록을 조회 한다(포틀릿 형식용).
     */
    public List<ClubVO> selectClubListPortletByTrget(Club club) throws Exception {
	return clubDAO.selectClubListPortletByTrget(club);
    }

    /**
     * 커뮤니티에 사용되는 동호회 목록을 조회 한다(포틀릿 형식용).
     */
    public List<ClubVO> selectClubListPortlet(Club club) throws Exception {
	return clubDAO.selectClubListPortlet(club);
    }

    /**
     * 동호회 템플릿 정보를 조회한다.
     */
    public String selectClubTemplat(ClubVO clubVO) throws Exception {
	return clubDAO.selectClubTemplat(clubVO);
    }

    /**
     * 특정 커뮤니티에 사용되는 동호회 목록을 조회한다.
     */
    public Map<String, Object> selectClubInfsByTrgetId(ClubVO clubVO) throws Exception {
	List<ClubVO> result = clubDAO.selectClubInfsByTrgetId(clubVO);
	int cnt = clubDAO.selectClubInfsCntByTrgetId(clubVO);

	Map<String, Object> map = new HashMap<String, Object>();

	map.put("resultList", result);
	map.put("resultCnt", Integer.toString(cnt));

	return map;
    }

    /**
     * 특정 동호회를 사용하는 커뮤니터 정보를 조회한다.
     */
    public ClubVO selectCmmntyInfByClbId(ClubVO clubVO) throws Exception {
	return clubDAO.selectCmmntyInfByClbId(clubVO);
    }

    /**
     * 운영자 여부를 조회한다.
     */
    public boolean isOperator(ClubUser clubUser) throws Exception {
	ClubUser result = clubDAO.selectSingleClubUserInf(clubUser);

	if (result.getOprtrAt().equals("Y") && result.getUseAt().equals("Y")) {
	    return true;
	}

	return false;
    }
}
