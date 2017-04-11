<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%
 /**
  * @Class Name : EgovMberSelectUpdt.jsp
  * @Description : 일반회원상세조회, 수정 JSP
  * @Modification Information
  * @
  * @  수정일         수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.03.02    조재영          최초 생성
  *
  *  @author 공통서비스 개발팀 조재영
  *  @since 2009.03.02
  *  @version 1.0
  *  @see
  *
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />" type="text/css">
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />" type="text/css">
<title>Mber Detail, Update, Delete</title>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="mberManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/ccm/zip/EgovZipPopup.js' />" ></script>
<script type="text/javaScript" language="javascript" defer="defer">
<!--
function fnListPage(){
    document.mberManageVO.action = "<c:url value='/uss/umt/EgovMberManage.do'/>";
    document.mberManageVO.submit();
}
function fnDeleteMber(checkedIds) {
	if(confirm("<spring:message code="common.delete.msg" />")){
	    document.mberManageVO.checkedIdForDel.value=checkedIds;
	    document.mberManageVO.action = "<c:url value='/uss/umt/EgovMberDelete.do'/>";
	    document.mberManageVO.submit();
	}
}
function fnPasswordMove(){
    document.mberManageVO.action = "<c:url value='/uss/umt/EgovMberPasswordUpdtView.do'/>";
    document.mberManageVO.submit();
}
function fnUpdate(){
	if(validateMberManageVO(document.mberManageVO)){
		document.mberManageVO.submit();
    }
}
//-->
</script>
</head>
<body>
        <!-- content start -->
        <form:form commandName="mberManageVO" action="${pageContext.request.contextPath}/uss/umt/EgovMberSelectUpdt.do" name="mberManageVO"  method="post" >

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
        <input type="hidden" name="userTyForPassword" value="<c:out value='${mberManageVO.userTy}'/>" />
        <!-- for validation -->
	    <input type="hidden" name="password" id="password" value="Test#$123)"/>

        <table width="717" cellpadding="8" class="table-search" border="0">
            <tr>
            <td width="100%"class="title_left">
            <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" alt="" />&nbsp;일반회원 상세조회(수정)</td>
            </tr>
        </table>
        <table width="717" border="0" cellpadding="0" cellspacing="1" class="table-register">
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                    일반회원아이디<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
                </th>
                <td width="80%" nowrap>
                    <form:input path="mberId" id="mberId" size="20" cssClass="txaIpUmt" readonly="true" maxlength="20" title="일반회원아이디"/>
                    <form:errors path="mberId" cssClass="error" />
                    <form:hidden path="uniqId" />
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                    일반회원이름<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
                </th>
                <td width="80%" nowrap>
                    <form:input path="mberNm" id="mberNm" cssClass="txaIpUmt" size="20" maxlength="60" title="일반회원이름"/>
                    <form:errors path="password" cssClass="error" />
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                    비밀번호힌트<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
                </th>
                <td width="80%" nowrap>
                    <form:select path="passwordHint" id="passwordHint" title="비밀번호힌트">
                        <form:option value="" label="--선택하세요--"/>
                        <form:options items="${passwordHint_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                    <form:errors path="passwordHint" cssClass="error"/>
                    </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                    비밀번호정답<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
                </th>
                <td width="80%" nowrap>
                    <form:input path="passwordCnsr" id="passwordCnsr" cssClass="txaIpUmt" size="50" maxlength="100" title="비밀번호정답"/>
                    <form:errors path="passwordCnsr" cssClass="error"/>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >성별구분코드&nbsp;&nbsp;</th>
                <td width="80%" nowrap>
                    <form:select path="sexdstnCode" id="sexdstnCode" title="성별구분코드">
                        <form:option value="" label="--선택하세요--"/>
                        <form:options items="${sexdstnCode_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                    전화번호<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
                </th>
                <td width="80%" nowrap>
                    <form:input path="areaNo" id="areaNo" cssClass="txaIpUmt" size="5" maxlength="5" title="지역번호"/>
                    - <form:input path="middleTelno" id="middleTelno" cssClass="txaIpUmt" size="5" maxlength="5" title="중간번호"/>
                    - <form:input path="endTelno" id="endTelno" cssClass="txaIpUmt" size="5" maxlength="5" title="끝번호"/>
                    <form:errors path="areaNo" cssClass="error" />
                    <form:errors path="middleTelno" cssClass="error" />
                    <form:errors path="endTelno" cssClass="error" />
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >팩스번호&nbsp;&nbsp;</th>
                <td width="80%" nowrap>
                    <form:input path="mberFxnum" id="mberFxnum" cssClass="txaIpUmt" size="20"  maxlength="15" title="팩스번호"/>
                    <form:errors path="mberFxnum" cssClass="error" />
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                    핸드폰번호<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
                </th>
                <td width="80%" nowrap>
                    <form:input path="moblphonNo" id="moblphonNo" cssClass="txaIpUmt" size="20" maxlength="15" title="핸드폰번호"/>
                    <form:errors path="moblphonNo" cssClass="error" />
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                    이메일주소<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
                </th>
                <td width="80%" nowrap>
                    <form:input path="mberEmailAdres" id="mberEmailAdres" cssClass="txaIpUmt" size="30" maxlength="50" title="이메일주소"/>
                    <form:errors path="mberEmailAdres" cssClass="error" />
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                    우편번호<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
                </th>
                <td width="80%" nowrap>
                    <input name="zip_view" id="zip_view" type="text" size="20" value="<c:out value='${mberManageVO.zip}'/>" maxlength="8" readonly title="우편번호"/>
                    <form:hidden path="zip" />
                        <a href="#LINK" onclick="fn_egov_ZipSearch(document.mberManageVO, document.mberManageVO.zip, document.mberManageVO.zip_view, document.mberManageVO.adres);">
                            <img src="<c:url value='/images/egovframework/com/cmm/icon/search.gif' />" alt="" />(우편번호 검색)
                        </a>
                    <form:errors path="zip" cssClass="error" />
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                    주소<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
                </th>
                <td width="80%" nowrap>
                    <form:input path="adres" id="adres" cssClass="txaIpUmt" size="70" maxlength="100" readonly="true" title="주소"/>
                    <form:errors path="adres" cssClass="error" />
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >상세주소&nbsp;&nbsp;</th>
                <td width="80%" nowrap>
                    <form:input path="detailAdres" id="detailAdres" cssClass="txaIpUmt" size="70" maxlength="100" title="상세주소"/>
                   <form:errors path="detailAdres" cssClass="error" />
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                    그룹아이디
                </th>
                <td width="80%" nowrap>
                    <form:select path="groupId" id="groupId" title="그룹아이디">
                        <form:option value="" label="--선택하세요--"/>
                        <form:options items="${groupId_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                    <form:errors path="groupId" cssClass="error"/>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                    일반회원상태코드<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
                </th>
                <td width="80%" nowrap>
                    <form:select path="mberSttus" id="mberSttus" title="일반회원상태코드">
                        <form:option value="" label="--선택하세요--"/>
                        <form:options items="${mberSttus_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                    <form:errors path="mberSttus" cssClass="error"/>
                     <input type="hidden" name="password" value="dummy">
                </td>
            </tr>
            
        </table>

        <table width="717">
            <tr>
                <td colspan="2" height="10"></td>
            </tr>
            <tr>
                <td height="10" align="center">
                <table border="0" cellspacing="0" cellpadding="0" align="center">
                    <tr>
                        <!-- 수정 -->
                        <td><span class="button"><input type="submit" value="<spring:message code="button.update" />" onclick="fnUpdate(); return false;" /></span>&nbsp;</td>
                        <!-- 삭제 -->
                        <td><span class="button"><a href="<c:url value='/uss/umt/EgovMberManage.do'/>" onclick="fnDeleteMber('<c:out value='${mberManageVO.userTy}'/>:<c:out value='${mberManageVO.uniqId}'/>'); return false;"><spring:message code="button.delete" /></a></span>&nbsp;</td>
                        <!-- 목록 -->
                        <td><span class="button"><a href="<c:url value='/uss/umt/EgovMberManage.do'/>" onclick="fnListPage(); return false;"><spring:message code="button.list" /></a></span>&nbsp;</td>
                        <!-- 암호변경 -->
                        <td><span class="button"><a href="<c:url value='/uss/umt/EgovMberPasswordUpdtView.do'/>" onclick="fnPasswordMove(); return false;"><spring:message code="button.passwordUpdate" /></a></span>&nbsp;</td>
                        <!-- 취소 -->
                        <td><span class="button"><a href="#LINK" onclick="javascript:document.mberManageVO.reset();"><spring:message code="button.reset" /></a></span>&nbsp;</td>
                    </tr>
                </table>
                </td>
            </tr>
        </table>

        </form:form>
        <!-- content end -->
</body>
</html>
