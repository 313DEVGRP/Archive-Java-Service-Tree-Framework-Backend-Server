package egovframework.com.uss.ion.nws.service.impl;

import java.util.List;

import egovframework.com.uss.ion.nws.service.EgovNewsManageService;
import egovframework.com.uss.ion.nws.service.NewsManageDefaultVO;
import egovframework.com.uss.ion.nws.service.NewsManageVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;




/**
 *
 * 뉴스정보를 처리하는 비즈니스 구현 클래스
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
@Service("NewsManageService")
public class EgovNewsManageServiceImpl extends EgovAbstractServiceImpl implements
        EgovNewsManageService {

    @Resource(name="NewsManageDAO")
    private NewsManageDAO newsManageDAO;

    /** ID Generation */
	@Resource(name="egovNewsManageIdGnrService")
	private EgovIdGnrService idgenService;


    /**
	 * 뉴스정보 상세조회한다.
	 * @param vo - 조회할 정보가 담긴 NewsManageVO
	 * @return 조회한 글
	 * @exception Exception
	 */
    @Override
	public NewsManageVO selectNewsDetail(NewsManageVO vo) throws Exception {
        NewsManageVO resultVO = newsManageDAO.selectNewsDetail(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * 뉴스정보 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
    @Override
	public List<?> selectNewsList(NewsManageDefaultVO searchVO) throws Exception {
        return newsManageDAO.selectNewsList(searchVO);
    }

    /**
	 * 뉴스정보 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 * @exception
	 */
    @Override
	public int selectNewsListTotCnt(NewsManageDefaultVO searchVO) {
		return newsManageDAO.selectNewsListTotCnt(searchVO);
	}

	/**
	 * 뉴스정보를 등록한다.
	 * @param vo - 등록할 정보가 담긴 SiteManageVO
	 * @exception Exception
	 */
    @Override
	public void insertNewsInfo(NewsManageVO vo) throws Exception {
    	egovLogger.debug(vo.toString());

		String	newsId = idgenService.getNextStringId();

		vo.setNewsId(newsId);

    	newsManageDAO.insertNewsInfo(vo);
    }

	/**
	 * 뉴스정보를 수정한다.
	 * @param vo - 수정할 정보가 담긴 NewsManageVO
	 * @exception Exception
	 */
    @Override
	public void updateNewsInfo(NewsManageVO vo) throws Exception {
    	egovLogger.debug(vo.toString());

    	newsManageDAO.updateNewsInfo(vo);
    }

	/**
	 * 뉴스정보를 삭제한다.
	 * @param vo - 수정할 정보가 담긴 NewsManageVO
	 * @exception Exception
	 */
    @Override
	public void deleteNewsInfo(NewsManageVO vo) throws Exception {
    	egovLogger.debug(vo.toString());

    	newsManageDAO.deleteNewsInfo(vo);
    }

}
