<%--
/**
 * @Class Name  : EgovLoginSesionCheck.java
 * @Description : EgovLoginSesionCheck jsp
 * @Modification Information
 * @
 * @  수정일                    수정자                수정내용
 * @ ---------     --------    ---------------------------
 * @ 2010.09.01    lee.m.j     최초 생성
 * @ 2015.04.09	   전여철	   기본 url을 /index.do로 변경
 *
 *  @author lee.m.j
 *  @since 2010.07.01
 *  @version 1.0
 *  @see
 *
 *  Copyright (C) 2009 by MOPAS  All right reserved.
 */
--%>

<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<title>로그인 세션정보 체크</title>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="proxySvc" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript" defer="defer">
<!--

function fncSelectLoginSession() {
    var varFrom = document.getElementById("loginSessionCheck");
    varFrom.action = "<c:url value='/utl/sys/rsc/loginSessionView.do'/>";
    varFrom.submit();
}

function fncSetLoginSession() {
    var varFrom = document.getElementById("loginSessionCheck");
    varFrom.action = "<c:url value='/utl/sys/rsc/setLoginSession.do'/>";

    if(confirm("설정 하시겠습니까?")){
        varFrom.submit();
    }
}

function fncgetLoginSessionView(url) {
    window.open(url,"notice","width=800, height=600, top=50, left=20, scrollbars=no, resizable=no");
}

-->
</script>
</head>
 <%
     // 세션 정보를 가져온다. LoginVO
     egovframework.com.cmm.LoginVO user = (egovframework.com.cmm.LoginVO)egovframework.com.cmm.util.EgovUserDetailsHelper.getAuthenticatedUser();
	 String contextPath = request.getContextPath();
	 if(user.getUrl() == null || user.getUrl().equals("")) user.setUrl(contextPath+"/index.do");
 %>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<div id="border" style="width:730px">
<table border="0">
  <tr>
    <td width="700">
    <form:form commandName="loginSessionCheck" method="post" action="${pageContext.request.contextPath}/utl/sys/rsc/setLoginSession.do">
    <table width="100%" class="table-search" border="0">
     <tr>
      <td width="170" class="title_left"><h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" style="vertical-align:middle;" alt="">&nbsp;로그인 세션정보 체크</h1></td>
      <td width="400">&nbsp;</td>
      <td width="150" align="right">
           <table border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><span class="button"><a href="<c:url value='/utl/sys/rsc/loginSessionView.do'/>" onclick="fncSelectLoginSession(); return false;"><spring:message code="button.inquire" /></a></span></td>
              <td>&nbsp;&nbsp;</td>
              <td><span class="button"><input type="submit" value="설정" onclick="fncSetLoginSession(); return false;"></span></td>
              <td>&nbsp;&nbsp;</td>
              <td><span class="button"><a href="<%=user.getUrl() %>" target=“_blank” title="새창" onclick="fncgetLoginSessionView('<%=user.getUrl() %>'); return false;">이동</a></span></td>
            </tr>
           </table>
      </td>
     </tr>
     <tr>
      <td class="title_left" colspan="3"></td>
     </tr>
    </table>

    <table width="100%" cellpadding="8" class="table-line" summary="로그인 세션정보를 설정 및 체크한다.">
      <caption>로그인 세션정보 체크</caption>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>URL<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="url"><input name="url" id="url" type="text" maxLength="1000" size="80" ></label></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>세션 URL<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="sessionUrl"><input name="sessionUrl" id="sessionUrl" value="<%=user.getUrl() %>" type="text" maxLength="1000" size="80" readOnly class="readOnlyClass"></label></td>
      </tr>
    </table>


</form:form>
</td>
</tr>
</table>

</DIV>
</body>
</html>
