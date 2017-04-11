<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%
/**
 * @Class Name : EgovSmsInfoRegist.jsp
 * @Description : 문자메시지 등록화면
 * @Modification Information
 * @
 * @  수정일      수정자            수정내용
 * @ -------        --------    ---------------------------
 * @ 2009.06.18   한성곤          최초 생성
 *
 *  @author 공통컴포넌트개발팀 한성곤
 *  @since 2009.06.18
 *  @version 1.0 
 *  @see
 *  
 *  Copyright (C) 2009 by MOPAS  All right reserved.
 */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="sms" staticJavascript="false" xhtml="true" cdata="false"/>

<c:choose>
<c:when test="${not empty msg}">
<script type="text/javascript">
function loading() {
	alert("<c:out value='${msg}'/>");
}
</script>
</c:when>
<c:otherwise>
<script type="text/javascript">
function loading() {
	// no-op
}
</script>
</c:otherwise>
</c:choose>

<script type="text/javascript">	
	function fn_egov_regist_sms() {
		if (!validateSms(document.sms)){
			return;
		}

		var checked = false;
		for (var i = 0; i < document.sms.recptnTelno.length; i++) {
			if (document.sms.recptnTelno[i].value != '') {
				checked = true;
				break;
			}
		}

		if (!checked) {
			alert('<spring:message code="cop.sms.recptnTelno.msg" />');
			document.sms.recptnTelno[0].focus();
			return;
		}
		
		if (confirm('<spring:message code="common.regist.msg" />')) {
			form = document.sms;
			form.action = "<c:url value='/cop/sms/insertSms.do'/>";
			
			form.submit();					
		}
	}
	
	function fn_egov_select_sms() {
		form = document.sms;
		form.action = "<c:url value='/cop/sms/selectSmsList.do'/>";
		form.submit();	
	}
	
</script>

<title>문자메시지 전송</title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>


</head>
<body onload="loading();">

<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<div id="border" style="width:730px">

	<form:form commandName="sms" name="sms" method="post" action="${pageContext.request.contextPath}/cop/sms/insertSms.do' />">

	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">

	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="100%"class="title_left">
	  	<h1>
	  		<img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;문자메시지 전송
	  	</h1>
	  </td>
	 </tr>
	</table>
	<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="문자메시지에 대한 정보를  등록 및 전송합니다.">
	<tbody>
	  <tr> 
	    <th width="20%" height="23" class="required_text" nowrap ><label for="trnsmitTelno"><spring:message code="cop.sms.trnsmitTelno" /></label>
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
	    <td width="80%" nowrap colspan="3">
	    	<form:input path="trnsmitTelno" size="14" maxlength="14" cssStyle="width:100%" />
	    	<br><form:errors path="trnsmitTelno" />
	    </td>
	  </tr>
	  <tr> 
	    <th height="23" class="required_text" ><label for="trnsmitCn"><spring:message code="cop.sms.trnsmitCn" /></label>
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
	    <td colspan="3">
	       <form:textarea path="trnsmitCn" cols="75" rows="2" cssStyle="width:100%" />
	       <br><form:errors path="trnsmitCn" />
	    </td>
	  </tr>
	  <tr> 
	    <th width="20%" height="23" class="required_text" ><label for="recptnTelno"><spring:message code="cop.sms.recptnTelno" /></label>
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
	    <td width="30%" nowrap colspan="3" >
		   <table border="0" cellpadding="0" cellspacing="0" width="100%">
		   	  <tr>
		   	  	<td align="left">
		   	  		1 : <form:input id="recptnTelno" path="recptnTelno" size="14" maxlength="14" /><br>
		   	  		<c:forEach begin="2" end="5" step="1" var="index">
		   	  		<c:out value='${index}'/> : <form:input id="recptnTelno${index-1}" path="recptnTelno" size="14" maxlength="14" /><br>
		   	  		</c:forEach>
		   		</td>
		   	  </tr>
		   </table>
	  	   <br><form:errors path="recptnTelno" />
	    </td>
	  </tr>
	</tbody>       
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr> 
	    <td height="10"></td>
	  </tr>
	</table>
	<div align="center">
	<table border="0" cellspacing="0" cellpadding="0" align="center">
	<tr> 
      <td><span class="button"><input type="submit" value="<spring:message code="cop.sms.send" />" onclick="fn_egov_regist_sms(); return false;"></span></td>
      <td width="10"></td>
      <td><span class="button"><a href="<c:url value='/cop/sms/selectSmsList.do'/>?pageIndex=<c:out value='${searchVO.pageIndex}'/>" onclick="fn_egov_select_sms(); return false;"><spring:message code="button.list" /></a></span></td>
	</tr>
	</table>
	</div>
	</form:form>
</div>

</body>
</html>
