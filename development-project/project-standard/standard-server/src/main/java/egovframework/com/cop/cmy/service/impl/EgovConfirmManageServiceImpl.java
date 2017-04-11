package egovframework.com.cop.cmy.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.com.cop.clb.service.Club;
import egovframework.com.cop.clb.service.ClubUser;
import egovframework.com.cop.clb.service.EgovClubManageService;
import egovframework.com.cop.cmy.service.Community;
import egovframework.com.cop.cmy.service.CommunityUser;
import egovframework.com.cop.cmy.service.ConfirmHistory;
import egovframework.com.cop.cmy.service.ConfirmHistoryVO;
import egovframework.com.cop.cmy.service.EgovCommunityManageService;
import egovframework.com.cop.cmy.service.EgovConfirmManageService;
import egovframework.com.utl.fcc.service.EgovDateUtil;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

/**
 * 승인정보를 관리하기 위한 서비스 구현 클래스
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
 *   2009.4.7  이삼섭		최초 생성
 *   2011.9.7	정진오		운영자가 탈퇴 후에도 커뮤니티 및 동호회의 운영자로 남아 있어 강제로 "N"을 입력함 
 *
 * </pre>
 */
@Service("EgovConfirmManageService")
public class EgovConfirmManageServiceImpl extends EgovAbstractServiceImpl implements EgovConfirmManageService {

    @Resource(name = "ConfirmManageDAO")
    private ConfirmManageDAO confmDAO;

    @Resource(name = "EgovClubManageService")
    private EgovClubManageService clubService;

    @Resource(name = "EgovCommunityManageService")
    private EgovCommunityManageService cmmntyService;

    /**
     * 승인(탈퇴)요청에 대한 등록을 처리한다.
     * 
     * @see egovframework.com.cop.cmy.service.EgovConfirmManageService#insertConfirmRequest(egovframework.com.cop.cmy.service.ConfirmHistory)
     */
    public void insertConfirmRequest(ConfirmHistory history) throws Exception {
	confmDAO.insertConfirmRequest(history);
    }

    /**
     * 승인(탈퇴)요청에 대한 목록을 조회한다.
     * 
     * @see egovframework.com.cop.cmy.service.EgovConfirmManageService#selectConfirmRequest(egovframework.com.cop.cmy.service.ConfirmHistoryVO)
     */
    public Map<String, Object> selectConfirmRequest(ConfirmHistoryVO historyVO) throws Exception {
	List<ConfirmHistoryVO> result = confmDAO.selectConfirmRequestList(historyVO);
	int cnt = confmDAO.selectConfirmRequestListCnt(historyVO);
	
	Map<String, Object> map = new HashMap<String, Object>();
	
	map.put("resultList", result);
	map.put("resultCnt", Integer.toString(cnt));

	return map;
    }

    /**
     * 승인(탈퇴)요청에 대한 확인을 처리한다.
     * 
     * @see egovframework.com.cop.cmy.service.EgovConfirmManageService#updateConfirmRequest(egovframework.com.cop.cmy.service.ConfirmHistory)
     */
    public void updateConfirmRequest(ConfirmHistory history) throws Exception {
	String sttus = history.getConfmSttusCode();

	// 승인요청이면 아무것도 처리하지 않음
	if ("AP01".equals(sttus)) {
	    return;
	}

//	 sttus 가 승인완료 AP02일때만 로직처리/ 승인반려시에는 승인정보만 변경처리 
	
	if ("AP02".equals(sttus)) {
	    if ("CF12".equals(history.getConfmTyCode())) {
		// 커뮤니티 사용자 탈퇴처리
		CommunityUser cmmntyUser = new CommunityUser();
		
		cmmntyUser.setLastUpdusrId(history.getConfmerId());
		cmmntyUser.setCmmntyId(history.getTrgetJobId());
		cmmntyUser.setEmplyrId(history.getConfmRqesterId());
		cmmntyUser.setSecsnDe(EgovDateUtil.getToday());
		cmmntyUser.setMngrAt("N");	// 커뮤니티 운영자가 아닌 것으로 강제 설정(2011.9.7 추가 사항)
		
		cmmntyService.deleteCommunityUserInf(cmmntyUser);
		
	    } else if ("CF14".equals(history.getConfmTyCode())) {
		// 동호회 사용자 탈퇴처리
		ClubUser clubUser = new ClubUser();
		
		clubUser.setLastUpdusrId(history.getConfmerId());
		clubUser.setClbId(history.getTrgetJobId());
		clubUser.setEmplyrId(history.getConfmRqesterId());
		clubUser.setSecsnDe(EgovDateUtil.getToday());
		clubUser.setOprtrAt("N");	//동호회 운영자가 아닌 것으로 강제 설정(2011.9.7 추가 사항)
		
		clubService.deleteClubUserInf(clubUser);
		
	    } else if ("CF02".equals(history.getConfmTyCode())) {
		// 커뮤니티 삭제
		Community cmmnty = new Community();

		cmmnty.setLastUpdusrId(history.getConfmerId());
		cmmnty.setCmmntyId(history.getTrgetJobId());
		
		cmmntyService.deleteCommunityInf(cmmnty);
		
	    } else if ("CF04".equals(history.getConfmTyCode())) {
		// 동호회 삭제
		Club club = new Club();

		club.setLastUpdusrId(history.getConfmerId());
		club.setClbId(history.getTrgetJobId());
		
		clubService.deleteClubInf(club);
		
	    } else if ("CF11".equals(history.getConfmTyCode())) {
		// 커뮤니티 가입
		CommunityUser cmmntyUser = new CommunityUser();

		cmmntyUser.setCmmntyId(history.getTrgetJobId());
		cmmntyUser.setEmplyrId(history.getConfmRqesterId());
		cmmntyUser.setMngrAt("N");
		cmmntyUser.setUseAt("Y");
		cmmntyUser.setFrstRegisterId(history.getConfmRqesterId());

		cmmntyService.insertCommunityUserInf(cmmntyUser);

	    } else if ("CF13".equals(history.getConfmTyCode())) {
		// 동호회 가입
		ClubUser clubUser = new ClubUser();

		clubUser.setClbId(history.getTrgetJobId());
		clubUser.setCmmntyId(history.getOpertId());
		clubUser.setEmplyrId(history.getConfmRqesterId());
		clubUser.setOprtrAt("N");
		clubUser.setUseAt("Y");
		clubUser.setFrstRegisterId(history.getConfmRqesterId());

		clubService.insertClubUserInf(clubUser);
	    }
	}
	
	history.setConfmDe(EgovDateUtil.getToday());
	
	confmDAO.updateConfirmRequest(history);
    }

    /**
     * 승인(탈퇴)요청에 대한 상세내용을 조회한다.
     * 
     * @see egovframework.com.cop.cmy.service.EgovConfirmManageService#selectSingleConfirmRequest(egovframework.com.cop.cmy.service.ConfirmHistoryVO)
     */
    public ConfirmHistoryVO selectSingleConfirmRequest(ConfirmHistoryVO historyVO) throws Exception {
	return confmDAO.selectSingleConfirmRequest(historyVO);
    }

    /**
     * 현재 승인 요청된 건수를 조회한다.
     * 
     * @see egovframework.com.cop.cmy.service.EgovConfirmManageService#countConfirmRequest(egovframework.com.cop.cmy.service.ConfirmHistoryVO)
     */
    public int countConfirmRequest(ConfirmHistory history) throws Exception {
	return confmDAO.countConfirmRequest(history);
    }
}
