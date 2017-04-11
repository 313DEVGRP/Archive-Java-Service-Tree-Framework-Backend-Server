<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
  Class Name : EgovEventCmpgnList.jsp
  Description : 행사/이벤트/캠페인 목록
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2008.03.12    장동한          최초 생성

    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.12

--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<html lang="ko">
<head>
<title>EgovMeetingManageList</title>
<meta http-equiv="Pragma" content="No-Cache">
<meta http-equiv="content-type" content="text/html; charset=utf-8" >
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css'/>" >
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/showModalDialogCallee.js'/>" ></script> 
<script type="text/javaScript" language="javascript">

	/* ********************************************************
	 * 페이징 처리 함수
	 ******************************************************** */
	function linkPage(pageNo){
		document.listForm.pageIndex.value = pageNo;
		document.listForm.action = "<c:url value='/uss/ion/ecc/EgovEventCmpgnList.do'/>";
	   	document.listForm.submit();
	}

	/* ********************************************************
	 * 상세회면 처리 함수
	 ******************************************************** */
	function fn_egov_open_EventCmpgn(eventCn, eventId){
		/* var opener = window.dialogArguments; */
		var opener;
	 
		getDialogArguments();
		if (window.dialogArguments) {
		    opener = window.dialogArguments; // Support IE
		} else {
		    opener = window.opener;    // Support Chrome, Firefox, Safari, Opera
		}
	
		opener.document.getElementById("eventId").value = eventId;
		opener.document.getElementById("eventCn").value = eventCn;
	
		window.returnValue=true;
		window.close();
	
	}

	/* ********************************************************
	 * 검색 함수
	 ******************************************************** */
	function fn_egov_search_EventCmpgn(){
		var vFrom = document.listForm;
		vFrom.action = "#Link";
		vFrom.submit();
	}
</script>
</head>

<body>
<DIV id="content" style="width:712px">

<form name="listForm" id="listForm" action="#Link" method="post">
  <div id="hiddenValue">
  <input name="eventCn" type="hidden"/>
<table width="100%" cellpadding="1" class="table-search" border="0">
 <tr>
  <td class="title_left">
	<h1>
  		<img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif'/>" width="16" height="16" hspace="3" align="middle" alt="행사/이벤트/캠페인 목록 팝업">&nbsp;행사/이벤트/캠페인 목록 팝업
  	</h1>
  </td>
  </tr>
  <tr>
  <td width="120px">
   	<select name="searchCondition" class="select" style="width:100%" title="검색조건선택">
		   <option value=''>--선택하세요--</option>
		   <option value='EVENT_CN' <c:if test="${searchCondition == 'EVENT_CN'}">selected</c:if>>행사내용</option>
		   <option value='FRST_REGISTER_ID' <c:if test="${searchCondition == 'FRST_REGISTER_ID'}">selected</c:if>>작성자</option>
	   </select>
	</td>
  <td width="180px">
    <input name="searchKeyword" type="text" size="10" value="${searchKeyword}" maxlength="35" style="width:100%" title="searchKeyword" >
  </td>
  <td width="65px" align="right">
	  <table border="0" cellspacing="0" cellpadding="0" align="right">
		  <tr>
		  	<td><span class="button">
		  		<a href="#Link" onClick="javascript:fn_egov_search_EventCmpgn();">조회</a>
		  		</span>
	      	</td>
		  </tr>
	  </table>
  </td>
 </tr>
</table>

<table width="100%" cellpadding="0" class="table-line" border="0"  summary="순번, 행사유형, 행사내용, 행사시작일자, 행사종료일자, 작성자명, 등록일자, 선택   목록입니다">
<thead>
  <tr>
    <!-- th class="title" width="3%" nowrap><input type="checkbox" name="all_check" class="check2"></th-->
    <th scope="col" class="title" width="35px" nowrap>순번</th>
    <th scope="col" class="title" width="60px" nowrap>행사유형</th>
    <th scope="col" class="title" nowrap>행사내용</th>

    <th scope="col" class="title" width="80x" nowrap>행사시작일자</th>
    <th scope="col" class="title" width="80x" nowrap>행사종료일자</th>
    <th scope="col" class="title" width="80px" nowrap>작성자명</th>
    <th scope="col" class="title" width="80px" nowrap>등록일자</th>
    <th scope="col" class="title" width="40px" nowrap>&nbsp;&nbsp;선택</th>
  </tr>
 </thead>
 <tbody>
 <c:forEach items="${resultList}" var="resultInfo" varStatus="status">
  <tr>
    <td class="lt_text3" nowrap><c:out value="${status.count}"/></td>
    <td class="lt_text3" nowrap>

	<c:forEach items="${comCode035}" var="comCodeList">
	<c:if test="${comCodeList.code eq fn:trim(resultInfo.eventTyCode)}">
	<c:out value="${fn:replace(comCodeList.codeNm , crlf , '<br/>')}" escapeXml="false" />
	</c:if>
	</c:forEach>

    </td>
    <td class="lt_text3L">${resultInfo.eventCn}</td>

    <td class="lt_text3" nowrap>${resultInfo.eventSvcBeginDe}</td>
    <td class="lt_text3" nowrap>${resultInfo.eventSvcEndDe}</td >
    <td class="lt_text3" nowrap>${resultInfo.frstRegisterNm}</td>
    <td class="lt_text3" nowrap>${fn:substring(resultInfo.frstRegisterPnttm, 0, 10)}</td>
    <td class="lt_text3"><span class="button"><input type="submit" value="선택" onclick="fn_egov_open_EventCmpgn('<c:out value="${resultInfo.eventCn}"/>','${resultInfo.eventId}'); return false;"></span></td>
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

<input name="cmd" id="cmd" type="hidden" value=""/>
<input name="eventId" id="eventId" type="hidden" value=""/>
<input name="pageIndex" id="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
</div>
</form>

</DIV>
</body>
</html>

