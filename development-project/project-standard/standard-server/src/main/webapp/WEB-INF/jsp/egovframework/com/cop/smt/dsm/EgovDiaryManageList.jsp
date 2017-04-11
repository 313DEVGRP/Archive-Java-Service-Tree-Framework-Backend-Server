<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
  Class Name : EgovDiaryManageList.jsp
  Description : 일지관리 목록 페이지
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2008.03.09    장동한          최초 생성

    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.09

--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ImgUrl" value="/images/egovframework/com/cop/smt/dsm/"/>
<c:set var="CssUrl" value="/css/egovframework/com/"/>

<html lang="ko">
<head>
<title>EGOV-COM</title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>

<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css'/>">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css'/>">
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/cop/smt/dsm/EgovDiaryManageList.do'/>";
   	document.listForm.submit();
}
/* ********************************************************
 * 등록 처리 함수
 ******************************************************** */
function fn_egov_regist_DiaryManage(){
	location.href = "<c:url value='/cop/smt/dsm/EgovDiaryManageRegist.do' />";
}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_detail_DiaryManage(diaryId){
	var vFrom = document.subForm;
	vFrom.diaryId.value = diaryId;
	vFrom.action = "<c:url value='/cop/smt/dsm/EgovDiaryManageDetail.do' />";
	vFrom.submit();
}

/* ********************************************************
 * 검색 함수
 ******************************************************** */
function fn_egov_search_DiaryManage(){
	var vFrom = document.listForm;

	vFrom.action = "<c:url value='/cop/smt/dsm/EgovDiaryManageList.do' />";
	vFrom.submit();

}



</script>
</head>

<DIV id="content" style="width:712px">

<form name="listForm" action="<c:url value='/cop/smt/dsm/EgovDiaryManageList.do'/>" method="post">
<input name="diaryId" type="hidden" value="">
<input name="searchMode" type="hidden" value="">
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
<table width="100%" cellpadding="1" class="table-search" border="0">
 <tr>
  <td class="title_left">
	<h1>
  		<img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif'/>" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지">&nbsp;일지관리 목록
  	</h1>
  </td>
  <th>
  </th>
  <td width="110px">
   	<select name="searchCondition" class="select" style="width:100%" title="검색조건선택">
		   <option value=''>--선택하세요--</option>
		   <option value='DIARY_NM' <c:if test="${searchCondition == 'DIARY_NM'}">selected</c:if>>일지명</option>
		   <option value='DRCT_MATTER' <c:if test="${searchCondition == 'DRCT_MATTER'}">selected</c:if>>지시사항</option>
		   <option value='PARTCLR_MATTER' <c:if test="${searchCondition == 'PARTCLR_MATTER'}">selected</c:if>>특이사항</option>
	   </select>
	</td>
  <td width="180px">
    <input name="searchKeyword" type="text" size="10" value="" maxlength="35" style="width:100%" title="검색어 입력">
  </td>
  <td></td>
  <th width="70px" align="center">
   <table border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
      <td><span class="button"><input type="submit" value="<spring:message code="button.inquire" />" onclick="fn_egov_search_DiaryManage(); return false;" ></span></td>
      <td>&nbsp;</td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt="버튼이미지"></td>
      <td class="btnBackground" nowrap><a href="<c:url value='/cop/smt/dsm/EgovDiaryManageRegist.do'/>"><spring:message code="button.create" /></a></td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
    </tr>
   </table>
  </th>
 </tr>
</table>
</form>

<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<table width="100%" cellpadding="0" class="table-line" border="0"  summary="순번, 일지명, 진척율, 등록자명, 등록일자 목록입니다">
<thead>
  <tr>
    <th scope="col" class="title" width="35px" nowrap>순번</th>
    <th scope="col" class="title" nowrap>일지명</th>
    <th scope="col" class="title" width="60px" nowrap>진척율</th>
    <th scope="col" class="title" width="70px" nowrap>등록자명</th>
    <th scope="col" class="title" width="70px" nowrap>등록일자</th>
  </tr>
</thead>
<tbody>
<%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
<c:if test="${fn:length(resultList) == 0}">
<tr>
<td class="lt_text3" colspan="5">
	<spring:message code="common.nodata.msg" />
</td>
</tr>
</c:if>
 <%-- 데이터를 화면에 출력해준다 --%>
<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
<tr>
    <td class="lt_text3" nowrap>${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}</td>
    <td class="lt_text3L" nowrap>
   		<form name="subForm" method="post" action="<c:url value='/cop/smt/dsm/EgovDiaryManageDetail.do'/>">
			<input name="diaryId" type="hidden" value="<c:out value='${resultInfo.diaryId}'/>">
			<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
    		<span class="link"><input type="submit" style="width:320px;border:solid 0px black;text-align:left;" value="<c:out value="${resultInfo.diaryNm}"/>" onclick="fn_egov_detail_DiaryManage('${resultInfo.diaryId}'); return false;"></span>
    	</form>
    </td>
    <td class="lt_text3"><c:out value='${resultInfo.diaryProcsPte}'/>%</td>
    <td class="lt_text3"><c:out value='${resultInfo.frstRegisterNm}'/></td>
    <td class="lt_text3"><c:out value='${resultInfo.frstRegisterPnttm}'/></td>
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

</DIV>

