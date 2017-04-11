<%
 /**
  * @Class Name : EgovCpyrhtPrtcPolicyCnUpdt.jsp
  * @Description : EgovCpyrhtPrtcPolicyCnUpdt 화면
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
<title>저작권보호정책 수정</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="cpyrhtPrtcPolicyVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_cpyrhtprtcpolicycn(){

	// 첫 입력란에 포커스..
	cpyrhtPrtcPolicyVO.cpyrhtPrtcPolicyCn.focus();

}

/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_updt_cpyrhtprtcpolicycn(form, cpyrhtId){

	// 서버사이드 테스트용
	/*
		form.action = "<c:url value='/uss/sam/cpy/CpyrhtPrtcPolicyCnUpdt.do'/>";
		form.submit();
		return;
	*/

	if (!validateCpyrhtPrtcPolicyVO(form)) {

		return;

	} else {

		form.cpyrhtId.value = cpyrhtId;
		form.action = "<c:url value='/uss/sam/cpy/CpyrhtPrtcPolicyCnUpdt.do'/>";
		form.submit();

	}

}

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_inqire_cpyrhtprtcpolicylist() {

	cpyrhtPrtcPolicyVO.action = "<c:url value='/uss/sam/cpy/CpyrhtPrtcPolicyListInqire.do'/>";
	cpyrhtPrtcPolicyVO.submit();

}


</script>
</head>
<body onLoad="fn_egov_initl_cpyrhtprtcpolicycn();">
<DIV id="content" style="width:712px">
<!-- 상단타이틀 -->
<form:form commandName="cpyrhtPrtcPolicyVO" action="${pageContext.request.contextPath}/uss/sam/cpy/CpyrhtPrtcPolicyCnUpdt.do" method="post">

<!-- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="left" alt="제목아이콘이미지">&nbsp;저작권보호정책내용수정</h1></td>
 </tr>
</table>

<!-- 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<!-- 등록  폼 영역  -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register"  summary="이 표는  저작권보호정책내용 정보를  수정하기 위한 표이며, 저작권보호정책내용 정보로 구성되어 있습니다 .">
  <caption>저작권보호정책내용 수정</caption>
  <tr>
    <th scope="row" height="23" class="required_text" width="25%"><label for="cpyrhtPrtcPolicyCn">저작권보호정책내용</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수항목"></th>
    <td>
      <form:textarea path="cpyrhtPrtcPolicyCn" cols="70" rows="20" cssClass="txaClass"  title="저작권보호정책내용"/>
      <div><form:errors path="cpyrhtPrtcPolicyCn"/></div>
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
  <td><span class="button"><input type="submit" value="<spring:message code="button.update" />" onclick="fn_egov_updt_cpyrhtprtcpolicycn(document.forms[0],'<c:out value="${result.cpyrhtId}"/>'); return false;"></span></td>
  <td>&nbsp;&nbsp;</td>
  <td><span class="button"><a href="<c:url value='/uss/sam/cpy/CpyrhtPrtcPolicyListInqire.do'/>" onclick="fn_egov_inqire_cpyrhtprtcpolicylist(); return false;"><spring:message code="button.list" /></a></span></td>
  <td>&nbsp;&nbsp;</td>
</tr>
</table>

<input name="cpyrhtId" type="hidden" value="">

</form:form>
</DIV>

</body>
</html>
