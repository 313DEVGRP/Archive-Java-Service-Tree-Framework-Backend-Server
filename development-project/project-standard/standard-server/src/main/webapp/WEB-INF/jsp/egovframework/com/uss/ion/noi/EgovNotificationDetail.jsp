<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<% 
/**
 * @Class Name : EgovNotificationDetail.jsp
 * @Description : 정보알림이 상세조회
 * @Modification Information
 * @
 * @  수정일      수정자            수정내용
 * @ -------        --------    ---------------------------
 * @ 2009.06.15   한성곤          최초 생성
 *
 *  @author 공통컴포넌트개발팀 한성곤
 *  @since 2009.06.15
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
<script type="text/javascript">
	function onloading() {
		if ("<c:out value='${msg}'/>" != "") {
			alert("<c:out value='${msg}'/>");
		}
	}
	
	function fn_egov_select_notificationList(pageNo) {
		document.frm.pageIndex.value = pageNo; 
		document.frm.action = "<c:url value='/uss/ion/noi/selectNotificationList.do'/>";
		document.frm.submit();	
	}
	
	function fn_egov_delete_notification() {		
		if (confirm('<spring:message code="common.delete.msg" />')) {
			document.frm.action = "<c:url value='/uss/ion/noi/deleteNotification.do'/>";
			document.frm.submit();
		}	
	}
	
	function fn_egov_moveUpdt_notification() {
		document.frm.action = "<c:url value='/uss/ion/noi/forUpdateNotification.do'/>";
		document.frm.submit();			
	}
</script>
<title>정보알림이 - 상세조회</title>
</head>
<body onload="onloading();">

<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<form name="frm" method="post" action="">
	<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>">
	<input type="hidden" name="ntfcNo" value="<c:out value='${result.ntfcNo}'/>">
</form>

<div id="border" style="width:730px">

	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="100%" class="title_left">
	   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">
	   &nbsp;정보알림이 - 상세조회</td>
	 </tr>
	</table>
	<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="등록된 정보알림이에 대한 상세정보를 제공합니다.">
	<tbody>
	  <tr> 
	    <th width="15%" height="23" nowrap class="">제목</th>
	    <td width="85%" colspan="3" nowrap><c:out value="${result.ntfcSj}" />
	    </td>
	  </tr>
	  <tr> 
	    <th height="23" class="">내용</th>
	    <td colspan="3">
			<c:out value="${result.ntfcCn}"/>
	    </td>
	  </tr>
	  <tr> 
	    <th width="15%" height="23" nowrap class="">알림시간</th>
	    <td width="15%" class="lt_text3" nowrap>
	   		<c:out value="${result.ntfcTime}" />
	    </td>
	    <th width="15%" height="23" nowrap class="">사전알림간격</th>
	    <td width="15%" class="listCenter" nowrap><c:out value="${result.bhNtfcIntrvlString}" />
	    </td>
	  </tr>
	  <tr> 
	    <th width="15%" height="23" nowrap class="">작성자</th>
	    <td width="15%" class="lt_text3" nowrap>
	   		<c:out value="${result.frstRegisterNm}" />
	    </td>
	    <th width="15%" height="23" nowrap class="">작성시간</th>
	    <td width="15%" class="listCenter" nowrap><c:out value="${result.frstRegisterPnttm}" />
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
	<table width="100%"  border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
	 <td width="100%">
	 <div align="center">
		<table border="0" cellspacing="0" cellpadding="0" align="center">
			<tr> 
		     <c:if test="${result.frstRegisterId == sessionUniqId}">     
			      <td>  
		  			<form name="modifyFrm" method="post" action="<c:url value='/uss/ion/noi/forUpdateNotification.do'/>">
						<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
						<input type="hidden" name="ntfcNo" value="<c:out value='${result.ntfcNo}'/>" >
						<span class="button"><input type="submit" value="수정" onclick="fn_egov_moveUpdt_notification(); return false;"></span>
		  			</form> 
		 		  </td>
			      <td width="10"></td>
			      <td>  
		  			<form name="deleteFrm" method="post" action="<c:url value='/uss/ion/noi/deleteNotification.do'/>">
						<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
						<input type="hidden" name="ntfcNo" value="<c:out value='${result.ntfcNo}'/>" >
						<span class="button"><input type="submit" value="삭제" onclick="fn_egov_delete_notification(); return false;"></span>
		  			</form> 
		 		  </td>
		 		  <td width="10"></td>
		     </c:if>
		      <td>  
		  		<form name="listFrm" method="post" action="<c:url value='/uss/ion/noi/selectNotificationList.do'/>">
					<input name="pageIndex" type="hidden" value="1" >
					<span class="button"><input type="submit" value="목록" onclick="fn_egov_select_notificationList('1'); return false;"></span>
		  		</form> 
		 	  </td>
			</tr>
		</table>
		</div>
	 </td>
	</tr>
	</table>
	</div>
</div>

</body>
</html>
