<%--
/**
 * @Class Name  : EgovServerEqpmnDetail.java
 * @Description : EgovServerEqpmnDetail jsp
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
<title>서버장비 상세조회</title>

<script type="text/javaScript" language="javascript" defer="defer">
<!--
function fncSelectServerEqpmnList() {
    var varFrom = document.getElementById("serverEqpmn");
    varFrom.action = "<c:url value='/sym/sym/srv/selectServerEqpmnList.do'/>";
    varFrom.submit();       
}

function fncServerEqpmnUpdateView(serverEqpmnId) {
    var varFrom = document.getElementById("serverEqpmn");
    varFrom.serverEqpmnId.value = serverEqpmnId;
    varFrom.action = "<c:url value='/sym/sym/srv/updtViewServerEqpmn.do'/>";
    varFrom.submit();
}

function fncServerEqpmnDelete(serverEqpmnId) {
    var varFrom = document.getElementById("serverEqpmn");
    varFrom.serverEqpmnId.value = serverEqpmnId;
    varFrom.action = "<c:url value='/sym/sym/srv/removeServerEqpmn.do'/>";
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
    <form:form commandName="serverEqpmn" method="post" action="${pageContext.request.contextPath}/sym/sym/srv/updtViewServerEqpmn.do">
    <table width="100%" class="table-search" border="0">
     <tr>
      <td width="100%" class="title_left"><h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" style="vertical-align:middle;"  alt="">&nbsp;서버H/W 상세조회</h1></td>
     </tr>
     <tr>
      <td class="title_left"></td>
     </tr>     
    </table>     

	<table width="100%" cellpadding="1" class="table-register" summary="서버H/W에 대한  상세정보를 제공한다.">
	  <caption>서버H/W 상세조회</caption>
	  <tr>
	    <th class="required_text" width="20%" scope="row" nowrap>서버H/W ID<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt=""></th>
	    <td class="lt_text" nowrap><c:out value='${serverEqpmn.serverEqpmnId}'/></td>
	  </tr>
	  <tr>
	    <th class="required_text" width="20%" scope="row" nowrap>서버H/W 명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt=""></th>
	    <td class="lt_text" nowrap><c:out value='${serverEqpmn.serverEqpmnNm}'/></td>
	  </tr>
	  <tr>
	    <th class="required_text" width="20%" scope="row" nowrap>서버H/W IP<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt=""></th>
	    <td class="lt_text" nowrap><c:out value='${serverEqpmn.serverEqpmnIp}'/></td>
	  </tr>
	  <tr>
	    <th class="required_text" width="20%" scope="row" nowrap>관리자<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt=""></th>
	    <td class="lt_text" nowrap><c:out value='${serverEqpmn.serverEqpmnMngrNm}'/></td>
	  </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>관리자이메일주소<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><c:out value='${serverEqpmn.mngrEmailAddr}'/></td>
      </tr>
	  <tr>
	    <th class="required_text" width="20%" scope="row" nowrap>OS정보<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt=""></th>
	    <td class="lt_text" nowrap><c:out value='${serverEqpmn.opersysmInfo}'/></td>
	  </tr> 
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>CPU정보<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><c:out value='${serverEqpmn.cpuInfo}'/></td>
      </tr>
	  <tr>
	    <th class="required_text" width="20%" scope="row" nowrap>메모리정보<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt=""></th>
	    <td class="lt_text" nowrap><c:out value='${serverEqpmn.moryInfo}'/></td>
	  </tr>    
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>하드디스크<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><c:out value='${serverEqpmn.hdDisk}'/></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>기타정보<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><c:out value='${serverEqpmn.etcInfo}'/></td>
      </tr>      
	  
	  <tr>
	    <th class="required_text" width="20%" scope="row" nowrap>등록일자<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt=""></th>
	    <td class="lt_text" nowrap><c:out value="${serverEqpmn.regstYmd}"/></td>
	  </tr>
	</table>
	
	<table width="100%" cellpadding="8">
	  <tr>
	    <td align="center">
		   <table border="0" cellspacing="0" cellpadding="0">
		    <tr> 
		      <td><span class="button"><a href="<c:url value='/sym/sym/srv/updtViewServerEqpmn.do'/>?serverEqpmnId=<c:out value='${serverEqpmn.serverEqpmnId}'/>" onclick="fncServerEqpmnUpdateView('${serverEqpmn.serverEqpmnId}'); return false;"><spring:message code="button.update" /></a></span></td>
              <td>&nbsp;&nbsp;</td>
		      <td><span class="button"><a href="<c:url value='/sym/sym/srv/removeServerEqpmn.do'/>?serverEqpmnId=<c:out value='${serverEqpmn.serverEqpmnId}'/>" onclick="fncServerEqpmnDelete('${serverEqpmn.serverEqpmnId}'); return false;"><spring:message code="button.delete" /></a></span></td>
		      <td>&nbsp;&nbsp;</td>
		      <td><span class="button"><a href="<c:url value='/sym/sym/srv/selectServerEqpmnList.do'/>?pageIndex=<c:out value='${serverEqpmnVO.pageIndex}'/>&amp;strServerEqpmnNm=<c:out value="${serverEqpmnVO.strServerEqpmnNm}"/>" onclick="fncSelectServerEqpmnList(); return false;"><spring:message code="button.list" /></a></span></td>
		    </tr>
		   </table>  
	   </td>
	  </tr>  
	</table>

	<input type="hidden" name="serverEqpmnId" />
    <!-- 검색조건 유지 -->
    <input type="hidden" name="strServerEqpmnNm" value="<c:out value='${serverEqpmnVO.strServerEqpmnNm}'/>" />
    <input type="hidden" name="pageIndex" value="<c:out value='${serverEqpmnVO.pageIndex}'/>" />
</form:form>
</td>
</tr>
</table>
 
</DIV>
</body>
</html>

