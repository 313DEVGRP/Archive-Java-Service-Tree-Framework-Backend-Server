<%--
  Class Name : EgovRssTagManageList.jsp
  Description : RSS태그관리 목록조회
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
<c:set var="ImgUrl" value="/images/egovframework/com/cmm/"/>
<c:set var="CssUrl" value="/css/egovframework/com/"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>RSS태그관리-목록조회</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css">
<link type="text/css" rel="stylesheet" href="${CssUrl}button.css">
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/uss/ion/rss/listRssTagManage.do'/>";
   	document.listForm.submit();
}

/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_detail_RssTagManage(noteId,noteTrnsmitId){
	var vFrom = document.listForm;
	vFrom.noteId.value = noteId;
	vFrom.noteTrnsmitId.value = noteTrnsmitId;
	vFrom.action = "/uss/ion/rss/detailRssTagManage.do";
	vFrom.submit();
}

/* ********************************************************
 * 검색 함수
 ******************************************************** */
function fn_egov_search_RssTagManage(){
	var vFrom = document.listForm;
	vFrom.pageIndex.value = "1";

	if( vFrom.searchCondition.selectedIndex == 0){
		alert("검색조건을 선택 해주세요!");
		vFrom.searchCondition.focus();
		return;
	}

	if( vFrom.searchKeyword.value == ""){
		alert("검색어를 입력 해주세요!");
		vFrom.searchKeyword.focus();
		return;
	}


	vFrom.action = "/uss/ion/rss/listRssTagManage.do";
	vFrom.submit();

}
/* ********************************************************
* 체크 박스 선택 함수
******************************************************** */
function fn_egov_checkAll_RssTagManage(){

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
function fn_egov_delete_RssTagManage(){
	var vFrom = document.listForm;

	if(fn_egov_delCnt_NoteRecptn() == 0){alert("삭제할 목록을 선택해주세요!   "); document.getElementById('checkAll').focus();return;}

	if(confirm("선택된 정보를 삭제 하시겠습니까?")){
		vFrom.action = "/uss/ion/rss/listRssTagManage.do";
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
<form name="listForm" action="<c:url value='/uss/ion/rss/listRssTagManage.do'/>" method="post">
<!-- 타이틀/검색폼 -->
<table width="100%" cellpadding="1" border="0" summary="타이틀/검색폼/등록 버튼을 제공한다.">
<caption>타이틀/검색폼/등록 버튼을 제공한다.</caption>
<tr>
	<th scope="col" class="title_left">
	<h1><img src="<c:out value="${ImgUrl}"/>icon/tit_icon.gif" width="16" height="16" hspace="3" style="vertical-align:middle; display:inline-block;" alt=" ">&nbsp;RSS태그관리 목록조회</h1>
	</th>
	<td width="110px">
	<label for="searchCondition"> </label>
   	<select name="searchCondition" title="검색조건" class="select" style="width:100%">
		   <option value=''>--선택하세요--</option>
		   <option value='A.TRGET_SVC_NM' 		<c:if test="${searchCondition == 'A.TRGET_SVC_NM'}">selected</c:if>>대상서비스명</option>
		   <option value='A.TRGET_SVC_TABLE'	<c:if test="${searchCondition == 'A.TRGET_SVC_TABLE'}">selected</c:if>>대상테이블명</option>
		   <option value='A.HDER_TITLE'			<c:if test="${searchCondition == 'A.HDER_TITLE'}">selected</c:if>>헤더TITLE</option>
		   <option value='A.HDER_LINK'			<c:if test="${searchCondition == 'A.HDER_LINK'}">selected</c:if>>헤더LINK</option>
		   <option value='A.HDER_DESCRIPTION'	<c:if test="${searchCondition == 'A.HDER_DESCRIPTION'}">selected</c:if>>헤더DESCRIPTION</option>
		   <option value='A.HDER_TAG'			<c:if test="${searchCondition == 'A.HDER_TAG'}">selected</c:if>>헤더TAG</option>
		   <option value='A.HDER_ETC'			<c:if test="${searchCondition == 'A.HDER_ETC'}">selected</c:if>>헤더ETC</option>
		   <option value='A.BDT_LINK'			<c:if test="${searchCondition == 'A.BDT_LINK'}">selected</c:if>>본문LINK</option>
		   <option value='A.BDT_DESCRIPTION'	<c:if test="${searchCondition == 'A.BDT_DESCRIPTION'}">selected</c:if>>본문DESCRIPTION</option>
		   <option value='A.BDT_TAG'			<c:if test="${searchCondition == 'A.BDT_TAG'}">selected</c:if>>본문TAG</option>
		   <option value='A.BDT_ETC'			<c:if test="${searchCondition == 'A.BDT_ETC'}">selected</c:if>>본문ETC</option>
	   </select>
	</td>
	<td width="180px">
	<label for="searchKeyword"> </label>
	<input name="searchKeyword" title="검색어" type="text" size="10" value="<c:out value='${searchKeyword}'/>" maxlength="35" style="width:100%" onkeyup="if(window.event.keyCode==13){fn_egov_search_RssTagManage(); return false;}">
  	</td>
	<td width="3px"></td>
	<th width="60px" align="center">
	<table border="0" cellspacing="0" cellpadding="0" align="center"  summary="조회/삭제/등록 버튼을 제공한다.">
	<caption>조회/삭제/등록 버튼을 제공한다</caption>
	<tr>
		<td><img src="${ImgUrl}btn/bu2_left.gif"  width="8" height="20" alt="버튼이미지"></td>
		<td class="btnBackground"><input type="submit" value="<spring:message code="button.inquire" />" onclick="fn_egov_search_RssTagManage(); return false;" class="btnNew" style="height:20px;width:30px;" ></td>
		<td><img src="<c:out value="${ImgUrl}"/>btn/bu2_right.gif" width="8" height="20" alt="버튼이미지"></td>
		<th scope="col">&nbsp;</th>
		<td><img src="${ImgUrl}btn/bu2_left.gif"  width="8" height="20" alt="버튼이미지"></td>
		<td class="btnBackground"><input type="button" value="삭제" onclick="fn_egov_delete_RssTagManage(); return false;" class="btnNew" style="height:20px;width:30px;" ></td>
		<td><img src="<c:out value="${ImgUrl}"/>btn/bu2_right.gif" width="8" height="20" alt="버튼이미지"></td>
		<td>&nbsp;</td>
		<td><img src="<c:out value="${ImgUrl}"/>btn/bu2_left.gif"  width="8" height="20"></td>
      	<td class="btnBackground" nowrap><a href="/uss/ion/rss/registRssTagManage.do?pageIndex=<c:out value='${searchVO.pageIndex}'/>"><spring:message code="button.create" /></a>
      	<td><img src="<c:out value="${ImgUrl}"/>btn/bu2_right.gif" width="8" height="20" alt="버튼이미지"></td>
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
  	<th scope="col" class="title" width="30px"><input type="checkbox" name="checkAll" id="checkAll" title="전체선택" value="1" onClick="fn_egov_checkAll_RssTagManage();"></th>
    <th scope="col" class="title" width="35px">순번</th>
    <th scope="col" class="title">대상서비스명</th>
    <th scope="col" class="title" width="200px">대상테이블명</th>
    <th scope="col" class="title" width="70px">작성자</th>
    <th scope="col" class="title" width="70px">등록일자</th>
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
		<input type="checkbox" name="checkList" title="선택" value="${resultInfo.rssId}">
	</td>
	<td class="lt_text3"><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
	<td class="lt_text3L" style="word-break;break-all">
	<div style="visibility:hidden;display:none;"><a href="#LINK_PAGE${status.count}"></a></div>
	<a href="/uss/ion/rss/detailRssTagManage.do?pageIndex=${searchVO.pageIndex}&amp;rssId=${resultInfo.rssId}"><c:out value="${resultInfo.trgetSvcNm}"/></a>
	</td>
	<td class="lt_text3L" style="word-break;break-all">
	<div class="divDotText" style="width:200px;border:0px;">
	<a href="/uss/ion/rss/detailRssTagManage.do?pageIndex=${searchVO.pageIndex}&amp;rssId=${resultInfo.rssId}"><c:out value="${resultInfo.trgetSvcTable}"/></a>
	</div>
	</td>
	<td class="lt_text3"><c:out value="${resultInfo.frstRegisterNm}"/></td>
    <td class="lt_text3"><c:out value="${resultInfo.frstRegisterPnttm}"/></td>
</tr>
</c:forEach>
</tbody>
</table>
<input name="cmd" type="hidden" value="">
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