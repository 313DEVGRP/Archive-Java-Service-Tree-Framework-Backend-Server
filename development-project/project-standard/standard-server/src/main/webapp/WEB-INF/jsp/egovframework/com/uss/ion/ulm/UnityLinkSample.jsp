<%--
  Class Name : EgovUnityLinkList.jsp
  Description : 통합링크관리 목록 페이지
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2008.03.09    장동한          최초 생성

    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.09

    Copyright (C) 2009 by MOPAS  All right reserved.
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ImgUrl" value="${pageContext.request.contextPath}/images/egovframework/com/cmm/"/>
<c:set var="CssUrl" value="${pageContext.request.contextPath}/css/egovframework/com/" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>EGOV-COM</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css">
<link type="text/css" rel="stylesheet" href="${CssUrl}button.css">
<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 검색 함수
 ******************************************************** */
function fn_egov_link_UnityLink(){

	var sLink = fn_egov_SelectBoxValue("selUnityLink");
	if(sLink == ""){
		alert("통합링크를 선택해주세요!");
		document.formUnityLink.selUnityLink.focus();
		return;
	}else{
		document.formUnityLink.action=sLink;
		document.formUnityLink.submit();
	}

}

/* ********************************************************
* SELECT BOX VALUE FUNCTION
******************************************************** */
function fn_egov_SelectBoxValue(sbName)
{
	var FValue = "";
	for(var i=0; i < document.getElementById(sbName).length; i++)
	{
		if(document.getElementById(sbName).options[i].selected == true){
			FValue=document.getElementById(sbName).options[i].value;
		}
	}
	return  FValue;
}
</script>
<style TYPE="text/css">
.noPaddingMargin{
padding:0px 0px 0px 0px;margin:0px 0px 0px 0px;
}
/* 버튼이미지 */
.btnBackground {
padding:0px 0px 0px 0px;margin:0px 0px 0px 0px;
background-image:url(/images/egovframework/com/cmm/uss/umt/button/bu2_bg.gif);
}
</style>
</head>
<body>

<%-- noscript 테그 --%>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<form name="formUnityLink" action="" method="post" target="_blank">
<table width="250px"  border="0" cellpadding="0" cellspacing="1" class="table-register" summary="통합링크 사이트를 표시한다.">
<thead>
<tr>
	<th class="required_text" nowrap><center><font size="3">통합링크</font></center></th>
</tr>
</thead>
<tbody>
<tr>
	<td >
	<div id="divUnityLink1" style="float: left;">
  	<select name="selUnityLink" id="selUnityLink" class="select" style="width:190px;" title="통합링크선택">
	   <option value=''>--선택하세요--</option>
	   <c:forEach items="${resultList}" var="resultInfo" varStatus="status">
	   <option value='${resultInfo.unityLinkUrl}'>${resultInfo.unityLinkNm}</option>
	   </c:forEach>
   </select>
   </div>
    <div id="divUnityLink2" style="float: left;padding:0px 0px 0px 0px;margin:0px 0px 0px 3px;">
   <table border="0" cellspacing="0" cellpadding="0" align="center" summary="이동버튼을  표시한다.">
    <tr>

      <td class="btnBackground" nowrap>
      <span class="button"><input type="submit" onclick="javascript:fn_egov_link_UnityLink();" value="이동"></span>
	  </td>
    </tr>
   </table>
    </div>
	</td>
</tr>
</tbody>
</table>
</form>
</body>
</html>