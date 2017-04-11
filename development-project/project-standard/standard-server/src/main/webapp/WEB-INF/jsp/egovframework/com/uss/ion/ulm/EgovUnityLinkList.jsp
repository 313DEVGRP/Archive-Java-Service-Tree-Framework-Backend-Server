<%--
  Class Name : EgovUnityLinkList.jsp
  Description : 통합링크관리 목록 페이지
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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ImgUrl" value="${pageContext.request.contextPath}/images/egovframework/com/cmm/"/>
<c:set var="CssUrl" value="${pageContext.request.contextPath}/css/egovframework/com/" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>EGOV-COM</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css">
<link type="text/css" rel="stylesheet" href="${CssUrl}button.css">
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/uss/ion/ulm/listUnityLink.do'/>";
   	document.listForm.submit();
}

/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_detail_UnityLink(unityLinkId){
	var vFrom = document.listForm;
	vFrom.unityLinkId.value = unityLinkId;
	vFrom.action = "<c:url value='/uss/ion/ulm/detailUnityLink.do' />";
	vFrom.submit();
}

/* ********************************************************
 * 검색 함수
 ******************************************************** */
function fn_egov_search_UnityLink(){
	var vFrom = document.listForm;

	vFrom.action = "<c:url value='/uss/ion/ulm/listUnityLink.do' />";
	vFrom.submit();

}
</script>

</head>

<DIV id="content" style="width:712px">
<%-- noscript 테그 --%>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<form name="listForm" action="<c:url value='/uss/ion/ulm/listUnityLink.do'/>" method="post">
<table width="100%" cellpadding="1" class="table-search" border="0">
 <tr>
  <td class="title_left">

   <img src="<c:out value="${ImgUrl}" />icon/tit_icon.gif" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지">&nbsp;통합링크관리 목록</td>
  <th>
  </th>
  <td width="110px">
   	<select name="searchCondition" class="select" style="width:100%" title="검색조건선택">
		   <option value=''>--선택하세요--</option>
		   <option value='UNITY_LINK_NM' <c:if test="${searchCondition == 'UNITY_LINK_NM'}">selected</c:if>>통합링크명</option>
		   <option value='UNITY_LINK_DC' <c:if test="${searchCondition == 'UNITY_LINK_DC'}">selected</c:if>>통합링크설명</option>
	   </select>
	</td>
  <td width="180px">
    <input name="searchKeyword" type="text" size="10" value="" maxlength="35" style="width:100%" title="검색단어입력">
  </td>
   <td>&nbsp;</td>
  <th width="70px" align="center">
   <table border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>

      <td nowrap>
      <span class="button"><input type="submit" value="<spring:message code="button.inquire" />" onclick="fn_egov_search_UnityLink(); return false;"></span>
      </td>

      <td>&nbsp;</td>
      <td><img src="<c:out value="${ImgUrl}" />btn/bu2_left.gif" width="8" height="20" alt="버튼이미지"></td>
      <td class="btnBackground" nowrap><a href="<c:url value='/uss/ion/ulm/registUnityLink.do' />?pageIndex=<c:out value='${searchVO.pageIndex}' />"><spring:message code="button.create" /></a>
      </td>
      <td><img src="<c:out value="${ImgUrl}" />btn/bu2_right.gif" width="8" height="20" alt="버튼이미지"></td>
      <td>&nbsp;</td>
    </tr>
   </table>
  </th>
 </tr>
</table>
<input name="unityLinkId" type="hidden" value="">
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
</form>

<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<table width="100%" cellpadding="0" class="table-line" border="0">
<thead>
  <tr>
    <th class="title" width="35px" nowrap>순번</th>
    <th class="title" width="60px" nowrap>그룹</th>
    <th class="title" width="150px" nowrap>통합링크명</th>
    <th class="title" nowrap>통합링크URL</th>
    <th class="title" width="70px" nowrap>등록자</th>
    <th class="title" width="70px" nowrap>등록일자</th>
  </tr>
</thead>
<tbody>
<%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>

<c:if test="${fn:length(resultList) == 0}">
<tr>
<td class="lt_text3" colspan="6">
	<spring:message code="common.nodata.msg" />
</td>
</tr>
</c:if>
 <%-- 데이터를 화면에 출력해준다 --%>
<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
<tr>
    <td class="lt_text3" nowrap><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
    <td class="lt_text3">
 	<c:forEach items="${unityLinkSeCodeList}" var="resultInfo1" varStatus="pollKindStatus">
		<c:if test="${resultInfo1.code eq resultInfo.unityLinkSeCode}">
		<c:out value="${resultInfo1.codeNm}" escapeXml="false" />
		</c:if>
	</c:forEach>
    <td class="lt_text3L" nowrap>
    	<form name="subForm" method="post" action="<c:url value='/uss/ion/ulm/detailUnityLink.do'/>">
		<input name="unityLinkId" type="hidden" value="${resultInfo.unityLinkId}">
		<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
		<span class="link"><input type="submit" style="width:300px;text-align:left;" value="<c:out value="${resultInfo.unityLinkNm}"/>" onclick="fn_egov_detail_UnityLink('<c:out value="${resultInfo.unityLinkId}"/>'); return false;"></span>
    	</form>
    </td>
    <td class="lt_text"><c:out value="${resultInfo.unityLinkUrl}"/></td>
    <td class="lt_text3"><c:out value="${resultInfo.frstRegisterNm}"/></td>
    <td class="lt_text3"><c:out value="${fn:substring(resultInfo.frstRegisterPnttm, 0, 10)}"/></td>
</tr>
</c:forEach>
</tbody>
</table>

<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<div align="center">
	<div>
		<ui:pagination paginationInfo = "${paginationInfo}"
				type="image"
				jsFunction="linkPage"
				/>
	</div>
</div>

</DIV>

</body>
</html>
