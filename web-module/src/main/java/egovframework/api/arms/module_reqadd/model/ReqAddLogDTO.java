package egovframework.api.arms.module_reqadd.model;

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
@Table(name = "T_ARMS_REQADD_LOG")
@SelectBeforeUpdate(value=true)
@DynamicInsert(value=true)
@DynamicUpdate(value=true)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SequenceGenerator(name = "JsTreeSequence", sequenceName = "S_T_ARMS_REQADD_LOG", allocationSize = 1)
public class ReqAddLogDTO extends JsTreeHibernateSearchDTO implements Serializable {

    public ReqAddLogDTO() {
        super();
    }

    public ReqAddLogDTO(Boolean copyBooleanValue) {
        super();
        this.copyBooleanValue = copyBooleanValue;
    }

    //@Getter @Setter

    private String c_method;

    @Column(name="C_METHOD")
    public String getC_method() {
        return c_method;
    }

    public void setC_method(String c_method) {
        this.c_method = c_method;
    }

    private String c_state;

    @Column(name="C_STATE")
    public String getC_state() {
        return c_state;
    }

    public void setC_state(String c_state) {
        this.c_state = c_state;
    }

    private Date c_date;

    @Column(name="C_DATE")
    public Date getC_date() {
        return c_date;
    }

    public void setC_date(Date c_date) {
        this.c_date = c_date;
    }

    private Long c_pdService_Link;

    @Column(name="C_PDSERVICE_LINK")
    public Long getC_pdService_Link() {
        return c_pdService_Link;
    }

    public void setC_pdService_Link(Long c_pdService_Link) {
        this.c_pdService_Link = c_pdService_Link;
    }

    private String c_version_Link;

    @Column(name="C_VERSION_LINK")
    public String getC_version_Link() {
        return c_version_Link;
    }

    public void setC_version_Link(String c_version_Link) {
        this.c_version_Link = c_version_Link;
    }

    private String c_reviewer01;

    @Column(name="C_REVIEWER01")
    public String getC_reviewer01() {
        return c_reviewer01;
    }

    public void setC_reviewer01(String c_reviewer01) {
        this.c_reviewer01 = c_reviewer01;
    }

    private String c_reviewer02;

    @Column(name="C_REVIEWER02")
    public String getC_reviewer02() {
        return c_reviewer02;
    }

    public void setC_reviewer02(String c_reviewer02) {
        this.c_reviewer02 = c_reviewer02;
    }

    private String c_reviewer03;

    @Column(name="C_REVIEWER03")
    public String getC_reviewer03() {
        return c_reviewer03;
    }

    public void setC_reviewer03(String c_reviewer03) {
        this.c_reviewer03 = c_reviewer03;
    }

    private String c_reviewer04;

    @Column(name="C_REVIEWER04")
    public String getC_reviewer04() {
        return c_reviewer04;
    }

    public void setC_reviewer04(String c_reviewer04) {
        this.c_reviewer04 = c_reviewer04;
    }

    private String c_reviewer05;

    @Column(name="C_REVIEWER05")
    public String getC_reviewer05() {
        return c_reviewer05;
    }

    public void setC_reviewer05(String c_reviewer05) {
        this.c_reviewer05 = c_reviewer05;
    }

    private String c_writer_name;

    @Column(name="C_WRITER_NAME")
    public String getC_writer_name() {
        return c_writer_name;
    }

    public void setC_writer_name(String c_writer_name) {
        this.c_writer_name = c_writer_name;
    }

    private String c_writer_cn;

    @Column(name="C_WRITER_CN")
    public String getC_writer_cn() {
        return c_writer_cn;
    }

    public void setC_writer_cn(String c_writer_cn) {
        this.c_writer_cn = c_writer_cn;
    }

    private String c_writer_date;

    @Column(name="C_WRITER_DATE")
    public String getC_writer_date() {
        return c_writer_date;
    }

    public void setC_writer_date(String c_writer_date) {
        this.c_writer_date = c_writer_date;
    }

    private Long c_priority;

    @Column(name="C_PRIORITY")
    public Long getC_priority() {
        return c_priority;
    }

    public void setC_priority(Long c_priority) {
        this.c_priority = c_priority;
    }

    private String c_req_status;

    @Column(name="C_REQ_STATUS")
    public String getC_req_status() {
        return c_req_status;
    }

    public void setC_req_status(String c_req_status) {
        this.c_req_status = c_req_status;
    }

    // 요구사항 제목은 c_title 로.

    private String c_contents;

    @Lob
    @Column(name="C_CONTENTS")
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
