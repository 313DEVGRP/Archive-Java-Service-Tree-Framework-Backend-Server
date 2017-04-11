package egovframework.com.cop.clb.service.impl;

import java.util.List;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.cop.bbs.service.BoardUseInf;
import egovframework.com.cop.clb.service.Club;
import egovframework.com.cop.clb.service.ClubUser;
import egovframework.com.cop.clb.service.ClubUserVO;
import egovframework.com.cop.clb.service.ClubVO;

import org.springframework.stereotype.Repository;
//import com.sun.star.uno.Exception;	불필요한 파일 주석처리

/**
 * 동호회 정보를 관리하기 위한 데이터 접근  클래스
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
@Repository("ClubManageDAO")
public class ClubManageDAO extends EgovComAbstractDAO {

    /**
     * 동호회 정보를 삭제한다.
     *
     * @param club
     * @throws Exception
     */
    public void deleteClubInf(Club club) throws Exception {
	update("ClubManageDAO.deleteClubInf", club);
    }

    /**
     * 동호회 사용자 정보를 삭제한다.
     *
     * @param clubUser
     * @throws Exception
     */
    public void deleteClubUserInf(ClubUser clubUser) throws Exception {
	update("ClubManageDAO.deleteClubUserInf", clubUser);
    }

    /**
     * 동호회 정보를 등록한다.
     *
     * @param club
     * @throws Exception
     */
    public void insertClubInf(Club club) throws Exception {
	insert("ClubManageDAO.insertClubInf", club);
    }

    /**
     * 동호회 사용자 정보를 등록한다.
     *
     * @param clubUser
     * @throws Exception
     */
    public void insertClubUserInf(ClubUser clubUser) throws Exception {
	insert("ClubManageDAO.insertClubUserInf", clubUser);
    }

    /**
     * 동호회 상세정보를 조회한다.
     *
     * @param clubVO
     * @return
     * @throws Exception
     */
    public ClubVO selectClubInf(ClubVO clubVO) throws Exception {
	return (ClubVO)select("ClubManageDAO.selectClubInf", clubVO);
    }

    /**
     * 동호회에 대한 목록을 조회한다.
     *
     * @param clubVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<ClubVO> selectClubInfs(ClubVO clubVO) throws Exception {
	return (List<ClubVO>) list("ClubManageDAO.selectClubInfs", clubVO);
    }

    /**
     * 동호회에 대한 목록 전체 건수를 조회한다.
     *
     * @param clubVO
     * @return
     * @throws Exception
     */
    public int selectClubInfsCnt(ClubVO clubVO) throws Exception {
	return (Integer)select("ClubManageDAO.selectClubInfsCnt", clubVO);
    }

    /**
     * 동호회에서 사용하는 게시판 목록을 조회한다.
     *
     * @param clubVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<ClubVO> selectClubUseBBSInfs(ClubVO clubVO) throws Exception {
	return (List<ClubVO>) list("ClubManageDAO.selectClubUseBBSInfs", clubVO);
    }

    /**
     * 동호회에 대한 사용자 목록을 조회한다.
     *
     * @param clubUserVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<ClubUserVO> selectClubUserInfs(ClubUserVO clubUserVO) throws Exception {
	// 사용되지 않음 (EgovClubManageServiceImpl.selectClubUserInfs 메소드에서 사용되나 해당 메소드가 미사용 중)
	return (List<ClubUserVO>) list("ClubManageDAO.selectClubUserInfs", clubUserVO);
    }

    /**
     * 동호회에 대한 사용자 목록에 대한 전체 건수를 조회한다.
     *
     * @param clubUserVO
     * @return
     * @throws Exception
     */
    public int selectClubUserInfsCnt(ClubUserVO clubUserVO) throws Exception {
	// 사용되지 않음 (EgovClubManageServiceImpl.selectClubUserInfs 메소드에서 사용되나 해당 메소드가 미사용 중)
	return (Integer)select("ClubManageDAO.selectClubUserInfsCnt", clubUserVO);
    }

    /**
     * 동호회 사용자 정보를 수정한다.
     *
     * @param bdUseInf
     * @throws Exception
     */
    public void updateClubBBSUseInf(BoardUseInf bdUseInf) throws Exception {
	update("ClubManageDAO.updateClubBBSUseInf", bdUseInf);
    }

    /**
     * 동호회에 대한 내용을 수정한다.
     *
     * @param club
     * @throws Exception
     */
    public void updateClubInf(Club club) throws Exception {
	update("ClubManageDAO.updateClubInf", club);
    }

    /**
     * 동호회에 대한 사용자 내용을 수정한다.
     *
     * @param clubUser
     * @throws Exception
     */
    public void updateClubUserInf(ClubUser clubUser) throws Exception {
	update("ClubManageDAO.updateClubUserInf", clubUser);
    }

    /**
     * 특정 커뮤니티에 사용되는 동호회 목록을 조회한다.
     *
     * @param clubVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<ClubVO> selectClubInfsByCmmntyId(ClubVO clubVO) throws Exception {
	return (List<ClubVO>) list("ClubManageDAO.selectClubInfsByCmmntyId", clubVO);
    }

    /**
     * 특정 커뮤니티에 사용되는 동호회 목록에 대한 전체 건수를 조회한다.
     *
     * @param clubVO
     * @return
     * @throws Exception
     */
    public int selectClubInfsCntByCmmntyId(ClubVO clubVO) throws Exception {
	return (Integer)select("ClubManageDAO.selectClubInfsCntByCmmntyId", clubVO);
    }

    /**
     * 동호회 사용자 존재 여부를 확인한다.
     *
     * @param clubUser
     * @return
     * @throws Exception
     */
    public int checkExistUser(ClubUser clubUser) throws Exception {
	return (Integer)select("ClubManageDAO.checkExistUser", clubUser);
    }

    /**
     * 커뮤니티에 사용되는 동호회 목록을 조회 한다(포틀릿 형식용).
     *
     * @param club
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<ClubVO> selectClubListPortlet(Club club) throws Exception {
	return (List<ClubVO>) list("ClubManageDAO.selectClubListPortlet", club);
    }

    /**
     * 특정 커뮤니티에 사용되는 동호회 목록을 조회 한다(포틀릿 형식용).
     *
     * @param club
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<ClubVO> selectClubListPortletByTrget(Club club) throws Exception {
	return (List<ClubVO>) list("ClubManageDAO.selectClubListPortletByTrget", club);
    }

    /**
     * 동호회 템플릿 정보를 조회한다.
     *
     * @param clubVO
     * @return
     * @throws Exception
     */
    public String selectClubTemplat(ClubVO clubVO) throws Exception {
	return (String)select("ClubManageDAO.selectClubTmplat", clubVO);
    }

    /**
     * 특정 커뮤니티에 사용되는 동호회 목록을 조회한다.
     *
     * @param clubVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<ClubVO> selectClubInfsByTrgetId(ClubVO clubVO) throws Exception {
	return (List<ClubVO>) list("ClubManageDAO.selectClubInfsByTrgetId", clubVO);
    }

    /**
     * 특정 커뮤니티에 사용되는 동호회 목록에 대한 전체 건수를 조회한다.
     *
     * @param clubVO
     * @return
     * @throws Exception
     */
    public int selectClubInfsCntByTrgetId(ClubVO clubVO) throws Exception {
	return (Integer)select("ClubManageDAO.selectClubInfsCntByTrgetId", clubVO);
    }

    /**
     * 특정 동호회를 사용하는 커뮤니터 정보를 조회한다.
     *
     * @param clubVO
     * @return
     * @throws Exception
     */
    public ClubVO selectCmmntyInfByClbId(ClubVO clubVO) throws Exception {
	return (ClubVO)select("ClubManageDAO.selectCmmntyInf", clubVO);
    }

    /**
     * 동호회 사용자 전체를 삭제한다.
     *
     * @param clubUser
     * @throws Exception
     */
    public void deleteAllClubUserInf(ClubUser clubUser) throws Exception {
	update("ClubManageDAO.deleteAllClubUserInf", clubUser);
    }

    /**
     * 동호회의 특정 사용자 정보를 조회한다.
     *
     * @param clubUser
     * @return
     * @throws Exception
     */
    public ClubUser selectSingleClubUserInf(ClubUser clubUser) throws Exception {
	return (ClubUser)select("ClubManageDAO.selectSingleClubUserInf", clubUser);
    }

    /**
     * 동호회에 대한 운영자 정보를 조회한다.
     *
     * @param cmmntyUser
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<ClubUser> selectClubOperatorInfs(ClubVO club) throws Exception {
	return (List<ClubUser>) list("ClubManageDAO.selectClubOperatorInf", club);
    }
}
