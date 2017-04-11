package egovframework.com.cop.cmy.service;

import java.util.List;
import java.util.Map;

import egovframework.com.cop.bbs.service.BoardUseInf;

/**
 * 커뮤니티 정보를 관리하기 위한 서비스 인터페이스 클래스
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
public interface EgovCommunityManageService {	
	
    /**
     * 커뮤니티에 대한 정보를 등록한다.
     * 
     * @param cmmnty
     * @throws Exception
     */
    public void insertCommunityInf(Community cmmnty) throws Exception;

    /**
     * 커뮤니티 정보를 수정한다.
     * 
     * @param cmmnty
     * @throws Exception
     */
    public void updateCommunityInf(Community cmmnty) throws Exception;

    /**
     * 커뮤니티에 대한 정보를 삭제한다.
     * 
     * @param cmmnty
     * @throws Exception
     */
    public void deleteCommunityInf(Community cmmnty) throws Exception;

    /**
     * 커뮤니티 정보 목록을 조회한다.
     * 
     * @param cmmntyVO
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectCommunityInfs(CommunityVO cmmntyVO) throws Exception;

    /**
     * 커뮤니티 사용자 정보를 등록한다.
     * 
     * @param cmmntyUser
     * @throws Exception
     */
    public String insertCommunityUserInf(CommunityUser cmmntyUser) throws Exception;

    /**
     * 커뮤니티 사용자 정보를 확인한다.
     * 
     * @param cmmntyUser
     * @throws Exception
     */
    public String checkCommunityUserInf(CommunityUser cmmntyUser) throws Exception;

    /**
     * 커뮤니티 사용자 정보를 수정한다.
     * 
     * @param cmmntyUser
     * @throws Exception
     */
    public void updateCommunityUserInf(CommunityUser cmmntyUser) throws Exception;

    /**
     * 커뮤니티 사용정보를 삭제한다.
     * 
     * @param cmmntyUser
     * @throws Exception
     */
    public void deleteCommunityUserInf(CommunityUser cmmntyUser) throws Exception;

    /**
     * 커뮤니티 사용자 정보에 대한 목록을 조회한다.
     * 
     * @param cmmntyUserVO
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectCommunityUserInfs(CommunityUserVO cmmntyUserVO) throws Exception;

    /**
     * 커뮤니티에 대한 게시판 사용정보를 등록한다.
     * 
     * @param bdUseInf
     * @throws Exception
     */
    public void insertCommunityBBSUseInf(BoardUseInf bdUseInf) throws Exception;

    /**
     * 커뮤니티 게시판 사용정보를 수정한다.
     * 
     * @param bdUseInf
     * @throws Exception
     */
    public void updateCommunityBBSUseInf(BoardUseInf bdUseInf) throws Exception;

    /**
     * 커뮤니티 게사판 사용정보 목록을 조회한다.
     * 
     * @param cmmntyVO
     * @return
     * @throws Exception
     */
    public List<CommunityVO> selectCommunityBBSUseInf(CommunityVO cmmntyVO) throws Exception;

    /**
     * 커뮤니티에 대한 특정 사용자 정보를 조회한다.
     * 
     * @param cmmntyVO
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectCommunityInf(CommunityVO cmmntyVO) throws Exception;

    /**
     * 커뮤니티 관리자 정보를 조회한다.
     * 
     * @param cmmntyVO
     * @return
     * @throws Exception
     */
    public CommunityUser selectManager(CommunityVO cmmntyVO) throws Exception;

    /**
     * 포트릿을 위한 커뮤니티 정보 목록 정보를 조회한다.
     * 
     * @param cmmntyVO
     * @return
     * @throws Exception
     */
    public List<CommunityVO> selectCmmntyListPortlet(CommunityVO cmmntyVO) throws Exception;

    /**
     * 커뮤니티용 템플릿 경로명을 조회한다.
     * 
     * @param cmmntyVO
     * @return
     * @throws Exception
     */
    public String selectCmmntyTemplat(CommunityVO cmmntyVO) throws Exception;

    /**
     * 모든 커뮤니티 목록을 조회한다.
     * 
     * @param cmmntyVO
     * @return
     * @throws Exception
     */
    public List<CommunityVO> selectAllCmmnty(CommunityVO cmmntyVO) throws Exception;
    
    /**
     * 관리자 여부를 확인한다.
     * 
     * @param cmmntyUser
     * @return
     * @throws Exception
     */
    public boolean isManager(CommunityUser cmmntyUser) throws Exception;
}
