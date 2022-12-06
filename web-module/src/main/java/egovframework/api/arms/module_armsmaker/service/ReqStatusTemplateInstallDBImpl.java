package egovframework.api.arms.module_armsmaker.service;

import egovframework.api.arms.module_armsmaker.dao.ArmsInstallSqlMapperDao;
import egovframework.com.ext.jstree.springiBatis.core.service.CoreServiceImpl;
import egovframework.com.ext.jstree.springiBatis.core.vo.ComprehensiveTree;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

@Service("reqStatusTemplateInstallDB")
public class ReqStatusTemplateInstallDBImpl extends CoreServiceImpl implements ArmsInstallDB{

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Resource(name = "egov.dataSource")
    DataSource dataSource;

    @Resource(name = "armsInstallSqlMapperDao")
    ArmsInstallSqlMapperDao armsInstallSqlMapperDao;

    public void sqlMapExecute(ComprehensiveTree armsInstallDB_sqlMaaperDTO) throws Exception {

        if(this.isExist_aRMS_DB(armsInstallDB_sqlMaaperDTO) == 1){
            logger.error("already exist JSTF table : " + armsInstallDB_sqlMaaperDTO.getC_title());
        }else{
            this.set_aRMS_DDL_Table(armsInstallDB_sqlMaaperDTO);
            this.set_aRMS_DDL_Sequence(armsInstallDB_sqlMaaperDTO);
            this.set_aRMS_DML_Table(armsInstallDB_sqlMaaperDTO);
        }

        String C_title_org = armsInstallDB_sqlMaaperDTO.getC_title();
        armsInstallDB_sqlMaaperDTO.setC_title(armsInstallDB_sqlMaaperDTO.getC_title() + "_LOG");
        if(this.isExist_aRMS_DB(armsInstallDB_sqlMaaperDTO) == 1){
            logger.error("already exist log table : " + armsInstallDB_sqlMaaperDTO.getC_title());
        }else{
            armsInstallDB_sqlMaaperDTO.setC_title(C_title_org);
            this.set_aRMSLog_DDL_Table(armsInstallDB_sqlMaaperDTO);
            makeTrigger(armsInstallDB_sqlMaaperDTO);
        }
    }

    private void makeTrigger(ComprehensiveTree comprehensiveTree) throws SQLException {

        String addColums =",c_pdservice_link,c_pdservice_name,c_version_link,c_version_name,c_jira_project_link,c_jira_project_name,c_jira_project_url,c_jira_version_link,c_jira_version_name,c_jira_version_url,c_req_link,c_req_name,c_jira_req_issue_link,c_jira_req_issue_key,c_jira_req_issue_id,c_jira_req_priority_link,c_jira_req_priority_url,c_jira_req_priority_name,c_jira_req_status_link,c_jira_req_status_url,c_jira_req_status_name,c_jira_req_linkingissue,c_jira_req_subtaskissue";
        String addOldColums =",:old.c_pdservice_link,:old.c_pdservice_name,:old.c_version_link,:old.c_version_name,:old.c_jira_project_link,:old.c_jira_project_name,:old.c_jira_project_url,:old.c_jira_version_link,:old.c_jira_version_name,:old.c_jira_version_url,:old.c_req_link,:old.c_req_name,:old.c_jira_req_issue_link,:old.c_jira_req_issue_key,:old.c_jira_req_issue_id,:old.c_jira_req_priority_link,:old.c_jira_req_priority_url,:old.c_jira_req_priority_name,:old.c_jira_req_status_link,:old.c_jira_req_status_url,:old.c_jira_req_status_name,:old.c_jira_req_linkingissue,:old.c_jira_req_subtaskissue";
        String addNewColums =",:new.c_pdservice_link,:new.c_pdservice_name,:new.c_version_link,:new.c_version_name,:new.c_jira_project_link,:new.c_jira_project_name,:new.c_jira_project_url,:new.c_jira_version_link,:new.c_jira_version_name,:new.c_jira_version_url,:new.c_req_link,:new.c_req_name,:new.c_jira_req_issue_link,:new.c_jira_req_issue_key,:new.c_jira_req_issue_id,:new.c_jira_req_priority_link,:new.c_jira_req_priority_url,:new.c_jira_req_priority_name,:new.c_jira_req_status_link,:new.c_jira_req_status_url,:new.c_jira_req_status_name,:new.c_jira_req_linkingissue,:new.c_jira_req_subtaskissue";

        Connection connection = dataSource.getConnection();
        Statement statement = connection.createStatement();
        String sql =
                "CREATE OR REPLACE TRIGGER \"TRIG_" + comprehensiveTree.getC_title() + "\"\n" +
                        "BEFORE DELETE OR INSERT OR UPDATE\n" +
                        "ON " + comprehensiveTree.getC_title() + " REFERENCING NEW AS NEW OLD AS OLD\n" +
                        "FOR EACH ROW\n" +
                        "DECLARE\n" +
                        "tmpVar NUMBER;\n" +
                        "/******************************************************************************\n" +
                        "   NAME:       TRIGGER_COMPREHENSIVETREE\n" +
                        "   PURPOSE:    \n" +
                        " \n" +
                        "   REVISIONS:\n" +
                        "   Ver        Date        Author           Description\n" +
                        "   ---------  ----------  ---------------  ------------------------------------\n" +
                        "   1.0        2012-08-29             1. Created this trigger.\n" +
                        " \n" +
                        "   NOTES:\n" +
                        " \n" +
                        "   Automatically available Auto Replace Keywords:\n" +
                        "      Object Name:     TRIGGER_COMPREHENSIVETREE\n" +
                        "      Sysdate:         2012-08-29\n" +
                        "      Date and Time:   2012-08-29, 오후 5:26:44, and 2012-08-29 오후 5:26:44\n" +
                        "      Username:         (set in TOAD Options, Proc Templates)\n" +
                        "      Table Name:      T_ARMS_REQADD (set in the \"New PL/SQL Object\" dialog)\n" +
                        "      Trigger Options:  (set in the \"New PL/SQL Object\" dialog)\n" +
                        "******************************************************************************/\n" +
                        "BEGIN\n" +
                        "  tmpVar := 0;\n" +
                        "   IF UPDATING  THEN    \n" +
                        "       insert into " + comprehensiveTree.getC_title() + "_LOG (C_ID,C_PARENTID,C_POSITION,C_LEFT,C_RIGHT,C_LEVEL,C_TITLE,C_TYPE,C_METHOD,C_STATE,C_DATE" + addColums + ")\n" +
                        "       values (:old.C_ID,:old.C_PARENTID,:old.C_POSITION,:old.C_LEFT,:old.C_RIGHT,:old.C_LEVEL,:old.C_TITLE,:old.C_TYPE,'update','변경이전데이터',sysdate" + addOldColums + ");\n" +
                        "       insert into " + comprehensiveTree.getC_title() + "_LOG (C_ID,C_PARENTID,C_POSITION,C_LEFT,C_RIGHT,C_LEVEL,C_TITLE,C_TYPE,C_METHOD,C_STATE,C_DATE" + addColums + ")\n" +
                        "       values (:new.C_ID,:new.C_PARENTID,:new.C_POSITION,:new.C_LEFT,:new.C_RIGHT,:new.C_LEVEL,:new.C_TITLE,:new.C_TYPE,'update','변경이후데이터',sysdate" + addNewColums + ");\n" +
                        "    END IF;\n" +
                        "   IF DELETING THEN\n" +
                        "       insert into " + comprehensiveTree.getC_title() + "_LOG (C_ID,C_PARENTID,C_POSITION,C_LEFT,C_RIGHT,C_LEVEL,C_TITLE,C_TYPE,C_METHOD,C_STATE,C_DATE" + addColums + ")\n" +
                        "       values (:old.C_ID,:old.C_PARENTID,:old.C_POSITION,:old.C_LEFT,:old.C_RIGHT,:old.C_LEVEL,:old.C_TITLE,:old.C_TYPE,'delete','삭제된데이터',sysdate" + addOldColums + ");\n" +
                        "   END IF;   \n" +
                        "   IF INSERTING  THEN\n" +
                        "       insert into " + comprehensiveTree.getC_title() + "_LOG (C_ID,C_PARENTID,C_POSITION,C_LEFT,C_RIGHT,C_LEVEL,C_TITLE,C_TYPE,C_METHOD,C_STATE,C_DATE" + addColums + ")\n" +
                        "       values (:new.C_ID,:new.C_PARENTID,:new.C_POSITION,:new.C_LEFT,:new.C_RIGHT,:new.C_LEVEL,:new.C_TITLE,:new.C_TYPE,'insert','삽입된데이터',sysdate" + addNewColums + ");\n" +
                        "   END IF;\n" +
                        " \n" +
                        "  EXCEPTION\n" +
                        "    WHEN OTHERS THEN\n" +
                        "      -- Consider logging the error and then re-raise\n" +
                        "      RAISE;\n" +
                        "END TRIG_" + comprehensiveTree.getC_title() + ";";
        statement.execute(sql);
    }

    @Override
    @Transactional(readOnly = false, rollbackFor = { Exception.class }, propagation = Propagation.REQUIRED)
    public <T extends ComprehensiveTree> void set_aRMS_DDL_Table(T comprehensiveTree) throws Exception {
        armsInstallSqlMapperDao.ddlExecute(comprehensiveTree);
    }

    @Override
    @Transactional(readOnly = false, rollbackFor = { Exception.class }, propagation = Propagation.REQUIRED)
    public <T extends ComprehensiveTree> void set_aRMS_DDL_Sequence(T comprehensiveTree) throws Exception {
        armsInstallSqlMapperDao.ddlSequenceExecute(comprehensiveTree);
    }

    @Override
    @Transactional(readOnly = false, rollbackFor = { Exception.class }, propagation = Propagation.REQUIRED)
    public <T extends ComprehensiveTree> void set_aRMS_DML_Table(T comprehensiveTree) throws Exception {
        armsInstallSqlMapperDao.dmlExecute(comprehensiveTree);
    }

    @Override
    @Transactional(readOnly = false, rollbackFor = { Exception.class }, propagation = Propagation.REQUIRED)
    public <T extends ComprehensiveTree> void set_aRMSLog_DDL_Table(T comprehensiveTree) throws Exception {
        armsInstallSqlMapperDao.ddlLogExecute(comprehensiveTree);
    }

    @Override
    @Transactional(readOnly = false, rollbackFor = { Exception.class }, propagation = Propagation.REQUIRED)
    public <T extends ComprehensiveTree> int isExist_aRMS_DB(T comprehensiveTree) throws Exception {
        return armsInstallSqlMapperDao.isExistTable(comprehensiveTree);
    }
}
