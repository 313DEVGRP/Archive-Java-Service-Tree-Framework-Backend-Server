package egovframework.com.cop.bbs.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

@SuppressWarnings("serial")
public class BoardMaster implements Serializable {
    
    /** 게시판 아이디 */
    private String bbsId = "";
    
    /** 게시판 소개 */
    private String bbsIntrcn = "";
    
    /** 게시판 명 */
    private String bbsNm = "";
    
    /** 게시판 유형코드 */
    private String bbsTyCode = "";
    
    /** 파일첨부가능여부 */
    private String fileAtchPosblAt = "";
    
    /** 최초등록자 아이디 */
    private String frstRegisterId = "";
    
    /** 최초등록시점 */
    private String frstRegisterPnttm = "";
    
    /** 최종수정자 아이디 */
    public String lastUpdusrId = "";
    
    /** 최종수정시점 */
    private String lastUpdusrPnttm = "";
    
    /** 첨부가능파일숫자 */
    private int atchPosblFileNumber = 0;
    
    /** 첨부가능파일사이즈 */
    private String atchPosblFileSize = "";
    
    /** 답장가능여부 */
    private String replyPosblAt = "";
    
    /** 템플릿 아이디 */
    private String tmplatId = "";
    
    /** 사용여부 */
    private String useAt = "";
    
    /** 사용플래그 */
    private String bbsUseFlag = "";
    
    /** 대상 아이디 */
    private String trgetId = "";
    
    /** 등록구분코드 */
    private String registSeCode = "";
    
    /** 유일 아이디 */
    private String uniqId = "";
    
    /** 템플릿 명 */
    private String tmplatNm = "";
    
    /** 커뮤니티 ID */
    private String cmmntyId;
    
    //---------------------------------
    // 2009.06.26 : 2단계 기능 추가
    //---------------------------------
    /** 추가 option (댓글-comment, 만족도조사-stsfdg) */
    private String option = "";
    
    /** 댓글 여부 */
    private String commentAt = "";
    
    /** 만족도조사 */
    private String stsfdgAt = "";
    ////-------------------------------

    public String getBbsId() {
	return bbsId;
    }

    public void setBbsId(String bbsId) {
	this.bbsId = bbsId;
    }

    public String getBbsIntrcn() {
	return bbsIntrcn;
    }

    public void setBbsIntrcn(String bbsIntrcn) {
	this.bbsIntrcn = bbsIntrcn;
    }

    public String getBbsNm() {
	return bbsNm;
    }

    public void setBbsNm(String bbsNm) {
	this.bbsNm = bbsNm;
    }

    public String getBbsTyCode() {
	return bbsTyCode;
    }

    public void setBbsTyCode(String bbsTyCode) {
	this.bbsTyCode = bbsTyCode;
    }

    public String getFileAtchPosblAt() {
	return fileAtchPosblAt;
    }

    public void setFileAtchPosblAt(String fileAtchPosblAt) {
	this.fileAtchPosblAt = fileAtchPosblAt;
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

    public int getAtchPosblFileNumber() {
	return atchPosblFileNumber;
    }

    public void setAtchPosblFileNumber(int atchPosblFileNumber) {
	this.atchPosblFileNumber = atchPosblFileNumber;
    }

    public String getAtchPosblFileSize() {
	return atchPosblFileSize;
    }

    public void setAtchPosblFileSize(String atchPosblFileSize) {
	this.atchPosblFileSize = atchPosblFileSize;
    }

    public String getReplyPosblAt() {
	return replyPosblAt;
    }

    public void setReplyPosblAt(String replyPosblAt) {
	this.replyPosblAt = replyPosblAt;
    }

    public String getTmplatId() {
	return tmplatId;
    }

    public void setTmplatId(String tmplatId) {
	this.tmplatId = tmplatId;
    }

    public String getUseAt() {
	return useAt;
    }

    public void setUseAt(String useAt) {
	this.useAt = useAt;
    }

    public String getBbsUseFlag() {
	return bbsUseFlag;
    }

    public void setBbsUseFlag(String bbsUseFlag) {
	this.bbsUseFlag = bbsUseFlag;
    }

    public String getTrgetId() {
	return trgetId;
    }

    public void setTrgetId(String trgetId) {
	this.trgetId = trgetId;
    }

    public String getRegistSeCode() {
	return registSeCode;
    }

    public void setRegistSeCode(String registSeCode) {
	this.registSeCode = registSeCode;
    }

    public String getUniqId() {
	return uniqId;
    }

    public void setUniqId(String uniqId) {
	this.uniqId = uniqId;
    }

    public String getTmplatNm() {
	return tmplatNm;
    }

    public void setTmplatNm(String tmplatNm) {
	this.tmplatNm = tmplatNm;
    }

    public String getOption() {
        return option;
    }

    public void setOption(String option) {
        this.option = option;
    }

    public String getCommentAt() {
        return commentAt;
    }

    public void setCommentAt(String commentAt) {
        this.commentAt = commentAt;
    }

    public String getStsfdgAt() {
        return stsfdgAt;
    }

    public void setStsfdgAt(String stsfdgAt) {
        this.stsfdgAt = stsfdgAt;
    }
    
    public String getCmmntyId() {
    	return cmmntyId;
    }
    
    public void setCmmntyId(String cmmntyId) {
    	this.cmmntyId = cmmntyId;
    }

    public String toString() {
	return ToStringBuilder.reflectionToString(this);
    }
}
