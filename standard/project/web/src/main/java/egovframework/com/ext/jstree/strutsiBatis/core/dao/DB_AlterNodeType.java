package egovframework.com.ext.jstree.strutsiBatis.core.dao;

import egovframework.com.cmm.service.impl.EgovComiBatisAbstractDAO;
import egovframework.com.ext.jstree.strutsiBatis.core.dto.P_ComprehensiveTree;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;

@Repository("DB_AlterNodeType")
public class DB_AlterNodeType extends EgovComiBatisAbstractDAO implements I_DB_AlterNodeType
{

    private static final Logger logger = Logger.getLogger(DB_AlterNodeType.class);
    
    @SuppressWarnings("deprecation")
    @Override
    public int alterNodeType(P_ComprehensiveTree p_ComprehensiveTree, String determineDBSetting)
    {
        Integer returnInt = 0;
        try
        {
            getSqlMapClientTemplate().getSqlMapClient().startTransaction();
            getSqlMapClientTemplate().getSqlMapClient().getCurrentConnection().setAutoCommit(false);
            getSqlMapClientTemplate().getSqlMapClient().commitTransaction();
            
            returnInt = getSqlMapClientTemplate().getSqlMapClient().update(determineDBSetting, p_ComprehensiveTree);
            
            getSqlMapClientTemplate().getSqlMapClient().executeBatch();
            getSqlMapClientTemplate().getSqlMapClient().commitTransaction();
            getSqlMapClientTemplate().getSqlMapClient().getCurrentConnection().commit();
        }
        catch (SQLException e)
        {
            logger.error(e);
        }
        finally
        {
            try
            {
                getSqlMapClientTemplate().getSqlMapClient().endTransaction();
            }
            catch (SQLException e)
            {
                logger.error(e);
            }
        }
        return returnInt;
    }
    
}
