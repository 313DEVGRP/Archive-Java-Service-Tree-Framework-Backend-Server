<%--
/**
 * @Class Name  : EgovServerResrceMntrngDetail.java
 * @Description : EgovServerResrceMntrngDetail jsp
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
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css" />
<title>서버자원모니터링 상세조회</title>

<script type="text/javaScript" language="javascript" defer="defer">
<!--
function fncSelectServerResrceMntrngList() {
    var varFrom = document.getElementById("proxySvc");
    varFrom.action = "<c:url value='/utl/sys/srm/selectServerResrceMntrngList.do'/>";
    varFrom.submit();
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
    <form:form commandName="serverResrceMntrng" method="post" action="${pageContext.request.contextPath}/utl/sys/srm/selectServerResrceMntrngList.do">
    <table width="100%" class="table-search" border="0">
     <tr>
      <td width="100%" class="title_left"><h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" style="vertical-align:middle;" alt="">&nbsp;서버자원모니터링 상세조회</h1></td>
     </tr>															 
     <tr>
      <td class="title_left"></td>
     </tr>
    </table>

    <table width="100%" cellpadding="1" class="table-register" summary="서버자원모니터링 결과의 상세정보를 조회한다.">
      <caption>서버자원모니터링 상세조회</caption>
      <tr>
        <th class="required_text" width="20%" scope="row">로그ID<img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt="" /></th>
        <td class="lt_text"><c:out value='${serverResrceMntrng.logId}'/></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row">서버H/W 명<img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt="" /></th>
        <td class="lt_text"><c:out value='${serverResrceMntrng.serverNm}'/></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row">서버H/W IP<img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt="" /></th>
        <td class="lt_text"><c:out value='${serverResrceMntrng.serverEqpmnIp}'/></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row">CPU사용률<img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt="" /></th>
        <td class="lt_text"><c:out value='${serverResrceMntrng.cpuUseRt}'/></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row">메모리사용률<img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt="" /></th>
        <td class="lt_text"><c:out value='${serverResrceMntrng.moryUseRt}'/></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row">서비스상태<img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt="" /></th>
        <td class="lt_text"><c:out value='${serverResrceMntrng.svcSttusNm}'/></td>
      </tr>
      <c:if test="${serverResrceMntrng.svcSttus == '02' }">
      <tr>
        <th class="required_text" width="20%" scope="row">로그정보<img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt="" /></th>
        <td class="lt_text"><textarea rows="5" cols="80" readOnly><c:out value='${serverResrceMntrng.logInfo}'/></textarea></td>
      </tr>
      </c:if>
      <tr>
        <th class="required_text" width="20%" scope="row">생성일시<img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt="" /></th>
        <td class="lt_text"><c:out value='${serverResrceMntrng.creatDt}'/></td>
      </tr>
    </table>

    <table width="100%" cellpadding="8">
      <tr>
        <td align="center">
           <table border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><span class="button"><input type="submit" value="<spring:message code="button.list" />" onclick="fncSelectServerResrceMntrngList(); return false;"></span></td>
            </tr>
           </table>
       </td>
      </tr>
    </table>

    <input type="hidden" name="logId" value="<c:out value='${serverResrceMntrng.logId}'/>" />
    <!-- 검색조건 유지 -->
    <input type="hidden" name="strServerNm" value="<c:out value='${serverResrceMntrngVO.strServerNm}'/>" />
    <input type="hidden" name="pageIndex" value="<c:out value='${serverResrceMntrngVO.pageIndex}'/>" />
    <input type="hidden" name="strStartDt" value="<c:out value='${pmServerResrceMntrng.strStartDt}'/>" />
    <input type="hidden" name="strEndDt" value="<c:out value='${pmServerResrceMntrng.strEndDt}'/>" />
  </form:form>
</td>
</tr>
</table>
</DIV>
</body>
</html>

