package egovframework.com.cop.ems.service.impl;

import java.util.List;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cop.ems.service.EgovSndngMailDetailService;
import egovframework.com.cop.ems.service.EgovSndngMailDtlsService;
import egovframework.com.cop.ems.service.SndngMailVO;
import egovframework.com.utl.fcc.service.EgovStringUtil;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("sndngMailDtlsService")
public class EgovSndngMailDtlsServiceImpl extends EgovAbstractServiceImpl implements EgovSndngMailDtlsService {

	@Resource(name = "sndngMailDtlsDAO")
	private SndngMailDtlsDAO sndngMailDtlsDAO;

	@Resource(name = "sndngMailDetailService")
	private EgovSndngMailDetailService sndngMailDetailService;

	@Override
	public List<?> selectSndngMailList(ComDefaultVO vo) throws Exception {
		return sndngMailDtlsDAO.selectSndngMailList(vo);
	}

	@Override
	public int selectSndngMailListTotCnt(ComDefaultVO vo) throws Exception {
		return sndngMailDtlsDAO.selectSndngMailListTotCnt(vo);
	}

	@Override
	public void deleteSndngMailList(SndngMailVO vo) throws Exception {

		// 1. 발송메일을 삭제한다.
		String[] sbuf = EgovStringUtil.split(vo.getMssageId(), ",");
		for (int i = 0; i < sbuf.length; i++) {
			SndngMailVO sndngMailVO = new SndngMailVO();
			sndngMailVO.setMssageId(sbuf[i]);
			sndngMailDetailService.deleteSndngMail(sndngMailVO);
		}

		// 2. 첨부파일을 삭제한다.
		String[] fbuf = EgovStringUtil.split(vo.getAtchFileIdList(), ",");
		for (int i = 0; i < fbuf.length; i++) {
			SndngMailVO sndngMailVO = new SndngMailVO();
			sndngMailVO.setAtchFileId(fbuf[i]);
			sndngMailDetailService.deleteAtchmnFile(sndngMailVO);
		}
	}
}
