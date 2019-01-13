package egovframework.com.cop.bbs.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

@SuppressWarnings("serial")
public class Board implements Serializable {

	/**
	 * 게시물 첨부파일 아이디
	 */
	private String atchFileId = "";
	/**
	 * 게시판 아이디
	 */
	private String bbsId = "";
	/**
	 * 최초등록자 아이디
	 */
	private String frstRegisterId = "";
	/**
	 * 최초등록시점
	 */
	private String frstRegisterPnttm = "";
	/**
	 * 최종수정자 아이디
	 */
	private String lastUpdusrId = "";
	/**
	 * 최종수정시점
	 */
	private String lastUpdusrPnttm = "";
	/**
	 * 게시시작일
	 */
	private String ntceBgnde = "";
	/**
	 * 게시종료일
	 */
	private String ntceEndde = "";
	/**
	 * 게시자 아이디
	 */
	private String ntcrId = "";
	/**
	 * 게시자명
	 */
	private String ntcrNm = "";
	/**
	 * 게시물 내용
	 */
	private String nttCn = "";
	/**
	 * 게시물 아이디
	 */
	private long nttId = 0L;
	/**
	 * 게시물 번호
	 */
	private long nttNo = 0L;
	/**
	 * 게시물 제목
	 */
	private String nttSj = "";
	/**
	 * 부모글번호
	 */
	private String parnts = "0";
	/**
	 * 패스워드
	 */
	private String password = "";
	/**
	 * 조회수
	 */
	private int inqireCo = 0;
	/**
	 * 답장여부
	 */
	private String replyAt = "";
	/**
	 * 답장위치
	 */
	private String replyLc = "0";
	/**
	 * 정렬순서
	 */
	private long sortOrdr = 0L;
	/**
	 * 사용여부
	 */
	private String useAt = "";
	/**
	 * 게시 종료일
	 */
	private String ntceEnddeView = ""; 
	/**
	 * 게시 시작일
	 */
	private String ntceBgndeView = "";
	/**
	 * 공지사항 여부 
	 */
	private String noticeAt = "";
	/**
	 * 비밀글 여부 
	 */
	private String secretAt = "";
	/**
	 * 제목 Bold 여부 
	 */
	private String sjBoldAt = "";
	
	public String getAtchFileId() {
		return atchFileId;
	}

	public void setAtchFileId(String atchFileId) {
		this.atchFileId = atchFileId;
	}

	public String getBbsId() {
		return bbsId;
	}

	public void setBbsId(String bbsId) {
		this.bbsId = bbsId;
	}

	public String getFrstRegisterId() {
		return frstRegisterId;
	}

	public void setFrstRegisterId(String frstRegisterId) {
		this.frstRegisterId = frstRegisterId;
	}

	public String getFrstRegisterPnttm() {
		return frstRegisterPnttm;
	}

	public void setFrstRegisterPnttm(String frstRegisterPnttm) {
		this.frstRegisterPnttm = frstRegisterPnttm;
	}

	public String getLastUpdusrId() {
		return lastUpdusrId;
	}

	public void setLastUpdusrId(String lastUpdusrId) {
		this.lastUpdusrId = lastUpdusrId;
	}

	public String getLastUpdusrPnttm() {
		return lastUpdusrPnttm;
	}

	public void setLastUpdusrPnttm(String lastUpdusrPnttm) {
		this.lastUpdusrPnttm = lastUpdusrPnttm;
	}

	public String getNtceBgnde() {
		return ntceBgnde;
	}

	public void setNtceBgnde(String ntceBgnde) {
		this.ntceBgnde = ntceBgnde;
	}

	public String getNtceEndde() {
		return ntceEndde;
	}

	public void setNtceEndde(String ntceEndde) {
		this.ntceEndde = ntceEndde;
	}

	public String getNtcrId() {
		return ntcrId;
	}

	public void setNtcrId(String ntcrId) {
		this.ntcrId = ntcrId;
	}

	public String getNtcrNm() {
		return ntcrNm;
	}

	public void setNtcrNm(String ntcrNm) {
		this.ntcrNm = ntcrNm;
	}

	public String getNttCn() {
		return nttCn;
	}

	public void setNttCn(String nttCn) {
		this.nttCn = nttCn;
	}

	public long getNttId() {
		return nttId;
	}

	public void setNttId(long nttId) {
		this.nttId = nttId;
	}

	public long getNttNo() {
		return nttNo;
	}

	public void setNttNo(long nttNo) {
		this.nttNo = nttNo;
	}

	public String getNttSj() {
		return nttSj;
	}

	public void setNttSj(String nttSj) {
		this.nttSj = nttSj;
	}

	public String getParnts() {
		return parnts;
	}

	public void setParnts(String parnts) {
		this.parnts = parnts;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getInqireCo() {
		return inqireCo;
	}

	public void setInqireCo(int inqireCo) {
		this.inqireCo = inqireCo;
	}

	public String getReplyAt() {
		return replyAt;
	}

	public void setReplyAt(String replyAt) {
		this.replyAt = replyAt;
	}

	public String getReplyLc() {
		return replyLc;
	}

	public void setReplyLc(String replyLc) {
		this.replyLc = replyLc;
	}

	public long getSortOrdr() {
		return sortOrdr;
	}

	public void setSortOrdr(long sortOrdr) {
		this.sortOrdr = sortOrdr;
	}

	public String getUseAt() {
		return useAt;
	}

	public void setUseAt(String useAt) {
		this.useAt = useAt;
	}

	public String getNtceEnddeView() {
		return ntceEnddeView;
	}

	public void setNtceEnddeView(String ntceEnddeView) {
		this.ntceEnddeView = ntceEnddeView;
	}

	public String getNtceBgndeView() {
		return ntceBgndeView;
	}

	public void setNtceBgndeView(String ntceBgndeView) {
		this.ntceBgndeView = ntceBgndeView;
	}
	
	public String getNoticeAt() {
		return noticeAt;
	}

	public void setNoticeAt(String noticeAt) {
		this.noticeAt = noticeAt;
	}
	
	public String getSecretAt() {
		return secretAt;
	}

	public void setSecretAt(String secretAt) {
		this.secretAt = secretAt;
	}
	
	public String getSjBoldAt() {
		return sjBoldAt;
	}

	public void setSjBoldAt(String sjBoldAt) {
		this.sjBoldAt = sjBoldAt;
	}

	public String toString(){
		return ToStringBuilder.reflectionToString(this);
	}
}
