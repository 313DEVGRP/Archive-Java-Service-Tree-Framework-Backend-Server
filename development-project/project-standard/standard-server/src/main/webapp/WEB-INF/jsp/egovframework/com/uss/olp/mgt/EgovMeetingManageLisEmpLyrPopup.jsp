<%--
  Class Name : EgovMeetingManageList.jsp
  Description : 회의정보 목록 페이지
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
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ImgUrl" value="${pageContext.request.contextPath}/images/egovframework/com/cmm/"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>사용자 검색 팝업</title>
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />">
<base target="_self">
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/showModalDialogCallee.js'/>" ></script>
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

	vFrom.action = "<c:url value='/uss/olp/mgt/EgovMeetingManageLisEmpLyrPopup.do' />";
	vFrom.submit();

}
/* ********************************************************
 * 선택 처리 함수
 ******************************************************** */
function fn_egov_open_Popup(cnt, esntlId){

	getDialogArguments();
	/* var opener = window.dialogArguments; */
	var opener;
	 
	if (window.dialogArguments) {
	    opener = window.dialogArguments; // Support IE
	} else {
	    opener = window.opener;    // Support Chrome, Firefox, Safari, Opera
	}
	/*
	회의관리/주관자ID
	*/
	if(opener[1] == "typeMeeting"){
		opener[0].document.getElementById("mnaerId").value = esntlId;
		opener[0].document.getElementById("mnaerNm").value = document.getElementById("iptText_"+ cnt).value;
	}else if(opener[1] == "typeDeptSchdule"){
		opener[0].document.getElementById("schdulChargerId").value = esntlId;
		opener[0].document.getElementById("schdulChargerName").value = document.getElementById("iptText_"+ cnt).value;
	}

	window.returnValue=true;
	window.close();

}
</script>
</head>
<body>
<DIV id="content" style="width:712px">
<!-- 자바스크립트 경고 태그  -->
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<form name="listForm" id="listForm" action="<c:url value='/uss/olp/mgt/EgovMeetingManageLisEmpLyrPopup.do'/>" method="post">
<table width="100%" cellpadding="1" class="table-search" border="0" summary="타이틀/검색폼/조회 버튼을 제공한다.">
<caption>타이틀/검색폼/조회 버튼을 제공한다.</caption>
 <tr>
  <td class="title_left">
	<h1><img src="<c:out value="${ImgUrl}" />icon/tit_icon.gif" width="16" height="16" hspace="3" style="vertical-align:middle; display:inline-block;" alt="제목아이콘이미지">&nbsp;아이디 검색</h1>
  </td>
  <th scope="col"></th>
  <td width="110px">
   	<select name="searchCondition" class="select" style="width:100%" title="검색조건선택">
		   <option value=''>--선택하세요--</option>
		   <option value='USER_NM' <c:if test="${searchCondition == 'USER_NM'}">selected</c:if>>이름</option>
		   <option value='EMPLYR_ID' <c:if test="${searchCondition == 'EMPLYR_ID'}">selected</c:if>>아이디</option>
		   <option value='OFFM_TELNO' <c:if test="${searchCondition == 'OFFM_TELNO'}">selected</c:if>>전화번호</option>
	   </select>
	</td>
  <td width="180px">
    <input name="searchKeyword" type="text" size="10" value="${searchKeyword}" maxlength="35" style="width:100%" title="검색단어입력">
  </td>
  <th width="30px" align="center">

   <table border="0" cellspacing="0" cellpadding="0" align="center" summary="조회 버튼을 제공한다.">
   <caption>조회 버튼을 제공한다</caption>
    <tr>
      <td><img src="${ImgUrl}btn/bu2_left.gif"  width="8" height="20" alt="버튼이미지"></td>
      <td class="btnBackground" nowrap><input type="submit" value="<spring:message code="button.inquire" />" onclick="fn_egov_search_MeetingManage(); return false;" class="btnNew" style="height:20px;width:26px;padding:0px 0px 0px 0px;" ></td>
      <td><img src="<c:out value="${ImgUrl}" />btn/bu2_right.gif" width="8" height="20" alt="버튼이미지"></td>
      <th scope="col"></th>
    </tr>
   </table>

  </th>
 </tr>
</table>

<div style="width:100%;border:solid 0px #000000;height:3px"></div>

<table width="100%" cellpadding="0" class="table-line" border="0" summary="목록 을 제공한다.">
<caption>목록 을 제공한다</caption>
<thead>
<tr>
    <th scope="col" class="title" width="35px" nowrap>순번</th>
    <th scope="col" class="title" width="100px" nowrap>아이디</th>
    <th scope="col" class="title" width="100px"  nowrap>이름</th>
    <th scope="col" class="title" width="100px" nowrap>전화번호</th>
    <th scope="col" class="title">주소</th>
    <th scope="col" class="title" width="30px" nowrap></th>
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
<%--
	EMPLYR_ID,
	EMPLYR_NM,
	UNIQ_ID,
	SEXDSTN_CODE,
	BRTH,
	HOMEADRES,
	DETAIL_ADRES,
	EMAIL_ADRES,
	OFFM_TELNO
--%>
<%-- 데이터를 화면에 출력해준다  --%>
<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
<tr>
		<td class="lt_text3">${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}</td>
		<td class="lt_text3L">${resultInfo.emplyrId}</td>
		<td class="lt_text3L">${resultInfo.userNm}</td>
		<td class="lt_text3">${resultInfo.offmTelno}</td>
		<td class="lt_text3L">${resultInfo.homeadres} ${resultInfo.detailAdres}</td>

    	<td class="lt_text3L"><a href="#LINK" onClick="JavaScript:fn_egov_open_Popup('${status.count}', '${resultInfo.esntlId}')">선택</a>
    	<input name="iptText_${status.count}" id="iptText_${status.count}" type="hidden" value="${resultInfo.emplyrId}">
    	</td>
</tr>
</c:forEach>
</tbody>
</table>

</form>

</DIV>
</body>
</html>
