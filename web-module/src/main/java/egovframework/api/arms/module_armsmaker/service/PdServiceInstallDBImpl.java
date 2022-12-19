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

@Service("pdServiceInstallDB")
public class PdServiceInstallDBImpl extends CoreServiceImpl implements ArmsInstallDB{

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
            this.set_aRMSLog_DDL_Sequence(armsInstallDB_sqlMaaperDTO);
            this.set_aRMSLog_DDL_Table(armsInstallDB_sqlMaaperDTO);
            makeTrigger(armsInstallDB_sqlMaaperDTO);
        }
    }

    private void makeTrigger(ComprehensiveTree comprehensiveTree) throws SQLException {
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
                        "       insert into " + comprehensiveTree.getC_title() + "_LOG (C_ID,C_DATAID,C_PARENTID,C_POSITION,C_LEFT,C_RIGHT,C_LEVEL,C_TITLE,C_TYPE,C_METHOD,C_STATE,C_DATE,C_PDSERVICE_DETAIL,C_CONTENTS,C_OWNER,C_REVIEWER01,C_REVIEWER02,C_REVIEWER03,C_REVIEWER04,C_REVIEWER05,C_WRITER_NAME,C_WRITER_CN,C_WRITER_MAIL,C_WRITER_DATE,C_ETC,C_FILEID_LINK)\n" +
                        "       values (S_" + comprehensiveTree.getC_title() + "_LOG.NEXTVAL,:old.C_ID,:old.C_PARENTID,:old.C_POSITION,:old.C_LEFT,:old.C_RIGHT,:old.C_LEVEL,:old.C_TITLE,:old.C_TYPE,'update','변경이전데이터',sysdate,:old.C_PDSERVICE_DETAIL,:old.C_CONTENTS,:old.C_OWNER,:old.C_REVIEWER01,:old.C_REVIEWER02,:old.C_REVIEWER03,:old.C_REVIEWER04,:old.C_REVIEWER05,:old.C_WRITER_NAME,:old.C_WRITER_CN,:old.C_WRITER_MAIL,:old.C_WRITER_DATE,:old.C_ETC,:old.C_FILEID_LINK);\n" +
                        "       insert into " + comprehensiveTree.getC_title() + "_LOG (C_ID,C_DATAID,C_PARENTID,C_POSITION,C_LEFT,C_RIGHT,C_LEVEL,C_TITLE,C_TYPE,C_METHOD,C_STATE,C_DATE,C_PDSERVICE_DETAIL,C_CONTENTS,C_OWNER,C_REVIEWER01,C_REVIEWER02,C_REVIEWER03,C_REVIEWER04,C_REVIEWER05,C_WRITER_NAME,C_WRITER_CN,C_WRITER_MAIL,C_WRITER_DATE,C_ETC,C_FILEID_LINK)\n" +
                        "       values (S_" + comprehensiveTree.getC_title() + "_LOG.NEXTVAL,:new.C_ID,:new.C_PARENTID,:new.C_POSITION,:new.C_LEFT,:new.C_RIGHT,:new.C_LEVEL,:new.C_TITLE,:new.C_TYPE,'update','변경이후데이터',sysdate,:new.C_PDSERVICE_DETAIL,:new.C_CONTENTS,:new.C_OWNER,:new.C_REVIEWER01,:new.C_REVIEWER02,:new.C_REVIEWER03,:new.C_REVIEWER04,:new.C_REVIEWER05,:new.C_WRITER_NAME,:new.C_WRITER_CN,:new.C_WRITER_MAIL,:new.C_WRITER_DATE,:new.C_ETC,:new.C_FILEID_LINK);\n" +
                        "    END IF;\n" +
                        "   IF DELETING THEN\n" +
                        "       insert into " + comprehensiveTree.getC_title() + "_LOG (C_ID,C_DATAID,C_PARENTID,C_POSITION,C_LEFT,C_RIGHT,C_LEVEL,C_TITLE,C_TYPE,C_METHOD,C_STATE,C_DATE,C_PDSERVICE_DETAIL,C_CONTENTS,C_OWNER,C_REVIEWER01,C_REVIEWER02,C_REVIEWER03,C_REVIEWER04,C_REVIEWER05,C_WRITER_NAME,C_WRITER_CN,C_WRITER_MAIL,C_WRITER_DATE,C_ETC,C_FILEID_LINK)\n" +
                        "       values (S_" + comprehensiveTree.getC_title() + "_LOG.NEXTVAL,:old.C_ID,:old.C_PARENTID,:old.C_POSITION,:old.C_LEFT,:old.C_RIGHT,:old.C_LEVEL,:old.C_TITLE,:old.C_TYPE,'delete','삭제된데이터',sysdate,:old.C_PDSERVICE_DETAIL,:old.C_CONTENTS,:old.C_OWNER,:old.C_REVIEWER01,:old.C_REVIEWER02,:old.C_REVIEWER03,:old.C_REVIEWER04,:old.C_REVIEWER05,:old.C_WRITER_NAME,:old.C_WRITER_CN,:old.C_WRITER_MAIL,:old.C_WRITER_DATE,:old.C_ETC,:old.C_FILEID_LINK);\n" +
                        "   END IF;   \n" +
                        "   IF INSERTING  THEN\n" +
                        "       insert into " + comprehensiveTree.getC_title() + "_LOG (C_ID,C_DATAID,C_PARENTID,C_POSITION,C_LEFT,C_RIGHT,C_LEVEL,C_TITLE,C_TYPE,C_METHOD,C_STATE,C_DATE,C_PDSERVICE_DETAIL,C_CONTENTS,C_OWNER,C_REVIEWER01,C_REVIEWER02,C_REVIEWER03,C_REVIEWER04,C_REVIEWER05,C_WRITER_NAME,C_WRITER_CN,C_WRITER_MAIL,C_WRITER_DATE,C_ETC,C_FILEID_LINK)\n" +
                        "       values (S_" + comprehensiveTree.getC_title() + "_LOG.NEXTVAL,:new.C_ID,:new.C_PARENTID,:new.C_POSITION,:new.C_LEFT,:new.C_RIGHT,:new.C_LEVEL,:new.C_TITLE,:new.C_TYPE,'insert','삽입된데이터',sysdate,:new.C_PDSERVICE_DETAIL,:new.C_CONTENTS,:new.C_OWNER,:new.C_REVIEWER01,:new.C_REVIEWER02,:new.C_REVIEWER03,:new.C_REVIEWER04,:new.C_REVIEWER05,:new.C_WRITER_NAME,:new.C_WRITER_CN,:new.C_WRITER_MAIL,:new.C_WRITER_DATE,:new.C_ETC,:new.C_FILEID_LINK);\n" +
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
    public <T extends ComprehensiveTree> void set_aRMSLog_DDL_Sequence(T comprehensiveTree) throws Exception {
        armsInstallSqlMapperDao.ddlLogSequenceExecute(comprehensiveTree);
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
