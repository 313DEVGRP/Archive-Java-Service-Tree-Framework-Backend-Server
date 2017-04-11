<%--
/**
 * @Class Name  : EgovMntrngServerList.java
 * @Description : EgovMntrngServerList jsp
 * @Modification Information
 * @
 * @  수정일                    수정자                수정내용
 * @ ---------     --------    ---------------------------
 * @ 2010.07.01    lee.m.j     최초 생성
 *
 *  @author lee.m.j
 *  @since 2010.09.01
 *  @version 1.0
 *  @see
 *
 *  Copyright (C) 2009 by MOPAS  All right reserved.
 */
--%>

<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<title>서버자원모니터링  목록조회</title>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />"></script>
<script type="text/javaScript" language="javascript" defer="defer">
<!--

function fncSelectMntrngServerList(pageNo) {

    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/utl/sys/srm/selectMntrngServerList.do'/>";
    document.listForm.submit();
}

function linkPage(pageNo){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/utl/sys/srm/selectMntrngServerList.do'/>";
    document.listForm.submit();
}

function press() {
    if (event.keyCode==13) {
    	fncSelectMntrngServerList('1');
    }
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

<form name="listForm" action="<c:url value='/utl/sys/srm/selectMntrngServerList.do'/>" method="post">
<table width="100%" class="table-search" border="0">
 <tr>
  <td width="230"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" style="vertical-align:middle;" alt="">&nbsp;서버자원모니터링  대상목록</h1>
  </td>
  <td width="420"><label for="strServerNm">서버H/W 명 : </label><input name="strServerNm" id="strServerNm" type="text" value="<c:out value="${serverResrceMntrngVO.strServerNm}"/>" size="20" title="검색" onkeypress="press();" ></td>
  <td width="50" align="right">
       <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><span class="button"><input type="submit" value="<spring:message code="button.inquire" />" onclick="fncSelectMntrngServerList('1'); return false;"></span></td>
          <td>&nbsp;</td>
          <td><span class="button"><a href="<c:url value='/utl/sys/srm/selectServerResrceMntrngList.do'/>">로그</a></span></td>
        </tr>
       </table>
  </td>
 </tr>
 <tr>
  <td class="title_left" colspan="4"></td>
 </tr>
</table>
<input type="hidden" name="logId">
<input type="hidden" name="pageIndex" value="<c:if test="${empty serverResrceMntrngVO.pageIndex }">1</c:if><c:if test="${!empty serverResrceMntrngVO.pageIndex }"><c:out value='${serverResrceMntrngVO.pageIndex}'/></c:if>">
</form>
<table width="100%" cellpadding="8" class="table-list" summary="모니터링  대상서버에 대한 정보 목록을 제공한다.">
 <caption>서버자원모니터링  대상목록</caption>
 <thead>
  <tr>
    <th class="title" width="25%" scope="col" nowrap>서버H/W ID</th>
    <th class="title" width="25%" scope="col" nowrap>서버H/W 명</th>
    <th class="title" width="25%" scope="col" nowrap>서버H/W IP</th>
    <th class="title" width="25%" scope="col" nowrap>담당자 E-Mail</th>
  </tr>
 </thead>
 <tbody>
 <c:forEach var="mntrngServer" items="${mntrngServerList}" varStatus="status">
  <tr>
    <td class="lt_text3" nowrap><c:out value="${mntrngServer.serverEqpmnId}"/></td>
    <td class="lt_text3" nowrap><c:out value="${mntrngServer.serverNm}"/><c:if test="${serverResrceMntrng.cpuUseRt != null}">%</c:if></td>
    <td class="lt_text3" nowrap><c:out value="${mntrngServer.serverEqpmnIp}"/><c:if test="${serverResrceMntrng.cpuUseRt != null}">%</c:if></td>
    <td class="lt_text3" nowrap><c:out value="${mntrngServer.mngrEamilAddr}"/></td>
  </tr>
 </c:forEach>
 </tbody>
</table>
<br>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="10"></td>
  </tr>
</table>

<c:if test="${!empty serverResrceMntrngVO.pageIndex }">
<div align="center">
    <ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="linkPage" />
</div>
</c:if>
</td>
</tr>
</table>

</DIV>
</body>
</html>