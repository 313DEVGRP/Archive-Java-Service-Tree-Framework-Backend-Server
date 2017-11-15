package egovframework.api.rivalWar.directChat.vo;

import com.fasterxml.jackson.annotation.JsonBackReference;
import egovframework.api.rivalWar.menu.vo.MenuDTO;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.*;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "T_DIRECT_CHAT")
@SelectBeforeUpdate(value = true)
@DynamicInsert(value = true)
@DynamicUpdate(value = true)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SequenceGenerator(name = "JsTreeSequence", sequenceName = "S_DIRECT_CHAT", allocationSize = 1)
public class DirectChatDTO extends JsTreeHibernateSearchDTO implements Serializable {

	private static final long serialVersionUID = -2826589626523340365L;

	public DirectChatDTO() {
		super();
	}

	public DirectChatDTO(Boolean copyBooleanValue) {
		super();
		this.copyBooleanValue = copyBooleanValue;
	}

	/*
	 * Extend Bean Field
	 */
	private Boolean copyBooleanValue;

	@Transient
	public Boolean getCopyBooleanValue() {
		copyBooleanValue = false;
		if (this.getCopy() == 0) {
			copyBooleanValue = false;
		} else {
			copyBooleanValue = true;
		}
		return copyBooleanValue;
	}

	public void setCopyBooleanValue(Boolean copyBooleanValue) {
		this.copyBooleanValue = copyBooleanValue;
	}

	private Long	menuId;					//다이렉트챗 메뉴아이디 ( request )
	@Column(name = "MENU_ID")
	public Long getMenuId() {
		return menuId;
	}

	public void setMenuId(Long menuId) {
		this.menuId = menuId;
	}

	private String 	userId;					//글쓴 사용자 아이디 ( springsecurity )
	@Column(name = "USER_ID")
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	private Long	userLevel;				//글쓴 사용자 레벨 ( springsecurity )
	@Column(name = "USER_LEVEL")
	public Long getUserLevel() {
		return userLevel;
	}

	public void setUserLevel(Long userLevel) {
		this.userLevel = userLevel;
	}

	private String 	writeTime;				//글쓴시간 ( system )
	@Column(name = "WRITE_TIME")
	public String getWriteTime() {
		return writeTime;
	}

	public void setWriteTime(String writeTime) {
		this.writeTime = writeTime;
	}

	private Long 	selectedCompareItem;	//글쓴이 선택 진영 ( usermappingitem )
	@Column(name = "SELECTED_COMPARE_ITEM")
	public Long getSelectedCompareItem() {
		return selectedCompareItem;
	}

	public void setSelectedCompareItem(Long selectedCompareItem) {
		this.selectedCompareItem = selectedCompareItem;
	}

	private String 	contentsBody; 				//글내용
	@Column(name = "CONTENTS_BODY")
	public String getContentsBody() {
		return contentsBody;
	}

	public void setContentsBody(String contentsBody) {
		this.contentsBody = contentsBody;
	}

	private String  hashTags;				//글해시태그
	@Column(name = "HASH_TAGS")
	public String getHashTags() {
		return hashTags;
	}

	public void setHashTags(String hashTags) {
		this.hashTags = hashTags;
	}

	private Long 	likeCount;				//좋아요 카운트
	@Column(name = "LIKE_COUNT")
	public Long getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(Long likeCount) {
		this.likeCount = likeCount;
	}

	private Long 	hateCount;				//싫어요 카운트
	@Column(name = "HATE_COUNT")
	public Long getHateCount() {
		return hateCount;
	}

	public void setHateCount(Long hateCount) {
		this.hateCount = hateCount;
	}

	private String 	hiddenYN;				//글 보이기 감추기 여부
	@Column(name = "HIDDEN_YN")
	public String getHiddenYN() {
		return hiddenYN;
	}

	public void setHiddenYN(String hiddenYN) {
		this.hiddenYN = hiddenYN;
	}

	private String 	reportYN;				//신고여부
	@Column(name = "REPORT_YN")
	public String getReportYN() {
		return reportYN;
	}

	public void setReportYN(String reportYN) {
		this.reportYN = reportYN;
	}

	@Override
	public <T extends JsTreeHibernateSearchDTO> void setFieldFromNewInstance(T paramInstance) {
		if (paramInstance instanceof DirectChatDTO) {

			this.setMenuId(((DirectChatDTO)paramInstance).getMenuId());
			this.setUserId(((DirectChatDTO)paramInstance).getUserId());
			this.setUserLevel(((DirectChatDTO)paramInstance).getUserLevel());
			this.setWriteTime(((DirectChatDTO)paramInstance).getWriteTime());
			this.setSelectedCompareItem(((DirectChatDTO)paramInstance).getSelectedCompareItem());
			this.setContentsBody(((DirectChatDTO)paramInstance).getContentsBody());
			this.setHashTags(((DirectChatDTO)paramInstance).getHashTags());
			this.setLikeCount(((DirectChatDTO)paramInstance).getLikeCount());
			this.setHateCount(((DirectChatDTO)paramInstance).getHateCount());
			this.setHiddenYN(((DirectChatDTO)paramInstance).getHiddenYN());
			this.setReportYN(((DirectChatDTO)paramInstance).getReportYN());

		}
	}


	private MenuDTO menuDTO;

	@JsonBackReference
	@ManyToOne
	@JoinTable(
			name = "T_M_MENU_DIRECTCHAT",
			joinColumns = @JoinColumn(name = "DIRECTCHAT_CID"),
			inverseJoinColumns = @JoinColumn(name = "MENU_CID")
	)
	public MenuDTO getMenuDTO() {
		return menuDTO;
	}

	public void setMenuDTO(MenuDTO menuDTO) {
		this.menuDTO = menuDTO;
	}
}
