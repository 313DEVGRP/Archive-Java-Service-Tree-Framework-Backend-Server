<%--
/**
 * @Class Name  : EgovProxyLogList.java
 * @Description : EgovProxyLogList jsp
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
<title>프록시로그 정보</title>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />"></script>
<script type="text/javaScript" language="javascript" defer="defer">
<!--
function fncSelectProxyLogList(pageNo){

    var fromDate = document.listForm.strStartDate.value;
    var endDate = document.listForm.strEndDate.value;

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
    document.listForm.action = "<c:url value='/utl/sys/pxy/selectProxyLogList.do'/>";
    document.listForm.submit();
}

function linkPage(pageNo){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/utl/sys/pxy/selectProxyLogList.do'/>";
    document.listForm.submit();
}

function press() {
    if (event.keyCode==13) {
        fncSelectProxyLogList('1');
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

    <form name="listForm" action="<c:url value='/utl/sys/pxy/selectProxyLogList.do'/>" method="post">
    <table width="100%" class="table-search" border="0">
     <tr>
      <td width="170"class="title_left">
       <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" style="vertical-align:middle;" alt="">&nbsp;프록시 로그 정보</h1>
      </td>
      <td width="400"><label for="strStartDate">기간 : </label><!-- <input type="text" name="strStartDate" id="strStartDate" value="<c:out value='${pmProxyLogVO.strStartDate}'/>" size="10" maxlength="10" title="프록시로그 시작일자" class="readOnlyClass" readonly onClick="javascript:fn_egov_NormalCalendar(document.listForm, document.listForm.strProxyDate, document.listForm.strStartDate);" onKeyDown="javascript:if (event.keyCode == 13) { fn_egov_NormalCalendar(document.listForm, document.listForm.strProxyDate, document.listForm.strStartDate); }" > -->
      						<input type="hidden" name="cal_url" id="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" >
                            <input type="text" name="strStartDate" id="strStartDate" value="<c:out value='${pmProxyLogVO.strStartDate}'/>" size="10" maxlength="10" title="프록시로그 시작일자" >
                            <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(document.listForm, document.listForm.strProxyDate, document.listForm.strStartDate);" style="selector-dummy:expression(this.hideFocus=false);"><img src="/images/egovframework/com/sym/cal/bu_icon_carlendar.gif" title="새창" alt="달력창팝업버튼이미지"></a>
                          ~ <!-- <input type="text" name="strEndDate" id="strEndDate" value="<c:out value='${pmProxyLogVO.strEndDate}'/>" size="10" maxlength="10" title="프록시로그 종료일자" class="readOnlyClass" readonly onClick="javascript:fn_egov_NormalCalendar(document.listForm, document.listForm.strProxyDate, document.listForm.strEndDate);" onKeyDown="javascript:if (event.keyCode == 13) { fn_egov_NormalCalendar(document.listForm, document.listForm.strProxyDate, document.listForm.strEndDate); }" > -->
                            <input type="text" name="strEndDate" id="strEndDate" value="<c:out value='${pmProxyLogVO.strEndDate}'/>" size="10" maxlength="10" title="프록시로그 종료일자" >
                            <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(document.listForm, document.listForm.strProxyDate, document.listForm.strEndDate);" style="selector-dummy:expression(this.hideFocus=false);"><img src="/images/egovframework/com/sym/cal/bu_icon_carlendar.gif" title="새창" alt="달력창팝업버튼이미지"></a>
      <input type="hidden" name="strProxyDate" value=""/>
      </td>
      <td width="150" align="right">
           <table border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><span class="button"><input type="submit" value="<spring:message code="button.inquire" />" onclick="fncSelectProxyLogList('1'); return false;"></span></td>
              <td>&nbsp;</td>
              <td><span class="button"><a href="<c:url value='/utl/sys/pxy/selectProxySvcList.do'/>">목록</a></span></td>
            </tr>
           </table>
      </td>
     </tr>
     <tr>
      <td class="title_left" colspan="3"></td>
     </tr>
    </table>
    <input type="hidden" name="pageIndex" value="<c:if test="${empty proxyLogVO.pageIndex }">1</c:if><c:if test="${!empty proxyLogVO.pageIndex }"><c:out value='${proxyLogVO.pageIndex}'/></c:if>">
    </form>

    <table width="100%" cellpadding="8" class="table-list" summary="프록시로그에 대한 목록을 제공한다.">
     <caption>프록시로그 목록</caption>
     <thead>
      <tr>
        <th class="title" width="20%" scope="col" nowrap>프록시ID</th>
        <th class="title" width="25%" scope="col" nowrap>대상서비스</th>
        <th class="title" width="15%" scope="col" nowrap>프록시Port</th>
        <th class="title" width="20%" scope="col" nowrap>클라이언트IP</th>
        <th class="title" width="20%" scope="col" nowrap>접속일시</th>
      </tr>
     </thead>
     <tbody>
     <c:forEach var="proxyLog" items="${proxyLogList}" varStatus="status">
      <tr>
        <td class="lt_text3" nowrap><c:out value="${proxyLog.proxyId}"/></td>
        <td class="lt_text3" nowrap><c:out value="${proxyLog.proxyNm}"/></td>
        <td class="lt_text3" nowrap><c:out value="${proxyLog.clntPort}"/></td>
        <td class="lt_text3" nowrap><c:out value="${proxyLog.clntIp}"/></td>
        <td class="lt_text3" nowrap><c:out value="${proxyLog.conectTime}"/></td>
      </tr>
     </c:forEach>
     </tbody>
    </table>

    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="10"></td>
      </tr>
    </table>

    <c:if test="${!empty proxyLogVO.pageIndex }">
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