<%
 /**
  * @Class Name : EgovWordDicaryUpdt.jsp
  * @Description : EgovWordDicaryUpdt 화면
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
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>용어사전수정</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="wordDicaryVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_worddicary(){

	// 첫 입력란에 포커스..
	wordDicaryVO.wordNm.focus();

}

/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_updt_worddicary(form, wordId){

	// 서버사이드 테스트용
/*
	form.action = "<c:url value='/uss/olh/wor/WordDicaryRegist.do'/>";
	form.submit();
	return;
*/

	if (!validateWordDicaryVO(form)) {

		return;

	} else {


		form.wordId.value = wordId;
		form.action = "<c:url value='/uss/olh/wor/WordDicaryUpdt.do'/>";
		form.submit();

	}


}

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_inqire_worddicarylist() {

	wordDicaryVO.action = "<c:url value='/uss/olh/wor/WordDicaryListInqire.do'/>";
	wordDicaryVO.submit();

}


</script>
</head>
<body onLoad="fn_egov_initl_worddicary();">
<DIV id="content" style="width:700px">
<!-- 상단타이틀 -->
<form:form commandName="wordDicaryVO" action="${pageContext.request.contextPath}/uss/olh/wor/WordDicaryUpdt.do">

<!-- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <h1>	<img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" alt="">&nbsp;용어사전수정</h1></td>
 </tr>
</table>

<!-- 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<!-- 등록  폼 영역  -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="용어사전에 대한 정보를 수정합니다.">
<caption>용어사전수정</caption>
  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="wordNm">용어명</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수항목"></th>
    <td width="80%" nowrap>
        <form:input path="wordNm" size="60" maxlength="60" title="용어명" />
    	<div><form:errors path="wordNm"/></div>
    </td>
  </tr>

  <tr>
    <th scope="row" height="23" class="required_text" ><label for="engNm">영문명</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수항목"></th>
    <td>
      <form:input path="engNm" size="60" maxlength="60" title="영문명" />
      <div><form:errors path="engNm"/></div>
    </td>
  </tr>

  <tr>
    <th scope="row" height="23" class="required_text" ><label for="wordDc">용어설명</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수항목"></th>
    <td>
      <form:textarea path="wordDc" cols="200" rows="15" cssClass="txaClass" title="용어설명" />
      <div><form:errors path="wordDc"/></div>
    </td>
  </tr>

  <tr>
    <th scope="row" height="23" class="required_text" ><label for="synonm">동의어</label>&nbsp;&nbsp;</th>
    <td>
      <form:input path="synonm" size="60" maxlength="60" title="동의어" />
      <div><form:errors path="synonm"/></div>
    </td>
  </tr>


</table>

<!-- 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<!-- 목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td><span class="button"><input type="submit" value="<spring:message code="button.update" />" onclick="fn_egov_updt_worddicary(document.forms[0],'<c:out value="${result.wordId}"/>'); return false;"></span></td>
  <td>&nbsp;&nbsp;</td>
  <td><span class="button"><a href="<c:url value='/uss/olh/wor/WordDicaryListInqire.do'/>" onclick="fn_egov_inqire_worddicarylist(); return false;"><spring:message code="button.list" /></a></span></td>
  <td>&nbsp;&nbsp;</td>
</tr>
</table>

<input name="wordId" type="hidden" value="">

</form:form>
</DIV>

</body>
</html>
