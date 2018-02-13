package egovframework.com.cop.ems.service;

public interface EgovSndngMailDetailService {

	/**
	 * 발송메일을 상세 조회한다.
	 * @param vo SndngMailVO
	 * @return SndngMailVO
	 * @exception Exception
	 */
	SndngMailVO selectSndngMail(SndngMailVO vo) throws Exception;

	/**
	 * 발송메일을 삭제한다.
	 * @param vo SndngMailVO
	 * @exception
	 */
	void deleteSndngMail(SndngMailVO vo) throws Exception;

	/**
	 * 첨부파일을 삭제한다.
	 * @param vo SndngMailVO
	 * @exception
	 */
	void deleteAtchmnFile(SndngMailVO vo) throws Exception;
}
