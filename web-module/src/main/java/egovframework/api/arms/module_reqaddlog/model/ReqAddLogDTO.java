/*
 * @author Dongmin.lee
 * @since 2022-11-19
 * @version 22.11.19
 * @see <pre>
 *  Copyright (C) 2007 by 313 DEV GRP, Inc - All Rights Reserved
 *  Unauthorized copying of this file, via any medium is strictly prohibited
 *  Proprietary and confidential
 *  Written by 313 developer group <313@313.co.kr>, December 2010
 * </pre>
 */
package egovframework.api.arms.module_reqaddlog.model;

import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateDTO;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateLogDTO;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.*;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "T_ARMS_REQADD_LOG")
@SelectBeforeUpdate(value=true)
@DynamicInsert(value=true)
@DynamicUpdate(value=true)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SequenceGenerator(name = "JsTreeSequence", sequenceName = "S_T_ARMS_REQADD_LOG", allocationSize = 1)
public class ReqAddLogDTO extends JsTreeHibernateLogDTO implements Serializable {

    public ReqAddLogDTO() {
        super();
    }

    public ReqAddLogDTO(Boolean copyBooleanValue) {
        super();
        this.copyBooleanValue = copyBooleanValue;
    }

    //@Getter @Setter
    @Column(name="c_pdservice_link")
    private Long c_pdservice_link;

    @Column(name="c_version_link")
    private String c_version_link;

    @Column(name="c_jira_link")
    private String c_jira_link;

    @Column(name="c_issue_link")
    private String c_issue_link;

    @Column(name="c_reviewer01")
    private String c_reviewer01;

    @Column(name="c_reviewer02")
    private String c_reviewer02;

    @Column(name="c_reviewer03")
    private String c_reviewer03;

    @Column(name="c_reviewer04")
    private String c_reviewer04;

    @Column(name="c_reviewer05")
    private String c_reviewer05;

    @Column(name="c_reviewer01_status")
    private String c_reviewer01_status;

    @Column(name="c_reviewer02_status")
    private String c_reviewer02_status;

    @Column(name="c_reviewer03_status")
    private String c_reviewer03_status;

    @Column(name="c_reviewer04_status")
    private String c_reviewer04_status;

    @Column(name="c_reviewer05_status")
    private String c_reviewer05_status;

    @Column(name="c_writer")
    private String c_writer;

    @Column(name="c_writer_date")
    private String c_writer_date;

    @Column(name="c_priority")
    private Long c_priority;

    @Column(name="c_req_status")
    private String c_req_status;

    // 요구사항 제목은 c_title 로.
    @Lob
    @Column(name="c_contents")
    private String c_contents;

    public Long getC_pdservice_link() {
        return c_pdservice_link;
    }

    public void setC_pdservice_link(Long c_pdservice_link) {
        this.c_pdservice_link = c_pdservice_link;
    }

    public String getC_version_link() {
        return c_version_link;
    }

    public void setC_version_link(String c_version_link) {
        this.c_version_link = c_version_link;
    }

    public String getC_jira_link() {
        return c_jira_link;
    }

    public void setC_jira_link(String c_jira_link) {
        this.c_jira_link = c_jira_link;
    }

    public String getC_issue_link() {
        return c_issue_link;
    }

    public void setC_issue_link(String c_issue_link) {
        this.c_issue_link = c_issue_link;
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

    public Long getC_priority() {
        return c_priority;
    }

    public void setC_priority(Long c_priority) {
        this.c_priority = c_priority;
    }

    public String getC_req_status() {
        return c_req_status;
    }

    public void setC_req_status(String c_req_status) {
        this.c_req_status = c_req_status;
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



