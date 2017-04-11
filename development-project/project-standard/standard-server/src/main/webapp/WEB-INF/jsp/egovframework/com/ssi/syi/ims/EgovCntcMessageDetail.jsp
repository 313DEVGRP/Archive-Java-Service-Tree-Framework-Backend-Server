<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
 /**
  * @Class Name  : EgovCntcMessageDetail.jsp
  * @Description : EgovCntcMessageDetail 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.08.11   이중호              최초 생성
  *
  *  @author 공통컴포넌트팀
  *  @since 2009.08.11
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
<html lang="ko">
<head>
<title>연계메시지 상세조회</title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>

<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />">
<script type="text/javaScript" language="javascript">
<!--
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function fn_egov_pageview(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/ssi/syi/ims/getCntcMessageDetail.do'/>";
   	document.listForm.submit();
}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_CntcMessage(){
	location.href = "<c:url value='/ssi/syi/ims/getCntcMessageList.do'/>";
}
/* ********************************************************
 * 수정화면으로  바로가기
 ******************************************************** */
function fn_egov_modify_CntcMessage(){
	var varForm				    = document.all["Form"];
	varForm.action              = "<c:url value='/ssi/syi/ims/updateCntcMessage.do'/>";
	varForm.cntcMessageId.value	= "<c:out value='${result.cntcMessageId}'/>";
	varForm.submit();
}
/* ********************************************************
 * 삭제 처리 함수
 ******************************************************** */
function fn_egov_delete_CntcMessage(){
	if (confirm("<spring:message code='common.delete.msg' />")) {
		var varForm				    = document.all["Form"];
		varForm.action			    = "<c:url value='/ssi/syi/ims/removeCntcMessage.do'/>";
		varForm.cntcMessageId.value	= "<c:out value='${result.cntcMessageId}'/>";
		varForm.submit();
	}
}
/* ********************************************************
* 연계메시지항목 등록 화면으로  바로가기
******************************************************** */
function fn_egov_regist_CntcMessageItem(){
	var varForm					= document.all["Form"];
	varForm.action          	= "<c:url value='/ssi/syi/ims/addCntcMessageItem.do'/>";
	varForm.cntcMessageId.value	= "<c:out value='${result.cntcMessageId}'/>";
	varForm.submit();
}
/* ********************************************************
* 연계메시지항목 수정화면으로  바로가기
******************************************************** */
function fn_egov_modify_CntcMessageItem(itemId){
	var varForm					= document.all["Form"];
	varForm.action          	= "<c:url value='/ssi/syi/ims/updateCntcMessageItem.do'/>";
	varForm.cntcMessageId.value	= "<c:out value='${result.cntcMessageId}'/>";
	varForm.itemId.value		= itemId;
	varForm.submit();
}
/* ********************************************************
* 연계메시지항목 삭제 처리 함수
******************************************************** */
function fn_egov_delete_CntcMessageItem(itemId){
	if (confirm("<spring:message code='common.delete.msg' />")) {
		var varForm					= document.all["Form"];
		varForm.action				= "<c:url value='/ssi/syi/ims/removeCntcMessageItem.do'/>";
		varForm.cntcMessageId.value	= "<c:out value='${result.cntcMessageId}'/>";
		varForm.itemId.value		= itemId;
		varForm.submit();
	}
}

-->
</script>
</head>
<body>
<form name="Form" action="" method="post">
	<input name="cntcMessageId" type="hidden">
	<input name="itemId"        type="hidden">
</form>
<%-- noscript 테그 --%>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<table width="700" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%" class="title_left">
   	<h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;연계메시지 상세조회</h1>
  </td>
 </tr>
</table>
<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register">
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >연계메시지ID<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td><c:out value="${result.cntcMessageId}"/></td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >연계메시지명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td><c:out value="${result.cntcMessageNm}"/></td>
  </tr>
  <tr>
    <th width="20%" height="23" class="" nowrap >상위연계메시지ID</th>
    <td><c:out value="${result.upperCntcMessageId}"/></td>
  </tr>
</table>
<table width="700" border="0" cellspacing="0" cellpadding="0">
<tr><td height="10px"></td></tr>
<tr>
	<td>
		<table border="0" cellspacing="0" cellpadding="0" align="center">
		<tr>
			<td>
				<form name="formUpdt" action="<c:url value='/ssi/syi/ims/updateCntcMessage.do'/>" method="post">
				<span class="button"><input type="submit" value="<spring:message code="button.update" />" title="<spring:message code="button.update" />" onclick="fn_egov_modify_CntcMessage(); return false;"></span>
				<input name="cntcMessageId" type="hidden" value="<c:out value='${result.cntcMessageId}'/>">
				<input name="itemId" type="hidden" value="">
				</form>
			</td>

			<td width="3"></td>
			<td>
				<form name="formDelete" action="<c:url value='/ssi/syi/ims/removeCntcMessage.do'/>" method="post">
				<span class="button"><input type="submit" value="삭제" title="삭제" onclick="fn_egov_delete_CntcMessage(); return false;"></span>
				<input name="cntcMessageId" type="hidden" value="<c:out value='${result.cntcMessageId}'/>">
				<input name="itemId"        type="hidden" value="">
				</form>
			</td>

			<td width="3"></td>
			<td>
				<form name="formList" action="<c:url value='/ssi/syi/ims/getCntcMessageList.do'/>" method="post">
				<span class="button"><input type="submit" value="<spring:message code="button.list" />" title="<spring:message code="button.list" />" onclick="fn_egov_list_CntcMessage(); return false;"></span>
				</form>
			</td>
		</tr>
		</table>
	</td>
</tr>
</table>


<DIV id="content" style="display">
<table width="700" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="40%"class="title_left">

   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;연계메시지항목</td>
  <th>
  </th>
  <td width="10%"></td>
  <td width="35%"></td>
  <th width="10%">

  <form name="formCntcMessageRegist" action="<c:url value='/ssi/syi/ims/addCntcMessageItem.do'/>" method="post">
   <table border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td>
      	<span class="button"><input type="submit" value="등록" title="등록" onclick="fn_egov_regist_CntcMessageItem(); return false;" class="btnNew" style="height:20px;width:40px;" ></span>
      </td>
    </tr>
   </table>
	<input name="cntcMessageId" type="hidden" value="<c:out value='${result.cntcMessageId}'/>">
	<input name="itemId"        type="hidden" value="">
   </form>
  </th>
 </tr>
</table>

<form name="listForm" action="<c:url value='/sym/ccm/zip/EgovCntcMessageList.do'/>" method="post">
</form>

<table width="700" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<table width="700" cellpadding="0" class="table-list" border="0">
<thead>
<tr>
	<th class="title" width="10%" nowrap>순번</th>
	<th class="title" width="20%" nowrap>항목ID</th>
	<th class="title" width="20%" nowrap>항목명</th>
	<th class="title" width="10%" nowrap>항목타입</th>
	<th class="title" width="20%" nowrap>항목길이</th>
	<th class="title" width="20%" nowrap>처리</th>
</tr>
</thead>

<tbody>
<c:forEach items="${cntcMessageItemList}" var="resultInfo" varStatus="status">
<tr>
	<td class="lt_text3" nowrap><c:out value="${(cntcMessageItemVO.pageIndex - 1) * cntcMessageItemVO.pageSize + status.count}"/></td>
	<td class="lt_text3" nowrap><c:out value="${resultInfo.itemId}"/></td>
	<td class="lt_text"  nowrap><c:out value="${resultInfo.itemNm}"/></td>
	<td class="lt_text"  nowrap><c:out value="${resultInfo.itemType}"/></td>
	<td class="lt_text3"  nowrap><c:out value="${resultInfo.itemLt}"/></td>
	<td>

	<table border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td>
			<form name="formUpdt" action="<c:url value='/ssi/syi/ims/updateCntcMessageItem.do'/>" method="post">
			<span class="button"><input type="submit" value="<spring:message code="button.update" />" title="<spring:message code="button.update" />" onclick="fn_egov_modify_CntcMessageItem('<c:out value="${resultInfo.itemId}"/>'); return false;"></span>
			<input name="cntcMessageId" type="hidden" value="<c:out value='${result.cntcMessageId}'/>">
			<input name="itemId"        type="hidden" value="<c:out value='${resultInfo.itemId}'/>">
			</form>
		</td>
		<td width="1"></td>
		<td>
			<form name="formDelete" action="<c:url value='/ssi/syi/ims/removeCntcMessageItem.do'/>" method="post">
			<span class="button"><input type="submit" value="삭제" title="삭제" onclick="fn_egov_delete_CntcMessageItem('<c:out value="${resultInfo.itemId}"/>'); return false;"></span>
			<input name="cntcMessageId" type="hidden" value="<c:out value='${result.cntcMessageId}'/>">
			<input name="itemId"        type="hidden" value="<c:out value='${resultInfo.itemId}'/>">
			</form>
		</td>
	</tr>
	</table>

	</td>
</tr>
</c:forEach>

<c:if test="${fn:length(cntcMessageItemList) == 0}">
	<tr>
		<td class="lt_text3" colspan="6">
			<spring:message code="common.nodata.msg" />
		</td>
	</tr>
</c:if>

</tbody>
</table>



</DIV>


</body>
</html>
