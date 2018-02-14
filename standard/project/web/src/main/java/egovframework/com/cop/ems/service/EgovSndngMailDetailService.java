package egovframework.com.cop.ems.service;

public interface EgovSndngMailDetailService {

	SndngMailVO selectSndngMail(SndngMailVO vo) throws Exception;

	void deleteSndngMail(SndngMailVO vo) throws Exception;

	void deleteAtchmnFile(SndngMailVO vo) throws Exception;
}
