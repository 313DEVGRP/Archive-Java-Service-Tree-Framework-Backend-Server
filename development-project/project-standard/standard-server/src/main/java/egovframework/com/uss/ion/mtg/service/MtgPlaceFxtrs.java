package egovframework.com.uss.ion.mtg.service;

import egovframework.com.cmm.ComDefaultVO;

/**
 * 개요
 * - 회의실비품에 대한 model 클래스를 정의한다.
 * 
 * 상세내용
 * - 회의실비품의 회의실코드,비품코드,수량 항목을 관리한다.
 * @author 이용
 * @version 1.0
 * @created 06-15-2010 오후 2:08:56
 */

public class MtgPlaceFxtrs extends ComDefaultVO {

	/**
	* serialVersionUID
	*/
	private static final long serialVersionUID = 1L;
	
	/**
	*  회의실코드	
	*/ 
	private String mtgPlaceId;

	/**
	*  비품코드	   
	*/ 
	private String fxtrsCd;

	/**
	*  수량	      
	*/ 
	private int quantity;

	/**
	 * @return the mtgPlaceCd
	 */
	public String getMtgPlaceId() {
		return mtgPlaceId;
	}

	/**
	 * @param mtgPlaceCd the mtgPlaceCd to set
	 */
	public void setMtgPlaceId(String mtgPlaceId) {
		this.mtgPlaceId = mtgPlaceId;
	}

	/**
	 * @return the fxtrsCd
	 */
	public String getFxtrsCd() {
		return fxtrsCd;
	}

	/**
	 * @param fxtrsCd the fxtrsCd to set
	 */
	public void setFxtrsCd(String fxtrsCd) {
		this.fxtrsCd = fxtrsCd;
	}

	/**
	 * @return the quantity
	 */
	public int getQuantity() {
		return quantity;
	}

	/**
	 * @param quantity the quantity to set
	 */
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
}