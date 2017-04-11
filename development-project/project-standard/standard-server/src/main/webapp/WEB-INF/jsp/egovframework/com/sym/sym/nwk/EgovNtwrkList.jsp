<%--
/**
 * @Class Name : EgovNtwrkList.java
 * @Description : EgovNtwrkList jsp
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
<title>네트워크 목록조회</title>

<script type="text/javaScript" language="javascript" defer="defer">
<!--

function fncSelectNtwrkList(pageNo){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sym/sym/nwk/selectNtwrkList.do'/>";
    document.listForm.submit();
}

function fncSelectNtwrk(ntwrkId) {
    document.listForm.ntwrkId.value = ntwrkId;
    document.listForm.action = "<c:url value='/sym/sym/nwk/getNtwrk.do'/>";
    document.listForm.submit();   
}

function fncAddNtwrkInsert() {
    if(document.listForm.pageIndex.value == "") {
        document.listForm.pageIndex.value = 1;
    } 
    document.listForm.action = "<c:url value='/sym/sym/nwk/addViewNtwrk.do'/>";
    document.listForm.submit(); 
}

function linkPage(pageNo){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sym/sym/nwk/selectNtwrkList.do'/>";
    document.listForm.submit();
}

function press() {
    if (event.keyCode==13) {
        fncSelectNtwrkList('1');
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
<form name="listForm" action="<c:url value='/sym/sym/nwk/selectNtwrkList.do'/>" method="post">
<table width="100%" class="table-search" border="0">
 <tr>
  <td width="30%" class="title_left"><h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align:middle;" alt="">&nbsp;네트워크 관리</h1></td>
  <td width="30%"><label for="strManageIem">관리항목 : </label><select name="strManageIem" id="strManageIem">
        <option value="00">전체</option>
        <c:forEach var="cmmCodeDetail" items="${cmmCodeDetailList}" varStatus="status">
          <option value="<c:out value="${cmmCodeDetail.code}"/>" <c:if test="${cmmCodeDetail.code == ntwrkVO.strManageIem}">selected</c:if>><c:out value="${cmmCodeDetail.codeNm}"/></option>
        </c:forEach>
      </select>
  </td>
  <td width="30%"><label for="strUserNm">사용자 명 : </label><input name="strUserNm" id="strUserNm" type="text" value="<c:out value="${ntwrkVO.strUserNm}"/>" size="15" title="검색" onkeypress="press();" ></td>
  <td width="10" align="right">
       <table border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td><span class="button"><input type="submit" value="<spring:message code="button.inquire" />" onclick="fncSelectNtwrkList('1'); return false;"></span></td>
          <td>&nbsp;&nbsp;</td>
          <td><span class="button"><a href="<c:url value='/sym/sym/nwk/addViewNtwrk.do'/>?pageIndex=<c:out value='${ntwrkVO.pageIndex}'/>&amp;searchKeyword=<c:out value="${ntwrkVO.searchKeyword}"/>&amp;searchCondition=1" onclick="fncAddNtwrkInsert(); return false;"><spring:message code="button.create" /></a></span></td>     
        </tr>
       </table>
  </td>  
 </tr>
 <tr>
  <td class="title_left" colspan="2"></td>
 </tr>    
</table>

<input type="hidden" name="ntwrkId">
<input type="hidden" name="pageIndex" value="<c:if test="${empty ntwrkVO.pageIndex }">1</c:if><c:if test="${!empty ntwrkVO.pageIndex }"><c:out value='${ntwrkVO.pageIndex}'/></c:if>">
<input type="hidden" name="searchCondition" value="1">
</form>

<table width="100%" cellpadding="8" class="table-list" summary="네트워크에 대한 목록을 제공한다.">
 <caption>네트워크 목록</caption>
 <thead>
  <tr>
    <th class="title" width="25%" scope="col" nowrap>네트워크ID</th>
    <th class="title" width="20%" scope="col" nowrap>IP</th>
    <th class="title" width="12%" scope="col" nowrap>관리항목</th>
    <th class="title" width="15%" scope="col" nowrap>사용자</th>
    <th class="title" width="9%" scope="col" nowrap>사용여부</th>
    <th class="title" width="19%" scope="col" nowrap>등록일자</th>
  </tr>
 </thead>
 <tbody>
 <c:forEach var="ntwrk" items="${ntwrkList}" varStatus="status">
  <tr>
    <td class="lt_text3" nowrap>
        <form name="item" method="post" action="<c:url value='/sym/sym/nwk/getNtwrk.do'/>">
            <input type="hidden" name="ntwrkId" value="<c:out value="${ntwrk.ntwrkId}"/>">
            <input type="hidden" name="pageIndex" value="<c:out value='${ntwrkVO.pageIndex}'/>">
            <input type="hidden" name="strManageIem" value="<c:out value='${ntwrkVO.strManageIem}'/>">
            <input type="hidden" name="strUserNm" value="<c:out value="${ntwrkVO.strUserNm}"/>">
            <span class="link"><input type="submit" value="<c:out value="${ntwrk.ntwrkId}"/>" onclick="fncSelectNtwrk('<c:out value="${ntwrk.ntwrkId}"/>'); return false;"></span>
        </form>
    </td>
    <td class="lt_text3" nowrap><c:out value="${ntwrk.ntwrkIp}"/></td>
    <td class="lt_text3" nowrap><c:out value="${ntwrk.manageIem}"/></td>
    <td class="lt_text3" nowrap><c:out value="${ntwrk.userNm}"/></td>
    <td class="lt_text3" nowrap><c:out value="${ntwrk.useAt}"/></td>
    <td class="lt_text3" nowrap><c:out value="${ntwrk.regstYmd}"/></td>
  </tr>
 </c:forEach>
 </tbody>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"></td>
  </tr>
</table>

<c:if test="${!empty ntwrkVO.pageIndex }">
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
