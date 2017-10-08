package egovframework.api.rivalWar.mappingItem.vo;

import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;
import org.hibernate.annotations.*;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;
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

    /*
	 * Extend Bean Field
	 */
    private Boolean copyBooleanValue;

    public MappingItemDTO() {
        super();
    }

    public MappingItemDTO(Boolean copyBooleanValue) {
        super();
        this.copyBooleanValue = copyBooleanValue;
    }

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

    @Override
    public <T extends JsTreeHibernateSearchDTO> void setFieldFromNewInstance(T paramInstance) {
        if (paramInstance instanceof MappingItemDTO) {

        }
    }
}
