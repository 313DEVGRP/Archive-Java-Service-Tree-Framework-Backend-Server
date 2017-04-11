<%--
  Class Name : EgovNoteTrnsmitDetail.jsp
  Description : 보낸쪽지함 상세조회
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.09.16    장동한          최초 생성

    author   : 공통서비스 개발팀 장동한
    since    : 2009.09.16

    Copyright (C) 2009 by MOPAS  All right reserved.
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>보낸쪽지함 관리-상세보기</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_NoteTrnsmit(){

}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_NoteTrnsmit(){
	location.href = "<c:url value='/uss/ion/nts/listNoteTrnsmit.do'/>";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_modify_NoteTrnsmit(){
	var vFrom = document.NoteTrnsmitForm;
	vFrom.cmd.value = '';
	vFrom.action = "<c:url value='/uss/ion/ntm/registEgovNoteManage.do'/>";;
	vFrom.submit();

}
/* ********************************************************
 * 삭제처리
 ******************************************************** */
function fn_egov_delete_NoteTrnsmit(){
	var vFrom = document.NoteTrnsmitForm;
	if(confirm("삭제 하시겠습니까?")){
		vFrom.cmd.value = 'del';
		vFrom.action = "<c:url value='/uss/ion/nts/detailNoteTrnsmit.do'/>";
		vFrom.submit();
	}else{
		vFrom.cmd.value = '';
	}
}
</script>
</head>
<body onLoad="fn_egov_init_NoteTrnsmit();">
<DIV id="content" style="width:712px">
<%-- noscript 테그 --%>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<!--  상단타이틀 -->
<form name="NoteTrnsmitForm" action="<c:url value='/uss/ion/nts/detailNoteTrnsmit.do'/>" method="post">
<!-- ----------------- 상단 타이틀  영역 -->
<div class="title_left" style="width:100%;margin:0 0 0 0;">
	<h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif'/>" width="16" height="16" hspace="3" style="vertical-align:middle; display:inline-block;" alt=" ">&nbsp;보낸쪽지함 상세조회</h1>
</div>

<!--  줄간격조정  -->
<div style="width:100%;border:solid 0px #000000;height:3px"></div>

<!--  등록  폼 영역  -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="상세조회  목록을  제공한다.">
<caption>상세조회  목록을  제공한다</caption>
<tr>
	<th scope="row" width="20%" height="23" class="required_text">쪽지 제목</th>
	<td width="80%" colspan="3">&nbsp;<c:out value="${noteTrnsmit.noteSj}" /></td>
</tr>
<tr>
	<th scope="row" width="20%" height="23" class="required_text">발신자</th>
	<td width="45%">&nbsp;<c:out value="${noteTrnsmit.frstRegisterNm}" /></td>
	<th width="15%" class="required_text">&nbsp;발신시각</th>
	<td width="20%">&nbsp;<c:out value="${noteTrnsmit.frstRegisterPnttm}" /></td>
</tr>
<tr>
	<th scope="row" width="20%" height="23" class="required_text">수신자</th>
	<td width="80%" colspan="3">


	<div style="float:left;padding:0px 0px 0px 3px; ">
	<c:forEach items="${resultRecptnEmp}" var="resultInfo" varStatus="status">
		<c:out value="${resultInfo.rcverNm}" />
		<c:if test="${fn:length(resultRecptnEmp) != status.count}">,</c:if>
	</c:forEach>
	</div>

	<div style="float:right;">
		<font color="green">[전체:${noteTrnsmit.rcverTotal}]</font>&nbsp;&nbsp;
		<font color="blue">[개봉:${noteTrnsmit.openY}]</font>&nbsp;&nbsp;
		<font color="red">[미개봉:${noteTrnsmit.openN}]</font>&nbsp;&nbsp;
	</div>

	</td>
</tr>
<tr>
	<th scope="row" width="20%" height="23" class="required_text">쪽지 내용</th>
	<td width="80%" colspan="3">
	<br>
	<c:set var="noteTrnsmitNoteCn" value="${fn:escapeXml(noteTrnsmit.noteCn)}"/>
	<c:set var="noteTrnsmitNoteCn" value="${fn:replace(noteTrnsmitNoteCn , crlf , '<br>')}"/>
	<c:out value="${noteTrnsmitNoteCn}" escapeXml="false" />
	<br>
	</td>
</tr>
</table>
<input name="noteId" type="hidden" value="${noteTrnsmit.noteId}">
<input name="noteTrnsmitId" type="hidden" value="${noteTrnsmit.noteTrnsmitId}">

<input name="cmd" type="hidden" value="<c:out value=''/>">
<div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div>
</form>

<!--  줄간격조정  -->
<div style="width:100%;border:solid 0px #000000;height:3px"></div>
<center>

<!--  목록/저장버튼  -->
<table cellspacing="0" cellpadding="0" border="0" summary="삭제 /목록 버튼을 제공한다.">
<caption>삭제 /목록 버튼을 제공한다</caption>
<tr>
	<!-- 재전송/삭제 버튼 -->
	<td>
	<form name="formDelete" action="<c:url value='/uss/ion/nts/detailNoteTrnsmit.do'/>" method="post">
	<span class="button"><input type="submit" value="<spring:message code="button.delete" />" onclick="fn_egov_delete_NoteTrnsmit(); return false;"></span>
	<input name="popupId" type="hidden" value="${popupManageVO.popupId}">
	<input name="cmd" type="hidden" value="<c:out value='del'/>">
	</form>
	</td>
	<th width="3" scope="col"></th>
	<!-- 목록 버튼 -->
	<td>
		<form name="formList" action="<c:url value='/uss/ion/nts/listNoteTrnsmit.do'/>" method="post">
		<span class="button"><input type="submit" value="<spring:message code="button.list" />" onclick="fn_egov_list_NoteTrnsmit(); return false;"></span>
		</form>
	</td>
</tr>
</table>

<!--  줄간격조정  -->
<div style="width:100%;border:solid 0px #000000;height:3px"></div>

</center>

</DIV>

</body>
</html>