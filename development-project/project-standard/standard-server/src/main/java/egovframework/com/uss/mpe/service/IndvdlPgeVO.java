package egovframework.com.uss.mpe.service;

/**
 * 개요
 * - 마이페이지에 대한 VO 클래스를 정의한다.
 * 
 * 상세내용
 * - 마이페이지의 탭아이디, 사용자아이디, 탭명, 상단이미지, 타이틀 바 색상, 정렬방식을 관리한다.
 * @author 이창원
 * @version 1.0
 * @created 05-8-2009 오후 2:20:29
 */
public class IndvdlPgeVO extends IndvdlPge {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 사용자아이디
	 */
	private String userId;
	/**
	 * 타이틀 바 색상
	 */
	private String titleBarColor;
	/**
	 * 정렬방식
	 */
	private String sortMthd;
	/**
	 * 정렬개수
	 */
	private int sortCnt;
	
	/**
	 * 정렬별 라인 카운트
	 */	
	private int sortLineCnt;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getTitleBarColor() {
		return titleBarColor;
	}

	public void setTitleBarColor(String titleBarColor) {
		this.titleBarColor = titleBarColor;
	}

	public String getSortMthd() {
		return sortMthd;
	}

	public void setSortMthd(String sortMthd) {
		this.sortMthd = sortMthd;
	}

	public int getSortCnt() {
		return sortCnt;
	}

	public void setSortCnt(int sortCnt) {
		this.sortCnt = sortCnt;
	}

	public int getSortLineCnt() {
		return sortLineCnt;
	}

	public void setSortLineCnt(int sortLineCnt) {
		this.sortLineCnt = sortLineCnt;
	}	
}