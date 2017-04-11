<%--
/**
 * @Class Name : EgovServerList.java
 * @Description : EgovServerList jsp
 * @Modification Information
 * @
 * @  수정일                    수정자                수정내용
 * @ ---------     --------    ---------------------------
 * @ 2010.07.01    lee.m.j     최초 생성
 *
 *  @author lee.m.j
 *  @since 2010.07.01
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
<title>서버 목록조회</title>

<script type="text/javaScript" language="javascript" defer="defer">
<!--

function fncSelectServerList(pageNo){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sym/sym/srv/selectServerList.do'/>";
    document.listForm.submit();
}

function fncSelectServer(serverId) {
    document.listForm.serverId.value = serverId;
    document.listForm.action = "<c:url value='/sym/sym/srv/getServer.do'/>";
    document.listForm.submit();   
}

function fncAddServerInsert() {
	if(document.listForm.pageIndex.value == "") {
		document.listForm.pageIndex.value = 1;
	} 
    document.listForm.action = "<c:url value='/sym/sym/srv/addViewServer.do'/>";
    document.listForm.submit(); 
}

function linkPage(pageNo){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sym/sym/srv/selectServerList.do'/>";
    document.listForm.submit();
}

function press() {
    if (event.keyCode==13) {
    	fncSelectServerList('1');
    }
}

function windowOpen(serverId) {
	var url = "/sym/sym/srv/selectServerEqpmnRelateList.do?strServerId="+serverId;
	window.open(url,'','toolbar=no,menubar=no,location=no,directions=no, scrollbars=yes,status=yes,fullscreen=no,width=770,height=520'); 
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

<form name="listForm" action="<c:url value='/sym/sym/srv/selectServerList.do'/>" method="post">
<table width="100%" class="table-search" border="0">
 <tr>
  <td width="150"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" style="vertical-align:middle;" alt="">&nbsp;서버S/W 관리</h1>
  </td>
  <td width="400"><label for="strServerNm">서버S/W 명 : </label><input name="strServerNm" id="strServerNm" type="text" value="<c:out value="${serverVO.strServerNm}"/>" size="15" title="검색" onkeypress="press();" ></td>
  <td width="150" align="right">
       <table border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td><span class="button"><input type="submit" value="<spring:message code="button.inquire" />" onclick="fncSelectServerList('1'); return false;"></span></td>
          <td>&nbsp;&nbsp;</td>
          <td><span class="button"><a href="<c:url value='/sym/sym/srv/addViewServer.do'/>?pageIndex=<c:out value='${serverVO.pageIndex}'/>&amp;strServerNm=<c:out value="${serverVO.strServerNm}"/>" onclick="fncAddServerInsert(); return false;"><spring:message code="button.create" /></a></span></td>     
        </tr>
       </table>
  </td>  
 </tr>
 <tr>
  <td class="title_left" colspan="3"></td>
 </tr> 
</table>
<input type="hidden" name="serverId">
<input type="hidden" name="pageIndex" value="<c:if test="${empty serverVO.pageIndex }">1</c:if><c:if test="${!empty serverVO.pageIndex }"><c:out value='${serverVO.pageIndex}'/></c:if>">
</form>

<table width="100%" cellpadding="8" class="table-list" summary="서버정보에 대한 목록을 제공한다.">
 <caption>서버S/W 목록</caption>
 <thead>
  <tr>
    <th class="title" width="25%" scope="col" nowrap>서버S/W ID</th>
    <th class="title" width="30%" scope="col" nowrap>서버S/W 명</th>
    <th class="title" width="20%" scope="col" nowrap>서버S/W 종류</th>
    <th class="title" width="10%" scope="col" nowrap>등록일자</th>
    <th class="title" width="15%" scope="col" nowrap>서버H/W 등록</th>
  </tr>
 </thead>
 <tbody>
 <c:forEach var="server" items="${serverList}" varStatus="status">
  <tr>
    <td class="lt_text3" nowrap>
        <form name="item" method="post" action="<c:url value='/sym/sym/srv/getServer.do'/>">
            <input type="hidden" name="serverId" value="<c:out value="${server.serverId}"/>">
            <input type="hidden" name="pageIndex" value="<c:out value='${serverVO.pageIndex}'/>">
            <input type="hidden" name="strServerNm" value="<c:out value="${serverVO.strServerNm}"/>">
            <span class="link"><input type="submit" value="<c:out value="${server.serverId}"/>" onclick="fncSelectServer('<c:out value="${server.serverId}"/>'); return false;"></span>
        </form>
    </td>
    <td class="lt_text3" nowrap><c:out value="${server.serverNm}"/></td>
    <td class="lt_text3" nowrap><c:out value="${server.serverKndNm}"/></td>
    <td class="lt_text3" nowrap><c:out value="${server.regstYmd}"/></td>
    <!-- <td class="lt_text3" nowrap><a href="<c:url value='/images/egovframework/com/cmm/icon/search2.gif'/>" width="15" height="15" alt=""></a></td>-->
    <td class="lt_text3" nowrap><a href="#" onClick="windowOpen('<c:out value="${server.serverId}"/>')"><img src="<c:url value='/images/egovframework/com/cmm/icon/search2.gif'/>" width="15" height="15" alt=""></a></td>
  </tr>
 </c:forEach>
 </tbody>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"></td>
  </tr>
</table>

<c:if test="${!empty serverVO.pageIndex }">
<div align="center">
    <div>
        <ui:pagination paginationInfo = "${paginationInfo}"
            type="image"
            jsFunction="linkPage"
            />
    </div>
</div>
</c:if>
</td>
</tr>
</table>
</DIV>
</body>
</html>
