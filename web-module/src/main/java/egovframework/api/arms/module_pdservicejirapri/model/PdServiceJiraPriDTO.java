/*
 * @author Dongmin.lee
 * @since 2022-12-03
 * @version 22.12.03
 * @see <pre>
 *  Copyright (C) 2007 by 313 DEV GRP, Inc - All Rights Reserved
 *  Unauthorized copying of this file, via any medium is strictly prohibited
 *  Proprietary and confidential
 *  Written by 313 developer group <313@313.co.kr>, December 2010
 * </pre>
 */
package egovframework.api.arms.module_pdservicejirapri.model;

import org.hibernate.annotations.*;
import org.hibernate.annotations.Cache;
import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateDTO;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;

@Entity
@Table(name = "T_ARMS_PDSERVICEJIRAPRI")
@SelectBeforeUpdate(value=true)
@DynamicInsert(value=true)
@DynamicUpdate(value=true)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SequenceGenerator(name = "JsTreeSequence", sequenceName = "S_T_ARMS_PDSERVICEJIRAPRI", allocationSize = 1)
public class PdServiceJiraPriDTO extends JsTreeHibernateSearchDTO implements Serializable {

    public PdServiceJiraPriDTO() {
        super();
    }

    public PdServiceJiraPriDTO(Boolean copyBooleanValue) {
        super();
        this.copyBooleanValue = copyBooleanValue;
    }

    //@Getter @Setter
    @Column(name="c_jirapriority_id")
    private String c_jirapriority_id;

    @Column(name="c_jirapriority_desc")
    private String c_jirapriority_desc;

    @Column(name="c_jirapriority_name")
    private String c_jirapriority_name;

    @Column(name="c_jirapriority_link")
    private String c_jirapriority_link;

    public String getC_jirapriority_id() {
        return c_jirapriority_id;
    }

    public void setC_jirapriority_id(String c_jirapriority_id) {
        this.c_jirapriority_id = c_jirapriority_id;
    }

    public String getC_jirapriority_desc() {
        return c_jirapriority_desc;
    }

    public void setC_jirapriority_desc(String c_jirapriority_desc) {
        this.c_jirapriority_desc = c_jirapriority_desc;
    }

    public String getC_jirapriority_name() {
        return c_jirapriority_name;
    }

    public void setC_jirapriority_name(String c_jirapriority_name) {
        this.c_jirapriority_name = c_jirapriority_name;
    }

    public String getC_jirapriority_link() {
        return c_jirapriority_link;
    }

    public void setC_jirapriority_link(String c_jirapriority_link) {
        this.c_jirapriority_link = c_jirapriority_link;
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

    @Override
    public <T extends JsTreeHibernateSearchDTO> void setFieldFromNewInstance(T paramInstance) {
        if( paramInstance instanceof JsTreeHibernateDTO){
            if(paramInstance.isCopied()) {
                this.setC_title("copy_" + this.getC_title());
            }
        }
    }
}
