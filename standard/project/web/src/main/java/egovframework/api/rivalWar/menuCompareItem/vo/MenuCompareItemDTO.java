package egovframework.api.rivalWar.menuCompareItem.vo;

import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.*;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * Created by Administrator on 2017-10-23.
 */
@Entity
@Table(name = "T_M_MENU_COMPAREITEM")
@SelectBeforeUpdate(value = true)
@DynamicInsert(value = true)
@DynamicUpdate(value = true)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SequenceGenerator(name = "JsTreeSequence", sequenceName = "S_M_MENU_COMPAREITEM", allocationSize = 1)
public class MenuCompareItemDTO extends JsTreeHibernateSearchDTO implements Serializable {

    private static final long serialVersionUID = 4641920581390357332L;

    public MenuCompareItemDTO() {
        super();
    }

    public MenuCompareItemDTO(Boolean copyBooleanValue) {
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

    private Long menuCID;
    @Column(name = "MENU_CID")
    public Long getMenuCID() {
        return menuCID;
    }

    public void setMenuCID(Long menuCID) {
        this.menuCID = menuCID;
    }

    private Long compardItemCID;
    @Column(name = "COMPAREITEM_CID")
    public Long getCompardItemCID() {
        return compardItemCID;
    }

    public void setCompardItemCID(Long compardItemCID) {
        this.compardItemCID = compardItemCID;
    }

    @Override
    public <T extends JsTreeHibernateSearchDTO> void setFieldFromNewInstance(T paramInstance) {
        if (paramInstance instanceof MenuCompareItemDTO) {

        }
    }

}
