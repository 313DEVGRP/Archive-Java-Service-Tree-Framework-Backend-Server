<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%
 /**
  * @Class Name : EgovUserInsert.jsp
  * @Description : 사용자등록View JSP
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
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet"  type="text/css">
<title>User Insert</title>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="userManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/ccm/zip/EgovZipPopup.js' />" ></script>
<script type="text/javaScript" language="javascript" defer="defer">
<!--
function fnIdCheck(){
    var retVal;
    var url = "<c:url value='/uss/umt/EgovIdDplctCnfirmView.do'/>";
    var varParam = new Object();
    varParam.checkId = document.userManageVO.emplyrId.value;
    var openParam = "dialogWidth:303px;dialogHeight:250px;scroll:no;status:no;center:yes;resizable:yes;";
    retVal = window.showModalDialog(url, varParam, openParam);
    if(retVal) {
        document.userManageVO.emplyrId.value = retVal;
    }
}
function showModalDialogCallback(retVal) {
	if(retVal) {
	    document.userManageVO.emplyrId.value = retVal;
	}
}
function fnListPage(){
    document.userManageVO.action = "<c:url value='/uss/umt/EgovUserManage.do'/>";
    document.userManageVO.submit();
}
function fnInsert(){
    if(validateUserManageVO(document.userManageVO)){
    	if(document.userManageVO.password.value != document.userManageVO.password2.value){
            alert("<spring:message code="fail.user.passwordUpdate2" />");
            return;
        }
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
        <form:form commandName="userManageVO" action="${pageContext.request.contextPath}/uss/umt/EgovUserInsert.do" name="userManageVO" method="post" >
            <!-- 우편번호검색 -->
            <input type="hidden" name="zip_url" value="<c:url value='/sym/ccm/zip/EgovCcmZipSearchPopup.do'/>" />
        <table width="717" cellpadding="8" class="table-search" border="0">
            <tr>
              <td width="100%" class="title_left"><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" alt="" />&nbsp;업무사용자 등록</td>
            </tr>
        </table>
        <table width="717" border="0" cellpadding="0" cellspacing="1" class="table-register">
            <tr>
                <th width="20%" height="23" class="required_text">사용자아이디<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" /></th>
                <td width="80%" >
                    <form:input path="emplyrId" id="emplyrId" title="사용자아이디" cssClass="txaIpUmt" size="20" maxlength="20" readonly="true" />
                    <a href="#LINK" onclick="fnIdCheck();">
                        <img src="<c:url value='/images/egovframework/com/cmm/icon/search.gif' />" alt="" />(중복아이디 검색)
                    </a>
                    <div><form:errors path="emplyrId" cssClass="error"/></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text"  >
                    사용자이름<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
                </th>
                <td width="80%" >
                    <input name="emplyrNm" id="emplyrNm" title="사용자이름" type="text" size="20" value="" maxlength="60" />
                    <div><form:errors path="emplyrNm" cssClass="error" /></div>
                </td>
            </tr>

            <tr>
                <th width="20%" height="23" class="required_text"  >
                    비밀번호<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
                </th>
                <td width="80%" >
                    <form:password path="password" id="password" title="비밀번호" size="20" maxlength="20" />
                    <div><form:errors path="password" cssClass="error" /></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text"  >
                    비밀번호확인<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
                </th>
                <td width="80%" >
                    <input name="password2" id="password2" title="비밀번호확인" type="password" size="20" maxlength="20" />
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text"  >
                    비밀번호힌트<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
                </th>
                <td width="80%" >
                    <form:select path="passwordHint" id="passwordHint" title="비밀번호힌트">
                        <form:option value="" label="--선택하세요--"/>
                        <form:options items="${passwordHint_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                    <div><form:errors path="passwordHint" cssClass="error"/></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" >
                    비밀번호정답<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
                </th>
                <td width="80%" >
                    <form:input path="passwordCnsr" id="passwordCnsr" title="비밀번호정답" cssClass="txaIpUmt" size="50" maxlength="100" />
                    <div><form:errors path="passwordCnsr" cssClass="error"/></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text"  >소속기관코드&nbsp;&nbsp;</th>
                <td width="80%" >
                    <form:select path="insttCode" id="insttCode" title="소속기관코드">
                        <form:option value="" label="--선택하세요--"/>
                        <form:options items="${insttCode_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                    <div><form:errors path="insttCode" cssClass="error"/></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text"  >조직아이디&nbsp;&nbsp;</th>
                <td width="80%" >
                    <form:select path="orgnztId" id="orgnztId" title="조직아이디">
                        <form:option value="" label="--선택하세요--"/>
                        <form:options items="${orgnztId_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                    <div><form:errors path="orgnztId" cssClass="error"/></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text"  >직위명&nbsp;&nbsp;</th>
                <td width="80%" >
                    <form:input path="ofcpsNm" id="ofcpsNm" title="직위명" cssClass="txaIpUmt" size="20" maxlength="50" />
                    <div><form:errors path="ofcpsNm" cssClass="error" /></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text"  >사번&nbsp;&nbsp;</th>
                <td width="80%" >
                    <form:input path="emplNo" id="emplNo" title="사번" cssClass="txaIpUmt" size="20" maxlength="20" />
                    <div><form:errors path="emplNo" cssClass="error" /></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text"  >성별구분코드&nbsp;&nbsp;</th>
                <td width="80%" >
                    <form:select path="sexdstnCode" id="sexdstnCode" title="성별구분코드">
                        <form:option value="" label="--선택하세요--"/>
                        <form:options items="${sexdstnCode_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text"  >생일&nbsp;&nbsp;</th>
                <td width="80%" >
                    <form:input path="brth" id="brth" cssClass="txaIpUmt" title="생일" size="20" maxlength="8" />
                    <div><form:errors path="brth" cssClass="error" /></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text"  >
                    집전화번호<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
                </th>
                <td width="80%" >
                    <form:input path="areaNo" id="areaNo" title="areaNo" cssClass="txaIpUmt" size="4" maxlength="4" />
                    - <form:input path="homemiddleTelno" title="homemiddleTelno" id="homemiddleTelno" cssClass="txaIpUmt" size="4" maxlength="4" />
                    - <form:input path="homeendTelno" title="homeendTelno" id="homeendTelno" cssClass="txaIpUmt" size="4" maxlength="4" />
                    <div><form:errors path="areaNo" cssClass="error" /></div>
                    <div><form:errors path="homemiddleTelno" cssClass="error" /></div>
                    <div><form:errors path="homeendTelno" cssClass="error" /></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text"  >사무실전화번호&nbsp;&nbsp;</th>
                <td width="80%" >
                    <form:input path="offmTelno" id="offmTelno" title="사무실전화번호" cssClass="txaIpUmt" size="20" maxlength="15" />
                    <div><form:errors path="offmTelno" cssClass="error" /></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text"  >팩스번호&nbsp;&nbsp;</th>
                <td width="80%" >
                    <form:input path="fxnum" id="fxnum" cssClass="txaIpUmt" title="팩스번호" size="20" maxlength="15" />
                    <div><form:errors path="fxnum" cssClass="error" /></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text">핸드폰번호&nbsp;&nbsp;</th>
                <td width="80%" >
                    <form:input path="moblphonNo" id="moblphonNo" title="핸드폰번호" cssClass="txaIpUmt" size="20" maxlength="15" />
                    <div><form:errors path="moblphonNo" cssClass="error" /></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text">
                    이메일주소<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
                </th>
                <td width="80%">
                    <form:input path="emailAdres" id="emailAdres" title="이메일주소" cssClass="txaIpUmt" size="20" maxlength="50" />
                    <div><form:errors path="emailAdres" cssClass="error" /></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text">
                    우편번호<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
                </th>
                <td width="80%" >
                    <input name="zip_view" id="zip_view" type="text" title="우편번호" size="20" value="<c:out value='${userManageVO.zip}'/>"  maxlength="8" readonly="readonly" />
                    <form:hidden path="zip" />
                        <a href="#LINK" onclick="javascript:fn_egov_ZipSearch(document.userManageVO, document.userManageVO.zip, document.userManageVO.zip_view, document.userManageVO.homeadres);">
                            <img src="<c:url value='/images/egovframework/com/cmm/icon/search.gif' />" alt="" />(우편번호 검색)
                        </a>
                    <div><form:errors path="zip" cssClass="error" /></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text"  >
                    주소<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
                </th>
                <td width="80%" >
                    <form:input path="homeadres" id="homeadres" title="주소" cssClass="txaIpUmt" size="40" maxlength="100" readonly="true" />
                    <div><form:errors path="homeadres" cssClass="error" /></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text"  >상세주소&nbsp;&nbsp;</th>
                <td width="80%" >
                    <form:input path="detailAdres" id="detailAdres" title="상세주소" cssClass="txaIpUmt" size="40" maxlength="50" />
                    <div><form:errors path="detailAdres" cssClass="error" /></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text"  >
                    그룹아이디<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
                </th>
                <td width="80%" >
                    <form:select path="groupId" id="groupId" title="그룹아이디">
                        <form:option value="" label="--선택하세요--"/>
                        <form:options items="${groupId_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                    <div><form:errors path="groupId" cssClass="error"/></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text"  >
                    사용자상태코드<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
                </th>
                <td width="80%" >
                    <form:select path="emplyrSttusCode" id="emplyrSttusCode" title="사용자상태코드">
                        <form:option value="" label="--선택하세요--"/>
                        <form:options items="${emplyrSttusCode_result}" itemValue="code" itemLabel="codeNm"/>
                    </form:select>
                    <div><form:errors path="emplyrSttusCode" cssClass="error"/></div>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text"  >사용자DN&nbsp;&nbsp;</th>
                <td width="80%" >
                    <form:input path="subDn" id="subDn" cssClass="txaIpUmt" title="사용자DN" size="40" maxlength="100" />
                    &nbsp;<a href="#LINK" onclick="fn_egov_inqire_cert()" style="selector-dummy: expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/search.gif' />"
	     			width="15" height="15" alt="search"/></a>
                    <div><form:errors path="subDn" cssClass="error" /></div>
                </td>
            </tr>
        </table>
        <table width="717" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td colspan="2" height="10"></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <table border="0" cellspacing="0" cellpadding="0" align="center">
                        <tr>
                            <td><span class="button"><input type="submit" value="<spring:message code="button.create" />" onclick="fnInsert(); return false;" /></span>&nbsp;</td>
                            <td><span class="button"><a href="<c:url value='/uss/umt/EgovUserManage.do'/>" onclick="fnListPage(); return false;"><spring:message code="button.list" /></a></span>&nbsp;</td>
                            <td><span class="button"><a href="#LINK" onclick="javascript:document.userManageVO.reset();"><spring:message code="button.reset" /></a></span></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>

        <!-- 검색조건 유지 -->
        <input type="hidden" name="searchCondition" value="<c:out value='${userSearchVO.searchCondition}'/>"/>
        <input type="hidden" name="searchKeyword" value="<c:out value='${userSearchVO.searchKeyword}'/>"/>
        <input type="hidden" name="sbscrbSttus" value="<c:out value='${userSearchVO.sbscrbSttus}'/>"/>
        <input type="hidden" name="pageIndex" value="<c:out value='${userSearchVO.pageIndex}'/>"/>
        </form:form>
        <!-- content end -->
</body>
</html>
