<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%
 /**
  * @Class Name : EgovUserSelectUpdt.jsp
  * @Description : 사용자상세조회, 수정 JSP
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet"  type="text/css">
<title>User Detail, Update, Delete</title>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="userManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/ccm/zip/EgovZipPopup.js' />" ></script>
<script type="text/javaScript" language="javascript" defer="defer">
<!--
function fnListPage(){
    document.userManageVO.action = "<c:url value='/uss/umt/EgovUserManage.do'/>";
    document.userManageVO.submit();
}
function fnDeleteUser(checkedIds) {
	if(confirm("<spring:message code="common.delete.msg" />")){
	    document.userManageVO.checkedIdForDel.value=checkedIds;
	    document.userManageVO.action = "<c:url value='/uss/umt/EgovUserDelete.do'/>";
	    document.userManageVO.submit();
	}
}
function fnPasswordMove(){
	document.userManageVO.action = "<c:url value='/uss/umt/EgovUserPasswordUpdtView.do'/>";
    document.userManageVO.submit();
}
function fnUpdate(){
    if(validateUserManageVO(document.userManageVO)){
        document.userManageVO.submit();
    }
}
function fn_egov_inqire_cert() {
	var url = "<c:url value='/uat/uia/EgovGpkiRegist.do' />";
	var popupwidth = '500';
	var popupheight = '400';
	var title = '인증서';

	Top = (window.screen.height - popupheight) / 3;
	Left = (window.screen.width - popupwidth) / 2;
	if (Top < 0) Top = 0;
	if (Left < 0) Left = 0;
	Future = "fullscreen=no,toolbar=no,location=no,directories=no,status=no,menubar=no,	scrollbars=no,resizable=no,left=" + Left + ",top=" + Top + ",width=" + popupwidth + ",height=" + popupheight;
	PopUpWindow = window.open(url, title, Future)
	PopUpWindow.focus();
}

function fn_egov_dn_info_setting(dn) {
	var frm = document.userManageVO;

	frm.subDn.value = dn;
}
/*
if (typeof(opener.fn_egov_dn_info_setting) == 'undefined') {
	alert('메인 화면이 변경되거나 없습니다');
	this.close();
} else {
	opener.fn_egov_dn_info_setting(dn);
	this.close();
}
*/
//-->
</script>
</head>
<body>
        <!-- content start -->
        <form:form commandName="userManageVO" action="${pageContext.request.contextPath}/uss/umt/EgovUserSelectUpdt.do" name="userManageVO" method="post" >

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
        <input type="hidden" name="userTyForPassword" value="<c:out value='${userManageVO.userTy}'/>" />
        <!-- for validation -->
	    <input type="hidden" name="password" id="password" value="Test#$123)"/>        

        <table width="717" cellpadding="8" class="table-search" border="0">
            <tr>
            <td width="100%"class="title_left">
            <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" alt="" />&nbsp;업무사용자 상세조회(수정)</td>
            </tr>
        </table>
        <table width="717" border="0" cellpadding="0" cellspacing="1" class="table-register">
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                사용자아이디<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
                </th>
                <td width="80%" nowrap>
                    <form:input path="emplyrId" id="emplyrId" cssClass="txaIpUmt" size="20" maxlength="20" readonly="true" title="사용자아이디" />
                    <form:errors path="emplyrId" cssClass="error"/>
                    <form:hidden path="uniqId" />
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                사용자이름<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
                </th>
                <td width="80%" nowrap>
                    <form:input path="emplyrNm" id="emplyrNm" cssClass="txaIpUmt" size="20"  maxlength="60" title="사용자이름" />
                    <form:errors path="emplyrNm" cssClass="error" />
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
                <th width="20%" height="23" class="required_text" nowrap >소속기관코드&nbsp;&nbsp;</th>
                <td width="80%" nowrap>
                    <form:select path="insttCode" id="insttCode" title="소속기관코드">
                        <form:option value="" label="--선택하세요--"/>
                        <form:options items="${insttCode_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                    <form:errors path="insttCode" cssClass="error"/>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >조직아이디&nbsp;&nbsp;</th>
                <td width="80%" nowrap>
                    <form:select path="orgnztId" id="orgnztId" title="조직아이디">
                        <form:option value="" label="--선택하세요--"/>
                        <form:options items="${orgnztId_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                    <form:errors path="orgnztId" cssClass="error"/>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >직위명&nbsp;&nbsp;</th>
                <td width="80%" nowrap>
                    <form:input path="ofcpsNm" id="ofcpsNm" cssClass="txaIpUmt" size="20" maxlength="50" title="직위명"/>
                    <form:errors path="ofcpsNm" cssClass="error" />
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >사번&nbsp;&nbsp;</th>
                <td width="80%" nowrap>
                    <form:input path="emplNo" id="emplNo" cssClass="txaIpUmt" size="20" maxlength="20" title="사번"/>
                    <form:errors path="emplNo" cssClass="error" />
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
                <th width="20%" height="23" class="required_text" nowrap >생일&nbsp;&nbsp;</th>
                <td width="80%" nowrap>
                    <form:input path="brth" id="brth" cssClass="txaIpUmt" size="20" maxlength="8" title="생일"/>
                    <form:errors path="brth" cssClass="error" />
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                집전화번호<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
                </th>
                <td width="80%" nowrap>
                    <form:input path="areaNo" id="areaNo" cssClass="txaIpUmt" size="4" maxlength="4" title="지역번호"/>
                    - <form:input path="homemiddleTelno" id="homemiddleTelno" cssClass="txaIpUmt" size="4" maxlength="4" title="중간번호"/>
                    - <form:input path="homeendTelno" id="homeendTelno" cssClass="txaIpUmt" size="4" maxlength="4" title="끝자리번호"/>
                    <form:errors path="areaNo" cssClass="error" />
                    <form:errors path="homemiddleTelno" cssClass="error" />
                    <form:errors path="homeendTelno" cssClass="error" />
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >사무실전화번호&nbsp;&nbsp;</th>
                <td width="80%" nowrap>
                    <form:input path="offmTelno" id="offmTelno" cssClass="txaIpUmt" size="20" maxlength="15" title="사무실전화번호"/>
                    <form:errors path="offmTelno" cssClass="error" />
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >팩스번호&nbsp;&nbsp;</th>
                <td width="80%" nowrap>
                    <form:input path="fxnum" id="fxnum" cssClass="txaIpUmt" size="20" maxlength="15" title="팩스번호"/>
                    <form:errors path="fxnum" cssClass="error" />
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >핸드폰번호&nbsp;&nbsp;</th>
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
                    <form:input path="emailAdres" id="emailAdres" cssClass="txaIpUmt" size="20" maxlength="50" title="이메일주소"/>
                    <form:errors path="emailAdres" cssClass="error" />
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                우편번호<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
                </th>
                <td width="80%" nowrap>
                    <input name="zip_view" id="zip_view" type="text" size="20" value="<c:out value='${userManageVO.zip}'/>"  maxlength="8" readonly title="우편번호"/>
                    <form:hidden path="zip" />
                        <a href="#LINK" onclick="fn_egov_ZipSearch(document.userManageVO, document.userManageVO.zip, document.userManageVO.zip_view, document.userManageVO.homeadres);">
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
                    <form:input path="homeadres" id="homeadres" cssClass="txaIpUmt" size="40" maxlength="100" readonly="true" title="주소"/>
                    <form:errors path="homeadres" cssClass="error" />
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >상세주소&nbsp;&nbsp;</th>
                <td width="80%" nowrap>
                    <form:input path="detailAdres" id="detailAdres" cssClass="txaIpUmt" size="40" maxlength="50" title="상세주소"/>
                    <form:errors path="detailAdres" cssClass="error" />
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                그룹아이디<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
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
                사용자상태코드<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
                </th>
                <td width="80%" nowrap>
                    <form:select path="emplyrSttusCode" id="emplyrSttusCode" title="사용자상태코드">
                        <form:option value="" label="--선택하세요--"/>
                        <form:options items="${emplyrSttusCode_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                    <form:errors path="emplyrSttusCode" cssClass="error"/>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >사용자DN&nbsp;&nbsp;</th>
                <td width="80%" nowrap>
                    <form:input path="subDn" id="subDn" cssClass="txaIpUmt" size="40" maxlength="100" title="사용자DN"/>
                    &nbsp;<a href="#LINK" onclick="fn_egov_inqire_cert()" style="selector-dummy: expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/search.gif' />"
	     			width="15" height="15" alt="search"/></a>
                    <form:errors path="subDn" cssClass="error" />
                    <input type="hidden" name="password" value="dummy">
                </td>
            </tr>
            
        </table>
        <table width="717" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td height="10"></td>
            </tr>
            <tr>
                <td align="center">
                <table border="0" cellspacing="0" cellpadding="0" align="center" >
		            <tr>
		                <!-- 수정 -->
		                <td><span class="button"><input type="submit" value="<spring:message code="button.update" />" onclick="fnUpdate(); return false;" /></span>&nbsp;</td>
		                <!-- 삭제 -->
		                <td><span class="button"><a href="<c:url value='/uss/umt/EgovUserDelete.do'/>" onclick="fnDeleteUser('<c:out value='${userManageVO.userTy}'/>:<c:out value='${userManageVO.uniqId}'/>'); return false;"><spring:message code="button.delete" /></a></span>&nbsp;</td>
		                <!-- 목록 -->
		                <td><span class="button"><a href="<c:url value='/uss/umt/EgovUserManage.do'/>" onclick="fnListPage(); return false;"><spring:message code="button.list" /></a></span>&nbsp;</td>
                        <!-- 암호변경 -->
		                <td><span class="button"><a href="<c:url value='/uss/umt/EgovUserPasswordUpdtView.do'/>" onclick="fnPasswordMove(); return false;"><spring:message code="button.passwordUpdate" /></a></span>&nbsp;</td>
                        <!-- 취소 -->
		                <td><span class="button"><a href="#LINK" onclick="javascript:document.userManageVO.reset();"><spring:message code="button.reset" /></a></span></td>
		            </tr>
		        </table>
                </td>
            </tr>
        </table>

        </form:form>
        <!-- content end -->
</body>
</html>
