/*
 * @author Dongmin.lee
 * @since 2022-11-09
 * @version 22.11.09
 * @see <pre>
 *  Copyright (C) 2007 by 313 DEV GRP, Inc - All Rights Reserved
 *  Unauthorized copying of this file, via any medium is strictly prohibited
 *  Proprietary and confidential
 *  Written by 313 developer group <313@313.co.kr>, December 2010
 * </pre>
 */
package egovframework.api.arms.module_reqadd.model;

import org.hibernate.annotations.*;
import org.hibernate.annotations.Cache;
import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateDTO;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;

@Entity
@Table(name = "T_ARMS_REQADD")
@SelectBeforeUpdate(value=true)
@DynamicInsert(value=true)
@DynamicUpdate(value=true)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SequenceGenerator(name = "JsTreeSequence", sequenceName = "S_T_ARMS_REQADD", allocationSize = 1)
public class ReqAddDTO extends JsTreeHibernateSearchDTO implements Serializable {

    public ReqAddDTO() {
        super();
    }

    public ReqAddDTO(Boolean copyBooleanValue) {
        super();
        this.copyBooleanValue = copyBooleanValue;
    }

    //@Getter @Setter

    @Column(name = "c_pdservice_link")
    private Long c_pdservice_link;

    @Column(name = "c_pdservice_name")
    private String c_pdservice_name;

    @Column(name = "c_version_link")
    private String c_version_link;

    @Column(name = "c_version_name")
    private String c_version_name;

    @Column(name = "c_jira_project_link")
    private String c_jira_project_link;

    @Column(name = "c_jira_project_name")
    private String c_jira_project_name;

    @Column(name = "c_jira_version_link")
    private String c_jira_version_link;

    @Column(name = "c_jira_version_name")
    private String c_jira_version_name;

    @Column(name = "c_jira_req_issue_link")
    private String c_jira_req_issue_link;

    @Column(name = "c_jira_req_issue_key")
    private String c_jira_req_issue_key;

    @Column(name = "c_jira_req_priority_link")
    private Long c_jira_req_priority_link;

    @Column(name = "c_jira_req_priority_name")
    private String c_jira_req_priority_name;

    @Column(name = "c_jira_req_status_link")
    private Long c_jira_req_status_link;

    @Column(name = "c_jira_req_status_name")
    private String c_jira_req_status_name;

    @Column(name = "c_jira_req_linkingissue")
    private String c_jira_req_linkingissue;

    @Column(name = "c_jira_req_subtaskissue")
    private String c_jira_req_subtaskissue;

    @Column(name = "c_reviewer01")
    private String c_reviewer01;

    @Column(name = "c_reviewer02")
    private String c_reviewer02;

    @Column(name = "c_reviewer03")
    private String c_reviewer03;

    @Column(name = "c_reviewer04")
    private String c_reviewer04;

    @Column(name = "c_reviewer05")
    private String c_reviewer05;

    @Column(name = "c_reviewer01_status")
    private String c_reviewer01_status;

    @Column(name = "c_reviewer02_status")
    private String c_reviewer02_status;

    @Column(name = "c_reviewer03_status")
    private String c_reviewer03_status;

    @Column(name = "c_reviewer04_status")
    private String c_reviewer04_status;

    @Column(name = "c_reviewer05_status")
    private String c_reviewer05_status;

    @Column(name = "c_writer")
    private String c_writer;

    @Column(name = "c_writer_date")
    private String c_writer_date;

    @Lob
    @Column(name = "c_contents")
    private String c_contents;

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

    public String getC_version_link() {
        return c_version_link;
    }

    public void setC_version_link(String c_version_link) {
        this.c_version_link = c_version_link;
    }

    public String getC_version_name() {
        return c_version_name;
    }

    public void setC_version_name(String c_version_name) {
        this.c_version_name = c_version_name;
    }

    public String getC_jira_project_link() {
        return c_jira_project_link;
    }

    public void setC_jira_project_link(String c_jira_project_link) {
        this.c_jira_project_link = c_jira_project_link;
    }

    public String getC_jira_project_name() {
        return c_jira_project_name;
    }

    public void setC_jira_project_name(String c_jira_project_name) {
        this.c_jira_project_name = c_jira_project_name;
    }

    public String getC_jira_version_link() {
        return c_jira_version_link;
    }

    public void setC_jira_version_link(String c_jira_version_link) {
        this.c_jira_version_link = c_jira_version_link;
    }

    public String getC_jira_version_name() {
        return c_jira_version_name;
    }

    public void setC_jira_version_name(String c_jira_version_name) {
        this.c_jira_version_name = c_jira_version_name;
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

    public Long getC_jira_req_priority_link() {
        return c_jira_req_priority_link;
    }

    public void setC_jira_req_priority_link(Long c_jira_req_priority_link) {
        this.c_jira_req_priority_link = c_jira_req_priority_link;
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

    public String getC_reviewer01() {
        return c_reviewer01;
    }

    public void setC_reviewer01(String c_reviewer01) {
        this.c_reviewer01 = c_reviewer01;
    }

    public String getC_reviewer02() {
        return c_reviewer02;
    }

    public void setC_reviewer02(String c_reviewer02) {
        this.c_reviewer02 = c_reviewer02;
    }

    public String getC_reviewer03() {
        return c_reviewer03;
    }

    public void setC_reviewer03(String c_reviewer03) {
        this.c_reviewer03 = c_reviewer03;
    }

    public String getC_reviewer04() {
        return c_reviewer04;
    }

    public void setC_reviewer04(String c_reviewer04) {
        this.c_reviewer04 = c_reviewer04;
    }

    public String getC_reviewer05() {
        return c_reviewer05;
    }

    public void setC_reviewer05(String c_reviewer05) {
        this.c_reviewer05 = c_reviewer05;
    }

    public String getC_reviewer01_status() {
        return c_reviewer01_status;
    }

    public void setC_reviewer01_status(String c_reviewer01_status) {
        this.c_reviewer01_status = c_reviewer01_status;
    }

    public String getC_reviewer02_status() {
        return c_reviewer02_status;
    }

    public void setC_reviewer02_status(String c_reviewer02_status) {
        this.c_reviewer02_status = c_reviewer02_status;
    }

    public String getC_reviewer03_status() {
        return c_reviewer03_status;
    }

    public void setC_reviewer03_status(String c_reviewer03_status) {
        this.c_reviewer03_status = c_reviewer03_status;
    }

    public String getC_reviewer04_status() {
        return c_reviewer04_status;
    }

    public void setC_reviewer04_status(String c_reviewer04_status) {
        this.c_reviewer04_status = c_reviewer04_status;
    }

    public String getC_reviewer05_status() {
        return c_reviewer05_status;
    }

    public void setC_reviewer05_status(String c_reviewer05_status) {
        this.c_reviewer05_status = c_reviewer05_status;
    }

    public String getC_writer() {
        return c_writer;
    }

    public void setC_writer(String c_writer) {
        this.c_writer = c_writer;
    }

    public String getC_writer_date() {
        return c_writer_date;
    }

    public void setC_writer_date(String c_writer_date) {
        this.c_writer_date = c_writer_date;
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
