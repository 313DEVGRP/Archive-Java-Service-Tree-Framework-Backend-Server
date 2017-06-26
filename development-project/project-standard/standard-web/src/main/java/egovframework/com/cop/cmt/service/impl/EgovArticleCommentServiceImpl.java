package egovframework.com.cop.cmt.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cop.cmt.service.Comment;
import egovframework.com.cop.cmt.service.CommentVO;
import egovframework.com.cop.cmt.service.EgovArticleCommentService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.cmmn.exception.FdlException;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service("EgovArticleCommentService")
public class EgovArticleCommentServiceImpl extends EgovAbstractServiceImpl implements EgovArticleCommentService {

    @Resource(name = "EgovArticleCommentDAO")
    private EgovArticleCommentDAO egovArticleCommentDao;
    
    @Resource(name = "egovAnswerNoGnrService")
    private EgovIdGnrService egovAnswerNoGnrService;

	
	@Override
	public Map<String, Object> selectArticleCommentList(CommentVO commentVO) {
		List<?> result = egovArticleCommentDao.selectArticleCommentList(commentVO);
		int cnt = egovArticleCommentDao.selectArticleCommentListCnt(commentVO);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}


	@Override
	public void insertArticleComment(Comment comment) throws FdlException {
		comment.setCommentNo(egovAnswerNoGnrService.getNextLongId() + "");//2011.10.18
		egovArticleCommentDao.insertArticleComment(comment);
	}


	@Override
	public void deleteArticleComment(CommentVO commentVO) {
		egovArticleCommentDao.deleteArticleComment(commentVO);
	}


	@Override
	public CommentVO selectArticleCommentDetail(CommentVO commentVO) {
		return egovArticleCommentDao.selectArticleCommentDetail(commentVO);
	}


	@Override
	public void updateArticleComment(Comment comment) {
		egovArticleCommentDao.updateArticleComment(comment);
	}

}
