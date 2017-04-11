<%
/**
 * @Class Name : EgovRwardManageList.java
 * @Description : EgovRwardManageList jsp
 * @Modification Information
 * @
 * @  수정일                    수정자                수정내용
 * @ ---------     --------    ---------------------------
 * @ 2010.07.20    이      용                최초 생성
 *
 *  @author 이      용
 *  @since 2010.08.05
 *  @version 1.0
 *  @see
 *
 *  Copyright (C) 2009 by MOPAS  All right reserved.
 */
%>

<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="egovframework.com.utl.fcc.service.EgovDateUtil" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>포상관리 목록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />" ></script>
<script type="text/javaScript" language="javascript">
<!--
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
 /*설명 : 행사 목록 페이지 조회 */
 function linkPage(pageNo){
	var varForm				 = document.all["listForm"];
	 if(varForm.searchFromDate.value != ""){
	     if(varForm.searchFromDate.value > varForm.searchToDate.value){
	         alert("포상일자 검색조건의 시작일자가 종료일자보다  늦습니다. 포상일자를 확인하세요.");
	         return;
		 }
	 }else varForm.searchToDate.value = "";

	varForm.searchCondition.value = "1";
	varForm.pageIndex.value = pageNo;
	varForm.action = "<c:url value='/uss/ion/rwd/selectRwardManageList.do'/>";
	varForm.submit();
 }

/* ********************************************************
 * 조회 처리
 ******************************************************** */
 /*설명 : 목록 조회 */
 function fncSelectRwardManageList(pageNo){
	 var varForm				 = document.all["listForm"];
	 if(varForm.searchFromDate.value != ""){
	     if(varForm.searchFromDate.value > varForm.searchToDate.value){
	         alert("포상일자 검색조건의 시작일자가 종료일자보다  늦습니다. 포상일자를 확인하세요.");
	         return;
		 }
	 }else varForm.searchToDate.value = "";
	 varForm.pageIndex.value = pageNo;
	 varForm.action = "<c:url value='/uss/ion/rwd/selectRwardManageList.do'/>";
	 varForm.submit();
 }

/* ********************************************************
 * 등록 화면 호출 함수
 ******************************************************** */
function fncRwardRegist(){
	location.href = "/uss/ion/rwd/EgovRwardRegist.do";
}

/* ********************************************************
 * 상세회면 호출함수
 ******************************************************** */
function fncRwardManageDetail(rwardId){
	var varForm				 = document.all["listForm"];
	varForm.rwardId.value = rwardId;
	varForm.action           = "<c:url value='/uss/ion/rwd/EgovRwardManageDetail.do'/>";
	varForm.submit();
}

-->
</script>
</head>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<div id="border" style="width:730px">
<table border="0">
  <tr>
    <td width="700">
<!-- ********** 여기서 부터 본문 내용 *************** -->

	<form name="listForm" action="<c:url value='/uss/ion/rwd/selectRwardManageList.do'/>" method="post">
	<input type="hidden" name="searchCondition">
	<input type="hidden" name="rwardId">
	<input type="hidden" name="pageIndex" value="<c:if test="${empty rwardManageVO.pageIndex }">1</c:if><c:if test="${!empty rwardManageVO.pageIndex }"><c:out value='${rwardManageVO.pageIndex}'/></c:if>">

	<table width="700" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="40%"class="title_left">
	   <h1><img src="/images/egovframework/com/cmm/icon/tit_icon.gif" width="16" height="16" hspace="3" style="vertical-align: middle" alt="">&nbsp;포상관리 목록</h1></td>
	  <th>
	  </th>
  <td width="50%">&nbsp;</td>
  <th width="10%" align="right">
	       <table border="0" cellspacing="0" cellpadding="0">
	        <tr>
	          <td><span class="button"><input type="submit" value="<spring:message code="button.inquire" />" onclick="fncSelectRwardManageList('1'); return false;"></span></td>
	          <td>&nbsp;&nbsp;</td>
	          <td><span class="button"><a href="<c:url value='/uss/ion/rwd/EgovRwardRegist.do'/>" onclick="fncRwardRegist(); return false;"><spring:message code="button.create" /></a></span></td>
	        </tr>
	       </table>
	  </th>
	 </tr>
	</table>
	<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="포상관리 검색조건" >
	<caption>포상관리 검색조건</caption>
	  <tr>
	    <th width="20%" height="23" class="required_text" scope="row"><label for="searchKeyword">포상구분</label><img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>
	    <td width="30%"  >
	        <select name="searchKeyword" title="포상구분">
	        	<option value="" <c:if test="${rwardManageVO.searchKeyword eq '' }">selected</c:if>>전체</option>
	            <c:forEach items="${rwardCodeList}" var="result" varStatus="status">
		       	   <option value="<c:out value="${result.code }"/>" <c:if test="${rwardManageVO.searchKeyword eq result.code }">selected</c:if>><c:out value="${result.codeNm }"/></option>
	            </c:forEach>
	      	</select>
	    </td>
	    <th width="20%" height="23" class="required_text" scope="row"><label for="searchFromDate">포상일자</label><img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>
	    <td width="30%">
	     <c:if test="${!empty rwardManageVO.searchFromDate}">
		 	<c:set var="fromNow" value="${fn:substring(rwardManageVO.searchFromDate,0,4)}-${fn:substring(rwardManageVO.searchFromDate,4,6)}-${fn:substring(rwardManageVO.searchFromDate,6,8)}" />
		 </c:if>
		 <c:if test="${!empty rwardManageVO.searchToDate}">
		 	<c:set var="toNow" value="${fn:substring(rwardManageVO.searchToDate,0,4)}-${fn:substring(rwardManageVO.searchToDate,4,6)}-${fn:substring(rwardManageVO.searchToDate,6,8)}" />
         </c:if>
          <input type="hidden" name="cal_url" id="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" >
	      <input name="searchFromDate" type="text" size="10" maxlength="10" value="${fromNow}" title="포상 시작일자"  >
	      <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(document.listForm, document.listForm.searchFromDate, document.listForm.searchFromDate);"
	       style   ="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" alt="달력창팝업버튼이미지"
		   width   ="15" height="15"></a> ~
	      <input name="searchToDate" type="text" size="10" maxlength="10" value="${toNow}" title="포상 종료일자" >
	      <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(document.listForm, document.listForm.searchToDate, document.listForm.searchToDate);"
	       style   ="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" alt="달력창팝업버튼이미지"
		   width   ="15" height="15"></a>
	    </td>
	  </tr>
	  <tr>
	    <th width="20%" height="23" class="required_text" scope="row"><label for="searchNm">포상자</label><img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>
	    <td width="30%" colspan=3>
	    <input name="searchNm" type="text" size="20" value="${rwardManageVO.searchNm}"  maxlength="100" title="포상자">
	    </td>
	  </tr>
	</table>
	</form>
	<table width="700" cellspacing="0" cellpadding="0" border="0">
	<tr>
		<td height="3px"></td>
	</tr>
	</table>

	<table width="700" cellpadding="0" class="table-list" border="0" summary="포상관리 목록으로 순번, 포상구분, 포상명, 포상일지, 포상자명, 소속 둥 으로 구성" >
     <caption>포상관리 목록</caption>
	<thead>
	<tr>
		<th class="title" width="5%"  scope="col">순번</th>
		<th class="title" width="10%" scope="col">포상구분</th>
		<th class="title" scope="col">포상명</th>
		<th class="title" width="10%" scope="col" >포상일자</th>
		<th class="title" width="10%" scope="col" >포상자명</th>
		<th class="title" width="15%" scope="col" >소속</th>
		<th class="title" width="10%" scope="col" >진행구분</th>
		<th class="title" width="10%" scope="col" >승인자</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach items="${rwardManageList}" var="resultInfo" varStatus="status">
	<tr>
		<td class="lt_text3" nowrap><c:out value="${(rwardManageVO.pageIndex - 1) * rwardManageVO.pageSize + status.count}"/></td>
		<td class="lt_text3" nowrap><c:out value="${resultInfo.rwardCdNm }"/></td>
		<td class="lt_textL" nowrap>
        <form name="item" method="post" action="<c:url value='/uss/ion/rwd/EgovRwardManageDetail.do'/>">
        	<input type="hidden" name="rwardId" value="<c:out value="${resultInfo.rwardId }"/>">
            <span class="link"><input type="submit" value="<c:out value="${resultInfo.rwardNm}"/>" onclick="fncRwardManageDetail('<c:out value="${resultInfo.rwardId}"/>'); return false;" style="text-align : left;"></span>
        </form>
		</td>
		<td class="lt_text3" nowrap><c:out value="${resultInfo.rwardDe      }"/></td>
		<td class="lt_text3" nowrap><c:out value="${resultInfo.rwardManNm   }"/></td>
		<td class="lt_text3" nowrap><c:out value="${resultInfo.orgnztNm }"/></td>
		<td class="lt_text3" nowrap>
          <c:if test="${resultInfo.confmAt eq 'A'}">신청중</c:if>
          <c:if test="${resultInfo.confmAt eq 'C'}">승인</c:if>
          <c:if test="${resultInfo.confmAt eq 'R'}">반려</c:if>
		</td>
		<td class="lt_textL" nowrap><c:out value="${resultInfo.sanctnerNm}"/></td>
	</tr>
	</c:forEach>

	<c:if test="${fn:length(rwardManageList) == 0}">
		<tr>
			<td class="lt_text3" colspan="8">
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
	</table>


	<c:if test="${!empty rwardManageVO.pageIndex }">
	<div align="center">
	    <div>
	        <ui:pagination paginationInfo="${paginationInfo}"
	                       type="image"
	                       jsFunction="linkPage" />
	    </div>
	</div>
	</c:if>
<!-- ********** 여기까지 내용 *************** -->
</td>
</tr>
</table>
</DIV>
</body>
</html>
