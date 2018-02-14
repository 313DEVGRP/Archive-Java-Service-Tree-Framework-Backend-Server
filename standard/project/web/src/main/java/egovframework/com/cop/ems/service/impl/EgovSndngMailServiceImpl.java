package egovframework.com.cop.ems.service.impl;

import egovframework.com.cop.ems.service.EgovMultiPartEmail;
import egovframework.com.cop.ems.service.EgovSndngMailService;
import egovframework.com.cop.ems.service.SndngMailVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

import javax.annotation.Resource;

import org.apache.commons.mail.EmailAttachment;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.MailAuthenticationException;
import org.springframework.mail.MailParseException;
import org.springframework.mail.MailSendException;
import org.springframework.stereotype.Service;

@Service("egovSndngMailService")
public class EgovSndngMailServiceImpl extends EgovAbstractServiceImpl implements EgovSndngMailService {

	@Resource(name = "egovMultiPartEmail")
	private EgovMultiPartEmail egovMultiPartEmail;

	@Resource(name = "sndngMailRegistDAO")
	private SndngMailRegistDAO sndngMailRegistDAO;

	private static final Logger LOGGER = LoggerFactory.getLogger(EgovSndngMailServiceImpl.class);

	@Override
	@SuppressWarnings("unused")
	public boolean sndngMail(SndngMailVO sndngMailVO) throws Exception {

		String recptnPerson = (sndngMailVO.getRecptnPerson() == null) ? "" : sndngMailVO.getRecptnPerson(); // 수신자
		String subject = (sndngMailVO.getSj() == null) ? "" : sndngMailVO.getSj(); // 메일제목
		String emailCn = (sndngMailVO.getEmailCn() == null) ? "" : sndngMailVO.getEmailCn(); // 메일내용
		String atchmnFileNm = (sndngMailVO.getOrignlFileNm() == null) ? "" : sndngMailVO.getOrignlFileNm(); // 첨부파일이름
		String atchmnFilePath = (sndngMailVO.getFileStreCours() == null) ? "" : sndngMailVO.getFileStreCours(); // 첨부파일경로

		try {
			EmailAttachment attachment = new EmailAttachment();
			// 첨부파일이 있을 때
			if (atchmnFileNm != "" && atchmnFileNm != null && atchmnFilePath != "" && atchmnFilePath != null) {
				// 첨부할 attachment 정보를 생성합니다
				attachment.setPath(atchmnFilePath);
				attachment.setDisposition(EmailAttachment.ATTACHMENT);
				attachment.setDescription("첨부파일입니다");
				attachment.setName(atchmnFileNm);

				// 2015.05.08 주석수정 - 첨부파일 정보를 포함한 메일을 전송합니다 
				egovMultiPartEmail.send(recptnPerson, subject, emailCn, attachment);
			}
			// 메일을 전송합니다
			egovMultiPartEmail.send(recptnPerson, subject, emailCn);

			Throwable t = new Throwable();

		} catch (MailParseException ex) {
			sndngMailVO.setSndngResultCode("F"); // 발송결과 실패
			sndngMailRegistDAO.updateSndngMail(sndngMailVO); // 발송상태를 DB에 업데이트 한다.
			LOGGER.error("Sending Mail Exception : {} [failure when parsing the message]", ex.getCause());
			return false;
		} catch (MailAuthenticationException ex) {
			sndngMailVO.setSndngResultCode("F"); // 발송결과 실패
			sndngMailRegistDAO.updateSndngMail(sndngMailVO); // 발송상태를 DB에 업데이트 한다.
			LOGGER.error("Sending Mail Exception : {} [authentication failure]", ex.getCause());
			return false;
		} catch (MailSendException ex) {
			sndngMailVO.setSndngResultCode("F"); // 발송결과 실패
			sndngMailRegistDAO.updateSndngMail(sndngMailVO); // 발송상태를 DB에 업데이트 한다.
			LOGGER.error("Sending Mail Exception : {} [failure when sending the message]", ex.getCause());
			return false;
		} catch (Exception ex) {
			sndngMailVO.setSndngResultCode("F"); // 발송결과 실패
			sndngMailRegistDAO.updateSndngMail(sndngMailVO); // 발송상태를 DB에 업데이트 한다.
			LOGGER.error("Sending Mail Exception : {} [unknown Exception]", ex.getCause());
			LOGGER.debug(ex.getMessage());
			return false;
		}

		return true;
	}

}
