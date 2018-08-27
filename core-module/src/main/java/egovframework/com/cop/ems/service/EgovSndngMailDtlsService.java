package egovframework.com.cop.ems.service;

import java.util.List;

import egovframework.com.cmm.ComDefaultVO;

public interface EgovSndngMailDtlsService {

	List<?> selectSndngMailList(ComDefaultVO vo) throws Exception;

	int selectSndngMailListTotCnt(ComDefaultVO vo) throws Exception;

	void deleteSndngMailList(SndngMailVO vo) throws Exception;
}
