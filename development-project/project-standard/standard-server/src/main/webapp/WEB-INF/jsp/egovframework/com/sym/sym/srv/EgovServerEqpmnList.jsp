<%--
/**
 * @Class Name : EgovServerEqpmnList.java
 * @Description : EgovServerEqpmnList jsp
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
<title>서버장비 목록조회</title>

<script type="text/javaScript" language="javascript" defer="defer">
<!--

function fncSelectServerEqpmnList(pageNo){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sym/sym/srv/selectServerEqpmnList.do'/>";
    document.listForm.submit();
}

function fncSelectServerEqpmn(serverEqpmnId) {
    document.listForm.serverEqpmnId.value = serverEqpmnId;
    document.listForm.action = "<c:url value='/sym/sym/srv/getServerEqpmn.do'/>";
    document.listForm.submit();   
}

function fncAddServerEqpmnInsert() {
	if(document.listForm.pageIndex.value == "") {
		document.listForm.pageIndex.value = 1;
	} 
    document.listForm.action = "<c:url value='/sym/sym/srv/addViewServerEqpmn.do'/>";
    document.listForm.submit(); 
}

function linkPage(pageNo){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sym/sym/srv/selectServerEqpmnList.do'/>";
    document.listForm.submit();
}

function press() {
    if (event.keyCode==13) {
    	fncSelectServerEqpmnList('1');
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

<form name="listForm" action="<c:url value='/sym/sym/srv/selectServerEqpmnList.do'/>" method="post">
<table width="100%" class="table-search" border="0">
 <tr>
  <td width="150"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" style="vertical-align:middle;" alt="">&nbsp;서버H/W 관리</h1>
  </td>
  <td width="400"><label for="strServerEqpmnNm">서버H/W 명 : </label><input name="strServerEqpmnNm" id="strServerEqpmnNm" type="text" value="<c:out value="${serverEqpmnVO.strServerEqpmnNm}"/>" size="15" title="검색" onkeypress="press();" ></td>
  <td width="150" align="right">
       <table border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td><span class="button"><input type="submit" value="<spring:message code="button.inquire" />" onclick="fncSelectServerEqpmnList('1'); return false;"></span></td>
          <td>&nbsp;&nbsp;</td>
          <td><span class="button"><a href="<c:url value='/sym/sym/srv/addViewServerEqpmn.do'/>?pageIndex=<c:out value='${serverEqpmnVO.pageIndex}'/>&amp;strServerEqpmnNm=<c:out value="${serverEqpmnVO.strServerEqpmnNm}"/>" onclick="fncAddServerEqpmnInsert(); return false;"><spring:message code="button.create" /></a></span></td>     
        </tr>
       </table>
  </td>  
 </tr>
 <tr>
  <td class="title_left" colspan="3"></td>
 </tr>    
</table>
<input type="hidden" name="serverEqpmnId">
<input type="hidden" name="pageIndex" value="<c:if test="${empty serverEqpmnVO.pageIndex }">1</c:if><c:if test="${!empty serverEqpmnVO.pageIndex }"><c:out value='${serverEqpmnVO.pageIndex}'/></c:if>">
</form>

<table width="100%" cellpadding="8" class="table-list" summary="서버장비에 대한 목록을 제공한다.">
 <caption>서버장비 목록</caption>
 <thead>
  <tr>
    <th class="title" width="25%" scope="col" nowrap>서버H/W ID</th>
    <th class="title" width="25%" scope="col" nowrap>서버H/W 명</th>
    <th class="title" width="20%" scope="col" nowrap>서버H/W IP</th>
    <th class="title" width="10%" scope="col" nowrap>관리자</th>
    <th class="title" width="20%" scope="col" nowrap>등록일자</th>
  </tr>
 </thead>
 <tbody>
 <c:forEach var="serverEqpmn" items="${serverEqpmnList}" varStatus="status">
  <tr>
    <td class="lt_text3" nowrap>
        <form name="item" method="post" action="<c:url value='/sym/sym/srv/getServerEqpmn.do'/>">
            <input type="hidden" name="serverEqpmnId" value="<c:out value="${serverEqpmn.serverEqpmnId}"/>">
            <input type="hidden" name="pageIndex" value="<c:out value='${serverEqpmnVO.pageIndex}'/>">
            <input type="hidden" name="strServerEqpmnNm" value="<c:out value="${serverEqpmnVO.strServerEqpmnNm}"/>">
            <span class="link"><input type="submit" value="<c:out value="${serverEqpmn.serverEqpmnId}"/>" onclick="fncSelectServerEqpmn('<c:out value="${serverEqpmn.serverEqpmnId}"/>'); return false;"></span>
        </form>
    </td>
    <td class="lt_text3" nowrap><c:out value="${serverEqpmn.serverEqpmnNm}"/></td>
    <td class="lt_text3" nowrap><c:out value="${serverEqpmn.serverEqpmnIp}"/></td>
    <td class="lt_text3" nowrap><c:out value="${serverEqpmn.serverEqpmnMngrNm}"/></td>
    <td class="lt_text3" nowrap><c:out value="${serverEqpmn.regstYmd}"/></td>
  </tr>
 </c:forEach>
 </tbody>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"></td>
  </tr>
</table>

<c:if test="${!empty serverEqpmnVO.pageIndex }">
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
