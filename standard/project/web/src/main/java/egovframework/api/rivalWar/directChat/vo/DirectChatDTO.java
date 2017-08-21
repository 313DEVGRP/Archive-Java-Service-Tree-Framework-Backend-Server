package egovframework.api.rivalWar.directChat.vo;

import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.*;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "T_JSTREE_DIRECTCHAT")
@SelectBeforeUpdate(value = true)
@DynamicInsert(value = true)
@DynamicUpdate(value = true)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SequenceGenerator(name = "JsTreeSequence", sequenceName = "S_JSTREE_DIRECTCHAT", allocationSize = 1)
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

	private Long c_userid;
	private String c_time;
	private Long c_likecount;
	private Long c_hatecount;
	private Long c_camp;

	@Column(name = "C_USERID")
	public Long getC_userid() {
		return c_userid;
	}

	public void setC_userid(Long c_userid) {
		this.c_userid = c_userid;
	}

	@Column(name = "C_TIME")
	public String getC_time() {
		return c_time;
	}

	public void setC_time(String c_time) {
		this.c_time = c_time;
	}

	@Column(name = "C_LIKECOUNT")
	public Long getC_likecount() {
		return c_likecount;
	}

	public void setC_likecount(Long c_likecount) {
		this.c_likecount = c_likecount;
	}

	@Column(name = "C_HATECOUNT")
	public Long getC_hatecount() {
		return c_hatecount;
	}

	public void setC_hatecount(Long c_hatecount) {
		this.c_hatecount = c_hatecount;
	}

	@Column(name = "C_CAMP")
	public Long getC_camp() {
		return c_camp;
	}

	public void setC_camp(Long c_camp) {
		this.c_camp = c_camp;
	}

	@Override
	public <T extends JsTreeHibernateSearchDTO> void setFieldFromNewInstance(T paramInstance) {
		if (paramInstance instanceof DirectChatDTO) {
			this.setC_userid(this.getC_userid());
			this.setC_time(this.getC_time());
			this.setC_likecount(this.getC_likecount());
			this.setC_hatecount(this.getC_hatecount());
			this.setC_camp(this.getC_camp());
		}
	}

}
