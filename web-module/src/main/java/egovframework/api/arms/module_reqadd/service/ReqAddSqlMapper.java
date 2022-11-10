package egovframework.api.arms.module_reqadd.service;

import egovframework.com.ext.jstree.springiBatis.core.service.CoreService;
import egovframework.com.ext.jstree.springiBatis.core.vo.ComprehensiveTree;

public interface ReqAddSqlMapper extends CoreService {

    public <T extends ComprehensiveTree> void ddlExecuteToReqAdd(T comprehensiveTree) throws Exception;

    public <T extends ComprehensiveTree> void ddlSequenceExecuteToReqAdd(T comprehensiveTree) throws Exception;

    public <T extends ComprehensiveTree> void dmlExecuteToReqAdd(T comprehensiveTree) throws Exception;

    public <T extends ComprehensiveTree> void ddlLogExecuteToReqAdd(T comprehensiveTree) throws Exception;

    public <T extends ComprehensiveTree> void ddlTriggerLogSqlExecuteToReqAdd(T comprehensiveTree) throws Exception;

    public <T extends ComprehensiveTree> int isExistTable(T comprehensiveTree) throws Exception;
}
