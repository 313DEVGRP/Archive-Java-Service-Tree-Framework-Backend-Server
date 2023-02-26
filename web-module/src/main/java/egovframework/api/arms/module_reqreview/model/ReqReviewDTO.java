/*
 * @author Dongmin.lee
 * @since 2022-12-06
 * @version 22.12.06
 * @see <pre>
 *  Copyright (C) 2007 by 313 DEV GRP, Inc - All Rights Reserved
 *  Unauthorized copying of this file, via any medium is strictly prohibited
 *  Proprietary and confidential
 *  Written by 313 developer group <313@313.co.kr>, December 2010
 * </pre>
 */
package egovframework.api.arms.module_reqreview.model;

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
@Table(name = "T_ARMS_REQREVIEW")
@SelectBeforeUpdate(value=true)
@DynamicInsert(value=true)
@DynamicUpdate(value=true)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SequenceGenerator(name = "JsTreeSequence", sequenceName = "S_T_ARMS_REQREVIEW", allocationSize = 1)
public class ReqReviewDTO extends JsTreeHibernateSearchDTO implements Serializable {

    public ReqReviewDTO() {
        super();
    }

    public ReqReviewDTO(Boolean copyBooleanValue) {
        super();
        this.copyBooleanValue = copyBooleanValue;
    }

    //@Getter @Setter

    //리뷰 - 요구사항의 제품(서비스) 링크 ( 아이디 )
    @Column(name = "c_review_pdservice_link")
    private Long c_review_pdservice_link;

    //리뷰 - 요구사항의 제품(서비스) 네임
    @Column(name = "c_review_pdservice_name")
    private String c_review_pdservice_name;

    //리뷰 - 요구사항의 제품(서비스) 버전 링크
    @Column(name = "c_review_version_link")
    private String c_review_version_link;

    //리뷰 - 요구사항의 지라 프로젝트 링크
    @Column(name = "c_review_jira_link")
    private String c_review_jira_link;

    //리뷰 - 요구사항의 지라 프로젝트 버전 링크
    @Column(name = "c_review_jira_ver_link")
    private String c_review_jira_ver_link;

    //리뷰 - 요구사항 링크 ( 아이디 )
    @Column(name = "c_review_req_link")
    private Long c_review_req_link;

    //리뷰 - 요구사항 네임
    @Column(name = "c_review_req_name")
    private String c_review_req_name;

    //리뷰를 요청한 사람
    @Column(name = "c_review_sender")
    private String c_review_sender;

    //리뷰를 요청받은 사람
    @Column(name = "c_review_responder")
    private String c_review_responder;

    //리뷰 생성일자
    @Column(name = "c_review_creat_date")
    private String c_review_creat_date;

    //리뷰 상태
    @Column(name = "c_review_result_state")
    private String c_review_result_state;

    //리뷰 커멘트
    @Column(name = "c_review_comment")
    private String c_review_comment;

    //리뷰 일자
    @Column(name = "c_review_result_date")
    private String c_review_result_date;


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
