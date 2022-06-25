/*
 * @author Dongmin.lee
 * @since 2022-06-17
 * @version 22.06.17
 * @see <pre>
 *  Copyright (C) 2007 by 313 DEV GRP, Inc - All Rights Reserved
 *  Unauthorized copying of this file, via any medium is strictly prohibited
 *  Proprietary and confidential
 *  Written by 313 developer group <313@313.co.kr>, December 2010
 * </pre>
 */
package egovframework.api.arms.module_pdjira.model;

import org.hibernate.annotations.*;
import org.hibernate.annotations.Cache;
import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateDTO;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;

@Entity
@Table(name = "T_ARMS_PDJIRA")
@SelectBeforeUpdate(value=true)
@DynamicInsert(value=true)
@DynamicUpdate(value=true)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SequenceGenerator(name = "JsTreeSequence", sequenceName = "S_ARMS_PDJIRA", allocationSize = 1)
public class PdJiraDTO extends JsTreeHibernateSearchDTO implements Serializable {

	private static final long serialVersionUID = 1L;

    public PdJiraDTO() {
        super();
    }

    public PdJiraDTO(Boolean copyBooleanValue) {
        super();
        this.copyBooleanValue = copyBooleanValue;
    }

    //@Getter @Setter
    @Column(name = "c_pdjira_detail")
    private String c_pdjira_detail;

    @Column(name = "c_pdjira_con_name")
    private String c_pdjira_con_name;

    @Column(name = "c_pdjira_con_user")
    private String c_pdjira_con_user;

    @Column(name = "c_pdjira_con_pass")
    private String c_pdjira_con_pass;

    @Column(name = "c_pdjira_con_token")
    private String c_pdjira_con_token;

    @Column(name = "c_pdjira_con_jql")
    private String c_pdjira_con_jql;

    @Column(name = "jiraConPassMode")
    private String jiraConPassMode;

    public String getC_pdjira_detail() {
        return c_pdjira_detail;
    }

    public void setC_pdjira_detail(String c_pdjira_detail) {
        this.c_pdjira_detail = c_pdjira_detail;
    }

    public String getC_pdjira_con_name() {
        return c_pdjira_con_name;
    }

    public void setC_pdjira_con_name(String c_pdjira_con_name) {
        this.c_pdjira_con_name = c_pdjira_con_name;
    }

    public String getC_pdjira_con_user() {
        return c_pdjira_con_user;
    }

    public void setC_pdjira_con_user(String c_pdjira_con_user) {
        this.c_pdjira_con_user = c_pdjira_con_user;
    }

    public String getC_pdjira_con_pass() {
        return c_pdjira_con_pass;
    }

    public void setC_pdjira_con_pass(String c_pdjira_con_pass) {
        this.c_pdjira_con_pass = c_pdjira_con_pass;
    }

    public String getC_pdjira_con_token() {
        return c_pdjira_con_token;
    }

    public void setC_pdjira_con_token(String c_pdjira_con_token) {
        this.c_pdjira_con_token = c_pdjira_con_token;
    }

    public String getC_pdjira_con_jql() {
        return c_pdjira_con_jql;
    }

    public void setC_pdjira_con_jql(String c_pdjira_con_jql) {
        this.c_pdjira_con_jql = c_pdjira_con_jql;
    }

    public String getJiraConPassMode() {
        return jiraConPassMode;
    }

    public void setJiraConPassMode(String jiraConPassMode) {
        this.jiraConPassMode = jiraConPassMode;
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
