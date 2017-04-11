<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
 /**
  * @Class Name : EgovHpcmCnRegist.jsp
  * @Description : EgovHpcmCnRegist 화면
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
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>도움말  등록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="hpcmManageVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_hpcmcn(){

	// 첫 입력란에 포커스..
	hpcmManageVO.hpcmDf.focus();

}

/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_regist_hpcmcn(form){

	// 서버사이드 테스트용
	/*
		form.action = "<c:url value='/uss/olh/hpc/HpcmCnRegist.do'/>";
		form.submit();
		return;
	*/

		if (!validateHpcmManageVO(form)) {

			return;

		} else {

			form.hpcmSeCode.value = fn_egov_SelectBoxValue("hpcmSeCode");
			form.action = "<c:url value='/uss/olh/hpc/HpcmCnRegist.do'/>";
			form.submit();

		}

}

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_inqire_hpcmlist() {

	hpcmManageVO.action = "<c:url value='/uss/olh/hpc/HpcmListInqire.do'/>";
	hpcmManageVO.submit();

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

</head>
<body onLoad="fn_egov_initl_hpcmcn();">
<DIV id="content" style="width:700px">
<!-- 상단타이틀 -->
<form:form commandName="hpcmManageVO" action="${pageContext.request.contextPath}/uss/olh/hpc/HpcmCnRegist.do" method="post">


<!-- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="left" alt="제목아이콘이미지">&nbsp;도움말등록</h1></td>
 </tr>
</table>

<!-- 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<!-- 등록  폼 영역  -->
<table width="90%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="도움말에 대한 정보를 등록합니다.">
<caption>도움말등록</caption>
  <tr>
    <th scope="row" height="23" class="required_text" width="20%"><label for="hpcmSeCode">도움말구분</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수항목"></th>
    <td>
		<form:select path="hpcmSeCode" title="도움말구분">
			<form:option value="" label="-- 선택 --"/>
			<form:options items="${resultList}" itemValue="code" itemLabel="codeNm"/>
 		</form:select>
 		<div><form:errors path="hpcmSeCode"/></div>
    </td>
  </tr>

  <tr>
    <th scope="row" height="23" class="required_text" ><label for="hpcmDf">도움말정의</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수항목"></th>
    <td>
      <form:textarea path="hpcmDf" cols="70" rows="5" cssClass="txaClass" title="도움말정의"/>
      <div><form:errors path="hpcmDf"/></div>
    </td>
  </tr>

  <tr>
    <th scope="row" height="23" class="required_text" ><label for="hpcmDc">도움말설명</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수항목"></th>
    <td>
      <form:textarea path="hpcmDc" cols="70" rows="30" cssClass="txaClass" title="도움말설명"/>
      <div><form:errors path="hpcmDc"/></div>
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
  <td><span class="button"><input type="submit" value="<spring:message code="button.save" />" onclick="fn_egov_regist_hpcmcn(document.forms[0]); return false;"></span></td>
  <td>&nbsp;&nbsp;</td>
  <td><span class="button"><a href="<c:url value='/uss/olh/hpc/HpcmListInqire.do'/>" onclick="fn_egov_inqire_hpcmlist(); return false;"><spring:message code="button.list" /></a></span></td>
  <td>&nbsp;&nbsp;</td>
</tr>
</table>
</form:form>
</DIV>

</body>
</html>
