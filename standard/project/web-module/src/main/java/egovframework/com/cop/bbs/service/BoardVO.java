package egovframework.com.cop.bbs.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

@SuppressWarnings("serial")
public class BoardVO extends Board implements Serializable {

    /** 검색시작일 */
    private String searchBgnDe = "";
    
    /** 검색조건 */
    private String searchCnd = "";
    
    /** 검색종료일 */
    private String searchEndDe = "";
    
    /** 검색단어 */
    private String searchWrd = "";
    
    /** 정렬순서(DESC,ASC) */
    private long sortOrdr = 0L;

    /** 검색사용여부 */
    private String searchUseYn = "";

    /** 현재페이지 */
    private int pageIndex = 1;

    /** 페이지갯수 */
    private int pageUnit = 10;

    /** 페이지사이즈 */
    private int pageSize = 10;

    /** 첫페이지 인덱스 */
    private int firstIndex = 1;

    /** 마지막페이지 인덱스 */
    private int lastIndex = 1;

    /** 페이지당 레코드 개수 */
    private int recordCountPerPage = 10;

    /** 레코드 번호 */
    private int rowNo = 0;

    /** 최초 등록자명 */
    private String frstRegisterNm = "";

    /** 최종 수정자명 */
    private String lastUpdusrNm = "";

    /** 유효여부 */
    private String isExpired = "N";

    /** 상위 정렬 순서 */
    private String parntsSortOrdr = "";

    /** 상위 답변 위치 */
    private String parntsReplyLc = "";

    /** 게시판 유형코드 */
    private String bbsTyCode = "";
    
    /** 게시판 속성코드 */
    private String bbsAttrbCode = "";

    /** 게시판 명 */
    private String bbsNm = "";

    /** 파일첨부가능여부 */
    private String fileAtchPosblAt = "";
    
    /** 첨부가능파일숫자 */
    private int posblAtchFileNumber = 0;
    
    /** 답장가능여부 */
    private String replyPosblAt = "";
    
    /** 조회 수 증가 여부 */
    private boolean plusCount = false;
    
    /** 익명등록 여부 */
    private String anonymousAt = "";
    
    /** 하위 페이지 인덱스 (댓글 및 만족도 조사 여부 확인용) */
    private String subPageIndex = "";

    /** 게시글 댓글갯수 */
    private String commentCo = "";
    
    public String getSearchBgnDe() {
	return searchBgnDe;
    }

    public void setSearchBgnDe(String searchBgnDe) {
	this.searchBgnDe = searchBgnDe;
    }

    public String getSearchCnd() {
	return searchCnd;
    }

    public void setSearchCnd(String searchCnd) {
	this.searchCnd = searchCnd;
    }

    public String getSearchEndDe() {
	return searchEndDe;
    }

    public void setSearchEndDe(String searchEndDe) {
	this.searchEndDe = searchEndDe;
    }

    public String getSearchWrd() {
	return searchWrd;
    }

    public void setSearchWrd(String searchWrd) {
	this.searchWrd = searchWrd;
    }

    public long getSortOrdr() {
	return sortOrdr;
    }

    public void setSortOrdr(long sortOrdr) {
	this.sortOrdr = sortOrdr;
    }

    public String getSearchUseYn() {
	return searchUseYn;
    }

    public void setSearchUseYn(String searchUseYn) {
	this.searchUseYn = searchUseYn;
    }

    public int getPageIndex() {
	return pageIndex;
    }

    public void setPageIndex(int pageIndex) {
	this.pageIndex = pageIndex;
    }

    public int getPageUnit() {
	return pageUnit;
    }

    public void setPageUnit(int pageUnit) {
	this.pageUnit = pageUnit;
    }

    public int getPageSize() {
	return pageSize;
    }

    public void setPageSize(int pageSize) {
	this.pageSize = pageSize;
    }

    public int getFirstIndex() {
	return firstIndex;
    }

    public void setFirstIndex(int firstIndex) {
	this.firstIndex = firstIndex;
    }

    public int getLastIndex() {
	return lastIndex;
    }

    public void setLastIndex(int lastIndex) {
	this.lastIndex = lastIndex;
    }

    public int getRecordCountPerPage() {
	return recordCountPerPage;
    }

    public void setRecordCountPerPage(int recordCountPerPage) {
	this.recordCountPerPage = recordCountPerPage;
    }

    public int getRowNo() {
	return rowNo;
    }

    public void setRowNo(int rowNo) {
	this.rowNo = rowNo;
    }

    public String getFrstRegisterNm() {
	return frstRegisterNm;
    }

    public void setFrstRegisterNm(String frstRegisterNm) {
	this.frstRegisterNm = frstRegisterNm;
    }

    public String getLastUpdusrNm() {
	return lastUpdusrNm;
    }

    public void setLastUpdusrNm(String lastUpdusrNm) {
	this.lastUpdusrNm = lastUpdusrNm;
    }

    public String getIsExpired() {
	return isExpired;
    }

    public void setIsExpired(String isExpired) {
	this.isExpired = isExpired;
    }

    public String getParntsSortOrdr() {
	return parntsSortOrdr;
    }

    public void setParntsSortOrdr(String parntsSortOrdr) {
	this.parntsSortOrdr = parntsSortOrdr;
    }

    public String getParntsReplyLc() {
	return parntsReplyLc;
    }

    public void setParntsReplyLc(String parntsReplyLc) {
	this.parntsReplyLc = parntsReplyLc;
    }

    public String getBbsTyCode() {
	return bbsTyCode;
    }

    public void setBbsTyCode(String bbsTyCode) {
	this.bbsTyCode = bbsTyCode;
    }

    public String getBbsAttrbCode() {
	return bbsAttrbCode;
    }

    public void setBbsAttrbCode(String bbsAttrbCode) {
	this.bbsAttrbCode = bbsAttrbCode;
    }

    public String getBbsNm() {
	return bbsNm;
    }

    public void setBbsNm(String bbsNm) {
	this.bbsNm = bbsNm;
    }

    public String getFileAtchPosblAt() {
	return fileAtchPosblAt;
    }

    public void setFileAtchPosblAt(String fileAtchPosblAt) {
	this.fileAtchPosblAt = fileAtchPosblAt;
    }

    public int getPosblAtchFileNumber() {
	return posblAtchFileNumber;
    }

    public void setPosblAtchFileNumber(int posblAtchFileNumber) {
	this.posblAtchFileNumber = posblAtchFileNumber;
    }

    public String getReplyPosblAt() {
	return replyPosblAt;
    }

    public void setReplyPosblAt(String replyPosblAt) {
	this.replyPosblAt = replyPosblAt;
    }

    public boolean isPlusCount() {
        return plusCount;
    }

    public void setPlusCount(boolean plusCount) {
        this.plusCount = plusCount;
    }

    public String getSubPageIndex() {
        return subPageIndex;
    }

    public void setSubPageIndex(String subPageIndex) {
        this.subPageIndex = subPageIndex;
    }

    public String getAnonymousAt() {
        return anonymousAt;
    }

    public void setAnonymousAt(String anonymousAt) {
        this.anonymousAt = anonymousAt;
    }
    
    public String toString() {
	return ToStringBuilder.reflectionToString(this);
    }
    
    public String getCommentCo() {
        return commentCo;
    }

    public void setCommentCo(String commentCo) {
        this.commentCo = commentCo;
    }
    
}
