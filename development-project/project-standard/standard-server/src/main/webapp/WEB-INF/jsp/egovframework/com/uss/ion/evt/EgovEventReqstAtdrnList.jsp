<%
/**
 * @Class Name : EgovEventReqstAtdrnList.java
 * @Description : EgovEventReqstAtdrnList jsp
 * @Modification Information
 * @
 * @  수정일                    수정자                수정내용
 * @ ---------     --------    ---------------------------
 * @ 2010.07.20    이      용                최초 생성
 *   2011.08.17    	정진오		선택입력사항을 표시하는 이미지 icon 경로가
 * 								다른 패키지로 되어 있던 것을 당해 패키지 경로로 수정함 *
 *  @author 이      용
 *  @since 2010.07.20
 *  @version 1.0
 *  @see
 *  
 *  Copyright (C) 2009 by MOPAS  All right reserved.
 */
%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="egovframework.com.utl.fcc.service.EgovDateUtil" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>행사참석자 목록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<script type="text/javaScript" language="javascript">
<!--
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
 /*설명 : 행사 목록 페이지 조회 */
 function linkPage(pageNo){
	var varForm				 = document.all["listForm"];
	varFormsearchCondition.value = "1";
	varFormpageIndex.value = pageNo;
	varFormaction = "<c:url value='/uss/ion/evt/EgovEventReqstManageList.do'/>";
	varFormsubmit();
 }
-->
</script>
</head>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<div id="border" style="width:730px">
<table border="0">
  <tr>
    <td width="700">
<!-- ********** 여기서 부터 본문 내용 *************** -->
	
	<form name="listForm" action="#LINK" method="post">
    <div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div>
	<input type=hidden name="eventId">
	<input type="hidden" name="pageIndex" value="<c:if test="${empty eventManageVO.pageIndex }">1</c:if><c:if test="${!empty eventManageVO.pageIndex }"><c:out value='${eventManageVO.pageIndex}'/></c:if>">
	
	<table width="700" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="40%"class="title_left">
	   <h1><img src="/images/egovframework/com/cmm/icon/tit_icon.gif" width="16" height="16" hspace="3" style="vertical-align: middle" alt="">&nbsp;행사참석자 목록</h1></td>
	  <td width="10%"></td>
	  <td width="35%"></td>
	  <th width="10%"></th>  
	 </tr>
	</table>
	</form>
	<table width="700" cellspacing="0" cellpadding="0" border="0">
	<tr>
		<td height="3px"></td>
	</tr>
	</table>
	
	<table width="700" cellpadding="0" class="table-line" border="0"summary="행사 참석자 목록 순번,참석자명,소속,E-Mail,구분 구성" >
	<caption>행사 참석자 목록</caption>
	<thead>
	<tr>  
		<th class="title" width="5%" scope="col" >순번</th>
		<th class="title" scope="col" >참석자명</th>
		<th class="title" width="30%" scope="col" >소속</th>
		<th class="title" width="20%" scope="col" >E-Mail</th>
		<th class="title" width="20%" scope="col" >구분</th>
	</tr>
	</thead>     
	<tbody>
	<c:forEach items="${eventManageList}" var="resultInfo" varStatus="status">
	<tr>
		<td class="lt_text3"><c:out value="${(searchVO.pageIndex - 1) * searchVO.pageSize + status.count}"/></td>
		<td class="lt_text3"><c:out value="${resultInfo.eventTemp1}"/></td>
		<td class="lt_text3"><c:out value="${resultInfo.eventTemp2}"/></td>
		<td class="lt_text3"><c:out value="${resultInfo.eventTemp3}"/></td>
		<td class="lt_text3">
			<c:if test="${resultInfo.eventTemp4 eq 'A'}">신청</c:if>
 			<c:if test="${resultInfo.eventTemp4 eq 'C'}">승인</c:if>
 			<c:if test="${resultInfo.eventTemp4 eq 'R'}">반려</c:if>
		</td>
	</tr>    
	</c:forEach>
	
	<c:if test="${fn:length(eventManageList) == 0}">
		<tr> 
			<td class="lt_text3" colspan=5>
				<spring:message code="common.nodata.msg" />
			</td>
		</tr>   	          				 			   
	</c:if>
	    	
	    	
	</tbody>  
	</table>
	
	<table width="700" cellspacing="0" cellpadding="0" border="0">
	<tr>
		<td height="3px"></td>
	</tr>
	</table>
	
	
	<c:if test="${!empty eventManageVO.pageIndex }">
	<div align="center">
	    <div>
	        <ui:pagination paginationInfo="${paginationInfo}"
	                       type="image"
	                       jsFunction="linkPage" />
	    </div>
	</div>
	</c:if>
	
	<table width="700"  border="0" cellspacing="0" cellpadding="0">
	 <tr> 
	   <td width="45%">&nbsp;</td>     
	   <td width="10%">&nbsp;</td> 
	   <td width="45%">&nbsp;</td> 
	 </tr>
	  <tr> 
	   <td width="45%">&nbsp;</td>     
	   <td width="10%">&nbsp;</td> 
	   <td width="45%">&nbsp;</td> 
	 </tr>
	 <tr> 
	   <td width="45%">&nbsp;</td>     
	   <td width="10%" align="center"><span class="button"><a href="" onclick="javascript:window.close(); return false;">닫기</a></span></td>     
	   <td width="45%">&nbsp;</td> 
	 </tr>
	</table>
<!-- ********** 여기까지 내용 *************** -->
</td>
</tr>
</table>
</DIV>
</body>
</html>

