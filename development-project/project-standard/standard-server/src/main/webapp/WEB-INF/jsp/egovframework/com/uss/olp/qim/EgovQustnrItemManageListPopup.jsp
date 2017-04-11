<%--
  Class Name : EgovQustnrItemManageList.jsp
  Description : 설문항목 목록 페이지
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
<c:set var="ImgUrl" value="${pageContext.request.contextPath}/images/egovframework/com/cmm/"/>
<c:set var="CssUrl" value="${pageContext.request.contextPath}/css/egovframework/com/"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<base target="_self">
<title>EGOV-COM</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css">
<link type="text/css" rel="stylesheet" href="${CssUrl}button.css">
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/showModalDialogCallee.js'/>" ></script>
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/uss/olp/qim/EgovQustnrItemManageListPopup.do'/>";
   	document.listForm.submit();
}
/* ********************************************************
 * 등록 처리 함수
 ******************************************************** */
function fn_egov_regist_QustnrItemManage(){
	self.href = "<c:url value='/uss/olp/qim/EgovQustnrItemManageRegist.do' />";
}
/* ********************************************************
 * 수정 처리 함수
 ******************************************************** */
//function fn_egov_modify_QustnrItemManage(){
//	self.href = "<c:url value='/uss/olp/qim/EgovQustnrItemManageModify.do' />";
//}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_detail_QustnrItemManage(qustnrIemId){
	var vFrom = document.listForm;
	vFrom.qustnrIemId.value = qustnrIemId;
	vFrom.action = "<c:url value='/uss/olp/qim/EgovQustnrItemManageDetail.do' />";
	vFrom.submit();
}
/* ********************************************************
 * 삭제 처리 함수
 ******************************************************** */
function fn_egov_delete_QustnrItemManage(qestnrId){
	var vFrom = document.listForm;
	if(confirm("삭제 하시겠습니까?")){
		vFrom.qestnrId.value = qestnrId;
		vFrom.cmd.value = 'del';
		vFrom.action = "<c:url value='/uss/olp/qim/EgovQustnrItemManageList.do' />";
		vFrom.submit();
	}else{
		vFrom.cmd.value = '';
	}
}
/* ********************************************************
 * 검색 함수
 ******************************************************** */
function fn_egov_search_QustnrItemManage(){
	var vFrom = document.listForm;

	if(vFrom.searchKeyword.value == ""){
		alert('검색어를 입력해주세요!');
		vFrom.searchKeyword.focus();
		return;
	}

	if(vFrom.searchCondition.selectedIndex == 0){
		alert('검색 구분을 선택해주세요!');
		vFrom.searchCondition.focus();
		return;
	}

	vFrom.action = "<c:url value='/uss/olp/qim/EgovQustnrItemManageList.do' />";
	vFrom.submit();

}

/* ********************************************************
 * 선택한 설문지정보 -> 설문문항 바로가기
 ******************************************************** */
function fn_egov_list_QustnrQestnManag(qestnrId, qestnrTmplatId){
	var vFrom = document.listForm;
	vFrom.qestnrId.value = qestnrId;
	vFrom.qestnrTmplatId.value = qestnrTmplatId;
	vFrom.searchCondition.options[0].selected = true;
	vFrom.searchKeyword.value = '';
	vFrom.searchMode.value = 'Y';
	vFrom.action = "<c:url value='/uss/olp/qqm/EgovQustnrQestnManageList.do' />";
	vFrom.submit();

}

function fn_egov_open_QustnrItemManage(qestnrId, qestnrTmplatId, qustnrIemId, cnt){
	getDialogArguments();
	/* var opener = window.dialogArguments; */
	var opener;
 
	if (window.dialogArguments) {
	    opener = window.dialogArguments; // Support IE
	} else {
	    opener = window.opener;    // Support Chrome, Firefox, Safari, Opera
	}

	opener.document.getElementById("qestnrId").value = qestnrId;
	opener.document.getElementById("qestnrTmplatId").value = qestnrTmplatId;
	opener.document.getElementById("qustnrIemId").value = qustnrIemId;
	opener.document.getElementById("qustnrIemCn").value = document.getElementById("iptText_"+ cnt).value;
	window.returnValue=true;
	window.close();
}


</script>
</head>

<DIV id="content" style="width:712px">
<!-- 자바스크립트 경고 태그  -->
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<form name="listForm" id="listForm" action="<c:url value='/uss/olp/qim/EgovQustnrItemManageListPopup.do'/>" method="post">
<table width="100%" cellpadding="1" class="table-search" border="0">
 <tr>
  <td class="title_left">

   <h1><img src="<c:out value="${ImgUrl}" />icon/tit_icon.gif" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지">&nbsp;설문항목 목록</h1></td>
  <th>
  </th>
  <td width="110px">
   	<select name="searchCondition" class="select" style="width:100%" title="검색조건선택">
		   <option value=''>--선택하세요--</option>
		   <option value='IEM_CN' <c:if test="${searchCondition == 'IEM_CN'}">selected</c:if>>설문항목</option>
		   <option value='FRST_REGISTER_ID' <c:if test="${searchCondition == 'FRST_REGISTER_ID'}">selected</c:if>>등록자</option>
	   </select>
	</td>
  <td width="180px">
<%--     <input name="searchKeyword" type="text" size="10" value="${searchKeyword}" title="검색어 입력" maxlength="35" style="width:100%"> --%>
    <input name="searchKeyword" type="text" size="10" value="" title="검색어 입력" maxlength="35" style="width:100%">
  </td>
  <th width="70px" align="center">
   <table border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
      <td><img src="${ImgUrl}btn/bu2_left.gif"  width="8" height="20" alt="버튼이미지"></td>
      <td class="btnBackground" nowrap><input type="submit" value="<spring:message code="button.inquire" />" onclick="fn_egov_search_QustnrItemManage(); return false;" class="btnNew" style="height:20px;width:26px;padding:0px 0px 0px 0px;" ></td>
      <td><img src="<c:out value="${ImgUrl}" />btn/bu2_right.gif" width="8" height="20" alt="버튼이미지"></td>
      <td>&nbsp;</td>
      <td><img src="<c:out value="${ImgUrl}" />btn/bu2_left.gif" width="8" height="20" alt="버튼이미지"></td>
      <td class="btnBackground" nowrap><a href="<c:url value='/uss/olp/qim/EgovQustnrItemManageRegist.do' />"><spring:message code="button.create" /></a></td>
      <td><img src="<c:out value="${ImgUrl}" />btn/bu2_right.gif" width="8" height="20" alt="버튼이미지"></td>
      <td>&nbsp;</td>
    </tr>
   </table>
  </th>
 </tr>
</table>

<table width="100%" cellpadding="0" class="table-line" summary="이 표는 설문항목 목록 정보를 제공하며, 순번, 항목내용, 기타답변여부, 등록자, 등록일자 정보로 구성되어 있습니다 .">
<thead>
<tr>
	<th scope="col" class="title" width="5%" nowrap>순번</th>
	<th scope="col" class="title" nowrap>항목내용</th>
	<th scope="col" class="title" width="100px" nowrap>기타답변여부</th>
	<th scope="col" class="title" width="15%" nowrap>등록자</th>
	<th scope="col" class="title" width="15%" nowrap>등록일자</th>
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
<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
<tr>
	<td class="lt_text3" nowrap>${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}</td>
	<td class="lt_text3L" nowrap>
	<div class="divDotText" style="width:320px; border:solid 0px;"><a href="#LINK" onClick="fn_egov_open_QustnrItemManage('${resultInfo.qestnrId}', '${resultInfo.qestnrTmplatId}', '${resultInfo.qustnrIemId}', '${status.count}')">${resultInfo.iemCn}</a></div>
	</td>
	<td class="lt_text3" nowrap>${resultInfo.etcAnswerAt}</td>
	<td class="lt_text3" nowrap>${resultInfo.frstRegisterNm}</td>
	<td class="lt_text3" nowrap>${fn:substring(resultInfo.frstRegisterPnttm, 0, 10)}</td>
	<td class="lt_text3" nowrap><a href="#LINK" onClick="fn_egov_open_QustnrItemManage('${resultInfo.qestnrId}', '${resultInfo.qestnrTmplatId}', '${resultInfo.qustnrIemId}', '${status.count}')">선택</a>
	<input name="iptText_${status.count}" id="iptText_${status.count}" type="hidden" value="${resultInfo.iemCn}">
	</td>
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
<input name="qestnrId" id="qestnrId" type="hidden" value="">
<input name="qestnrQesitmId" id="qestnrQesitmId" type="hidden" value="">
<input name="qustnrIemId" id="qustnrIemId" type="hidden" value="">
<input name="searchMode" id="searchMode" type="hidden" value="">

<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">

</form>

</DIV>

