<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : EgovNotificationList.jsp
  * @Description : 정보알림이 목록화면
  * @Modification Information
  * @
  * @  수정일      수정자            수정내용
  * @ -------        --------    ---------------------------
  * @ 2009.06.08   한성곤          최초 생성
  *
  *  @author 공통컴포넌트개발팀 한성곤
  *  @since 2009.06.08
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
<!-- contextPath 설정 -->
<c:set var="contextPath" scope="request">${pageContext.request.contextPath}</c:set>

<!-- 정보알림이 표시를 위한 스크립트  -->
<script type="text/javascript">
var noi_url = "<c:url value='/uss/ion/noi/getNotifications.do'/>";
</script>
<script type="text/javascript" language="javaScript" src="<c:url value='/js/egovframework/com/uss/ion/noi/EgovNotification.js'/>" ></script>

<script type="text/javascript">
	function init() {
		if (document.frm.searchCnd.value == '0' && document.frm.searchWrd.value != '') {
			var str = document.frm.searchWrd.value;

			document.frm.searchWrd.value = str.substr(0,4) + '-' + str.substr(4,2) + '-' + str.substr(6,2);
		}
	}

	function isValidDate(str) {
	   	// var test = /^\d{4}-\d{2}-\d{2}$/;
	    var test = /^\d{4}\d{2}\d{2}$/;

	    if (!test.test(str)) {
		    return false;
	    }

	    var y, m, d;

	    y =  parseInt(str.substr(0,4), 10);
		m = parseInt(str.substr(4,2), 10) - 1;
		d = parseInt(str.substr(6,2), 10);

	    var dt = new Date(y, m, d);

	    if (dt.getFullYear() == y && dt.getMonth() == m && dt.getDate() == d) {
	        return true;
	    } else {
	        return false;
	    }
	}

	function rawDateString(obj) {
		var intValue = '0123456789';

		var result = "";
		var str =  String(obj.value);

	    if (str.length < 1) {
	    	result = "";
	    	return true;
	    }

	    for (var i = 0; i < str.length; i++) {
		    if (intValue.indexOf(str.charAt(i)) >= 0) {	// 숫자
				result += str.charAt(i);
		    }
	    }

	    if (isValidDate(result)) {
		    obj.value = result;
		    return true;
	    }

	    return false;
	}

	function press(event) {
		if (event.keyCode==13) {
			fn_egov_select_notification('1');
		}
	}

	function fn_egov_insert_notification() {
		document.frm.action = "<c:url value='/uss/ion/noi/addNotification.do'/>";
		document.frm.submit();
	}

	function fn_egov_select_notification(pageNo) {
		if (document.frm.searchCnd.value == '0' && document.frm.searchWrd.value != '') {
			if (rawDateString(document.frm.searchWrd)) {
				// no-op
			} else {
				alert('<spring:message code="errors.date" arguments="알림일자" />');
				document.frm.searchWrd.focus();
				return;
			}
		}

		document.frm.pageIndex.value = pageNo;
		document.frm.action = "<c:url value='/uss/ion/noi/selectNotificationList.do'/>";
		document.frm.submit();
	}

	function fn_egov_inqire_notification(ntfcNo) {
		document.frm.ntfcNo.value = ntfcNo;
		document.frm.action = "<c:url value='/uss/ion/noi/selectNotification.do'/>";
		document.frm.submit();
	}
</script>
<title>정보알림이 목록조회</title>
</head>
<body onload="init()">

<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<div id="border" style="width:730px">

	<form name="frm" method="post" action="<c:url value='/uss/ion/noi/selectNotificationList.do'/>">
		<input type="hidden" name="ntfcNo">
		<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">

	<table width="100%" cellpadding="8" class="table-search" border="0">
	<tbody>
	 <tr>
	  <td width="40%" class="title_left">
	   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle"  alt="">&nbsp;정보알림이</td>
		<td width="10%" >
	   		<select name="searchCnd" class="select" title="검색조건선택">
	   		   <option value=''>--선택하세요--</option>
			   <option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >알림일자</option>
			   <option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >제목</option>
			   <option value="2" <c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if> >내용</option>
		   </select>
		</td>
	  <td width="35%">
	    <input name="searchWrd" type="text" size="35" value='<c:out value="${searchVO.searchWrd}"/>' maxlength="35" onkeypress="press(event);" title="검색단어입력">
	  </td>
	  <th width="10%">
	   <table border="0" cellspacing="0" cellpadding="0">
	    <tr>
	      <td><span class="button"><input type="submit" value="조회" onclick="fn_egov_select_notification('1'); return false;"></span></td>
	      <td>&nbsp;&nbsp;</td>
	      <td><span class="button"><a href="<c:url value='/uss/ion/noi/addNotification.do'/>?pageIndex=<c:out value='${searchVO.pageIndex}'/>" onclick="fn_egov_insert_notification(); return false;">등록</a></span></td>
	    </tr>
	   </table>
	  </th>
	 </tr>
	</tbody>
	</table>
	</form>

	<table width="100%" cellpadding="8" class="table-list" summary="등록된 정보알림이에 대한 목록을 제공합니다.">
	 <thead>
	  <tr>
	    <th class="title" width="5%" nowrap>번호</th>
	    <th class="title" width="40%" nowrap>제목</th>
	    <th class="title" width="20%" nowrap>알림시간</th>
	    <th class="title" width="20%" nowrap>사전알림간격</th>
	    <th class="title" width="15%" nowrap>생성일</th>
	  </tr>
	 </thead>
	 <tbody>
		 <c:forEach var="result" items="${resultList}" varStatus="status">
		  <tr>
		    <!--td class="lt_text3" nowrap><input type="checkbox" name="check1" class="check2"></td-->
		    <td class="lt_text3" nowrap><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
		    <td class="lt_text3" nowrap>
		   	<form name="item" method="post" action="<c:url value='/uss/ion/noi/selectNotification.do'/>">
		    	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
				<input type="hidden" name="ntfcNo" value="<c:out value="${result.ntfcNo}"/>">
			<span class="link"><input type="submit" value="<c:out value="${result.ntfcSj}"/>" onclick="javascript:fn_egov_inqire_notification('<c:out value="${result.ntfcNo}"/>'); return false;"></span>
			</form>
		    </td>
		    <td class="lt_text3" nowrap><c:out value="${result.ntfcTime}"/></td>
		    <td class="lt_text3" nowrap><c:out value="${result.bhNtfcIntrvlString}"/></td>
		    <td class="lt_text3" nowrap><c:out value="${result.frstRegisterPnttm}"/></td>
		  </tr>
		 </c:forEach>
		 <c:if test="${fn:length(resultList) == 0}">
		  <tr>
		    <td class="lt_text3" nowrap colspan="5"><spring:message code="common.nodata.msg" /></td>
		  </tr>
		 </c:if>
	 </tbody>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="10"></td>
	  </tr>
	</table>
	<div align="center">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_notification" />
	</div>
</div>

</body>
</html>
