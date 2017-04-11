package egovframework.com.uss.ion.mtg.service;

import java.io.Serializable;
import java.util.List;

/**
 * 개요
 * - 회의실비품에 대한 Vo 클래스를 정의한다.
 *
 * 상세내용
 * - 회의실비품의 목록 항목을 관리한다.
 * @author 이용
 * @version 1.0
 * @created 06-15-2010 오후 2:08:56
 */

public class MtgPlaceFxtrsVO extends MtgPlaceFxtrs implements Serializable {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 배너 목록
	 */
	List<MtgPlaceFxtrsVO> mtgPlaceFxtrsList;

	/**
	 * @return the mtgPlaceFxtrsList
	 */
	public List<MtgPlaceFxtrsVO> getMtgPlaceFxtrsList() {
		return mtgPlaceFxtrsList;
	}
	/**
	 * @param MtgPlaceFxtrs the mtgPlaceFxtrs to set
	 */
	public void setMtgPlaceFxtrsList(List<MtgPlaceFxtrsVO> mtgPlaceFxtrsList) {
		this.mtgPlaceFxtrsList = mtgPlaceFxtrsList;
	}

	/**
	*  비품코드
	*/
	private String fxtrsCd;

	/**
	*  비품명
	*/
	private String fxtrsNm;

	/**
	*  제조사명
	*/
	private String makrNm;

	/**
	*  가격
	*/
	private int price;

	/**
	 * @return the fxtrsCd
	 */
	@Override
	public String getFxtrsCd() {
		return fxtrsCd;
	}

	/**
	 * @param fxtrsCd the fxtrsCd to set
	 */
	@Override
	public void setFxtrsCd(String fxtrsCd) {
		this.fxtrsCd = fxtrsCd;
	}

	/**
	 * @return the fxtrsNm
	 */
	public String getFxtrsNm() {
		return fxtrsNm;
	}

	/**
	 * @param fxtrsNm the fxtrsNm to set
	 */
	public void setFxtrsNm(String fxtrsNm) {
		this.fxtrsNm = fxtrsNm;
	}

	/**
	 * @return the makrNm
	 */
	public String getMakrNm() {
		return makrNm;
	}

	/**
	 * @param makrNm the makrNm to set
	 */
	public void setMakrNm(String makrNm) {
		this.makrNm = makrNm;
	}

	/**
	 * @return the price
	 */
	public int getPrice() {
		return price;
	}

	/**
	 * @param price the price to set
	 */
	public void setPrice(int price) {
		this.price = price;
	}

}
