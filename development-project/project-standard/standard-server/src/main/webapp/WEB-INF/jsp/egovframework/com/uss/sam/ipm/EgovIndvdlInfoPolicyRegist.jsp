<%--
  Class Name : EgovIndvdlInfoPolicyRegist.jsp
  Description : 개인정보보호정책 등록 페이지
  Modification Information

      수정일         수정자                   수정내용
    -----------    -------------    ---------------------------
     2008.03.09    장동한                  최초 생성
     2014.12.08    표준프레임워크          웹에디터(WYSIWYG) 적용

    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.09

--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="ckeditor" uri="http://ckeditor.com" %>
<c:set var="ImgUrl" value="/images/egovframework/com/uss/sam/ipm/"/>
<c:set var="CssUrl" value="/css/egovframework/com/uss/sam/ipm/"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>개인정보보호정책 관리</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />">

<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />"></script>
<validator:javascript formName="indvdlInfoPolicy" staticJavascript="false" xhtml="true" cdata="false"/>
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
function fn_egov_save_IndvdlInfoPolicy(){
	var varFrom = document.indvdlInfoPolicy;
	varFrom.onsubmit();
	if(confirm("<spring:message code="common.save.msg" />")){
		varFrom.action =  "<c:url value='/uss/sam/ipm/registIndvdlInfoPolicy.do' />";
		if(!validateIndvdlInfoPolicy(varFrom)){
			return;
		}else{
			varFrom.submit();
		}
	}
}


</script>
<style TYPE="text/css">
.txaClass2 {width:550px; height:350px;}
.noStyle {background:ButtonFace; BORDER-TOP:0px; BORDER-bottom:0px; BORDER-left:0px; BORDER-right:0px;}
.noStyle th{background:ButtonFace; padding-left:0px;padding-right:0px}
.noStyle td{background:ButtonFace; padding-left:0px;padding-right:0px}
</style>
</head>
<body onLoad="fn_egov_init_IndvdlInfoPolicy();">
<DIV id="content" style="width:712px">
<%-- noscript 테그 --%>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<!--  상단타이틀 -->
<form:form commandName="indvdlInfoPolicy" name="indvdlInfoPolicy" action="${pageContext.request.contextPath}/uss/sam/ipm/registIndvdlInfoPolicy.do" method="post" enctype="multipart/form-data" >
<!-- ----------------- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0" summary="상단 타이틀을 제공한다.">
 <tr>
  <td width="100%"class="title_left">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif'/>" width="16" height="16" hspace="3" align="middle" alt="개인정보보호정책 등록">&nbsp;개인정보보호정책 등록</td>
 </tr>
</table>
<!--  줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0" summary="화면 줄간격을 조정한다.">
<tr>
	<td height="3px"></td>
</tr>
</table>
<!--  등록  폼 영역  -->

<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="개인정보보호정책  등록을 제공한다.">

  <tr>
    <th width="20%" height="23" class="required_text" nowrap ><label id="IdIndvdlInfoNm">개인정보보호정책 명</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%">
      <form:input path="indvdlInfoNm" size="73" cssClass="txaIpt" maxlength="255"/>
      <form:errors path="indvdlInfoNm" cssClass="error"/>
    </td>
  </tr>

  <tr>
    <th height="23" class="required_text" ><label id="IdIndvdlInfoYn">동의여부</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
    <td>
		<select title="동의여부" name="indvdlInfoYn" id="indvdlInfoYn">
			<option value="Y">예</option>
			<option value="N">아니오</option>
		</select>
    </td>
  </tr>


  <tr>
    <th width="20%" height="23" class="required_text" nowrap ><label id="IdIndvdlInfoDc">개인정보보호정책 내용</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%">
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="noStyle">
		<tr><td>
		   <form:textarea path="indvdlInfoDc" rows="75" cols="14" cssClass="txaClass2"/>
			<form:errors path="indvdlInfoDc" cssClass="error"/>
		</td></tr>
		</table>
    </td>
  </tr>
</table>

<!--  줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0" summary="화면 줄간격을 조정한다.">
<tr>
	<td height="3px"></td>
</tr>
</table>
<center>
<!--  저장/목록 버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center" summary="목록/저장 버튼을 제공한다.">
<tr>
  
  <td>
  <span class="button"><input type="submit" value="<spring:message code="button.save" />" onclick="fn_egov_save_IndvdlInfoPolicy(); return false;" ></span>
  </td>
  
  <td>&nbsp;</td>
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt="버튼이미지"></td>
  <td class="btnBackground" nowrap><a href="<c:url value='/uss/sam/ipm/listIndvdlInfoPolicy.do' />"><spring:message code="button.list" /></a>
  </td>
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
</tr>
</table>
</center>

<input name="cmd" type="hidden" value="<c:out value='save'/>">
</form:form>
</DIV>
<ckeditor:replace replace="indvdlInfoDc" basePath="${pageContext.request.contextPath}/html/egovframework/com/cmm/utl/ckeditor/" />
</body>
</html>
