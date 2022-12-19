package egovframework.api.arms.module_armsmaker.dao;

import egovframework.com.ext.jstree.springiBatis.core.dao.CoreDao;
import egovframework.com.ext.jstree.springiBatis.core.vo.ComprehensiveTree;

public interface ArmsInstallSqlMapperDao extends CoreDao {

    public <T extends ComprehensiveTree> void ddlExecute(T comprehensiveTree) throws Exception;

    public <T extends ComprehensiveTree> void ddlSequenceExecute(T comprehensiveTree) throws Exception;

    public <T extends ComprehensiveTree> void dmlExecute(T comprehensiveTree) throws Exception;

    public <T extends ComprehensiveTree> void ddlLogSequenceExecute(T comprehensiveTree) throws Exception;

    public <T extends ComprehensiveTree> void ddlLogExecute(T comprehensiveTree) throws Exception;

    public <T extends ComprehensiveTree> int isExistTable(T comprehensiveTree) throws Exception;
}
