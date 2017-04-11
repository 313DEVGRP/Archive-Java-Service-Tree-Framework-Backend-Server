package egovframework.com.uss.ion.sit.service;

import java.util.List;

/**
 *
 * 사이트정보를 처리하는 클래스
 * @author 공통서비스 개발팀 박정규
 * @since 2009.04.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.04.01  박정규          최초 생성
 *
 * </pre>
 */
public interface EgovSiteManageService {

    /**
     * 사이트정보를 상세조회한다.
     * @param vo
     * @return	글 내용
     * @throws Exception
     */
	SiteManageVO selectSiteDetail(SiteManageVO vo) throws Exception;

    /**
     * 사이트목록을 조회한다.
     * @param searchVO
     * @return 글 목록
     * @throws Exception
     */
    List<?> selectSiteList(SiteManageDefaultVO searchVO) throws Exception;

    /**
     * 사이트정보 총 갯수를 조회한다.
     * @param searchVO
     * @return	총 갯수
     */
    int selectSiteListTotCnt(SiteManageDefaultVO searchVO);

	/**
	 * 사이트정보를 등록한다.
	 * @param vo
	 * @throws Exception
	 */
    void insertSiteInfo(SiteManageVO vo) throws Exception;


	/**
	 * 사이트정보를 수정한다.
	 * @param vo
	 * @throws Exception
	 */
    void updateSiteInfo(SiteManageVO vo) throws Exception;

	/**
	 * 사이트정보를 삭제한다.
	 * @param vo
	 * @throws Exception
	 */
    void deleteSiteInfo(SiteManageVO vo) throws Exception;


}
