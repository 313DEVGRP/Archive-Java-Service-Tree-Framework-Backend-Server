package egovframework.rivalwar.api.menu.vo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.SelectBeforeUpdate;

import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;

@Entity
@Table(name = "T_JSTREE_MENU", schema = "STANDARD_DB")
@SelectBeforeUpdate(value = true)
@DynamicInsert(value = true)
@DynamicUpdate(value = true)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SequenceGenerator(name = "JsTreeSequence", sequenceName = "STANDARD_DB.S_JSTREE_MENU", allocationSize = 1)
public class MenuDTO extends JsTreeHibernateSearchDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5641929581490357881L;

	public MenuDTO() {
		super();
	}

	public MenuDTO(Boolean copyBooleanValue) {
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

	private String c_vote_start_date;
	private String c_vote_end_date;

	@Column(name = "c_vote_start_date")
	public String getC_vote_start_date() {
		return c_vote_start_date;
	}

	public void setC_vote_start_date(String c_vote_start_date) {
		this.c_vote_start_date = c_vote_start_date;
	}

	@Column(name = "c_vote_end_date")
	public String getC_vote_end_date() {
		return c_vote_end_date;
	}

	public void setC_vote_end_date(String c_vote_end_date) {
		this.c_vote_end_date = c_vote_end_date;
	}

	@Override
	public <T extends JsTreeHibernateSearchDTO> void setFieldFromNewInstance(T paramInstance) {
		if (paramInstance instanceof MenuDTO) {
			this.setC_vote_start_date(this.getC_vote_start_date());
			this.setC_vote_end_date(this.getC_vote_end_date());
		}
	}

}
