<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : EgovSmsInfoList.jsp
  * @Description : 문자메시지 목록화면
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

<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function press(event) {
		if (event.keyCode==13) {
			fn_egov_select_sms('1');
		}
	}

	function fn_egov_insert_sms() {
		document.frm.action = "<c:url value='/cop/sms/addSms.do'/>";
		document.frm.submit();
	}

	function fn_egov_select_sms(pageNo) {
		document.frm.pageIndex.value = pageNo;
		document.frm.action = "<c:url value='/cop/sms/selectSmsList.do'/>";
		document.frm.submit();
	}

	function fn_egov_inqire_sms(smsId) {
		document.frm.smsId.value = smsId;
		document.frm.action = "<c:url value='/cop/sms/selectSms.do'/>";
		document.frm.submit();
	}
</script>
<title>문자메시지 목록조회</title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>


</head>
<body>

<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<div id="border" style="width:730px">

	<form name="frm" method="post" action="<c:url value='/cop/sms/selectSmsList.do'/>">

	<input type="hidden" name="smsId">
	<!-- input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/-->
	<input name="pageIndex" type="hidden" value="1">

	<table width="100%" cellpadding="8" class="table-search" border="0">
	<tbody>
	 <tr>
	  <td width="40%" class="title_left">
	   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;문자메시지 목록조회</td>
		<td width="10%" >
	   		<select name="searchCnd" class="select" title="검색조건선택">
			   <option value=''>--선택하세요--</option>
			   <option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >수신전화번호</option>
			   <option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >내용</option>
		   </select>
		</td>
	  <td width="35%">
	    <input name="searchWrd" type="text" size="35" value='<c:out value="${searchVO.searchWrd}"/>' maxlength="35" onkeypress="press(event);" title="검색단어입력">
	  </td>
	  <th width="10%">
	   <table border="0" cellspacing="0" cellpadding="0">
	    <tr>
	      <td><span class="button"><input type="submit" value="조회" onclick="fn_egov_select_sms('1'); return false;"></span></td>
	      <td>&nbsp;&nbsp;</td>
	      <td><span class="button"><a href="<c:url value='/cop/sms/addSms.do'/>?pageIndex=<c:out value='${searchVO.pageIndex}'/>" onclick="fn_egov_insert_sms(); return false;">전송</a></span></td>
	    </tr>
	   </table>
	  </th>
	 </tr>
	</tbody>
	</table>
	</form>

	<table width="100%" cellpadding="8" class="table-list" summary="문자메시지 전송에 대한 목록을 제공합니다.">
	 <thead>
	  <tr>
	    <th class="title" width="10%" nowrap>번호</th>
	    <th class="title" width="35%" nowrap>전송일시</th>
	    <th class="title" width="35%" nowrap>발신전화번호</th>
	    <th class="title" width="20%" nowrap>수신전화번호수</th>
	  </tr>
	 </thead>
	 <tbody>
		 <c:forEach var="result" items="${resultList}" varStatus="status">
		  <tr>
		    <!--td class="lt_text3" nowrap><input type="checkbox" name="check1" class="check2"></td-->
		    <td class="lt_text3" nowrap><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
		    <td class="lt_text3" nowrap>
		    	<!-- a href="javascript:fn_egov_inqire_sms('<c:out value="${result.smsId}"/>')">
		    	<c:out value="${result.frstRegisterPnttm}"/></a> -->
		    	<form name="item" method="post" action="<c:url value='/cop/sms/selectSms.do'/>">
		    		<input type="hidden" name="smsId" value="<c:out value="${result.smsId}"/>">
		    		<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>">

		    		<span class="link"><input type="submit" value="<c:out value="${result.frstRegisterPnttm}"/>" onclick="fn_egov_inqire_sms('<c:out value="${result.smsId}"/>'); return false;"></span>
		    	</form>
		    </td>
		    <td class="lt_text3" nowrap><c:out value="${result.trnsmitTelno}"/></td>
		    <td class="lt_text3" nowrap><c:out value="${result.recptnCnt}"/></td>
		  </tr>
		 </c:forEach>
		 <c:if test="${fn:length(resultList) == 0}">
		  <tr>
		    <td class="lt_text3" nowrap colspan="4"><spring:message code="common.nodata.msg" /></td>
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
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_sms" />
	</div>

</div>
</body>
</html>
