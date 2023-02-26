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
package egovframework.api.arms.module_pdservicelog.model;

import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateDTO;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateLogDTO;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.*;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.*;
import java.io.Serializable;

@Entity
@Getter
@Setter
@Table(name = "T_ARMS_PDSERVICE_LOG")
@SelectBeforeUpdate(value=true)
@DynamicInsert(value=true)
@DynamicUpdate(value=true)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SequenceGenerator(name = "JsTreeSequence", sequenceName = "S_T_ARMS_PDSERVICE_LOG", allocationSize = 1)
public class PdServiceLogDTO extends JsTreeHibernateLogDTO implements Serializable {

    public PdServiceLogDTO() {
        super();
    }

    public PdServiceLogDTO(Boolean copyBooleanValue) {
        super();
        this.copyBooleanValue = copyBooleanValue;
    }

    //@Getter @Setter
    @Lob
    @Column(name="c_contents")
    private String c_contents;

    @Column(name="c_etc")
    private String c_etc;

    @Column(name="c_owner")
    private String c_owner;

    @Column(name="c_reviewer01")
    private String c_reviewer01;

    @Column(name="c_reviewer02")
    private String c_reviewer02;

    @Column(name="c_reviewer03")
    private String c_reviewer03;

    @Column(name="c_reviewer04")
    private String c_reviewer04;

    @Column(name="c_reviewer05")
    private String c_reviewer05;

    @Column(name="c_writer_name")
    private String c_writer_name;

    @Column(name="c_writer_cn")
    private String c_writer_cn;

    @Column(name="c_writer_mail")
    private String c_writer_mail;

    @Column(name="c_writer_date")
    private String c_writer_date;

    @Column(name="c_fileid_link")
    private Long c_fileid_link;


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
