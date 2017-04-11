package egovframework.com.uss.olh.hpc.service.impl;

import java.util.List;

import egovframework.com.uss.olh.hpc.service.EgovHpcmManageService;
import egovframework.com.uss.olh.hpc.service.HpcmManageDefaultVO;
import egovframework.com.uss.olh.hpc.service.HpcmManageVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;



/**
 *
 * 도움말을 처리하는 비즈니스 구현 클래스
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
@Service("HpcmManageService")
public class EgovHpcmManageServiceImpl extends EgovAbstractServiceImpl implements
        EgovHpcmManageService {

    @Resource(name="HpcmManageDAO")
    private HpcmManageDAO hpcmManageDAO;

    /** ID Generation */
	@Resource(name="egovHpcmManageIdGnrService")
	private EgovIdGnrService idgenService;


    /**
	 * 도움말 글을 상세 조회한다.
	 * @param vo - 조회할 정보가 담긴 HpcmManageVO
	 * @return 조회한 글
	 * @exception Exception
	 */
    @Override
	public HpcmManageVO selectHpcmDetail(HpcmManageVO vo) throws Exception {
        HpcmManageVO resultVO = hpcmManageDAO.selectHpcmDetail(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * 도움말 글 목록을 조회한다.
	 * @param searchVO
	 * @return 글 목록
	 * @exception Exception
	 */
    @Override
	public List<?> selectHpcmList(HpcmManageDefaultVO searchVO) throws Exception {
        return hpcmManageDAO.selectHpcmList(searchVO);
    }

    /**
	 * 도움말 글 총 갯수를 조회한다.
	 * @param searchVO
	 * @return 글 총 갯수
	 */
    @Override
	public int selectHpcmListTotCnt(HpcmManageDefaultVO searchVO) {
		return hpcmManageDAO.selectHpcmListTotCnt(searchVO);
	}

	/**
	 * 도움말 글을 등록한다.
	 * @param vo
	 * @exception Exception
	 */
    @Override
	public void insertHpcmCn(HpcmManageVO vo) throws Exception {
    	egovLogger.debug(vo.toString());

		String	hpcmId = idgenService.getNextStringId();

		vo.setHpcmId(hpcmId);

    	hpcmManageDAO.insertHpcmCn(vo);
    }

	/**
	 * 도움말 글을 수정한다.
	 * @param vo
	 * @exception Exception
	 */
    @Override
	public void updateHpcmCn(HpcmManageVO vo) throws Exception {
    	egovLogger.debug(vo.toString());

    	hpcmManageDAO.updateHpcmCn(vo);
    }

	/**
	 * 도움말 글을 삭제한다.
	 * @param vo
	 * @exception Exception
	 */
    @Override
	public void deleteHpcmCn(HpcmManageVO vo) throws Exception {
    	egovLogger.debug(vo.toString());

    	hpcmManageDAO.deleteHpcmCn(vo);
    }

}
