/*
 * @author Dongmin.lee
 * @since 2022-12-02
 * @version 22.12.02
 * @see <pre>
 *  Copyright (C) 2007 by 313 DEV GRP, Inc - All Rights Reserved
 *  Unauthorized copying of this file, via any medium is strictly prohibited
 *  Proprietary and confidential
 *  Written by 313 developer group <313@313.co.kr>, December 2010
 * </pre>
 */
package egovframework.api.arms.module_pdservicejiraver.model;

import org.hibernate.annotations.*;
import org.hibernate.annotations.Cache;
import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateDTO;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;

@Entity
@Table(name = "T_ARMS_PDSERVICEJIRAVER")
@SelectBeforeUpdate(value=true)
@DynamicInsert(value=true)
@DynamicUpdate(value=true)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SequenceGenerator(name = "JsTreeSequence", sequenceName = "S_T_ARMS_PDSERVICEJIRAVER", allocationSize = 1)
public class PdServiceJiraVerDTO extends JsTreeHibernateSearchDTO implements Serializable {

    public PdServiceJiraVerDTO() {
        super();
    }

    public PdServiceJiraVerDTO(Boolean copyBooleanValue) {
        super();
        this.copyBooleanValue = copyBooleanValue;
    }

    //@Getter @Setter
    @Column(name="c_pdservice_id")
    private String c_pdservice_id;

    @Column(name="c_pdservice_version_id")
    private String c_pdservice_version_id;

    @Column(name="c_pdservice_jira_id")
    private String c_pdservice_jira_id;

    @Column(name="c_jiraversion_name")
    private String c_jiraversion_name;

    @Column(name="c_jiraversion_id")
    private String c_jiraversion_id;

    @Column(name="c_jiraversion_desc")
    private String c_jiraversion_desc;

    @Column(name="c_jiraversion_releasedate")
    private String c_jiraversion_releasedate;

    @Column(name="c_jiraversion_link")
    private String c_jiraversion_link;

    public String getC_pdservice_id() {
        return c_pdservice_id;
    }

    public void setC_pdservice_id(String c_pdservice_id) {
        this.c_pdservice_id = c_pdservice_id;
    }

    public String getC_pdservice_version_id() {
        return c_pdservice_version_id;
    }

    public void setC_pdservice_version_id(String c_pdservice_version_id) {
        this.c_pdservice_version_id = c_pdservice_version_id;
    }

    public String getC_pdservice_jira_id() {
        return c_pdservice_jira_id;
    }

    public void setC_pdservice_jira_id(String c_pdservice_jira_id) {
        this.c_pdservice_jira_id = c_pdservice_jira_id;
    }

    public String getC_jiraversion_name() {
        return c_jiraversion_name;
    }

    public void setC_jiraversion_name(String c_jiraversion_name) {
        this.c_jiraversion_name = c_jiraversion_name;
    }

    public String getC_jiraversion_id() {
        return c_jiraversion_id;
    }

    public void setC_jiraversion_id(String c_jiraversion_id) {
        this.c_jiraversion_id = c_jiraversion_id;
    }

    public String getC_jiraversion_desc() {
        return c_jiraversion_desc;
    }

    public void setC_jiraversion_desc(String c_jiraversion_desc) {
        this.c_jiraversion_desc = c_jiraversion_desc;
    }

    public String getC_jiraversion_releasedate() {
        return c_jiraversion_releasedate;
    }

    public void setC_jiraversion_releasedate(String c_jiraversion_releasedate) {
        this.c_jiraversion_releasedate = c_jiraversion_releasedate;
    }

    public String getC_jiraversion_link() {
        return c_jiraversion_link;
    }

    public void setC_jiraversion_link(String c_jiraversion_link) {
        this.c_jiraversion_link = c_jiraversion_link;
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
