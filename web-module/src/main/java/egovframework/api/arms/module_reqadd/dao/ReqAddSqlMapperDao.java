package egovframework.api.arms.module_reqadd.dao;

import egovframework.com.ext.jstree.springiBatis.core.dao.CoreDao;
import egovframework.com.ext.jstree.springiBatis.core.vo.ComprehensiveTree;

public interface ReqAddSqlMapperDao extends CoreDao {

    public <T extends ComprehensiveTree> void ddlSqlExecute(T comprehensiveTree) throws Exception;
    public <T extends ComprehensiveTree> void ddlSequenceExecute(T comprehensiveTree) throws Exception;
    public <T extends ComprehensiveTree> void dmlSqlExecute(T comprehensiveTree) throws Exception;
    public <T extends ComprehensiveTree> void ddlLogExecute(T comprehensiveTree) throws Exception;
    public <T extends ComprehensiveTree> void ddlTriggerLogExecute(T comprehensiveTree) throws Exception;

    public <T extends ComprehensiveTree> int isExistTable(T comprehensiveTree) throws Exception;
}
