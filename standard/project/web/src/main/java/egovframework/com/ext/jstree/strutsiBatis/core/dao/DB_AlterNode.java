package egovframework.com.ext.jstree.strutsiBatis.core.dao;

import egovframework.com.cmm.service.impl.EgovComiBatisAbstractDAO;
import egovframework.com.ext.jstree.strutsiBatis.core.dto.P_ComprehensiveTree;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;

/**
 * Modification Information
 * 
 * @author 이동민
 * @since 2014.07.25
 * @version 1.0
 * @see <pre>
 * 
 * Class Name 	: DB_AlterNode.java
 * Description 	: JSTree의 node를 추가하는 I_DB_AlterNode interface를 구현하고 DB연동을 지원하는 EgovComAbstractDAO를 확장한 dao 클래스
 * Infomation	: 
 * 
 * node 수정
 * 
 *  << 개정이력(Modification Information) >>
 *  
 *  수정일         수정자             수정내용
 *  -------      ------------   -----------------------
 *  2014.07.25    Dongmin.Lee      최초 생성 
 * 
 *  Copyright (C) 2007 by 313 DeveloperGroup  All right reserved.
 * </pre>
 * */
@Repository("DB_AlterNode")
public class DB_AlterNode extends EgovComiBatisAbstractDAO implements I_DB_AlterNode
{

    private static final Logger logger = Logger.getLogger(DB_AlterNode.class);

    /**
     * node를 수정
     * 
     * @param P_ComprehensiveTree
     *            (p_AlterNode)
     * @param String
     *            (determineDBSetting)
     * @return node수정 처리에 대한 결과값(int)
     * 
     * */
    @SuppressWarnings("deprecation")
    @Override
    public int alterNode(P_ComprehensiveTree p_AlterNode, String determineDBSetting)
    {
        Integer returnInt = 0;
        try
        {
            getSqlMapClientTemplate().getSqlMapClient().startTransaction();
            getSqlMapClientTemplate().getSqlMapClient().getCurrentConnection().setAutoCommit(false);
            getSqlMapClientTemplate().getSqlMapClient().commitTransaction();
            
            returnInt = getSqlMapClientTemplate().getSqlMapClient().update(determineDBSetting, p_AlterNode);
            
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
