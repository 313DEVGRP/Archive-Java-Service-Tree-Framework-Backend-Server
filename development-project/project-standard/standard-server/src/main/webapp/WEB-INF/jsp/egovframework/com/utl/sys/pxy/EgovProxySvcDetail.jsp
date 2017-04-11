<%--
/**
 * @Class Name  : EgovProxySvcDetail.java
 * @Description : EgovProxySvcDetail jsp
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
<title>프록시설정정보 상세조회</title>

<script type="text/javaScript" language="javascript" defer="defer">
<!--
function fncSelectProxySvcList() {
    var varFrom = document.getElementById("proxySvc");
    varFrom.action = "<c:url value='/utl/sys/pxy/selectProxySvcList.do'/>";
    varFrom.submit();       
}

function fncProxySvcUpdateView(proxyId) {
    var varFrom = document.getElementById("proxySvc");
    varFrom.proxyId.value = proxyId;
    varFrom.action = "<c:url value='/utl/sys/pxy/updtViewProxySvc.do'/>";
    varFrom.submit();
}

function fncProxySvcDelete(proxyId) {
    var varFrom = document.getElementById("proxySvc");
    varFrom.proxyId.value = proxyId;
    varFrom.action = "<c:url value='/utl/sys/pxy/removeProxySvc.do'/>";
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
    <form:form commandName="proxySvc" method="post" action="${pageContext.request.contextPath}/utl/sys/pxy/removeProxySvc.do">
    <table width="100%" class="table-search" border="0">
     <tr>
      <td width="100%" class="title_left"><h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" style="vertical-align:middle;" alt="">&nbsp;프록시설정 상세조회</h1></td>
     </tr>
     <tr>
      <td class="title_left"></td>
     </tr>     
    </table>

    <table width="100%" cellpadding="1" class="table-register" summary="프록시설정에 대한 상세정보를 제공한다.">
      <caption>프록시설정 상세조회</caption>
      <tr>
        <th class="required_text" width="20%" scope="row">프록시ID<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt="" /></th>
        <td class="lt_text"><c:out value='${proxySvc.proxyId}'/></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row">프록시명<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt="" /></th>
        <td class="lt_text"><c:out value='${proxySvc.proxyNm}'/></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row">프록시IP<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt="" /></th>
        <td class="lt_text"><c:out value='${proxySvc.proxyIp}'/></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row">프록시Port<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt="" /></th>
        <td class="lt_text"><c:out value='${proxySvc.proxyPort}'/></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row">대상서비스명<img src="/images/egovframework/com/utl/sys/ssy/icon/required.gif" width="15" height="15" alt="" /></th>
        <td class="lt_text"><c:out value='${proxySvc.trgetSvcNm}'/></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row">서비스설명<img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt="" /></th>
        <td class="lt_text"><c:out value='${proxySvc.svcDc}'/></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row">서비스IP<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt="" /></th>
        <td class="lt_text"><c:out value='${proxySvc.svcIp}'/></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row">서비스Port<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt="" /></th>
        <td class="lt_text"><c:out value='${proxySvc.svcPort}'/></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row">서비스상태<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt="" /></th>
        <td class="lt_text"><c:out value='${proxySvc.svcSttusNm}'/></td>
      </tr>
    </table>
    
    <table width="100%" cellpadding="8">
      <tr>
        <td align="center">
           <table border="0" cellspacing="0" cellpadding="0">
            <tr> 
              <td><span class="button"><a href="<c:url value='/utl/sys/pxy/updtViewProxySvc.do'/>?proxyId=<c:out value='${proxySvc.proxyId}'/>" onclick="fncProxySvcUpdateView('${proxySvc.proxyId}'); return false;"><spring:message code="button.update" /></a></span></td>
              <td>&nbsp;&nbsp;</td>
              <td><span class="button"><input type="submit" value="<spring:message code="button.delete" />" onclick="fncProxySvcDelete('${proxySvc.proxyId}'); return false;"></span></td>
              <td>&nbsp;&nbsp;</td>
              <td><span class="button"><a href="<c:url value='/utl/sys/pxy/selectProxySvcList.do'/>?pageIndex=<c:out value='${proxySvcVO.pageIndex}'/>&amp;strProxyNm=<c:out value="${proxySvcVO.strProxyNm}"/>" onclick="fncSelectProxySvcList(); return false;"><spring:message code="button.list" /></a></span></td>
            </tr>
           </table>  
       </td>
      </tr>  
    </table>

    <input type="hidden" name="proxyId" value="<c:out value='${proxySvc.proxyId}'/>" />
    <!-- 검색조건 유지 -->
    <input type="hidden" name="strProxyNm" value="<c:out value='${proxySvcVO.strProxyNm}'/>" />
    <input type="hidden" name="pageIndex" value="<c:out value='${proxySvcVO.pageIndex}'/>" />
  </form:form>
</td>
</tr>
</table>
</DIV>
</body>
</html>

