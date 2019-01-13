package egovframework.com.ext.jstree.strutsiBatis.core.dto;

import egovframework.com.ext.jstree.strutsiBatis.core.vo.T_ComprehensiveTree;

import java.util.Collection;

public class P_ComprehensiveTree {

	private int c_id;				//jstree의 pk ,jstree node의 고유값                                                    
	private int c_parentid;         //현재 나(node)의 부모 node의 c_id값, 0은 root node만이 가질수 있음                               
	private int c_position;         //node의 위치 0번부터 시작                                                                
	private int c_left;             //node의 왼쪽값, 1부터 시작                                                               
	private int c_right;            //node의 오른쪽값, max값은 현재 총 node의 갯수 * 2                                             
	private int c_level;            //node의 deth에 따른 level 0부터 시작                                                     
	private String c_title;         //node의 명칭 , 사용자에게 보여지는 node의 이름                                                  
	private String c_type;          //node의 type  drive/ folder / default(file) 현재 3종류가 있음 c_type에 따라 node의 UI가 변경됨   

	private int ref;
	private int copy;
	private int multiCounter;

	private int status;

	private String childcount;

	private String searchStr;
	private int idif;
	private int ldif;
	private int spaceOfTargetNode;
	Collection<Integer> c_idsByChildNodeFromNodeById;

	private int fixCopyId;
	private int fixCopyPosition;

	private int rightPositionFromNodeByRef;
	private T_ComprehensiveTree nodeById;

	private int idifLeft;
	private int idifRight;
	private Boolean copyBooleanValue;

	public void setCopyBooleanValue(Boolean copyBooleanValue) {
		this.copyBooleanValue = copyBooleanValue;
	}

	public Boolean getCopyBooleanValue() {
		copyBooleanValue = false;
		if (this.getCopy() == 0) {
			copyBooleanValue = false;
		} else {
			copyBooleanValue = true;
		}
		return copyBooleanValue;
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

	public T_ComprehensiveTree getNodeById() {
		return nodeById;
	}

	public void setNodeById(T_ComprehensiveTree nodeById) {
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

}
