<%
/**
 * @Class Name : EgovBndtCeckManageDetail.java
 * @Description : EgovBndtCeckManageDetail jsp
 * @Modification Information
 * @
 * @  수정일                    수정자                수정내용
 * @ ---------     --------    ---------------------------
 * @ 2010.07.20    이      용                최초 생성
 *
 *  @author 이      용
 *  @since 2010.07.20
 *  @version 1.0
 *  @see
 *  
 *  Copyright (C) 2009 by MOPAS  All right reserved.
 */
%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>당직체크 상세조회</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<script type="text/javaScript" language="javascript">
<!--
/* ********************************************************
 * 초기화
 ******************************************************** */
function fnInit(){
}
/* ********************************************************
* 목록 으로 가기
******************************************************** */
function fncBndtCeckManageList() {
    var varFrom = document.getElementById("bndtCeckManage");
    varFrom.action = "<c:url value='/uss/ion/bnt/EgovBndtCeckManageList.do'/>";
    varFrom.submit();       
}

/* ********************************************************
 * 수정화면으로  바로가기
 ******************************************************** */
 function fncEgovBndtCeckManage() {
		var varFrom = document.getElementById("bndtCeckManage");
		varFrom.cmd.value  = "updt";
		varFrom.action = "<c:url value='/uss/ion/bnt/EgovBndtCeckManage.do'/>";
		varFrom.submit();   
 }

 /* ********************************************************
  * 삭제처리화면
  ******************************************************** */

 function fncDeleteBndtCeckManage() {
     var varFrom = document.getElementById("bndtCeckManage");
     varFrom.action = "<c:url value='/uss/ion/bnt/deleteBndtCeckManage.do'/>";
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

<!-- ********** 여기서 부터 본문 내용 *************** -->
<form:form commandName="bndtCeckManage" name="bndtCeckManage" method="post" action="${pageContext.request.contextPath}/uss/ion/bnt/EgovBndtCeckManage.do"> 
<div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div>
<input type="hidden" name="cmd" value="updt" >
<input type="hidden" name="bndtCeckSe" value ="<c:out value='${bndtCeckManageVO.bndtCeckSe}'/>">
<input type="hidden" name="bndtCeckCd" value ="<c:out value='${bndtCeckManageVO.bndtCeckCd}'/>"/>

<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="40%"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;당직체크 상세조회</h1></td>
  <td width="40%">&nbsp;</td>
  <th width="10%" align="right">
       <table border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td><span class="button"><a href="<c:url value='/uss/ion/bnt/EgovBndtCeckManage.do'/>?cmd=updt&bndtCeckSe=<c:out value='${bndtCeckManageVO.bndtCeckSe}'/>&bndtCeckCd=<c:out value='${bndtCeckManageVO.bndtCeckCd}'/>" onclick="fncEgovBndtCeckManage(); return false;"><spring:message code="button.update" /></a></span></td>
          <td>&nbsp;&nbsp;</td>
          <td><span class="button"><a href="<c:url value='/uss/ion/bnt/deleteBndtCeckManage.do'/>?bndtCeckSe=<c:out value='${bndtCeckManageVO.bndtCeckSe}'/>&bndtCeckCd=<c:out value='${bndtCeckManageVO.bndtCeckCd}'/>" onclick="fncDeleteBndtCeckManage(); return false;"><spring:message code="button.delete" /></a></span></td>     
          <td>&nbsp;&nbsp;</td>
          <td><span class="button"><a href="<c:url value='/uss/ion/bnt/EgovBndtCeckManageList.do'/>" onclick="fncBndtCeckManageList(); return false;"><spring:message code="button.list" /></a></span></td> 
        </tr>
       </table>
  </th>  
 </tr>
</table>
<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="당직체크 상세" >
<caption>당직체크 상세</caption>
  <tr> 
    <th width="20%" height="23" class="required_text" scope="row">당직체크구분<img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>
    <td><c:out value='${bndtCeckManageVO.bndtCeckTemp1}'/></td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row">당직체크코드<img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td><c:out value='${bndtCeckManageVO.bndtCeckCd}'/></td>    
  </tr> 
  <tr>
    <th width="20%" height="23" class="required_text" scope="row">당직체크코드명<img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td><c:out value='${bndtCeckManageVO.bndtCeckCdNm}'/></td>    
  </tr> 
  <tr> 
    <th width="20%" height="23" class="required_text" scope="row">사용여부<img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>
    <td> <c:if test="${bndtCeckManageVO.useAt == 'Y' }"> 사용 </c:if>
         <c:if test="${bndtCeckManageVO.useAt == 'N' }"> 미사용  </c:if></td>    
  </tr>     
</table>
</form:form>
<!-- ********** 여기까지 내용 *************** -->
</td>
</tr>
</table>            
</div>
</body>
</html>
