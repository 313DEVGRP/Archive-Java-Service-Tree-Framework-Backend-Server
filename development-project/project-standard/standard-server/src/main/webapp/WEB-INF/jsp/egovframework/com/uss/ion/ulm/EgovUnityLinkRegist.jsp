<%--
  Class Name : EgovUnityLinkRegist.jsp
  Description : 통합링크관리 등록 페이지
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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="ImgUrl" value="${pageContext.request.contextPath}/images/egovframework/com/cmm/"/>
<c:set var="CssUrl" value="${pageContext.request.contextPath}/css/egovframework/com/" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>통합링크관리 관리</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css">
<link type="text/css" rel="stylesheet" href="${CssUrl}button.css">
<script type="text/javascript" src="<c:url value="/validator.do"/>" ></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />" ></script>
<validator:javascript formName="unityLink" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">
//웹에디터설정
_editor_area = "unityLinkDc";
_editor_url = "<c:url value='/html/egovframework/com/cmm/utl/htmlarea3.0/'/>";
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_UnityLink(){

}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_save_UnityLink(){
	var varFrom = document.unityLink;
	varFrom.onsubmit();
	if(confirm("<spring:message code="common.save.msg" />")){
		varFrom.action =  "<c:url value='/uss/ion/ulm/registUnityLink.do' />";
		if(!validateUnityLink(varFrom)){
			return;
		}else{
			varFrom.submit();
		}
	}
}


</script>
<script type="text/javascript" src="<c:url value='/html/egovframework/com/cmm/utl/htmlarea3.0/htmlarea.js'/>"></script>
<style TYPE="text/css">
.txaClass2 {width:550px; height:350px;}
.noStyle {background:ButtonFace; BORDER-TOP:0px; BORDER-bottom:0px; BORDER-left:0px; BORDER-right:0px;}
.noStyle th{background:ButtonFace; padding-left:0px;padding-right:0px}
.noStyle td{background:ButtonFace; padding-left:0px;padding-right:0px}
</style>
</head>
<body onLoad="fn_egov_init_UnityLink();HTMLArea.init(); HTMLArea.onload = initEditor;">
<DIV id="content" style="width:712px">
<%-- noscript 테그 --%>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<!--  상단타이틀 -->
<form:form commandName="unityLink" name="unityLink" action="${pageContext.request.contextPath}/uss/ion/ulm/registUnityLink.do" enctype="multipart/form-data" >
<!-- ----------------- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0" summary="상단 타이틀을 제공한다.">
 <tr>
  <td width="100%"class="title_left">
   <img src="${ImgUrl}icon/tit_icon.gif" width="16" height="16" hspace="3" align="middle" alt=" ">&nbsp;통합링크관리 등록</td>
 </tr>
</table>
<!--  줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0" summary=" 수정을 제공한다.">
<tr>
	<td height="3px"></td>
</tr>
</table>
<!--  등록  폼 영역  -->

<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="통합링크관리 입력을 제공한다..">
  <tr>
    <th width="20%" height="23" class="required_text" nowrap ><label id="IdUnityLinkNm">통합링크명</label><img src="${ImgUrl}icon/required.gif" alt="필수입력" title="필수입력" width="15" height="15"></th>
    <td width="80%">
      <form:input path="unityLinkNm" size="73" cssClass="txaIpt" maxlength="255"/>
      <form:errors path="unityLinkNm" cssClass="error"/>
    </td>
  </tr>

  <tr>
    <th height="23" class="required_text" ><label id="IdUnityLinkSeCode">통합링크그룹</label><img src="${ImgUrl}icon/required.gif" alt="필수입력" title="필수입력" width="15" height="15"></th>
    <td>
        <form:select path="unityLinkSeCode">
            <form:option value="" label="선택"/>
            <form:options items="${unityLinkSeCodeList}" itemValue="code" itemLabel="codeNm"/>
        </form:select>

    </td>
  </tr>

  <tr>
    <th width="20%" height="23" class="required_text" nowrap ><label id="IdUnityLinkUrl">통합링크URL</label><img src="${ImgUrl}icon/required.gif" alt="필수입력" title="필수입력" width="15" height="15"></th>
    <td width="80%">
      <form:input path="unityLinkUrl" size="73" cssClass="txaIpt" maxlength="255"/>
      <form:errors path="unityLinkUrl" cssClass="error"/>
    </td>
  </tr>

  <tr>
    <th width="20%" height="23" class="required_text" nowrap ><label id="IdUnityLinkDc">통합링크설명</label><img src="${ImgUrl}icon/required.gif" alt="필수입력" title="필수입력" width="15" height="15"></th>
    <td width="80%">
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="noStyle">
		<tr><td>
		   <form:textarea path="unityLinkDc" rows="75" cols="14" cssClass="txaClass2"/>
			<form:errors path="unityLinkDc" cssClass="error"/>
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
<!--  목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center" summary="목록/저장버튼을 제공한다.">
<tr>
  <td><img src="${ImgUrl}btn/bu2_left.gif"  width="8" height="20" alt="버튼이미지"></td>
  <td class="btnBackground" nowrap><a href="<c:url value='/uss/ion/ulm/listUnityLink.do' />"><spring:message code="button.list" /></a>
  </td>
  <td><img src="${ImgUrl}btn/bu2_right.gif"  width="8" height="20" alt="버튼이미지"></td>
  <td>&nbsp;</td>
  

  <td class="btnBackground" nowrap>
  	<span class="button"><input type="submit" value="<spring:message code="button.save" />" onclick="fn_egov_save_UnityLink(); return false;" ></span>
  </td>

  
</tr>
</table>
</center>

<input name="cmd" type="hidden" value="<c:out value='save'/>"/>
</form:form>
</DIV>

</body>
</html>
