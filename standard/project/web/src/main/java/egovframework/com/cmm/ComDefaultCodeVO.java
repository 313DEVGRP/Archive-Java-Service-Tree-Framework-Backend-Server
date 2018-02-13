package egovframework.com.cmm;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

@SuppressWarnings("serial")
public class ComDefaultCodeVO implements Serializable {
    /** 코드 ID */
    private String codeId = "";
    
    /** 상세코드 */
    private String code = "";
    
    /** 코드명 */
    private String codeNm = "";
    
    /** 코드설명 */
    private String codeDc = "";
    
    /** 특정테이블명 */
    private String tableNm = "";	//특정테이블에서 코드정보를추출시 사용
    
    /** 상세 조건 여부 */
    private String haveDetailCondition = "N";
    
    /** 상세 조건 */
    private String detailCondition = "";
    
    /**
     * codeId attribute를 리턴한다.
     * 
     * @return the codeId
     */
    public String getCodeId() {
	return codeId;
    }

    public void setCodeId(String codeId) {
	this.codeId = codeId;
    }

    public String getCode() {
	return code;
    }

    public void setCode(String code) {
	this.code = code;
    }

    public String getCodeNm() {
	return codeNm;
    }

    public void setCodeNm(String codeNm) {
	this.codeNm = codeNm;
    }

    public String getCodeDc() {
	return codeDc;
    }

    public void setCodeDc(String codeDc) {
	this.codeDc = codeDc;
    }

    public String getTableNm() {
	return tableNm;
    }

    public void setTableNm(String tableNm) {
	this.tableNm = tableNm;
    }

    public String getHaveDetailCondition() {
	return haveDetailCondition;
    }

    public void setHaveDetailCondition(String haveDetailCondition) {
	this.haveDetailCondition = haveDetailCondition;
    }

    public String getDetailCondition() {
	return detailCondition;
    }

    public void setDetailCondition(String detailCondition) {
	this.detailCondition = detailCondition;
    }

    public String toString() {
	return ToStringBuilder.reflectionToString(this);
    }
}
