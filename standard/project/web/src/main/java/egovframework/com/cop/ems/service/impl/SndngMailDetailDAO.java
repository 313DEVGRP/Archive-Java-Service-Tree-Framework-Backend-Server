package egovframework.com.cop.ems.service.impl;

import java.util.List;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.cop.ems.service.SndngMailVO;

import org.springframework.stereotype.Repository;

@Repository("sndngMailDetailDAO")
public class SndngMailDetailDAO extends EgovComAbstractDAO {

	/**
	 * 발송메일을 상세 조회한다.
	 * @param vo SndngMailVO
	 * @return SndngMailVO
	 * @exception Exception
	 */
	public SndngMailVO selectSndngMail(SndngMailVO vo) throws Exception {
		return (SndngMailVO) selectOne("sndngMailDetailDAO.selectSndngMail", vo);
	}

	/**
	 * 발송메일에 첨부된 파일목록을 조회한다.
	 * @param vo SndngMailVO
	 * @return List
	 * @exception
	 */
	public List<?> selectAtchmnFileList(SndngMailVO vo) {
		return list("sndngMailDetailDAO.selectAtchmnFileList", vo);
	}

	/**
	 * 발송메일을 삭제한다.
	 * @param vo SndngMailVO
	 * @exception
	 */
	public void deleteSndngMail(SndngMailVO vo) throws Exception {
		delete("sndngMailDetailDAO.deleteSndngMail", vo);
	}

	/**
	 * 첨부파일 목록을 삭제한다.
	 * @param vo SndngMailVO
	 * @exception
	 */
	public void deleteAtchmnFileList(SndngMailVO vo) throws Exception {
		delete("sndngMailDetailDAO.deleteAtchmnFileList", vo);
	}
}
