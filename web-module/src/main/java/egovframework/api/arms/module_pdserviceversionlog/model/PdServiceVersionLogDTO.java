/*
 * @author Dongmin.lee
 * @since 2022-11-20
 * @version 22.11.20
 * @see <pre>
 *  Copyright (C) 2007 by 313 DEV GRP, Inc - All Rights Reserved
 *  Unauthorized copying of this file, via any medium is strictly prohibited
 *  Proprietary and confidential
 *  Written by 313 developer group <313@313.co.kr>, December 2010
 * </pre>
 */
package egovframework.api.arms.module_pdserviceversionlog.model;

import org.hibernate.annotations.*;
import org.hibernate.annotations.Cache;
import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateDTO;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;

@Entity
@Table(name = "T_ARMS_PDVERSION_LOG")
@SelectBeforeUpdate(value=true)
@DynamicInsert(value=true)
@DynamicUpdate(value=true)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SequenceGenerator(name = "JsTreeSequence", sequenceName = "S_T_ARMS_PDVERSION_LOG", allocationSize = 1)
public class PdServiceVersionLogDTO extends JsTreeHibernateSearchDTO implements Serializable {

    public PdServiceVersionLogDTO() {
        super();
    }

    public PdServiceVersionLogDTO(Boolean copyBooleanValue) {
        super();
        this.copyBooleanValue = copyBooleanValue;
    }

    //@Getter @Setter
    @Column(name="c_method")
    private String c_method;

    @Column(name="c_state")
    private String c_state;

    @Column(name="c_date")
    private Date c_date;

    @Column(name = "c_start_date")
    private String c_start_date;

    @Column(name = "c_end_date")
    private String c_end_date;

    @Column(name = "c_pdservice_link")
    private String c_pdservice_link;

    @Lob
    @Column(name="c_contents")
    private String c_contents;

    public String getC_method() {
        return c_method;
    }

    public void setC_method(String c_method) {
        this.c_method = c_method;
    }

    public String getC_state() {
        return c_state;
    }

    public void setC_state(String c_state) {
        this.c_state = c_state;
    }

    public Date getC_date() {
        return c_date;
    }

    public void setC_date(Date c_date) {
        this.c_date = c_date;
    }

    public String getC_start_date() {
        return c_start_date;
    }

    public void setC_start_date(String c_start_date) {
        this.c_start_date = c_start_date;
    }

    public String getC_end_date() {
        return c_end_date;
    }

    public void setC_end_date(String c_end_date) {
        this.c_end_date = c_end_date;
    }

    public String getC_pdservice_link() {
        return c_pdservice_link;
    }

    public void setC_pdservice_link(String c_pdservice_link) {
        this.c_pdservice_link = c_pdservice_link;
    }

    public String getC_contents() {
        return c_contents;
    }

    public void setC_contents(String c_contents) {
        this.c_contents = c_contents;
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
