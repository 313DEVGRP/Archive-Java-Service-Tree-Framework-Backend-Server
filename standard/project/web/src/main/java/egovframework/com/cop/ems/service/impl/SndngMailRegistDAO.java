package egovframework.com.cop.ems.service.impl;

import java.util.List;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.cop.ems.service.SndngMailVO;

import org.springframework.stereotype.Repository;

@Repository("sndngMailRegistDAO")
public class SndngMailRegistDAO extends EgovComAbstractDAO {

	public SndngMailVO insertSndngMail(SndngMailVO vo) throws Exception {
		insert("sndngMailRegistDAO.insertSndngMail", vo);
		return new SndngMailVO() ;
	}

	public List<?> selectAtchmnFileList(SndngMailVO vo) throws Exception {
		return list("sndngMailRegistDAO.selectAtchmnFileList", vo);
	}

	public SndngMailVO updateSndngMail(SndngMailVO vo) throws Exception {
		update("sndngMailRegistDAO.updateSndngMail", vo);
		return new SndngMailVO();
	}
}
