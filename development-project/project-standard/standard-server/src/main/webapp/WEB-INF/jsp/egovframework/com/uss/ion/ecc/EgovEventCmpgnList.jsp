<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Class Name : EgovEventCmpgnList.jsp
 * @Description :  행사/이벤트/캠페인 목록
 *
 *   수정일         수정자           수정내용
 *  -------    	   --------    ---------------------------
 *  2008.03.12    	장동한          최초 생성
 *	2011.07.29		이기하			외부인사정보 링크 생성
 *  2011.9.7		정진오			Form in Form으로 인한 테이블 깨짐.. 수정
 *
 * author   : 공통서비스 개발팀 장동한
 *  since    : 2009.03.12
 */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%pageContext.setAttribute("crlf", "\r\n"); %>
<html lang="ko">
<head>
<title>EgovMeetingManageList</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" >
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css'/> " >
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />" >
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
 * 등록 처리 함수
 ******************************************************** */
function fn_egov_regist_EventCmpgn(){
	location.href = "<c:url value='/uss/ion/ecc/EgovEventCmpgnRegist.do' />";
}
/* ********************************************************
 * 수정 처리 함수
 ******************************************************** */
function fn_egov_modify_EventCmpgn(){
	location.href = "<c:url value='/uss/ion/ecc/EgovEventCmpgnModify.do' />";
}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_detail_EventCmpgn(eventId){
	var vFrom = document.listForm;
	vFrom.eventId.value = eventId;
	vFrom.action = "<c:url value='/uss/ion/ecc/EgovEventCmpgnDetail.do' />";
	vFrom.submit();
}
/* ********************************************************
 * 선택한 행사내용 정보 -> 외부인사정보 바로가기
 ******************************************************** */
function fn_egov_list_EgovTnextrlHrInfo(eventId){
	var vFrom = document.listForm;
	vFrom.eventId.value = eventId;
	vFrom.searchKeyword.value = '';
	vFrom.searchMode.value = 'Y';

	vFrom.action = "<c:url value='/uss/ion/ecc/EgovTnextrlHrInfoList.do' />";
	vFrom.submit();

}
/* ********************************************************
 * 삭제 처리 함수
 ******************************************************** */
function fn_egov_delete_EventCmpgn(mtgId){
	var vFrom = document.listForm;
	if(confirm("삭제 하시겠습니까?")){
		vFrom.mtgId.value = mtgId;
		vFrom.cmd.value = 'del';
		vFrom.action = "<c:url value='/uss/ion/ecc/EgovEventCmpgnList.do' />";
		vFrom.submit();
	}else{
		vFrom.cmd.value = '';
	}
}
/* ********************************************************
 * 검색 함수
 ******************************************************** */
function fn_egov_search_EventCmpgn(){
	var vFrom = document.listForm;

	vFrom.action = "<c:url value='/uss/ion/ecc/EgovEventCmpgnList.do' />";
	vFrom.submit();

}

</script>
</head>

<DIV id="content" style="width:712px">

<form name="listForm" id="listForm" action="<c:url value='/uss/ion/ecc/EgovEventCmpgnList.do'/>" method="post">

<table width="100%" cellpadding="1" class="table-search" border="0">
 <tr>
  <td class="title_left">
	<h1>
  		<img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif'/>" width="16" height="16" hspace="3" align="middle" alt="행사/이벤트/캠페인 목록">&nbsp;행사/이벤트/캠페인 목록
  	</h1>
  </td>

  <td width="120px">
   	<select name="searchCondition" class="select" style="width:100%" title="searchCondition">
		   <option value=''>--선택하세요--</option>
		   <option value='EVENT_CN' <c:if test="${searchCondition == 'EVENT_CN'}">selected</c:if>>행사내용</option>
		   <option value='FRST_REGISTER_ID' <c:if test="${searchCondition == 'FRST_REGISTER_ID'}">selected</c:if>>작성자</option>
	   </select>
	</td>
  <td width="180px">
    <input name="searchKeyword" type="text" size="10" value="${searchKeyword}" maxlength="35" style="width:100%" title="searchKeyword">
  </td>
  <td>&nbsp;</td>
  <td width="65x" align="right">
   <table border="0" cellspacing="0" cellpadding="0" align="right">
    <tr>
      <td><span class="button">
      <a href="<c:url value='/uss/ion/ecc/EgovEventCmpgnList.do' />" onclick="javascript:fn_egov_search_EventCmpgn(); return false;">조회</a></span>
      </td>
      <td>&nbsp;</td>
      <td><span class="button">
      <a href="<c:url value='/uss/ion/ecc/EgovEventCmpgnRegist.do' />" onclick="javascript:fn_egov_regist_EventCmpgn();">등록</a></span>
      </td>
    </tr>
   </table>
  </td>
 </tr>
</table>

<table width="100%" cellpadding="0" class="table-line" border="0"  summary="번호, 행사유형, 행사내용, 행사시작일자, 행사종료일자, 외부인사정보 , 작성자명, 등록일자  목록입니다" >
<colgroup>
	<col width="5%"><col width="10%"><col width="%;"><col width="12%"><col width="12%"><col width="12%"><col width="10%"><col width="10%">
</colgroup>
<thead>
  <tr>
    <!-- th class="title" width="3%" nowrap><input type="checkbox" name="all_check" class="check2"></th-->
    <th class="title">순번</th>
    <th class="title">행사유형</th>
    <th class="title">행사내용</th>

    <th class="title">행사시작일자</th>
    <th class="title">행사종료일자</th>

    <th class="title">외부인사정보</th>

    <th class="title">작성자명</th>
    <th class="title">등록일자</th>
  </tr>
 </thead>
 <tbody>
 <%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
 <c:if test="${fn:length(resultList) == 0}">
 <tr>
 <td class="lt_text3" colspan="8">
	<spring:message code="common.nodata.msg" />
 </td>
 </tr>
 </c:if>
 <c:forEach items="${resultList}" var="resultInfo" varStatus="status">
  <tr>
    <td class="lt_text3" nowrap><c:out value="${status.count}"/></td>
    <td class="lt_text3" nowrap>

<c:forEach items="${comCode035}" var="comCodeList" varStatus="status">
<c:if test="${comCodeList.code eq fn:trim(resultInfo.eventTyCode)}">
<c:out value="${fn:replace(comCodeList.codeNm , crlf , '<br/>')}" escapeXml="false" />
</c:if>
</c:forEach>

    </td>

    <!-- 2010.11.2
    <td class="lt_text3L"><a href="<c:url value='/uss/ion/ecc/EgovEventCmpgnDetail.do' />" onclick="javascript:fn_egov_detail_EventCmpgn('${resultInfo.eventId}')">${resultInfo.eventCn}</a></td>
    -->

    <td class="lt_text3L">
		<a href="<c:url value='/uss/ion/ecc/EgovEventCmpgnDetail.do'/>?eventId=<c:out value='${resultInfo.eventId}'/>" >
			<c:out value="${resultInfo.eventCn}"/>
		</a>
    </td>
    <td class="lt_text3" nowrap>${resultInfo.eventSvcBeginDe}</td>
    <td class="lt_text3" nowrap>${resultInfo.eventSvcEndDe}</td>
    <td class="lt_text3" nowrap>
   		<!-- 2011.9.7 수정분 -->
   		<!-- <form name="subForm" method="post" action="<c:url value='/uss/ion/ecc/EgovTnextrlHrInfoList.do'/>" >
   		<input name="eventId" type="hidden" value="${resultInfo.eventId}">
		<input name="searchMode" type="hidden" value="Y"> -->
		<span class="link"><input type="submit"  value="보기" onclick="fn_egov_list_EgovTnextrlHrInfo('${resultInfo.eventId}'); return false;"></span>
		<!--</form> -->
    </td>
    <td class="lt_text4" nowrap>${resultInfo.frstRegisterNm}</td>
    <td class="lt_text3" nowrap>${fn:substring(resultInfo.frstRegisterPnttm, 0, 10)}</td>
  </tr>
 </c:forEach>
 </tbody>
</table>


<center>
	<div>
		<ui:pagination paginationInfo = "${paginationInfo}" type="image" 	jsFunction="linkPage"/>
	</div>
</center>
<input name="searchMode" type="hidden" value=""/><!-- 2011.9.7 추가사항 -->
<input name="cmd" type="hidden" value=""/>
<input name="eventId" type="hidden" value=""/>
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
</form>
</DIV>
</html>
