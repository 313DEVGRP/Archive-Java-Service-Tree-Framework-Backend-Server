package egovframework.com.ext.jstree.springiBatis.core.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComiBatisAbstractDAO;
import egovframework.com.ext.jstree.springiBatis.core.vo.ComprehensiveTree;

@Repository("CoreDao")
@Qualifier("CoreDao")
public class CoreDaoImpl extends EgovComiBatisAbstractDAO implements CoreDao{
    
	@SuppressWarnings("unchecked")
	public <T extends ComprehensiveTree> List<T> getChildNode( T comprehensiveTree ) throws Exception{
		
		return (List<T>) list(comprehensiveTree.getSqlMapSelector() + "." + "getChildNode", comprehensiveTree );
	}

	@SuppressWarnings("deprecation")
	public <T extends ComprehensiveTree> int getChildCountByParentId( T comprehensiveTree ) throws Exception{
		
		return (int) getSqlMapClientTemplate().queryForObject(
                comprehensiveTree.getSqlMapSelector() + ".getChildCountByParentId", comprehensiveTree);
	}
	
	@SuppressWarnings("unchecked")
	public <T extends ComprehensiveTree> List<T> searchNodeByString( T comprehensiveTree ) throws Exception{
		
		return (List<T>) list(comprehensiveTree.getSqlMapSelector() + "." + "searchNodeByString", comprehensiveTree );
	}
	
	@SuppressWarnings("unchecked")
	public <T extends ComprehensiveTree>List<String> searchNodeByPosition(List<T> searchNodeByPositions) throws Exception{
		return (List<String>) list(searchNodeByPositions.get(0).getSqlMapSelector() + "." + "searchNodeByPosition", searchNodeByPositions );
	}
	
	
	@SuppressWarnings("unchecked")
	public <T extends ComprehensiveTree> T getNode( T comprehensiveTree ) throws Exception{
		return ((T)select(comprehensiveTree.getSqlMapSelector() + "." + "getNode", comprehensiveTree));
	}
	
	@SuppressWarnings("unchecked")
	public <T extends ComprehensiveTree> T getNodeByRef( T comprehensiveTree ) throws Exception{
		return ((T)select(comprehensiveTree.getSqlMapSelector() + "." + "getNodeByRef", comprehensiveTree));
	}
	
	public <T extends ComprehensiveTree> void cutMyself(T p_OnlyCutMyselfFromJstree) throws Exception{
		update(p_OnlyCutMyselfFromJstree.getSqlMapSelector() + "." + "cutMyselfPositionFix", p_OnlyCutMyselfFromJstree);
		update(p_OnlyCutMyselfFromJstree.getSqlMapSelector() + "." + "cutMyselfLeftFix",     p_OnlyCutMyselfFromJstree);
		update(p_OnlyCutMyselfFromJstree.getSqlMapSelector() + "." + "cutMyselfRightFix",    p_OnlyCutMyselfFromJstree);
	}
	
	public <T extends ComprehensiveTree>void stretchPositionForMyselfFromJstree( T comprehensiveTree ) throws Exception{
		update(comprehensiveTree.getSqlMapSelector() + "." + "stretchPositionForMyself", comprehensiveTree);
	}
	
	public <T extends ComprehensiveTree> void stretchLeftRightForMyselfFromJstree( T comprehensiveTree ) throws Exception{
		update(comprehensiveTree.getSqlMapSelector() + "." + "stretchLeftForMyselfFromJstree",  comprehensiveTree);
		update(comprehensiveTree.getSqlMapSelector() + "." + "stretchRightForMyselfFromJstree", comprehensiveTree);
	}
	
	public <T extends ComprehensiveTree> int pasteMyselfFromJstree(T p_OnlyPasteMyselfFromJstree) throws Exception{
		return (Integer)insert(p_OnlyPasteMyselfFromJstree.getSqlMapSelector() + "." + "pasteMyselfFromJstree", p_OnlyPasteMyselfFromJstree);
	}
	
	@SuppressWarnings("unchecked")
	public <T extends ComprehensiveTree> List<T> getChildNodeByLeftRight( T comprehensiveTree ) throws Exception{
		
		return (List<T>) list(comprehensiveTree.getSqlMapSelector() + "." + "getChildNodeByLeftRight", comprehensiveTree );
	}
	
	public <T extends ComprehensiveTree> void fixCopy( T comprehensiveTree) throws Exception{
		update(comprehensiveTree.getSqlMapSelector() + "." + "fixCopy", comprehensiveTree);
	}

	public <T extends ComprehensiveTree> void fixCopyIF( T comprehensiveTree ) throws Exception{
		update(comprehensiveTree.getSqlMapSelector() + "." + "fixCopyIF", comprehensiveTree);
	}
	
	public <T extends ComprehensiveTree> void enterMyselfFromJstree( T comprehensiveTree ) throws Exception{
		insert(comprehensiveTree.getSqlMapSelector() + "." + "enterMyselfFromJstree", comprehensiveTree);
	}
	
	public <T extends ComprehensiveTree> int addMyselfFromJstree( T comprehensiveTree ) throws Exception{
		return (Integer)insert(comprehensiveTree.getSqlMapSelector() + "." + "addMyselfFromJstree", comprehensiveTree);
	}
	
	public <T extends ComprehensiveTree> int alterNode( T comprehensiveTree ) throws Exception{
		return (Integer)update(comprehensiveTree.getSqlMapSelector() + "." + "alterNode", comprehensiveTree);
	}
	
	public <T extends ComprehensiveTree> int removeNode( T comprehensiveTree ) throws Exception{
		
		delete(comprehensiveTree.getSqlMapSelector() + "." + "removeNode",              comprehensiveTree);
		update(comprehensiveTree.getSqlMapSelector() + "." + "removedAfterLeftFix",     comprehensiveTree);
		delete(comprehensiveTree.getSqlMapSelector() + "." + "removedAfterRightFix",    comprehensiveTree);
		delete(comprehensiveTree.getSqlMapSelector() + "." + "removedAfterPositionFix", comprehensiveTree);
		
		return 0;
	}
	
	public <T extends ComprehensiveTree> int alterNodeType( T comprehensiveTree ) throws Exception{
		return (Integer)update(comprehensiveTree.getSqlMapSelector() + "." + "alterNodeType", comprehensiveTree);
	}
	
	public <T extends ComprehensiveTree> void enterMyselfFixPosition( T comprehensiveTree ) throws Exception {
		update(comprehensiveTree.getSqlMapSelector() + ".enterMyselfFixPosition", comprehensiveTree);
	}
	
	public <T extends ComprehensiveTree> void enterMyselfFixLeftRight( T comprehensiveTree ) throws Exception {
		update(comprehensiveTree.getSqlMapSelector() + ".enterMyselfFixLeftRight", comprehensiveTree);
	}
	
	@SuppressWarnings("deprecation")
    public <T extends ComprehensiveTree> int getCountOfDescendantNodes( T comprehensiveTree ) {

        return (int) getSqlMapClientTemplate().queryForObject(
                comprehensiveTree.getSqlMapSelector() + ".getCountOfDescendantNodes", comprehensiveTree);
    }
    
    @SuppressWarnings("unchecked")
    public <T extends ComprehensiveTree> List<T> getDescendantNodesPaginated(T comprehensiveTree) {
        
        return (List<T>) list(comprehensiveTree.getSqlMapSelector() + ".getDescendantNodesPaginated", comprehensiveTree);
    }
}