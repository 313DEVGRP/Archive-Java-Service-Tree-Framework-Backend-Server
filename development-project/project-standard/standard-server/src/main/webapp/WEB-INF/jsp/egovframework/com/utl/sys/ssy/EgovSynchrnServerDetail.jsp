<%--
/**
 * @Class Name  : EgovSynchrnServerDetail.java
 * @Description : EgovSynchrnServerDetail jsp
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
<title>동기화대상 서버정보 상세조회</title>

<script type="text/javaScript" language="javascript" defer="defer">
<!--
function fncSelectSynchrnServerList() {
    var varFrom = document.getElementById("synchrnServer");
    varFrom.action = "<c:url value='/utl/sys/ssy/selectSynchrnServerList.do'/>";
    varFrom.submit();       
}

function fncSynchrnServerUpdateView(serverId) {
    var varFrom = document.getElementById("synchrnServer");
    varFrom.serverId.value = serverId;
    varFrom.action = "<c:url value='/utl/sys/ssy/updtViewSynchrnServer.do'/>";
    varFrom.submit();
}

function fncSynchrnServerDelete(serverId) {
    var varFrom = document.getElementById("synchrnServer");
    varFrom.serverId.value = serverId;
    varFrom.action = "<c:url value='/utl/sys/ssy/removeSynchrnServer.do'/>";
    if(confirm("삭제 하시겠습니까?")){
        varFrom.submit();
    }
}

function fncRemoveSynchrnServerFile(fileNm) {
    var varFrom = document.getElementById("fileList");
    varFrom.fileNm.value = fileNm;
    varFrom.action = "<c:url value='/utl/sys/ssy/removeSynchrnServerFile.do'/>";
    if(confirm("삭제 하시겠습니까?")){
        varFrom.submit();
    }
}

function fncDownSynchrnServerFile(fileNm) {
    var varFrom = document.getElementById("fileList");
    varFrom.fileNm.value = fileNm;
    varFrom.action = "<c:url value='/utl/sys/ssy/getSynchrnServerFile.do'/>";
    if(confirm("다운로드 하시겠습니까?")){
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
    <form:form commandName="synchrnServer" method="post" action="${pageContext.request.contextPath}/utl/sys/ssy/updtViewSynchrnServer.do">
    <table width="100%" class="table-search" border="0">
     <tr>
      <td width="100%" class="title_left"><h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" style="vertical-align:middle;" alt="">&nbsp;동기화대상 서버정보 상세조회</h1></td>
     </tr>
     <tr>
      <td class="title_left" ></td>
     </tr>     
    </table>
    
    <table width="100%" cellpadding="1" class="table-register" summary="동기화대상 서버에 대해 상세정보를 조회한다.">
      <caption>동기화대상 서버 상세조회</caption>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>서버ID<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><c:out value='${synchrnServer.serverId}'/></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>서버명<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><c:out value='${synchrnServer.serverNm}'/></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>서버 IP<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><c:out value='${synchrnServer.serverIp}'/></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>서버 Port<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><c:out value='${synchrnServer.serverPort}'/></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>FTP ID<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><c:out value='${synchrnServer.ftpId}'/></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>FTP 비밀번호<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><c:out value='${synchrnServer.ftpPassword}'/></td>
      </tr>
      <tr>
        <th class="required_text" width="20%" scope="row" nowrap>동기화 위치<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
        <td class="lt_text" nowrap><c:out value='${synchrnServer.synchrnLc}'/></td>
      </tr>
    </table>
    
    <table width="100%" cellpadding="8">
      <tr>
        <td align="center">
           <table border="0" cellspacing="0" cellpadding="0">
            <tr> 
              <td><span class="button"><a href="<c:url value='/utl/sys/ssy/updtViewSynchrnServer.do'/>?serverId=<c:out value='${synchrnServer.serverId}'/>" onclick="fncSynchrnServerUpdateView('${synchrnServer.serverId}'); return false;"><spring:message code="button.update" /></a></span></td>
              <td>&nbsp;&nbsp;</td>
              <td><span class="button"><a href="<c:url value='/utl/sys/ssy/removeSynchrnServer.do'/>?serverId=<c:out value='${synchrnServer.serverId}'/>" onclick="fncSynchrnServerDelete('${synchrnServer.serverId}'); return false;"><spring:message code="button.delete" /></a></span></td>
              <td>&nbsp;&nbsp;</td>
              <td><span class="button"><a href="<c:url value='/utl/sys/ssy/selectSynchrnServerList.do'/>?pageIndex=<c:out value='${synchrnServerVO.pageIndex}'/>&amp;strSynchrnServerNm=<c:out value="${synchrnServerVO.strSynchrnServerNm}"/>" onclick="fncSelectSynchrnServerList(); return false;"><spring:message code="button.list" /></a></span></td>
            </tr>
           </table>  
       </td>
      </tr>  
    </table>
    <input type="hidden" name="serverId" />
    <!-- 검색조건 유지 -->
    <input type="hidden" name="strSynchrnServerNm" value="<c:out value='${synchrnServerVO.strSynchrnServerNm}'/>" />
    <input type="hidden" name="pageIndex" value="<c:out value='${synchrnServerVO.pageIndex}'/>" />
  </form:form>

<!-- 
    <table width="100%" class="table-search" border="0">
     <tr>
      <td width="20" class="title_left"><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="타이틀"></td>
      <td width="680" class="title_left">동기화 파일 목록</td>
     </tr>
     <tr>
      <td class="title_left" colspan="2"></td>
     </tr>     
    </table>
     -->
        <table width="100%" class="table-search" border="0">
         <tr>
          <td width="305" class="title_left">
            <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" style="vertical-align:middle;" alt="" />&nbsp;동기화 파일 목록</h1>
          </td>
          <td width="20" align="right">&nbsp;</td> 
         </tr>
         <tr>
           <td class="title_left" colspan="2"></td>
         </tr>         
        </table>         
    
    
    <form:form commandName="fileList" method="post" action="${pageContext.request.contextPath}/utl/sys/ssy/removeSynchrnServerFile.do">
    <table width="350" cellpadding="8" class="table-line">
      <thead>
        <tr>
          <th class="title" nowrap>순번</th>
          <th class="title" nowrap>파일 목록</th>
          <th class="title" nowrap>다운로드</th>
          <th class="title" nowrap>삭제</th>
        </tr>
      </thead>
      <tbody>
      <c:forEach var="file" items="${fileList}" varStatus="status">
        <tr>
            <c:if test="${file != 'noList'}">
                <td class="lt_text3"  width="20" nowrap><c:out value="${status.count}"/></td>
                <td class="lt_text3" width="200" nowrap><c:out value="${file}"/>&nbsp;</td>
                <td class="lt_text3" width="100" nowrap><span class="button"><a href="<c:url value='/utl/sys/ssy/getSynchrnServerFile.do'/>?pageIndex=<c:out value='${synchrnServerVO.pageIndex}'/>&amp;strSynchrnServerNm=<c:out value="${synchrnServerVO.strSynchrnServerNm}"/>" onclick="fncDownSynchrnServerFile('<c:out value="${file}"/>'); return false;">다운로드</a></span>&nbsp;</td>
                <!-- 동기화대상서버 파일 삭제 기능 -->
                <td class="lt_text3" width="30" nowrap><span class="button"><input type="submit" value="<spring:message code="button.delete" />" onclick="fncRemoveSynchrnServerFile('<c:out value="${file}"/>'); return false;"></span></td>
            </c:if>
            <c:if test="${file == 'noList'}">
                <td class="lt_text" colspan="4" nowrap>서버접속이 불가능합니다</td>
            </c:if>
        </tr>
      </c:forEach>
      </tbody>
    </table>
    <input type="hidden" name="serverId" value="<c:out value='${synchrnServer.serverId}'/>" />
    <input type="hidden" name="fileNm" />    
    </form:form>

</td>
</tr>
</table>
</DIV>
</body>
</html>

