package egovframework.api.arms.pdServiceJira.model;

import egovframework.com.cmm.util.string.StringUtil;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateDTO;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;
import lombok.Getter;
import lombok.Setter;
import org.apache.commons.lang.StringUtils;
import org.hibernate.annotations.*;
import org.hibernate.annotations.Cache;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "T_ARMS_PDSERVICEJIRA")
@SelectBeforeUpdate(value=true)
@DynamicInsert(value=true)
@DynamicUpdate(value=true)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SequenceGenerator(name = "JsTreeSequence", sequenceName = "S_ARMS_PDSERVICEJIRA", allocationSize = 1)
public class PdServiceJiraDTO extends JsTreeHibernateSearchDTO implements Serializable {

    private static final long serialVersionUID = -6859122566734590165L;

    public PdServiceJiraDTO() {
        super();
    }

    public PdServiceJiraDTO(Boolean copyBooleanValue) {
        super();
        this.copyBooleanValue = copyBooleanValue;
    }

    @Getter @Setter
    @Column(name = "c_pdservicejira_detail")
    private String c_pdservicejira_detail;

    @Getter @Setter
    @Column(name = "c_pdservicejira_con_name")
    private String c_pdservicejira_con_name;

    @Getter @Setter
    @Column(name = "c_pdservicejira_con_user")
    private String c_pdservicejira_con_user;

    @Getter @Setter
    @Column(name = "c_pdservicejira_con_pass")
    private String c_pdservicejira_con_pass;

    @Getter @Setter
    @Column(name = "c_pdservicejira_con_token")
    private String c_pdservicejira_con_token;

    @Getter @Setter
    @Column(name = "c_pdservicejira_con_jql")
    private String c_pdservicejira_con_jql;


    /*
     * Extend Bean Field
     */
    private Boolean jiraConPassMode;

    @Transient
    public Boolean getJiraConPassMode() {
        jiraConPassMode = false;
        if (StringUtils.isEmpty(c_pdservicejira_con_pass)) {
            jiraConPassMode = false;
        } else {
            jiraConPassMode = true;
        }
        return jiraConPassMode;
    }

    public void setJiraConPassMode(Boolean jiraConPassMode) {
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
