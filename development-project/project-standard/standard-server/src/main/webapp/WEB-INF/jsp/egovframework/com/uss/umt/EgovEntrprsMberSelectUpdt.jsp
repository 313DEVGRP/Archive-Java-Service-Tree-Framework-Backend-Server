<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%
 /**
  * @Class Name : EgovEntrprsMberSelectUpdt.jsp
  * @Description : 사용자상세조회, 수정 JSP
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
<title>User Detail, Update, Delete</title>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="entrprsManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/ccm/zip/EgovZipPopup.js' />" ></script>
<script type="text/javaScript" language="javascript" defer="defer">
<!--
function fnListPage(){
    document.entrprsManageVO.action = "<c:url value='/uss/umt/EgovEntrprsMberManage.do'/>";
    document.entrprsManageVO.submit();
}
function fnDeleteEntrprs(checkedIds) {
	if(confirm("<spring:message code="common.delete.msg" />")){
		document.entrprsManageVO.checkedIdForDel.value=checkedIds;
	    document.entrprsManageVO.action = "<c:url value='/uss/umt/EgovEntrprsMberDelete.do'/>";
	    document.entrprsManageVO.submit();
	}
}
function fnPasswordMove(){
    document.entrprsManageVO.action = "<c:url value='/uss/umt/EgovEntrprsPasswordUpdtView.do'/>";
    document.entrprsManageVO.submit();
}
function fnUpdate(){
	if(validateEntrprsManageVO(document.entrprsManageVO)){
		document.entrprsManageVO.submit();
    }
}
//-->
</script>
</head>
<body>

        <!-- content start -->
        <form:form commandName="entrprsManageVO" action="${pageContext.request.contextPath}/uss/umt/EgovEntrprsMberSelectUpdt.do" name="entrprsManageVO" method="post" >

        <!-- <form name="detailForm" method="post" action="<c:url value="${'/uss/umt/EgovEntrprsMberSelectUpdt.do'}"/>">  -->

        <!-- 상세정보 사용자 삭제시 prameter 전달용 input -->
        <input name="checkedIdForDel" type="hidden" />
        <!-- 검색조건 유지 -->
        <input type="hidden" name="searchCondition" value="<c:out value='${userSearchVO.searchCondition}'/>"/>
        <input type="hidden" name="searchKeyword" value="<c:out value='${userSearchVO.searchKeyword}'/>"/>
        <input type="hidden" name="sbscrbSttus" value="<c:out value='${userSearchVO.sbscrbSttus}'/>"/>
        <input type="hidden" name="pageIndex" value="<c:out value='${userSearchVO.pageIndex}'/>"/>
        <!-- 우편번호검색 -->
        <input type="hidden" name="zip_url" value="<c:url value='/sym/ccm/zip/EgovCcmZipSearchPopup.do'/>" />
        <!-- 사용자유형정보 : password 수정화면으로 이동시 타겟 유형정보 확인용, 만약검색조건으로 유형이 포함될경우 혼란을 피하기위해 userTy명칭을 쓰지 않음-->
        <input type="hidden" name="userTyForPassword" value="<c:out value='${entrprsManageVO.userTy}'/>" />
        <!-- for validation -->
	    <input type="hidden" name="password" id="password" value="Test#$123)"/>

        <table width="717" cellpadding="8" class="table-search" border="0">
            <tr>
            <td width="100%"class="title_left">
            <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" alt="" />&nbsp;기업회원 상세조회(수정)</td>
            </tr>
        </table>
        <table width="717" border="0" cellpadding="0" cellspacing="1" class="table-register">
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                    기업회원아이디<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
                </th>
                <td width="80%" nowrap><label for="entrprsmberId">
                    <form:input path="entrprsmberId" id="entrprsmberId" size="20" cssClass="txaIpUmt" readonly="true" maxlength="20" /></label>
                    <div><form:errors path="entrprsmberId" cssClass="error"/></div>
                    <form:hidden path="uniqId" />
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                    회사명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
                </th>
                <td width="80%" nowrap><label for="cmpnyNm">
                    <!-- <input name="cmpnyNm" type="text" size="20" value="<c:out value='${entrprsManageVO.cmpnyNm}'/>"  maxlength="20" > -->
                    <form:input path="cmpnyNm" id="cmpnyNm" size="45" cssClass="txaIpUmt" readonly="false" maxlength="50" /></label>
                    <div><form:errors path="cmpnyNm" cssClass="error"/></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                    비밀번호힌트<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
                </th>
                <td width="80%" nowrap><label for="entrprsMberPasswordHint">
                    <form:select path="entrprsMberPasswordHint" id="entrprsMberPasswordHint">
                        <form:option value="" label="--선택하세요--"/>
                        <form:options items="${passwordHint_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                    </label>
                    <div><form:errors path="entrprsMberPasswordHint" cssClass="error"/></div>
                    </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                    비밀번호정답<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
                </th>
                <td width="80%" nowrap><label for="entrprsMberPasswordCnsr">
                    <form:input path="entrprsMberPasswordCnsr" id="entrprsMberPasswordCnsr" cssClass="txaIpUmt" size="50" maxlength="100" /></label>
                    <div><form:errors path="entrprsMberPasswordCnsr" cssClass="error"/></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >업종코드&nbsp;&nbsp;</th>
                <td width="80%" nowrap><label for="indutyCode">
                    <form:select path="indutyCode" id="indutyCode">
                        <form:option value="" label="--선택하세요--"/>
                        <form:options items="${indutyCode_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                    </label>
                    <div><form:errors path="indutyCode" cssClass="error"/></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >기업구분코드&nbsp;&nbsp;</th>
                <td width="80%" nowrap><label for="entrprsSeCode">
                    <form:select path="entrprsSeCode" id="entrprsSeCode">
                        <form:option value="" label="--선택하세요--"/>
                        <form:options items="${entrprsSeCode_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                    </label>
                    <div><form:errors path="entrprsSeCode" cssClass="error"/></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >대표이사이름&nbsp;&nbsp;</th>
                <td width="80%" nowrap><label for="cxfc">
                    <form:input path="cxfc" id="cxfc" cssClass="txaIpUmt" size="20"  maxlength="8" />
                    </label>
                    <div><form:errors path="cxfc" cssClass="error"/></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                    사업자등록번호<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
                </th>
                <td width="80%" nowrap><label for="bizrno">
                    <form:input path="bizrno" id="bizrno" cssClass="txaIpUmt" size="20" maxlength="20" />
                    </label>
                    <div><form:errors path="bizrno" cssClass="error"/></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >법인등록번호&nbsp;&nbsp;</th>
                <td width="80%" nowrap><label for="jurirno">
                    <form:input path="jurirno" id="jurirno" cssClass="txaIpUmt" size="20" maxlength="13" />
                    </label>
                    <div><form:errors path="jurirno" cssClass="error"/></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                    회사전화번호<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
                </th>
                <td width="80%" nowrap>
                    <label for="areaNo"><form:input path="areaNo" id="areaNo" cssClass="txaIpUmt" size="5" maxlength="20" /></label>
                    - <label for="entrprsMiddleTelno"><form:input path="entrprsMiddleTelno" id="entrprsMiddleTelno" cssClass="txaIpUmt" size="5" maxlength="100" /></label>
                    - <label for="entrprsEndTelno"><form:input path="entrprsEndTelno" id="entrprsEndTelno" cssClass="txaIpUmt" size="5" maxlength="5" /></label>
                    <div><form:errors path="areaNo" cssClass="error"/></div>
                    <div><form:errors path="entrprsMiddleTelno" cssClass="error"/></div>
                    <div><form:errors path="entrprsEndTelno" cssClass="error"/></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >팩스번호&nbsp;&nbsp;</th>
                <td width="80%" nowrap><label for="fxnum">
                    <form:input path="fxnum" id="fxnum" cssClass="txaIpUmt" size="20" maxlength="15" /></label>
                    <div><form:errors path="fxnum" cssClass="error"/></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                    우편번호<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
                </th>
                <td width="80%" nowrap><label for="zip_view">
                    <input name="zip_view" id="zip_view" type="text" size="20" value="<c:out value='${entrprsManageVO.zip}'/>"  maxlength="8" readonly/>
                    <form:hidden path="zip" />
                        <a href="#LINK" onclick="fn_egov_ZipSearch(document.entrprsManageVO, document.entrprsManageVO.zip, document.entrprsManageVO.zip_view, document.entrprsManageVO.adres);">
                            <img src="<c:url value='/images/egovframework/com/cmm/icon/search.gif' />" alt="" />(우편번호 검색)
                        </a></label>
                    <div><form:errors path="zip" cssClass="error"/></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                    주소<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
                </th>
                <td width="80%" nowrap><label for="adres">
                    <form:input path="adres" id="adres" cssClass="txaIpUmt" size="70" maxlength="50" readonly="true" /></label>
                    <div><form:errors path="adres" cssClass="error"/></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >상세주소&nbsp;&nbsp;</th>
                <td width="80%" nowrap><label for="detailAdres">
                    <form:input path="detailAdres" id="detailAdres" cssClass="txaIpUmt" size="70"  maxlength="50" /></label>
                    <div><form:errors path="detailAdres" cssClass="error"/></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                    신청자이름<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
                </th>
                <td width="80%" nowrap><label for="applcntNm">
                    <form:input path="applcntNm" id="applcntNm" cssClass="txaIpUmt" size="20" maxlength="20" /></label>
                    <div><form:errors path="applcntNm" cssClass="error"/></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                    신청자이메일주소<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
                </th>
                <td width="80%" nowrap><label for="applcntEmailAdres">
                    <form:input path="applcntEmailAdres" id="applcntEmailAdres" cssClass="txaIpUmt" size="30" maxlength="50" /></label>
                    <div><form:errors path="applcntEmailAdres" cssClass="error"/></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                    그룹아이디
                </th>
                <td width="80%" nowrap><label for="groupId">
                    <form:select path="groupId" id="groupId">
                        <form:option value="" label="--선택하세요--"/>
                        <form:options items="${groupId_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select></label>
                    <div><form:errors path="groupId" cssClass="error"/></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                    기업회원상태코드<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
                </th>
                <td width="80%" nowrap><label for="entrprsMberSttus">
                    <form:select path="entrprsMberSttus" id="entrprsMberSttus">
                        <form:option value="" label="--선택하세요--"/>
                        <form:options items="${entrprsMberSttus_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select></label>
                    <div><form:errors path="entrprsMberSttus" cssClass="error"/></div>
                    <input type="hidden" name="entrprsMberPassword" value="dummy">
                </td>
            </tr>
           
        </table>
        <table width="717" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td height="10"></td>
            </tr>
            <tr>
                <td>
                <table border="0" cellspacing="0" cellpadding="0" align="center">
		            <tr>
                        <!-- 수정 -->
                        <td><span class="button"><input type="submit" value="<spring:message code="button.update" />" onclick="fnUpdate(); return false;" /></span>&nbsp;</td>
                        <!-- 삭제 -->
                        <td><span class="button"><a href="<c:url value='/uss/umt/EgovEntrprsMberDelete.do'/>" onclick="fnDeleteEntrprs('<c:out value='${entrprsManageVO.userTy}'/>:<c:out value='${entrprsManageVO.uniqId}'/>');; return false;"><spring:message code="button.delete" /></a></span>&nbsp;</td>
                        <!-- 목록 -->
                        <td><span class="button"><a href="<c:url value='/uss/umt/EgovEntrprsMberManage.do'/>" onclick="fnListPage(); return false;"><spring:message code="button.list" /></a></span>&nbsp;</td>
                        <!-- 암호변경 -->
                        <td><span class="button"><a href="<c:url value='/uss/umt/EgovEntrprsPasswordUpdtView.do'/>" onclick="fnPasswordMove();return false;"><spring:message code="button.passwordUpdate" /></a></span>&nbsp;</td>
                        <!-- 취소 -->
                        <td><span class="button"><a href="#LINK" onclick="javascript:document.entrprsManageVO.reset();"><spring:message code="button.reset" /></a></span></td>
		            </tr>
		        </table>

                </td>
            </tr>
        </table>

        </form:form>
        <!-- content end -->
</body>
</html>
