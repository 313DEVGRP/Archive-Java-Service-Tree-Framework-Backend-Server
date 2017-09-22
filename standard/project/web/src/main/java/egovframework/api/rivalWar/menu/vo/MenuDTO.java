package egovframework.api.rivalWar.menu.vo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import egovframework.api.rivalWar.aggregateResult.vo.AggregateResultDTO;
import egovframework.api.rivalWar.compareInfo.vo.CompareInfoDTO;
import egovframework.api.rivalWar.compareSpec.vo.CompareSpecDTO;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.*;

import javax.persistence.*;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "T_JSTREE_MENU")
@SelectBeforeUpdate(value = true)
@DynamicInsert(value = true)
@DynamicUpdate(value = true)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SequenceGenerator(name = "JsTreeSequence", sequenceName = "S_JSTREE_MENU", allocationSize = 1)
public class MenuDTO extends JsTreeHibernateSearchDTO implements Serializable {

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
			this.setC_vote_start_date(((MenuDTO) paramInstance).getC_vote_start_date());
			this.setC_vote_end_date(((MenuDTO) paramInstance).getC_vote_end_date());
		}
	}

	private AggregateResultDTO aggregateResultDTO;

	@JsonIgnore
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "AGGREGATE_RESULT_ID")
	public AggregateResultDTO getAggregateResultDTO() {
		return aggregateResultDTO;
	}

	public void setAggregateResultDTO(AggregateResultDTO aggregateResultDTO) {
		this.aggregateResultDTO = aggregateResultDTO;
	}

	private CompareInfoDTO compareInfoDTO;

	@JsonIgnore
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "COMPARE_INFO_ID")
	public CompareInfoDTO getCompareInfoDTO() {
		return compareInfoDTO;
	}

	public void setCompareInfoDTO(CompareInfoDTO compareInfoDTO) {
		this.compareInfoDTO = compareInfoDTO;
	}

	private CompareSpecDTO compareSpecDTO;

	@JsonIgnore
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "COMPARE_SPEC_ID")
	public CompareSpecDTO getCompareSpecDTO() {
		return compareSpecDTO;
	}

	public void setCompareSpecDTO(CompareSpecDTO compareSpecDTO) {
		this.compareSpecDTO = compareSpecDTO;
	}
}
