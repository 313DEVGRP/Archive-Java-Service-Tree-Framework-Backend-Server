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
package egovframework.api.arms.module_reqstatus.model;

import org.hibernate.annotations.*;
import org.hibernate.annotations.Cache;
import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateDTO;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;

@Entity
@Table(name = "T_ARMS_REQSTATUS")
@SelectBeforeUpdate(value=true)
@DynamicInsert(value=true)
@DynamicUpdate(value=true)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SequenceGenerator(name = "JsTreeSequence", sequenceName = "S_T_ARMS_REQSTATUS", allocationSize = 1)
public class ReqStatusDTO extends JsTreeHibernateSearchDTO implements Serializable {

    public ReqStatusDTO() {
        super();
    }

    public ReqStatusDTO(Boolean copyBooleanValue) {
        super();
        this.copyBooleanValue = copyBooleanValue;
    }

    //@Getter @Setter
    @Column(name = "c_pdservice_link")
    private Long c_pdservice_link;

    @Column(name = "c_pdservice_name")
    private String c_pdservice_name;


    @Column(name = "c_version_link")
    private Long c_version_link;

    @Column(name = "c_version_name")
    private String c_version_name;


    @Column(name = "c_jira_project_link")
    private Long c_jira_project_link;

    @Column(name = "c_jira_project_name")
    private String c_jira_project_name;

    @Column(name = "c_jira_project_key")
    private String c_jira_project_key;

    @Column(name = "c_jira_project_url")
    private String c_jira_project_url;


    @Column(name = "c_jira_version_link")
    private Long c_jira_version_link;

    @Column(name = "c_jira_version_name")
    private String c_jira_version_name;

    @Column(name = "c_jira_version_title")
    private String c_jira_version_title;

    @Column(name = "c_jira_version_url")
    private String c_jira_version_url;


    @Column(name = "c_req_link")
    private String c_req_link;

    @Column(name = "c_req_name")
    private String c_req_name;


    @Column(name = "c_jira_req_issue_link")
    private String c_jira_req_issue_link;

    @Column(name = "c_jira_req_issue_key")
    private String c_jira_req_issue_key;

    @Column(name = "c_jira_req_issue_id")
    private String c_jira_req_issue_id;


    @Column(name = "c_jira_req_priority_link")
    private Long c_jira_req_priority_link;

    @Column(name = "c_jira_req_priority_url")
    private String c_jira_req_priority_url;

    @Column(name = "c_jira_req_priority_name")
    private String c_jira_req_priority_name;


    @Column(name = "c_jira_req_status_link")
    private Long c_jira_req_status_link;

    @Column(name = "c_jira_req_status_url")
    private String c_jira_req_status_url;

    @Column(name = "c_jira_req_status_name")
    private String c_jira_req_status_name;


    @Lob
    @Column(name = "c_jira_req_linkingissue")
    private String c_jira_req_linkingissue;

    @Lob
    @Column(name = "c_jira_req_subtaskissue")
    private String c_jira_req_subtaskissue;

    public Long getC_pdservice_link() {
        return c_pdservice_link;
    }

    public void setC_pdservice_link(Long c_pdservice_link) {
        this.c_pdservice_link = c_pdservice_link;
    }

    public String getC_pdservice_name() {
        return c_pdservice_name;
    }

    public void setC_pdservice_name(String c_pdservice_name) {
        this.c_pdservice_name = c_pdservice_name;
    }

    public Long getC_version_link() {
        return c_version_link;
    }

    public void setC_version_link(Long c_version_link) {
        this.c_version_link = c_version_link;
    }

    public String getC_version_name() {
        return c_version_name;
    }

    public void setC_version_name(String c_version_name) {
        this.c_version_name = c_version_name;
    }

    public Long getC_jira_project_link() {
        return c_jira_project_link;
    }

    public void setC_jira_project_link(Long c_jira_project_link) {
        this.c_jira_project_link = c_jira_project_link;
    }

    public String getC_jira_project_name() {
        return c_jira_project_name;
    }

    public void setC_jira_project_name(String c_jira_project_name) {
        this.c_jira_project_name = c_jira_project_name;
    }

    public String getC_jira_project_key() {
        return c_jira_project_key;
    }

    public void setC_jira_project_key(String c_jira_project_key) {
        this.c_jira_project_key = c_jira_project_key;
    }

    public String getC_jira_project_url() {
        return c_jira_project_url;
    }

    public void setC_jira_project_url(String c_jira_project_url) {
        this.c_jira_project_url = c_jira_project_url;
    }

    public Long getC_jira_version_link() {
        return c_jira_version_link;
    }

    public void setC_jira_version_link(Long c_jira_version_link) {
        this.c_jira_version_link = c_jira_version_link;
    }

    public String getC_jira_version_name() {
        return c_jira_version_name;
    }

    public void setC_jira_version_name(String c_jira_version_name) {
        this.c_jira_version_name = c_jira_version_name;
    }

    public String getC_jira_version_title() {
        return c_jira_version_title;
    }

    public void setC_jira_version_title(String c_jira_version_title) {
        this.c_jira_version_title = c_jira_version_title;
    }

    public String getC_jira_version_url() {
        return c_jira_version_url;
    }

    public void setC_jira_version_url(String c_jira_version_url) {
        this.c_jira_version_url = c_jira_version_url;
    }

    public String getC_req_link() {
        return c_req_link;
    }

    public void setC_req_link(String c_req_link) {
        this.c_req_link = c_req_link;
    }

    public String getC_req_name() {
        return c_req_name;
    }

    public void setC_req_name(String c_req_name) {
        this.c_req_name = c_req_name;
    }

    public String getC_jira_req_issue_link() {
        return c_jira_req_issue_link;
    }

    public void setC_jira_req_issue_link(String c_jira_req_issue_link) {
        this.c_jira_req_issue_link = c_jira_req_issue_link;
    }

    public String getC_jira_req_issue_key() {
        return c_jira_req_issue_key;
    }

    public void setC_jira_req_issue_key(String c_jira_req_issue_key) {
        this.c_jira_req_issue_key = c_jira_req_issue_key;
    }

    public String getC_jira_req_issue_id() {
        return c_jira_req_issue_id;
    }

    public void setC_jira_req_issue_id(String c_jira_req_issue_id) {
        this.c_jira_req_issue_id = c_jira_req_issue_id;
    }

    public Long getC_jira_req_priority_link() {
        return c_jira_req_priority_link;
    }

    public void setC_jira_req_priority_link(Long c_jira_req_priority_link) {
        this.c_jira_req_priority_link = c_jira_req_priority_link;
    }

    public String getC_jira_req_priority_url() {
        return c_jira_req_priority_url;
    }

    public void setC_jira_req_priority_url(String c_jira_req_priority_url) {
        this.c_jira_req_priority_url = c_jira_req_priority_url;
    }

    public String getC_jira_req_priority_name() {
        return c_jira_req_priority_name;
    }

    public void setC_jira_req_priority_name(String c_jira_req_priority_name) {
        this.c_jira_req_priority_name = c_jira_req_priority_name;
    }

    public Long getC_jira_req_status_link() {
        return c_jira_req_status_link;
    }

    public void setC_jira_req_status_link(Long c_jira_req_status_link) {
        this.c_jira_req_status_link = c_jira_req_status_link;
    }

    public String getC_jira_req_status_url() {
        return c_jira_req_status_url;
    }

    public void setC_jira_req_status_url(String c_jira_req_status_url) {
        this.c_jira_req_status_url = c_jira_req_status_url;
    }

    public String getC_jira_req_status_name() {
        return c_jira_req_status_name;
    }

    public void setC_jira_req_status_name(String c_jira_req_status_name) {
        this.c_jira_req_status_name = c_jira_req_status_name;
    }

    public String getC_jira_req_linkingissue() {
        return c_jira_req_linkingissue;
    }

    public void setC_jira_req_linkingissue(String c_jira_req_linkingissue) {
        this.c_jira_req_linkingissue = c_jira_req_linkingissue;
    }

    public String getC_jira_req_subtaskissue() {
        return c_jira_req_subtaskissue;
    }

    public void setC_jira_req_subtaskissue(String c_jira_req_subtaskissue) {
        this.c_jira_req_subtaskissue = c_jira_req_subtaskissue;
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
