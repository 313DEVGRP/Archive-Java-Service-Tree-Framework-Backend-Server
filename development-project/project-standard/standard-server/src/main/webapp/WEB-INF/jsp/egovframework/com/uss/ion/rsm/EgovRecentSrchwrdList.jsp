<%--
  Class Name : EgovRecentSrchwrdList.jsp
  Description : 최근검색어관리 목록 페이지
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2008.03.09    장동한          최초 생성
     2011.12.14    이기하          최근검색어 오류 수정

    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.09

    Copyright (C) 2009 by MOPAS  All right reserved.
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ajax" uri="http://ajaxtags.sourceforge.net/tags/ajaxtags" %>
<c:set var="ImgUrl" value="${pageContext.request.contextPath}/images/egovframework/com/cmm/"/>
<c:set var="CssUrl" value="${pageContext.request.contextPath}/css/egovframework/com/" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>최근검색어 관리</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css">
<link type="text/css" rel="stylesheet" href="${CssUrl}button.css">

<!-- Ajax Tags start -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/egovframework/com/uss/ion/rsm/prototype-1.6.0.3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/ajaxtags/js/scriptaculous/scriptaculous.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/ajaxtags/js/overlibmws/overlibmws.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/ajaxtags/js/ajaxtags.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/egovframework/com/uss/ion/rsm/recentSrchwrd.js"></script>

<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/ajaxtags/css/ajaxtags.css">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/ajaxtags/css/displaytag.css">
<!-- Ajax Tags end -->

<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/uss/ion/rsm/listRecentSrchwrd.do'/>";
   	document.listForm.submit();
}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_detail_RecentSrchwrd(srchwrdManageId){
	var vFrom = document.listForm;
	vFrom.srchwrdManageId.value = srchwrdManageId;
	vFrom.action = "<c:url value='/uss/ion/rsm/detailRecentSrchwrd.do' />";
	vFrom.submit();
}

/* ********************************************************
 * 검색 함수
 ******************************************************** */
function fn_egov_search_RecentSrchwrd(){
	var vFrom = document.listForm;

	vFrom.action = "<c:url value='/uss/ion/rsm/listRecentSrchwrd.do' />";
	vFrom.submit();

}


</script>
</head>
<body>
<DIV id="content" style="width:712px">
<%-- noscript 테그 --%>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<form name="listForm" action="<c:url value=''/>" method="post">
<table width="100%" cellpadding="1" class="table-search" border="0">
 <tr>
  <td class="title_left">

   <img src="<c:out value="${ImgUrl}" />icon/tit_icon.gif" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지">&nbsp;최근검색어관리 목록</td>
  <th>
  </th>
  <td width="140px">
   	<select name="searchCondition" id="searchCondition" class="select" style="width:100%" title="검색조건선택">
		   <option value=''>--선택하세요--</option>
		   <option value='SRCHWRD_MANAGE_NM' <c:if test="${searchCondition == 'SRCHWRD_MANAGE_NM'}">selected</c:if>>최근검색어관리명</option>
		   <option value='SRCHWRD_CONECT_URL' <c:if test="${searchCondition == 'SRCHWRD_CONECT_URL'}">selected</c:if>>최근검색어관리URL</option>
	   </select>
	</td>
  <td width="250px">
    <input name="searchKeyword" id="searchKeyword" type="text" size="10" value="" maxlength="35" style="width:100%" title="검색단어입력">
  </td>
  <th width="70px" align="center">
   <table border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
      <td><span class="button">

      <!--Ajax Tags 등록 -->
      <input type="hidden" name="rsm_url" id="rsm_url" value="<c:url value='/uss/ion/rsm/registRecentSrchwrdResult.do'/>" >
      <a href="javascript:fn_egov_regist_RecentSrchwrdResult('SRCMGR_0000000000001',$('searchKeyword').value,'fn_egov_search_RecentSrchwrd()', document.listForm)" id="btnInquire">
      	  <spring:message code="button.inquire" /></a></span>
      <!--Ajax Tags 끝 -->

      </td>
      <td>&nbsp;</td>
      <td><span class="button"><a href="<c:url value='/uss/ion/rsm/registRecentSrchwrd.do' />">
      	  <spring:message code="button.create" /></a></span>
      </td>
      <td>&nbsp;</td>
    </tr>
   </table>
  </th>
 </tr>
</table>
<input name="srchwrdManageId" type="hidden" value="">
<input name="searchMode" type="hidden" value="">
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
</form>

<!--Ajax Tags Script-->
<ajax:autocomplete
  baseUrl="${pageContext.request.contextPath}/uss/ion/rsm/listRecentSrchwrdResultSerach.do"
  source="searchKeyword"
  target="searchKeyword"
  className="autocomplete"
  parameters="srchwrdManageId=SRCMGR_0000000000001"
  minimumCharacters="1" />

<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<table width="100%" cellpadding="0" class="table-line" border="0">
<thead>
  <tr>
    <th class="title" width="35px" nowrap>순번</th>
    <th class="title" width="150px" nowrap>최근검색어관리명</th>
    <th class="title" nowrap>최근검색어관리URL</th>
    <th class="title" width="50px" nowrap>결과</th>
    <th class="title" width="70px" nowrap>등록자</th>
    <th class="title" width="70px" nowrap>등록일자</th>
  </tr>
</thead>
<tbody>
<%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>

<c:if test="${fn:length(resultList) == 0}">
<tr>
<td class="lt_text3" colspan="7">
	<spring:message code="common.nodata.msg" />
</td>
</tr>
</c:if>

 <%-- 데이터를 화면에 출력해준다 --%>
<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
<tr>
    <td class="lt_text3" nowrap><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
    <td class="lt_text3L" nowrap>
    	<form name="subForm" method="post" action="<c:url value='/uss/ion/rsm/detailRecentSrchwrd.do'/>">
    		<input name="srchwrdManageId" type="hidden" value="${resultInfo.srchwrdManageId}">
    		<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
    		<span class="link"><input type="submit" style="width:220px;text-align:left;" value="<c:out value="${resultInfo.srchwrdManageNm}"/>" onclick="fn_egov_detail_RecentSrchwrd('${resultInfo.srchwrdManageId}'); return false;"></span>
    	</form>
    </td>
    <td class="lt_text3L"><c:out value="${resultInfo.srchwrdManageUrl}"/></td>
    <td class="lt_text3">
    <form name="subFormSrchwrdResult" method="post" action="<c:url value='/uss/ion/rsm/listRecentSrchwrdResult.do'/>">
		<input name="srchwrdManageId" type="hidden" value="${resultInfo.srchwrdManageId}">
	    <span class="button"><input type="submit" style="text-align:center;cursor:pointer;cursor:hand;" value="보기"></span>
    </form>
    </td>
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
		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="linkPage" />
	</div>
</div>

</DIV>
</body>
</html>
