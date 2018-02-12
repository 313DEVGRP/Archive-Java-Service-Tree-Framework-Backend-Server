package egovframework.com.ext.jstree.strutsiBatis.core.dao;

import egovframework.com.cmm.service.impl.EgovComiBatisAbstractDAO;
import egovframework.com.ext.jstree.strutsiBatis.core.dto.P_ComprehensiveTree;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;

@Repository("DB_RemoveNode")
public class DB_RemoveNode extends EgovComiBatisAbstractDAO implements I_DB_RemoveNode
{

    private static final Logger logger = Logger.getLogger(DB_RemoveNode.class);
    
    @SuppressWarnings("deprecation")
    @Override
    public int removeNode(P_ComprehensiveTree p_RemoveNode, String determineDBSetting)
    {
        int retrunResultCount = 0;
        
        try
        {
            getSqlMapClientTemplate().getSqlMapClient().startTransaction();
            getSqlMapClientTemplate().getSqlMapClient().getCurrentConnection().setAutoCommit(false);
            getSqlMapClientTemplate().getSqlMapClient().commitTransaction();
            
            getSqlMapClientTemplate().getSqlMapClient().delete("jstreeStrutsiBatis.removeNode", p_RemoveNode);
            getSqlMapClientTemplate().getSqlMapClient().update("jstreeStrutsiBatis.removedAfterLeftFix", p_RemoveNode);
            getSqlMapClientTemplate().getSqlMapClient().delete("jstreeStrutsiBatis.removedAfterRightFix", p_RemoveNode);
            getSqlMapClientTemplate().getSqlMapClient().delete("jstreeStrutsiBatis.removedAfterPositionFix",
                                                               p_RemoveNode);
            
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
        return retrunResultCount;
    }
    
}
