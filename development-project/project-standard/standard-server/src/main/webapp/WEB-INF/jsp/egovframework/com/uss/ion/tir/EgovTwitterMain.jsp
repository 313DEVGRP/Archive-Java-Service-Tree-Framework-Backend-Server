<%--
  Class Name : EgovTwitterRecptn.jsp
  Description : 트위터 수신(목록) 페이지
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2010.07.07    장동한          최초 생성

    author   : 공통서비스 개발팀 장동한
    since    : 2010.07.07

--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="twitter4j.*"%>
<%@ page import="twitter4j.http.*"%>
<%@ page import="twitter4j.util.*"%>
<%@ page import="twitter4j.api.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="egovc" uri="/WEB-INF/tlds/egovc.tld" %>
<c:set var="ImgUrl" value="/images/egovframework/com/cmm/"/>
<c:set var="CssUrl" value="/css/egovframework/com/"/>
<%
String sCmd = request.getParameter("cmd") == null ? "": (String)request.getParameter("cmd");

String rtoken =  session.getAttribute("rstoken") == null ? "": (String)session.getAttribute("rstoken");
String rstoken = session.getAttribute("rstoken") == null ? "": (String)session.getAttribute("rstoken");

String atoken =  session.getAttribute("atoken") == null ? "": (String)session.getAttribute("atoken");
String astoken = session.getAttribute("astoken") == null ? "": (String)session.getAttribute("astoken");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>트위터(Twitter)-인증</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css">
<link type="text/css" rel="stylesheet" href="${CssUrl}button.css">
<script type="text/javaScript" language="javascript">
/* ********************************************************
* 팝업창  오픈
******************************************************** */
function fn_egov_popupOpen_TwitterMain(url,name,width,height){
	var left = (screen.width-1024)/2;
	var top = (screen.height-600)/2;

	var openWindows = window.open(url,name,"width="+width+",height="+height+",top="+top+",left="+left+",toolbar=no,status=no,location=no,scrollbars=yes,menubar=no,resizable=yes");

	if(window.focus){openWindows.focus();}
}

/* ********************************************************
* 초기화
******************************************************** */
function fn_egov_popupOpen_Init(){

	fn_egov_popupOpen_TwitterMain('/uss/ion/tir/selectTwitterPopup.do?cmd=<egovc:out value="<%=sCmd%>"/>','TwitterPopupAuth',900,600);
}

<%
if( !rtoken.equals("") && !rtoken.equals("") &&
		!atoken.equals("") && !astoken.equals("") ){

	if(sCmd.equals("RECPTN")){
		%>location.href = '/uss/ion/tir/listTwitterRecptn.do';<%
	}else{
		%>location.href = '/uss/ion/tir/registTwitterTrnsmit.do';<%
	}

}
%>
</script>
<style type="text/css">
.txaIpt80 {
width : 99%;
}

#divVerify {
font-size : 12px;
color : red;
}
</style>
</head>
<body onLoad="fn_egov_popupOpen_Init()">
<DIV id="content" style="width:712px">
<!-- noscript 테그 -->
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<%if(sCmd.equals("RECPTN")){%>
<div class="title_left" style="width:100%;margin:0 0 0 0;">
	<h1><img src="<c:out value="${ImgUrl}"/>icon/tit_icon.gif" width="16" height="16" hspace="3" style="vertical-align:middle; display:inline-block;" alt=" ">&nbsp;트위터  수신(목록)-인증</h1>
</div>
<%}else{%>
<div class="title_left" style="width:100%;margin:0 0 0 0;">
	<h1><img src="<c:out value="${ImgUrl}"/>icon/tit_icon.gif" width="16" height="16" hspace="3" style="vertical-align:middle; display:inline-block;" alt=" ">&nbsp;트위터 송신(등록)-인증</h1>
</div>
<%}%>
<br>
<table width="100%" border="0" cellpadding="0" cellspacing="0" summary="인증키 발급 절차를 제공한다">
<caption>인증키 발급 절차를 제공한다</caption>
<tr>
	<th scope="col"> </th>
	<th scope="col"> </th>
</tr>
<tr>
	<td colspan="2">
		테스트 Consumer key : saaeVLrxerfGqBaTO2SQQ<br>
		테스트 Consumer secret : wKMiMTnO44Bs4znEkx9NP1Aag4klPX5tisfccrokdxg<br>
	</td>
</tr>
<tr>
	<td width="20px" valign="top">1)</td>
	<td><a href="http://twitter.com/apps" target="_blank"  title="새 창으로 이동" >http://twitter.com/apps</a> 트위터 사이트에 로그인한다.</td>
</tr>
<tr>
	<td width="20px" valign="top">2)</td>
	<td>
	Register a new application >> 버튼을 클릭하고 등록 페이지에 아래와 같이 트위터 어플리케이션 서비스를 등록한다.<br>
	<img src="/images/egovframework/com/uss/ion/tir/twitter_regist.jpg" alt="트위터 어플 등록 이미지" title="트위터 어플 등록 이미지">
	<br>※ Callback URL: http://common.egovframe.go.kr/uss/ion/tir/selectTwitterPopupProcess.do
	<br>(키 발급 후 리턴되는 URL)<br><br>
	</td>
</tr>
<tr>
	<td width="20px" valign="top">3)</td>
	<td>
	Consumer key, Consumer secret 등이 아래와 같이 발급된다.<br>
	<img src="/images/egovframework/com/uss/ion/tir/twitter_regist_detail.jpg" alt="트위터 어플 등록 완료 이미지" title="트위터 어플 등록 완료 이미지">
	</td>
</tr>
</table>
<br>
</DIV>
</body>
</html>
