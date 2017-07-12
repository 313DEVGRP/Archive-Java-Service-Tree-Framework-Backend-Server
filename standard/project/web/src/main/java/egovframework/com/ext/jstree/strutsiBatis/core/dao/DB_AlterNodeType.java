package egovframework.com.ext.jstree.strutsiBatis.core.dao;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.cmm.service.impl.EgovComiBatisAbstractDAO;
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
 * Class Name 	: DB_AlterNodeType.java
 * Description 	: JSTree의 node를 추가하는 I_DB_AlterNodeType interface를 구현하고 DB연동을 지원하는 EgovComAbstractDAO를 확장한 dao 클래스
 * Infomation	: 
 * 
 * node type 수정
 * 
 * node type 종류에는 drive  / folder /  default(file) 
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
@Repository("DB_AlterNodeType")
public class DB_AlterNodeType extends EgovComiBatisAbstractDAO implements I_DB_AlterNodeType
{
    
    static Logger logger = Logger.getLogger(DB_AlterNodeType.class);
    
    /**
     * node type 수정 메소드
     * 
     * @param P_ComprehensiveTree
     *            (p_ComprehensiveTree)
     * @param String
     *            (determineDBSetting)
     * @return node type 수정 처리에 따른 결과값 (int)
     * */
    @SuppressWarnings("deprecation")
    @Override
    public int alterNodeType(P_ComprehensiveTree p_ComprehensiveTree, String determineDBSetting)
    {
        Integer returnInt = 0;
        try
        {
            getSqlMapClientTemplate().getSqlMapClient().startTransaction();
            getSqlMapClientTemplate().getSqlMapClient().getCurrentConnection().setAutoCommit(false);
            getSqlMapClientTemplate().getSqlMapClient().commitTransaction();// autoCommit의
                                                                            // 설정
                                                                            // Commit
            
            returnInt = getSqlMapClientTemplate().getSqlMapClient().update(determineDBSetting, p_ComprehensiveTree);
            
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
        return returnInt;
    }
    
}
