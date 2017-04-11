<%
/**
 * @Class Name : EgovCmtManageList.java
 * @Description : EgovCmtManageList jsp
 * @Modification Information
 * @
 * @  수정일        수정자                      수정내용
 * @ ---------     --------            ---------------------------
 * @ 2014.08.29    표준프레임워크센터          최초 생성
 *
 *  @author 표준프레임워크센터
 *  @since 2014.08.29
 *  @version 3.5
 *  @see
 *  
 *  Copyright (C) 2014 by MOPAS  All right reserved.
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
<title>출퇴근 목록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style><script type="text/javaScript" language="javascript">
<!--
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
 /*설명 : 행사 목록 페이지 조회 */
 function linkPage(pageNo){
	var varForm				 = document.all["listForm"];
	varForm.searchCondition.value = "1";
	varForm.pageIndex.value = pageNo;
	varForm.action = "<c:url value='/uss/ion/vct/EgovVcatnManageList.do'/>";
	varForm.submit();
 }

/* ********************************************************
 * 조회 처리 
 ******************************************************** */
 /*설명 : 목록 조회 */
 function fncSelectCmtManageList(pageNo){
	 var varForm				 = document.all["listForm"];
	 //varForm.searchCondition.value = "1";
	 varForm.pageIndex.value = pageNo;
	 varForm.action = "<c:url value='/uss/cmt/EgovCmtManageList.do'/>";
	 varForm.submit();
 }

/* ********************************************************
 * 출근 등록 화면 호출 함수 
 ******************************************************** */
function fncCmtWrkStartInsert(){
	location.href = "<c:url value='/uss/cmt/EgovCmtWrkStartInsert.do' />"; 
	
}

/* ********************************************************
 * 퇴근 등록  화면 호출 함수 
 ******************************************************** */
function fncCmtWrkEndInsert(){
	location.href = "<c:url value='/uss/cmt/EgovCmtWrkEndInsert.do' />"; 
	
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
	<form name="listForm" action="<c:url value='/uss/cmt/EgovCmtManageList.do'/>" method="post">
	<input type="hidden" name="searchCondition">
	
	<table width="700" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="40%"class="title_left">
	   <h1><img src="/images/egovframework/com/tit_icon.gif" width="16" height="16" hspace="3" style="vertical-align: middle" alt="">&nbsp;출퇴근 관리</h1></td>
	  <th>
	  </th>
  <td width="50%">&nbsp;</td>
  <th width="10%" align="right">
	       <table border="0" cellspacing="0" cellpadding="0">
	          <tr> 
	              <td><span class="button"><input type="submit" value="<spring:message code="button.inquire" />" onclick="fncSelectCmtManageList('1'); return false;"></span></td>
		          <td>&nbsp;&nbsp;</td>
		          <td><span class="button"><input type="submit" value="<spring:message code="button.wrkstart" />"  onclick="fncCmtWrkStartInsert(); return false;"></span></td>   
		          <td>&nbsp;&nbsp;</td>
		          <td><span class="button"><input type="submit" value="<spring:message code="button.wrkend" />"  onclick="fncCmtWrkEndInsert(); return false;"></span></td>   
	          </tr>
	       </table>
	  </th>  
	 </tr>
	</table>


	<table width="700" cellspacing="0" cellpadding="0" border="0">
	<tr>
		<td height="3px"></td>
	</tr>
	</table>
	<table width="700" cellpadding="0" class="table-list" border="0"  summary="출퇴근관리 목록으로 일자 사원명 출퇴근시간 출근 출근상태 퇴근 퇴근상태로 구성" >
     <caption>출퇴근관리 목록</caption>
	<thead>
	<tr>  
		<th class="title" width="10%"  scope="col">일자</th>
		<th class="title" width="20%" scope="col">사원ID</th>
		<th class="title" width="20%" scope="col">출근시간</th>
		<th class="title" width="20%" scope="col">퇴근시간</th>
		<th class="title" width="20%" scope="col">야근시간</th>
		<th class="title" width="10%" scope="col">출근상태</th>
		<th class="title" width="10%" scope="col">퇴근상태</th> 
	</tr>
	</thead>     
	
	<tbody>
	<%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
			<c:if test="${fn:length(resultList) == 0}">
			<tr>
			<td class="lt_text3" colspan="8">
				<spring:message code="common.nodata.msg" />
			</td>
			</tr>
			</c:if>
	 <c:forEach var="cmtManage" items="${resultList}" varStatus="status">
	<tr>
		<td class="lt_text3" nowrap><c:out value="${cmtManage.wrktDt}"/></td>
		<td class="lt_text3" nowrap><c:out value="${cmtManage.emplyrId}"/></td>
		<td class="lt_text3" nowrap><c:out value="${cmtManage.wrkStartTime}"/></td>
        <td class="lt_text3" nowrap><c:out value="${cmtManage.wrkEndTime}"/></td>  
        <td class="lt_text3" nowrap><c:out value="${cmtManage.ovtmwrkHours}"/></td>  
        <td class="lt_text3" nowrap><c:out value="${cmtManage.wrkStartStatus}"/></td>  
        <td class="lt_text3" nowrap><c:out value="${cmtManage.wrkEndStatus}"/></td> 
	</tr>
	</c:forEach> 
	
	</tbody>  
	</table>
	
	<table width="700" cellspacing="0" cellpadding="0" border="0">
	<tr>
		<td height="3px"><br/>※ 출근/퇴근 버튼은 Device에 의해 입력되는 것을 기본으로 한다.1일 중복 클릭시 오류로 처리한다.</td>
	</tr>
	</table>
<!-- ********** 여기까지 내용 *************** -->
</td>
</tr>
</table>
</DIV>
	</form>
</body>
</html>
