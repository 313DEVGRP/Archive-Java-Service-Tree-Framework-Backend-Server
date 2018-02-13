package egovframework.com.cop.ems.service;

import java.util.List;

import egovframework.com.cmm.ComDefaultVO;

public interface EgovSndngMailDtlsService {

	/**
	 * 발송메일 목록을 조회한다.
	 * @param vo ComDefaultVO
	 * @return List
	 * @exception Exception
	 */
	List<?> selectSndngMailList(ComDefaultVO vo) throws Exception;

	/**
	 * 발송메일 총건수를 조회한다.
	 * @param vo ComDefaultVO
	 * @return int
	 * @exception
	 */
	int selectSndngMailListTotCnt(ComDefaultVO vo) throws Exception;

	/**
	 * 발송메일을 삭제한다.
	 * @param vo SndngMailVO
	 * @exception
	 */
	void deleteSndngMailList(SndngMailVO vo) throws Exception;
}
