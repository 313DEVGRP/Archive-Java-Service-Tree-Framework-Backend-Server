<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
 /**
  * @Class Name  : EgovSystemCntcList.jsp
  * @Description : EgovSystemCntcList 화면
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
<html lang="ko">
<head>
<title>시스템연계 목록</title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>

<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />">
<script type="text/javaScript" language="javascript">
<!--
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function fn_egov_pageview(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='${selfUri}'/>";
   	document.listForm.submit();
}
/* ********************************************************
 * 조회 처리
 ******************************************************** */
function fn_egov_search_SystemCntc(){
	document.listForm.pageIndex.value = 1;
	document.listForm.action = "<c:url value='${selfUri}'/>";
   	document.listForm.submit();
}

<c:set var="detailUri" value="/ssi/syi/sim/getSystemCntcDetail.do" />
<c:set var="confirmTF" value="F"/>

/*
 * 관리자 모드 처리
 */
<c:if test="${selfUri eq '/ssi/syi/scm/getConfirmSystemCntcList.do'}">
	<c:set var="confirmTF" value="T"/>
	<c:set var="detailUri" value="/ssi/syi/scm/getConfirmSystemCntcDetail.do" />
</c:if>

/*
 * 업무사용자 모드 처리
 */
<c:if test="${selfUri eq '/ssi/syi/sim/getSystemCntcList.do'}">

/* ********************************************************
 * 등록 처리 함수
 ******************************************************** */
function fn_egov_regist_SystemCntc(){
	location.href = "<c:url value='/ssi/syi/sim/addSystemCntc.do'/>";
}
/* ********************************************************
 * 수정 처리 함수
 ******************************************************** */
function fn_egov_modify_SystemCntc(){
	location.href = "<c:url value='/ssi/syi/sim/updateSystemCntc.do'/>";
}
</c:if>


/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_detail_SystemCntc(cntcId){
	var varForm				    = document.all['Form'];
	varForm.action              = "<c:url value='${detailUri}'/>";
	varForm.cntcId.value 		= cntcId;
	varForm.submit();
}

-->
</script>
</head>

<body>
<DIV id="content" style="display">
<%-- noscript 테그 --%>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<form name="Form" action="<c:url value='${detailUri}'/>" method="post">
	<input type="hidden" name="cntcId">
</form>
<form name="listForm" action="<c:url value='${selfUri}'/>" method="post">
<table width="700" cellpadding="8" class="table-search" border="0">
 <tr>
   <td width="40%"class="title_left">

   		<h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;시스템연계 목록</h1>
   </td>
  <th>
  </th>
  <td width="10%">
   	<select name="searchCondition" class="select" title="검색조건">
		   <option selected value=''>--선택하세요--</option>
		   <option value='1' <c:if test="${searchVO.searchCondition == '1'}">selected="selected"</c:if>>시스템연계명</option>
	   </select>
	</td>
  <td width="35%">
    <input name="searchKeyword" type="text" size="35" value="<c:out value='${searchVO.searchKeyword}'/>"  maxlength="35" title="검색조건" >
  </td>
  <th width="10%">
   <table border="0" cellspacing="0" cellpadding="0">
    <tr>

      <td>
      <span class="button"><input type="submit" value="조회" title="조회" onclick="fn_egov_search_SystemCntc(); return false;"></span></td>

      <td width="10"></td>

<% /** * 일반사용자 모드 처리 */ %>
<c:if test="${confirmTF eq 'F'}">
	  <td>&nbsp;</td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif' />" alt="등록" width="8" height="20"></td>
      <td style="background-image:URL(<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif' />);" class="text_left" nowrap>
      <a href="<c:url value='/ssi/syi/sim/addSystemCntc.do?pageIndex='/><c:out value='${searchVO.pageIndex}'/>">등록</a></td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif' />" alt="등록" width="8" height="20"></td>
</c:if>

    </tr>
   </table>
  </th>
 </tr>
</table>
<input name="cntcId"    type="hidden" value=""/>
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
</form>

<table width="700" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<table width="700" cellpadding="0" class="table-list" border="0">
<thead>
<tr>
	<th class="title" width="10%" nowrap>순번</th>
	<th class="title" width="20%" nowrap>시스템연계ID</th>
	<th class="title" width="50%" nowrap>시스템연계명</th>
	<th class="title" width="20%" nowrap>승인여부</th>
</tr>
</thead>

<tbody>
<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
<tr>
	<td class="lt_text3" nowrap><c:out value="${(searchVO.pageIndex - 1) * searchVO.pageSize + status.count}"/></td>
	<td class="lt_text3" nowrap>
    	<form name="subForm"      method="post" action="<c:url value='${detailUri}'/>">
    	<input name="cntcId"      type="hidden" value="<c:out value='${resultInfo.cntcId}'/>">
    	<input name="pageIndex"   type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
    	<span class="link"><input type="submit" value="<c:out value='${resultInfo.cntcId}'/>" onclick="fn_egov_detail_SystemCntc('<c:out value="${resultInfo.cntcId}"/>'); return false;"></span>
    	</form>
	</td>
	<td class="lt_text"  nowrap><c:out value="${resultInfo.cntcNm}"/></td>
    <td class="lt_text3"  nowrap>
    	<c:if test="${resultInfo.confmAt == 'Y'}">승인</c:if>
    	<c:if test="${resultInfo.confmAt == 'N'}">미승인</c:if>
    </td>
</tr>
</c:forEach>

<c:if test="${fn:length(resultList) == 0}">
	<tr>
		<td class="lt_text3" colspan="4">
			<spring:message code="common.nodata.msg" />
		</td>
	</tr>
</c:if>

</tbody>
</table>

<table width="700" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
<tr>
	<td>
		<div align="center">
			<div>
				<ui:pagination paginationInfo = "${paginationInfo}"
						type="image"
						jsFunction="fn_egov_pageview"
						/>
			</div>
		</div>
	</td>
</tr>
</table>

</DIV>

</body>
</html>
