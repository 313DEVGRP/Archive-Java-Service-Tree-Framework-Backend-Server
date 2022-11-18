package egovframework.api.arms.module_reqadd.dao;

import egovframework.com.ext.jstree.springiBatis.core.dao.CoreDaoImpl;
import egovframework.com.ext.jstree.springiBatis.core.vo.ComprehensiveTree;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("reqAddSqlMapperDao")
@Qualifier("reqAddSqlMapperDao")
public class ReqAddSqlMapperDaoImpl extends CoreDaoImpl implements ReqAddSqlMapperDao {

    @Override
    public <T extends ComprehensiveTree> void ddlSqlExecute(T comprehensiveTree) throws Exception {
        update(comprehensiveTree.getSqlMapSelector() + "." + "ddlSqlExecute", comprehensiveTree);
        update(comprehensiveTree.getSqlMapSelector() + "." + "ddlSqlExecute_comment_1", comprehensiveTree);
        update(comprehensiveTree.getSqlMapSelector() + "." + "ddlSqlExecute_comment_2", comprehensiveTree);
        update(comprehensiveTree.getSqlMapSelector() + "." + "ddlSqlExecute_comment_3", comprehensiveTree);
        update(comprehensiveTree.getSqlMapSelector() + "." + "ddlSqlExecute_comment_4", comprehensiveTree);
        update(comprehensiveTree.getSqlMapSelector() + "." + "ddlSqlExecute_comment_5", comprehensiveTree);
        update(comprehensiveTree.getSqlMapSelector() + "." + "ddlSqlExecute_comment_6", comprehensiveTree);
        update(comprehensiveTree.getSqlMapSelector() + "." + "ddlSqlExecute_comment_7", comprehensiveTree);
        update(comprehensiveTree.getSqlMapSelector() + "." + "ddlSqlExecute_comment_8", comprehensiveTree);
        update(comprehensiveTree.getSqlMapSelector() + "." + "ddlSqlExecute_comment_9", comprehensiveTree);
    }

    @Override
    public <T extends ComprehensiveTree> void ddlSequenceExecute(T comprehensiveTree) throws Exception {
        update(comprehensiveTree.getSqlMapSelector() + "." + "ddlSequenceExecute", comprehensiveTree);
    }

    @Override
    public <T extends ComprehensiveTree> void dmlSqlExecute(T comprehensiveTree) throws Exception {
        update(comprehensiveTree.getSqlMapSelector() + "." + "dmlSqlExecute_1", comprehensiveTree);
        update(comprehensiveTree.getSqlMapSelector() + "." + "dmlSqlExecute_2", comprehensiveTree);
        update(comprehensiveTree.getSqlMapSelector() + "." + "dmlSqlExecute_3", comprehensiveTree);
        update(comprehensiveTree.getSqlMapSelector() + "." + "dmlSqlExecute_4", comprehensiveTree);
    }

    @Override
    public <T extends ComprehensiveTree> void ddlLogExecute(T comprehensiveTree) throws Exception {
        update(comprehensiveTree.getSqlMapSelector() + "." + "ddlLogSqlExecute", comprehensiveTree);
        update(comprehensiveTree.getSqlMapSelector() + "." + "ddlLogSqlExecute_comment_1", comprehensiveTree);
        update(comprehensiveTree.getSqlMapSelector() + "." + "ddlLogSqlExecute_comment_2", comprehensiveTree);
        update(comprehensiveTree.getSqlMapSelector() + "." + "ddlLogSqlExecute_comment_3", comprehensiveTree);
        update(comprehensiveTree.getSqlMapSelector() + "." + "ddlLogSqlExecute_comment_4", comprehensiveTree);
        update(comprehensiveTree.getSqlMapSelector() + "." + "ddlLogSqlExecute_comment_5", comprehensiveTree);
        update(comprehensiveTree.getSqlMapSelector() + "." + "ddlLogSqlExecute_comment_6", comprehensiveTree);
        update(comprehensiveTree.getSqlMapSelector() + "." + "ddlLogSqlExecute_comment_7", comprehensiveTree);
        update(comprehensiveTree.getSqlMapSelector() + "." + "ddlLogSqlExecute_comment_8", comprehensiveTree);
        update(comprehensiveTree.getSqlMapSelector() + "." + "ddlLogSqlExecute_comment_9", comprehensiveTree);
    }

    public <T extends ComprehensiveTree> int isExistTable( T comprehensiveTree ) throws Exception{
        return (int) getSqlMapClientTemplate().queryForObject(
                comprehensiveTree.getSqlMapSelector() + ".isExistTable", comprehensiveTree);
    }
}
