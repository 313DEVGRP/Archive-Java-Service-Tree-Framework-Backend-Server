package egovframework.com.ext.jstree.springiBatis.core.vo;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;

import javax.validation.constraints.Min;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.hibernate.validator.constraints.Range;

import egovframework.com.ext.jstree.springiBatis.core.validation.custom.constraints.Contained;
import egovframework.com.ext.jstree.springiBatis.core.validation.group.AddNode;
import egovframework.com.ext.jstree.springiBatis.core.validation.group.AlterNode;
import egovframework.com.ext.jstree.springiBatis.core.validation.group.AlterNodeType;
import egovframework.com.ext.jstree.springiBatis.core.validation.group.MoveNode;
import egovframework.com.ext.jstree.springiBatis.core.validation.group.RemoveNode;


/**
 * Modification Information
 * 
 * @author 이동민
 * @since 2014. 7. 31.
 * @version 1.0
 * @see <pre>
 * 	Class Name 	: ComprehensiveTree.java
 * 	Description : jstree에서 사용되는 VO 
 * 	Infomation	: jstree에서 사용되는 VO
 *  
 *  << 개정이력(Modification Information) >>
 *  
 *  수정일            수정자             수정내용
 *  --------      ------------   -----------------------
 *  2014.  7. 31.  이동민            최초 생성
 * 	2014.  9.  4.  전경훈            주석 추가
 *  2014.  9. 16.  류강하            주석 추가
 *  2014. 10. 12.  류강하            getSqlMapSelector 메서드의 null 체크 추가
 *  2015.  1. 31.  한지훈            toString, equals, hashCode 구현
 *  2015.  3.  3.  전경훈            Constraint Annotation 추가
 *  2015.  3.  9.  전경훈            Constraint Annotation 변경 (공백값 체크를 위해 NotEmpty -> NotBlank)
 *  2015.  5. 25.  손호성            c_title NotBlank Annotation 제거
 *  2015.  8.  4.  류강하            ajaxMessage 프라퍼티 추가
 *  
 *  Copyright (C) 2014 by 313 DeveloperGroup  All right reserved.
 * </pre>
 */
public class ComprehensiveTree implements Serializable{

	/**
	 * 직렬화
	 */
	private static final long serialVersionUID = -7345016667815629074L;

	/** 노드의 고유 id, 1부터 시작(Root Node) */
	@Min(value = 2, groups = { RemoveNode.class, AlterNode.class, 
			AlterNodeType.class, MoveNode.class })
	private int c_id;
	
	/** 노드의 부모 id, 0부터 시작(Root Node) */
	private int c_parentid;
	
	/** Parent의 몇 번째 자식인지를 나타냄. 0부터 시작 */
	@Min(value = 0, groups = { AddNode.class, MoveNode.class })
	private int c_position;
	
	/** 노드의 left 위치, 1부터 시작(Root Node) */
	private int c_left;
	
	/** 노드의 right 위치, 자식이 없다면 left + 1의 값을 가진다. */
	private int c_right;
	
	/** 노드의 depth, 0부터 시작 */
	private int c_level;

	/** 참조하고 있는 노드의 id */
	@Min(value = 1, groups = { AddNode.class, MoveNode.class })
	private int ref;
	
	/** copy 시 1의 값을 가짐. */
	@Range(min = 0, max = 1, groups = { MoveNode.class })
	private int copy;
	
	@Min(value = 0, groups = { MoveNode.class })
	private int multiCounter;
	
	private int status;
	/** ajax 처리 결과 메시지 */
	private String ajaxMessage;
	
	/** Node 의 title */
	private String c_title;
	
	/**<pre>
	 * 노드의 type
	 * root : root 노드
	 * drive : first child 노드
	 * folder : branch 노드
	 * default : leaf 노드
	 * </pre>
	 */
    @Contained(values = {"folder", "default"}, message = "c_type must be folder or default",
            groups = {AddNode.class, AlterNode.class, AlterNodeType.class})
	private String c_type;
	
	private String childcount;
	
	/** 검색시 Keyword */
	private String searchStr;
	
	private int idif;
	private int ldif;
	
	/** 노드가 차지하는 공간 (right - left + 1) */
	private int spaceOfTargetNode;
	
	/** 임의 노드의 자식 노드들의 id만을 저장하는 컬렉션 */
	private Collection<Integer> c_idsByChildNodeFromNodeById;

	private int fixCopyId;
	private int fixCopyPosition;

	/** 참조 노드의 right */
	private int rightPositionFromNodeByRef;
	
	private ComprehensiveTree nodeById;

	private int idifLeft;
	private int idifRight;
	
	private int id; // moveNode
	private final HashMap<String, String> attr;
	
	/** iBatis 사용 시에 쓸 map 지정 필드 */
	private String sqlMapSelector;

	private volatile int hashCode;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public ComprehensiveTree() {
		attr = new HashMap<String, String>();
	}
	
    public ComprehensiveTree(int c_id, int c_parentid, int c_position, int c_left, int c_right, int c_level, String c_title, String c_type) {
        this();
        this.c_id = c_id;
        this.c_parentid = c_parentid;
        this.c_position = c_position;
        this.c_left = c_left;
        this.c_right = c_right;
        this.c_level = c_level;
        this.c_title = c_title;
        this.c_type = c_type;
    }
    
    public boolean isCopied() {
		return this.getCopy() == 1;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getCopy() {
		return copy;
	}

	public void setCopy(int copy) {
		this.copy = copy;
	}

	public int getC_id() {
		return c_id;
	}

	public void setC_id(int c_id) {
		this.c_id = c_id;
	}

	public int getC_parentid() {
		return c_parentid;
	}

	public void setC_parentid(int c_parentid) {
		this.c_parentid = c_parentid;
	}

	public int getC_position() {
		return c_position;
	}

	public void setC_position(int c_position) {
		this.c_position = c_position;
	}

	public int getC_left() {
		return c_left;
	}

	public void setC_left(int c_left) {
		this.c_left = c_left;
	}

	public int getC_right() {
		return c_right;
	}

	public void setC_right(int c_right) {
		this.c_right = c_right;
	}

	public int getC_level() {
		return c_level;
	}

	public void setC_level(int c_level) {
		this.c_level = c_level;
	}

	public String getC_title() {
		return c_title;
	}

	public void setC_title(String c_title) {
		this.c_title = c_title;
	}

	public String getC_type() {
		return c_type;
	}

	public void setC_type(String c_type) {
		this.c_type = c_type;
	}

	public int getMultiCounter() {
		return multiCounter;
	}

	public void setMultiCounter(int multiCounter) {
		this.multiCounter = multiCounter;
	}

	public int getSpaceOfTargetNode() {
		return spaceOfTargetNode;
	}

	public void setSpaceOfTargetNode(int spaceOfTargetNode) {
		this.spaceOfTargetNode = spaceOfTargetNode;
	}

	public String getSearchStr() {
		return searchStr;
	}

	public void setSearchStr(String searchStr) {
		this.searchStr = searchStr;
	}

	public String getChildcount() {
		return childcount;
	}

	public void setChildcount(String childcount) {
		this.childcount = childcount;
	}

	public String getState() {
		String returnCode = new String();

		if (getChildcount() == null || getChildcount().equals(" ")) {
			returnCode = "update status";
		} else if (getChildcount().equals("InChild")) {
			returnCode = "closed";
		} else {
			returnCode = "leafNode";
		}
		return returnCode;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	public String getAjaxMessage() {
        return ajaxMessage;
    }

    public void setAjaxMessage(String ajaxMessage) {
        this.ajaxMessage = ajaxMessage;
    }

    public int getIdif() {
		return idif;
	}

	public void setIdif(int idif) {
		this.idif = idif;
	}

	public int getLdif() {
		return ldif;
	}

	public void setLdif(int ldif) {
		this.ldif = ldif;
	}

	public Collection<Integer> getC_idsByChildNodeFromNodeById() {
		return c_idsByChildNodeFromNodeById;
	}

	public void setC_idsByChildNodeFromNodeById(
			Collection<Integer> c_idsByChildNodeFromNodeById) {
		this.c_idsByChildNodeFromNodeById = c_idsByChildNodeFromNodeById;
	}

	public int getFixCopyId() {
		return fixCopyId;
	}

	public void setFixCopyId(int fixCopyId) {
		this.fixCopyId = fixCopyId;
	}

	public int getFixCopyPosition() {
		return fixCopyPosition;
	}

	public void setFixCopyPosition(int fixCopyPosition) {
		this.fixCopyPosition = fixCopyPosition;
	}

	public int getRightPositionFromNodeByRef() {
		return rightPositionFromNodeByRef;
	}

	public void setRightPositionFromNodeByRef(int rightPositionFromNodeByRef) {
		this.rightPositionFromNodeByRef = rightPositionFromNodeByRef;
	}

	public ComprehensiveTree getNodeById() {
		return nodeById;
	}

	public void setNodeById(ComprehensiveTree nodeById) {
		this.nodeById = nodeById;
	}

	public int getIdifLeft() {
		return idifLeft;
	}

	public void setIdifLeft(int idifLeft) {
		this.idifLeft = idifLeft;
	}

	public int getIdifRight() {
		return idifRight;
	}

	public void setIdifRight(int idifRight) {
		this.idifRight = idifRight;
	}
	
	public String getData() {
		return c_title;
	}

	public HashMap<String, String> getAttr() {
		attr.put("id", "node_" + c_id);
		attr.put("rel", c_type);
		return attr;
	}
	
    public String getSqlMapSelector() {
		if (this.sqlMapSelector == null || this.sqlMapSelector.isEmpty() || sqlMapSelector.equals("null")) {
			return "core";
		} else {
			return sqlMapSelector;
		}
	}

	public void setSqlMapSelector(String sqlMapSelector) {
		this.sqlMapSelector = sqlMapSelector;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;

		ComprehensiveTree that = (ComprehensiveTree) o;

		if (c_id != that.c_id) return false;
		if (c_left != that.c_left) return false;
		if (c_level != that.c_level) return false;
		if (c_parentid != that.c_parentid) return false;
		if (c_position != that.c_position) return false;
		if (c_right != that.c_right) return false;
		if (copy != that.copy) return false;
		if (fixCopyId != that.fixCopyId) return false;
		if (fixCopyPosition != that.fixCopyPosition) return false;
		if (hashCode != that.hashCode) return false;
		if (id != that.id) return false;
		if (idif != that.idif) return false;
		if (idifLeft != that.idifLeft) return false;
		if (idifRight != that.idifRight) return false;
		if (ldif != that.ldif) return false;
		if (multiCounter != that.multiCounter) return false;
		if (ref != that.ref) return false;
		if (rightPositionFromNodeByRef != that.rightPositionFromNodeByRef) return false;
		if (spaceOfTargetNode != that.spaceOfTargetNode) return false;
		if (status != that.status) return false;
		if (!attr.equals(that.attr)) return false;
		if (c_idsByChildNodeFromNodeById != null ? !c_idsByChildNodeFromNodeById.equals(that.c_idsByChildNodeFromNodeById) : that.c_idsByChildNodeFromNodeById != null)return false;
		if (c_title != null ? !c_title.equals(that.c_title) : that.c_title != null) return false;
		if (c_type != null ? !c_type.equals(that.c_type) : that.c_type != null) return false;
		if (childcount != null ? !childcount.equals(that.childcount) : that.childcount != null) return false;
		if (nodeById != null ? !nodeById.equals(that.nodeById) : that.nodeById != null) return false;
		if (searchStr != null ? !searchStr.equals(that.searchStr) : that.searchStr != null) return false;
		if (sqlMapSelector != null ? !sqlMapSelector.equals(that.sqlMapSelector) : that.sqlMapSelector != null)
			return false;

		return true;
	}

	@Override
	public int hashCode() {
		int result = hashCode;

		if (result == 0) {
			int primeNumber = 31;
			result = primeNumber + c_id;
			result = primeNumber * result + c_parentid;
			result = primeNumber * result + c_position;
			result = primeNumber * result + c_left;
			result = primeNumber * result + c_right;
			result = primeNumber * result + c_level;
			result = primeNumber * result + ref;
			result = primeNumber * result + copy;
			result = primeNumber * result + multiCounter;
			result = primeNumber * result + status;
			result = primeNumber * result + (c_title != null ? c_title.hashCode() : 0);
			result = primeNumber * result + (c_type != null ? c_type.hashCode() : 0);
			result = primeNumber * result + (childcount != null ? childcount.hashCode() : 0);
			result = primeNumber * result + (searchStr != null ? searchStr.hashCode() : 0);
			result = primeNumber * result + idif;
			result = primeNumber * result + ldif;
			result = primeNumber * result + spaceOfTargetNode;
			result = primeNumber * result + (c_idsByChildNodeFromNodeById != null ? c_idsByChildNodeFromNodeById.hashCode() : 0);
			result = primeNumber * result + fixCopyId;
			result = primeNumber * result + fixCopyPosition;
			result = primeNumber * result + rightPositionFromNodeByRef;
			result = primeNumber * result + (nodeById != null ? nodeById.hashCode() : 0);
			result = primeNumber * result + idifLeft;
			result = primeNumber * result + idifRight;
			result = primeNumber * result + id;
			result = primeNumber * result + attr.hashCode();
			result = primeNumber * result + (sqlMapSelector != null ? sqlMapSelector.hashCode() : 0);

			hashCode = result;
		}
		return result;
	}
}