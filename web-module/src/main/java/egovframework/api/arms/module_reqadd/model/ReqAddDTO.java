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

import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.*;
import org.hibernate.annotations.Cache;
import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateDTO;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;

@Entity
@Getter
@Setter
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

    @Column(name = "c_version_link")
    private String c_version_link;

    @Column(name = "c_jira_link")
    private String c_jira_link;

    @Column(name = "c_jira_ver_link")
    private String c_jira_ver_link;

    //ReqStatus Issue Link
    @Column(name = "c_issue_link")
    private String c_issue_link;

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

    @Column(name = "c_priority")
    private Long c_priority;

    @Column(name = "c_req_status")
    private String c_req_status;

    @Lob
    @Column(name = "c_contents")
    private String c_contents;

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
