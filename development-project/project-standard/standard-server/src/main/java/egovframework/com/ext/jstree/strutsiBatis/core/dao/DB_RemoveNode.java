package egovframework.com.ext.jstree.strutsiBatis.core.dao;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.ext.jstree.strutsiBatis.core.dto.P_ComprehensiveTree;

import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

/**
 * Modification Information
 * 
 * @author 이동민
 * @since 2014.07.25
 * @version 1.0
 * @see <pre>
 * 
 * Class Name 	: DB_RemoveNode.java
 * Description 	: JSTree의 node를 제거하는 I_DB_RemoveNode interface를 구현하고 DB연동을 지원하는 EgovComAbstractDAO를 확장한 dao 클래스
 * Infomation	: 
 * 
 * node의 제거
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
@Repository("DB_RemoveNode")
public class DB_RemoveNode extends EgovComAbstractDAO implements I_DB_RemoveNode
{
    
    static Logger logger = Logger.getLogger(DB_RemoveNode.class);
    
    /**
     * node의 제거
     * 
     * @param P_ComprehensiveTree
     *            (p_ComprehensiveTree)
     * @param String
     *            (determineDBSetting)
     * @return node 처리에 결과값(int)
     * @see 대상node를 제거하고 left와 right를 줄이고 position값을 재설정한다.
     * 
     * */
    @SuppressWarnings("deprecation")
    @Override
    public int removeNode(P_ComprehensiveTree p_RemoveNode, String determineDBSetting)
    {
        int retrunResultCount = 0;
        
        try
        {
            getSqlMapClientTemplate().getSqlMapClient().startTransaction();
            getSqlMapClientTemplate().getSqlMapClient().getCurrentConnection().setAutoCommit(false);
            getSqlMapClientTemplate().getSqlMapClient().commitTransaction();// autoCommit의
                                                                            // 설정
                                                                            // Commit
            
            getSqlMapClientTemplate().getSqlMapClient().delete("jstreeStrutsiBatis.removeNode", p_RemoveNode);
            getSqlMapClientTemplate().getSqlMapClient().update("jstreeStrutsiBatis.removedAfterLeftFix", p_RemoveNode);
            getSqlMapClientTemplate().getSqlMapClient().delete("jstreeStrutsiBatis.removedAfterRightFix", p_RemoveNode);
            getSqlMapClientTemplate().getSqlMapClient().delete("jstreeStrutsiBatis.removedAfterPositionFix",
                                                               p_RemoveNode);
            
            getSqlMapClientTemplate().getSqlMapClient().executeBatch();
            getSqlMapClientTemplate().getSqlMapClient().commitTransaction();// Transaction
                                                                            // Commit!!
            getSqlMapClientTemplate().getSqlMapClient().getCurrentConnection().commit(); // connection
                                                                                         // Commit!!
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        finally
        {
            try
            {
                getSqlMapClientTemplate().getSqlMapClient().endTransaction();
            }
            catch (SQLException e)
            {
                e.printStackTrace();
            }
        }
        return retrunResultCount;
    }
    
}
