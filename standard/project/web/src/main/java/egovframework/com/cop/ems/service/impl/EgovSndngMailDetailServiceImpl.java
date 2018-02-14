package egovframework.com.cop.ems.service.impl;

import java.io.File;

import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.service.Globals;
import egovframework.com.cop.ems.service.EgovSndngMailDetailService;
import egovframework.com.cop.ems.service.SndngMailVO;
import egovframework.com.utl.sim.service.EgovFileTool;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("sndngMailDetailService")
public class EgovSndngMailDetailServiceImpl extends EgovAbstractServiceImpl implements EgovSndngMailDetailService {

	// 파일구분자
	static final char FILE_SEPARATOR = File.separatorChar;

	@Resource(name = "sndngMailDetailDAO")
	private SndngMailDetailDAO sndngMailDetailDAO;

	@Resource(name = "EgovFileMngService")
	private EgovFileMngService egovFileMngService;

	@Override
	public SndngMailVO selectSndngMail(SndngMailVO vo) throws Exception {

		// 1. 발송메일 정보를 조회한다.
		SndngMailVO resultMailVO = sndngMailDetailDAO.selectSndngMail(vo);

		return resultMailVO;
	}

	@Override
	public void deleteSndngMail(SndngMailVO vo) throws Exception {

		// 1. 발송메일을 삭제한다.
		sndngMailDetailDAO.deleteSndngMail(vo);

		// 2. 발송요청XML파일을 삭제한다.
		String xmlFile = Globals.MAIL_REQUEST_PATH + vo.getMssageId() + ".xml";
		EgovFileTool.deleteFile(xmlFile);
	}

	@Override
	public void deleteAtchmnFile(SndngMailVO vo) throws Exception {

		// 1. 첨부파일 목록을 삭제한다. (이삼섭 책임 제공)
		FileVO fileVO = new FileVO();
		fileVO.setAtchFileId(vo.getAtchFileId());
		egovFileMngService.deleteAllFileInf(fileVO);
	}
}
