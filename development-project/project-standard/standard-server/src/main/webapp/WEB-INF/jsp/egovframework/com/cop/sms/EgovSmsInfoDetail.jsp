<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Class Name : EgovSmsInfoInqire.jsp
 * @Description : 문자메시지 상세조회
 * @Modification Information
 * @
 * @  수정일      수정자            수정내용
 * @ -------        --------    ---------------------------
 * @ 2009.06.19   한성곤          최초 생성
 *
 *  @author 공통컴포넌트개발팀 한성곤
 *  @since 2009.06.19
 *  @version 1.0
 *  @see
 *
 *  Copyright (C) 2009 by MOPAS  All right reserved.
 */
%>

<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function fn_egov_select_smsList(pageNo) {
		document.frm.pageIndex.value = pageNo;
		document.frm.action = "<c:url value='/cop/sms/selectSmsList.do'/>";
		document.frm.submit();
	}
</script>
<title>문자메시지 상세조회</title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>


</head>
<body>

<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<div id="border" style="width:730px">

	<form name="frm" method="post" action="<c:url value='/cop/sms/selectSmsList.do'/>">

	<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>">
	<input type="hidden" name="smsId" value="<c:out value='${result.smsId}'/>" >

	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="100%" class="title_left">
	   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">
	   &nbsp;문자메시지 상세조회</td>
	 </tr>
	</table>
	<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="등록 및 전송된 문자메시지에 대한 상세정보를 제공합니다.">
	<tbody>
	  <tr>
	    <th width="15%" height="23" nowrap class="required_text"><spring:message code="cop.sms.trnsmitTelno" /><img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="선택사항"></th>
	    <td width="85%" colspan="3" nowrap><c:out value="${result.trnsmitTelno}" />
	    </td>
	  </tr>
	  <tr>
	    <th height="23" class="required_text"><spring:message code="cop.sms.trnsmitCn" /><img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="선택사항"></th>
	    <td colspan="3">
			<c:out value="${result.trnsmitCn}" />
	    </td>
	  </tr>

	  <tr>
	    <th width="15%" height="23" nowrap class="required_text">수신 및 전송결과<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="선택사항"></th>
	    <td width="55%" colspan="3" nowrap>
	   		<ul>
	   		<c:forEach var="recptn" items="${result.recptn}" varStatus="status">
	   			<li>
	   				<c:out value='${recptn.recptnTelno}'/> : (<c:out value='${recptn.resultCode}'/>) <c:out value='${recptn.resultMssage}'/>
	   			</li>
	   		</c:forEach>
	   		</ul>
	    </td>
	  </tr>

	  <tr>
	    <th width="15%" height="23" nowrap class="required_text">전송자<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="선택사항"></th>
	    <td width="15%" class="lt_text3" nowrap>
	   		<c:out value="${result.frstRegisterNm}" />
	    </td>
	    <th width="15%" height="23" nowrap class="required_text">전송시간<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="선택사항"></th>
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
			  <td><span class="button"><a href="<c:url value='/cop/sms/selectSmsList.do'/>?pageIndex=1" onclick="fn_egov_select_smsList('1'); return false;">목록</a></span></td>
			</tr>
		</table>
		</div>
	 </td>
	</tr>
	</table>
	</div>
	</form>
</div>

</body>
</html>
