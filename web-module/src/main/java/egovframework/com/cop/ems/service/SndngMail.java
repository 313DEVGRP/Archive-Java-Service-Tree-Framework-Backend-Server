package egovframework.com.cop.ems.service;

public class SndngMail {

	/** 발신자 */
	public String dsptchPerson;
	/** 내용 */
	public String emailCn;
	/** 메시지ID */
	public String mssageId;
	/** 수신자 */
	public String recptnPerson;
	/** 제목 */
	public String sj;
	/** 발송결과코드 */
	public String sndngResultCode;
	/** 발신일자 */
	private String sndngDe;

	public String getDsptchPerson() {
		return dsptchPerson;
	}

	public void setDsptchPerson(String dsptchPerson) {
		this.dsptchPerson = dsptchPerson;
	}

	public String getEmailCn() {
		return emailCn;
	}

	public void setEmailCn(String emailCn) {
		this.emailCn = emailCn;
	}

	public String getMssageId() {
		return mssageId;
	}

	public void setMssageId(String mssageId) {
		this.mssageId = mssageId;
	}

	public String getRecptnPerson() {
		return recptnPerson;
	}

	public void setRecptnPerson(String recptnPerson) {
		this.recptnPerson = recptnPerson;
	}

	public String getSj() {
		return sj;
	}

	public void setSj(String sj) {
		this.sj = sj;
	}

	public String getSndngResultCode() {
		return sndngResultCode;
	}

	public void setSndngResultCode(String sndngResultCode) {
		this.sndngResultCode = sndngResultCode;
	}

	public String getSndngDe() {
		return sndngDe;
	}

	public void setSndngDe(String sndngDe) {
		this.sndngDe = sndngDe;
	}
}
