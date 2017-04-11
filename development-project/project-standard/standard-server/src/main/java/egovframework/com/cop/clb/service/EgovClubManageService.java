package egovframework.com.cop.clb.service;

import java.util.List;
import java.util.Map;

import egovframework.com.cop.bbs.service.BoardUseInf;


/**
 * 동호회 정보를 관리하기 위한 서비스 인터페이스 클래스
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
public interface EgovClubManageService {

	/**
     * 동호회 정보를 삭제한다.
     * 
     * @param club
     * @throws Exception
     */
    public void deleteClubInf(Club club) throws Exception;

    /**
     * 동호회 사용자 정보를 삭제한다.
     * 
     * @param clubUser
     * @throws Exception
     */
    public void deleteClubUserInf(ClubUser clubUser) throws Exception;

    /**
     * 동호회 정보를 등록한다.
     * 
     * @param club
     * @throws Exception
     */
    public void insertClubInf(Club club) throws Exception;

    /**
     * 동호회 사용자 정보를 생성한다.
     * 
     * @param clubUser
     * @throws Exception
     */
    public String insertClubUserInf(ClubUser clubUser) throws Exception;

    /**
     * 동호회 사용자 정보를 확인한다.
     * 
     * @param clubUser
     * @throws Exception
     */
    public String checkClubUserInf(ClubUser clubUser) throws Exception;

    /**
     * 동호회에 대한 게시판 정보 및 사용자 정보를 조회한다.
     * 
     * @param clubVO
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectClubInf(ClubVO clubVO) throws Exception;

    /**
     * 동호회 운영자 정보를 조회한다.
     * 
     * @param clubVO
     * @return
     * @throws Exception
     */
    public ClubUser selectOperator(ClubVO clubVO) throws Exception;

    /**
     * 동호회에 대한 목록을 조회한다.
     * 
     * @param clubVO
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectClubInfs(ClubVO clubVO) throws Exception;

    /**
     * 동호회에서 사용하는 게시판 목록을 조회한다.
     * 
     * @param clubVO
     * @return
     * @throws Exception
     */
    public List<ClubVO> selectClubUseBBSInfs(ClubVO clubVO) throws Exception;

    /**
     * 동호회에 대한 사용자 목록을 조회한다.
     * 
     * @param clubUserVO
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectClubUserInfs(ClubUserVO clubUserVO) throws Exception;

    /**
     * 동호회 사용자 정보를 수정한다.
     * 
     * @param bdUseInf
     * @throws Exception
     */
    public void updateClubBBSUseInf(BoardUseInf bdUseInf) throws Exception;

    /**
     * 동호회 내용 및 사용자 정보를 수정한다.
     * 
     * @param club
     * @throws Exception
     */
    public void updateClubInf(Club club) throws Exception;

    /**
     * 동호회에 대한 사용자 내용을 수정한다.
     * 
     * @param clubUser
     * @throws Exception
     */
    public void updateClubUserInf(ClubUser clubUser) throws Exception;

    /**
     * 특정 커뮤니티에 사용되는 동호회 목록을 조회한다.
     * 
     * @param clubVO
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectClubInfsByCmmntyId(ClubVO clubVO) throws Exception;

    /**
     * 특정 커뮤니티에 사용되는 동호회 목록을 조회 한다(포틀릿 형식용).
     * 
     * @param club
     * @return
     * @throws Exception
     */
    public List<ClubVO> selectClubListPortletByTrget(Club club) throws Exception;

    /**
     * 커뮤니티에 사용되는 동호회 목록을 조회 한다(포틀릿 형식용).
     * 
     * @param club
     * @return
     * @throws Exception
     */
    public List<ClubVO> selectClubListPortlet(Club club) throws Exception;

    /**
     * 동호회 템플릿 정보를 조회한다.
     * 
     * @param clubVO
     * @return
     * @throws Exception
     */
    public String selectClubTemplat(ClubVO clubVO) throws Exception;

    /**
     * 특정 커뮤니티에 사용되는 동호회 목록을 조회한다.
     * 
     * @param clubVO
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectClubInfsByTrgetId(ClubVO clubVO) throws Exception;

    /**
     * 특정 동호회를 사용하는 커뮤니터 정보를 조회한다.
     * 
     * @param clubVO
     * @return
     * @throws Exception
     */
    public ClubVO selectCmmntyInfByClbId(ClubVO clubVO) throws Exception;
    
    /**
     * 운영자 여부를 조회한다.
     * 
     * @param clubUser
     * @return
     * @throws Exception
     */
    public boolean isOperator(ClubUser clubUser) throws Exception;
}
