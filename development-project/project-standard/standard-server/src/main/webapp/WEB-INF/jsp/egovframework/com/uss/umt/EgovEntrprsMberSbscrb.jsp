<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<%
 /**
  * @Class Name : EgovEntrprsMberSbscrb.jsp
  * @Description : 기업회원가입신청 JSP
  * @Modification Information
  * @
  * @  수정일         수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.03.02    조재영          최초 생성
  *
  *  @author 공통서비스 개발팀 조재영
  *  @since 2009.03.12
  *  @version 1.0
  *  @see
  *
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />" type="text/css">
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />" type="text/css">
<title>Entrprsmber sbscrb</title>
<script type="text/javascript" src="<c:url value="/sec/rnc/validator.do"/>"></script>
<validator:javascript formName="entrprsManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/ccm/zip/EgovZipPopup.js' />" ></script>
<script type="text/javaScript" language="javascript" defer="defer">
<!--
function fnIdCheck(){
    var retVal;
    var url = "<c:url value='/uss/umt/EgovIdDplctCnfirmView.do'/>";
    var varParam = new Object();
    varParam.checkId = document.entrprsManageVO.entrprsmberId.value;
    var openParam = "dialogWidth:303px;dialogHeight:250px;scroll:no;status:no;center:yes;resizable:yes;";
    retVal = window.showModalDialog(url, varParam, openParam);
    if(retVal) {
        document.entrprsManageVO.entrprsmberId.value = retVal;
    }
}

function showModalDialogCallback(retVal) {
	if(retVal) {
	    document.entrprsManageVO.entrprsmberId.value = retVal;
	}
}

function fnSbscrb(){
	if(validateEntrprsManageVO(document.entrprsManageVO)){
		if(document.entrprsManageVO.entrprsMberPassword.value != document.entrprsManageVO.entrprsMberPassword2.value){
            alert("<spring:message code="fail.user.passwordUpdate2" />");
            return;
        }
        document.entrprsManageVO.submit();
    }
}
-->
</script>
</head>
<body>
<!-- content start -->
        <form:form commandName="entrprsManageVO" action="/uss/umt/EgovEntrprsMberSbscrb.do" name="entrprsManageVO" method="post" >

        <!-- 상세정보 사용자 삭제시 prameter 전달용 input -->
        <input name="checkedIdForDel" type="hidden" />
        <!-- 검색조건 유지 -->
        <input type="hidden" name="searchCondition" value="<c:out value='${userSearchVO.searchCondition}'/>"/>
        <input type="hidden" name="searchKeyword" value="<c:out value='${userSearchVO.searchKeyword}'/>"/>
        <input type="hidden" name="sbscrbSttus" value="<c:out value='${userSearchVO.sbscrbSttus}'/>"/>
        <input type="hidden" name="pageIndex" value="<c:out value='${userSearchVO.pageIndex}'/>"/>
        <!-- 우편번호검색 -->
        <input type="hidden" name="zip_url" value="<c:url value='/sym/ccm/zip/EgovCcmZipSearchPopup.do'/>" />

        <table width="717" cellpadding="8" class="table-search" border="0">
            <tr>
            <td width="100%"class="title_left">
            <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지">&nbsp;기업회원 가입신청</td>
            </tr>
        </table>
        <table width="717" border="0" cellpadding="0" cellspacing="1" class="table-register">
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                    기업회원아이디<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
                </th>
                <td width="80%" nowrap>
                    <form:input path="entrprsmberId" size="20" cssClass="txaIpUmt" readonly="true" maxlength="20" />
                    <a href="javascript:fnIdCheck();">
                        <img align="middle" src="<c:url value='/images/egovframework/com/cmm/icon/search.gif' />" alt="검색아이콘이미지">(중복아이디 검색)
                    </a>
                    <div><form:errors path="entrprsmberId" cssClass="error"/></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                    회사명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
                </th>
                <td width="80%" nowrap>
                    <input name="cmpnyNm" type="text" size="20" value=""  maxlength="20" title="회사명입력">
                    <div><form:errors path="cmpnyNm" cssClass="error"/></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                    비밀번호<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
                </th>
                <td width="80%" nowrap>
                    <form:password path="entrprsMberPassword" size="20" maxlength="20" />
                    <div><form:errors path="entrprsMberPassword" cssClass="error"/></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                    비밀번호확인<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
                </th>
                <td width="80%" nowrap>
                    <input name="entrprsMberPassword2" type="password" size="20" value=""  maxlength="100" title="비밀번호확인입력">
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                    비밀번호힌트<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
                </th>
                <td width="80%" nowrap>
                    <form:select path="entrprsMberPasswordHint">
                        <form:option value="" label="--선택하세요--"/>
                        <form:options items="${passwordHint_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                    <div><form:errors path="entrprsMberPasswordHint" cssClass="error"/></div>
                    </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                    비밀번호정답<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
                </th>
                <td width="80%" nowrap>
                    <form:input path="entrprsMberPasswordCnsr" cssClass="txaIpUmt" size="50" maxlength="100" />
                    <div><form:errors path="entrprsMberPasswordCnsr" cssClass="error"/></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >업종코드&nbsp;&nbsp;</th>
                <td width="80%" nowrap>
                    <form:select path="indutyCode">
                        <form:option value="" label="--선택하세요--"/>
                        <form:options items="${indutyCode_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                    <div><form:errors path="indutyCode" cssClass="error"/></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >기업구분코드&nbsp;&nbsp;</th>
                <td width="80%" nowrap>
                    <form:select path="entrprsSeCode">
                        <form:option value="" label="--선택하세요--"/>
                        <form:options items="${entrprsSeCode_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                    <div><form:errors path="entrprsSeCode" cssClass="error"/></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >대표이사이름&nbsp;&nbsp;</th>
                <td width="80%" nowrap>
                    <form:input path="cxfc" cssClass="txaIpUmt" size="20"  maxlength="8" />
                    <div><form:errors path="cxfc" cssClass="error"/></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                    사업자등록번호<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
                </th>
                <td width="80%" nowrap>
                    <form:input path="bizrno" cssClass="txaIpUmt" size="20" maxlength="20" />
                    <div><form:errors path="bizrno" cssClass="error"/></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >법인등록번호&nbsp;&nbsp;</th>
                <td width="80%" nowrap>
                    <form:input path="jurirno" cssClass="txaIpUmt" size="20" maxlength="13" />
                    <div><form:errors path="jurirno" cssClass="error"/></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                    회사전화번호<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
                </th>
                <td width="80%" nowrap>
                    <form:input path="areaNo" cssClass="txaIpUmt" size="5" maxlength="20" />
                    - <form:input path="entrprsMiddleTelno" cssClass="txaIpUmt" size="5" maxlength="100" />
                    - <form:input path="entrprsEndTelno" cssClass="txaIpUmt" size="5" maxlength="5" />
                    <div><form:errors path="areaNo" cssClass="error"/></div>
                    <div><form:errors path="entrprsMiddleTelno" cssClass="error"/></div>
                    <div><form:errors path="entrprsEndTelno" cssClass="error"/></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >팩스번호&nbsp;&nbsp;</th>
                <td width="80%" nowrap>
                    <form:input path="fxnum" cssClass="txaIpUmt" size="20" maxlength="15" />
                    <div><form:errors path="fxnum" cssClass="error"/></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                    우편번호<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
                </th>
                <td width="80%" nowrap>
                    <input name="zip_view" type="text" size="20" value="<c:out value='${entrprsManageVO.zip}'/>"  maxlength="8" readonly title="우편번호">
                    <form:hidden path="zip" />
                        <a href="javascript:fn_egov_ZipSearch(document.entrprsManageVO, document.entrprsManageVO.zip, document.entrprsManageVO.zip_view, document.entrprsManageVO.adres);">
                            <img src="<c:url value='/images/egovframework/com/cmm/icon/search.gif' />" alt="우편번호검색이미지">(우편번호 검색)
                        </a>
                    <div><form:errors path="zip" cssClass="error"/></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                    주소<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
                <td width="80%" nowrap>
                    <form:input path="adres" cssClass="txaIpUmt" size="70" maxlength="50" readonly="true" />
                    <div><form:errors path="adres" cssClass="error"/></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >상세주소&nbsp;&nbsp;</th>
                <td width="80%" nowrap>
                    <form:input path="detailAdres" cssClass="txaIpUmt" size="70"  maxlength="50" />
                    <div><form:errors path="detailAdres" cssClass="error"/></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                    신청자이름<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
                </th>
                <td width="80%" nowrap>
                    <input name="applcntNm" type="text" size="20"
                           value=<c:if test="${not empty applcntNm}">"<c:out value="${applcntNm}"/>" readonly</c:if>
                                 <c:if test="${empty applcntNm}">""</c:if>
                           maxlength="20" title="이름입력"/>
                    <div><form:errors path="applcntNm" cssClass="error"/></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                    신청자이메일주소<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
                </th>
                <td width="80%" nowrap>
                    <form:input path="applcntEmailAdres" cssClass="txaIpUmt" size="20" maxlength="20" />
                    <div><form:errors path="applcntEmailAdres" cssClass="error"/></div>
                </td>
            </tr>
            <form:hidden path="groupId" ></form:hidden>
            <form:hidden path="entrprsMberSttus" ></form:hidden>
        </table>
        <table width="717" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td height="10"></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                <table border="0" cellspacing="0" cellpadding="0" align="center">
		            <tr>
		                <td><span class="button">
		                <a href="javascript:fnSbscrb();">가입신청</a></span></td>
		                <td>&nbsp;</td>
		                <td><span class="button">
		                <a href="javascript:document.entrprsManageVO.reset();">취소</a></span></td>
		            </tr>
		        </table>
                </td>
            </tr>
        </table>

        </form:form>
        <!-- content end -->
</body>
</html>
