package egovframework.com.cop.cmy.service.impl;

import java.util.List;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.cop.cmy.service.ConfirmHistory;
import egovframework.com.cop.cmy.service.ConfirmHistoryVO;

import org.springframework.stereotype.Repository;

/**
 * 승인정보 관리를 위한 데이터 접근 클래스
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
 *   2009.4.7  이삼섭          최초 생성
 *
 * </pre>
 */
@Repository("ConfirmManageDAO")
public class ConfirmManageDAO extends EgovComAbstractDAO {
	
    /**
     * 승인(탈퇴)요청에 대한 등록을 처리한다.
     * 
     * @param history
     * @throws Exception
     */
    public void insertConfirmRequest(ConfirmHistory history) throws Exception {
	insert("ConfirmManageDAO.insertConfirmRequest", history);
    }

    /**
     * 승인(탈퇴)요청에 대한 목록을 조회한다.
     * 
     * @param historyVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<ConfirmHistoryVO> selectConfirmRequestList(ConfirmHistoryVO historyVO) throws Exception {
	return (List<ConfirmHistoryVO>) list("ConfirmManageDAO.selectConfirmRequestList", historyVO);
    }

    /**
     * 승인(탈퇴)요청에 대한 목록 전체 건수를 조회한다.
     * 
     * @param historyVO
     * @return
     * @throws Exception
     */
    public int selectConfirmRequestListCnt(ConfirmHistoryVO historyVO) throws Exception {
	return (Integer)select("ConfirmManageDAO.selectConfirmRequestListCnt", historyVO);
    }

    /**
     * 승인(탈퇴)요청에 대한 정보를 수정한다.
     * 
     * @param history
     * @throws Exception
     */
    public void updateConfirmRequest(ConfirmHistory history) throws Exception {
	update("ConfirmManageDAO.updateConfirmRequest", history);
    }

    /**
     * 승인(탈퇴)요청에 대한 상세내용을 조회한다.
     * 
     * @param historyVO
     * @return
     * @throws Exception
     */
    public ConfirmHistoryVO selectSingleConfirmRequest(ConfirmHistoryVO historyVO) throws Exception {
	return (ConfirmHistoryVO)select("ConfirmManageDAO.selectSingleConfirmRequest", historyVO);
    }

    /**
     * 승인(탈퇴)요청에 대한 상세내용을 조회한다.
     * 
     * @param historyVO
     * @return
     * @throws Exception
     */
    public int countConfirmRequest(ConfirmHistory history) throws Exception {
	return (Integer)select("ConfirmManageDAO.countConfirmRequest", history);
    }
}
