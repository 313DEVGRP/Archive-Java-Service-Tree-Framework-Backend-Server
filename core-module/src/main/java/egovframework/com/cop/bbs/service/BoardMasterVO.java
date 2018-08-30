package egovframework.com.cop.bbs.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

@SuppressWarnings("serial")
public class BoardMasterVO extends BoardMaster implements Serializable {
    
    /** 검색시작일 */
    private String searchBgnDe = "";
    
    /** 검색조건 */
    private String searchCnd = "";
    
    /** 검색종료일 */
    private String searchEndDe = "";
    
    /** 검색단어 */
    private String searchWrd = "";
    
    /** 정렬순서(DESC,ASC) */
    private String sortOrdr = "";
    
    /** 검색사용여부 */
    private String searchUseYn = "";

    /** 현재페이지 */
    private int pageIndex = 1;

    /** 페이지갯수 */
    private int pageUnit = 10;

    /** 페이지사이즈 */
    private int pageSize = 10;

    /** firstIndex */
    private int firstIndex = 1;

    /** lastIndex */
    private int lastIndex = 1;

    /** recordCountPerPage */
    private int recordCountPerPage = 10;

    /** rowNo */
    private int rowNo = 0;

    /** 최초 등록자명 */
    private String frstRegisterNm = "";

    /** 게시판유형 코드명 */
    private String bbsTyCodeNm = "";

    /** 템플릿 명 */
    private String tmplatNm = "";

    /** 최종 수정자명 */
    private String lastUpdusrNm = "";

    /** 권한지정 여부 */
    private String authFlag = "";

    /** 템플릿경로 */
    private String tmplatCours = "";

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

    public String getSortOrdr() {
	return sortOrdr;
    }

    public void setSortOrdr(String sortOrdr) {
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

    public String getBbsTyCodeNm() {
	return bbsTyCodeNm;
    }

    public void setBbsTyCodeNm(String bbsTyCodeNm) {
	this.bbsTyCodeNm = bbsTyCodeNm;
    }

    public String getTmplatNm() {
	return tmplatNm;
    }

    public void setTmplatNm(String tmplatNm) {
	this.tmplatNm = tmplatNm;
    }

    public String getLastUpdusrNm() {
	return lastUpdusrNm;
    }

    public void setLastUpdusrNm(String lastUpdusrNm) {
	this.lastUpdusrNm = lastUpdusrNm;
    }

    public String getAuthFlag() {
	return authFlag;
    }

    public void setAuthFlag(String authFlag) {
	this.authFlag = authFlag;
    }

    public String getTmplatCours() {
	return tmplatCours;
    }

    public void setTmplatCours(String tmplatCours) {
	this.tmplatCours = tmplatCours;
    }

    public String toString() {
	return ToStringBuilder.reflectionToString(this);
    }
}
