<%--
/**
 * @Class Name  : EgovTroblProcessList.java
 * @Description : EgovTroblProcessList jsp
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
<title>장애처리 관리</title>

<script type="text/javaScript" language="javascript" defer="defer">
<!--

function fncSelectTroblProcessList(pageNo){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sym/tbm/tbp/selectTroblProcessList.do'/>";
    document.listForm.submit();
}

function fncSelectTroblProcess(troblId) {
    document.listForm.troblId.value = troblId;
    document.listForm.action = "<c:url value='/sym/tbm/tbp/getTroblProcess.do'/>";
    document.listForm.submit();   
}

function fncAddTroblProcessInsert() {
	if(document.listForm.pageIndex.value == "") {
		document.listForm.pageIndex.value = 1;
	} 
    document.listForm.action = "<c:url value='/sym/tbm/tbp/addViewTroblProcess.do'/>";
    document.listForm.submit(); 
}

function linkPage(pageNo){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sym/tbm/tbp/selectTroblProcessList.do'/>";
    document.listForm.submit();
}

function press() {
    if (event.keyCode==13) {
    	fncSelectTroblProcessList('1');
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

<form name="listForm" action="<c:url value='/sym/tbm/tbp/selectTroblProcessList.do'/>" method="post">
<table width="100%" class="table-search" border="0">
 <tr>
  <td width="100%" class="title_left" colspan="4">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" style="vertical-align:middle;" alt="">&nbsp;장애처리 관리</h1>
  </td>
 </tr>
 <tr>  
  <td width="200"><label for="strTroblNm">장애명 : </label><input name="strTroblNm" id="strTroblNm" type="text" value="<c:out value="${troblProcessVO.strTroblNm}"/>" size="20" title="검색" onkeypress="press();" ></td>
  <td width="200"><label for="strTroblKnd">장애종류 : </label>
      <select name="strTroblKnd" id="strTroblKnd">
        <option value="00">전체</option>
        <c:forEach var="cmmCodeDetail1" items="${cmmCodeDetailList1}" varStatus="status">
          <option value="<c:out value="${cmmCodeDetail1.code}"/>" <c:if test="${cmmCodeDetail1.code == troblProcessVO.strTroblKnd}">selected</c:if>><c:out value="${cmmCodeDetail1.codeNm}"/></option>
        </c:forEach>
      </select>   
  </td>
  <td width="150"><label for="strProcessSttus">처리상태 : </label>
      <select name="strProcessSttus" id="strProcessSttus">
        <option value="00">전체</option>
        <c:forEach var="cmmCodeDetail2" items="${cmmCodeDetailList2}" varStatus="status">
          <option value="<c:out value="${cmmCodeDetail2.code}"/>" <c:if test="${cmmCodeDetail2.code == troblProcessVO.strProcessSttus}">selected</c:if>><c:out value="${cmmCodeDetail2.codeNm}"/></option>
        </c:forEach>
      </select>   
  </td>  
  <th width="150" align="right">
       <table border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td><span class="button"><input type="submit" value="<spring:message code="button.inquire" />" onclick="fncSelectTroblProcessList('1'); return false;"></span></td>
        </tr>
       </table>
  </th>  
 </tr>
 <tr>
  <td class="title_left" colspan="4"></td>
 </tr>   
</table>
<input type="hidden" name="troblId">
<input type="hidden" name="pageIndex" value="<c:if test="${empty troblProcessVO.pageIndex }">1</c:if><c:if test="${!empty troblProcessVO.pageIndex }"><c:out value='${troblProcessVO.pageIndex}'/></c:if>">
</form>

<table width="100%" cellpadding="8" class="table-list" summary="장애처리에 대한 목록을 제공한다.">
 <caption>장애처리 목록</caption>
 <thead>
  <tr>
    <th class="title" width="24%" scope="col" nowrap>장애ID</th>
    <th class="title" width="20%" scope="col" nowrap>장애명</th>
    <th class="title" width="18%" scope="col" nowrap>장애종류</th>
    <th class="title" width="20%" scope="col" nowrap>장애발생시간</th>
    <th class="title" width="8%" scope="col" nowrap>등록자</th>
    <th class="title" width="10%" scope="col" nowrap>처리상태</th>    
  </tr>
 </thead>
 <tbody>
 <c:forEach var="troblProcess" items="${troblProcessList}" varStatus="status">
  <tr>
    <td class="lt_text3" nowrap>
        <form name="item" method="post" action="<c:url value='/sym/tbm/tbp/getTroblProcess.do'/>">
            <input type="hidden" name="troblId" value="<c:out value="${troblProcess.troblId}"/>">
            <input type="hidden" name="pageIndex" value="<c:out value='${troblProcessVO.pageIndex}'/>">
            <input type="hidden" name="strTroblNm" value="<c:out value='${troblProcessVO.strTroblNm}'/>">
            <span class="link"><input type="submit" value="<c:out value="${troblProcess.troblId}"/>" onclick="fncSelectTroblProcess('<c:out value="${troblProcess.troblId}"/>'); return false;"></span>
        </form>
    </td>
    <td class="lt_text3" nowrap><c:out value="${troblProcess.troblNm}"/></td>
    <td class="lt_text3" nowrap><c:out value="${troblProcess.troblKndNm}"/></td>
    <td class="lt_text3" nowrap><c:out value="${troblProcess.troblOccrrncTime}"/></td>
    <td class="lt_text3" nowrap><c:out value="${troblProcess.troblRqesterNm}"/></td>
    <td class="lt_text3" nowrap><c:out value="${troblProcess.processSttusNm}"/></td>
  </tr>
 </c:forEach>
 </tbody>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"></td>
  </tr>
</table>

<c:if test="${!empty troblProcessVO.pageIndex }">
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
