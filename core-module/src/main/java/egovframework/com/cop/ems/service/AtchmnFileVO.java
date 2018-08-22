package egovframework.com.cop.ems.service;

public class AtchmnFileVO {

	/** 첨부파일ID */
	private String atchFileId;
	/** 파일연번 */
	private String fileSn;
	/** 원파일명 */
	private String orignlFileNm;
	/** 저장파일명 */
	private String streFileNm;
	/** 파일저장경로 */
	private String fileStreCours;
	/** 파일확장자 */
	private String fileExtsn;
	/** 파일크기 */
	private int fileMg;

	public String getAtchFileId() {
		return atchFileId;
	}

	public void setAtchFileId(String atchFileId) {
		this.atchFileId = atchFileId;
	}

	public String getFileSn() {
		return fileSn;
	}

	public void setFileSn(String fileSn) {
		this.fileSn = fileSn;
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

	public String getFileStreCours() {
		return fileStreCours;
	}

	public void setFileStreCours(String fileStreCours) {
		this.fileStreCours = fileStreCours;
	}

	public String getFileExtsn() {
		return fileExtsn;
	}

	public void setFileExtsn(String fileExtsn) {
		this.fileExtsn = fileExtsn;
	}

	public int getFileMg() {
		return fileMg;
	}

	public void setFileMg(int fileMg) {
		this.fileMg = fileMg;
	}
}
