<%--
  Class Name : EgovComDamRequestOfferList.jsp
  Description : 지식 정보제공/정보요청 목록
  Modification Information

	수정일         		수정자                 수정내용
    -------    	   --------    ---------------------------
    2010.08.30  	장동한    		 최초 생성
    2011.08.11		정진오		조회 조건 select element 하위 option element value를
    							A.KNO_NM에서 A.KNWLDG_NM로,
 								A.KNO_CN에서 A.KNWLDG_CN로 변경함

    author   : 공통서비스 개발팀 장동한
    since    : 2010.08.30

--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>지식 정보제공/정보요청-목록조회</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_RequestOffer(){
	// 첫 입력란에 포커스..
	document.listForm.searchCondition.focus();
}
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/dam/spe/req/listRequestOffer.do'/>";
   	document.listForm.submit();
}

/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_detail_RequestOffer(noteId,noteTrnsmitId){
	var vFrom = document.listForm;
	vFrom.noteId.value = noteId;
	vFrom.noteTrnsmitId.value = noteTrnsmitId;
	vFrom.action = "<c:url value='/dam/spe/req/detailRequestOffer.do' />";
	vFrom.submit();
}

/* ********************************************************
 * 검색 함수
 ******************************************************** */
function fn_egov_search_RequestOffer(){
	var vFrom = document.listForm;
	vFrom.pageIndex.value = "1";
	vFrom.action = "<c:url value='/dam/spe/req/listRequestOffer.do' />";
	vFrom.submit();

}

</script>
</head>
<body onLoad="fn_egov_initl_RequestOffer();">
<DIV id="content" style="width:712px">
<!-- 자바스크립트 지원 태그  -->
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<form name="listForm" action="<c:url value='/dam/spe/req/listRequestOffer.do'/>" method="post">
<!-- 타이틀/검색폼 -->
<table width="100%" cellpadding="1" class="table-search" border="0">
<tr>
	<td class="title_left">
	<h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align:middle; display:inline-block;" alt="">&nbsp;지식 정보제공/정보요청 목록</h1>
	</td>
	<td width="110px">
   	<select name="searchCondition" title="검색조건" class="select" style="width:100%">
		   <option value=''>--선택하세요--</option>
		   <option value='A.KNWLDG_NM' 		<c:if test="${searchCondition == 'A.KNWLDG_NM'}">selected</c:if>>지식명</option>
		   <option value='A.KNWLDG_CN' 		<c:if test="${searchCondition == 'A.KNWLDG_CN'}">selected</c:if>>지식내용</option>
	   </select>
	</td>
	<td width="180px">
	<input name="searchKeyword" title="검색어" type="text" size="10" value="<c:out value='${searchKeyword}'/>" maxlength="35" style="width:100%" onkeyup="if(window.event.keyCode==13){fn_egov_search_RequestOffer(); return false;}">
  	</td>
	<td width="3px"></td>
	<th width="60px" align="center">
	<table border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td class="button"><input type="submit" value="<spring:message code="button.inquire" />" onclick="fn_egov_search_RequestOffer(); return false;"></td>
		<td>&nbsp;</td>
      	<td class="button" nowrap><a href="<c:url value='/dam/spe/req/registRequestOffer.do'/>?pageIndex=<c:out value='${searchVO.pageIndex}'/>"><spring:message code="button.create" /></a>
	</tr>
	</table>
	</th>
 </tr>
</table>
<!-- 줄간격 -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<!-- 목록  -->
<table width="100%" cellpadding="2" class="table-line" border="0"
summary="이 표는 지식 정보제공/정보요청  정보를 제공하며, 순번, 조직명, 지식유형명, 지식명, 등록자, 등록일자  정보로 구성되어 있습니다 .">
<caption>지식 정보제공/정보요청 목록</caption>
<thead>
  <tr>
    <th scope="col" class="title" width="7%">순번</th>
    <th scope="col" class="title" width="10%">조직명</th>
    <th scope="col" class="title" width="18%">지식유형명</th>
    <th scope="col" class="title" width="35%">지식명</th>
    <th scope="col" class="title" width="15%">등록자</th>
    <th scope="col" class="title" width="15%">등록일자</th>
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
	<td class="lt_text3"><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
	<td class="lt_text3"><c:out value="${resultInfo.orgnztNm}"/></td>
	<td class="lt_text3"><c:out value="${resultInfo.knoTypeNm}"/></td>
	<td class="lt_text3L">
	<c:forEach var="i" begin="1" end="${resultInfo.ansDepth}" step="1">
	<c:if test="${i != resultInfo.ansDepth}">&nbsp;&nbsp;&nbsp;</c:if><c:if test="${i == resultInfo.ansDepth}">┗RE:&nbsp;</c:if>
	</c:forEach>
	<a href="<c:url value='/dam/spe/req/detailRequestOffer.do'/>?pageIndex=${searchVO.pageIndex}&amp;knoId=${resultInfo.knoId}"><c:out value="${resultInfo.knoNm}"/></a>
	</td>
	<td class="lt_text3"><c:out value="${resultInfo.frstRegisterNm}"/></td>
    <td class="lt_text3"><c:out value="${resultInfo.frstRegistPnttm}"/></td>
</tr>
</c:forEach>
</tbody>
</table>
<input name="cmd" type="hidden" value="">
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
</form>
<!-- 줄간격 -->
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

</DIV>

</body>
</html>