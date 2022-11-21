package egovframework.api.arms.module_armsmaker.service;

import egovframework.com.ext.jstree.springiBatis.core.service.CoreService;
import egovframework.com.ext.jstree.springiBatis.core.vo.ComprehensiveTree;

public interface ArmsInstallDB extends CoreService {

    public void sqlMapExecute() throws Exception;

    public <T extends ComprehensiveTree> void set_aRMS_DDL_Table(T comprehensiveTree) throws Exception;

    public <T extends ComprehensiveTree> void set_aRMS_DDL_Sequence(T comprehensiveTree) throws Exception;

    public <T extends ComprehensiveTree> void set_aRMS_DML_Table(T comprehensiveTree) throws Exception;

    public <T extends ComprehensiveTree> void set_aRMSLog_DDL_Table(T comprehensiveTree) throws Exception;

    public <T extends ComprehensiveTree> int isExist_aRMS_DB(T comprehensiveTree) throws Exception;

}
