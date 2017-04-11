<%--
  Class Name : EgovRssTagManageDetail.jsp
  Description : RSS태그관리 상세조회
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2010.08.05    장동한          최초 생성
 
    author   : 공통서비스 개발팀 장동한
    since    : 2010.08.05
    
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ImgUrl" value="/images/egovframework/com/cmm/"/>
<c:set var="CssUrl" value="/css/egovframework/com/"/>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>RSS태그관리-상세조회</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css">
<link type="text/css" rel="stylesheet" href="${CssUrl}button.css">
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_RssTagManage(){

}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_modify_RssTagManage(){
	var vFrom = document.RssTagManageForm;
	vFrom.cmd.value = '';
	vFrom.action = "/uss/ion/rss/updtRssTagManage.do";;
	vFrom.submit();

}
/* ********************************************************
 * 삭제처리
 ******************************************************** */
function fn_egov_delete_RssTagManage(){
	var vFrom = document.RssTagManageForm;
	if(confirm("삭제 하시겠습니까?")){
		vFrom.cmd.value = 'del';
		vFrom.action = "/uss/ion/rss/detailRssTagManage.do";
		vFrom.submit();
	}else{
		vFrom.cmd.value = '';
	}
}
</script>
</head>
<body onLoad="fn_egov_init_RssTagManage();">
<DIV id="content" style="width:712px">
<%-- noscript 테그 --%>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<!--  상단타이틀 -->
<form name="RssTagManageForm" action="<c:url value='/uss/ion/rss/detailRssTagManage.do'/>" method="post">
<!-- ----------------- 상단 타이틀  영역 -->
<div class="title_left" style="width:100%;margin:0 0 0 0;">
	<h1><img src="${ImgUrl}icon/tit_icon.gif" width="16" height="16" hspace="3" style="vertical-align:middle; display:inline-block;" alt=" ">&nbsp;RSS태그관리 상세조회</h1>
</div>

<!--  줄간격조정  -->
<div style="width:100%;border:solid 0px #000000;height:3px"></div>

<!--  등록  폼 영역  -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register"  summary="상세조회  목록을  제공한다.">
<caption>상세조회  목록을  제공한다</caption>
<tr> 
	<th scope="row" width="20%" height="23" class="required_text">대상서비스명</th>
	<td width="80%" colspan="3"><c:out value="${rssManage.trgetSvcNm}" />&nbsp;</td>
</tr>
<tr> 
	<th scope="row" width="20%" height="23" class="required_text">대상테이블명</th>
	<td width="80%" colspan="3"><c:out value="${rssManage.trgetSvcTable}" />&nbsp;</td>
</tr>
<tr> 
	<th scope="row" width="20%" height="23" class="required_text">대상서비스목록갯수</th>
	<td width="80%" colspan="3"><c:out value="${rssManage.trgetSvcListCo}" />&nbsp;</td>
</tr>
<tr> 
	<th scope="row" width="20%" height="23" class="required_text">헤더TITLE</th>
	<td width="80%" colspan="3"><c:out value="${rssManage.hderTitle}" />&nbsp;</td>
</tr>
<tr> 
	<th scope="row" width="20%" height="23" class="required_text">헤더LINK</th>
	<td width="80%" colspan="3"><c:out value="${rssManage.hderLink}" />&nbsp;</td>
</tr>
<tr> 
	<th scope="row" width="20%" height="23" class="required_text">헤더DESCRIPTION</th>
	<td width="80%" colspan="3"><c:out value="${fn:replace(rssManage.hderDescription , crlf , '<br/>')}" escapeXml="true" />&nbsp;</td>
</tr>
<tr> 
	<th scope="row" width="20%" height="23" class="required_text">헤더TAG</th>
	<td width="80%" colspan="3"><c:out value="${rssManage.hderTag}" />&nbsp;</td>
</tr>
<tr> 
	<th scope="row" width="20%" height="23" class="required_text">헤더ETC</th>
	<td width="80%" colspan="3">
	<c:set var="hderEtc" value="${fn:escapeXml(rssManage.hderEtc)}"/>
	<c:set var="hderEtc" value="${fn:replace(hderEtc , crlf , '<br>')}"/>
	<c:out value="${hderEtc}" escapeXml="false" />&nbsp;
	</td>
</tr>
<tr> 
	<th scope="row" width="20%" height="23" class="required_text">본문TITLE</th>
	<td width="80%" colspan="3"><c:out value="${rssManage.bdtTitle}" />&nbsp;</td>
</tr>
<tr> 
	<th scope="row" width="20%" height="23" class="required_text">본문LINK</th>
	<td width="80%" colspan="3"><c:out value="${rssManage.bdtLink}" />&nbsp;</td>
</tr>
<tr> 
	<th scope="row" width="20%" height="23" class="required_text">본문DESCRIPTION</th>
	<td width="80%" colspan="3"><c:out value="${fn:replace(rssManage.bdtDescription , crlf , '<br/>')}" escapeXml="true" />&nbsp;</td>
</tr>
<tr> 
	<th scope="row" width="20%" height="23" class="required_text">본문TAG</th>
	<td scope="row" width="80%" colspan="3"><c:out value="${rssManage.bdtTag}" />&nbsp;</td>
</tr>
<tr> 
	<th scope="row" width="20%" height="23" class="required_text">본문ETC</th>
	<td width="80%" colspan="3">
	<c:set var="bdtEtc" value="${fn:escapeXml(rssManage.bdtEtc)}"/>
	<c:set var="bdtEtc" value="${fn:replace(bdtEtc , crlf , '<br>')}"/>
	<c:out value="${bdtEtc}" escapeXml="false" />&nbsp;
	</td>
</tr>
</table>
<input name="rssId" type="hidden" value="${rssManage.rssId}">
<input name="cmd" type="hidden" value="<c:out value=''/>">
<div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div>
</form>


<!--  줄간격조정  -->
<div style="width:100%;border:solid 0px #000000;height:3px"></div>

<!--  목록/저장버튼  -->
<center>
<table border="0" cellspacing="0" cellpadding="0" align="center" summary="수정/삭제/목록  버튼을 제공한다.">
<caption>수정/삭제/목록  버튼을 제공한다</caption>
<tr>
	<td>
		<form name="formUpdt" action="<c:url value='/uss/ion/rss/updtRssTagManage.do'/>" method="post"> 
		<span class="button"><input type="submit" value="<spring:message code="button.update" />" onclick="fn_egov_modify_RssTagManage(); return false;"></span>
		<input name="rssId" type="hidden" value="${rssManage.rssId}">
		</form>
	</td>
	<th scope="col" width="3"></th>
	<td>
		<form name="formDelete" action="<c:url value='/uss/ion/rss/detailRssTagManage.do'/>" method="post"> 
		<span class="button"><input type="submit" value="<spring:message code="button.delete" />" onclick="fn_egov_delete_RssTagManage(); return false;"></span>
		<input name="rssId" type="hidden" value="${rssManage.rssId}">
		<input name="cmd" type="hidden" value="<c:out value='del'/>"/>
		</form>
	</td>
	<td width="3"></td>
	<td> 
		<form name="formList" action="<c:url value='/uss/ion/rss/listRssTagManage.do'/>" method="post">
		<span class="button"><input type="submit" value="<spring:message code="button.list" />"></span>
		</form>
	</td>
</tr>
</table>
</center>


</DIV>

</body>
</html>