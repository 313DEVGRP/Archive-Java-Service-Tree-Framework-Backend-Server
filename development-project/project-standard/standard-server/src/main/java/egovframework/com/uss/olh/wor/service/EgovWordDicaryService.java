package egovframework.com.uss.olh.wor.service;

import java.util.List;

/**
 *
 * 용어사전 처리를 위한 서비스 클래스
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
public interface EgovWordDicaryService {

	/**
	 * 용어사전 상세 조회를 한다.
	 * @param vo
	 * @return	상세내용
	 * @throws Exception
	 */
	WordDicaryVO selectWordDicaryDetail(WordDicaryVO vo) throws Exception;

	/**
	 * 용어사전 목록을 조회한다.
	 * @param searchVO
	 * @return	조회 목록
	 * @throws Exception
	 */
	List<?> selectWordDicaryList(WordDicaryDefaultVO searchVO) throws Exception;

	/**
	 * 글 총 갯수를 조회한다
	 * @param searchVO
	 * @return 총 갯수
	 */
	int selectWordDicaryListTotCnt(WordDicaryDefaultVO searchVO);

	/**
	 * 용어사전내용을 등록한다.
	 * @param vo
	 * @throws Exception
	 */
	void insertWordDicary(WordDicaryVO vo) throws Exception;

	/**
	 * 용어사전내용을 수정한다.
	 * @param vo
	 * @throws Exception
	 */
	void updateWordDicary(WordDicaryVO vo) throws Exception;

	/**
	 * 용어사전을 삭제한다.
	 * @param vo
	 * @throws Exception
	 */
	void deleteWordDicary(WordDicaryVO vo) throws Exception;

}
