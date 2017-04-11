<%
/**
 * @Class Name : EgovCtsnnManageList.java
 * @Description : EgovCtsnnManageList jsp
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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="egovframework.com.utl.fcc.service.EgovDateUtil" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>경조사관리 목록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />" ></script>
<script type="text/javaScript" language="javascript">

	/* ********************************************************
	 * 페이징 처리 함수
	 ******************************************************** */
	/*설명 : 경조 목록 페이지 조회 */
	function linkPage(pageNo){
		var varForm	= document.all["listForm"];
		if(varForm.searchFromDate.value != ""){
			if(varForm.searchFromDate.value > varForm.searchToDate.value){
				alert("경조신청일자 검색조건의 시작일자가 종료일자보다  늦습니다. 경조신청일자를 확인하세요.");
				return;
			}
		} else varForm.searchToDate.value = "";
	
		varForm.searchCondition.value = "1";
		varForm.pageIndex.value = pageNo;
		varForm.action = "<c:url value='/uss/ion/ctn/selectCtsnnManageList.do'/>";
		varForm.submit();
	}

	/* ********************************************************
	 * 조회 처리
	 ******************************************************** */
	 /*설명 : 목록 조회 */
	 function fncSelectCtsnnManageList(pageNo){
		 var varForm = document.all["listForm"];
		 if(varForm.searchFromDate.value != ""){
		     if(varForm.searchFromDate.value > varForm.searchToDate.value){
		         alert("경조신청일자 검색조건의 시작일자가 종료일자보다  늦습니다. 경조신청일자를 확인하세요.");
		         return;
			  }
		 }else varForm.searchToDate.value = "";
		 //varForm.searchCondition.value = "1";
		 varForm.pageIndex.value = pageNo;
		 varForm.action = "<c:url value='/uss/ion/ctn/selectCtsnnManageList.do'/>";
		 varForm.submit();
	 }

	/* ********************************************************
	 * 등록 화면 호출 함수
	 ******************************************************** */
	function fncCtsnnRegist(){
		location.href = "/uss/ion/ctn/EgovCtsnnRegist.do";
	}

	/* ********************************************************
	 * 상세회면 호출함수
	 ******************************************************** */
	function fncCtsnnManageDetail(ctsnnId){
		var varForm				 = document.all["listForm"];
		varForm.ctsnnId.value       = ctsnnId;
		varForm.action           = "<c:url value='/uss/ion/ctn/EgovCtsnnManageDetail.do'/>";
		varForm.submit();
	}
</script>
</head>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<div id="border" style="width:730px">
<table border="0">
  <tr>
    <td width="700">
<!-- ********** 여기서 부터 본문 내용 *************** -->
	<form name="listForm" action="<c:url value='/uss/ion/ctn/selectCtsnnManageList.do'/>" method="post">
	<input type="hidden" name="searchCondition">
	<input type="hidden" name="ctsnnId">
	<input type="hidden" name="pageIndex" value="<c:if test="${empty ctsnnManageVO.pageIndex }">1</c:if><c:if test="${!empty ctsnnManageVO.pageIndex }"><c:out value='${ctsnnManageVO.pageIndex}'/></c:if>">

	<table width="700" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="40%"class="title_left">
	   <h1><img src="/images/egovframework/com/cmm/icon/tit_icon.gif" width="16" height="16" hspace="3" style="vertical-align: middle" alt="">&nbsp;경조사 관리 목록</h1></td>
	  <th>
	  </th>
	  <td width="50%">&nbsp;</td>
	  <th width="10%">
	       <table border="0" cellspacing="0" cellpadding="0">
	        <tr>
	          <td><span class="button"><input type="submit" value="<spring:message code="button.inquire" />" onclick="fncSelectCtsnnManageList('1'); return false;"></span></td>
	          <td>&nbsp;&nbsp;</td>
	          <td><span class="button"><a href="<c:url value='/uss/ion/ctn/EgovCtsnnRegist.do'/>" onclick="fncCtsnnRegist(); return false;"><spring:message code="button.create" /></a></span></td>
	        </tr>
	       </table>
	  </th>
	 </tr>
	</table>
	<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="경조목록 검색조건" >
      <caption>경조목록 검색조건</caption>
	  <tr>
	    <th width="20%" height="23" class="required_text"  scope="row"><label for="searchKeyword">경조구분</label><img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>
	    <td width="30%">
	        <select name="searchKeyword" title="경조구분">
	        	<option value="" <c:if test="${ctsnnManageVO.searchKeyword eq '' }">selected</c:if>>전체</option>
	            <c:forEach items="${ctsnnCodeList}" var="result" varStatus="status">
		       	   <option value="<c:out value="${result.code }"/>" <c:if test="${ctsnnManageVO.searchKeyword eq result.code }">selected</c:if>><c:out value="${result.codeNm }"/></option>
	            </c:forEach>
	      	</select>
	    </td>
	    <th width="20%" height="23" class="required_text"  scope="row"><label for="searchFromDate">발생일자</label><img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>
	    <td width="30%">
	     <c:if test="${!empty ctsnnManageVO.searchFromDate}">
		 	<c:set var="fromNow" value="${fn:substring(ctsnnManageVO.searchFromDate,0,4)}-${fn:substring(ctsnnManageVO.searchFromDate,4,6)}-${fn:substring(ctsnnManageVO.searchFromDate,6,8)}" />
		 </c:if>
		 <c:if test="${!empty ctsnnManageVO.searchToDate}">
		 	<c:set var="toNow" value="${fn:substring(ctsnnManageVO.searchToDate,0,4)}-${fn:substring(ctsnnManageVO.searchToDate,4,6)}-${fn:substring(ctsnnManageVO.searchToDate,6,8)}" />
         </c:if>
	      <input type="hidden" name="cal_url" id="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" >
	      <input type="text" name="searchFromDate" size="10" maxlength="10" value="${fromNow}" title="경조신청 시작일자">
	      <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(document.listForm, document.listForm.searchFromDate, document.listForm.searchFromDate);"
	         style   ="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" alt="달력창팝업버튼이미지"
		     width   ="15" height="15"></a> ~
		   <input type="text" name="searchToDate" size="10" maxlength="10" value="${toNow}" title="경조신청 종료일자">
	      <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(document.listForm, document.listForm.searchToDate, document.listForm.searchToDate);"
	         style   ="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" alt="달력창팝업버튼이미지"
		     width   ="15" height="15"></a>
	    </td>
	  </tr>
	  <tr>
	    <th width="20%" height="23" class="required_text"  scope="row"><label for="searchNm">신청자</label><img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>
	    <td width="30%">
	    <input name="searchNm" type="text" size="20" value="${ctsnnManageVO.searchNm}"  maxlength="100" title="신청자">
	    </td>
	    <th width="20%" height="23" class="required_text" scope="row"><label for="searchConfmAt">진행구분</label><img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>
	    <td width="30%">
	        <select name="searchConfmAt" title="진행구분">
		       	<option value=""  <c:if test="${ctsnnManageVO.searchConfmAt eq '' }">selected</c:if>>전체</option>
		       	<option value="A" <c:if test="${ctsnnManageVO.searchConfmAt eq 'A' }">selected</c:if>>신청중</option>
		       	<option value="C" <c:if test="${ctsnnManageVO.searchConfmAt eq 'C' }">selected</c:if>>승인</option>
		       	<option value="R" <c:if test="${ctsnnManageVO.searchConfmAt eq 'R' }">selected</c:if>>반려</option>
	      	</select>
	    </td>
	  </tr>
	</table>
	</form>
	<table width="700" cellspacing="0" cellpadding="0" border="0">
	<tr>
		<td height="3px"></td>
	</tr>
	</table>

	<table width="700" cellpadding="0" class="table-list" border="0" summary="이 표는 경조관리리스트의 정보를 제공하며 순번, 경조구분, 경조명,신청자,소속,발생일자,진행구분,승인일자,승인자로 구성되어 있습니다." >
    <caption>경조관리 목록</caption>
	<thead>
	<tr>
		<th class="title" scope="col" width="5%" >순번</th>
		<th class="title" scope="col" width="10%">경조구분</th>
		<th class="title" scope="col" width="20%">경조명</th>
		<th class="title" scope="col" width="10%">신청자</th>
		<th class="title" scope="col" width="15%">소속</th>
		<th class="title" scope="col" width="10%">발생일자</th>
		<th class="title" scope="col" width="10%">진행구분</th>
		<th class="title" scope="col" width="10%">승인일자</th>
		<th class="title" scope="col" width="10%">승인자</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach items="${ctsnnManageList}" var="resultInfo" varStatus="status">
	<tr>
		<td class="lt_text3" nowrap><c:out value="${(ctsnnManageVO.pageIndex - 1) * ctsnnManageVO.pageSize + status.count}"/></td>
		<td class="lt_text3" nowrap><c:out value="${resultInfo.ctsnnCdNm  }"/></td>
		<td class="lt_text3" nowrap>
		  <form name="item" method="post" action="<c:url value='/uss/ion/ctn/EgovCtsnnManageDetail.do'/>">
           	<input type="hidden" name="ctsnnId"    value="<c:out value="${resultInfo.ctsnnId    }"/>">
            <span class="link"><input type="submit" value="<c:out value="${resultInfo.ctsnnNm}"/>" onclick="fncCtsnnManageDetail('<c:out value="${resultInfo.ctsnnId}"/>'); return false;" style="text-align : left;"></span>
          </form>
		</td>
		<td class="lt_text3" nowrap><c:out value="${resultInfo.usNm  }"/></td>
		<td class="lt_text3" nowrap><c:out value="${resultInfo.orgnztNm   }"/></td>
		<td class="lt_text3" nowrap><c:out value="${resultInfo.occrrDe    }"/></td>
		<td class="lt_text3" nowrap>
          <c:if test="${resultInfo.confmAt eq 'A'}">신청중</c:if>
          <c:if test="${resultInfo.confmAt eq 'C'}">승인</c:if>
          <c:if test="${resultInfo.confmAt eq 'R'}">반려</c:if>
		</td>
		<td class="lt_textL" nowrap><c:out value="${resultInfo.sanctnDt   }"/></td>
		<td class="lt_textL" nowrap><c:out value="${resultInfo.sanctnerNm }"/></td>
	</tr>
	</c:forEach>

	<c:if test="${fn:length(ctsnnManageList) == 0}">
		<tr>
			<td class="lt_text3" colspan="9">
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


	<c:if test="${!empty ctsnnManageVO.pageIndex }">
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
