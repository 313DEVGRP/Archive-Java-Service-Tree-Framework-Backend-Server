package egovframework.com.uss.olh.omm.service.impl;

import java.util.List;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.uss.olh.omm.service.OnlineManual;

import org.springframework.stereotype.Repository;

/**
 * 온라인메뉴얼를 처리하는 Dao Class 구현
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
@Repository("onlineOnlineManualDao")
public class OnlineManualDao extends EgovComAbstractDAO {

    /**
     * 온라인메뉴얼를(을) 목록을 한다.
     * @param onlineManual  온라인메뉴얼 정보 담김 VO
     * @return List
     * @throws Exception
     */
    public List<?> selectOnlineManualList(ComDefaultVO searchVO) throws Exception {
        return list("OnlineManual.selectOnlineManual", searchVO);
    }

    /**
     * 온라인메뉴얼를(을) 목록 전체 건수를(을) 조회한다.
     * @param searchVO  조회할 정보가 담긴 VO
     * @return int
     * @throws Exception
     */
    public int selectOnlineManualListCnt(ComDefaultVO searchVO) throws Exception {
        return (Integer)select("OnlineManual.selectOnlineManualCnt", searchVO);
    }

    /**
     * 온라인메뉴얼를(을) 상세조회 한다.
     * @param onlineManual  온라인메뉴얼 정보가 담김 VO
     * @return List
     * @throws Exception
     */
    public OnlineManual selectOnlineManualDetail(OnlineManual onlineManual) throws Exception {
        return (OnlineManual)select("OnlineManual.selectOnlineManualDetail", onlineManual);
    }

    /**
     * 온라인메뉴얼를(을) 등록한다.
     * @param qonlineManual  온라인메뉴얼 정보가 담김 VO
     * @throws Exception
     */
    public void insertOnlineManual(OnlineManual onlineManual) throws Exception {
        insert("OnlineManual.insertOnlineManual", onlineManual);
    }

    /**
     * 온라인메뉴얼를(을) 수정한다.
     * @param onlineManual  온라인메뉴얼 정보가 담김 VO
     * @throws Exception
     */
    public void updateOnlineManual(OnlineManual onlineManual) throws Exception {
        update("OnlineManual.updateOnlineManual", onlineManual);
    }

    /**
     * 온라인메뉴얼를(을) 삭제한다.
     * @param onlineManual  온라인메뉴얼 정보가 담김 VO
     * @throws Exception
     */
    public void deleteOnlineManual(OnlineManual onlineManual) throws Exception {
        delete("OnlineManual.deleteOnlineManual", onlineManual);
    }

}
