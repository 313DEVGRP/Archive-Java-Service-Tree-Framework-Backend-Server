package egovframework.api.arms.module_reqadd.service;

import egovframework.api.arms.module_reqadd.dao.ReqAddSqlMapperDao;
import egovframework.com.ext.jstree.springiBatis.core.dao.CoreDao;
import egovframework.com.ext.jstree.springiBatis.core.service.CoreServiceImpl;
import egovframework.com.ext.jstree.springiBatis.core.vo.ComprehensiveTree;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service("reqAddSqlMapper")
public class ReqAddSqlMapperImpl extends CoreServiceImpl implements ReqAddSqlMapper {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Resource(name = "reqAddSqlMapperDao")
    ReqAddSqlMapperDao reqAddSqlMapperDao;

    @Override
    @Transactional(readOnly = false, rollbackFor = { Exception.class }, propagation = Propagation.REQUIRED)
    public <T extends ComprehensiveTree> void ddlExecuteToReqAdd(T comprehensiveTree) throws Exception {
        reqAddSqlMapperDao.ddlSqlExecute(comprehensiveTree);
    }

    @Override
    public <T extends ComprehensiveTree> void ddlSequenceExecuteToReqAdd(T comprehensiveTree) throws Exception {
        reqAddSqlMapperDao.ddlSequenceExecute(comprehensiveTree);
    }

    @Override
    @Transactional(readOnly = false, rollbackFor = { Exception.class }, propagation = Propagation.REQUIRED)
    public <T extends ComprehensiveTree> void dmlExecuteToReqAdd(T comprehensiveTree) throws Exception {
        reqAddSqlMapperDao.dmlSqlExecute(comprehensiveTree);
    }

    @Override
    public <T extends ComprehensiveTree> void ddlLogExecuteToReqAdd(T comprehensiveTree) throws Exception {
        reqAddSqlMapperDao.ddlLogExecute(comprehensiveTree);
    }

    @Override
    public <T extends ComprehensiveTree> int isExistTable(T comprehensiveTree) throws Exception {
        return reqAddSqlMapperDao.isExistTable(comprehensiveTree);
    }

}
