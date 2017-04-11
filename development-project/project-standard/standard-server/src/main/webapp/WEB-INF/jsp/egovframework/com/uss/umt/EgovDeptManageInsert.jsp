<%--
/**
 * @Class Name  : EgovRoleUpdate.java
 * @Description : EgovRoleUpdate jsp
 * @Modification Information
 * @
 * @  수정일         수정자          수정내용
 * @ -------    --------    ---------------------------
 * @ 2009.02.01    lee.m.j          최초 생성
 *
 *  @author lee.m.j
 *  @since 2009.03.11
 *  @version 1.0
 *  @see
 *
 *  Copyright (C) 2009 by MOPAS  All right reserved.
 */
 --%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<title>부서 등록</title>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="deptManage" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">

function fncSelectDeptManageList() {
    var varFrom = document.getElementById("deptManage");
    varFrom.action = "<c:url value='/uss/umt/dpt/selectDeptManageList.do'/>";
    varFrom.submit();
}

function fncDeptManageInsert() {
	var varFrom = document.getElementById("deptManage");
	varFrom.action = "<c:url value='/uss/umt/dpt/addDeptManage.do'/>";

	if (confirm("저장 하시겠습니까?")) {
		if (!validateDeptManage(varFrom)) {
			return;
		} else {
			varFrom.submit();
		}
	}
}
</script>
</head>

<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<div id="border" style="width:730px">
<table border="0">
  <tr>
    <td width="700">
<form:form commandName="deptManage" method="post" action="${pageContext.request.contextPath}/uss/umt/dpt/addDeptManage.do' />" enctype="multipart/form-data">
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="90%" class="title_left">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지">&nbsp;부서 등록
  </td>
 </tr>
</table>

<table width="100%" cellpadding="8" class="table-line">
  <tr>
    <th class="required_text" width="20%" nowrap>부서ID<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
    <td class="lt_text" nowrap><input name="orgnztId" id="orgnztId" type="text" size="30" class="readOnlyClass" readonly title="부서ID"></td>
  </tr>
  <tr>
    <th class="required_text" width="20%" nowrap>부서명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
    <td class="lt_text" nowrap>
        <input name="orgnztNm" id="orgnztNm" type="text" maxLength="10" size="30" >&nbsp;<form:errors path="orgnztNm" title="부서명"/></td>
  </tr>
  <tr>
    <th class="required_text" width="20%" nowrap>설명<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="선택입력표시"></th>
    <td class="lt_text" nowrap><input name="orgnztDc" id="orgnztDc" type="text" maxLength="255" size="50" >&nbsp;<form:errors path="orgnztDc" title="설명"/></td>
  </tr>
</table>

<table width="100%" cellpadding="8">
  <tr>
    <td align="center">
	   <table border="0" cellspacing="0" cellpadding="0">
	    <tr>
	      <td><span class="button"><input type="submit" value="<spring:message code="button.save" />" onclick="fncDeptManageInsert(); return false;"></span></td>
	      <td>&nbsp;&nbsp;</td>
	      <td><span class="button"><a href="<c:url value='/uss/umt/dpt/selectDeptManageList.do'/>?pageIndex=<c:out value='${deptManageVO.pageIndex}'/>&amp;searchKeyword=<c:out value="${deptManageVO.searchKeyword}"/>&amp;searchCondition=1" onclick="fncSelectDeptManageList(); return false;"><spring:message code="button.list" /></a></span></td>
	    </tr>
	   </table>
   </td>
  </tr>
</table>
<!-- 검색조건 유지 -->
<input type="hidden" name="searchCondition" value="<c:out value='${deptManageVO.searchCondition}'/>" >
<input type="hidden" name="searchKeyword" value="<c:out value='${deptManageVO.searchKeyword}'/>" >
<input type="hidden" name="pageIndex" value="<c:out value='${deptManageVO.pageIndex}'/>" >
<!-- 검색조건 유지 -->
</form:form>
</td>
</tr>
</table>
</DIV>
</body>
</html>

