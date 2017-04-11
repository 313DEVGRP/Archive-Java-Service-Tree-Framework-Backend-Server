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
<title>트위터(Twitter)-송신(등록)</title>
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
	document.twitterInfo.action = "<c:url value='/uss/tir/rss/listTwitterRecptn.do'/>";
   	document.twitterInfo.submit();
}

/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_detail_TwitterRecptn(unityLinkId){
	var vFrom = document.twitterInfo; 
}

/* ********************************************************
 * 검색 함수
 ******************************************************** */
function fn_egov_search_TwitterRecptn(){
	var vFrom = document.twitterInfo;

	if(vFrom.twitterId.value == ""){
		alert("Twitter 아이디(ID)를 입력해주세요!");
		vFrom.twitterId.focus();
		return;
	}

	if(vFrom.twitterPw.value == ""){
		alert("Twitter 비밀번호(PW)를 입력해주세요!");
		vFrom.twitterPw.focus();
		return;
	}
	
	vFrom.submit();
}

/* ********************************************************
* 저장
******************************************************** */
function fn_egov_save_Twitter(){
	var vFrom = document.twitterInfo;
	
	if(confirm("작성된 Twitter를 전송 하시겠습니까?")){

		vFrom.action = "/uss/ion/tir/registTwitterTrnsmit.do";
		
		if(!validateTwitterInfo(vFrom)){ 			
			return;
		}else{
			vFrom.submit();
		} 
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
<!-- noscript 태그  -->
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<!-- 등록폼 시작  -->
<form:form commandName="twitterInfo" name="twitterInfo" action="" method="post" enctype="multipart/form-data" >
	<%-- 상산 타이틀 --%>
<div class="title_left" style="width:100%;margin:0 0 0 0;">
	<h1><img src="<c:out value="${ImgUrl}"/>icon/tit_icon.gif" width="16" height="16" hspace="3" style="vertical-align:middle; display:inline-block;" alt=" " title=" ">&nbsp;트위터 송신(등록)</h1>
</div>

	<!--  줄간격조정  -->
<div style="width:100%;border:solid 0px #000000;height:3px"></div>

<!--  등록  폼 영역  -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="트위터  입력을 제공한다">
<caption>트위터  입력을 제공한다</caption>
<tr> 
	<th scope="row" width="20%" height="23" class="required_text"><label for="twitterText">Twitter 내용</label><img src="${ImgUrl}icon/required.gif" alt="필수입력" title="필수입력" width="15" height="15"></th>
	<td width="80%">
		<form:textarea path="twitterText" title="Twitter 내용" rows="7" cols="20" cssClass="txaClass"/>
		<div><form:errors path="twitterText" cssClass="error"/></div>
	</td>
</tr>
</table>


<!--  줄간격조정  -->
<div style="width:100%;border:solid 0px #000000;height:3px"></div>

<center>
<!--  목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center" summary="전송 버튼을 제공한다">
<caption>전송 버튼을 제공한다</caption>
<tr>
  <td><img src="${ImgUrl}btn/bu2_left.gif"  width="8" height="20" alt="버튼이미지"></td>
  <td class="btnBackground" nowrap><input type="submit" value="전송" onclick="fn_egov_save_Twitter(); return false;" class="btnNew" style="height:20px;width:26px;" > 
  </td>
  <td><img src="${ImgUrl}btn/bu2_right.gif"  width="8" height="20" alt="버튼이미지"></td>
  <th scope="col"> </th>      
</tr>
</table>
</center>
</form:form>
</DIV>

</body>
</html>