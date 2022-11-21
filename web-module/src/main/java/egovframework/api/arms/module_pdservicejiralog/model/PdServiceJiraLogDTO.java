/*
 * @author Dongmin.lee
 * @since 2022-11-20
 * @version 22.11.20
 * @see <pre>
 *  Copyright (C) 2007 by 313 DEV GRP, Inc - All Rights Reserved
 *  Unauthorized copying of this file, via any medium is strictly prohibited
 *  Proprietary and confidential
 *  Written by 313 developer group <313@313.co.kr>, December 2010
 * </pre>
 */
package egovframework.api.arms.module_pdservicejiralog.model;

import org.hibernate.annotations.*;
import org.hibernate.annotations.Cache;
import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateDTO;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;

@Entity
@Table(name = "T_ARMS_PDSERVICEJIRALOG")
@SelectBeforeUpdate(value=true)
@DynamicInsert(value=true)
@DynamicUpdate(value=true)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SequenceGenerator(name = "JsTreeSequence", sequenceName = "S_T_ARMS_PDSERVICEJIRALOG", allocationSize = 1)
public class PdServiceJiraLogDTO extends JsTreeHibernateSearchDTO implements Serializable {

    public PdServiceJiraLogDTO() {
        super();
    }

    public PdServiceJiraLogDTO(Boolean copyBooleanValue) {
        super();
        this.copyBooleanValue = copyBooleanValue;
    }

    //@Getter @Setter
    @Column(name="c_method")
    private String c_method;

    @Column(name="c_state")
    private String c_state;

    @Column(name="c_date")
    private Date c_date;

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

    public String getC_method() {
        return c_method;
    }

    public void setC_method(String c_method) {
        this.c_method = c_method;
    }

    public String getC_state() {
        return c_state;
    }

    public void setC_state(String c_state) {
        this.c_state = c_state;
    }

    public Date getC_date() {
        return c_date;
    }

    public void setC_date(Date c_date) {
        this.c_date = c_date;
    }

    public String getC_contents() {
        return c_contents;
    }

    public void setC_contents(String c_contents) {
        this.c_contents = c_contents;
    }

    public String getC_jira_link() {
        return c_jira_link;
    }

    public void setC_jira_link(String c_jira_link) {
        this.c_jira_link = c_jira_link;
    }

    public String getC_jira_id() {
        return c_jira_id;
    }

    public void setC_jira_id(String c_jira_id) {
        this.c_jira_id = c_jira_id;
    }

    public String getC_jira_key() {
        return c_jira_key;
    }

    public void setC_jira_key(String c_jira_key) {
        this.c_jira_key = c_jira_key;
    }

    public String getC_jira_name() {
        return c_jira_name;
    }

    public void setC_jira_name(String c_jira_name) {
        this.c_jira_name = c_jira_name;
    }

    public String getC_jira_avatar_48() {
        return c_jira_avatar_48;
    }

    public void setC_jira_avatar_48(String c_jira_avatar_48) {
        this.c_jira_avatar_48 = c_jira_avatar_48;
    }

    public String getC_jira_avatar_32() {
        return c_jira_avatar_32;
    }

    public void setC_jira_avatar_32(String c_jira_avatar_32) {
        this.c_jira_avatar_32 = c_jira_avatar_32;
    }

    public String getC_jira_avatar_24() {
        return c_jira_avatar_24;
    }

    public void setC_jira_avatar_24(String c_jira_avatar_24) {
        this.c_jira_avatar_24 = c_jira_avatar_24;
    }

    public String getC_jira_avatar_16() {
        return c_jira_avatar_16;
    }

    public void setC_jira_avatar_16(String c_jira_avatar_16) {
        this.c_jira_avatar_16 = c_jira_avatar_16;
    }

    public String getC_jira_category_link() {
        return c_jira_category_link;
    }

    public void setC_jira_category_link(String c_jira_category_link) {
        this.c_jira_category_link = c_jira_category_link;
    }

    public String getC_jira_category_id() {
        return c_jira_category_id;
    }

    public void setC_jira_category_id(String c_jira_category_id) {
        this.c_jira_category_id = c_jira_category_id;
    }

    public String getC_jira_category_name() {
        return c_jira_category_name;
    }

    public void setC_jira_category_name(String c_jira_category_name) {
        this.c_jira_category_name = c_jira_category_name;
    }

    public String getC_jira_category_desc() {
        return c_jira_category_desc;
    }

    public void setC_jira_category_desc(String c_jira_category_desc) {
        this.c_jira_category_desc = c_jira_category_desc;
    }

    public String getC_jira_con_user() {
        return c_jira_con_user;
    }

    public void setC_jira_con_user(String c_jira_con_user) {
        this.c_jira_con_user = c_jira_con_user;
    }

    public String getC_jira_con_pass() {
        return c_jira_con_pass;
    }

    public void setC_jira_con_pass(String c_jira_con_pass) {
        this.c_jira_con_pass = c_jira_con_pass;
    }

    public String getC_jira_con_token() {
        return c_jira_con_token;
    }

    public void setC_jira_con_token(String c_jira_con_token) {
        this.c_jira_con_token = c_jira_con_token;
    }

    public String getC_jira_con_jql() {
        return c_jira_con_jql;
    }

    public void setC_jira_con_jql(String c_jira_con_jql) {
        this.c_jira_con_jql = c_jira_con_jql;
    }

    public String getC_jira_con_passmode() {
        return c_jira_con_passmode;
    }

    public void setC_jira_con_passmode(String c_jira_con_passmode) {
        this.c_jira_con_passmode = c_jira_con_passmode;
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
