<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="double-submit" uri="http://www.egovframe.go.kr/tags/double-submit/jsp" %>
<%
/**
 * @Class Name : EgovNotificationRegist.jsp
 * @Description : 정보알림이 등록화면
 * @Modification Information
 * @
 * @  수정일      수정자            수정내용
 * @ -------        --------    ---------------------------
 * @ 2009.06.09   한성곤          최초 생성
 *
 *  @author 공통컴포넌트개발팀 한성곤
 *  @since 2009.06.09
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

	function fn_egov_regist_notification(){
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

		if (confirm('<spring:message code="common.regist.msg" />')) {
			form = document.notification;
			form.action = "<c:url value='/uss/ion/noi/insertNotification.do'/>";

			form.ntfcTime.value = fn_egov_SelectBoxValue('ntfcHH') + ":" + fn_egov_SelectBoxValue('ntfcMM');

			form.submit();
		}
	}

	function fn_egov_select_notification(){
		form = document.notification;
		form.action = "<c:url value='/uss/ion/noi/selectNotificationList.do'/>";
		form.submit();
	}

</script>

<title>정보알림이 생성</title>
</head>
<body onload="onloading()">

<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<div id="border" style="width:730px">

<form:form commandName="notification" name="notification" method="post" action="${pageContext.request.contextPath}/uss/ion/noi/insertNotification.do' />">

	<double-submit:preventer/>
	
	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
	<input name="ntfcTime" id="ntfcTime" type="hidden" value="">

	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="100%"class="title_left">
	   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;정보알림이 생성</td>
	 </tr>
	</table>
	<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="정보알림이에 대한 정보를 등록합니다.">
	<tbody>
	  <tr>
	    <th width="20%" height="23" class="required_text" nowrap ><label for="ntfcSj"><spring:message code="uss.ion.noi.ntfcSj" /></label>
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
	    <td width="80%" nowrap colspan="3">
	    	<form:input path="ntfcSj" size="25" cssStyle="width:100%" />
	    	<br><form:errors path="ntfcSj" />
	    </td>
	  </tr>
	  <tr>
	    <th height="23" class="required_text" ><label for="ntfcCn"><spring:message code="uss.ion.noi.ntfcCn" /></label>
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
	    <td colspan="3">
	       <form:textarea path="ntfcCn" cols="75" rows="2" cssStyle="width:100%" />
	       <br><form:errors path="ntfcCn" />
	    </td>
	  </tr>
	  <tr>
	    <th width="20%" height="23" class="required_text" nowrap ><label for="ntfcDate"><spring:message code="uss.ion.noi.ntfcDate" /></label>
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
	    <td width="30%" nowrap>
	    	<input type="hidden" name="cal_url" id="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" >
			<input name="ntfcDate" id="ntfcDate" type="text" size="73" value="" maxlength="10" style="width:80px;" readonly="readonly" class="readOnlyClass">
			<a href="#" onClick="javascript:fn_egov_NormalCalendar( document.getElementById('notification'),  document.getElementById('ntfcDate') );">
      		<img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />"  style="vertical-align: middle; border:0px" alt="달력창팝업버튼이미지">
			</a>
	  	   <br><form:errors path="ntfcDate" />
	    </td>
	    <th width="20%" height="23" class="required_text" nowrap ><label for="ntfcHH"><spring:message code="uss.ion.noi.ntfcTime" /></label>
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
	    <td width="30%" nowrap>
			<select name="ntfcHH" id="ntfcHH" title="시간선택">
				<option value="">선택</option>
				<c:forEach var="h" begin="1" end="24" step="1">
				<option value="${h}">${h}시</option>
				</c:forEach>
			</select>

			<select name="ntfcMM" id="ntfcMM" title="분선택">
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
			1분:<form:checkbox id="bhNtfcIntrvl" class="check2" path="bhNtfcIntrvl" value="1"/>&nbsp;&nbsp;
			3분:<form:checkbox path="bhNtfcIntrvl" class="check2" value="3"/>&nbsp;&nbsp;
			5분:<form:checkbox path="bhNtfcIntrvl" class="check2" value="5"/>&nbsp;&nbsp;
			10분:<form:checkbox path="bhNtfcIntrvl" class="check2" value="10"/>&nbsp;&nbsp;
			30분:<form:checkbox path="bhNtfcIntrvl" class="check2" value="30"/>&nbsp;&nbsp;
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
      <td><span class="button"><input type="submit" value="<spring:message code="button.save" />" onclick="fn_egov_regist_notification(); return false;"></span></td>
      <td width="10"></td>
      <td><span class="button"><a href="<c:url value='/uss/ion/noi/selectNotificationList.do'/>?pageIndex=<c:out value='${searchVO.pageIndex}'/>" onclick="fn_egov_select_notification(); return false;"><spring:message code="button.list" /></a></span></td>
	</tr>
	</table>
	</div>
	</form:form>

</div>

</body>
</html>
