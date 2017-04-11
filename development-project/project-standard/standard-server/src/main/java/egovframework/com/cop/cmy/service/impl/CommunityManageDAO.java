package egovframework.com.cop.cmy.service.impl;

import java.util.List;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.cop.bbs.service.BoardUseInf;
import egovframework.com.cop.cmy.service.Community;
import egovframework.com.cop.cmy.service.CommunityUser;
import egovframework.com.cop.cmy.service.CommunityUserVO;
import egovframework.com.cop.cmy.service.CommunityVO;

import org.springframework.stereotype.Repository;
//import com.sun.star.uno.Exception;	불필요한 파일 주석처리

/**
 * 커뮤니티 정보를 관리하기 위한 데이터 접근 클래스
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
 *   2009.4.2  이삼섭          최초 생성
 *
 * </pre>
 */
@Repository("CommunityManageDAO")
public class CommunityManageDAO extends EgovComAbstractDAO {

    /**
     * 커뮤니티 정보를 등록한다.
     *
     * @param cmmnty
     * @throws Exception
     */
    public void insertCommunityInf(Community cmmnty) throws Exception {
	insert("CommunityManageDAO.insertCommunityInf", cmmnty);
    }

    /**
     * 커뮤니티 정보를 수정한다.
     *
     * @param cmmnty
     * @throws Exception
     */
    public void updateCommunityInf(Community cmmnty) throws Exception {
	update("CommunityManageDAO.updateCommunityInf", cmmnty);
    }

    /**
     * 커뮤니티 정보를 삭제한다.
     *
     * @param cmmnty
     * @throws Exception
     */
    public void deleteCommunityInf(Community cmmnty) throws Exception {
	update("CommunityManageDAO.deleteCommunityInf", cmmnty);
    }

    /**
     * 커뮤니티 정보 목록을 조회한다.
     *
     * @param cmmntyVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<CommunityVO> selectCommunityInfs(CommunityVO cmmntyVO) throws Exception {
	return (List<CommunityVO>) list("CommunityManageDAO.selectCommunityInfs", cmmntyVO);
    }

    /**
     * 커뮤니티 정보 목록에 대한 전체 건수를 조회한다.
     *
     * @param cmmntyVO
     * @return
     * @throws Exception
     */
    public int selectCommunityInfsCnt(CommunityVO cmmntyVO) throws Exception {
	return (Integer)select("CommunityManageDAO.selectCommunityInfsCnt", cmmntyVO);
    }

    /**
     * 커뮤니티 사용자 정보를 등록한다.
     *
     * @param cmmntyUser
     * @throws Exception
     */
    public void insertCommunityUserInf(CommunityUser cmmntyUser) throws Exception {
	insert("CommunityManageDAO.insertCommunityUserInf", cmmntyUser);
    }

    /**
     * 커뮤니티 사용자 정보를 수정한다.
     *
     * @param cmmntyUser
     * @throws Exception
     */
    public void updateCommunityUserInf(CommunityUser cmmntyUser) throws Exception {
	update("CommunityManageDAO.updateCommunityUserInf", cmmntyUser);
    }

    /**
     * 커뮤니티 사용자 정보를 삭제한다.
     *
     * @param cmmntyUser
     * @throws Exception
     */
    public void deleteCommunityUserInf(CommunityUser cmmntyUser) throws Exception {
	update("CommunityManageDAO.deleteCommunityUserInf", cmmntyUser);
    }

    /**
     * 커뮤니티 사용자 정보 목록을 조회한다.
     *
     * @param cmmntyUserVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<CommunityUserVO> selectCommunityUserInfs(CommunityUserVO cmmntyUserVO) throws Exception {
	// 사용되지 않음
	return (List<CommunityUserVO>) list("CommunityManageDAO.selectCommunityUserInfs", cmmntyUserVO);
    }

    /**
     * 커뮤니티 사용자 정보 목록에 대한 전체 건수를 조회한다.
     *
     * @param cmmntyUserVO
     * @return
     * @throws Exception
     */
    public int selectCommunityUserInfsCnt(CommunityUserVO cmmntyUserVO) throws Exception {
	// 사용되지 않음
	return (Integer)select("CommunityManageDAO.selectCommunityUserInfsCnt", cmmntyUserVO);
    }

    /**
     * 커뮤니티 게시판 사용정보를 등록한다.
     *
     * @param bdUseInf
     * @throws Exception
     */
    public void insertCommunityBBSUseInf(BoardUseInf bdUseInf) throws Exception {
	insert("CommunityManageDAO.insertCommunityBBSUseInf", bdUseInf);
    }

    /**
     * 커뮤니티 게시판 사용정보를 수정한다.
     *
     * @param bdUseInf
     * @throws Exception
     */
    public void updateCommunityBBSUseInf(BoardUseInf bdUseInf) throws Exception {
	update("CommunityManageDAO.updateCommunityBBSUseInf", bdUseInf);
    }

    /**
     * 커뮤니티 게사판 사용정보 목록을 조회한다.
     *
     * @param cmmntyVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<CommunityVO> selectCommunityBBSUseInf(CommunityVO cmmntyVO) throws Exception {
	return (List<CommunityVO>) list("CommunityManageDAO.selectCommunityBBSUseInf", cmmntyVO);
    }

    /**
     * 커뮤니티에 대한 상세정보를 조회한다.
     *
     * @param cmmntyVO
     * @return
     * @throws Exception
     */
    public CommunityVO selectCommunityInf(CommunityVO cmmntyVO) throws Exception {
	return (CommunityVO)select("CommunityManageDAO.selectCommunityInf", cmmntyVO);
    }

    /**
     * 포트릿을 위한 커뮤니티 정보 목록 정보를 조회한다.
     *
     * @param cmmntyVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<CommunityVO> selectCmmntyListPortlet(CommunityVO cmmntyVO) throws Exception {
	return (List<CommunityVO>) list("CommunityManageDAO.selectCmmntyListPortlet", cmmntyVO);
    }

    /**
     * 커뮤니티용 템플릿 경로명을 조회한다.
     *
     * @param cmmntyVO
     * @return
     * @throws Exception
     */
    public String selectCmmntyTemplat(CommunityVO cmmntyVO) throws Exception {
	return (String)select("CommunityManageDAO.selectCmmntyTmplat", cmmntyVO);
    }

    /**
     * 커뮤니티 사용여부를 조회한다.
     *
     * @param cmmntyVO
     * @return
     * @throws Exception
     */
    public int checkExistUser(CommunityUser cmmntyUser) throws Exception {
	return (Integer)select("CommunityManageDAO.checkExistUser", cmmntyUser);
    }

    /**
     * 모든 커뮤니티 목록을 조회한다.
     *
     * @param cmmntyVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<CommunityVO> selectAllCmmnty(CommunityVO cmmntyVO) throws Exception {
	return (List<CommunityVO>) list("CommunityManageDAO.selectAllCmmnty", cmmntyVO);
    }

    /**
     * 커뮤니티를 사용하는 모든 사용자 정보를 삭제한다.
     *
     * @param cmmntyUser
     * @throws Exception
     */
    public void deleteAllCommunityUserInf(CommunityUser cmmntyUser) throws Exception {
	update("CommunityManageDAO.deleteAllCommunityUserInf", cmmntyUser);
    }

    /**
     * 커뮤니티에 대한 특정 사용자 정보를 조회한다.
     *
     * @param cmmntyUser
     * @return
     * @throws Exception
     */
    public CommunityUser selectSingleCommunityUserInf(CommunityUser cmmntyUser) throws Exception {
	return (CommunityUser)select("CommunityManageDAO.selectSingleCommunityUserInf", cmmntyUser);
    }

    /**
     * 커뮤니티에 대한 관리자 정보를 조회한다.
     *
     * @param cmmntyUser
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<CommunityUser> selectCommunityManagerInfs(CommunityVO cmmnty) throws Exception {
	return (List<CommunityUser>) list("CommunityManageDAO.selectCommunityManagerInf", cmmnty);
    }
}
