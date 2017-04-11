package egovframework.com.uss.mpe.service;
import java.util.List;
/**
 * 개요
 * - 마이페이지 컨텐츠에 대한 VO 클래스를 정의한다.
 * 
 * 상세내용
 * - 마이페이지 컨텐츠의 목록을 관리한다.
 * @author 이창원
 * @version 1.0
 * @created 05-8-2009 오후 2:20:28
 */
public class IndvdlPgeCntntsVO extends IndvdlPge {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 마이페이지 컨텐츠의 목록
	 */
	private List <IndvdlPgeCntntsVO> indvdlPgeList;

	public List<IndvdlPgeCntntsVO> getIndvdlPgeList() {
		return indvdlPgeList;
	}

	public void setIndvdlPgeList(List<IndvdlPgeCntntsVO> indvdlPgeList) {
		this.indvdlPgeList = indvdlPgeList;
	}

}