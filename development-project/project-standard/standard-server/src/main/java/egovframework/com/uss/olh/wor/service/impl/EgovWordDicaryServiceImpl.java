package egovframework.com.uss.olh.wor.service.impl;

import java.util.List;

import egovframework.com.uss.olh.wor.service.EgovWordDicaryService;
import egovframework.com.uss.olh.wor.service.WordDicaryDefaultVO;
import egovframework.com.uss.olh.wor.service.WordDicaryVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

/**
 *
 * 용어사전을 처리하는 비즈니스 구현 클래스
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
@Service("WordDicaryService")
public class EgovWordDicaryServiceImpl extends EgovAbstractServiceImpl implements EgovWordDicaryService {

	@Resource(name = "WordDicaryDAO")
	private WordDicaryDAO wordDicaryDAO;

	/** ID Generation */
	@Resource(name = "egovWordDicaryIdGnrService")
	private EgovIdGnrService idgenService;

	/**
	 * 글을 조회한다.
	 * @param vo - 조회할 정보가 담긴 WordDicaryVO
	 * @return 조회한 글
	 * @exception Exception
	 */
	@Override
	public WordDicaryVO selectWordDicaryDetail(WordDicaryVO vo) throws Exception {
		WordDicaryVO resultVO = wordDicaryDAO.selectWordDicaryDetail(vo);
		if (resultVO == null)
			throw processException("info.nodata.msg");
		return resultVO;
	}

	/**
	 * 글 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	@Override
	public List<?> selectWordDicaryList(WordDicaryDefaultVO searchVO) throws Exception {
		return wordDicaryDAO.selectWordDicaryList(searchVO);
	}

	/**
	 * 글 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 * @exception
	 */
	@Override
	public int selectWordDicaryListTotCnt(WordDicaryDefaultVO searchVO) {
		return wordDicaryDAO.selectWordDicarListTotCnt(searchVO);
	}

	/**
	 * 글을 등록한다.
	 * @param vo - 등록할 정보가 담긴 WordDicaryVO
	 * @exception Exception
	 */
	@Override
	public void insertWordDicary(WordDicaryVO vo) throws Exception {
		egovLogger.debug(vo.toString());

		String wordId = idgenService.getNextStringId();

		vo.setWordId(wordId);

		wordDicaryDAO.insertWordDicary(vo);
	}

	/**
	 * 글을 수정한다.
	 * @param vo - 수정할 정보가 담긴 WordDicaryVO
	 * @exception Exception
	 */
	@Override
	public void updateWordDicary(WordDicaryVO vo) throws Exception {
		egovLogger.debug(vo.toString());

		wordDicaryDAO.updateWordDicary(vo);
	}

	/**
	 * 글을 삭제한다.
	 * @param vo - 수정할 정보가 담긴 WordDicaryVO
	 * @exception Exception
	 */
	@Override
	public void deleteWordDicary(WordDicaryVO vo) throws Exception {
		egovLogger.debug(vo.toString());

		wordDicaryDAO.deleteWordDicary(vo);
	}

}
