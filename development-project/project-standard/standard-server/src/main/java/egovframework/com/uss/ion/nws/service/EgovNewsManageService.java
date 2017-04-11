package egovframework.com.uss.ion.nws.service;

import java.util.List;

/**
 *
 * 뉴스정보를 처리하는 서비스 클래스
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
public interface EgovNewsManageService {

    /**
     * 뉴스 상세조회를 한다.
     * @param vo
     * @return 글 내용
     * @throws Exception
     */
	NewsManageVO selectNewsDetail(NewsManageVO vo) throws Exception;

    /**
     * 뉴스목록을 조회한다.
     * @param searchVO
     * @return	글 목록
     * @throws Exception
     */
    List<?> selectNewsList(NewsManageDefaultVO searchVO) throws Exception;

    /**
     * 뉴스정보 총 갯수를 조회한다.
     * @param searchVO
     * @return	총 갯수
     */
    int selectNewsListTotCnt(NewsManageDefaultVO searchVO);

	/**
	 * 뉴스정보를 등록한다.
	 * @param vo
	 * @throws Exception
	 */
    void insertNewsInfo(NewsManageVO vo) throws Exception;


	/**
	 * 뉴스정보를 수정한다.
	 * @param vo
	 * @throws Exception
	 */
    void updateNewsInfo(NewsManageVO vo) throws Exception;

	/**
	 * 뉴스정보를 삭제한다.
	 * @param vo
	 * @throws Exception
	 */
    void deleteNewsInfo(NewsManageVO vo) throws Exception;


}
