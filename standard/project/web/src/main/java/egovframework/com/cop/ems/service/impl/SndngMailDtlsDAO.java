package egovframework.com.cop.ems.service.impl;

import java.util.List;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository("sndngMailDtlsDAO")
public class SndngMailDtlsDAO extends EgovComAbstractDAO {

	public List<?> selectSndngMailList(ComDefaultVO vo) throws Exception {
		return list("SndngMailDtlsDAO.selectSndngMailList_D", vo);
	}

	public int selectSndngMailListTotCnt(ComDefaultVO vo) {
		return (Integer) selectOne("SndngMailDtlsDAO.selectSndngMailListTotCnt_S", vo);
	}
}
