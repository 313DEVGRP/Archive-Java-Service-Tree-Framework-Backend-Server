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
package egovframework.api.arms.module_reqcommentlog.model;

import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateLogDTO;
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
@Table(name = "T_ARMS_REQCOMMENT_LOG")
@SelectBeforeUpdate(value=true)
@DynamicInsert(value=true)
@DynamicUpdate(value=true)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SequenceGenerator(name = "JsTreeSequence", sequenceName = "S_T_ARMS_REQCOMMENT_LOG", allocationSize = 1)
public class ReqCommentLogDTO extends JsTreeHibernateLogDTO implements Serializable {

    public ReqCommentLogDTO() {
        super();
    }

    public ReqCommentLogDTO(Boolean copyBooleanValue) {
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
