package egovframework.api.rivalWar.mappingItem.vo;

import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;
import org.hibernate.annotations.*;
import org.hibernate.annotations.Cache;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * Created by Administrator on 2017-10-06.
 */
@Entity
@Table(name = "T_JSTREE_MAPPING_ITEM")
@SelectBeforeUpdate(value = true)
@DynamicInsert(value = true)
@DynamicUpdate(value = true)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SequenceGenerator(name = "JsTreeSequence", sequenceName = "S_JSTREE_MAPPING_ITEM", allocationSize = 1)
public class MappingItemDTO extends JsTreeHibernateSearchDTO implements Serializable {

    private static final long serialVersionUID = -2826589626313340365L;

    public MappingItemDTO() {
        super();
    }

    public MappingItemDTO(Boolean copyBooleanValue) {
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

    private Number mappingMenuId;
    private String mappingItemName;

    @Column(name = "mapping_menu_id")
    public Number getMappingMenuId() {
        return mappingMenuId;
    }

    public void setMappingMenuId(Number mappingMenuId) {
        this.mappingMenuId = mappingMenuId;
    }

    @Column(name = "mapping_item_name")
    public String getMappingItemName() {
        return mappingItemName;
    }

    public void setMappingItemName(String mappingItemName) {
        this.mappingItemName = mappingItemName;
    }

    @Override
    public <T extends JsTreeHibernateSearchDTO> void setFieldFromNewInstance(T paramInstance) {
        if (paramInstance instanceof MappingItemDTO) {

        }
    }
}
