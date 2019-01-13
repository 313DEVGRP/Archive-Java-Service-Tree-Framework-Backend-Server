package egovframework.api.web.menu.vo;

import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.*;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "T_COMPREHENSIVE_MENU")
@SelectBeforeUpdate(value = true)
@DynamicInsert(value = true)
@DynamicUpdate(value = true)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SequenceGenerator(name = "JsTreeSequence", sequenceName = "S_COMPREHENSIVE_MENU", allocationSize = 1)
public class MenuDTO extends JsTreeHibernateSearchDTO implements Serializable {

	private static final long serialVersionUID = 5641929581490357882L;

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

	private String c_link;

	@Column(name = "c_link")
	public String getC_link() {
		return c_link;
	}

	public void setC_link(String c_link) {
		this.c_link = c_link;
	}

	@Override
	public <T extends JsTreeHibernateSearchDTO> void setFieldFromNewInstance(T paramInstance) {
		if (paramInstance instanceof MenuDTO) {
			this.setC_link(((MenuDTO) paramInstance).getC_link());
		}
	}

}
