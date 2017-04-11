<%--
  Class Name : EgovNoteRecptnList.jsp
  Description : 받은쪽지함관리 목록조회
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2010.08.05    장동한          최초 생성

    author   : 공통서비스 개발팀 장동한
    since    : 2010.08.05

--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>받은쪽지함관리-목록조회</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />" ></script>
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/uss/ion/ntr/listNoteRecptn.do'/>";
   	document.listForm.submit();
}

/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_detail_NoteRecptn(noteId,noteTrnsmitId){
	var vFrom = document.listForm;
	vFrom.noteId.value = noteId;
	vFrom.noteTrnsmitId.value = noteTrnsmitId;
	vFrom.action = "<c:url value='/uss/ion/ntr/detailNoteRecptn.do'/>";
	vFrom.submit();
}

/* ********************************************************
 * 검색 함수
 ******************************************************** */
function fn_egov_search_NoteRecptn(){
	var vFrom = document.listForm;

	 if(vFrom.searchFromDate.value != ""){
	     if(vFrom.searchFromDate.value > vFrom.searchToDate.value){
	         alert("검색조건의 시작일자가 종료일자보다  늦습니다. 검색조건 날짜를 확인하세요.");
	         return;
		  }
	 }else{
		 vFrom.searchToDate.value = "";
	 }

	vFrom.pageIndex.value = "1";
	vFrom.action = "<c:url value='/uss/ion/ntr/listNoteRecptn.do'/>";
	vFrom.submit();

}
/* ********************************************************
* 체크 박스 선택 함수
******************************************************** */
function fn_egov_checkAll_NoteRecptn(){

	var FLength = document.getElementsByName("checkList").length;
	var checkAllValue = document.getElementById('checkAll').checked;

	//undefined
	if( FLength == 1){
		document.listForm.checkList.checked = checkAllValue;
	}{
			for(var i=0; i < FLength; i++)
			{
				document.getElementsByName("checkList")[i].checked = checkAllValue;
			}
	}

}
/* ********************************************************
* 체크 박스 선태 건수
******************************************************** */
var g_nDelCount  = 0;
function fn_egov_delCnt_NoteRecptn(){

	g_nDelCount = 0;
	var FLength = document.getElementsByName("checkList").length;

	//undefined
	if( FLength == 1){
		if(document.listForm.checkList.checked == true){g_nDelCount++;}
	}{
			for(var i=0; i < FLength; i++)
			{
				if(document.getElementsByName("checkList")[i].checked == true){g_nDelCount++;}
			}
	}

	return g_nDelCount;

}
/* ********************************************************
* 목록 삭제
******************************************************** */
function fn_egov_delete_NoteRecptn(){
	var vFrom = document.listForm;

	if(fn_egov_delCnt_NoteRecptn() == 0){alert("삭제할 목록을 선택해주세요!   "); document.getElementById('checkAll').focus();return;}

	if(confirm("선택된 받은쪽지함을 삭제 하시겠습니까?")){
		vFrom.action = "<c:url value='/uss/ion/ntr/listNoteRecptn.do'/>";
		vFrom.cmd.value = 'del';
		vFrom.submit();
	}

}
</script>
</head>
<body>
<DIV id="content" style="width:712px">
<!-- 자바스크립트 지원 태그  -->
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<div class="title_left" style="width:100%;margin:0 0 0 0;">
	<h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif'/>" width="16" height="16" hspace="3" style="vertical-align:middle; display:inline-block;" alt=" ">&nbsp;받은쪽지함 목록조회</h1>
</div>

<form name="listForm" action="<c:url value='/uss/ion/ntr/listNoteRecptn.do'/>" method="post">
<!-- 타이틀/검색폼 -->
<table width="100%" cellpadding="1" class="table-search" border="0" summary="타이틀/검색폼을 제공한다.">
<caption>타이틀/검색폼을 제공한다</caption>
<tr>
	<td align="right" width="60px" scope="row">보낸날짜:&nbsp;</td>
	<th align="left">
			<label for="searchFromDate"></label>
		  <input type="hidden" name="cal_url" id="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" >
	      <input type="text" name="searchFromDate" size="10" maxlength="10" value="${searchVO.searchFromDate}" title="보낸날짜 시작일자" readonly>
	      <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(document.listForm, document.listForm.searchFromDate, document.listForm.searchFromDate);"
	         style   ="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" alt="달력창팝업버튼이미지"
		     width   ="15" height="15"></a> ~
		     <label for="searchToDate"> </label>
		   <input type="text" name="searchToDate" size="10" maxlength="10" value="${searchVO.searchToDate}" title="보낸날짜  종료일자" readonly>
	      <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(document.listForm, document.listForm.searchToDate, document.listForm.searchToDate);"
	         style   ="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" alt="달력창팝업버튼이미지"
		     width   ="15" height="15"></a>
	</th>
	<td width="110px">
	<label for="searchCondition"> </label>
   	<select name="searchCondition" title="검색조건" class="select" style="width:100%">
		   <option value=''>--선택하세요--</option>
		   <option value='NOTE.NOTE_SJ' <c:if test="${searchCondition == 'NOTE.NOTE_SJ'}">selected</c:if>>쪽지제목</option>
		   <option value='NOTE.NOTE_CN' <c:if test="${searchCondition == 'NOTE.NOTE_CN'}">selected</c:if>>쪽지내용</option>
		   <!-- <option value='NOTE_RNS.RCVER_ID' <c:if test="${searchCondition == 'NOTE_RNS.RCVER_ID'}">selected</c:if>>받는사람명</option>  -->
		   <option value='NOTE_RNS.RCVER_NM' <c:if test="${searchCondition == 'NOTE_RNS.RCVER_NM'}">selected</c:if>>보낸사람</option>
	   </select>
	</td>
	<td width="180px">
	<label for="searchKeyword"> </label>
	<input name="searchKeyword" title="검색어" type="text" size="10" value="<c:out value='${searchKeyword}'/>" maxlength="35" style="width:100%" onkeyup="if(window.event.keyCode==13){fn_egov_search_NoteRecptn(); return false;}">
  	</td>
	<td width="3px"></td>
	<th width="60px" align="center">
	<table border="0" cellspacing="0" cellpadding="0" align="center" summary="조회 버튼을 제공한다.">
	<caption>조회 버튼을 제공한다</caption>
	<tr>
		<th scope="col"><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>"  width="8" height="20" alt="버튼이미지"></th>
		<td class="btnBackground"><input type="submit" value="<spring:message code="button.inquire" />" onclick="fn_egov_search_NoteRecptn(); return false;" class="btnNew" style="height:20px;width:30px;" ></td>
		<td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
		<td>&nbsp;</td>
		<td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>"  width="8" height="20" alt="버튼이미지"></td>
		<td class="btnBackground"><input type="button" value="삭제" onclick="fn_egov_delete_NoteRecptn(); return false;" class="btnNew" style="height:20px;width:30px;" ></td>
		<td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
	</tr>
	</table>
	</th>
 </tr>
</table>
<!-- 줄간격 -->
<div style="width:100%;height:3px"></div>

<!-- 목록  -->
<table width="100%" cellpadding="0" class="table-line" border="0" summary="목록 을 제공한다.">
<caption>목록 을 제공한다</caption>
<thead>
  <tr>
  	<th scope="col" class="title" width="30px"><input type="checkbox" name="checkAll" id="checkAll" title="전체선택" value="1" onClick="fn_egov_checkAll_NoteRecptn();"></th>
    <th scope="col" class="title" width="35px">순번</th>
    <th scope="col" class="title">제목</th>
    <th scope="col" class="title" width="70px">보낸사람</th>
    <th scope="col" class="title" width="110px">보낸시각</th>
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
	<td class="lt_text3">
		<input type="checkbox" name="checkList" title="선택" value="${resultInfo.noteId},${resultInfo.noteTrnsmitId},${resultInfo.noteRecptnId}">
	</td>
	<td class="lt_text3"><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
	<td class="lt_text3L">
		<div style="visibility:hidden;display:none;"><a href="#LINK_PAGE${status.count}"></a></div>
		<a href="<c:url value='/uss/ion/ntr/detailNoteRecptn.do'/>?pageIndex=${searchVO.pageIndex}&amp;noteId=${resultInfo.noteId}&amp;noteTrnsmitId=${resultInfo.noteTrnsmitId}&amp;noteRecptnId=${resultInfo.noteRecptnId}"><c:out value="${resultInfo.noteSj}"/></a>
	</td>
	<td class="lt_text3"><c:out value="${resultInfo.rcverNm}"/></td>
    <td class="lt_text3"><c:out value="${resultInfo.frstRegisterPnttm}"/></td>
</tr>
</c:forEach>
</tbody>
</table>
<input name="cmd" type="hidden" value="">
<input name="noteId" type="hidden" value="">
<input name="noteTrnsmitId" type="hidden" value="">
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
</form>
<!-- 줄간격 -->
<div style="width:100%;height:3px"></div>

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