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
package egovframework.api.arms.module_filerepositorylog.model;

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
@Table(name = "T_ARMS_FILEREPOSITORYLOG")
@SelectBeforeUpdate(value=true)
@DynamicInsert(value=true)
@DynamicUpdate(value=true)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SequenceGenerator(name = "JsTreeSequence", sequenceName = "S_T_ARMS_FILEREPOSITORYLOG", allocationSize = 1)
public class FileRepositoryLogDTO extends JsTreeHibernateSearchDTO implements Serializable {

    public FileRepositoryLogDTO() {
        super();
    }

    public FileRepositoryLogDTO(Boolean copyBooleanValue) {
        super();
        this.copyBooleanValue = copyBooleanValue;
    }

    //@Getter @Setter
    @Column(name="C_METHOD")
    private String c_method;

    @Column(name="C_STATE")
    private String c_state;

    @Column(name="C_DATE")
    private Date c_date;

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

    //필드명과 컬럼명이 다를 경우는 하기와 같이 처리.
    private Long fileIdLink;
    private String fileName;
    private String contentType;
    private String serverSubPath;
    private String physicalName;
    private Long size;
    private String name;
    private String url;
    private String thumbnailUrl;
    private String delete_url;
    private String delete_type;

    @Column(name="C_FILE_ID_LINK")
    public Long getFileIdLink() {
        return fileIdLink;
    }

    public void setFileIdLink(Long fileIdLink) {
        this.fileIdLink = fileIdLink;
    }


    @Column(name="C_FILE_NAME")
    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    @Column(name="C_CONTENT_TYPE")
    public String getContentType() {
        return contentType;
    }

    public void setContentType(String contentType) {
        this.contentType = contentType;
    }

    @Column(name="C_SERVER_SUB_PATH")
    public String getServerSubPath() {
        return serverSubPath;
    }

    public void setServerSubPath(String serverSubPath) {
        this.serverSubPath = serverSubPath;
    }

    @Column(name="C_PHYSICAL_NAME")
    public String getPhysicalName() {
        return physicalName;
    }

    public void setPhysicalName(String physicalName) {
        this.physicalName = physicalName;
    }

    @Column(name="C_SIZE")
    public Long getSize() {
        return size;
    }

    public void setSize(Long size) {
        this.size = size;
    }

    @Column(name="C_NAME")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(name="C_URL")
    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Column(name="C_THUMBNAIL_URL")
    public String getThumbnailUrl() {
        return thumbnailUrl;
    }

    public void setThumbnailUrl(String thumbnailUrl) {
        this.thumbnailUrl = thumbnailUrl;
    }

    @Column(name="C_DELETE_URL")
    public String getDelete_url() {
        return delete_url;
    }

    public void setDelete_url(String delete_url) {
        this.delete_url = delete_url;
    }

    @Column(name="C_DELETE_TYPE")
    public String getDelete_type() {
        return delete_type;
    }

    public void setDelete_type(String delete_type) {
        this.delete_type = delete_type;
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
