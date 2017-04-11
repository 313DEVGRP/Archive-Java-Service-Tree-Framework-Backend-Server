package egovframework.com.uss.olh.omm.service;

import java.util.List;

import egovframework.com.cmm.ComDefaultVO;

/**
 * 온라인메뉴얼를 처리하는 Service Class 구현
 * @author 공통서비스 장동한
 * @since 2009.07.03
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.07.03  장동한          최초 생성
 *
 * </pre>
 */
public interface EgovOnlineManualService {

	/**
	* 온라인메뉴얼 목록을 조회한다.
	* @param searchVO  조회할 정보가 담긴 VO
	* @return List
	* @throws Exception
	*/
	public List<?> selectOnlineManualList(ComDefaultVO searchVO) throws Exception;

	/**
	* 온라인메뉴얼를(을) 상세조회 한다.
	* @param onlineManual  온라인메뉴얼 정보 담김 VO
	* @return List
	* @throws Exception
	*/
	public OnlineManual selectOnlineManualDetail(OnlineManual onlineManual) throws Exception;

	/**
	* 온라인메뉴얼를(을) 목록 전체 건수를(을) 조회한다.
	* @param searchVO  조회할 정보가 담긴 VO
	* @return int
	* @throws Exception
	*/
	public int selectOnlineManualListCnt(ComDefaultVO searchVO) throws Exception;

	/**
	* 온라인메뉴얼를(을) 등록한다.
	* @param onlineManual  온라인메뉴얼 정보 담김 VO
	* @throws Exception
	*/
	void insertOnlineManual(OnlineManual onlineManual) throws Exception;

	/**
	* 온라인메뉴얼를(을) 수정한다.
	* @param onlineManual  온라인메뉴얼 정보 담김 VO
	* @throws Exception
	*/
	void updateOnlineManual(OnlineManual onlineManual) throws Exception;

	/**
	 * 온라인메뉴얼를(을) 삭제한다.
	 * @param onlineManual  온라인메뉴얼 정보 담김 VO
	 * @throws Exception
	 */
	void deleteOnlineManual(OnlineManual onlineManual) throws Exception;

}
