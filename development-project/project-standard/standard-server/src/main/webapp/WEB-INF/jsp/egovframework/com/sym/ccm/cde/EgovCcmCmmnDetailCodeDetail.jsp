<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
 /**
  * @Class Name  : EgovCcmCmmnDetailCodeDetail.jsp
  * @Description : EgovCcmCmmnDetailCodeDetail 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.04.01   이중호              최초 생성
  *
  *  @author 공통서비스팀
  *  @since 2009.04.01
  *  @version 1.0
  *  @see
  *
  */
%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html lang="ko">
<head>
<title>공통상세코드 상세조회</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
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
function fnList(){
	location.href = "<c:url value='/sym/ccm/cde/EgovCcmCmmnDetailCodeList.do' />";
}
/* ********************************************************
 * 수정화면으로  바로가기
 ******************************************************** */
function fnModify(){
	var varForm				 = document.getElementById("Form");
	varForm.action           = "<c:url value='/sym/ccm/cde/EgovCcmCmmnDetailCodeModify.do'/>";
	varForm.codeId.value     = "${result.codeId}";
	varForm.code.value       = "${result.code}";
	varForm.submit();
}
/* ********************************************************
 * 삭제 처리 함수
 ******************************************************** */
function fnDelete(){
	if (confirm("<spring:message code='common.delete.msg'/>")) {
		var varForm				 = document.getElementById("Form");
		varForm.action           = "<c:url value='/sym/ccm/cde/EgovCcmCmmnDetailCodeRemove.do'/>";
		varForm.codeId.value     = "${result.codeId}";
		varForm.code.value       = "${result.code}";
		varForm.submit();
	}
}
-->
</script>
</head>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<table width="700" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%" class="title_left"><h1 class="title_left">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;공통상세코드 상세조회</h1></td>
 </tr>
</table>
<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="코드ID명, 코드, 코드명, 코드설명, 사용여부가 나타나 있는 공통상세코드 상세조회 테이블이다.">
<CAPTION style="display: none;">공통상세코드 상세조회</CAPTION>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row" nowrap >코드ID명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td>${result.codeIdNm}</td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row" nowrap >코드<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td>${result.code}</td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row" nowrap >코드명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td>${result.codeNm}</td>
  </tr>
  <tr>
    <th height="23" class="required_text" scope="row" ><label for="codeDc">코드설명</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td><textarea class="textarea"  cols="75" rows="14"  style="width:450px;" disabled id="codeDc">${result.codeDc}</textarea></td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row" nowrap ><label for="useAt">사용여부</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td>
		<select name="useAt" disabled id="useAt">
			<option value="Y" <c:if test="${result.useAt == 'Y'}">selected="selected"</c:if> >Yes</option>
			<option value="N" <c:if test="${result.useAt == 'N'}">selected="selected"</c:if> >No</option>
		</select>
    </td>
  </tr>
</table>
<table width="700" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="10"></td>
  </tr>
<tr><td>
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td><span class="button"><input type="submit" value="수정" onclick="fnModify(); return false;"></span></td>
  <td width="10"></td>

  <c:if test="${result.useAt == 'Y'}">
  <td><span class="button"><input type="submit" value="삭제" onclick="fnDelete(); return false;"></span></td>
  <td width="10"></td>
  </c:if>
	
  <td><span class="button"><input type="submit" value="목록" onclick="fnList(); return false;"></span></td>
  <td width="10"></td>
  
  <!-- 
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif' />" alt="목록" width="8" height="20"></td>
  <td style="background-image:URL(<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>);" class="text_left" nowrap><a href="#noscript" onclick="fnList(); return false;">목록</a>
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif' />" alt="목록" width="8" height="20"></td>
   -->
</tr>
</table>
</td></tr>

</table>
<form name="Form" id="Form" method="post" action="">
	<input type=hidden name="codeId">
	<input type=hidden name="code">
	<input type="submit" id="invisible" class="invisible"/>
</form>
</body>
</html>
