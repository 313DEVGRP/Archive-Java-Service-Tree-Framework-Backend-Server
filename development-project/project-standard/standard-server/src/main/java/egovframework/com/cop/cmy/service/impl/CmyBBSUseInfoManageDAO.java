package egovframework.com.cop.cmy.service.impl;

import java.util.List;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.cop.bbs.service.BoardUseInf;
import egovframework.com.cop.bbs.service.BoardUseInfVO;

import org.springframework.stereotype.Repository;

/**
 * 게시판 이용정보를 관리하기 위한 데이터 접근 클래스
 * @author 공통서비스개발팀 이삼섭
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------     --------    ---------------------------
 *   2009.4.2    이삼섭          최초 생성
 *   2011.7.27   안민정			 동호회, 커뮤니티 로직 분리 (BBSUseInfoManageDAO -> BBSCmyUseInfoManageDAO)
 *
 * </pre>
 */
@Repository("CmyBBSUseInfoManageDAO")
public class CmyBBSUseInfoManageDAO extends EgovComAbstractDAO {

    /**
     * 게시판 사용 정보를 삭제한다.
     * 
     * @param bdUseInf
     * @throws Exception
     */
    public void deleteBBSUseInf(BoardUseInf bdUseInf) throws Exception {
	update("CmyBBSUseInfoManageDAO.deleteBBSUseInf", bdUseInf);
    }

    /**
     * 커뮤니티에 사용되는 게시판 사용정보 목록을 조회한다.
     * 
     * @param bdUseInf
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<BoardUseInf> selectBBSUseInfByCmmnty(BoardUseInfVO bdUseVO) throws Exception {
	return (List<BoardUseInf>) list("CmyBBSUseInfoManageDAO.selectBBSUseInfByCmmnty", bdUseVO);
    }

    /**
     * 동호회에 사용되는 게시판 사용정보 목록을 조회한다.
     * 
     * @param bdUseInf
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<BoardUseInf> selectBBSUseInfByClub(BoardUseInfVO bdUseVO) throws Exception {
	return (List<BoardUseInf>) list("CmyBBSUseInfoManageDAO.selectBBSUseInfByClub", bdUseVO);
    }

    /**
     * 커뮤니티에 사용되는 모든 게시판 사용정보를 삭제한다.
     * 
     * @param bdUseInf
     * @throws Exception
     */
    public void deleteAllBBSUseInfByCmmnty(BoardUseInfVO bdUseVO) throws Exception {
	update("CmyBBSUseInfoManageDAO.deleteAllBBSUseInfByCmmnty", bdUseVO);
    }

    /**
     * 동호회에 사용되는 모든 게시판 사용정보를 삭제한다.
     * 
     * @param bdUseInf
     * @throws Exception
     */
    public void deleteAllBBSUseInfByClub(BoardUseInfVO bdUseVO) throws Exception {
	update("CmyBBSUseInfoManageDAO.deleteAllBBSUseInfByClub", bdUseVO);
    }

    /**
     * 게시판 사용정보를 등록한다.
     * 
     * @param bdUseInf
     * @throws Exception
     */
    public void insertBBSUseInf(BoardUseInf bdUseInf) throws Exception {
	insert("CmyBBSUseInfoManageDAO.insertBBSUseInf", bdUseInf);
    }

    /**
     * 게시판 사용정보 목록을 조회한다.
     * 
     * @param bdUseVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<BoardUseInfVO> selectBBSUseInfs(BoardUseInfVO bdUseVO) throws Exception {
	return (List<BoardUseInfVO>) list("CmyBBSUseInfoManageDAO.selectBBSUseInfs", bdUseVO);
    }

    /**
     * 
     * @param bdUseVO
     * @return
     * @throws Exception
     */
    public int selectBBSUseInfsCnt(BoardUseInfVO bdUseVO) throws Exception {
	return (Integer)select("CmyBBSUseInfoManageDAO.selectBBSUseInfsCnt", bdUseVO);
    }

    /**
     * 게시판 사용정보에 대한 상세정보를 조회한다.
     * 
     * @param bdUseVO
     * @return
     * @throws Exception
     */
    public BoardUseInfVO selectBBSUseInf(BoardUseInfVO bdUseVO) throws Exception {
	return (BoardUseInfVO)select("CmyBBSUseInfoManageDAO.selectBBSUseInf", bdUseVO);
    }

    /**
     * 게시판 사용정보를 수정한다.
     * 
     * @param bdUseInf
     * @throws Exception
     */
    public void updateBBSUseInf(BoardUseInf bdUseInf) throws Exception {
	update("CmyBBSUseInfoManageDAO.updateBBSUseInf", bdUseInf);
    }

    /**
     * 게시판에 대한 사용정보를 삭제한다.
     * 
     * @param bdUseInf
     * @throws Exception
     */
    public void deleteBBSUseInfByBoardId(BoardUseInf bdUseInf) throws Exception {
	update("CmyBBSUseInfoManageDAO.deleteBBSUseInfByBoardId", bdUseInf);
    }

    /**
     * 커뮤니티, 동호회에 사용되는 게시판 사용정보에 대한 목록을 조회한다.
     * 
     * @param bdUseVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<BoardUseInfVO> selectBBSUseInfsByTrget(BoardUseInfVO bdUseVO) throws Exception {
	return (List<BoardUseInfVO>) list("CmyBBSUseInfoManageDAO.selectBBSUseInfsByTrget", bdUseVO);
    }

    /**
     * 커뮤니티, 동호회에 사용되는 게시판 사용정보에 대한 전체 건수를 조회한다.
     * 
     * @param bdUseVO
     * @return
     * @throws Exception
     */
    public int selectBBSUseInfsCntByTrget(BoardUseInfVO bdUseVO) throws Exception {
	return (Integer)select("CmyBBSUseInfoManageDAO.selectBBSUseInfsCntByTrget", bdUseVO);
    }

    /**
     * 커뮤니티, 동호회에 사용되는 게시판 사용정보를 수정한다.
     * 
     * @param bdUseInf
     * @throws Exception
     */
    public void updateBBSUseInfByTrget(BoardUseInf bdUseInf) throws Exception {
	update("CmyBBSUseInfoManageDAO.updateBBSUseInfByTrget", bdUseInf);
    }	
}
