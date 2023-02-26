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
package egovframework.api.arms.module_pdservicejira.model;

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
@Table(name = "T_ARMS_PDSERVICEJIRA")
@SelectBeforeUpdate(value=true)
@DynamicInsert(value=true)
@DynamicUpdate(value=true)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SequenceGenerator(name = "JsTreeSequence", sequenceName = "S_T_ARMS_PDSERVICEJIRA", allocationSize = 1)
public class PdServiceJiraDTO extends JsTreeHibernateSearchDTO implements Serializable {

    public PdServiceJiraDTO() {
        super();
    }

    public PdServiceJiraDTO(Boolean copyBooleanValue) {
        super();
        this.copyBooleanValue = copyBooleanValue;
    }

    //@Getter @Setter
    @Lob
    @Column(name="c_contents")
    private String c_contents;

    @Column(name="c_jira_link")
    private String c_jira_link;

    @Column(name="c_jira_id")
    private String c_jira_id;

    @Column(name="c_jira_key")
    private String c_jira_key;

    @Column(name="c_jira_name")
    private String c_jira_name;

    @Column(name="c_jira_avatar_48")
    private String c_jira_avatar_48;

    @Column(name="c_jira_avatar_32")
    private String c_jira_avatar_32;

    @Column(name="c_jira_avatar_24")
    private String c_jira_avatar_24;

    @Column(name="c_jira_avatar_16")
    private String c_jira_avatar_16;

    @Column(name="c_jira_category_link")
    private String c_jira_category_link;

    @Column(name="c_jira_category_id")
    private String c_jira_category_id;

    @Column(name="c_jira_category_name")
    private String c_jira_category_name;

    @Column(name="c_jira_category_desc")
    private String c_jira_category_desc;

    @Column(name="c_jira_con_user")
    private String c_jira_con_user;

    @Column(name="c_jira_con_pass")
    private String c_jira_con_pass;

    @Column(name="c_jira_con_token")
    private String c_jira_con_token;

    @Column(name="c_jira_con_jql")
    private String c_jira_con_jql;

    @Column(name="c_jira_con_passmode")
    private String c_jira_con_passmode;

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
