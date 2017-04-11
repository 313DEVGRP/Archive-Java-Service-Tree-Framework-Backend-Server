<%--
/**
 * @Class Name  : EgovNtwrkDetail.java
 * @Description : EgovNtwrkDetail jsp
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
<title>네트워크 상세조회</title>

<script type="text/javaScript" language="javascript" defer="defer">
<!--
function fncSelectNtwrkList() {
    var varFrom = document.getElementById("ntwrk");
    varFrom.action = "<c:url value='/sym/sym/nwk/selectNtwrkList.do'/>";
    varFrom.submit();       
}

function fncNtwrkUpdateView(ntwrkId) {
    var varFrom = document.getElementById("ntwrk");
    varFrom.ntwrkId.value = ntwrkId;
    varFrom.action = "<c:url value='/sym/sym/nwk/updtViewNtwrk.do'/>";
    varFrom.submit();
}

function fncNtwrkDelete(ntwrkId) {
    var varFrom = document.getElementById("ntwrk");
    varFrom.ntwrkId.value = ntwrkId;
    varFrom.action = "<c:url value='/sym/sym/nwk/removeNtwrk.do'/>";
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
    <form:form commandName="ntwrk" method="post" action="${pageContext.request.contextPath}/sym/sym/nwk/updtViewNtwrk.do">
    <table width="100%" class="table-search" border="0">
     <tr>
      <td width="100%" class="title_left"><h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" style="vertical-align:middle;" alt="">&nbsp;네트워크 상세조회</h1></td>
     </tr>
     <tr>
      <td class="title_left"></td>
     </tr>     
    </table>	
	
	<table width="100%" cellpadding="1" class="table-register" summary="네트워크 상세정보를 제공한다.">
	  <caption>네트워크 상세조회</caption>
	  <tr>
	    <th class="required_text" width="20%" scope="row" nowrap>네트워크ID<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt=""></th>
	    <td class="lt_text" nowrap><c:out value='${ntwrk.ntwrkId}'/></td>
	  </tr>
	  <tr>
	    <th class="required_text" width="20%" scope="row" nowrap>IP<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt=""></th>
	    <td class="lt_text" nowrap><c:out value='${ntwrk.ntwrkIp}'/></td>
	  </tr>
	  <tr>
	    <th class="required_text" width="20%" scope="row" nowrap>게이트웨이<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt=""></th>
	    <td class="lt_text" nowrap><c:out value='${ntwrk.gtwy}'/></td>
	  </tr>
	  <tr>
	    <th class="required_text" width="20%" scope="row" nowrap>서브넷<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt=""></th>
	    <td class="lt_text" nowrap><c:out value='${ntwrk.subnet}'/></td>
	  </tr>
	  <tr>
	    <th class="required_text" width="20%" scope="row" nowrap>DNS<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt=""></th>
	    <td class="lt_text" nowrap><c:out value='${ntwrk.domnServer}'/></td>
	  </tr> 
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>관리항목<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><c:out value='${ntwrk.manageIem}'/></td>
      </tr> 	  
	  <tr>
	    <th class="required_text" width="20%" scope="row" nowrap>사용자명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt=""></th>
	    <td class="lt_text" nowrap><c:out value='${ntwrk.userNm}'/></td>
	  </tr>    
	  <tr>
	    <th class="required_text" width="20%" scope="row" nowrap>사용여부<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt=""></th>
	    <td class="lt_text" nowrap><c:out value='${ntwrk.useAt}'/></td> 
	  </tr>  
	  <tr>
	    <th class="required_text" width="20%" scope="row" nowrap>등록일자<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt=""></th>
	    <td class="lt_text" nowrap><c:out value="${ntwrk.regstYmd}"/></td>
	  </tr>
	</table>
	
	<table width="100%" cellpadding="8">
	  <tr>
	    <td align="center">
		   <table border="0" cellspacing="0" cellpadding="0">
		    <tr> 
		      <!--
		      <td><span class="button"><input type="submit" value="<spring:message code="button.update" />" onclick="fncNtwrkUpdate(); return false;"></span></td>
		      -->
		      
		      <td><span class="button"><a href="<c:url value='/sym/sym/nwk/updtViewNtwrk.do'/>?ntwrkId=<c:out value='${ntwrk.ntwrkId}'/>" onclick="fncNtwrkUpdateView('${ntwrk.ntwrkId}'); return false;"><spring:message code="button.update" /></a></span></td>
              <td>&nbsp;&nbsp;</td>
		      <td><span class="button"><a href="<c:url value='/sym/sym/nwk/removeNtwrk.do'/>?ntwrkId=<c:out value='${ntwrk.ntwrkId}'/>" onclick="fncNtwrkDelete('${ntwrk.ntwrkId}'); return false;"><spring:message code="button.delete" /></a></span></td>
		      <td>&nbsp;&nbsp;</td>
		      <td><span class="button"><a href="<c:url value='/sym/sym/nwk/selectNtwrkList.do'/>?pageIndex=<c:out value='${ntwrkVO.pageIndex}'/>&amp;searchKeyword=<c:out value="${ntwrkVO.searchKeyword}"/>&amp;searchCondition=1" onclick="fncSelectNtwrkList(); return false;"><spring:message code="button.list" /></a></span></td>
		    </tr>
		   </table>  
	   </td>
	  </tr>  
	</table>

	<input type="hidden" name="ntwrkId" />
    <!-- 검색조건 유지 -->
    <input type="hidden" name="strManageIem" value="<c:out value='${ntwrkVO.strManageIem}'/>" />
    <input type="hidden" name="strUserNm" value="<c:out value='${ntwrkVO.strUserNm}'/>" />
    <input type="hidden" name="pageIndex" value="<c:out value='${ntwrkVO.pageIndex}'/>" />
</form:form>
</td>
</tr>
</table>
 
</DIV>
</body>
</html>

