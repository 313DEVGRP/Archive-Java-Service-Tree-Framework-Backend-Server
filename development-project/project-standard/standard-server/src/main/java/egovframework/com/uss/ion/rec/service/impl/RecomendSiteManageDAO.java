package egovframework.com.uss.ion.rec.service.impl;

import java.util.List;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.uss.ion.rec.service.RecomendSiteManageDefaultVO;
import egovframework.com.uss.ion.rec.service.RecomendSiteManageVO;

import org.springframework.stereotype.Repository;


/**
 *
 * 추천사이트정보를 처리하는 DAO 클래스
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
@Repository("RecomendSiteManageDAO")
public class RecomendSiteManageDAO extends EgovComAbstractDAO {


    /**
	 * 추천사이트 목록에 대한 상세내용을 조회한다.
	 * @param vo
	 * @return 조회한 글
	 * @exception Exception
	 */
    public RecomendSiteManageVO selectRecomendSiteDetail(RecomendSiteManageVO vo) throws Exception {

        return (RecomendSiteManageVO) select("RecomendSiteManageDAO.selectRecomendSiteDetail", vo);

    }

    /**
     * 추천사이트 목록을 조회한다.
     * @param searchVO
     * @return	글 목록
     * @throws Exception
     */
    public List<?> selectRecomendSiteList(RecomendSiteManageDefaultVO searchVO) throws Exception {

        return list("RecomendSiteManageDAO.selectRecomendSiteList", searchVO);

    }

    /**
     * 추천사이트 총 갯수를 조회한다.
     * @param searchVO
     * @return	총 갯수
     */
    public int selectRecomendSiteListTotCnt(RecomendSiteManageDefaultVO searchVO) {

        return (Integer)select("RecomendSiteManageDAO.selectRecomendSiteListTotCnt", searchVO);

    }

	/**
	 * 추천사이트를 등록한다.
	 * @param vo
	 * @throws Exception
	 */
    public void insertRecomendSiteInfo(RecomendSiteManageVO vo) throws Exception {

        insert("RecomendSiteManageDAO.insertRecomendSiteInfo", vo);

    }

	/**
	 * 추천사이트를 수정한다.
	 * @param vo
	 * @throws Exception
	 */
    public void updateRecomendSiteInfo(RecomendSiteManageVO vo) throws Exception {

        update("RecomendSiteManageDAO.updateRecomendSiteInfo", vo);

    }

	/**
	 * 추천사이트를 삭제한다.
	 * @param vo
	 * @throws Exception
	 */
    public void deleteRecomendSiteInfo(RecomendSiteManageVO vo) throws Exception {

        delete("RecomendSiteManageDAO.deleteRecomendSiteInfo", vo);

    }

}
