package egovframework.com.ext.jstree.springHibernate.core.vo;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.Transient;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

@MappedSuperclass
public abstract class JsTreeHibernateBaseDTO implements Serializable {

	private static final long serialVersionUID = -1686737481473490738L;

	/** 노드의 고유 id, 1부터 시작(Root Node) */
	private Long c_id;

	/** 노드의 부모 id, 0부터 시작(Root Node) */
	private Long c_parentid;

	/** Parent의 몇 번째 자식인지를 나타냄. 0부터 시작 */
	private Long c_position;

	/** 노드의 left 위치, 1부터 시작(Root Node) */
	private Long c_left;

	/** 노드의 right 위치, 자식이 없다면 left + 1의 값을 가진다. */
	private Long c_right;

	/** 노드의 depth, 0부터 시작 */
	private Long c_level;

	/** Node 의 title */
	private String c_title;

	/**
	 * <pre>
	 * 노드의 type
	 * root : root 노드
	 * drive : first child 노드
	 * folder : branch 노드
	 * default : leaf 노드
	 * </pre>
	 */
	private String c_type;

	/*
	 * Common Use Field
	 */
	/** 참조하고 있는 노드의 id */
	private long ref;

	/** copy 시 1의 값을 가짐. */
	private long copy;

	private long multiCounter;

	private long status;
	/** ajax 처리 결과 메시지 */
	private String ajaxMessage;

	private String childcount;

	/** 검색시 Keyword */
	private String searchStr;

	private long idif;
	private long ldif;

	/** 노드가 차지하는 공간 (right - left + 1) */
	private long spaceOfTargetNode;

	/** 임의 노드의 자식 노드들의 id만을 저장하는 컬렉션 */
	private Collection<Long> c_idsByChildNodeFromNodeById;

	private long fixCopyId;
	private long fixCopyPosition;

	/** 참조 노드의 right */
	private long rightPositionFromNodeByRef;

	private JsTreeHibernateBaseDTO nodeById;

	private long idifLeft;
	private long idifRight;

	private long id; // moveNode
	private final HashMap<String, String> attr;
	private volatile long hashCode;

	public JsTreeHibernateBaseDTO() {
		super();
		attr = new HashMap<String, String>();
	}

	public JsTreeHibernateBaseDTO(Long c_id, Long c_parentid, Long c_position, Long c_left,
			Long c_right, Long c_level, String c_title, String c_type, long ref, long copy, long multiCounter,
			long status, String ajaxMessage, String childcount, String searchStr, long idif, long ldif,
			long spaceOfTargetNode, Collection<Long> c_idsByChildNodeFromNodeById, long fixCopyId,
			long fixCopyPosition, long rightPositionFromNodeByRef, JsTreeHibernateBaseDTO nodeById, long idifLeft,
			long idifRight, long id) {
		super();
		this.c_id = c_id;
		this.c_parentid = c_parentid;
		this.c_position = c_position;
		this.c_left = c_left;
		this.c_right = c_right;
		this.c_level = c_level;
		this.c_title = c_title;
		this.c_type = c_type;
		this.ref = ref;
		this.copy = copy;
		this.multiCounter = multiCounter;
		this.status = status;
		this.ajaxMessage = ajaxMessage;
		this.childcount = childcount;
		this.searchStr = searchStr;
		this.idif = idif;
		this.ldif = ldif;
		this.spaceOfTargetNode = spaceOfTargetNode;
		this.c_idsByChildNodeFromNodeById = c_idsByChildNodeFromNodeById;
		this.fixCopyId = fixCopyId;
		this.fixCopyPosition = fixCopyPosition;
		this.rightPositionFromNodeByRef = rightPositionFromNodeByRef;
		this.nodeById = nodeById;
		this.idifLeft = idifLeft;
		this.idifRight = idifRight;
		this.id = id;
		attr = new HashMap<String, String>();
	}

	@Id
	@GeneratedValue(strategy= GenerationType.SEQUENCE, generator="JsTreeSequence")
	@Column(name = "c_id")
	public Long getC_id() {
		return c_id;
	}

	public void setC_id(Long c_id) {
		this.c_id = c_id;
	}

	@Column(name = "c_parentid")
	public Long getC_parentid() {
		return c_parentid;
	}

	public void setC_parentid(Long c_parentid) {
		this.c_parentid = c_parentid;
	}

	@Column(name = "c_position")
	public Long getC_position() {
		return c_position;
	}

	public void setC_position(Long c_position) {
		this.c_position = c_position;
	}

	@Column(name = "c_left")
	public Long getC_left() {
		return c_left;
	}

	public void setC_left(Long c_left) {
		this.c_left = c_left;
	}

	@Column(name = "c_right")
	public Long getC_right() {
		return c_right;
	}

	public void setC_right(Long c_right) {
		this.c_right = c_right;
	}

	@Column(name = "c_level")
	public Long getC_level() {
		return c_level;
	}

	public void setC_level(Long c_level) {
		this.c_level = c_level;
	}

	@Column(name = "c_title")
	public String getC_title() {
		return c_title;
	}

	public void setC_title(String c_title) {
		this.c_title = c_title;
	}

	@Column(name = "c_type")
	public String getC_type() {
		return c_type;
	}

	public void setC_type(String c_type) {
		this.c_type = c_type;
	}
	
	@Transient
	public String getData() {
		return c_title;
	}
	
	@Transient
	public boolean isCopied() {
		return this.getCopy() == 1;
	}

	@Transient
	public long getRef() {
		return ref;
	}

	public void setRef(long ref) {
		this.ref = ref;
	}

	@Transient
	public long getCopy() {
		return copy;
	}

	public void setCopy(long copy) {
		this.copy = copy;
	}

	@Transient
	public long getMultiCounter() {
		return multiCounter;
	}

	public void setMultiCounter(long multiCounter) {
		this.multiCounter = multiCounter;
	}
	
	@Transient
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

	@Transient
	public long getStatus() {
		return status;
	}

	public void setStatus(long status) {
		this.status = status;
	}

	@Transient
	public String getChildcount() {
		if((c_right - c_left)>1){
			return "InChild";
		}
			return "NoChild";
	}

	public void setChildcount(String childcount) {
		this.childcount = childcount;
	}

	@Transient
	public long getFixCopyId() {
		return fixCopyId;
	}

	public void setFixCopyId(long fixCopyId) {
		this.fixCopyId = fixCopyId;
	}

	@Transient
	public String getAjaxMessage() {
		return ajaxMessage;
	}

	public void setAjaxMessage(String ajaxMessage) {
		this.ajaxMessage = ajaxMessage;
	}

	@Transient
	public String getSearchStr() {
		return searchStr;
	}

	public void setSearchStr(String searchStr) {
		this.searchStr = searchStr;
	}

	@Transient
	public long getIdif() {
		return idif;
	}

	public void setIdif(long idif) {
		this.idif = idif;
	}

	@Transient
	public long getLdif() {
		return ldif;
	}

	public void setLdif(long ldif) {
		this.ldif = ldif;
	}

	@Transient
	public long getSpaceOfTargetNode() {
		return spaceOfTargetNode;
	}

	public void setSpaceOfTargetNode(long spaceOfTargetNode) {
		this.spaceOfTargetNode = spaceOfTargetNode;
	}

	@Transient
	public Collection<Long> getC_idsByChildNodeFromNodeById() {
		return c_idsByChildNodeFromNodeById;
	}

	public void setC_idsByChildNodeFromNodeById(Collection<Long> c_idsByChildNodeFromNodeById) {
		this.c_idsByChildNodeFromNodeById = c_idsByChildNodeFromNodeById;
	}

	@Transient
	public long getFixCopyPosition() {
		return fixCopyPosition;
	}

	public void setFixCopyPosition(long fixCopyPosition) {
		this.fixCopyPosition = fixCopyPosition;
	}

	@Transient
	public long getRightPositionFromNodeByRef() {
		return rightPositionFromNodeByRef;
	}

	public void setRightPositionFromNodeByRef(long rightPositionFromNodeByRef) {
		this.rightPositionFromNodeByRef = rightPositionFromNodeByRef;
	}

	@Transient
	public JsTreeHibernateBaseDTO getNodeById() {
		return nodeById;
	}

	public void setNodeById(JsTreeHibernateBaseDTO nodeById) {
		this.nodeById = nodeById;
	}

	@Transient
	public long getIdifLeft() {
		return idifLeft;
	}

	public void setIdifLeft(long idifLeft) {
		this.idifLeft = idifLeft;
	}

	@Transient
	public long getIdifRight() {
		return idifRight;
	}

	public void setIdifRight(long idifRight) {
		this.idifRight = idifRight;
	}

	@Transient
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	@Transient
	public HashMap<String, String> getAttr() {
		attr.put("id", "node_" + c_id);
		attr.put("rel", c_type);
		return attr;
	}

	@Override
	@Transient
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}

	@Override
	@Transient
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;

		JsTreeHibernateBaseDTO that = (JsTreeHibernateBaseDTO) o;

		if (c_id != that.c_id)
			return false;
		if (c_left != that.c_left)
			return false;
		if (c_level != that.c_level)
			return false;
		if (c_parentid != that.c_parentid)
			return false;
		if (c_position != that.c_position)
			return false;
		if (c_right != that.c_right)
			return false;
		if (copy != that.copy)
			return false;
		if (fixCopyId != that.fixCopyId)
			return false;
		if (fixCopyPosition != that.fixCopyPosition)
			return false;
		if (hashCode != that.hashCode)
			return false;
		if (id != that.id)
			return false;
		if (idif != that.idif)
			return false;
		if (idifLeft != that.idifLeft)
			return false;
		if (idifRight != that.idifRight)
			return false;
		if (ldif != that.ldif)
			return false;
		if (multiCounter != that.multiCounter)
			return false;
		if (ref != that.ref)
			return false;
		if (rightPositionFromNodeByRef != that.rightPositionFromNodeByRef)
			return false;
		if (spaceOfTargetNode != that.spaceOfTargetNode)
			return false;
		if (status != that.status)
			return false;
		if (!attr.equals(that.attr))
			return false;
		if (c_idsByChildNodeFromNodeById != null ? !c_idsByChildNodeFromNodeById
				.equals(that.c_idsByChildNodeFromNodeById) : that.c_idsByChildNodeFromNodeById != null)
			return false;
		if (c_title != null ? !c_title.equals(that.c_title) : that.c_title != null)
			return false;
		if (c_type != null ? !c_type.equals(that.c_type) : that.c_type != null)
			return false;
		if (childcount != null ? !childcount.equals(that.childcount) : that.childcount != null)
			return false;
		if (nodeById != null ? !nodeById.equals(that.nodeById) : that.nodeById != null)
			return false;
		if (searchStr != null ? !searchStr.equals(that.searchStr) : that.searchStr != null)
			return false;

		return true;
	}

}
