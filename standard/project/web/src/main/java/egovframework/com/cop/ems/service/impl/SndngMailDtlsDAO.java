package egovframework.com.cop.ems.service.impl;

import java.util.List;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository("sndngMailDtlsDAO")
public class SndngMailDtlsDAO extends EgovComAbstractDAO {

	/**
	 * 발송메일 목록을 조회한다.
	 * @param vo ComDefaultVO
	 * @return List
	 * @exception Exception
	 */
	public List<?> selectSndngMailList(ComDefaultVO vo) throws Exception {
		return list("SndngMailDtlsDAO.selectSndngMailList_D", vo);
	}

	/**
	 * 발송메일 총건수를 조회한다.
	 * @param vo ComDefaultVO
	 * @return int
	 * @exception
	 */
	public int selectSndngMailListTotCnt(ComDefaultVO vo) {
		return (Integer) selectOne("SndngMailDtlsDAO.selectSndngMailListTotCnt_S", vo);
	}
}
