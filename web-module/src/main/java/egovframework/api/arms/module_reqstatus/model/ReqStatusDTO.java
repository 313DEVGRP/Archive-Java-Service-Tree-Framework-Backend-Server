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
    //a-RMS의 제품 서비스 아이디
    @Column(name = "c_pdservice_link")
    private Long c_pdservice_link;

    //a-RMS의 버전 ( 사용자가 인지하는 버전 )
    @Column(name = "c_version_link")
    private String c_version_link;

    //a-RMS의 지라 프로젝트 연결 정보 ( 사용자가 인지하는 지라 프로젝트 정보 )
    @Column(name = "c_jira_link")
    private String c_jira_link;

    //a-RMS의 요구사항 아이디 ( 테이블은 스위칭이니까 제품서비스 아이디 참조 )
    @Column(name = "c_req_link")
    private String c_req_link;

    //연결하는 프로젝트의 버전 링크 ( !!! 비어있는건 독립적인 요구사항 전달 - 추후개발 )
    @Column(name = "c_jira_version_link")
    private String c_jira_version_link;

    //연결하는 요구사항 이슈 정보
    @Column(name = "c_jira_req_link")
    private String c_jira_req_link;

    @Column(name = "c_jira_req_linkingissue")
    private String c_jira_req_linkingissue;

    @Column(name = "c_jira_req_subtaskissue")
    private String c_jira_req_subtaskissue;

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

    public String getC_req_link() {
        return c_req_link;
    }

    public void setC_req_link(String c_req_link) {
        this.c_req_link = c_req_link;
    }

    public String getC_jira_version_link() {
        return c_jira_version_link;
    }

    public void setC_jira_version_link(String c_jira_version_link) {
        this.c_jira_version_link = c_jira_version_link;
    }

    public String getC_jira_req_link() {
        return c_jira_req_link;
    }

    public void setC_jira_req_link(String c_jira_req_link) {
        this.c_jira_req_link = c_jira_req_link;
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
