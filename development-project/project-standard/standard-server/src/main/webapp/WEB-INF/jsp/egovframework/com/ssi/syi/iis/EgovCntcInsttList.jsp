<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
 /**
  * @Class Name  : EgovCntcInsttList.jsp
  * @Description : EgovCntcInsttList 화면
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
<title>연계기관 목록</title>

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
	document.listForm.action = "<c:url value='/ssi/syi/iis/getCntcInsttList.do'/>";
   	document.listForm.submit();
}
/* ********************************************************
 * 조회 처리
 ******************************************************** */
function fn_egov_search_CntcInstt(){
	document.listForm.pageIndex.value = 1;
   	document.listForm.submit();
}
/* ********************************************************
 * 수정 처리 함수
 ******************************************************** */
function fn_egov_modify_CntcInstt(){
	location.href = "<c:url value='/ssi/syi/iis/updateCntcInstt.do'/>";
}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_detail_CntcInstt(insttId){
	var varForm				 = document.all["listForm"];
	varForm.action           = "<c:url value='/ssi/syi/iis/getCntcInsttDetail.do'/>";
	varForm.insttId.value    = insttId;
	varForm.submit();
}
-->
</script>
</head>

<body>
<DIV id="content" style="display">
<%-- noscript 테그 --%>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<form name="listForm" action="<c:url value='/ssi/syi/iis/getCntcInsttList.do'/>" method="post">
<table width="700" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="40%"class="title_left">

   	<h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;연계기관 목록</h1>
  </td>
  <th>
  </th>
  <td width="10%">
   	<select name="searchCondition" class="select" title="검색조건">
		   <option selected value=''>--선택하세요--</option>
		   <option value='1' <c:if test="${searchVO.searchCondition == '1'}">selected="selected"</c:if>>기관명</option>
	   </select>
	</td>
  <td width="35%">
    <input name="searchKeyword" type="text" size="35" value="<c:out value='${searchVO.searchKeyword}'/>"  maxlength="35" title="검색조건" >
  </td>
  <th width="10%">
   <table border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td><span class="button">
	      <input type="submit" value="조회" onclick="fn_egov_search_CntcInstt(); return false;"></span></td>
      <td width="10"></td>

      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif' />" alt="등록" width="8" height="20"></td>
      <td style="background-image:URL(<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>);" class="text_left" nowrap>
      <a href="<c:url value='/ssi/syi/iis/addCntcInstt.do'/>?pageIndex=<c:out value='${searchVO.pageIndex}'/>">등록</a></td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif' />" alt="등록" width="8" height="20"></td>
    </tr>
   </table>
  </th>
 </tr>
</table>
<input type="hidden" name="insttId">
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>" >
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
	<th class="title" width="20%" nowrap>기관ID</th>
	<th class="title" width="70%" nowrap>기관명</th>
</tr>
</thead>

<tbody>
<c:if test="${fn:length(resultList) == 0}">
	<tr>
		<td class="lt_text3" colspan=3>
			<spring:message code="common.nodata.msg" />
		</td>
	</tr>
</c:if>

<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
<tr style="cursor:pointer;cursor:hand;" onclick="javascript:fn_egov_detail_CntcInstt('<c:out value="${resultInfo.insttId}"/>');">
	<td class="lt_text3" nowrap><c:out value="${(searchVO.pageIndex - 1) * searchVO.pageSize + status.count}"/></td>
	<td class="lt_text3" >

    	<form name="subForm" method="post" action="<c:url value='/ssi/syi/iis/getCntcInsttDetail.do'/>">
    	<input name="insttId"     type="hidden" value="<c:out value='${resultInfo.insttId}'/>">
    	<input name="pageIndex"   type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
    	<span class="link"><input type="submit" value="<c:out value='${resultInfo.insttId}'/>" onclick="fn_egov_detail_CntcInstt('<c:out value="${resultInfo.insttId}"/>'); return false;"></span>
    	</form>

	</td>
	<td class="lt_text"  nowrap><c:out value="${resultInfo.insttNm}"/></td>
</tr>
</c:forEach>

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
