<%--
/**
 * @Class Name  : EgovIntnetSvcGuidanceView.jsp
 * @Description : EgovIntnetSvcGuidanceView.jsp
 * @Modification Information
 * @
 * @  수정일         수정자          수정내용
 * @ -------    --------    ---------------------------
 * @ 2009.02.01    lee.m.j          최초 생성
 *
 *  @author lee.m.j
 *  @since 2009.03.11
 *  @version 1.0
 *  @see
 *  
 *  Copyright (C) 2009 by MOPAS  All right reserved.
 */
 --%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<title>인터넷서비스안내 </title>
</head>

  <body>
  <noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
  
  <table width="700" border="1" class="table-list">
    <c:forEach var="intnetSvcGuidance" items="${intnetSvcGuidanceList}" varStatus="status">
    <tr>
        <th><c:out value="${intnetSvcGuidance.intnetSvcNm}"/></th>
    </tr>
    <tr>
        <td>${intnetSvcGuidance.intnetSvcDc}</td>
    </tr> 
    </c:forEach>
  </table>
</body>
</html>
 <!-- 
    <c:forEach var="intnetSvcGuidance" items="${intnetSvcGuidanceList}" varStatus="status">
        <p><c:out value="${intnetSvcGuidance.intnetSvcNm}"/></p>
        <p><c:out value="${intnetSvcGuidance.intnetSvcDc}"/></p>
    </c:forEach>
 -->    
