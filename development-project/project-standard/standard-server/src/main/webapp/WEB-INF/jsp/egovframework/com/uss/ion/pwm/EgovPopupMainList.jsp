<%--
  Class Name : EgovPopupManageList.jsp
  Description : 팝업창관리 목록 페이지
  Modification Information

        수정일     수정자           수정내용
    ------------  ---------    ---------------------------
     2009.09.16    장동한          최초 생성
     2014.04.15    유지보수        팝업창 사이즈 오류수정

    author   : 공통서비스 개발팀 장동한
    since    : 2009.09.16

    Copyright (C) 2009 by MOPAS  All right reserved.
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ImgUrl" value="${pageContext.request.contextPath}/images/egovframework/com/cmm/" />
<c:set var="CssUrl" value="${pageContext.request.contextPath}/css/egovframework/com/" />
<c:set var="JsUrl"  value="${pageContext.request.contextPath}/js/egovframework/com/uss/ion/pwm/"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>팝업창관리 관리</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<script type="text/javascript" src="${JsUrl}prototype-1.6.0.3.js"></script>
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css">
<link type="text/css" rel="stylesheet" href="${CssUrl}button.css">
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/uss/ion/pwm/listPopup.do'/>";
   	document.listForm.submit();
}
/* ********************************************************
 * 등록 처리 함수
 ******************************************************** */
function fn_egov_regist_PopupManage(){
	location.href = "<c:url value='/uss/ion/pwm/registPopup.do' />";
}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_detail_PopupManage(popupId){
	var vFrom = document.listForm;
	vFrom.popupId.value = popupId;
	vFrom.action = "<c:url value='/uss/ion/pwm/detailPopup.do' />";
	vFrom.submit();
}

/* ********************************************************
 * 검색 함수
 ******************************************************** */
function fn_egov_search_PopupManage(){
	var vFrom = document.listForm;

	vFrom.action = "<c:url value='/uss/ion/pwm/listPopup.do' />";
	vFrom.submit();

}
/* ********************************************************
* 체크 박스 선택 함수
******************************************************** */
function fn_egov_checkAll_PopupManage(){

	var FLength = document.getElementsByName("checkList").length;
	var checkAllValue = document.getElementById('checkAll').checked;
	//undefined
	if( FLength == 1){
		document.getElementById("checkList").checked = checkAllValue;
	}{
			for(var i=0; i < FLength; i++)
			{
				document.getElementsByName("checkList")[i].checked = checkAllValue;
			}
		}

}
/* ********************************************************
* 팝업창 미리보기
******************************************************** */
function fn_egov_view_PopupManage(){


	var FLength = document.getElementsByName("checkList").length;

	for(var i=0; i < FLength; i++)
	{
		if(document.getElementsByName("checkList")[i].checked == true){
			fn_egov_ajaxPopupInfo_PopupManage( document.getElementsByName("checkList")[i].value );
		}
	}

	return;

}
/* ********************************************************
* 팝업창 정보 Ajax통신으로 정보 획득
******************************************************** */
function fn_egov_ajaxPopupInfo_PopupManage(popupIds){
	var url = "<c:url value='/uss/ion/pwn/ajaxPopupManageInfo.do' />";

	var param = {
			popupId: popupIds
	};

	new Ajax.Request(url,
   {
     asynchronous:true,
     method:"post",
     parameters: param ,
     evalJSON:     false,
     evalJS:       false,
    onLoading  : function() {/*로딩중*/ },
    onSuccess  : function(returnValue)
    {
    	var returnValueArr = returnValue.responseText.split("||");


    	//if(fnGetCookie(popupIds) == null ){
    	   	fn_egov_popupOpen_PopupManage(popupIds,
        	    	returnValueArr[0],
        	    	returnValueArr[1],
        	    	returnValueArr[2],
        	    	returnValueArr[4],
        	    	returnValueArr[3],
        	    	returnValueArr[5]);
    	//}

    },
    onFailure: function() {/*불러오기 실패*/},
    onComplete : function() {/*모든 것을 완료*/}
   });
}
/* ********************************************************
* 팝업창  오픈
******************************************************** */
function fn_egov_init_PopupManage(){
	<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
	<c:if test="${resultInfo.ntceAt eq 'Y'}">
	if(fnGetCookie('${resultInfo.popupId}') == null ){
	 	fn_egov_popupOpen_PopupManage('${resultInfo.popupId}',
	 			'${resultInfo.fileUrl}',
	 			'${resultInfo.popupWidthSize}',
    	    	'${resultInfo.popupVrticlSize}',
    	    	'${resultInfo.popupVrticlLc}',
    	    	'${resultInfo.popupWidthLc}',
    	    	'${resultInfo.stopvewSetupAt}');
	}
	</c:if>
	</c:forEach>
}
/* ********************************************************
* 팝업창  오픈
******************************************************** */
function fn_egov_popupOpen_PopupManage(popupId,fileUrl,width,height,top,left,stopVewAt){

	var url = "<c:url value='/uss/ion/pwm/openPopupManage.do' />?";
	url = url + "fileUrl=" + fileUrl;
	url = url + "&stopVewAt=" + stopVewAt;
	url = url + "&popupId=" + popupId;
	var name = popupId;
	var openWindows = window.open(url,name,"width="+width+",height="+height+",top="+top+",left="+left+",toolbar=no,status=no,location=no,scrollbars=yes,menubar=no,resizable=yes");

	if (window.focus) {openWindows.focus()}
}

/* ********************************************************
* 팝업창  오픈 쿠키 정보 OPEN
******************************************************** */
function fnGetCookie(name) {
	  var prefix = name + "=";

	  var cookieStartIndex = document.cookie.indexOf(prefix);
	  if (cookieStartIndex == -1) return null;
	  var cookieEndIndex = document.cookie.indexOf(";", cookieStartIndex + prefix.length);
	  if (cookieEndIndex == -1) cookieEndIndex = document.cookie.length;


	  return unescape(document.cookie.substring(cookieStartIndex + prefix.length, cookieEndIndex));
}

</script>
</head>
<body onLoad="fn_egov_init_PopupManage()">
<DIV id="content" style="width:712px">
<%-- noscript 테그 --%>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<form name="listForm" action="<c:url value=''/>" method="post">

<table width="100%" cellpadding="1" class="table-search" border="0">
 <tr>
  <td class="title_left">
   <img src="<c:out value="${ImgUrl}" />icon/tit_icon.gif" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지">&nbsp;현재 팝업창 목록
  <td>
 </tr>
</table>


<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<table width="100%" cellpadding="0" class="table-line" border="0">
<thead>
  <tr>
    <th class="title" width="35px" nowrap>순번</th>
    <th class="title" width="120px" nowrap>제목</th>
    <th class="title" width="180px" nowrap>게시일</th>
    <th class="title" nowrap>파일URL</th>
    <th class="title" width="60px" nowrap>게시상태</th>
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
    <td class="lt_text3" nowrap><c:out value="${(popupManageVO.pageIndex-1) * popupManageVO.pageSize + status.count}"/></td>
     <td class="lt_text3L">
     <div class="divDotText" style="width:200px; border:solid 0px;">
     <c:out value="${resultInfo.popupTitleNm}"/>
     </div>
     </td>
    <td class="lt_text3">
 	<c:out value="${fn:substring(resultInfo.ntceBgnde, 0, 4)}"/>-<c:out value="${fn:substring(resultInfo.ntceBgnde, 4, 6)}"/>-<c:out value="${fn:substring(resultInfo.ntceBgnde, 6, 8)}"/> <c:out value="${fn:substring(resultInfo.ntceBgnde, 8, 10)}"/>H <c:out value="${fn:substring(resultInfo.ntceBgnde, 10, 12)}"/>M
 	~
 	<c:out value="${fn:substring(resultInfo.ntceEndde, 0, 4)}"/>-<c:out value="${fn:substring(resultInfo.ntceEndde, 4, 6)}"/>-<c:out value="${fn:substring(resultInfo.ntceEndde, 6, 8)}"/> <c:out value="${fn:substring(resultInfo.ntceEndde, 8, 10)}"/>H <c:out value="${fn:substring(resultInfo.ntceEndde, 10, 12)}"/>M
    <td class="lt_text3L" nowrap>
    <c:out value="${resultInfo.fileUrl}"/>
    </td>
    <td class="lt_text3">
    <c:out value="${resultInfo.ntceAt}"/>
    </td>
</tr>
</c:forEach>
</tbody>
</table>

</form>

</DIV>
</body>
</html>

