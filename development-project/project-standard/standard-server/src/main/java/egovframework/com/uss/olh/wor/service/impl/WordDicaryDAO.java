package egovframework.com.uss.olh.wor.service.impl;

import java.util.List;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.uss.olh.wor.service.WordDicaryDefaultVO;
import egovframework.com.uss.olh.wor.service.WordDicaryVO;

import org.springframework.stereotype.Repository;

/**
 *
 * 용어사전을 처리하는 DAO 클래스
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
@Repository("WordDicaryDAO")
public class WordDicaryDAO extends EgovComAbstractDAO {

	/**
	 * 용어사전을 상세조회한다.
	 * @param vo
	 * @return	상세내용
	 * @throws Exception
	 */
	public WordDicaryVO selectWordDicaryDetail(WordDicaryVO vo) throws Exception {
		return (WordDicaryVO) select("WordDicaryDAO.selectWordDicaryDetail_S", vo);
	}

	/**
	 * 용어사전 목록을 조회한다.
	 * @param searchVO
	 * @return	내용 목록
	 * @throws Exception
	 */
	public List<?> selectWordDicaryList(WordDicaryDefaultVO searchVO) throws Exception {
		return list("WordDicaryDAO.selectWordDicaryList_D", searchVO);
	}

	/**
	 * 용어사전 총 갯수를 조회한다.
	 * @param searchVO
	 * @return	총 갯수
	 */
	public int selectWordDicarListTotCnt(WordDicaryDefaultVO searchVO) {
		return (Integer) select("WordDicaryDAO.selectWordDicaryListTotCnt_S", searchVO);
	}

	/**
	 * 용어사전을 등록한다.
	 * @param vo
	 * @throws Exception
	 */
	public void insertWordDicary(WordDicaryVO vo) throws Exception {
		insert("wordDicaryDAO.insertWordDicary_S", vo);
	}

	/**
	 * 용어사전을 수정한다.
	 * @param vo
	 * @throws Exception
	 */
	public void updateWordDicary(WordDicaryVO vo) throws Exception {
		update("wordDicaryDAO.updateWordDicary_S", vo);
	}

	/**
	 * 용어사전을 삭제한다.
	 * @param vo
	 * @throws Exception
	 */
	public void deleteWordDicary(WordDicaryVO vo) throws Exception {
		delete("wordDicaryDAO.deleteWordDicary_S", vo);
	}

}
