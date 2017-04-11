<%--
/**
 * @Class Name  : EgovServerDetail.java
 * @Description : EgovServerDetail jsp
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
<title>서버정보 상세조회</title>

<script type="text/javaScript" language="javascript" defer="defer">
<!--
function fncSelectServerList() {
    var varFrom = document.getElementById("server");
    varFrom.action = "<c:url value='/sym/sym/srv/selectServerList.do'/>";
    varFrom.submit();       
}

function fncServerUpdateView(serverId) {
    var varFrom = document.getElementById("server");
    varFrom.serverId.value = serverId;
    varFrom.action = "<c:url value='/sym/sym/srv/updtViewServer.do'/>";
    varFrom.submit();
}

function fncServerDelete(serverId) {
    var varFrom = document.getElementById("server");

    if(varFrom.serverEqpmnCount.value > 0) {
        alert("서버장비가 등록되어 삭제할 수 없습니다.");
        return;
    }

    varFrom.serverId.value = serverId;
    varFrom.action = "<c:url value='/sym/sym/srv/removeServer.do'/>";
    if(confirm("삭제 하시겠습니까?")){
        varFrom.submit();
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
    <form:form commandName="server" method="post" action="${pageContext.request.contextPath}/sym/sym/srv/updtViewServer.do">
    <table width="100%" class="table-search" border="0">
     <tr>
      <td width="100%" class="title_left"><h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" style="vertical-align:middle;" alt="">&nbsp;서버S/W 상세조회</h1></td>
     </tr>
     <tr>
      <td class="title_left"></td>
     </tr>     
    </table>	
	
	<table width="100%" cellpadding="1" class="table-register" summary="서버S/W를 상세조회 한다.">
	  <caption>서버S/W 상세조회</caption>
	  <tr>
	    <th class="required_text" width="20%" scope="row" nowrap>서버S/W ID<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt=""></th>
	    <td class="lt_text" nowrap><c:out value='${server.serverId}'/></td>
	  </tr>
	  <tr>
	    <th class="required_text" width="20%" scope="row" nowrap>서버S/W 명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt=""></th>
	    <td class="lt_text" nowrap><c:out value='${server.serverNm}'/></td>
	  </tr>
	  <tr>
	    <th class="required_text" width="20%" scope="row" nowrap>서버S/W 종류<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt=""></th>
	    <td class="lt_text" nowrap><c:out value='${server.serverKndNm}'/></td>
	  </tr>
	  <tr>
	    <th class="required_text" width="20%" scope="row" nowrap>등록일자<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt=""></th>
	    <td class="lt_text" nowrap><c:out value="${server.regstYmd}"/></td>
	  </tr>
	</table>
	
	<table width="100%" cellpadding="8">
	  <tr>
	    <td align="center">
		   <table border="0" cellspacing="0" cellpadding="0">
		    <tr> 
		      <td><span class="button"><a href="<c:url value='/sym/sym/srv/updtViewServer.do'/>?serverId=<c:out value='${server.serverId}'/>" onclick="fncServerUpdateView('${server.serverId}'); return false;"><spring:message code="button.update" /></a></span></td>
              <td>&nbsp;&nbsp;</td>
		      <td><span class="button"><a href="<c:url value='/sym/sym/srv/removeServer.do'/>?serverId=<c:out value='${server.serverId}'/>" onclick="fncServerDelete('${server.serverId}'); return false;"><spring:message code="button.delete" /></a></span></td>
		      <td>&nbsp;&nbsp;</td>
		      <td><span class="button"><a href="<c:url value='/sym/sym/srv/selectServerList.do'/>?pageIndex=<c:out value='${serverVO.pageIndex}'/>&amp;strServerNm=<c:out value="${serverVO.strServerNm}"/>" onclick="fncSelectServerList(); return false;"><spring:message code="button.list" /></a></span></td>
		    </tr>
		   </table>  
	   </td>
	  </tr>  
	</table>

	<input type="hidden" name="serverId" />
    <!-- 검색조건 유지 -->
    <input type="hidden" name="strServerNm" value="<c:out value='${serverVO.strServerNm}'/>" />
    <input type="hidden" name="pageIndex" value="<c:out value='${serverVO.pageIndex}'/>" />
    <input type="hidden" name="serverEqpmnCount" value="<c:out value="${serverEqpmnRelateDetailCount}"/>" />
  </form:form>
</td>
</tr>
<tr>
  <td>
  
    <table width="100%" class="table-search" border="0">
     <tr>
      <td width="20" class="title_left"><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="타이틀"></td>
      <td width="680" class="title_left">서버H/W 목록</td>
     </tr>
     <tr>
      <td class="title_left" colspan="2"></td>
     </tr>     
    </table>
  
    <table width="100%" cellpadding="8" class="table-list" summary="서버H/W에 대한 목록을 제공한다.">
     <thead>
      <tr>
        <th class="title" width="15%" nowrap>서버H/W 명</th>
        <th class="title" width="15%" nowrap>서버H/W IP</th>
        <th class="title" width="35%" nowrap>CPU정보</th>
        <th class="title" width="35%" nowrap>메모리정보</th>
      </tr>
      <tr>
        <th class="title" width="15%" nowrap>관리자</th>
        <th class="title" width="15%" nowrap>OS정보</th>
        <th class="title" width="35%" nowrap>하드디스크</th>
        <th class="title" width="35%" nowrap>기타정보</th>
      </tr>
     </thead>
     <tbody>
     <c:forEach var="serverEqpmnRelateDetail" items="${serverEqpmnRelateDetailList}" varStatus="status">
      <tr>
        <td class="lt_text3" nowrap><c:out value="${serverEqpmnRelateDetail.serverEqpmnNm}"/></td>
        <td class="lt_text3" nowrap><c:out value="${serverEqpmnRelateDetail.serverEqpmnIp}"/></td>
        <td class="lt_text3" nowrap><c:out value="${serverEqpmnRelateDetail.cpuInfo}"/></td>
        <td class="lt_text3" nowrap><c:out value="${serverEqpmnRelateDetail.moryInfo}"/></td>
      </tr>
      <tr>
        <td class="lt_text3" nowrap><c:out value="${serverEqpmnRelateDetail.serverEqpmnMngrNm}"/></td>
        <td class="lt_text3" nowrap><c:out value="${serverEqpmnRelateDetail.opersysmInfo}"/></td>
        <td class="lt_text3" nowrap><c:out value="${serverEqpmnRelateDetail.hdDisk}"/></td>
        <td class="lt_text3" nowrap><c:out value="${serverEqpmnRelateDetail.etcInfo}"/></td>
      </tr>
     </c:forEach>
     </tbody>
    </table>

  </td>
</tr>
</table>
</DIV>
</body>
</html>

