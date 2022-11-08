/*
 * @author Dongmin.lee
 * @since 2022-11-08
 * @version 22.11.08
 * @see <pre>
 *  Copyright (C) 2007 by 313 DEV GRP, Inc - All Rights Reserved
 *  Unauthorized copying of this file, via any medium is strictly prohibited
 *  Proprietary and confidential
 *  Written by 313 developer group <313@313.co.kr>, December 2010
 * </pre>
 */
package egovframework.api.arms.module_pdserviceconnect.model;

import org.hibernate.annotations.*;
import org.hibernate.annotations.Cache;
import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateDTO;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;

@Entity
@Table(name = "T_ARMS_PDSERVICECONNECT")
@SelectBeforeUpdate(value=true)
@DynamicInsert(value=true)
@DynamicUpdate(value=true)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SequenceGenerator(name = "JsTreeSequence", sequenceName = "S_ARMS_PDSERVICECONNECT", allocationSize = 1)
public class PdServiceConnectDTO extends JsTreeHibernateSearchDTO implements Serializable {

    public PdServiceConnectDTO() {
        super();
    }

    public PdServiceConnectDTO(Boolean copyBooleanValue) {
        super();
        this.copyBooleanValue = copyBooleanValue;
    }

    //@Getter @Setter
    private String c_contents;

    @Lob
    @Column(name="C_CONTENTS")
    public String getC_contents() {
        return c_contents;
    }

    public void setC_contents(String c_contents) {
        this.c_contents = c_contents;
    }

    private String c_pdservice_id;
    private String c_pdservice_version_id;
    private String c_pdservice_jira_ids;

    @Column(name="C_PDSERVICE_ID")
    public String getC_pdservice_id() {
        return c_pdservice_id;
    }

    public void setC_pdservice_id(String c_pdservice_id) {
        this.c_pdservice_id = c_pdservice_id;
    }

    @Column(name="C_PDSERVICE_VERSION_ID")
    public String getC_pdservice_version_id() {
        return c_pdservice_version_id;
    }

    public void setC_pdservice_version_id(String c_pdservice_version_id) {
        this.c_pdservice_version_id = c_pdservice_version_id;
    }

    @Column(name="C_PDSERVICE_JIRA_IDS")
    public String getC_pdservice_jira_ids() {
        return c_pdservice_jira_ids;
    }

    public void setC_pdservice_jira_ids(String c_pdservice_jira_ids) {
        this.c_pdservice_jira_ids = c_pdservice_jira_ids;
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
