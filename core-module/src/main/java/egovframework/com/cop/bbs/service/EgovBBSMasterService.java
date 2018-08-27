package egovframework.com.cop.bbs.service;

import java.util.Map;

import egovframework.rte.fdl.cmmn.exception.FdlException;

public interface EgovBBSMasterService {

	Map<String, Object> selectNotUsedBdMstrList(BoardMasterVO boardMasterVO);

	void deleteBBSMasterInf(BoardMaster boardMaster);

	void updateBBSMasterInf(BoardMaster boardMaster);

	BoardMasterVO selectBBSMasterInf(BoardMasterVO boardMasterVO) throws Exception;

	Map<String, Object> selectBBSMasterInfs(BoardMasterVO boardMasterVO);

	void insertBBSMasterInf(BoardMaster boardMaster) throws FdlException;


}
