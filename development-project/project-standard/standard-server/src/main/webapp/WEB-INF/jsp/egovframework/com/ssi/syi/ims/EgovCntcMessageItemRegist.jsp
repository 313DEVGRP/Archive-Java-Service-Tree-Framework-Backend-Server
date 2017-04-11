<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
 /**
  * @Class Name  : EgovCntcMessageItemRegist.jsp
  * @Description : EgovCntcMessageItemRegist 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.08.11   이중호              최초 생성
  *
  *  @author 공통컴포넌트팀
  *  @since 2009.08.11
  *  @version 1.0
  *  @see
  *
  *  Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<html lang="ko">
<head>
<title>연계메시지항목 등록</title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>

<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="cntcMessageItem" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">
<!--
/* ********************************************************
 * 등록처리
 ******************************************************** */
function fn_egov_regist_CntcMessageItem(form){
	if(confirm("<spring:message code='common.save.msg' />")){
		if(!validateCntcMessageItem(form)){
			return;
		}else{
			form.submit();
		}
	}
}
-->
</script>
</head>

<body>
<DIV id="content" style="width:712px">
<%-- noscript 테그 --%>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<!-- 상단타이틀 -->
<form:form commandName="cntcMessageItem" name="cntcMessageItem" method="post">
<input name="cmd" type="hidden" value="<c:out value='Regist'/>"/>
<form:hidden path="cntcMessageId"/>

<!-- 상단 타이틀  영역 -->
<table width="700" cellpadding="8" class="table-search" border="0" summary="상단 타이틀을 제공한다.">
 <tr>
  <td width="100%"class="title_left">
   	<h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;연계메시지항목 등록</h1>
  </td>
 </tr>
</table>
<!-- 줄간격조정  -->
<table width="700" cellspacing="0" cellpadding="0" border="0" summary="화면 줄간격을 조정한다.">
<tr>
	<td height="3px"></td>
</tr>
</table>

<!-- 등록  폼 영역  -->
<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="연계메시지항목  등록을 제공한다.">
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >연계메시지<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td width="80%" nowrap>
		<select name="cntcMessageId" class="select" disabled="disabled" title="연계메시지 선택">
			<c:forEach var="result" items="${cntcMessageList}" varStatus="status">
				<option value='<c:out value="${result.cntcMssageId}"/>' <c:if test="${result.cntcMessageId == cntcMessageItem.cntcMessageId}">selected="selected"</c:if> ><c:out value="${result.cntcMessageNm}"/></option>
			</c:forEach>
		</select>
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >항목ID<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td width="80%" nowrap>
      <form:input  path="itemId" title="항목ID" size="20" maxlength="20" readonly="readonly" cssClass="readOnlyClass"/>
      <form:errors path="itemId"/>
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >항목명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td width="80%" nowrap>
      <form:input  path="itemNm" title="항목명" size="0" maxlength="60"/>
      <form:errors path="itemNm"/>
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" nowrap >항목타입</th>
    <td width="80%" nowrap>
      <form:input  path="itemType" title="항목타입" size="20" maxlength="20"/>
      <form:errors path="itemType"/>
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" nowrap >항목길이</th>
    <td width="80%" nowrap>
      <form:input  path="itemLt" title="항목길이" size="8" maxlength="8"/>
      <form:errors path="itemLt"/>
    </td>
  </tr>
</table>
<table width="700" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="10"></td>
  </tr>
</table>

<!-- 줄간격조정  -->
<table width="700" cellspacing="0" cellpadding="0" border="0" summary="화면 줄간격을 조정한다.">
<tr><td height="3px"></td></tr>
<tr>
	<td>
		<!-- 목록/저장버튼  -->
		<table border="0" cellspacing="0" cellpadding="0" align="center" summary="목록/저장 버튼을 제공한다.">
		<tr>
		  <td><span class="button">
		  <input type="submit" value="저장" title="저장" onclick="fn_egov_regist_CntcMessageItem(document.cntcMessageItem); return false;" ></span></td>
		  <td width="10"></td>

		  <td><span class="button"><a href="<c:url value='/ssi/syi/ims/getCntcMessageList.do'/>">목록</a></span></td>
		</tr>
		</table>
	</td>
</tr>
</table>

</form:form>
</DIV>
</body>
</html>
