package egovframework.com.uss.olh.hpc.service.impl;

import java.util.List;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.uss.olh.hpc.service.HpcmManageDefaultVO;
import egovframework.com.uss.olh.hpc.service.HpcmManageVO;

import org.springframework.stereotype.Repository;

/**
 *
 * 도움말을 처리하는 DAO 클래스
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
@Repository("HpcmManageDAO")
public class HpcmManageDAO extends EgovComAbstractDAO {


    /**
	 * 도움말 글 목록에 대한 상세내용을 조회한다.
	 * @param vo
	 * @return 조회한 글
	 * @exception Exception
	 */
    public HpcmManageVO selectHpcmDetail(HpcmManageVO vo) throws Exception {

        return (HpcmManageVO) select("HpcmManageDAO.selectHpcmDetail", vo);

    }

    /**
	 * 도움말 글 목록을 조회한다.
	 * @param searchVO
	 * @return 글 목록
	 * @exception Exception
	 */
    public List<?> selectHpcmList(HpcmManageDefaultVO searchVO) throws Exception {

        return list("HpcmManageDAO.selectHpcmList", searchVO);

    }

    /**
	 * 도움말 글 총 갯수를 조회한다.
	 * @param searchVO
	 * @return 글 총 갯수
	 */
    public int selectHpcmListTotCnt(HpcmManageDefaultVO searchVO) {

        return (Integer)select("HpcmManageDAO.selectHpcmListTotCnt", searchVO);

    }

	/**
	 * 도움말 글을 등록한다.
	 * @param vo
	 * @exception Exception
	 */
    public void insertHpcmCn(HpcmManageVO vo) throws Exception {

        insert("HpcmManageDAO.insertHpcmCn", vo);

    }

	/**
	 * 도움말 글을 수정한다.
	 * @param vo
	 * @exception Exception
	 */
    public void updateHpcmCn(HpcmManageVO vo) throws Exception {

        update("HpcmManageDAO.updateHpcmCn", vo);

    }

	/**
	 * 도움말 글을 삭제한다.
	 * @param vo
	 * @exception Exception
	 */
    public void deleteHpcmCn(HpcmManageVO vo) throws Exception {

        delete("HpcmManageDAO.deleteHpcmCn", vo);

    }

}
