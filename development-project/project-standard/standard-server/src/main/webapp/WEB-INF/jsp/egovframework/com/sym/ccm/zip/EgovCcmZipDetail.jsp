<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
 /**
  * @Class Name  : EgovCcmZipDetail.jsp
  * @Description : EgovCcmZipDetail 화면
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
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="ko">
<head>
<title>우편번호 상세조회</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/sym/ccm/zip/zip.css' />">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javaScript" language="javascript">
<!--
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_Zip(){
	location.href = "<c:url value='/sym/ccm/zip/EgovCcmZipList.do' />";
}
/* ********************************************************
 * 수정화면으로  바로가기
 ******************************************************** */
function fn_egov_modify_Zip(){
	var varForm				 = document.getElementById("Form");
	varForm.action           = "<c:url value='/sym/ccm/zip/EgovCcmZipModify.do'/>";
	if (${searchList} == "1") {
		varForm.zip.value        = "${result.zip}";
		varForm.sn.value         = "${result.sn}";
	} else {
		varForm.rdmnCode.value   = "${result.rdmnCode}";
		varForm.sn.value         = "${result.sn}";
	}
	varForm.submit();
}
/* ********************************************************
 * 삭제 처리 함수
 ******************************************************** */
function fn_egov_delete_Zip(){
	if (confirm("<spring:message code='common.delete.msg'/>")) {
		var varForm				 = document.getElementById("Form");
		varForm.action           = "<c:url value='/sym/ccm/zip/EgovCcmZipRemove.do'/>";
		if (${searchList} == "1") {
			varForm.zip.value        = "${result.zip}";
			varForm.sn.value         = "${result.sn}";
		} else {
			varForm.rdmnCode.value   = "${result.rdmnCode}";
			varForm.sn.value         = "${result.sn}";
		}
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
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;우편번호 상세조회</h1></td>
 </tr>
</table>
<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="우편번호, 시도명, 시군구명, 읍면동명, 리건물명, 번지동호를 가지고 있는 우편번호 상세조회 테이블이다.">
<CAPTION style="display: none;">우편번호 상세조회</CAPTION>
  <c:if test="${searchList == '1'}">
	  <tr>
	    <th width="20%" height="23" class="required_text" scope="row" nowrap >우편번호<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
	    <td><c:out value='${fn:substring(result.zip, 0,3)}'/>-<c:out value='${fn:substring(result.zip, 3,6)}'/></td>
	  </tr>
	  <tr>
	    <th width="20%" height="23" class="required_text" scope="row" nowrap >시도명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
	    <td>${result.ctprvnNm}</td>
	  </tr>
	  <tr>
	    <th width="20%" height="23" class="required_text" scope="row" nowrap >시군구명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
	    <td>${result.signguNm}</td>
	  </tr>
	  <tr>
	    <th width="20%" height="23" class="required_text" scope="row" nowrap >읍면동명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
	    <td>${result.emdNm}</td>
	  </tr>
	  <tr>
	    <th width="20%" height="23" class="required_text" scope="row" nowrap >리건물명</th>
	    <td>${result.liBuldNm}</td>
	  </tr>
	  <tr>
	    <th width="20%" height="23" class="required_text" scope="row" nowrap >번지동호</th>
	    <td>${result.lnbrDongHo}</td>
	  </tr>
  </c:if>
  <c:if test="${searchList == '2'}">
	  <tr>
	    <th width="11%" height="23" class="required_text" scope="row" nowrap >우편번호<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
	    <td><c:out value='${fn:substring(result.zip, 0,3)}'/>-<c:out value='${fn:substring(result.zip, 3,6)}'/></td>
	  </tr>
	  <tr>
	    <th width="11%" height="23" class="required_text" scope="row" nowrap >도로명코드<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
	    <td>${result.rdmnCode}</td>
	  </tr>
	  <tr>
	    <th width="11%" height="23" class="required_text" scope="row" nowrap >시도명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
	    <td>${result.ctprvnNm}</td>
	  </tr>
	  <tr>
	    <th width="11%" height="23" class="required_text" scope="row" nowrap >시군구명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
	    <td>${result.signguNm}</td>
	  </tr>
	  <tr>
	    <th width="11%" height="23" class="required_text" scope="row" nowrap >도로명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
	    <td>${result.rdmn}</td>
	  </tr>
	  <tr>
	    <th width="11%" height="23" class="required_text" scope="row" nowrap >건물번호본번</th>
	    <td>${result.bdnbrMnnm}</td>
	  </tr>
	  <tr>
	    <th width="11%" height="23" class="required_text" scope="row" nowrap >건물번호부번</th>
	    <td>${result.bdnbrSlno}</td>
	  </tr>
	  <tr>
	    <th width="11%" height="23" class="required_text" scope="row" nowrap >건물명</th>
	    <td>${result.buldNm}</td>
	  </tr>
	  <tr>
	    <th width="11%" height="23" class="required_text" scope="row" nowrap >상세건물명</th>
	    <td>${result.detailBuldNm}</td>
	  </tr>
  </c:if>
</table>
<table width="700" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="10"></td>
  </tr>
</table>
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td><span class="button"><input type="submit" value="수정" onclick="fn_egov_modify_Zip(); return false;"></span></td>
  <td><span class="button"><input type="submit" value="삭제" onclick="fn_egov_delete_Zip(); return false;"></span></td>
  <td><span class="button"><input type="submit" value="목록" onclick="fn_egov_list_Zip(); return false;"></span></td>
</tr>
</table>
<form:form name="Form" id="Form" method="post" action="">
	<input type=hidden name="zip">
	<input type=hidden name="sn">
	<input type=hidden name="rdmnCode">
	<input type=hidden name="searchList" value="${searchList}">
	<input type="submit" id="invisible" class="invisible">
</form:form>
</body>
</html>
