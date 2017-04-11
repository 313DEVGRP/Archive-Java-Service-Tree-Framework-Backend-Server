<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%
 /**
  * @Class Name : EgovSiteMapng.jsp
  * @Description : 사이트맵 화면
  * @Modification Information
  * @
  * @  수정일         수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.03.10    이용          최초 생성
  *   2011.07.29  서준식          사이트 맵 생성이 안되었을 때 발생하는 오류 수정
  *  @author 공통서비스 개발팀 이용
  *  @since 2009.03.10
  *  @version 1.0
  *  @see
  *
  */

  /* Image Path 설정 */
//  String imagePath_icon   = "/images/egovframework/com/sym/mnu/stm/icon/";
//  String imagePath_button = "/images/egovframework/com/sym/mnu/stm/button/";
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/uss/umt/map.css' />" type="text/css">
<title>사이트맵</title>
<style type="text/css">
.location{ font-family:"돋움"; font-size:8pt; color:#6d6d6d ;padding-top:1px; padding-left:3px; 
           vertical-align: middle; text-dacoration: none}
</style>
<script language="javascript1.2">
<!--
/* ********************************************************
 * 조회 함수
 ******************************************************** */
function fSiteMapng() {
	document.siteMapngForm.action = "<c:url value='/sym/mnu/stm/EgovSiteMapng.do'/>";
    document.siteMapngForm.submit();
}
/* ********************************************************
 * Url Call 함수
 ******************************************************** */
function fCallUrl(fURL){
	window.location = fURL;
}
<c:if test="${!empty resultMsg}">alert("${resultMsg}");</c:if>
-->
</script>
</head>
<body>
<form name="siteMapngForm" action ="javascript:fSiteMapng()" method="post">

<DIV id="main" style="display:">

<table width="717" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="40%"class="title_left">
  <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="absmiddle" alt="제목아이콘이미지">&nbsp;사이트맵</td>
  <td width="10%">&nbsp;</td>
  <td widht="25%">&nbsp;</td>
  <th width="25%"></th>
 </tr>
</table>

<input type="hidden" name="scrtyId" value="">
<c:if test="${!empty resultVO.bndeFileNm}">
	<c:import url="${fn:trim(resultVO.bndeFileNm)}" />
</c:if>
<br>
</DIV>
</form>
</body>
</html>

