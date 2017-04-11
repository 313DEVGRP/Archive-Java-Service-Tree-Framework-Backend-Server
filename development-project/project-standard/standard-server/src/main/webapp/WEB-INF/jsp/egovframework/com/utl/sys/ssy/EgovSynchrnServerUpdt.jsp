<%--
/**
 * @Class Name  : EgovSynchrnServerUpdt.java
 * @Description : EgovSynchrnServerUpdt jsp
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
<title>동기화대상 서버정보 수정</title>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="synchrnServer" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript" defer="defer">
<!--
function fncSelectSynchrnServerList() {
    var varFrom = document.getElementById("synchrnServer");
    varFrom.action = "<c:url value='/utl/sys/ssy/selectSynchrnServerList.do'/>";
    varFrom.submit();       
}

function fncSynchrnServerUpdate() {
    var varFrom = document.getElementById("synchrnServer");
    varFrom.action = "<c:url value='/utl/sys/ssy/updtSynchrnServer.do'/>";

    if(confirm("저장 하시겠습니까?")){
        if(!validateSynchrnServer(varFrom)){           
            return;
        }else{
            if(!ipValidate(varFrom.serverIp.value))
                return;
            else 
                varFrom.submit();
        } 
    }
}

function fncSynchrnServerDelete() {
    var varFrom = document.getElementById("synchrnServer");
    varFrom.action = "<c:url value='/utl/sys/ssy/removeSynchrnServer.do'/>";
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
    <form:form commandName="synchrnServer" method="post" action="${pageContext.request.contextPath}/utl/sys/ssy/updtSynchrnServer.do">
    <table width="100%" class="table-search" border="0">
     <tr>
      <td width="100%" class="title_left"><h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" style="vertical-align:middle;" alt="">&nbsp;동기화대상 서버정보 수정</h1></td>
    </tr>
     <tr>
      <td class="title_left"></td>
     </tr>     
    </table>    
    
    <table width="100%" cellpadding="1" class="table-register" summary="동기화대상 서버정보를 수정한다.">
      <caption>동기화대상 서버정보 수정</caption>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>서버ID<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="serverId"><input name="serverId" id="serverId" type="text" value="<c:out value='${synchrnServer.serverId}'/>" size="30" class="readOnlyClass" readonly></label></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>서버명<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="serverNm"><input name="serverNm" id="serverNm" type="text" value="<c:out value='${synchrnServer.serverNm}'/>" maxLength="30" size="30" >&nbsp;<form:errors path="serverNm" /></label></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>서버 IP<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="serverIp"><input name="serverIp" id="serverIp" type="text" value="<c:out value='${synchrnServer.serverIp}'/>" maxLength="30" size="30" >&nbsp;<form:errors path="serverIp" /></label></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>서버 Port<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="serverPort"><input name="serverPort" id="serverPort" type="text" value="<c:out value='${synchrnServer.serverPort}'/>" maxLength="30" size="30" >&nbsp;<form:errors path="serverPort" /></label></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>FTP ID<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="ftpId"><input name="ftpId" id="ftpId" type="text" value="<c:out value='${synchrnServer.ftpId}'/>" maxLength="30" size="30" >&nbsp;<form:errors path="ftpId" /></label></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>FTP 비밀번호<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="ftpPassword"><input name="ftpPassword" id="ftpPassword" type="text" value="<c:out value='${synchrnServer.ftpPassword}'/>" maxLength="30" size="30" >&nbsp;<form:errors path="ftpPassword" /></label></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>동기화 위치<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><label for="synchrnLc"><input name="synchrnLc" id="synchrnLc" type="text" value="<c:out value='${synchrnServer.synchrnLc}'/>" maxLength="30" size="30" >&nbsp;<form:errors path="synchrnLc" /></label></td>
      </tr>
    </table> 
    
    <table width="100%" cellpadding="8">
      <tr>
        <td align="center">
           <table border="0" cellspacing="0" cellpadding="0">
            <tr> 
              <td><span class="button"><input type="submit" value="<spring:message code="button.save" />" onclick="fncSynchrnServerUpdate(); return false;"></span></td>
              <td>&nbsp;&nbsp;</td>
              <!--  
              <td><span class="button"><a href="<c:url value='/utl/sys/ssy/removeSynchrnServer.do'/>?serverId=<c:out value='${synchrnServerVO.serverId}'/>" onclick="fncSynchrnServerDelete(); return false;"><spring:message code="button.delete" /></a></span></td>
              <td>&nbsp;&nbsp;</td>
              -->
              <td><span class="button"><a href="<c:url value='/utl/sys/ssy/selectSynchrnServerList.do'/>?pageIndex=<c:out value='${synchrnServerVO.pageIndex}'/>&amp;strSynchrnServerNm=<c:out value="${synchrnServerVO.strSynchrnServerNm}"/>" onclick="fncSelectSynchrnServerList(); return false;"><spring:message code="button.list" /></a></span></td>
            </tr>
           </table>  
       </td>
      </tr>  
    </table>
    
    <!-- 검색조건 유지 -->
    <input type="hidden" name="strServerNm" value="<c:out value='${synchrnServerVO.strSynchrnServerNm}'/>" />
    <input type="hidden" name="pageIndex" value="<c:out value='${synchrnServerVO.pageIndex}'/>" >
</form:form>
</td>
</tr>
</table>
 
</DIV>
</body>
</html>

