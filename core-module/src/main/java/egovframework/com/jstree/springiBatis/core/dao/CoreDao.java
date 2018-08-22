package egovframework.com.jstree.springiBatis.core.dao;

import java.util.List;

import egovframework.com.ext.jstree.springiBatis.core.vo.ComprehensiveTree;

public interface CoreDao {

	public <T extends ComprehensiveTree> List<T> getChildNode(T comprehensiveTree) throws Exception;
	
	public <T extends ComprehensiveTree> List<T> searchNodeByString(T comprehensiveTree) throws Exception;
	
	public <T extends ComprehensiveTree> List<String> searchNodeByPosition(List<T> searchNodeByPositions) throws Exception;
	
	public <T extends ComprehensiveTree> T getNode(T comprehensiveTree) throws Exception;
	
	public <T extends ComprehensiveTree> T getNodeByRef(T comprehensiveTree) throws Exception;
	
	public <T extends ComprehensiveTree> int getChildCountByParentId(T comprehensiveTree) throws Exception;
	
	public <T extends ComprehensiveTree> void cutMyself(T p_OnlyCutMyselfFromJstree) throws Exception;
	
	public <T extends ComprehensiveTree> void stretchPositionForMyselfFromJstree(T comprehensiveTree) throws Exception;
	
	public <T extends ComprehensiveTree> void stretchLeftRightForMyselfFromJstree(T comprehensiveTree) throws Exception;
	
	public <T extends ComprehensiveTree> int pasteMyselfFromJstree(T p_OnlyPasteMyselfFromJstree) throws Exception;
	
	public <T extends ComprehensiveTree> List<T> getChildNodeByLeftRight(T comprehensiveTree) throws Exception;
	
	public <T extends ComprehensiveTree> void fixCopy(T comprehensiveTree) throws Exception;

	public <T extends ComprehensiveTree> void fixCopyIF(T comprehensiveTree) throws Exception;
	
	public <T extends ComprehensiveTree> void enterMyselfFromJstree(T comprehensiveTree) throws Exception;
	
	public <T extends ComprehensiveTree> int addMyselfFromJstree(T comprehensiveTree) throws Exception;
	
	public <T extends ComprehensiveTree> int alterNode(T comprehensiveTree) throws Exception;
	
	public <T extends ComprehensiveTree> int removeNode(T comprehensiveTree) throws Exception;
	
	public <T extends ComprehensiveTree> int alterNodeType(T comprehensiveTree) throws Exception;
	
	public <T extends ComprehensiveTree> void enterMyselfFixPosition(T comprehensiveTree) throws Exception;
	
	public <T extends ComprehensiveTree> void enterMyselfFixLeftRight(T comprehensiveTree) throws Exception;

	public <T extends ComprehensiveTree> int getCountOfDescendantNodes(T comprehensiveTree);
    
    public <T extends ComprehensiveTree> List<T> getDescendantNodesPaginated(T comprehensiveTree);
}