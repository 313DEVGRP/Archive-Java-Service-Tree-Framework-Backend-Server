package egovframework.com.uss.ion.ecc.service.impl;

import java.util.List;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.uss.ion.ecc.service.EgovEventCmpgnService;
import egovframework.com.uss.ion.ecc.service.EventCmpgnVO;
import egovframework.com.uss.ion.ecc.service.TnextrlHrInfoVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
/**
 * 행사/이벤트/캠페인을 처리하는 ServiceImpl Class 구현
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
@Service("egovEventCmpgnService")
public class EgovEventCmpgnServiceImpl extends EgovAbstractServiceImpl implements EgovEventCmpgnService{

	private static final Logger LOGGER = LoggerFactory.getLogger(EgovEventCmpgnServiceImpl.class);

	@Resource(name="eventCmpgnVODao")
	private EventCmpgnDao dao;

	@Resource(name="egovEventInfoIdGnrService")
	private EgovIdGnrService idgenService1;

	@Resource(name="egovExtrlhrInfoIdGnrService")
	private EgovIdGnrService idgenService2;

	/**
	 * 행사/이벤트/캠페인를(을) 목록을 조회한다.
	 * @param searchVO
	 * @return List
	 * @throws Exception
	 */
	@Override
	public List<?> selectEventCmpgnList(ComDefaultVO searchVO) throws Exception{
		return dao.selectEventCmpgnList(searchVO);
	}

	/**
	 * 행사/이벤트/캠페인를(을) 상세조회한다.
	 * @param eventCmpgnVO
	 * @return List
	 * @throws Exception
	 */
	@Override
	public List<?> selectEventCmpgnDetail(EventCmpgnVO eventCmpgnVO) throws Exception{
		return dao.selectEventCmpgnDetail(eventCmpgnVO);
	}

	/**
	 * 행사/이벤트/캠페인를(을) 전체 갯수를 조회한다.
	 * @param searchVO
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int selectEventCmpgnListCnt(ComDefaultVO searchVO) throws Exception{

		return dao.selectEventCmpgnListCnt(searchVO);
	}

	/**
	 * 행사/이벤트/캠페인를(을) 전체 갯수를 조회한다.
	 * @param searchVO
	 * @return int
	 * @throws Exception
	 */
	public int selectEgovEventCmpgnListCount(ComDefaultVO searchVO) {

		return 1;
	}

	/**
	 * 행사/이벤트/캠페인를(을) 입력한다.
	 * @param eventCmpgnVO
	 * @throws Exception
	 */
	@Override
	public void insertEventCmpgn(EventCmpgnVO eventCmpgnVO) throws Exception{
		String sMakeId = idgenService1.getNextStringId();
		eventCmpgnVO.setEventId(sMakeId);
		dao.insertEventCmpgn(eventCmpgnVO);
	}

	/**
	 * 행사/이벤트/캠페인를(을) 수정한다.
	 * @param eventCmpgnVO
	 * @throws Exception
	 */
	@Override
	public void updateEventCmpgn(EventCmpgnVO eventCmpgnVO){
		dao.updateEventCmpgn(eventCmpgnVO);
	}

	/**
	 * 행사/이벤트/캠페인를(을) 삭제한다.
	 * @param eventCmpgnVO
	 * @throws Exception
	 */
	@Override
	public void deleteEventCmpgn(EventCmpgnVO eventCmpgnVO){
		dao.deleteEventCmpgn(eventCmpgnVO);
	}

	/**
	 *외부인사정보를(을) 목록을 조회한다.
	 * @param searchVO
	 * @return List
	 * @throws Exception
	 */
	@Override
	public List<?> selectTnextrlHrInfoList(ComDefaultVO searchVO) throws Exception{

		LOGGER.info("selectTnextrlHrInfoList");
		return dao.selectTnextrlHrInfoList(searchVO);
	}

	/**
	 * 외부인사정보를(을) 상세조회 조회한다.
	 * @param searchVO
	 * @return List
	 * @throws Exception
	 */
	@Override
	public List<?> selectTnextrlHrInfoDetail(TnextrlHrInfoVO TnextrlHrInfo) throws Exception{

		LOGGER.info("selectTnextrlHrInfoDetail");
		return dao.selectTnextrlHrInfoDetail(TnextrlHrInfo);
	}

	/**
	 * 외부인사정보를(을) 전체 갯수를 조회한다.
	 * @param searchVO
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int selectTnextrlHrInfoListCnt(ComDefaultVO searchVO) throws Exception{

		LOGGER.info("selectTnextrlHrInfoList");
		return dao.selectTnextrlHrInfoListCnt(searchVO);
	}

	/**
	 * 외부인사정보를(을) 등록한다.
	 * @param eventCmpgnVO
	 * @throws Exception
	 */
	@Override
	public void insertTnextrlHrInfo(TnextrlHrInfoVO TnextrlHrInfo) throws Exception{
		String sMakeId = idgenService2.getNextStringId();
		TnextrlHrInfo.setExtrlHrId(sMakeId);
		dao.insertTnextrlHrInfo(TnextrlHrInfo);
	}

	/**
	 * 외부인사정보를(을) 수정한다.
	 * @param eventCmpgnVO
	 * @throws Exception
	 */
	@Override
	public void updateTnextrlHrInfo(TnextrlHrInfoVO TnextrlHrInfo){
		dao.updateTnextrlHrInfo(TnextrlHrInfo);
	}

	/**
	 * 외부인사정보를(을) 삭제한다.
	 * @param eventCmpgnVO
	 * @throws Exception
	 */
	@Override
	public void deleteTnextrlHrInfo(TnextrlHrInfoVO TnextrlHrInfo){
		dao.deleteTnextrlHrInfo(TnextrlHrInfo);
	}
}
