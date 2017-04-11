<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
 /**
  * @Class Name  : EgovSystemCntcDetail.jsp
  * @Description : EgovSystemCntcDetail 화면
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
<title>시스템연계 상세조회</title>

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
	varForm.cmd.value			= "";
	document.listForm.action 	= "<c:url value='${selfUri}'/>";
   	document.listForm.submit();
}

<c:set var="listUri" value="/ssi/syi/sim/getSystemCntcList.do" />
<c:set var="confirmTF" value="F"/>

/*
 * 관리자로 접근시 처리
 */
<c:if test="${selfUri eq '/ssi/syi/scm/getConfirmSystemCntcDetail.do'}">
	<c:set var="listUri" value="/ssi/syi/scm/getConfirmSystemCntcList.do" />
	<c:set var="confirmTF" value="T"/>

/* ********************************************************
 * 승인/승인취소 처리 함수
 ******************************************************** */
function fn_egov_confirm_SystemCntc(confmAt){
	if (confirm((confmAt=='Y')?"<spring:message code="common.acknowledgement.msg"/>":"<spring:message code="common.acknowledgementcancel.msg"/>")) {
		var varForm				    = document.all["Form"];
		varForm.cmd.value			= "Confirm";
		varForm.action              = "<c:url value='${selfUri}'/>";
		varForm.cntcId.value		= "<c:out value='${result.cntcId}'/>";
		varForm.confmAt.value		= confmAt;
		varForm.submit();
	}
}
</c:if>

/*
 * 업무사용자로 접근시 처리
 */
<c:if test="${selfUri eq '/ssi/syi/sim/getSystemCntcDetail.do'}">
/* ********************************************************
 * 수정화면으로  바로가기
 ******************************************************** */
function fn_egov_modify_SystemCntc(){
	var varForm				    = document.all["Form"];
	varForm.action              = "<c:url value='/ssi/syi/sim/updateSystemCntc.do'/>";
	varForm.cntcId.value		= "<c:out value='${result.cntcId}'/>";
	varForm.submit();
}
/* ********************************************************
 * 삭제 처리 함수
 ******************************************************** */
function fn_egov_delete_SystemCntc(){
	if (confirm("<spring:message code="common.delete.msg" />")) {
		var varForm				    = document.all["Form"];
		varForm.action			    = "<c:url value='/ssi/syi/sim/removeSystemCntc.do'/>";
		varForm.cntcId.value		= "<c:out value='${result.cntcId}'/>";
		varForm.submit();
	}
}
</c:if>


/* ********************************************************
* 목록 으로 가기
******************************************************** */
function fn_egov_list_SystemCntc(){
	location.href = "<c:url value='${listUri}'/>";
}
-->
</script>
</head>
<body>
<form name="Form" action="" method="post">
	<input name="cmd"     type="hidden">
	<input name="cntcId"  type="hidden">
	<input name="confmAt" type="hidden">
</form>
<%-- noscript 테그 --%>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<!-- 등록  폼 영역  -->
<table width="700" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%" class="title_left">
   		<h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;시스템연계 상세조회</h1>
  </td>
 </tr>
</table>
<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register">
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >연계ID<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td><c:out value="${result.cntcId}"/></td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >연계명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td><c:out value="${result.cntcNm}"/></td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >연계유형<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td><c:out value="${result.cntcType}"/></td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >제공기관<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td width="80%" nowrap>
		<select name="provdInsttId" class="select" disabled="disabled" title="제공기관선택">
			<c:forEach var="resultList" items="${cntcInsttList}" varStatus="status">
				<option value='<c:out value="${resultList.insttId}"/>' <c:if test="${resultList.insttId == result.provdInsttId}">selected="selected"</c:if> ><c:out value="${resultList.insttNm}"/></option>
			</c:forEach>
		</select>
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >제공시스템<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td width="80%" nowrap>
		<select name="provdSysId" class="select" disabled="disabled" title="제공시스템선택">
			<c:forEach var="resultList" items="${cntcProvdSystemList}" varStatus="status">
				<option value='<c:out value="${resultList.sysId}"/>' <c:if test="${resultList.sysId == result.provdSysId}">selected="selected"</c:if> ><c:out value="${resultList.sysNm}"/></option>
			</c:forEach>
		</select>
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >제공서비스<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td width="80%" nowrap>
		<select name="provdSvcId" class="select" disabled="disabled" title="제공서비스선택">
			<c:forEach var="resultList" items="${cntcProvdServiceList}" varStatus="status">
				<option value='<c:out value="${resultList.svcId}"/>' <c:if test="${resultList.svcId == result.provdSvcId}">selected="selected"</c:if> ><c:out value="${resultList.svcNm}"/></option>
			</c:forEach>
		</select>
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >요청기관<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td width="80%" nowrap>
		<select name="requstInsttId" class="select" disabled="disabled" title="요청기관선택">
			<c:forEach var="resultList" items="${cntcInsttList}" varStatus="status">
				<option value='<c:out value="${resultList.insttId}"/>' <c:if test="${resultList.insttId == result.requstInsttId}">selected="selected"</c:if> ><c:out value="${resultList.insttNm}"/></option>
			</c:forEach>
		</select>
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >요청시스템<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td width="80%" nowrap>
		<select name="requstSysId" class="select" disabled="disabled" title="요청시스템선택">
			<c:forEach var="resultList" items="${cntcRequstSystemList}" varStatus="status">
				<option value='<c:out value="${resultList.sysId}"/>' <c:if test="${resultList.sysId == result.requstSysId}">selected="selected"</c:if> ><c:out value="${resultList.sysNm}"/></option>
			</c:forEach>
		</select>
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >유효시작일자<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td><c:out value='${fn:substring(result.validBeginDe, 0,4)}'/>-<c:out value='${fn:substring(result.validBeginDe, 4,6)}'/>-<c:out value='${fn:substring(result.validBeginDe, 6,8)}'/></td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >유효종료일자<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td><c:out value='${fn:substring(result.validEndDe, 0,4)}'/>-<c:out value='${fn:substring(result.validEndDe, 4,6)}'/>-<c:out value='${fn:substring(result.validEndDe, 6,8)}'/></td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >사용여부<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td width="80%" nowrap>
	  <select name="useAt" disabled="disabled" title="사용여부선택">
	      <option value="Y" <c:if test="${result.useAt == 'Y'}">selected="selected"</c:if> >Y</option>
		  <option value="N" <c:if test="${result.useAt == 'N'}">selected="selected"</c:if> >N</option>
	  </select>
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >승인여부<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td width="80%" nowrap>
	  <select name="confmAt" disabled="disabled" title="승인여부선택">
	      <option value="Y" <c:if test="${result.confmAt == 'Y'}">selected="selected"</c:if> >Y</option>
		  <option value="N" <c:if test="${result.confmAt == 'N'}">selected="selected"</c:if> >N</option>
	  </select>
    </td>
  </tr>
</table>
<!-- 줄간격조정  -->
<table width="700" border="0" cellspacing="0" cellpadding="0">
<tr><td height="10px"></td></tr>
<tr>
	<td>
		<!-- 목록/저장버튼  -->
		<table border="0" cellspacing="0" cellpadding="0" align="center">
		<tr>

		<% /** * 업무사용자 처리 */ %>
		<c:if test="${confirmTF eq 'F'}">

			<% /** * 승인여부 처리 */ %>
			<c:if test="${result.confmAt eq 'N'}">
			<td>
				<form name="formUpdt" action="<c:url value='/ssi/syi/sim/updateSystemCntc.do'/>" method="post">
				<span class="button"><input type="submit" value="<spring:message code="button.update" />" title="<spring:message code="button.update" />" onclick="fn_egov_modify_SystemCntc(); return false;"></span>
				<input name="cntcId"        type="hidden" value="<c:out value='${result.cntcId}'/>">
				</form>
			</td>
			<td width="3"></td>
			<td>
				<form name="formDelete" action="<c:url value='/ssi/syi/sim/removeSystemCntc.do'/>" method="post">
				<span class="button"><input type="submit" value="<spring:message code="button.delete" />" title="<spring:message code="button.delete" />" onclick="fn_egov_delete_SystemCntc(); return false;"></span>
				<input name="cntcId"        type="hidden" value="<c:out value='${result.cntcId}'/>">
				</form>
			</td>
			</c:if>
		</c:if>

		<% /** * 업무사용자 처리 */ %>
		<c:if test="${confirmTF eq 'T'}">

			<% /** * 승인여부 처리 */ %>
			<c:if test="${result.confmAt eq 'N'}">
			<td width="3"></td>
			<td>
				<form name="formConfirm" action="<c:url value='${selfUri}'/>" method="post">
				<span class="button"><input type="submit" value="승인" title="승인" onclick="fn_egov_confirm_SystemCntc('Y'); return false;"></span>
				<input name="cntcId"  type="hidden" value="<c:out value='${result.cntcId}'/>">
				<input name="confmAt" type="hidden" value="Y">
				<input name="cmd"     type="hidden" value="Confirm">
				</form>
			</td>
			</c:if>

			<c:if test="${result.confmAt eq 'Y'}">
			<td width="3"></td>
			<td>
				<form name="formConfirmCancel" action="<c:url value='${selfUri}'/>" method="post">
				<span class="button"><input type="submit" value="승인취소" title="승인취소" onclick="fn_egov_confirm_SystemCntc('N'); return false;"></span>
				<input name="cntcId"  type="hidden" value="<c:out value='${result.cntcId}'/>">
				<input name="confmAt" type="hidden" value="N">
				<input name="cmd"     type="hidden" value="Confirm">
				</form>
			</td>
			</c:if>
		</c:if>

			<td width="3"></td>
			<td>
				<form name="formList" action="<c:url value='${listUri}'/>" method="post">
				<span class="button"><input type="submit" value="<spring:message code="button.list" />" title="<spring:message code="button.list" />" onclick="fn_egov_list_SystemCntc(); return false;"></span>
				</form>
			</td>
		</tr>
		</table>
	</td>
</tr>
</table>

</body>
</html>
