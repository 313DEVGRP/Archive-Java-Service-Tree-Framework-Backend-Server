package egovframework.com.uss.olh.awm.service.impl;

import java.util.List;

import egovframework.com.uss.olh.awm.service.AdministrationWordManage;
import egovframework.com.uss.olh.awm.service.EgovAdministrationWordManageService;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

/**
 * 행정전문용어사전관리를 처리하는 ServiceImpl Class 구현
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
@Service("egovAdministrationWordManageService")
public class EgovAdministrationWordManageServiceImpl extends EgovAbstractServiceImpl
        implements EgovAdministrationWordManageService {

    @Resource(name = "onlineAdministrationWordManageDao")
    private AdministrationWordManageDao dao;

    @Resource(name = "egovAdministrationWordIdGnrService")
    private EgovIdGnrService idgenService;

    /**
     * 행정전문용어사전관리를(을) 목록을 조회 한다.
     * @param searchVO 조회할 정보가 담김 VO
     * @return List
     * @throws Exception
     */
    @Override
	public List<?> selectAdministrationWordManageList(AdministrationWordManage searchVO) throws Exception {
        return dao.selectAdministrationWordManageList(searchVO);
    }

    /**
     * 행정전문용어사전관리를(을) 목록 전체 건수를(을) 조회한다.
     * @param searchVO  조회할 정보가 담긴 VO
     * @return int
     * @throws Exception
     */
    @Override
	public int selectAdministrationWordManageListCnt(AdministrationWordManage searchVO) throws Exception {
        return dao.selectAdministrationWordManageListCnt(searchVO);
    }

    /**
     * 행정전문용어사전관리를(을) 상세조회 한다.
     * @param administrationWordManage 조회할 정보가 담김 VO
     * @return List
     * @throws Exception
     */
    @Override
	public AdministrationWordManage selectAdministrationWordManageDetail( AdministrationWordManage administrationWordManage) throws Exception {
        return dao.selectAdministrationWordManageDetail(administrationWordManage);
    }

    /**
     * 행정전문용어사전관리를(을) 등록한다.
     * @param searchVO 조회할 정보가 담긴 VO
     * @throws Exception
     */
    @Override
	public void insertAdministrationWordManage(AdministrationWordManage administrationWordManage)throws Exception {
       String sMakeId = idgenService.getNextStringId();
       administrationWordManage.setAdministWordId(sMakeId);
       dao.insertAdministrationWordManage(administrationWordManage);
    }

    /**
     * 행정전문용어사전관리를(을) 수정한다.
     * @param searchVO 조회할 정보가 담긴 VO
     * @throws Exception
     */
    @Override
	public void updateAdministrationWordManage(AdministrationWordManage administrationWordManage) throws Exception {
        dao.updateAdministrationWordManage(administrationWordManage);
    }

    /**
     * 행정전문용어사전관리를(을) 삭제한다.
     * @param searchVO 조회할 정보가 담긴 VO
     * @throws Exception
     */
    @Override
	public void deleteAdministrationWordManage(AdministrationWordManage administrationWordManage) throws Exception {
        dao.deleteAdministrationWordManage(administrationWordManage);
    }

}
