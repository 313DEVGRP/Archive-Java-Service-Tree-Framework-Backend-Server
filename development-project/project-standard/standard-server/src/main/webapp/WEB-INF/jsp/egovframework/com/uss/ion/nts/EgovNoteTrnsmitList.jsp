<%--
  Class Name : EgovNoteTrnsmitList.jsp
  Description : 보낸쪽지함관리 목록조회
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.07.27    장동한          최초 생성

    author   : 공통서비스 개발팀 장동한
    since    : 2009.07.27

--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>보낸쪽지함 관리-목록조회</title>
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
	document.listForm.action = "<c:url value='/uss/ion/nts/listNoteTrnsmit.do'/>";
   	document.listForm.submit();
}

/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_detail_NoteTrnsmit(noteId,noteTrnsmitId){
	var vFrom = document.listForm;
	vFrom.noteId.value = noteId;
	vFrom.noteTrnsmitId.value = noteTrnsmitId;
	vFrom.action = "<c:url value='/uss/ion/nts/detailNoteTrnsmit.do'/>";
	vFrom.submit();
}

/* ********************************************************
 * 검색 함수
 ******************************************************** */
function fn_egov_search_NoteTrnsmit(){
	var vFrom = document.listForm;
	vFrom.pageIndex.value = "1";
	vFrom.action = "<c:url value='/uss/ion/nts/listNoteTrnsmit.do'/>";
	vFrom.submit();

}
/* ********************************************************
* 수신자 목록 팝업
******************************************************** */
function fn_egov_cnfirm_NoteTrnsmit(noteId){
	var left = (screen.width-800)/2;
	var top = (screen.height-500)/3;
	var url = "<c:url value='/uss/ion/nts/selectNoteTrnsmitCnfirm.do'/>?noteId=" + noteId;
	var name = "";
	var width = 755;
	var height = 500;

	var openWindows = window.open(url,name,"width="+width+",height="+height+",top="+top+",left="+left+",toolbar=no,status=no,location=no,scrollbars=yes,menubar=no,resizable=yes");

	if (window.focus) {openWindows.focus()}
}

/* ********************************************************
* 체크 박스 선택 함수
******************************************************** */
function fn_egov_checkAll_NoteTrnsmit(){

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
function fn_egov_delete_NoteTrnsmit(){
	var vFrom = document.listForm;

	if(fn_egov_delCnt_NoteRecptn() == 0){alert("삭제할 목록을 선택해주세요!   "); document.getElementById('checkAll').focus();return;}

	if(confirm("선택된 보낸쪽지함을 삭제 하시겠습니까?")){
		vFrom.action = "<c:url value='/uss/ion/nts/listNoteTrnsmit.do'/>";
		vFrom.cmd.value = 'del';
		vFrom.submit();
	}

}
</script>

</head>
<body>
<DIV id="content" style="width:712px">
<!-- 자바스크립트 경고  -->
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<form name="listForm" action="<c:url value='/uss/ion/nts/listNoteTrnsmit.do'/>" method="post">

<div class="title_left" style="width:100%;margin:0 0 0 0;">
	<h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif'/>" width="16" height="16" hspace="3" style="vertical-align:middle; display:inline-block;" alt=" ">&nbsp;보낸쪽지함 목록조회</h1>
</div>

<!-- 타이틀/검색폼 -->
<table width="100%" cellpadding="1" border="0" summary="타이틀/검색폼을 제공한다.">
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
   	<select name="searchCondition" class="select" style="width:100%" title="검색조건선택">
		   <option value=''>--선택하세요--</option>
		   <option value='NOTE.NOTE_SJ' <c:if test="${searchCondition == 'NOTE.NOTE_SJ'}">selected</c:if>>쪽지제목</option>
		   <option value='NOTE.NOTE_CN' <c:if test="${searchCondition == 'NOTE.NOTE_CN'}">selected</c:if>>쪽지내용</option>
	 </select>
	</td>
  <td width="180px">
  <label for="searchKeyword"> </label>
    <input name="searchKeyword" type="text" size="10" value="<c:out value='${searchKeyword}'/>" maxlength="35" title="검색어" style="width:100%" onkeyup="if(window.event.keyCode==13){fn_egov_search_NoteTrnsmit(); return false;}">
  </td>
  <td width="3px"></td>
  <th width="60px" align="center">
   <table border="0" cellspacing="0" cellpadding="0" align="center" summary="조회/삭제 버튼을 제공한다.">
   	<caption>조회/삭제 버튼을 제공한다</caption>
    <tr>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>"  width="8" height="20" alt="버튼이미지"></td>
      <td class="btnBackground"><input type="submit" value="<spring:message code="button.inquire" />" onclick="fn_egov_search_NoteTrnsmit(); return false;" class="btnNew" style="height:20px;width:30px;" ></td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
      <th scope="col">&nbsp;</th>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>"  width="8" height="20" alt="버튼이미지"></td>
      <td class="btnBackground"><input type="button" value="삭제" onclick="fn_egov_delete_NoteTrnsmit(); return false;" class="btnNew" style="height:20px;width:30px;" ></td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
    </tr>
   </table>
  </th>
 </tr>
</table>
<input name="cmd" type="hidden" value="">
<input name="noteId" type="hidden" value="">
<input name="noteTrnsmitId" type="hidden" value="">
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
<!-- 줄간격 -->
<div style="width:100%;height:3px"></div>

<!-- 목록 -->
<table width="100%" cellpadding="0" class="table-line" border="0" summary="목록 을 제공한다.">
<caption>목록 을 제공한다</caption>
<thead>
  <tr>
	<th scope="col" class="title" width="30px"><input type="checkbox" name="checkAll" id="checkAll" title="전체선택" value="1" onClick="fn_egov_checkAll_NoteTrnsmit();"></th>
    <th scope="col" class="title" width="35px">순번</th>
    <th scope="col" class="title">제목</th>
    <th scope="col" class="title" width="80px">받는사람</th>
    <th scope="col" class="title" width="80px">개봉/미개봉</th>
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
		<input type="checkbox" name="checkList" title="선택" value="${resultInfo.noteId},${resultInfo.noteTrnsmitId}">
	</td>
	<td class="lt_text3"><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
	<td class="lt_text3L">
		<div style="visibility:hidden;display:none;"><a href="#LINK_PAGE${status.count}"></a></div>
		<a href="<c:url value='/uss/ion/nts/detailNoteTrnsmit.do'/>?pageIndex=${searchVO.pageIndex}&amp;noteId=${resultInfo.noteId}&amp;noteTrnsmitId=${resultInfo.noteTrnsmitId}"><c:out value="${resultInfo.noteSj}"/></a>
   	</td>
	<td class="lt_text3">
	<a href="<c:url value='/uss/ion/nts/selectNoteTrnsmitCnfirm.do'/>?noteId=${resultInfo.noteId}" onclick="fn_egov_cnfirm_NoteTrnsmit('${resultInfo.noteId}');return false" title="수신상태조회 새창으로">
	<c:out value="${resultInfo.rcverNm}"/><c:if test="${resultInfo.rcverCnt ne '0'}">&nbsp;외&nbsp; ${resultInfo.rcverCnt}명</c:if>
	</a>
	</td>
	<td class="lt_text3"><a href="<c:url value='/uss/ion/nts/selectNoteTrnsmitCnfirm.do'/>?noteId=${resultInfo.noteId}" onclick="fn_egov_cnfirm_NoteTrnsmit('${resultInfo.noteId}');return false" title="수신상태조회 새창으로">${resultInfo.openY}/${resultInfo.openN}</a></td>
    <td class="lt_text3"><c:out value="${resultInfo.frstRegisterPnttm}"/></td>
</tr>
</c:forEach>
</tbody>
</table>
</form>
<!-- 줄간격 -->
<div style="width:100%;height:3px"></div>

<!-- 페이지 네비게이션 -->
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