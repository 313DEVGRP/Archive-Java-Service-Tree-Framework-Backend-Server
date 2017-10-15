package egovframework.api.rivalWar.directChat.vo;

import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.*;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "T_JSTREE_DIRECT_CHAT")
@SelectBeforeUpdate(value = true)
@DynamicInsert(value = true)
@DynamicUpdate(value = true)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SequenceGenerator(name = "JsTreeSequence", sequenceName = "S_JSTREE_DIRECT_CHAT", allocationSize = 1)
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
	private String 	userId;					//글쓴 사용자 아이디 ( springsecurity )

	private String 	writeTime;				//글쓴시간
	private Long 	selectedCompareItem;	//글쓴이 선택 진영 ( usermappingitem )
	private String 	contents; 				//글내용
	private String  hashtag;				//글해시태그

	private Long 	likeCount;				//좋아요 카운트
	private Long 	hateCount;				//싫어요 카운트
	private String 	hiddenYN;				//글 보이기 감추기 여부
	private String 	reportYN;				//신고여부


	@Override
	public <T extends JsTreeHibernateSearchDTO> void setFieldFromNewInstance(T paramInstance) {
		if (paramInstance instanceof DirectChatDTO) {
		}
	}

}
