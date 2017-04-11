package egovframework.com.uss.ion.ecc.service;

import java.util.List;

import egovframework.com.cmm.ComDefaultVO;
/**
 * 행사/이벤트/캠페인을 처리하는 Service Class 구현
 * @author 공통서비스 장동한
 * @since 2009.03.20
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.03.20  장동한          최초 생성
 *
 * </pre>
 */
public interface EgovEventCmpgnService {

	/**
	 * 행사/이벤트/캠페인를(을) 목록을 조회한다.
	 * @param searchVO
	 * @return List
	 * @throws Exception
	 */
	public List<?> selectEventCmpgnList(ComDefaultVO searchVO) throws Exception;

	/**
	 * 행사/이벤트/캠페인를(을) 상세조회한다.
	 * @param eventCmpgnVO
	 * @return List
	 * @throws Exception
	 */
	public List<?> selectEventCmpgnDetail(EventCmpgnVO eventCmpgnVO) throws Exception;

	/**
	 * 행사/이벤트/캠페인를(을) 전체 갯수를 조회한다.
	 * @param searchVO
	 * @return int
	 * @throws Exception
	 */
	public int selectEventCmpgnListCnt(ComDefaultVO searchVO) throws Exception;

	/**
	 * 행사/이벤트/캠페인를(을) 입력한다.
	 * @param eventCmpgnVO
	 * @throws Exception
	 */
	void  insertEventCmpgn(EventCmpgnVO eventCmpgnVO) throws Exception;

	/**
	 * 행사/이벤트/캠페인를(을) 수정한다.
	 * @param eventCmpgnVO
	 * @throws Exception
	 */
	void  updateEventCmpgn(EventCmpgnVO eventCmpgnVO) throws Exception;
	/**
	 * 행사/이벤트/캠페인를(을) 삭제한다.
	 * @param eventCmpgnVO
	 * @throws Exception
	 */
	void  deleteEventCmpgn(EventCmpgnVO eventCmpgnVO) throws Exception;

	/**
	 *외부인사정보를(을) 목록을 조회한다.
	 * @param searchVO
	 * @return List
	 * @throws Exception
	 */
	public List<?> selectTnextrlHrInfoList(ComDefaultVO searchVO) throws Exception;

	/**
	 * 외부인사정보를(을) 상세조회 조회한다.
	 * @param searchVO
	 * @return List
	 * @throws Exception
	 */
	public List<?> selectTnextrlHrInfoDetail(TnextrlHrInfoVO TnextrlHrInfo) throws Exception;

	/**
	 * 외부인사정보를(을) 전체 갯수를 조회한다.
	 * @param searchVO
	 * @return int
	 * @throws Exception
	 */
	public int selectTnextrlHrInfoListCnt(ComDefaultVO searchVO) throws Exception;

	/**
	 * 외부인사정보를(을) 등록한다.
	 * @param eventCmpgnVO
	 * @throws Exception
	 */
	void  insertTnextrlHrInfo(TnextrlHrInfoVO TnextrlHrInfo) throws Exception;

	/**
	 * 외부인사정보를(을) 수정한다.
	 * @param eventCmpgnVO
	 * @throws Exception
	 */
	void  updateTnextrlHrInfo(TnextrlHrInfoVO TnextrlHrInfo) throws Exception;

	/**
	 * 외부인사정보를(을) 삭제한다.
	 * @param eventCmpgnVO
	 * @throws Exception
	 */
	void  deleteTnextrlHrInfo(TnextrlHrInfoVO TnextrlHrInfo) throws Exception;

}
