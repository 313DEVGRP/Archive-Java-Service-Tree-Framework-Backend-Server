<%--
  Class Name : EgovMeetingManageList.jsp
  Description : 회의정보 목록 페이지
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.03.09    장동한          최초 생성
     2010.08.06    장동한          웹표준화/장애인접근성적용

    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.09

--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ImgUrl" value="${pageContext.request.contextPath}/images/egovframework/com/cmm/"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>회의정보 목록</title>
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />">
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/uss/olp/mgt/EgovMeetingManageList.do'/>";
   	document.listForm.submit();
}
/* ********************************************************
 * 등록 처리 함수
 ******************************************************** */
function fn_egov_regist_MeetingManage(){
	location.href = "<c:url value='/uss/olp/mgt/EgovMeetingManageRegist.do' />";
}
/* ********************************************************
 * 수정 처리 함수
 ******************************************************** */
function fn_egov_modify_MeetingManage(){
	location.href = "<c:url value='/uss/olp/mgt/EgovMeetingManageModify.do' />";
}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_detail_MeetingManage(mtgId){
	var vFrom = document.listForm;
	vFrom.mtgId.value = mtgId;
	vFrom.action = "<c:url value='/uss/olp/mgt/EgovMeetingManageDetail.do' />";
	vFrom.submit();
}
/* ********************************************************
 * 삭제 처리 함수
 ******************************************************** */
function fn_egov_delete_MeetingManage(mtgId){
	var vFrom = document.listForm;
	if(confirm("삭제 하시겠습니까?")){
		vFrom.mtgId.value = mtgId;
		vFrom.cmd.value = 'del';
		vFrom.action = "<c:url value='/uss/olp/mgt/EgovMeetingManageList.do' />";
		vFrom.submit();
	}else{
		vFrom.cmd.value = '';
	}
}
/* ********************************************************
 * 검색 함수
 ******************************************************** */
function fn_egov_search_MeetingManage(){
	var vFrom = document.listForm;


	vFrom.action = "<c:url value='/uss/olp/mgt/EgovMeetingManageList.do' />";
	vFrom.submit();

}
</script>
</head>
<body>

<DIV id="content" style="width:712px">
<!-- 자바스크립트 경고 태그  -->
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<form name="listForm" id="listForm" action="#" method="post">
<table width="100%" cellpadding="1" border="0">
 <tr>
  <th scope="col" class="title_left">
	<h1><img src="<c:out value="${ImgUrl}" />icon/tit_icon.gif" width="16" height="16" hspace="3"  style="vertical-align:middle; display:inline-block;" alt="제목아이콘이미지">&nbsp;회의정보 목록</h1>
  </th>
  <td width="110px">
   	<select name="searchCondition" class="select" style="width:100%" title="검색조건선택">
		   <option value=''>--선택하세요--</option>
		   <option value='MTG_NM' <c:if test="${searchCondition == 'MTG_NM'}">selected</c:if>>회의명</option>
		   <option value='MTG_MTR_CN' <c:if test="${searchCondition == 'MTG_MTR_CN'}">selected</c:if>>회의안건내용</option>
	   </select>
	</td>
  <td width="180px">
    <input name="searchKeyword" type="text" size="10" value="${searchKeyword}" maxlength="35" style="width:100%" title="검색단어입력">
  </td>
  <td width="1px"></td>
  <th width="70px" align="center">
   <table border="0" cellspacing="0" cellpadding="0" align="center" summary="조회/등록 버튼을 제공한다.">
   <caption>조회/등록 버튼을 제공한다</caption>
    <tr>
      <td><img src="${ImgUrl}btn/bu2_left.gif"  width="8" height="20" alt="버튼이미지"></td>
      <td class="btnBackground" nowrap><input type="submit" value="<spring:message code="button.inquire" />" onclick="fn_egov_search_MeetingManage(); return false;" class="btnNew" style="height:20px;width:26px;padding:0px 0px 0px 0px;" ></td>
      <td><img src="<c:out value="${ImgUrl}" />btn/bu2_right.gif" width="8" height="20" alt="버튼이미지"></td>
      <th scope="col">&nbsp;</th>
      <td><img src="<c:out value="${ImgUrl}" />btn/bu2_left.gif" width="8" height="20" alt="버튼이미지"></td>
      <td class="btnBackground" nowrap><a href="<c:url value='/uss/olp/mgt/EgovMeetingManageRegist.do' />"><spring:message code="button.create" /></a></td>
      <td><img src="<c:out value="${ImgUrl}" />btn/bu2_right.gif" width="8" height="20" alt="버튼이미지"></td>
      <th scope="col">&nbsp;</th>
    </tr>
   </table>

  </th>
 </tr>
</table>
<input name="mtgId" type="hidden" value="">
<input name="mtgNm" type="hidden" value="">
<input name="mtgMtrCn" type="hidden" value="">
<input name="mtgSn" type="hidden" value="">
<input name="mtgCo" type="hidden" value="">
<input name="mtgDe" type="hidden" value="">
<input name="cmd" type="hidden" value="">
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
</form>

<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<table width="100%" cellpadding="0" class="table-line" border="0" summary="목록 을 제공한다.">
<caption>목록 을 제공한다</caption>
<thead>
<tr>
    <th scope="col" class="title" width="35px" nowrap>순번</th>
    <th scope="col" class="title" width="80px" nowrap>회의일자</th>
    <th scope="col" class="title" nowrap>회의명</th>
    <th scope="col" class="title" width="100px" nowrap>회의장소</th>

    <th scope="col" class="title" width="80px" nowrap>회의시작시간</th>
    <th scope="col" class="title" width="80px" nowrap>회의종료시간</th>


    <th scope="col" class="title" width="70px" nowrap>작성자명</th>
    <th scope="col" class="title" width="70px" nowrap>등록일자</th>
</tr>
</thead>
<tbody>
<%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
<c:if test="${fn:length(resultList) == 0}">
<tr>
<td class="lt_text3" colspan="9">
	<spring:message code="common.nodata.msg" />
</td>
</tr>
</c:if>
 <%-- 데이터를 화면에 출력해준다 --%>
<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
  <tr>
		<td class="lt_text3">${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}</td>
		<td class="lt_text3">
	    	<form name="subForm" method="post" action="<c:url value='/uss/olp/mgt/EgovMeetingManageDetail.do'/>">
	    	<input name="mtgId" type="hidden" value="${resultInfo.mtgId}">
			<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
	    	<span class="link"><input type="submit" style="width:80px;border:solid 0px black;text-align:left;" value="<c:out value="${resultInfo.mtgDe}"/>" onclick="fn_egov_detail_MeetingManage('${resultInfo.mtgId}'); return false;"></span>
	    	</form>
		</td>
		<td>
			<form name="subForm" method="post" action="<c:url value='/uss/olp/mgt/EgovMeetingManageDetail.do'/>">
	    	<input name="mtgId" type="hidden" value="${resultInfo.mtgId}">
			<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
	    	<span class="link"><input type="submit" style="width:220px;border:solid 0px black;text-align:left;" value="<c:out value="${resultInfo.mtgNm}"/>" onclick="fn_egov_detail_MeetingManage('${resultInfo.mtgId}'); return false;"></span>
	    	</form>

		</td>
		<td class="lt_text3">${resultInfo.mtgPlace}</td>

		<td class="lt_text3">
		<c:forTokens var="one"
		            items="${resultInfo.mtgBeginTime}"
		            delims=":" varStatus="sts">
		         <c:if test="${sts.count == 1}">${one}시</c:if>
		         <c:if test="${sts.count == 2}">${one}분</c:if>
		</c:forTokens>
		</td>
		<td class="lt_text3">
		<c:forTokens var="one"
		            items="${resultInfo.mtgEndTime}"
		            delims=":" varStatus="sts">
		         <c:if test="${sts.count == 1}">${one}시</c:if>
		         <c:if test="${sts.count == 2}">${one}분</c:if>
		</c:forTokens>
		</td>
		<td class="lt_text3">${resultInfo.frstRegisterNm}</td>
		<td class="lt_text3" nowrap>${fn:substring(resultInfo.frstRegisterPnttm, 0, 10)}</td>
  </tr>
</c:forEach>
</tbody>
</table>

<div style="width:100%;border:solid 0px #000000;height:3px"></div>

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
