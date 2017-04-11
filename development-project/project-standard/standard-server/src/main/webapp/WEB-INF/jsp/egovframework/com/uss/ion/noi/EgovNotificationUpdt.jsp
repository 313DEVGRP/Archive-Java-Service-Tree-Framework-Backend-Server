<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="double-submit" uri="http://www.egovframe.go.kr/tags/double-submit/jsp" %>
<%
/**
 * @Class Name : EgovNotificationUpdt.jsp
 * @Description : 정보알림이 수정화면
 * @Modification Information
 * @
 * @  수정일      수정자            수정내용
 * @ -------        --------    ---------------------------
 * @ 2009.06.17   한성곤          최초 생성
 *
 *  @author 공통컴포넌트개발팀 한성곤
 *  @since 2009.06.17
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
<validator:javascript formName="notification" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript">
	function onloading() {
		if ("<c:out value='${msg}'/>" != "") {
			alert("<c:out value='${msg}'/>");
		}
	}
	function fn_egov_SelectBoxValue(sbName) {
		var fValue = "";

		for (var i=0; i < document.getElementById(sbName).length; i++) {
			if (document.getElementById(sbName).options[i].selected == true) {
				fValue = document.getElementById(sbName).options[i].value;
			}
		}

		return  fValue;
	}

	function fn_egov_update_notification(){
		if (!validateNotification(document.notification)){
			return;
		}

		var checked = false;
		for (var i = 0; i < document.notification.bhNtfcIntrvl.length; i++) {
			if (document.notification.bhNtfcIntrvl[i].checked) {
				checked = true;
				break;
			}
		}

		if (!checked) {
			alert('<spring:message code="uss.ion.noi.bhNtfcIntrvl.msg" />');
			return;
		}

		if (confirm('<spring:message code="common.update.msg" />')) {
			form = document.notification;
			form.action = "<c:url value='/uss/ion/noi/updateNotification.do'/>";

			form.ntfcTime.value = fn_egov_SelectBoxValue('ntfcHH') + ":" + fn_egov_SelectBoxValue('ntfcMM');

			form.submit();
		}
	}

	function fn_egov_select_notification(){
		var form = document.notification;
		form.action = "<c:url value='/uss/ion/noi/selectNotificationList.do'/>";
		form.submit();
	}

	function init() {
		onloading();

		var form = document.notification;

		var hh = form.ntfcTime.value.substr(0, 2);
		var mm = form.ntfcTime.value.substr(3, 2);

		if (hh.charAt(0) == '0') {
			hh = hh.charAt(1);
		}

		if (mm.charAt(0) == '0') {
			mm = mm.charAt(1);
		}

		for (var i = 0; i < form.ntfcHH.length; i++) {
			if (form.ntfcHH[i].value == hh) {
				form.ntfcHH[i].selected = true;
			}
		}

		for (var i = 0; i < form.ntfcMM.length; i++) {
			if (form.ntfcMM[i].value == mm) {
				form.ntfcMM[i].selected = true;
			}
		}
	}
</script>

<title>정보알림이 수정</title>
</head>
<body onload="init()">

<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<form:form commandName="notification" name="notification" method="post" action="${pageContext.request.contextPath}/uss/ion/noi/updateNotification.do' />">

<double-submit:preventer tokenKey="EgovNotification"/>

<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
<input name="ntfcNo" type="hidden" value="<c:out value='${result.ntfcNo}'/>" >

<input name="ntfcTime" id="ntfcTime" type="hidden" value='<c:out value="${fn:substring(result.ntfcTime,11,16)}"/>'>

<div id="border" style="width:730px">

	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="100%"class="title_left">
	   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;정보알림이 수정</td>
	 </tr>
	</table>
	<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="정보알림이에 대한 정보를 수정합니다.">
	<tbody>
	  <tr>
	    <th width="20%" height="23" class="required_text" nowrap ><label for="ntfcSj"><spring:message code="uss.ion.noi.ntfcSj" /></label>
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
	    <td width="80%" nowrap colspan="3">
	    	<input id="ntfcSj" name="ntfcSj" size="25" value='<c:out value="${result.ntfcSj}"/>' style="width:100%" >
	    	<br><form:errors path="ntfcSj" />
	    </td>
	  </tr>
	  <tr>
	    <th height="23" class="required_text" ><label for="ntfcCn"><spring:message code="uss.ion.noi.ntfcCn" /></label>
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
	    <td colspan="3">
	       <textarea id="ntfcCn" name="ntfcCn" class="textarea" cols="75" rows="2" style="width:100%"><c:out value="${result.ntfcCn}" escapeXml="true" /></textarea>
	       <br><form:errors path="ntfcCn" />
	    </td>
	  </tr>
	  <tr>
	    <th width="20%" height="23" class="required_text" nowrap ><label for="ntfcDate"><spring:message code="uss.ion.noi.ntfcDate" /></label>
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
	    <td width="30%" nowrap>
	    	<input type="hidden" name="cal_url" id="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" >
			<input name="ntfcDate" id="ntfcDate" type="text" size="73" value="<c:out value='${fn:substring(result.ntfcTime, 0, 10)}'/>" maxlength="10" style="width:80px;" readonly="readonly" class="readOnlyClass">
			<a href="#" onClick="javascript:fn_egov_NormalCalendar( document.getElementById('notification'),  document.getElementById('ntfcDate') );">
      		<img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />"  style="vertical-align: middle; border:0px" alt="달력창팝업버튼이미지">
			</a>
	  	   <br><form:errors path="ntfcDate" />
	    </td>
	    <th width="20%" height="23" class="required_text" nowrap ><label for="ntfcHH"><spring:message code="uss.ion.noi.ntfcTime" /></label>
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
	    <td width="30%" nowrap>
			<select name="ntfcHH" id="ntfcHH">
				<option value="">선택</option>
				<c:forEach var="h" begin="1" end="24" step="1">
				<option value="${h}">${h}시</option>
				</c:forEach>
			</select>

			<select name="ntfcMM" id="ntfcMM">
				<option value="">선택</option>
				<option value="0">0분</option>
				<c:forEach var="m" begin="1" end="60" step="1">
				<option value="${m}">${m}분</option>
				</c:forEach>
			</select>
	  	    <br><form:errors path="ntfcHH" /><form:errors path="ntfcMM" />
	    </td>
	  </tr>
	  <tr>
	    <th width="20%" height="23" class="required_text" ><label for="bhNtfcIntrvl"><spring:message code="uss.ion.noi.bhNtfcIntrvl" /></label>
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
	    <td width="30%" nowrap colspan="3" >
	    <c:set var="data">,<c:out value="${result.bhNtfcIntrvlString}" /></c:set>
			1분:<input id="bhNtfcIntrvl" name="bhNtfcIntrvl" type="checkbox" value="1" <c:if test="${fn:contains(data, ',1분')}">checked="checked"</c:if> title="시간간격체크(1분)">&nbsp;&nbsp;
			3분:<input name="bhNtfcIntrvl" type="checkbox" value="3" <c:if test="${fn:contains(data, ',3분')}">checked="checked"</c:if> title="시간간격체크(3분)">&nbsp;&nbsp;
			5분:<input name="bhNtfcIntrvl" type="checkbox" value="5" <c:if test="${fn:contains(data, ',5분')}">checked="checked"</c:if> title="시간간격체크(5분)">&nbsp;&nbsp;
			10분:<input name="bhNtfcIntrvl" type="checkbox" value="10" <c:if test="${fn:contains(data, ',10분')}">checked="checked"</c:if> title="시간간격체크(10분)">&nbsp;&nbsp;
			30분:<input name="bhNtfcIntrvl" type="checkbox" value="30" <c:if test="${fn:contains(data, ',30분')}">checked="checked"</c:if> title="시간간격체크(30분)">&nbsp;&nbsp;
	  	   <br><form:errors path="bhNtfcIntrvl" />
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
	  <td><span class="button"><input type="submit" value="<spring:message code="button.save" />" onclick="fn_egov_update_notification(); return false;"></span></td>
      <td width="10"></td>
      <td><span class="button"><a href="<c:url value='/uss/ion/noi/selectNotificationList.do'/>?pageIndex=1" onclick="fn_egov_select_notification(); return false;"><spring:message code="button.list" /></a></span></td>
	</tr>
	</table>
	</div>
</div>
</form:form>
</body>
</html>
