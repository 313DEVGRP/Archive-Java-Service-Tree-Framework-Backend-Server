<%--
/**
 * @Class Name  : EgovProxySvcUpdt.java
 * @Description : EgovProxySvcUpdt jsp
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
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<title>프록시설정정보 수정</title>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="proxySvc" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript" defer="defer">
<!--
function fncSelectProxySvcList() {
    var varFrom = document.getElementById("proxySvc");
    varFrom.action = "<c:url value='/utl/sys/pxy/selectProxySvcList.do'/>";
    varFrom.submit();       
}

function fncProxySvcUpdate() {
    var varFrom = document.getElementById("proxySvc");
    varFrom.action = "<c:url value='/utl/sys/pxy/updtProxySvc.do'/>";

    if(confirm("저장 하시겠습니까?")){
        if(!validateProxySvc(varFrom)){           
            return;
        }else{
            if(!ipValidate(varFrom.proxyIp.value))
                return;
            else if(!ipValidate(varFrom.svcIp.value))
                return;
            else 
                varFrom.submit();
        } 
    }
}

function fncProxySvcDelete() {
    var varFrom = document.getElementById("proxySvc");
    varFrom.action = "<c:url value='/utl/sys/pxy/removeProxySvc.do'/>";
    if(confirm("삭제 하시겠습니까?")){
        varFrom.submit();
    }
}

function ipValidate(ipValue) {
    
    var varFrom = document.getElementById("serverEqpmn");
    var IPvalue = ipValue;

    var ipPattern = /^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})$/;
    var ipArray = IPvalue.match(ipPattern);

    var result = "";
    var thisSegment;

    if(IPvalue == "0.0.0.0") {
        alert(IPvalue + "는 예외 아이피 입니다..");
        result = false;
    } else if (IPvalue == "255.255.255.255") {
        alert(result =IPvalue + "는 예외 아이피 입니다.");
        result = false;
    } else {
        result = true;
    }

    if(ipArray == null) {
        alert("IP 형식이 일치 하지않습니다. ");
        result = false;
    } else {
        for (var i=1; i<5; i++) {
            
            thisSegment = ipArray[i];

            if (thisSegment > 255) {
                alert("IP 형식이 일치 하지않습니다. ");
                result = false;
            }
            
            if ((i == 0) && (thisSegment > 255)) {
                alert("IP 형식이 일치 하지않습니다. ");
                result = false;
            }
        }
    }

    return result;
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
    <form:form commandName="proxySvc" method="post" action="${pageContext.request.contextPath}/utl/sys/pxy/updtProxySvc.do">
    <table width="100%" class="table-search" border="0">
     <tr>
      <td width="100%" class="title_left"><h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" style="vertical-align:middle;" alt="">&nbsp;프록시설정 수정</h1></td>
     </tr>
     <tr>
      <td class="title_left"></td>
     </tr>     
    </table>

    <table width="100%" cellpadding="1" class="table-register" summary="프록시설정 정보를 수정한다.">
      <caption>프록시설정 수정</caption>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>프록시ID<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="svcSttus"><input name="proxyId" id="proxyId" type="text" value="<c:out value='${proxySvc.proxyId}'/>" size="30" class="readOnlyClass" readOnly></label></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>프록시명<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="svcSttus"><input name="proxyNm" id="proxyNm" type="text" value="<c:out value='${proxySvc.proxyNm}'/>" maxLength="60" size="60" >&nbsp;<form:errors path="proxyNm" /></label></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>프록시IP<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="svcSttus"><input name="proxyIp" id="proxyIp" type="text" value="<c:out value='${proxySvc.proxyIp}'/>" maxLength="23" size="23" >&nbsp;<form:errors path="proxyIp" /></label></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>프록시Port<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="svcSttus"><input name="proxyPort" id="proxyPort" type="text" value="<c:out value='${proxySvc.proxyPort}'/>" maxLength="10" size="10" >&nbsp;<form:errors path="proxyPort" /></label></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>대상서비스명<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="svcSttus"><input name="trgetSvcNm" id="trgetSvcNm" type="text" value="<c:out value='${proxySvc.trgetSvcNm}'/>" maxLength="30" size="30" >&nbsp;<form:errors path="trgetSvcNm" /></label></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>서비스설명<img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="svcSttus"><input name="svcDc" id="svcDc" type="text" value="<c:out value='${proxySvc.svcDc}'/>" maxLength="255" size="60" ></label></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>서비스IP<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="svcSttus"><input name="svcIp" id="svcIp" type="text" value="<c:out value='${proxySvc.svcIp}'/>" maxLength="23" size="23" >&nbsp;<form:errors path="svcIp" /></label></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>서비스Port<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="svcSttus"><input name="svcPort" id="svcPort" type="text" value="<c:out value='${proxySvc.svcPort}'/>" maxLength="10" size="10" >&nbsp;<form:errors path="svcPort" /></label></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>서비스상태<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="svcSttus">
          <select name="svcSttus">
              <option value="01" <c:if test="${proxySvc.svcSttus == '01'}">selected</c:if>>정상</option>
              <option value="03" <c:if test="${proxySvc.svcSttus == '03'}">selected</c:if>>중지</option>
          </select>
          <!--  
          <select name="svcSttus">
            <c:forEach var="cmmCodeDetail" items="${cmmCodeDetailList}" varStatus="status">
              <option value="<c:out value="${cmmCodeDetail.code}"/>" <c:if test="${cmmCodeDetail.code == proxySvc.svcSttus}">selected</c:if>><c:out value="${cmmCodeDetail.codeNm}"/></option>
            </c:forEach>
          </select>
          --> 
        </label></td>
      </tr>
    </table> 
    
    <table width="100%" cellpadding="8">
      <tr>
        <td align="center">
           <table border="0" cellspacing="0" cellpadding="0">
            <tr> 
              <td><span class="button"><input type="submit" value="<spring:message code="button.save" />" onclick="fncProxySvcUpdate(); return false;"></span></td>
              <td>&nbsp;&nbsp;</td>
              <!--  
              <td><span class="button"><a href="<c:url value='/utl/sys/pxy/removeProxySvc.do'/>?pageIndex=<c:out value='${proxySvcVO.pageIndex}'/>&amp;proxyId=<c:out value='${proxySvcVO.proxyId}'/>" onclick="fncProxySvcDelete(); return false;"><spring:message code="button.delete" /></a></span></td>
              <td>&nbsp;&nbsp;</td>
              -->
              <td><span class="button"><a href="<c:url value='/utl/sys/pxy/selectProxySvcList.do'/>?pageIndex=<c:out value='${proxySvcVO.pageIndex}'/>&amp;strProxyNm=<c:out value="${proxySvcVO.strProxyNm}"/>" onclick="fncSelectProxySvcList(); return false;"><spring:message code="button.list" /></a></span></td>
            </tr>
           </table>  
       </td>
      </tr>  
    </table>
    <input type="hidden" name="strPreSvcSttus" value="<c:out value='${proxySvc.svcSttus}'/>" />
    <!-- 검색조건 유지 -->
    <input type="hidden" name="strProxyNm" value="<c:out value='${proxySvcVO.strProxyNm}'/>" />
    <input type="hidden" name="pageIndex" value="<c:out value='${proxySvcVO.pageIndex}'/>" >
</form:form>
</td>
</tr>
</table>
 <br>

 
</DIV>
</body>
</html>

