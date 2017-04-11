package egovframework.com.uss.ion.sit.service.impl;

import java.util.List;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.uss.ion.sit.service.SiteManageDefaultVO;
import egovframework.com.uss.ion.sit.service.SiteManageVO;

import org.springframework.stereotype.Repository;

/**
 *
 * 사이트정보를 처리하는 DAO 클래스
 * @author 공통서비스 개발팀 박정규
 * @since 2009.04.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.04.01  박정규          최초 생성
 *
 * </pre>
 */
@Repository("SiteManageDAO")
public class SiteManageDAO extends EgovComAbstractDAO {


    /**
     * 사이트 목록에 대한 상세내용을 조회한다.
     * @param vo
     * @return
     * @throws Exception
     */
    public SiteManageVO selectSiteDetail(SiteManageVO vo) throws Exception {

        return (SiteManageVO) select("SiteManageDAO.selectSiteDetail", vo);

    }

    /**
     * 사이트정보 목록을 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<?> selectSiteList(SiteManageDefaultVO searchVO) throws Exception {

        return list("SiteManageDAO.selectSiteList", searchVO);

    }

    /**
     * 사이트정보 총 갯수를 조회한다.
     * @param searchVO
     * @return
     */
    public int selectSiteListTotCnt(SiteManageDefaultVO searchVO) {

        return (Integer)select("SiteManageDAO.selectSiteListTotCnt", searchVO);

    }

	/**
	 * 사이트정보를 등록한다.
	 * @param vo
	 * @throws Exception
	 */
    public void insertSiteInfo(SiteManageVO vo) throws Exception {

        insert("SiteManageDAO.insertSiteInfo", vo);

    }

	/**
	 * 사이트정보를 수정한다.
	 * @param vo
	 * @throws Exception
	 */
    public void updateSiteInfo(SiteManageVO vo) throws Exception {

        update("SiteManageDAO.updateSiteInfo", vo);

    }

	/**
	 * 사이트정보를 삭제한다.
	 * @param vo
	 * @throws Exception
	 */
    public void deleteSiteInfo(SiteManageVO vo) throws Exception {

        delete("SiteManageDAO.deleteSiteInfo", vo);

    }

}
