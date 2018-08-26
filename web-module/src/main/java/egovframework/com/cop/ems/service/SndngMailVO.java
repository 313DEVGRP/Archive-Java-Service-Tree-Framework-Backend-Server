package egovframework.com.cop.ems.service;

public class SndngMailVO {

	/** 메세지ID */
	private String mssageId;
	/** 발신자 */
	private String dsptchPerson;
	/** 수신자 */
	private String recptnPerson;
	/** 제목 */
	private String sj;
	/** 발송결과코드 */
	private String sndngResultCode;
	/** 메일내용 */
	private String emailCn;
	/** 첨부파일ID */
	private String atchFileId;
	/** 첨부파일경로 */
	private String fileStreCours;
	/** 첨부파일이름 */
	private String orignlFileNm;
	/** 발신일자 */
	private String sndngDe;
	/** 첨부파일ID 리스트 */
	private String atchFileIdList;
	/** 발송요청XML내용 */
	private String xmlContent;
	/** 팝업링크여부(Y/N) */
	private String link;

	public String getMssageId() {
		return mssageId;
	}

	public void setMssageId(String mssageId) {
		this.mssageId = mssageId;
	}

	public String getDsptchPerson() {
		return dsptchPerson;
	}

	public void setDsptchPerson(String dsptchPerson) {
		this.dsptchPerson = dsptchPerson;
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

	public String getEmailCn() {
		return emailCn;
	}

	public void setEmailCn(String emailCn) {
		this.emailCn = emailCn;
	}

	public String getAtchFileId() {
		return atchFileId;
	}

	public void setAtchFileId(String atchFileId) {
		this.atchFileId = atchFileId;
	}

	public String getFileStreCours() {
		return fileStreCours;
	}

	public void setFileStreCours(String fileStreCours) {
		this.fileStreCours = fileStreCours;
	}

	public String getOrignlFileNm() {
		return orignlFileNm;
	}

	public void setOrignlFileNm(String orignlFileNm) {
		this.orignlFileNm = orignlFileNm;
	}

	public String getSndngDe() {
		return sndngDe;
	}

	public void setSndngDe(String sndngDe) {
		this.sndngDe = sndngDe;
	}

	public String getAtchFileIdList() {
		return atchFileIdList;
	}

	public void setAtchFileIdList(String atchFileIdList) {
		this.atchFileIdList = atchFileIdList;
	}

	public String getXmlContent() {
		return xmlContent;
	}

	public void setXmlContent(String xmlContent) {
		this.xmlContent = xmlContent;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}
}
