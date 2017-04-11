package egovframework.com.uss.olh.omm.service.impl;

import java.util.List;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.uss.olh.omm.service.EgovOnlineManualService;
import egovframework.com.uss.olh.omm.service.OnlineManual;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

/**
 * 온라인메뉴얼를 처리하는 ServiceImpl Class 구현
 * @author 공통서비스 장동한
 * @since 2009.07.03
 * @version 1.0
 * @see <pre>
 * &lt;&lt; 개정이력(Modification Information) &gt;&gt;
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.07.03  장동한          최초 생성
 *
 * </pre>
 */
@Service("egovOnlineManualService")
public class EgovOnlineManualServiceImpl extends EgovAbstractServiceImpl
        implements EgovOnlineManualService {

    @Resource(name = "onlineOnlineManualDao")
    private OnlineManualDao dao;

    @Resource(name = "egovOnlineMenualIdGnrService")
    private EgovIdGnrService idgenService;

    /**
     * 온라인메뉴얼를(을) 목록을 조회 한다.
     * @param OnlinePoll 회정정보가 담김 VO
     * @return List
     * @throws Exception
     */
    @Override
	public List<?> selectOnlineManualList(ComDefaultVO searchVO) throws Exception {
        return dao.selectOnlineManualList(searchVO);
    }

    /**
     * 온라인메뉴얼를(을) 목록 전체 건수를(을) 조회한다.
     * @param searchVO  조회할 정보가 담긴 VO
     * @return int
     * @throws Exception
     */
    @Override
	public int selectOnlineManualListCnt(ComDefaultVO searchVO) throws Exception {
        return dao.selectOnlineManualListCnt(searchVO);
    }

    /**
     * 온라인메뉴얼를(을) 상세조회 한다.
     * @param onlineManual  온라인메뉴얼 정보 담김 VO
     * @return List
     * @throws Exception
     */
    @Override
	public OnlineManual selectOnlineManualDetail( OnlineManual onlineManual) throws Exception {
        return dao.selectOnlineManualDetail(onlineManual);
    }

    /**
     * 온라인메뉴얼를(을) 등록한다.
     * @param onlineManual  온라인메뉴얼 정보 담김 VO
     * @throws Exception
     */
    @Override
	public void insertOnlineManual(OnlineManual onlineManual)throws Exception {
        String sMakeId = idgenService.getNextStringId();
        onlineManual.setOnlineMnlId(sMakeId);
        dao.insertOnlineManual(onlineManual);
    }

    /**
     * 온라인메뉴얼를(을) 수정한다.
     * @param onlineManual  온라인메뉴얼 정보 담김 VO
     * @throws Exception
     */
    @Override
	public void updateOnlineManual(OnlineManual onlineManual) throws Exception {
        dao.updateOnlineManual(onlineManual);
    }

    /**
     * 온라인메뉴얼를(을) 삭제한다.
     * @param onlineManual  온라인메뉴얼 정보 담김 VO
     * @throws Exception
     */
    @Override
	public void deleteOnlineManual(OnlineManual onlineManual) throws Exception {
        dao.deleteOnlineManual(onlineManual);
    }

}
