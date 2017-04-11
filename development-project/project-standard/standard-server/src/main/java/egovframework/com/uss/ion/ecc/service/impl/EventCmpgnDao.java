package egovframework.com.uss.ion.ecc.service.impl;

import java.util.List;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.uss.ion.ecc.service.EventCmpgnVO;
import egovframework.com.uss.ion.ecc.service.TnextrlHrInfoVO;

import org.springframework.stereotype.Repository;
/**
 * 행사/이벤트/캠페인을 처리하는 Dao Class 구현
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
@Repository("eventCmpgnVODao")
public class EventCmpgnDao extends EgovComAbstractDAO {

	/**
	 * 행사/이벤트/캠페인를(을) 목록을 조회한다.
	 * @param searchVO
	 * @return List
	 * @throws Exception
	 */
	public List<?> selectEventCmpgnList(ComDefaultVO searchVO){
		return list("EventCmpgn.selectEventCmpgn", searchVO);
	}

	/**
	 * 행사/이벤트/캠페인를(을) 상세조회한다.
	 * @param eventCmpgnVO
	 * @return List
	 * @throws Exception
	 */
	public List<?> selectEventCmpgnDetail(EventCmpgnVO eventCmpgnVO){
		return list("EventCmpgn.selectEventCmpgnDetail", eventCmpgnVO);
	}

	/**
	 * 행사/이벤트/캠페인를(을) 전체 갯수를 조회한다.
	 * @param searchVO
	 * @return int
	 * @throws Exception
	 */
	public int selectEventCmpgnListCnt(ComDefaultVO searchVO){
		return (Integer)select("EventCmpgn.selectEventCmpgnCnt", searchVO);
	}

	/**
	 * 행사/이벤트/캠페인를(을) 입력한다.
	 * @param eventCmpgnVO
	 * @throws Exception
	 */
	public void insertEventCmpgn(EventCmpgnVO eventCmpgnVO){
		insert("EventCmpgn.insertEventCmpgn", eventCmpgnVO);
	}

	/**
	 * 행사/이벤트/캠페인를(을) 수정한다.
	 * @param eventCmpgnVO
	 * @throws Exception
	 */
	public void updateEventCmpgn(EventCmpgnVO eventCmpgnVO){
		update("EventCmpgn.updateEventCmpgn", eventCmpgnVO);
	}

	/**
	 * 행사/이벤트/캠페인를(을) 삭제한다.
	 * @param eventCmpgnVO
	 * @throws Exception
	 */
	public void deleteEventCmpgn(EventCmpgnVO eventCmpgnVO){

		delete("EventCmpgn.deleteEventCmpgnTnextrlHrInfo", eventCmpgnVO);

		delete("EventCmpgn.deleteEventCmpgn", eventCmpgnVO);
	}

	/**
	 *외부인사정보를(을) 목록을 조회한다.
	 * @param searchVO
	 * @return List
	 * @throws Exception
	 */
	public List<?> selectTnextrlHrInfoList(ComDefaultVO searchVO){
		return list("EventCmpgn.selectTnextrlHrInfo", searchVO);
	}

	/**
	 *외부인사정보를(을) 상세조회 조회한다.
	 * @param searchVO
	 * @return List
	 * @throws Exception
	 */
	public List<?> selectTnextrlHrInfoDetail(TnextrlHrInfoVO TnextrlHrInfo){
		return list("EventCmpgn.selectTnextrlHrInfoDetail", TnextrlHrInfo);
	}

	/**
	 * 외부인사정보를(을) 전체 갯수를 조회한다.
	 * @param searchVO
	 * @return int
	 * @throws Exception
	 */
	public int selectTnextrlHrInfoListCnt(ComDefaultVO searchVO){
		return (Integer)select("EventCmpgn.selectTnextrlHrInfoCnt", searchVO);
	}

	/**
	 * 외부인사정보를(을) 등록한다.
	 * @param eventCmpgnVO
	 * @throws Exception
	 */
	public void insertTnextrlHrInfo(TnextrlHrInfoVO TnextrlHrInfo){
		insert("EventCmpgn.insertTnextrlHrInfo", TnextrlHrInfo);
	}

	/**
	 * 외부인사정보를(을) 수정한다.
	 * @param eventCmpgnVO
	 * @throws Exception
	 */
	public void updateTnextrlHrInfo(TnextrlHrInfoVO TnextrlHrInfo){
		update("EventCmpgn.updateTnextrlHrInfo", TnextrlHrInfo);
	}

	/**
	 * 외부인사정보를(을) 삭제한다.
	 * @param eventCmpgnVO
	 * @throws Exception
	 */
	public void deleteTnextrlHrInfo(TnextrlHrInfoVO TnextrlHrInfo){
		delete("EventCmpgn.deleteTnextrlHrInfo", TnextrlHrInfo);
	}
}
