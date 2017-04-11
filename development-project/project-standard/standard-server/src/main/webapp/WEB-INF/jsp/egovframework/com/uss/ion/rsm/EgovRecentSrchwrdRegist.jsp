<%--
  Class Name : EgovRecentSrchwrdRegist.jsp
  Description : 최근검색어관리 등록 페이지
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2008.03.09    장동한          최초 생성

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
<c:set var="ImgUrl" value="${pageContext.request.contextPath}/images/egovframework/com/cmm/"/>
<c:set var="CssUrl" value="${pageContext.request.contextPath}/css/egovframework/com/" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>최근검색어관리 관리</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css">
<link type="text/css" rel="stylesheet" href="${CssUrl}button.css">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />"></script>
<validator:javascript formName="recentSrchwrd" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_RecentSrchwrd(){

}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_RecentSrchwrd(){
	location.href = "<c:url value='/uss/ion/rsm/listRecentSrchwrd.do' />";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_save_RecentSrchwrd(){
	var varFrom = document.recentSrchwrd;
	varFrom.action =  "<c:url value='/uss/ion/rsm/registRecentSrchwrd.do' />";
	if(confirm("<spring:message code="common.save.msg" />")){

		if(!validateRecentSrchwrd(varFrom)){
			return;
		}else{
			varFrom.submit();
		}
	}
}



</script>
</head>
<body onLoad="fn_egov_init_RecentSrchwrd()">
<DIV id="content" style="width:712px">
<%-- noscript 테그 --%>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<!--  상단타이틀 -->
<form:form commandName="recentSrchwrd" name="recentSrchwrd" action="${pageContext.request.contextPath}/uss/ion/rsm/registRecentSrchwrd.do" method="post">
<!-- ----------------- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0" summary="상단 타이틀을 제공한다.">
 <tr>
  <td width="100%"class="title_left">
   <img src="${ImgUrl}icon/tit_icon.gif" width="16" height="16" hspace="3" align="middle" alt="최근검색어관리 등록">&nbsp;최근검색어관리 등록</td>
 </tr>
</table>
<!--  줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0" summary="화면 줄간격을 조정한다.">
<tr>
	<td height="3px"></td>
</tr>
</table>
<!--  등록  폼 영역  -->

<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary=" 입력을 제공한다..">

  <tr>
    <th width="20%" height="23" class="required_text" nowrap ><label id="IdSrchwrdManageNm">최근검색어관리명</label><img src="${ImgUrl}icon/required.gif" alt="필수입력" title="필수입력" width="15" height="15"></th>
    <td width="80%">
      <form:input path="srchwrdManageNm" size="73" cssClass="txaIpt" maxlength="255"/>
      <form:errors path="srchwrdManageNm" cssClass="error"/>
    </td>
  </tr>

  <tr>
    <th width="20%" height="23" class="required_text" nowrap ><label id="IdSrchwrdManageUrl">최근검색어관리URL</label><img src="${ImgUrl}icon/required.gif" alt="필수입력" title="필수입력" width="15" height="15"></th>
    <td width="80%">
      <form:input path="srchwrdManageUrl" size="73" cssClass="txaIpt" maxlength="255"/>
      <form:errors path="srchwrdManageUrl" cssClass="error"/>
    </td>
  </tr>

  <tr>
    <th width="20%" height="23" class="required_text" nowrap ><label id="IdSrchwrdManageUseYn">사용자검색여부</label><img src="${ImgUrl}icon/required.gif" alt="필수입력" title="필수입력" width="15" height="15"></th>
    <td width="80%">
			<select name="srchwrdManageUseYn" title="사용자검색여부선택">
			<option value="">선택</option>
			<option value="N">N</option>
			<option value="Y">Y</option>
			</select>
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
<table border="0" cellspacing="0" cellpadding="0" align="center" summary="목록/저장 버튼을 제공한다.">
<tr>
  <td><img src="${ImgUrl}btn/bu2_left.gif"  width="8" height="20" alt="버튼이미지"></td>
  <td class="btnBackground" nowrap><a href="<c:url value='/uss/ion/rsm/listRecentSrchwrd.do' />"><spring:message code="button.list" /></a>
  </td>
  <td><img src="${ImgUrl}btn/bu2_right.gif"  width="8" height="20" alt="버튼이미지"></td>
  <td>&nbsp;</td>

  <td nowrap>
  <span class="button"><input type="submit" value="<spring:message code="button.save" />" onclick="fn_egov_save_RecentSrchwrd(); return false;"></span>
  </td>

</tr>
</table>
</center>

<input name="cmd" type="hidden" value="<c:out value='save'/>"/>
</form:form>
</DIV>

</body>
</html>
