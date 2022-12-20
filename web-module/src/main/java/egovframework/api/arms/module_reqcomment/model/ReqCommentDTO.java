/*
 * @author Dongmin.lee
 * @since 2022-12-20
 * @version 22.12.20
 * @see <pre>
 *  Copyright (C) 2007 by 313 DEV GRP, Inc - All Rights Reserved
 *  Unauthorized copying of this file, via any medium is strictly prohibited
 *  Proprietary and confidential
 *  Written by 313 developer group <313@313.co.kr>, December 2010
 * </pre>
 */
package egovframework.api.arms.module_reqcomment.model;

import org.hibernate.annotations.*;
import org.hibernate.annotations.Cache;
import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateDTO;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;

@Entity
@Table(name = "T_ARMS_REQCOMMENT")
@SelectBeforeUpdate(value=true)
@DynamicInsert(value=true)
@DynamicUpdate(value=true)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SequenceGenerator(name = "JsTreeSequence", sequenceName = "S_T_ARMS_REQCOMMENT", allocationSize = 1)
public class ReqCommentDTO extends JsTreeHibernateSearchDTO implements Serializable {

    public ReqCommentDTO() {
        super();
    }

    public ReqCommentDTO(Boolean copyBooleanValue) {
        super();
        this.copyBooleanValue = copyBooleanValue;
    }

    //@Getter @Setter
    @Column(name = "c_pdservice_link")
    private Long c_pdservice_link;

    @Column(name = "c_version_link")
    private String c_version_link;

    @Column(name = "c_jira_link")
    private String c_jira_link;

    @Column(name = "c_jira_ver_link")
    private String c_jira_ver_link;

    @Column(name = "c_req_link")
    private Long c_req_link;

    @Column(name = "c_review_link")
    private Long c_review_link;

    @Column(name = "c_sender")
    private String c_sender;

    @Column(name = "c_comment_date")
    private String c_comment_date;

    @Column(name = "c_comment")
    private String c_comment;

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

    public String getC_jira_ver_link() {
        return c_jira_ver_link;
    }

    public void setC_jira_ver_link(String c_jira_ver_link) {
        this.c_jira_ver_link = c_jira_ver_link;
    }

    public Long getC_req_link() {
        return c_req_link;
    }

    public void setC_req_link(Long c_req_link) {
        this.c_req_link = c_req_link;
    }

    public Long getC_review_link() {
        return c_review_link;
    }

    public void setC_review_link(Long c_review_link) {
        this.c_review_link = c_review_link;
    }

    public String getC_sender() {
        return c_sender;
    }

    public void setC_sender(String c_sender) {
        this.c_sender = c_sender;
    }

    public String getC_comment_date() {
        return c_comment_date;
    }

    public void setC_comment_date(String c_comment_date) {
        this.c_comment_date = c_comment_date;
    }

    public String getC_comment() {
        return c_comment;
    }

    public void setC_comment(String c_comment) {
        this.c_comment = c_comment;
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
