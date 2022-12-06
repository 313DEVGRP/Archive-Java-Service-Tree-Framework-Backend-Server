/*
 * @author Dongmin.lee
 * @since 2022-12-06
 * @version 22.12.06
 * @see <pre>
 *  Copyright (C) 2007 by 313 DEV GRP, Inc - All Rights Reserved
 *  Unauthorized copying of this file, via any medium is strictly prohibited
 *  Proprietary and confidential
 *  Written by 313 developer group <313@313.co.kr>, December 2010
 * </pre>
 */
package egovframework.api.arms.module_reqadd_status.model;

import org.hibernate.annotations.*;
import org.hibernate.annotations.Cache;
import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateDTO;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;

@Entity
@Table(name = "T_ARMS_REQADD_STATUS")
@SelectBeforeUpdate(value=true)
@DynamicInsert(value=true)
@DynamicUpdate(value=true)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SequenceGenerator(name = "JsTreeSequence", sequenceName = "S_T_ARMS_REQADD_STATUS", allocationSize = 1)
public class ReqAdd_StatusDTO extends JsTreeHibernateSearchDTO implements Serializable {

    public ReqAdd_StatusDTO() {
        super();
    }

    public ReqAdd_StatusDTO(Boolean copyBooleanValue) {
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

    @Column(name = "c_req_link")
    private String c_req_link;

    @Column(name = "c_req_name")
    private String c_req_name;

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
