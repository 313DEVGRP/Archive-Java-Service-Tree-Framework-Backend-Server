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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="ImgUrl" value="/images/egovframework/com/cmm/"/>
<c:set var="CssUrl" value="/css/egovframework/com/"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>트위터(Twitter)-수신</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css">
<link type="text/css" rel="stylesheet" href="${CssUrl}button.css">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="twitterInfo" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
	document.twitterInfo.pageIndex.value = pageNo;
	document.twitterInfo.action = "<c:url value='/uss/ion/tir/listTwitterRecptn.do'/>";
   	document.twitterInfo.submit();
}

/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_detail_TwitterRecptn(unityLinkId){
	var vFrom = document.twitterInfo; 
}

function numchk(){
	var value = document.twitterInfo.pageSize.value;
	if(value == ""){
		alert("숫자를 입력해주세요!");
		document.twitterInfo.pageSize.value="";
		document.twitterInfo.pageSize.focus();
		return false;
	}else if(isNaN(value)){
		alert("숫자만 입력이 가능합니다");
		document.twitterInfo.pageSize.value="";
		document.twitterInfo.pageSize.focus();
		return false;
	}else{
		return true;	
	}
}

</script>
<style type="text/css">
.txaIpt80 {
width : 80px;
}

#divVerify {
font-size : 12px;
color : red;
}
</style>
</head>
<body>
<DIV id="content" style="width:712px">
<!-- noscript 테그 -->
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<!-- LIST 출력 -->
<form id="twitterInfo" name="twitterInfo" action="/uss/ion/tir/listTwitterRecptn.do" method="post" enctype="multipart/form-data">
<table width="100%" cellpadding="1" border="0" summary="타이틀/검색 을 제공한다">
<caption>타이틀/검색 을 제공한다</caption>
<tr>
	<th scope="col" class="title_left">
		<h1><img src="<c:out value="${ImgUrl}"/>icon/tit_icon.gif" width="16" height="16" hspace="3" style="vertical-align:middle; display:inline-block;"  alt=" " title=" ">&nbsp;트위터 수신(목록)</h1>
	</th>
	<td>
	<td width="50px"><label for="pageSize"> </label><input name="pageSize" title="검색건수" type="text" size="3" value="<c:out value='${pageSize}'/>" maxlength="5" style="width:25px;IME-MODE: disabled">건</td>
	<td width="3px"></td>
	<td width="60px" align="center">
		<table border="0" cellspacing="0" cellpadding="0" align="center" summary="조회 버튼을 제공한다">
		<caption>조회 버튼을 제공한다</caption>
		<tr> 
			<td><img src="${ImgUrl}btn/bu2_left.gif"  width="8" height="20" alt="버튼이미지"></td>
			<td class="btnBackground"><input type="submit" value="<spring:message code="button.inquire" />" onclick="if(numchk() == false){return false;}" class="btnNew" style="height:20px;width:26px;" ></td>
			<td><img src="<c:out value="${ImgUrl}"/>btn/bu2_right.gif" width="8" height="20" alt="버튼이미지"></td>
			<th scope="col">&nbsp;</th>	
		</tr>
		</table>
	</td>
</tr>
</table>

<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
</form>

<!-- 줄간격 -->
<div style="width:100%;height:3px"></div>
<table width="100%" cellpadding="0" class="table-line" border="0" summary="트위터 목록 을 제공한다.">
<caption>트위터 목록 을 제공한다</caption>
<thead>
  <tr>  
    <th scope="col" class="title" width="50px" nowrap>프로필<br>이미지</th>
    <th scope="col" class="title" nowrap>내용</th>               
  </tr>
</thead> 
<tbody>
<!-- 데이터를 없을때 화면에 메세지를 출력해준다 -->
 <c:if test="${fn:length(resultList) == 0}">
<tr> 
<td class="lt_text3" colspan="6">
	<spring:message code="common.nodata.msg" />
</td>
</tr>   	          				 			   
</c:if>
<!-- 데이터를 화면에 출력해준다 -->
<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
<tr>
	<td class="lt_text3">
		<img src="<c:url value='${resultInfo.twitterProfileImageURL}'/>" alt="${resultInfo.twitterNmae}프로필이미지" width="48px" height="48px">
	</td>
	<td class="lt_text3L">
	${resultInfo.twitterNmae}(${resultInfo.twitterCreatedAt})<br>
	<c:out value="${resultInfo.twitterText}" escapeXml="false" /><br>
	<c:if test="${resultInfo.twitterURL ne 'null'}">
	<font color="#0080C0"><a href="<c:url value='${resultInfo.twitterURL}'/>" target="_blank"  title="새 창으로 이동" ><c:url value='${resultInfo.twitterURL}'/></a></font>
	</c:if>
	</td>
</tr>
</c:forEach>

</tbody>  
</table>

</DIV>

</body>
</html>