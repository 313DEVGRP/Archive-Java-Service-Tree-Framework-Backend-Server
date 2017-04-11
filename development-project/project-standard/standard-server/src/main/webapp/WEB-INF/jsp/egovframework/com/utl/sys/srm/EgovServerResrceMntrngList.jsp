<%--
/**
 * @Class Name  : EgovServerResrceMntrngList.java
 * @Description : EgovServerResrceMntrngList jsp
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

function fncSelectServerResrceMntrngList(pageNo) {

    var fromDate = document.listForm.strStartDt.value;
    var endDate = document.listForm.strEndDt.value;

    // var tmpFromDate = fromDate.substring(0,4)+fromDate.substring(5,7)+fromDate.substring(8,10);
    // var tmpEndDate = endDate.substring(0,4)+endDate.substring(5,7)+endDate.substring(8,10);

    var tmpFromDate = fromDate.split("-");
    var tmpEndDate = endDate.split("-");

    var strTmpFromDate = "";
    var strTmpEndDate = "";

    for(var i=0;i<tmpFromDate.length;i++) {
    	strTmpFromDate = strTmpFromDate + tmpFromDate[i];
    }

    for(var j=0;j<tmpEndDate.length;j++) {
    	strTmpEndDate = strTmpEndDate + tmpEndDate[j];
    }

    if(strTmpFromDate.length != 8 || strTmpEndDate.length != 8 || !checknum(strTmpFromDate) || !checknum(strTmpEndDate)) {
        alert("날짜 형식이 잘못되었습니다");
        return;
    } else {
        if(strTmpFromDate > strTmpEndDate) {
            alert("시작일자는 종료일자보다 클 수 없습니다");
            return;
        }
    }

    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/utl/sys/srm/selectServerResrceMntrngList.do'/>";
    document.listForm.submit();
}

function fncSelectServerResrceMntrng(logId) {
    document.listForm.logId.value = logId;
    document.listForm.action = "<c:url value='/utl/sys/srm/getServerResrceMntrng.do'/>";
    document.listForm.submit();
}

function linkPage(pageNo){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/utl/sys/srm/selectServerResrceMntrngList.do'/>";
    document.listForm.submit();
}

function press() {
    if (event.keyCode==13) {
        fncSelectServerResrceMntrngList('1');
    }
}

function checknum(number) {

    var rtnMsg = true;
	var pattern = /^[0-9]+$/;

	if(!pattern.test(number)) {
        rtnMsg = false;
    }

    return rtnMsg;
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

<form name="listForm" action="<c:url value='/utl/sys/srm/selectServerResrceMntrngList.do'/>" method="post">
<table width="100%" class="table-search" border="0">
 <tr>
  <td width="210"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" style="vertical-align:middle;" alt="">&nbsp;서버자원모니터링  로그목록</h1>
  </td>
  <td width="440"><label for="strServerNm">서버H/W 명 : </label><input name="strServerNm" id="strServerNm" type="text" value="<c:out value="${serverResrceMntrngVO.strServerNm}"/>" size="8" title="검색" onkeypress="press();" >
                  <label for="strStartDt">기간 : </label><input type="text" name="strStartDt" id="strStartDt" value="<c:out value='${pmServerResrceMntrng.strStartDt}'/>" size="10" maxlength="10" title="서버자원 모니터링 시작일자" >
                  		<input type="hidden" name="cal_url" id="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" >
                        <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(document.listForm, document.listForm.strServerResrceMntrngDate, document.listForm.strStartDt);" style="selector-dummy:expression(this.hideFocus=false);"><img src="/images/egovframework/com/sym/cal/bu_icon_carlendar.gif" title="새창" alt="달력창팝업버튼이미지"></a>
                        ~ <input type="text" name="strEndDt" id="strEndDt" value="<c:out value='${pmServerResrceMntrng.strEndDt}'/>" size="10" maxlength="10" title="서버자원 모니터링 종료일자" >
                          <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(document.listForm, document.listForm.strServerResrceMntrngDate, document.listForm.strEndDt);" style="selector-dummy:expression(this.hideFocus=false);"><img src="/images/egovframework/com/sym/cal/bu_icon_carlendar.gif" title="새창" alt="달력창팝업버튼이미지"></a>
  <input type="hidden" name="strServerResrceMntrngDate" value=""/>
  </td>
  <td width="50" align="right">
       <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><span class="button"><input type="submit" value="<spring:message code="button.inquire" />" onclick="fncSelectServerResrceMntrngList('1'); return false;"></span></td>
          <td>&nbsp;</td>
          <td><span class="button"><a href="<c:url value='/utl/sys/srm/selectMntrngServerList.do'/>">목록</a></span></td>
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
<table width="100%" cellpadding="8" class="table-list" summary="서버자원모니터링 결과정보에 대한 목록을 제공한다.">
 <caption>서버자원모니터링 목록</caption>
 <thead>
  <tr>
    <!--
    <th class="title" width="20%" nowrap>로그ID</th>
    -->
    <th class="title" width="20%" scope="col" nowrap>서버H/W 명</th>
    <th class="title" width="15%" scope="col" nowrap>서버H/W IP</th>
    <th class="title" width="15%" scope="col" nowrap>CPU사용률</th>
    <th class="title" width="15%" scope="col" nowrap>메모리사용률</th>
    <th class="title" width="15%" scope="col" nowrap>서비스상태</th>
    <th class="title" width="20%" scope="col" nowrap>생성일시</th>
  </tr>
 </thead>
 <tbody>
 <c:forEach var="serverResrceMntrng" items="${serverResrceMntrngList}" varStatus="status">
  <tr>
     <td class="lt_text3" nowrap>
        <form name="item" method="post" action="<c:url value='/utl/sys/srm/getServerResrceMntrng.do'/>">
            <input type="hidden" name="logId" value="<c:out value="${serverResrceMntrng.logId}"/>">
            <input type="hidden" name="pageIndex" value="<c:out value='${serverResrceMntrngVO.pageIndex}'/>">
            <input type="hidden" name="strServerNm" value="<c:out value="${serverResrceMntrngVO.strServerNm}"/>">
            <span class="link"><input type="submit" value="<c:out value="${serverResrceMntrng.serverNm}"/>" onclick="fncSelectServerResrceMntrng('<c:out value="${serverResrceMntrng.logId}"/>'); return false;"></span>
        </form>
    </td>
    <td class="lt_text3" nowrap><c:out value="${serverResrceMntrng.serverEqpmnIp}"/></td>
    <td class="lt_text3" nowrap><c:out value="${serverResrceMntrng.cpuUseRt}"/><c:if test="${serverResrceMntrng.cpuUseRt != null}">%</c:if></td>
    <td class="lt_text3" nowrap><c:out value="${serverResrceMntrng.moryUseRt}"/><c:if test="${serverResrceMntrng.cpuUseRt != null}">%</c:if></td>
    <td class="lt_text3" nowrap><c:out value="${serverResrceMntrng.svcSttusNm}"/></td>
    <td class="lt_text3" nowrap><c:out value="${serverResrceMntrng.creatDt}"/></td>
  </tr>
 </c:forEach>
 </tbody>
</table>
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