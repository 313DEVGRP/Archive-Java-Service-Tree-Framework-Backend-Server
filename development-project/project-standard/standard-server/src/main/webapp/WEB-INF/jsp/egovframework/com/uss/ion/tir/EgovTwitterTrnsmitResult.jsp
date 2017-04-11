<%--
  Class Name : EgovTwitterTrnsmit.jsp
  Description : 트위터 송신(등록) 페이지
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2010.07.13    장동한          최초 생성
 
    author   : 공통서비스 개발팀 장동한
    since    : 2010.07.13
   
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="twitter4j.Status"%>
<%@ page import="twitter4j.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="ImgUrl" value="/images/egovframework/com/cmm/"/>
<c:set var="CssUrl" value="/css/egovframework/com/"/>
<%

Status status = (Status)request.getAttribute("status");

User user = (User)status.getUser();


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>트위터(Twitter)-송신(등록)결과확인</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css">
<link type="text/css" rel="stylesheet" href="${CssUrl}button.css">
</head>
<body>
<DIV id="content" style="width:712px">
<!-- noscript 태그  -->
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<!--  상단타이틀  -->
<table width="100%" cellpadding="1" class="table-search" border="0">
<tr>
	<td class="title_left">
		<img src="<c:out value="${ImgUrl}"/>icon/tit_icon.gif" width="16" height="16" hspace="3" style="vertical-align:middle; display:inline-block;" alt=" " title=" ">&nbsp;트위터 송신 결과
	</td>
	<td width="150px"></td>  
</tr>
</table>

<!--  줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0" summary="등록을  제공한다.">
<tr>
	<td height="3px"></td>
</tr>
</table>
<!--  등록  폼 영역  -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="트위터  입력을 제공한다..">
<tr> 
	<th width="20%" height="23" class="required_text" nowrap>등록ID&nbsp;</th>
	<td width="80%" colspan="3" nowrap><%=status.getId() %></td>
</tr>
 
<tr> 
	<th width="20%" height="23" class="required_text" nowrap>계정ID&nbsp;</th>
	<td width="80%" colspan="3" nowrap><%=user.getScreenName() %></td>
</tr>
 
<tr> 
	<th width="20%" height="23" class="required_text" nowrap>별명&nbsp;</th>
	<td width="80%" colspan="3" nowrap><%=user.getName() %></td>
</tr>
<tr> 
	<th width="20%" height="23" class="required_text" nowrap>URL</th>
	<td width="80%" colspan="3" nowrap><%=user.getURL() %></td>
</tr>
<tr> 
	<th width="20%" height="23" class="required_text" nowrap>트위터 내용&nbsp;</th>
	<td width="80%" colspan="3" nowrap><%=status.getText() %></td>
</tr>
<tr> 
	<th width="20%" height="23" class="required_text" nowrap>Profile Image</th>
	<td width="80%" colspan="3" nowrap><img src="<%=user.getProfileImageURL() %>" title="profileImageUrl" alt="profileImageUrl"></td>
</tr>
<%
java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
<tr> 
	<th width="20%" height="23" class="required_text" nowrap>등록일</th>
	<td width="80%" colspan="3" nowrap><%=format.format(user.getCreatedAt()) %></td>
</tr>
<tr> 
	<th width="20%" height="23" class="required_text" nowrap>favorite&nbsp;</th>
	<td width="80%" colspan="3" nowrap><%=status.isFavorited() %></td>
</tr>
<tr> 
	<th width="20%" height="23" class="required_text" nowrap>retweet&nbsp;</th>
	<td width="80%" colspan="3" nowrap><%=status.isRetweet() %></td>
</tr>
<tr> 
	<th width="20%" height="23" class="required_text" nowrap>runcated&nbsp;</th>
	<td width="80%" colspan="3" nowrap><%=status.isTruncated() %></td>
</tr>
</table>


<!--  줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0" summary="화면 줄간격을 조정한다.">
<tr>
	<td height="3px"></td>
</tr>
</table>

<center>
<!--  목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center" summary="목록/저장버튼을 제공한다.">
<tr> 
      <td><img src="<c:out value="${ImgUrl}"/>btn/bu2_left.gif"  width="8" height="20"></td>
      <td class="btnBackground" nowrap><a href="/uss/ion/tir/registTwitterTrnsmit.do">확인</a></td>
      <td><img src="<c:out value="${ImgUrl}"/>btn/bu2_right.gif" width="8" height="20" alt="버튼이미지"></td>
      <td>&nbsp;</td>        
</tr>
</table>
</center>
</DIV>

</body>
</html>