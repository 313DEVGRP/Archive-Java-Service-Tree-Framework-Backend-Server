package egovframework.com.cop.cmy.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;


/**
 * 승인정보를 관리하기 위한 모델  클래스
 * @author 공통서비스개발팀 이삼섭
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.4.7  이삼섭          최초 생성
 *
 * </pre>
 */
@SuppressWarnings("serial")
public class ConfirmHistory implements Serializable {

    /** 승인일 */
    private String confmDe = "";
    
    /** 승인자 아이디 */
    private String confmerId = "";
    
    /** 확인구분코드 */
    private int confmNumber = 0;
    
    /** 승인요청자 아이디 */
    private String confmRqesterId = "";
    
    /** 승인상태코드 */
    private String confmSttusCode = "";
    
    /** 승인유형코드 */
    private String confmTyCode = "";
    
    /** 작업 아이디 */
    private String opertId = "";
    
    /** 작업유형코드 */
    private String opertTyCode = "";
    
    /** 대상업무 아이디 */
    private String trgetJobId = "";
    
    /** 대상업무유형코드 */
    private String trgetJobTyCode = "";
    
    /** 대상 ID */
    private String trgetId = "";

    /**
     * confmDe attribute를 리턴한다.
     * 
     * @return the confmDe
     */
    public String getConfmDe() {
	return confmDe;
    }

    /**
     * confmDe attribute 값을 설정한다.
     * 
     * @param confmDe
     *            the confmDe to set
     */
    public void setConfmDe(String confmDe) {
	this.confmDe = confmDe;
    }

    /**
     * confmerId attribute를 리턴한다.
     * 
     * @return the confmerId
     */
    public String getConfmerId() {
	return confmerId;
    }

    /**
     * confmerId attribute 값을 설정한다.
     * 
     * @param confmerId
     *            the confmerId to set
     */
    public void setConfmerId(String confmerId) {
	this.confmerId = confmerId;
    }

    /**
     * confmNumber attribute를 리턴한다.
     * 
     * @return the confmNumber
     */
    public int getConfmNumber() {
	return confmNumber;
    }

    /**
     * confmNumber attribute 값을 설정한다.
     * 
     * @param confmNumber
     *            the confmNumber to set
     */
    public void setConfmNumber(int confmNumber) {
	this.confmNumber = confmNumber;
    }

    /**
     * confmRqesterId attribute를 리턴한다.
     * 
     * @return the confmRqesterId
     */
    public String getConfmRqesterId() {
	return confmRqesterId;
    }

    /**
     * confmRqesterId attribute 값을 설정한다.
     * 
     * @param confmRqesterId
     *            the confmRqesterId to set
     */
    public void setConfmRqesterId(String confmRqesterId) {
	this.confmRqesterId = confmRqesterId;
    }

    /**
     * confmSttusCode attribute를 리턴한다.
     * 
     * @return the confmSttusCode
     */
    public String getConfmSttusCode() {
	return confmSttusCode;
    }

    /**
     * confmSttusCode attribute 값을 설정한다.
     * 
     * @param confmSttusCode
     *            the confmSttusCode to set
     */
    public void setConfmSttusCode(String confmSttusCode) {
	this.confmSttusCode = confmSttusCode;
    }

    /**
     * confmTyCode attribute를 리턴한다.
     * 
     * @return the confmTyCode
     */
    public String getConfmTyCode() {
	return confmTyCode;
    }

    /**
     * confmTyCode attribute 값을 설정한다.
     * 
     * @param confmTyCode
     *            the confmTyCode to set
     */
    public void setConfmTyCode(String confmTyCode) {
	this.confmTyCode = confmTyCode;
    }

    /**
     * opertId attribute를 리턴한다.
     * 
     * @return the opertId
     */
    public String getOpertId() {
	return opertId;
    }

    /**
     * opertId attribute 값을 설정한다.
     * 
     * @param opertId
     *            the opertId to set
     */
    public void setOpertId(String opertId) {
	this.opertId = opertId;
    }

    /**
     * opertTyCode attribute를 리턴한다.
     * 
     * @return the opertTyCode
     */
    public String getOpertTyCode() {
	return opertTyCode;
    }

    /**
     * opertTyCode attribute 값을 설정한다.
     * 
     * @param opertTyCode
     *            the opertTyCode to set
     */
    public void setOpertTyCode(String opertTyCode) {
	this.opertTyCode = opertTyCode;
    }

    /**
     * trgetJobId attribute를 리턴한다.
     * 
     * @return the trgetJobId
     */
    public String getTrgetJobId() {
	return trgetJobId;
    }

    /**
     * trgetJobId attribute 값을 설정한다.
     * 
     * @param trgetJobId
     *            the trgetJobId to set
     */
    public void setTrgetJobId(String trgetJobId) {
	this.trgetJobId = trgetJobId;
    }

    /**
     * trgetJobTyCode attribute를 리턴한다.
     * 
     * @return the trgetJobTyCode
     */
    public String getTrgetJobTyCode() {
	return trgetJobTyCode;
    }

    /**
     * trgetJobTyCode attribute 값을 설정한다.
     * 
     * @param trgetJobTyCode
     *            the trgetJobTyCode to set
     */
    public void setTrgetJobTyCode(String trgetJobTyCode) {
	this.trgetJobTyCode = trgetJobTyCode;
    }
    
    /**
     * trgetId attribute를 리턴한다.
     * @return the trgetId
     */
    public String getTrgetId() {
        return trgetId;
    }

    /**
     * trgetId attribute 값을 설정한다.
     * @param trgetId the trgetId to set
     */
    public void setTrgetId(String trgetId) {
        this.trgetId = trgetId;
    }

    /**
     * toString 메소드를 대치한다.
     */
    public String toString() {
	return ToStringBuilder.reflectionToString(this);
    }
}
