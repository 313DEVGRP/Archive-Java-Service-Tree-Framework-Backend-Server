<%--
/**
 * @Class Name  : EgovProxySvcList.java
 * @Description : EgovProxySvcList jsp
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
<title>프록시설정 관리</title>

<script type="text/javaScript" language="javascript" defer="defer">
<!--

function fncSelectProxySvcList(pageNo){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/utl/sys/pxy/selectProxySvcList.do'/>";
    document.listForm.submit();
}

function fncSelectProxySvc(proxyId) {
    document.listForm.proxyId.value = proxyId;
    document.listForm.action = "<c:url value='/utl/sys/pxy/getProxySvc.do'/>";
    document.listForm.submit();
}

function fncAddProxySvcInsert() {
    if(document.listForm.pageIndex.value == "") {
        document.listForm.pageIndex.value = 1;
    }
    document.listForm.action = "<c:url value='/utl/sys/pxy/addViewProxySvc.do'/>";
    document.listForm.submit();
}

function linkPage(pageNo){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/utl/sys/pxy/selectProxySvcList.do'/>";
    document.listForm.submit();
}

function press() {
    if (event.keyCode==13) {
        fncSelectProxySvcList('1');
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

    <form name="listForm" action="<c:url value='/utl/sys/pxy/selectProxySvcList.do'/>" method="post">
    <table width="100%" class="table-search" border="0">
     <tr>
      <td width="170"class="title_left">
       <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" style="vertical-align:middle;" alt="">&nbsp;프록시설정 관리</h1>
      </td>
      <td width="400">프록시명 : <input name="strProxyNm" type="text" value="<c:out value="${proxySvcVO.strProxyNm}"/>" size="30" title="검색" onkeypress="press();" ></td>
      <th width="150" align="right">
           <table border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><span class="button"><input type="submit" value="<spring:message code="button.inquire" />" onclick="fncSelectProxySvcList('1'); return false;"></span></td>
              <td>&nbsp;&nbsp;</td>
              <td><span class="button"><a href="<c:url value='/utl/sys/pxy/addViewProxySvc.do'/>?pageIndex=<c:out value='${proxySvcVO.pageIndex}'/>&amp;strProxyNm=<c:out value="${proxySvcVO.strProxyNm}"/>" onclick="fncAddProxySvcInsert(); return false;"><spring:message code="button.create" /></a></span></td>
              <td>&nbsp;</td>
              <td><span class="button"><a href="<c:url value='/utl/sys/pxy/selectProxyLogList.do'/>">로그</a></span></td>
            </tr>
           </table>
      </th>
     </tr>
     <tr>
      <td class="title_left" colspan="3"></td>
     </tr>
    </table>
    <input type="hidden" name="proxyId">
    <input type="hidden" name="pageIndex" value="<c:if test="${empty proxySvcVO.pageIndex }">1</c:if><c:if test="${!empty proxySvcVO.pageIndex }"><c:out value='${proxySvcVO.pageIndex}'/></c:if>">
    </form>

    <table width="100%" cellpadding="8" class="table-list" summary="프록시설정에 대한 목록을 제공한다.">
     <caption>프록시설정 목록</caption>
     <thead>
      <tr>
        <th class="title" width="25%" scope="col" nowrap>프록시ID</th>
        <th class="title" width="17%" scope="col" nowrap>프록시명</th>
        <th class="title" width="11%" scope="col" nowrap>프록시Port</th>
        <th class="title" width="19%" scope="col" nowrap>대상서비스명</th>
        <th class="title" width="20%" scope="col" nowrap>서비스IP/Port</th>
        <th class="title" width="8%" scope="col" nowrap>상태</th>
      </tr>
     </thead>
     <tbody>
     <c:forEach var="proxySvc" items="${proxySvcList}" varStatus="status">
      <tr>
        <td class="lt_text3" nowrap>
            <form name="item" method="post" action="<c:url value='/utl/sys/pxy/getProxySvc.do'/>">
                <input type="hidden" name="proxyId" value="<c:out value="${proxySvc.proxyId}"/>">
                <input type="hidden" name="pageIndex" value="<c:out value='${proxySvcVO.pageIndex}'/>">
                <input type="hidden" name="strProxyNm" value="<c:out value="${proxySvcVO.strProxyNm}"/>">
                <span class="link"><input type="submit" value="<c:out value="${proxySvc.proxyId}"/>" onclick="fncSelectProxySvc('<c:out value="${proxySvc.proxyId}"/>'); return false;"></span>
            </form>
        </td>
        <td class="lt_text3" nowrap><c:out value="${proxySvc.proxyNm}"/></td>
        <td class="lt_text3" nowrap><c:out value="${proxySvc.proxyPort}"/></td>
        <td class="lt_text3" nowrap><c:out value="${proxySvc.trgetSvcNm}"/></td>
        <td class="lt_text3" nowrap><c:out value="${proxySvc.svcIp}"/>:<c:out value="${proxySvc.svcPort}"/></td>
        <td class="lt_text3" nowrap><c:out value="${proxySvc.svcSttusNm}"/></td>
      </tr>
     </c:forEach>
       <c:if test="${fn:length(proxySvcList) == 0}">
          <tr>
            <td class="lt_text3" nowrap colspan="6"><spring:message code="common.nodata.msg" /></td>
          </tr>
       </c:if>
     </tbody>
    </table>

    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="10"></td>
      </tr>
    </table>

    <c:if test="${!empty proxySvcVO.pageIndex }">
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