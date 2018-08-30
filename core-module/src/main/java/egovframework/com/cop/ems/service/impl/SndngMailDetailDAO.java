package egovframework.com.cop.ems.service.impl;

import java.util.List;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.cop.ems.service.SndngMailVO;

import org.springframework.stereotype.Repository;

@Repository("sndngMailDetailDAO")
public class SndngMailDetailDAO extends EgovComAbstractDAO {

	public SndngMailVO selectSndngMail(SndngMailVO vo) throws Exception {
		return (SndngMailVO) selectOne("sndngMailDetailDAO.selectSndngMail", vo);
	}

	public List<?> selectAtchmnFileList(SndngMailVO vo) {
		return list("sndngMailDetailDAO.selectAtchmnFileList", vo);
	}

	public void deleteSndngMail(SndngMailVO vo) throws Exception {
		delete("sndngMailDetailDAO.deleteSndngMail", vo);
	}

	public void deleteAtchmnFileList(SndngMailVO vo) throws Exception {
		delete("sndngMailDetailDAO.deleteAtchmnFileList", vo);
	}
}
