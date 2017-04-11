<%--
  Class Name : EgovIndvdlInfoPolicyDetail.jsp
  Description : 개인정보보호정책 상세보기
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2008.03.09    장동한          최초 생성
 
    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.09
   
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ImgUrl" value="/images/egovframework/com/uss/sam/ipm/"/>
<c:set var="CssUrl" value="/css/egovframework/com/uss/sam/ipm/"/>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>개인정보보호정책 관리</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" >
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />">

<script type="text/javaScript" language="javascript">


/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_IndvdlInfoPolicy(){

}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_IndvdlInfoPolicy(){
	location.href = "<c:url value='/uss/sam/ipm/listIndvdlInfoPolicy.do' />";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_modify_IndvdlInfoPolicy(){
	var vFrom = document.IndvdlInfoPolicyForm;
	vFrom.cmd.value = '';
	vFrom.action = "<c:url value='/uss/sam/ipm/updtIndvdlInfoPolicy.do' />";;
	vFrom.submit();

}
/* ********************************************************
 * 삭제처리
 ******************************************************** */
function fn_egov_delete_IndvdlInfoPolicy(){
	var vFrom = document.IndvdlInfoPolicyForm;
	if(confirm("삭제 하시겠습니까?")){
		vFrom.cmd.value = 'del';
		vFrom.action = "<c:url value='/uss/sam/ipm/detailIndvdlInfoPolicy.do' />";
		vFrom.submit();
	}else{
		vFrom.cmd.value = '';
	}
}
</script>
</head>
<body onLoad="fn_egov_init_IndvdlInfoPolicy();">
<DIV id="content" style="width:712px">
<%-- noscript 테그 --%>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<!--  상단타이틀 -->
<form name="IndvdlInfoPolicyForm" action="<c:url value=''/>" method="post">
<!-- ----------------- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif'/>" width="16" height="16" hspace="3" align="middle" alt="개인정보보호정책 상세보기">&nbsp;개인정보보호정책 상세보기</td>
 </tr>
</table>
<!--  줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<!--  등록  폼 영역  -->

<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register">

  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >개인정보보호정책 명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%">
		 <c:out value="${indvdlInfoPolicy.indvdlInfoNm}" />
    </td>
  </tr>  
  
  <tr> 
    <th height="23" class="required_text" >동의여부<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
    <td>
    <c:if test="${indvdlInfoPolicy.indvdlInfoYn == 'Y'}">예</c:if>
    <c:if test="${indvdlInfoPolicy.indvdlInfoYn == 'N'}">아니오</c:if>
    </td>
  </tr> 
  
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >개인정보보호정책  내용<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%">

		<table width="500px" border="0" cellpadding="0" cellspacing="0" style="table-layout:fixed">
		<tr>
			<td>
			<c:out value="${indvdlInfoPolicy.indvdlInfoDc}" escapeXml="false" />	
		    </td>
		  </tr>
		</table>

    </td>
  </tr>
</table>
<input name="indvdlInfoId" type="hidden" value="${indvdlInfoPolicy.indvdlInfoId}">
<input name="cmd" type="hidden" value="<c:out value=''/>"/>
</form>

<!--  줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<center>
<!--  수정/저장/목록 버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
	<td>
		<form name="formUpdt" action="<c:url value='/uss/sam/ipm/updtIndvdlInfoPolicy.do'/>" method="post"> 
		<span class="button"><input type="submit" value="<spring:message code="button.update" />" onclick="fn_egov_modify_IndvdlInfoPolicy(); return false;"></span>
		<input name="indvdlInfoId" type="hidden" value="${indvdlInfoPolicy.indvdlInfoId}">
		</form>
	</td>
	<td width="3"></td>
	<td>
		<form name="formDelete" action="<c:url value='/uss/sam/ipm/detailIndvdlInfoPolicy.do'/>" method="post"> 
		<span class="button"><input type="submit" value="<spring:message code="button.delete" />" onclick="fn_egov_delete_IndvdlInfoPolicy(); return false;"></span>
		<input name="indvdlInfoId" type="hidden" value="${indvdlInfoPolicy.indvdlInfoId}">
		<input name="cmd" type="hidden" value="<c:out value='del'/>">
		</form>
	</td>
	<td width="3"></td>
	<td> 
		<form name="formList" action="<c:url value='/uss/sam/ipm/listIndvdlInfoPolicy.do'/>" method="post">
		<span class="button"><input type="submit" value="<spring:message code="button.list" />" onclick="fn_egov_list_IndvdlInfoPolicy(); return false;"></span>
		</form>
	</td>
</tr>
</table>

<!--  줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>


</center>

</DIV>

</body>
</html>
