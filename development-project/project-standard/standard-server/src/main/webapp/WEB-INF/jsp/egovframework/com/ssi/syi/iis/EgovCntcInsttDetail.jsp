<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
 /**
  * @Class Name  : EgovCntcInsttDetail.jsp
  * @Description : EgovCntcInsttDetail 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.08.11   이중호              최초 생성
  *   2011.09.14   서준식              삭제 취소시에도 삭제되는 오류 해결
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
<title>연계기관 상세조회</title>

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
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_CntcInstt(){
	location.href = "<c:url value='/ssi/syi/iis/getCntcInsttList.do'/>";
}
/* ********************************************************
 * 수정화면으로  바로가기
 ******************************************************** */
function fn_egov_modify_CntcInstt(){
	var varForm				= document.all["Form"];
	varForm.action          = "<c:url value='/ssi/syi/iis/updateCntcInstt.do'/>";
	varForm.insttId.value	= "<c:out value='${result.insttId}'/>";
	varForm.submit();
}
/* ********************************************************
 * 삭제 처리 함수
 ******************************************************** */
function fn_egov_delete_CntcInstt(){
	if (confirm("<spring:message code='common.delete.msg' />")) {
		var varForm				= document.all["Form"];
		varForm.action			= "<c:url value='/ssi/syi/iis/removeCntcInstt.do'/>";
		varForm.insttId.value	= "<c:out value='${result.insttId}'/>";
		varForm.submit();
	}
}
/* ********************************************************
* 연계시스템 등록 화면으로  바로가기
******************************************************** */
function fn_egov_regist_CntcSystem(){
	var varForm				= document.all["Form"];
	varForm.action          = "<c:url value='/ssi/syi/iis/addCntcSystem.do'/>";
	varForm.insttId.value	= "<c:out value='${result.insttId}'/>";
	varForm.submit();
}
/* ********************************************************
* 연계서비스 등록화면으로  바로가기
******************************************************** */
function fn_egov_regist_CntcService(sysId){
	var varForm				= document.all["Form"];
	varForm.action          = "<c:url value='/ssi/syi/iis/addCntcService.do'/>";
	varForm.insttId.value	= "<c:out value='${result.insttId}'/>";
	varForm.sysId.value		= sysId;
	varForm.submit();
}
/* ********************************************************
* 연계시스템 수정화면으로  바로가기
******************************************************** */
function fn_egov_modify_CntcSystem(sysId){
	var varForm				= document.all["Form"];
	varForm.action          = "<c:url value='/ssi/syi/iis/updateCntcSystem.do'/>";
	varForm.insttId.value	= "<c:out value='${result.insttId}'/>";
	varForm.sysId.value		= sysId;
	varForm.submit();
}
/* ********************************************************
* 연계서비스 수정화면으로  바로가기
******************************************************** */
function fn_egov_modify_CntcService(sysId, svcId){
	var varForm				= document.all["Form"];
	varForm.action          = "<c:url value='/ssi/syi/iis/updateCntcService.do'/>";
	varForm.insttId.value	= "<c:out value='${result.insttId}'/>";
	varForm.sysId.value		= sysId;
	varForm.svcId.value		= svcId;
	varForm.submit();
}
/* ********************************************************
* 연계시스템 삭제 처리 함수
******************************************************** */
function fn_egov_delete_CntcSystem(sysId){
	if (confirm("<spring:message code='common.delete.msg' />")) {
		var varForm				= document.all["Form"];
		varForm.action			= "<c:url value='/ssi/syi/iis/removeCntcSystem.do'/>";
		varForm.insttId.value	= "<c:out value='${result.insttId}'/>";
		varForm.sysId.value		= sysId;
		varForm.submit();
	}
}
/* ********************************************************
* 연계서비스 삭제 처리 함수
******************************************************** */
function fn_egov_delete_CntcService(sysId, svcId){
	if (confirm("<spring:message code='common.delete.msg' />")) {
		var varForm				= document.all["Form"];
		varForm.action			= "<c:url value='/ssi/syi/iis/removeCntcService.do'/>";
		varForm.insttId.value	= "<c:out value='${result.insttId}'/>";
		varForm.sysId.value		= sysId;
		varForm.svcId.value		= svcId;
		varForm.submit();
	}
}


//-->
</script>
</head>
<body>
<form name="Form" action="" method="post">
	<input name="insttId" type="hidden">
	<input name="sysId"   type="hidden">
	<input name="svcId"   type="hidden">
</form>
<%-- noscript 테그 --%>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<table width="700" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%" class="title_left">
   	<h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;연계기관 상세조회</h1>
  </td>
 </tr>
</table>
<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register">
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >연계기관ID<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td><c:out value="${result.insttId}"/></td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >연계기관명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td><c:out value="${result.insttNm}"/></td>
  </tr>
</table>
<table width="700" border="0" cellspacing="0" cellpadding="0">
<tr><td height="10px"></td></tr>
<tr>
	<td>
		<table border="0" cellspacing="0" cellpadding="0" align="center">
		<tr>
			<td>
				<form name="formUpdt" action="<c:url value='/ssi/syi/iis/updateCntcInstt.do'/>" method="post">
				<span class="button"><input type="submit" value="<spring:message code="button.update" />" onclick="fn_egov_modify_CntcInstt(); return false;"></span>
				<input name="insttId" type="hidden" value="<c:out value='${result.insttId}'/>">
				<input name="sysId" type="hidden" value="">
				<input name="svcId" type="hidden" value="">
				</form>
			</td>

			<td width="3"></td>
			<td>
				<form name="formDelete" action="<c:url value='/ssi/syi/iis/removeCntcInstt.do'/>" method="post">
				<span class="button"><input type="submit" value="삭제" onclick="fn_egov_delete_CntcInstt(); return false;"></span>
				<input name="insttId" type="hidden" value="<c:out value='${result.insttId}'/>">
				<input name="sysId"   type="hidden" value="">
				<input name="svcId"   type="hidden" value="">
				</form>
			</td>

			<td width="3"></td>
			<td>
				<form name="formList" action="<c:url value='/ssi/syi/iis/getCntcInsttList.do'/>" method="post">
				<span class="button"><input type="submit" value="<spring:message code="button.list" />" onclick="fn_egov_list_CntcInstt(); return false;"></span>
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

   &nbsp;연계시스템</td>
  <th>
  </th>
  <td width="10%"></td>
  <td width="35%"></td>
  <th width="10%">
  <form name="formCntcSystemRegist" action="<c:url value='/ssi/syi/iis/addCntcSystem.do'/>" method="post">
   <table border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif' />" alt="연계시스템등록" width="8" height="20"></td>
      <td style="background-image:URL(<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>);" class="text_left" nowrap>
      <input type="submit" value="연계시스템등록"  class="btnNew" style="height:20px;width:90px;" ></td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif' />" alt="연계시스템등록" width="8" height="20"></td>
      <td width="10"></td>
    </tr>
   </table>
   <input name="insttId" type="hidden" value="<c:out value='${result.insttId}'/>">
   </form>
  </th>
 </tr>
</table>

<form name="listForm" action="<c:url value='/ssi/syi/iis/getCntcInsttDetail.do'/>" method="post">
</form>

<table width="700" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<table width="700" cellpadding="0" class="table-line" border="0">
<thead>
<tr>
	<th class="title" width="150" nowrap>연계시스템</th>
	<th class="title" width="470" nowrap>연계서비스</th>
</tr>
</thead>

<tbody>
<c:forEach items="${cntcSystemList}" var="resultInfo" varStatus="status">
<tr>
	<td>
	<table width="180" cellpadding="0" class="table-register" border="0">
	<tr>
		<th class="title" width="60" height="23" nowrap>순번</th><td width="120" class="lt_text3" nowrap><c:out value="${(cntcSystemVO.pageIndex - 1) * cntcSystemVO.pageSize + status.count}"/></td>
	</tr>
	<tr>
		<th class="title" width="60" height="23" nowrap>시스템ID</th><td width="120" class="lt_text3" nowrap><c:out value="${resultInfo.sysId}"/></td>
	</tr>
	<tr>
		<th class="title" width="60" height="23" nowrap>시스템명</th><td width="120" class="lt_text"  nowrap><c:out value="${resultInfo.sysNm}"/></td>
	</tr>
	<tr>
		<th class="title" width="60" height="23" nowrap>시스템IP</th><td width="120" class="lt_text"  nowrap><c:out value="${resultInfo.sysIp}"/></td>
	</tr>
	<tr>
		<td colspan="2">

		<table border="0" cellspacing="0" cellpadding="0" align="center">
		<tr>
			<td>
				<form name="formCntcInsttUpdt" action="<c:url value='/ssi/syi/iis/updateCntcSystem.do'/>" method="post">
				<span class="button"><input type="submit" value="수정" onclick="fn_egov_modify_CntcSystem('<c:out value="${resultInfo.sysId}"/>'); return false;"></span>
				<input name="insttId" type="hidden" value="<c:out value='${result.insttId}'/>">
				<input name="sysId"   type="hidden" value="<c:out value='${resultInfo.sysId}'/>">
				<input name="svcId"   type="hidden" value="">
				</form>
			</td>

			<td width="1"></td>
			<td>
				<form name="formCntcInsttDelete" action="<c:url value='/ssi/syi/iis/removeCntcSystem.do'/>" method="post">
				<span class="button"><input type="submit" value="삭제" onclick="fn_egov_delete_CntcSystem('<c:out value="${resultInfo.sysId}"/>'); return false;"></span>
				<input name="insttId" type="hidden" value="<c:out value='${result.insttId}'/>">
				<input name="sysId"   type="hidden" value="<c:out value='${resultInfo.sysId}'/>">
				</form>
			</td>

			<td width="1"></td>
			<td>
				<form name="formCntcInsttList" action="<c:url value='/ssi/syi/iis/addCntcService.do'/>" method="post">
				<span class="button"><input type="submit" value="연계서비스등록" onclick="fn_egov_regist_CntcService('${resultInfo.sysId}'); return false;"></span>
				<input name="insttId" type="hidden" value="<c:out value='${result.insttId}'/>">
				<input name="sysId"   type="hidden" value="<c:out value='${resultInfo.sysId}'/>">
				</form>
			</td>
		</tr>
		</table>

		</td>
	</tr>
	</table>
	</td>
	<td>

		<table width="100%" cellpadding="0" class="table-list" border="0">
		<thead>
		<tr>
			<th class="title" width="30%" nowrap>서비스명</th>
			<th class="title" width="20%" nowrap>요청메시지</th>
			<th class="title" width="20%" nowrap>응답메시지</th>
			<th class="title" width="30%" nowrap>처리</th>
		</tr>
		</thead>

		<tbody>
		<c:forEach items="${cntcServiceList}" var="resultServiceInfo">
		<c:if test="${resultInfo.sysId == resultServiceInfo.sysId}">
		<tr>
			<td class="lt_text"  nowrap><c:out value="${resultServiceInfo.svcNm}"/></td>
			<td class="lt_text3" nowrap>
				<c:forEach var="result" items="${cntcMessageList}" varStatus="status">
					<c:if test="${result.cntcMessageId == resultServiceInfo.requestMessageId}"><c:out value="${result.cntcMessageNm}"/></c:if>
				</c:forEach>
			</td>
			<td class="lt_text3" nowrap>
				<c:forEach var="result" items="${cntcMessageList}" varStatus="status">
					<c:if test="${result.cntcMessageId == resultServiceInfo.rspnsMessageId}"><c:out value="${result.cntcMessageNm}"/></c:if>
				</c:forEach>
			</td>
			<td>

			<table border="0" cellspacing="0" cellpadding="0" align="center">
			<tr>
				<td>
					<form name="formCntcUpdt" action="<c:url value='/ssi/syi/iis/updateCntcService.do'/>" method="post">
					<span class="button"><input type="submit" value="수정" onclick="fn_egov_modify_CntcService('<c:out value="${resultInfo.sysId}"/>','<c:out value="${resultServiceInfo.svcId}"/>'); return false;"></span>
					<input name="insttId" type="hidden" value="<c:out value='${result.insttId}'/>">
					<input name="sysId"   type="hidden" value="<c:out value='${resultInfo.sysId}'/>">
					<input name="svcId"   type="hidden" value="<c:out value='${resultServiceInfo.svcId}'/>">
					</form>
				</td>

				<td width="1"></td>
				<td>
					<form name="formCntcDelete" action="<c:url value='/ssi/syi/iis/removeCntcService.do'/>" method="post">
					<span class="button"><input type="submit" value="삭제" onclick="fn_egov_delete_CntcService('<c:out value="${resultInfo.sysId}"/>','<c:out value="${resultServiceInfo.svcId}"/>'); return false;"></span>
					<input name="insttId" type="hidden" value="<c:out value='${result.insttId}'/>">
					<input name="sysId"   type="hidden" value="<c:out value='${resultInfo.sysId}'/>">
					<input name="svcId"   type="hidden" value="<c:out value='${resultServiceInfo.svcId}'/>">
					</form>
				</td>
			</tr>
			</table>

			</td>
		</tr>
		</c:if>
		</c:forEach>

		<c:if test="${fn:length(cntcServiceList) == 0}">
			<tr>
				<td class="lt_text3" colspan="5">
					<spring:message code="common.nodata.msg" />
				</td>
			</tr>
		</c:if>

		</tbody>
		</table>

	</td>
</tr>
</c:forEach>

<c:if test="${fn:length(cntcSystemList) == 0}">
	<tr>
		<td class="lt_text3" colspan="2">
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


</DIV>


</body>
</html>
