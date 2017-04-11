<%--
  Class Name : EgovUnityLinkDetail.jsp
  Description : 통합링크관리 상세보기
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2008.03.09    장동한          최초 생성

    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.09

    Copyright (C) 2009 by MOPAS  All right reserved.
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ImgUrl" value="${pageContext.request.contextPath}/images/egovframework/com/cmm/"/>
<c:set var="CssUrl" value="${pageContext.request.contextPath}/css/egovframework/com/" />
<%pageContext.setAttribute("crlf", "\r\n"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>통합링크관리 관리</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css">
<link type="text/css" rel="stylesheet" href="${CssUrl}button.css">
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_UnityLink(){

}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_UnityLink(){
	location.href = "<c:url value='/uss/ion/ulm/listUnityLink.do' />";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_modify_UnityLink(){
	var vFrom = document.UnityLinkForm;
	vFrom.cmd.value = '';
	vFrom.action = "<c:url value='/uss/ion/ulm/updtUnityLink.do' />";;
	vFrom.submit();

}
/* ********************************************************
 * 삭제처리
 ******************************************************** */
function fn_egov_delete_UnityLink(){
	var vFrom = document.UnityLinkForm;
	if(confirm("삭제 하시겠습니까?")){
		vFrom.cmd.value = 'del';
		vFrom.action = "<c:url value='/uss/ion/ulm/detailUnityLink.do' />";
		vFrom.submit();
	}else{
		vFrom.cmd.value = '';
	}
}
</script>
</head>
<body onLoad="fn_egov_init_UnityLink();">
<DIV id="content" style="width:712px">

<%-- noscript 테그 --%>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<!--  상단타이틀 -->
<form name="UnityLinkForm" action="<c:url value=''/>" method="post">
<!-- ----------------- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <img src="${ImgUrl}icon/tit_icon.gif" width="16" height="16" hspace="3" align="middle" alt=" ">&nbsp;통합링크관리 상세보기</td>
 </tr>
</table>
<!--  줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<input name="unityLinkId" type="hidden" value="${unityLink.unityLinkId}">
<input name="cmd" type="hidden" value="<c:out value=''/>"/>
</form>
<!--  등록  폼 영역  -->

<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register">
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >통합링크명<img src="${ImgUrl}icon/required.gif" alt="필수입력" title="필수입력" width="15" height="15"></th>
    <td width="80%">
		<c:out value="${unityLink.unityLinkNm}" escapeXml="false" />
    </td>
  </tr>
  <tr>
    <th height="23" class="required_text" >통합링크그룹<img src="${ImgUrl}icon/required.gif" alt="필수입력" title="필수입력" width="15" height="15"></th>
    <td>
 	<c:forEach items="${unityLinkSeCodeList}" var="resultInfo1" varStatus="pollKindStatus">
		<c:if test="${resultInfo1.code eq unityLink.unityLinkSeCode}">
		<c:out value="${resultInfo1.codeNm}" escapeXml="false" />
		</c:if>
	</c:forEach>
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >통합링크URL<img src="${ImgUrl}icon/required.gif" alt="필수입력" title="필수입력" width="15" height="15"></th>
    <td width="80%">
		<c:out value="${unityLink.unityLinkUrl}" escapeXml="false" />
    </td>
  </tr>

  <tr>
    <th width="20%" height="23" class="required_text" nowrap >통합링크설명<img src="${ImgUrl}icon/required.gif" alt="필수입력" title="필수입력" width="15" height="15"></th>
    <td width="80%">

		<table width="500px" border="0" cellpadding="0" cellspacing="0" style="table-layout:fixed">
		<tr>
			<td>
			<c:out value="${unityLink.unityLinkDc}" escapeXml="false" />
		    </td>
		  </tr>
		</table>

    </td>
  </tr>
</table>

<!--  줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<center>
<!--  목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
	<td>
		<form name="formUpdt" action="<c:url value='/uss/ion/ulm/updtUnityLink.do'/>" method="post">
		<span class="button"><input type="submit" value="<spring:message code="button.update" />" onclick="fn_egov_modify_UnityLink(); return false;"></span>
		<input name="unityLinkId" type="hidden" value="${unityLink.unityLinkId}">
		</form>
	</td>
	<td width="3"></td>
	<td>
		<form name="formDelete" action="<c:url value='/uss/ion/ulm/detailUnityLink.do'/>" method="post">
		<span class="button"><input type="submit" value="<spring:message code="button.delete" />" onclick="fn_egov_delete_UnityLink(); return false;"></span>
		<input name="unityLinkId" type="hidden" value="${unityLink.unityLinkId}">
		<input name="cmd" type="hidden" value="<c:out value='del'/>"/>
		</form>
	</td>
	<td width="3"></td>
	<td>
		<form name="formList" action="<c:url value='/uss/ion/ulm/listUnityLink.do'/>" method="post">
		<span class="button"><input type="submit" value="<spring:message code="button.list" />" onclick="fn_egov_list_UnityLink(); return false;"></span>
		</form>
	</td>
</tr>
</table>

</center>
<!--  줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>


</DIV>

</body>
</html>
