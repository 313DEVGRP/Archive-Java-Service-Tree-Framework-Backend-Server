package egovframework.com.cop.bbs.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.cop.bbs.service.BoardMaster;
import egovframework.com.cop.bbs.service.BoardMasterVO;

@Repository("EgovBBSMasterDAO")
public class EgovBBSMasterDAO extends EgovComAbstractDAO {

	public List<?> selectBBSMasterInfs(BoardMasterVO boardMasterVO) {
		return list("BBSMaster.selectBBSMasterList", boardMasterVO);
	}

	public int selectBBSMasterInfsCnt(BoardMasterVO boardMasterVO) {
		return (Integer)selectOne("BBSMaster.selectBBSMasterListTotCnt", boardMasterVO);
	}

	public BoardMasterVO selectBBSMasterDetail(BoardMasterVO boardMasterVO) {
		return (BoardMasterVO) selectOne("BBSMaster.selectBBSMasterDetail", boardMasterVO);
	}

	public void insertBBSMasterInf(BoardMaster boardMaster) {
		insert("BBSMaster.insertBBSMaster", boardMaster);
	}

	public void updateBBSMaster(BoardMaster boardMaster) {
		update("BBSMaster.updateBBSMaster", boardMaster);
	}

	public void deleteBBSMaster(BoardMaster boardMaster) {
		update("BBSMaster.deleteBBSMaster", boardMaster);
	}

}
