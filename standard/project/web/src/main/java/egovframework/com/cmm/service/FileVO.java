package egovframework.com.cmm.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

@SuppressWarnings("serial")
public class FileVO implements Serializable {

    /**
     * 첨부파일 아이디
     */
    public String atchFileId = "";
    /**
     * 생성일자
     */
    public String creatDt = "";
    /**
     * 파일내용
     */
    public String fileCn = "";
    /**
     * 파일확장자
     */
    public String fileExtsn = "";
    /**
     * 파일크기
     */
    public String fileMg = "";
    /**
     * 파일연번
     */
    public String fileSn = "";
    /**
     * 파일저장경로
     */
    public String fileStreCours = "";
    /**
     * 원파일명
     */
    public String orignlFileNm = "";
    /**
     * 저장파일명
     */
    public String streFileNm = "";

    public String getAtchFileId() {
	return atchFileId;
    }

    public void setAtchFileId(String atchFileId) {
	this.atchFileId = atchFileId;
    }

    public String getCreatDt() {
	return creatDt;
    }

    public void setCreatDt(String creatDt) {
	this.creatDt = creatDt;
    }

    public String getFileCn() {
	return fileCn;
    }

    public void setFileCn(String fileCn) {
	this.fileCn = fileCn;
    }

    public String getFileExtsn() {
	return fileExtsn;
    }

    public void setFileExtsn(String fileExtsn) {
	this.fileExtsn = fileExtsn;
    }

    public String getFileMg() {
	return fileMg;
    }

    public void setFileMg(String fileMg) {
	this.fileMg = fileMg;
    }

    public String getFileSn() {
	return fileSn;
    }

    public void setFileSn(String fileSn) {
	this.fileSn = fileSn;
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

    public String getStreFileNm() {
	return streFileNm;
    }

    public void setStreFileNm(String streFileNm) {
	this.streFileNm = streFileNm;
    }

    public String toString() {
	return ToStringBuilder.reflectionToString(this);
    }
	
}
