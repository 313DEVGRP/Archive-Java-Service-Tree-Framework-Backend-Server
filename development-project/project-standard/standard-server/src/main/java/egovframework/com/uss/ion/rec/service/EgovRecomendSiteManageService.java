package egovframework.com.uss.ion.rec.service;

import java.util.List;

/**
 *
 * 추천사이트정보를 처리하는 서비스 클래스
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
public interface EgovRecomendSiteManageService {

    /**
     * 추천사이트 상세조회를 한다.
     * @param vo
     * @return	상세내용
     * @throws Exception
     */
	RecomendSiteManageVO selectRecomendSiteDetail(RecomendSiteManageVO vo) throws Exception;

    /**
     * 추천사이트목록을 조회한다.
     * @param searchVO
     * @return	목록
     * @throws Exception
     */
    List<?> selectRecomendSiteList(RecomendSiteManageDefaultVO searchVO) throws Exception;

    /**
     * 추천사이트 총 갯수를 조회한다.
     * @param searchVO
     * @return	총 갯수
     */
    int selectRecomendSiteListTotCnt(RecomendSiteManageDefaultVO searchVO);

	/**
	 * 추천사이트를 등록한다.
	 * @param vo
	 * @throws Exception
	 */
    void insertRecomendSiteInfo(RecomendSiteManageVO vo) throws Exception;


	/**
	 * 추천사이트를 수정한다.
	 * @param vo
	 * @throws Exception
	 */
    void updateRecomendSiteInfo(RecomendSiteManageVO vo) throws Exception;

	/**
	 * 추천사이트를 삭제한다.
	 * @param vo
	 * @throws Exception
	 */
    void deleteRecomendSiteInfo(RecomendSiteManageVO vo) throws Exception;


}
