<%
 /**
  * @Class Name : EgovWordDicaryDetailInqure.jsp
  * @Description : EgovWordDicaryDetailInqure 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.02.01   박정규              최초 생성
  *
  *  @author 공통서비스팀
  *  @since 2009.02.01
  *  @version 1.0
  *  @see
  *
  */
%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>용어사전상세조회</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />">
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_worddicary(){



}

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_inqire_worddicarylist() {

	document.WordDicaryForm.action = "<c:url value='/uss/olh/wor/WordDicaryListInqire.do'/>";
	document.WordDicaryForm.submit();

}

/* ********************************************************
 * 수정처리화면
 ******************************************************** */
function fn_egov_updt_worddicary(wordId){

	// Update하기 위한 키값(wordId)을 셋팅
	document.WordDicaryForm.wordId.value = wordId;
	document.WordDicaryForm.action = "<c:url value='/uss/olh/wor/WordDicaryUpdtView.do'/>";
	document.WordDicaryForm.submit();

}

/* ********************************************************
 * 삭제처리화면
 ******************************************************** */
function fn_egov_delete_worddicary(wordId){

	if	(confirm("<spring:message code="common.delete.msg" />"))	{

		// Delete하기 위한 키값(wordId)을 셋팅
		document.WordDicaryForm.wordId.value = wordId;
		document.WordDicaryForm.action = "<c:url value='/uss/olh/wor/WordDicaryDelete.do'/>";
		document.WordDicaryForm.submit();
	}

}
</script>
</head>

<body onLoad="fn_egov_initl_worddicary();">
<DIV id="content" style="width:700px">
<!-- 상단타이틀 -->
<form name="WordDicaryForm" action="<c:url value='/uss/olh/wor/WordDicaryUpdtView.do'/>" method="post">

<!-- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" alt="">&nbsp;용어사전상세조회</h1></td>
 </tr>
</table>

<!-- 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<!-- 등록  폼 영역  -->
<table width="98%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="용어사전에 대한 정보를 조회합니다.">
<caption>용어사전상세조회</caption>
  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap >용어명&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
    	<c:out value="${result.wordNm}"/>
    </td>
  </tr>

  <tr>
    <th scope="row" height="23" class="required_text" >영문명&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
    	<c:out value="${result.engNm}"/>
    </td>
  </tr>

  <tr>
    <th scope="row" height="23" class="required_text" ><label for="wordDc">용어설명&nbsp;&nbsp;</label></th>
    <td width="80%" nowrap>
      <textarea name="wordDc" class="textarea"  cols="300" rows="15"  style="width:450px;" readonly title="용어설명"><c:out value="${result.wordDc}"/></textarea>
    </td>
  </tr>

  <tr>
    <th scope="row" height="23" class="required_text" >동의어&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
    	<c:out value="${result.synonm}"/>
    </td>
  </tr>

  <tr>
    <th scope="row" height="23" class="required_text" >등록일자&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
    	<c:out value="${result.frstRegisterPnttm}"/>
    </td>
  </tr>

  <tr>
    <th scope="row" height="23" class="required_text" >등록자&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
    	<c:out value="${result.emplyrNm}"/>
    </td>
  </tr>

</table>

<!-- 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="10px"></td>
</tr>
</table>

<!-- 목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td><span class="button"><input type="submit" value="<spring:message code="button.update" />" onclick="fn_egov_updt_worddicary('<c:out value="${result.wordId}"/>'); return false;"></span></td>
  <td>&nbsp;&nbsp;</td>
  <td><span class="button"><a href="<c:url value='/uss/olh/wor/WordDicaryDelete.do'/>?wordId=<c:out value='${result.wordId}'/>" onclick="fn_egov_delete_worddicary('<c:out value="${result.wordId}"/>'); return false;"><spring:message code="button.delete" /></a></span></td>
  <td>&nbsp;&nbsp;</td>
  <td><span class="button"><a href="<c:url value='/uss/olh/wor/WordDicaryListInqire.do'/>" onclick="fn_egov_inqire_worddicarylist(); return false;"><spring:message code="button.list" /></a></span></td>
  <td>&nbsp;&nbsp;</td>
</tr>
</table>

<input name="wordId" type="hidden" value="">
</form>
</DIV>

</body>
</html>
