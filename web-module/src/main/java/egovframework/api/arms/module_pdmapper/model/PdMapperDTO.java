/*
 * @author Dongmin.lee
 * @since 2022-06-19
 * @version 22.06.19
 * @see <pre>
 *  Copyright (C) 2007 by 313 DEV GRP, Inc - All Rights Reserved
 *  Unauthorized copying of this file, via any medium is strictly prohibited
 *  Proprietary and confidential
 *  Written by 313 developer group <313@313.co.kr>, December 2010
 * </pre>
 */
package egovframework.api.arms.module_pdmapper.model;

import org.hibernate.annotations.*;
import org.hibernate.annotations.Cache;
import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateDTO;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;

@Entity
@Table(name = "T_ARMS_PDMAPPER")
@SelectBeforeUpdate(value=true)
@DynamicInsert(value=true)
@DynamicUpdate(value=true)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SequenceGenerator(name = "JsTreeSequence", sequenceName = "S_ARMS_PDMAPPER", allocationSize = 1)
public class PdMapperDTO extends JsTreeHibernateSearchDTO implements Serializable {

	private static final long serialVersionUID = 1L;

    public PdMapperDTO() {
        super();
    }

    public PdMapperDTO(Boolean copyBooleanValue) {
        super();
        this.copyBooleanValue = copyBooleanValue;
    }

    //@Getter @Setter
    @Column(name = "c_pdname")
    String c_pdname;
    @Column(name = "c_pdversion")
    String c_pdversion;
    @Column(name = "c_pdjira")
    String c_pdjira;

    public String getC_pdname() {
        return c_pdname;
    }

    public void setC_pdname(String c_pdname) {
        this.c_pdname = c_pdname;
    }

    public String getC_pdversion() {
        return c_pdversion;
    }

    public void setC_pdversion(String c_pdversion) {
        this.c_pdversion = c_pdversion;
    }

    public String getC_pdjira() {
        return c_pdjira;
    }

    public void setC_pdjira(String c_pdjira) {
        this.c_pdjira = c_pdjira;
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
