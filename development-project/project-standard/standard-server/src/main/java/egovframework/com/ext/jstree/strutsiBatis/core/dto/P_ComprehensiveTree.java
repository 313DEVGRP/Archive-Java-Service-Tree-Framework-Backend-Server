package egovframework.com.ext.jstree.strutsiBatis.core.dto;

import egovframework.com.ext.jstree.strutsiBatis.core.vo.T_ComprehensiveTree;

import java.util.Collection;

/**
 * Modification Information
 * 
 * @author 이동민
 * @since 2014.07.25
 * @version 1.0
 * @see <pre>
 * 
 * Class Name 	: P_ComprehensiveTree.java
 * Description 	: JSTree의 dto Model
 * Infomation	: 
 * 
 * jstree는 정렬하면 일렬로 정렬이 된다.
 * node의 위치를 c_parentid , c_position , c_left , c_right , c_level 5가지의 값을 가지고 표현한다.
 * 동일 c_parentid값을 가지는 node는 동일 c_level을 가진다. 
 * c_position값은 0부터 시작하며 현재 동일 c_parentid를 가지는 node들 사이의 순서를 정해준다.
 * c_positon값이 적으면 c_left와 c_right값 또한 적은 값을 가지게 된다.
 * c_left와 c_right값은 현재 node의 위치를 가리키며 node의 c_right - c_left 값이 1인것은 해당 node는 leaf node(자식 node가 없는 node)라는 의미  
 * c_right - c_left -1 값이 0이 아닌 2의 배수일 경우 해당값 /2 만큼의 node를 가지는 parent node(자식 node를 가지는 node)라는 의미
 * 
 * P_ComprehensiveTree 와 T_ComprehensiveTree는 거의 동일한 형태의 dto(Data transfer object), vo (Value Object) 이다
 * 비슷하지만 따로 나눈것은 parameter 와 signature 의 차이를 명확히 하기 위해 선언하였다.
 * P_ComprehensiveTree는 parameter 즉, dto로서 데이터가 포함된 객체를  한 시스템에서 다른 시스템으로 전달하는 작업을 처리하는 객체로 레이어간의 통신용도로 사용된다.
 * T_ComprehensiveTree는 signature 즉, vo로서 특정한 비지니스 값이 담겨있는 객체이다.
 * 즉 메소드 입장에서 넘겨주는값은 parameter 넘겨받은 값은 signature라고 할수있다.
 * vo 와 dto 의 차이점은 vo는 read only이다.
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
