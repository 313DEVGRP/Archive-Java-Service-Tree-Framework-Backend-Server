package egovframework.com.uss.ion.nws.service.impl;

import java.util.List;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.uss.ion.nws.service.NewsManageDefaultVO;
import egovframework.com.uss.ion.nws.service.NewsManageVO;

import org.springframework.stereotype.Repository;


/**
 *
 * 뉴스정보를 처리하는 DAO 클래스
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
@Repository("NewsManageDAO")
public class NewsManageDAO extends EgovComAbstractDAO {

    /**
     * 뉴스정보를 상세 조회한다.
     * @param vo
     * @return
     * @throws Exception
     */
    public NewsManageVO selectNewsDetail(NewsManageVO vo) throws Exception {

        return (NewsManageVO) select("NewsManageDAO.selectNewsDetail", vo);

    }

    /**
     * 뉴스목록을 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<?> selectNewsList(NewsManageDefaultVO searchVO) throws Exception {

        return list("NewsManageDAO.selectNewsList", searchVO);

    }

    /**
     * 뉴스정보 총 갯수를 조회한다.
     * @param searchVO
     * @return
     */
    public int selectNewsListTotCnt(NewsManageDefaultVO searchVO) {

        return (Integer)select("NewsManageDAO.selectNewsListTotCnt", searchVO);

    }

	/**
	 * 뉴스정보를 등록한다.
	 * @param vo
	 * @throws Exception
	 */
    public void insertNewsInfo(NewsManageVO vo) throws Exception {

        insert("NewsManageDAO.insertNewsInfo", vo);

    }

	/**
	 * 뉴스정보를 수정한다.
	 * @param vo
	 * @throws Exception
	 */
    public void updateNewsInfo(NewsManageVO vo) throws Exception {

        update("NewsManageDAO.updateNewsInfo", vo);

    }

	/**
	 * 뉴스정보를 삭제한다.
	 * @param vo
	 * @throws Exception
	 */
    public void deleteNewsInfo(NewsManageVO vo) throws Exception {

        delete("NewsManageDAO.deleteNewsInfo", vo);

    }

}
