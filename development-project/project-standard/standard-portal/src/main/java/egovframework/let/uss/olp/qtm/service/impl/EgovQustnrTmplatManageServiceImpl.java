package egovframework.let.uss.olp.qtm.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.let.uss.olp.qtm.service.EgovQustnrTmplatManageService;
import egovframework.let.uss.olp.qtm.service.QustnrTmplatManageVO;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
/**
 * 설문템플릿 ServiceImpl Class 구현 
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
 *   2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성 
 *
 * </pre>
 */
@Service("egovQustnrTmplatManageService")
public class EgovQustnrTmplatManageServiceImpl extends AbstractServiceImpl implements EgovQustnrTmplatManageService{

	
	@Resource(name="qustnrTmplatManageDao")
	private QustnrTmplatManageDao dao;
	
	@Resource(name="egovQustnrTmplatManageIdGnrService")
	private EgovIdGnrService idgenService;
	
    /**
	 * 템플릿파일명을 조회한다. 
	 * @param qustnrTmplatManageVO - 조회할 정보가 담긴 VO
	 * @return List
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map selectQustnrTmplatManageTmplatImagepathnm(QustnrTmplatManageVO qustnrTmplatManageVO) throws Exception{
		return (Map)dao.selectQustnrTmplatManageTmplatImagepathnm(qustnrTmplatManageVO);
	}
	
    /**
	 * 설문템플릿 목록을 조회한다. 
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return List
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List selectQustnrTmplatManageList(ComDefaultVO searchVO) throws Exception{
		return (List)dao.selectQustnrTmplatManageList(searchVO);
	}
	
    /**
	 * 설문템플릿를(을) 상세조회 한다.
	 * @param QustnrTmplatManage - 회정정보가 담김 VO
	 * @return List
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List selectQustnrTmplatManageDetail(QustnrTmplatManageVO qustnrTmplatManageVO) throws Exception{
		return (List)dao.selectQustnrTmplatManageDetail(qustnrTmplatManageVO);
	}
	
    /**
	 * 설문템플릿를(을) 목록 전체 건수를(을) 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return int
	 * @throws Exception
	 */
	public int selectQustnrTmplatManageListCnt(ComDefaultVO searchVO) throws Exception{
		return (Integer)dao.selectQustnrTmplatManageListCnt(searchVO);
	}

    /**
	 * 설문템플릿를(을) 등록한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @throws Exception
	 */
	public void insertQustnrTmplatManage(QustnrTmplatManageVO qustnrTmplatManageVO) throws Exception {
		String sMakeId = idgenService.getNextStringId();
		
		qustnrTmplatManageVO.setQestnrTmplatId(sMakeId);

		dao.insertQustnrTmplatManage(qustnrTmplatManageVO);
	}
	
    /**
	 * 설문템플릿를(을) 수정한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @throws Exception
	 */
	public void updateQustnrTmplatManage(QustnrTmplatManageVO qustnrTmplatManageVO){
		dao.updateQustnrTmplatManage(qustnrTmplatManageVO);
	}
	
    /**
	 * 설문템플릿를(을) 삭제한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @throws Exception
	 */
	public void deleteQustnrTmplatManage(QustnrTmplatManageVO qustnrTmplatManageVO){
		dao.deleteQustnrTmplatManage(qustnrTmplatManageVO);
	}
}
