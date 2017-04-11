<%--
  Class Name : EgovQustnrManageList.jsp
  Description : 설문관리 목록 페이지
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
<title>설문관리 목록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css">
<link type="text/css" rel="stylesheet" href="${CssUrl}button.css">
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/uss/olp/qmc/EgovQustnrManageList.do'/>";
   	document.listForm.submit();
}
/* ********************************************************
 * 등록 처리 함수
 ******************************************************** */
function fn_egov_regist_QustnrManage(){
	location.href = "<c:url value='/uss/olp/qmc/EgovQustnrManageRegist.do' />";
}
/* ********************************************************
 * 수정 처리 함수
 ******************************************************** */
function fn_egov_modify_QustnrManage(){
	location.href = "<c:url value='/uss/olp/qmc/EgovQustnrManageModify.do' />";
}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_detail_QustnrManage(qestnrId){
	var vFrom = document.listForm;
	vFrom.qestnrId.value = qestnrId;
	vFrom.action = "<c:url value='/uss/olp/qmc/EgovQustnrManageDetail.do' />";
	vFrom.submit();
}
/* ********************************************************
 * 삭제 처리 함수
 ******************************************************** */
function fn_egov_delete_QustnrManage(qestnrId){
	var vFrom = document.listForm;
	if(confirm("삭제 하시겠습니까?")){
		vFrom.qestnrId.value = qestnrId;
		vFrom.cmd.value = 'del';
		vFrom.action = "<c:url value='/uss/olp/qmc/EgovQustnrManageList.do' />";
		vFrom.submit();
	}else{
		vFrom.cmd.value = '';
	}
}
/* ********************************************************
 * 검색 함수
 ******************************************************** */
function fn_egov_search_QustnrManage(){
	var vFrom = document.listForm;

	vFrom.action = "<c:url value='/uss/olp/qmc/EgovQustnrManageList.do' />";
	vFrom.submit();

}

/* ********************************************************
 * 선택한 설문지정보 -> 설문문항 바로가기
 ******************************************************** */
function fn_egov_list_QustnrQestnManag(qestnrId, qestnrTmplatId, Type){
	var vFrom = document.listForm;
	var sAction = "";
	vFrom.qestnrId.value = qestnrId;
	vFrom.qestnrTmplatId.value = qestnrTmplatId;
	vFrom.searchCondition.options[0].selected = true;
	vFrom.searchKeyword.value = '';
	vFrom.searchMode.value = 'Y';

	//QRM QQM QRI
	if(Type == 'QRM'){ //설문응답자정보
		sAction  = "<c:url value='/uss/olp/qrm/EgovQustnrRespondManageList.do' />";
	}else if(Type == 'QQM'){ //설문문항
		sAction  = "<c:url value='/uss/olp/qqm/EgovQustnrQestnManageList.do' />";
	}else if(Type == 'QRI'){ //응답자결과
		sAction  = "<c:url value='/uss/olp/qri/EgovQustnrRespondInfoList.do' />";
	}

	vFrom.action = sAction;
	vFrom.submit();

}
 /* ********************************************************
  * 통계
  ******************************************************** */
function fn_egov_statistics_QustnrQestnManag(qestnrId, qestnrTmplatId){
	var vFrom = document.listForm;
	vFrom.qestnrId.value = qestnrId;
	vFrom.qestnrTmplatId.value = qestnrTmplatId;
	vFrom.searchCondition.options[0].selected = true;
	vFrom.searchKeyword.value = '';
	vFrom.action = "<c:url value='/uss/olp/qnn/EgovQustnrRespondInfoManageStatistics.do' />";
	vFrom.submit();
}
</script>
</head>
<body>
<DIV id="content" style="width:712px">
<!-- 자바스크립트 경고 태그  -->
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<form name="listForm" action="<c:url value='/uss/olp/qmc/EgovQustnrManageList.do'/>" method="post">
<table width="100%" cellpadding="1" class="table-search" border="0" summary="타이틀/검색폼/등록 버튼을 제공한다.">
<caption>타이틀/검색폼/등록 버튼을 제공한다.</caption>
 <tr>
  <td class="title_left">
   <h1><img src="<c:out value="${ImgUrl}" />icon/tit_icon.gif" style="vertical-align:middle; display:inline-block;" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지">&nbsp;설문관리 목록</h1>
   </td>
  <th scope="col">&nbsp;</th>
  <td width="110px">
   	<select name="searchCondition" class="select" style="width:100%" title="검색조건선택">
		   <option value=''>--선택하세요--</option>
		   <option value='QUSTNR_SJ' <c:if test="${searchCondition == 'QUSTNR_SJ'}">selected</c:if>>설문제목</option>
		   <option value='FRST_REGISTER_ID' <c:if test="${searchCondition == 'FRST_REGISTER_ID'}">selected</c:if>>등록자</option>
	   </select>
	</td>
  <td width="180px">
    <input name="searchKeyword" type="text" size="10" value="${searchKeyword}" title="검색어 입력" maxlength="35" style="width:100%">
  </td>
  <td width="1px"></td>
  <th width="70px" align="center">
   <table border="0" cellspacing="0" cellpadding="0" align="center" summary="조회/등록 버튼을 제공한다.">
   <caption>조회/등록 버튼을 제공한다</caption>
    <tr>
      <td><img src="${ImgUrl}btn/bu2_left.gif"  width="8" height="20" alt="버튼이미지"></td>
      <td class="btnBackground" nowrap><input type="submit" value="<spring:message code="button.inquire" />" onclick="fn_egov_search_QustnrManage(); return false;" class="btnNew" style="height:20px;width:26px;padding:0px 0px 0px 0px;" ></td>
      <td><img src="<c:out value="${ImgUrl}" />btn/bu2_right.gif" width="8" height="20" alt="버튼이미지"></td>
      <td>&nbsp;</td>
      <td><img src="<c:out value="${ImgUrl}" />btn/bu2_left.gif" width="8" height="20" alt="버튼이미지"></td>
      <td class="btnBackground" nowrap><a href="<c:url value='/uss/olp/qmc/EgovQustnrManageRegist.do' />"><spring:message code="button.create" /></a></td>
      <td><img src="<c:out value="${ImgUrl}" />btn/bu2_right.gif" width="8" height="20" alt="버튼이미지"></td>
      <th scope="col">&nbsp;</th>
    </tr>
   </table>

  </th>
 </tr>
</table>
<input name="qestnrId" type="hidden" value="">
<input name="qestnrTmplatId" type="hidden" value="">
<input name="searchMode" type="hidden" value="">
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
</form>

<div style="width:100%;border:solid 0px #000000;height:3px"></div>

<table width="100%" cellpadding="0" class="table-line" border="0" summary="목록 을 제공한다.">
<caption>목록 을 제공한다</caption>
<thead>
<tr>
	<th scope="col" class="title" width="35px" nowrap>순번</th>
	<th scope="col" class="title" nowrap>설문제목</th>
	<th scope="col" class="title" width="150px" nowrap>설문기간</th>
	<th scope="col" class="title" width="60px" nowrap>설문응답<br>자정보</th>
	<th scope="col" class="title" width="60px" nowrap>설문문항</th>
	<th scope="col" class="title" width="60px" nowrap>설문조사</th>
	<th scope="col" class="title" width="50px" nowrap>통계</th>
	<th scope="col" class="title" width="70px" nowrap>등록자</th>
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
	<td class="lt_text3" nowrap>${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}</td>
	<td class="lt_text3L" nowrap>
		<form name="subForm" method="post" action="<c:url value='/uss/olp/qmc/EgovQustnrManageDetail.do'/>">
		<input name="qestnrId" type="hidden" value="${resultInfo.qestnrId}">
		<input name="qestnrTmplatId" type="hidden" value="">
		<input name="searchMode" type="hidden" value="">
		<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
    	<span class="link"><input type="submit" style="width:150px;border:solid 0px black;text-align:left;" value="<c:out value="${resultInfo.qestnrSj}"/>" onclick="fn_egov_detail_QustnrManage('${resultInfo.qestnrId}'); return false;"></span>
    	</form>
	</td>
	<td class="lt_text3" nowrap>${resultInfo.qestnrBeginDe}~${resultInfo.qestnrEndDe}</td>
	<td class="lt_text3" nowrap>
		<form name="subForm" method="post" action="<c:url value='/uss/olp/qrm/EgovQustnrRespondManageList.do'/>">
		<input name="qestnrId" type="hidden" value="${resultInfo.qestnrId}">
		<input name="qestnrTmplatId" type="hidden" value="${resultInfo.qestnrTmplatId}">
		<input name="searchMode" type="hidden" value="Y">
		<span class="link"><input type="submit" style="width:40px;border:solid 0px black;text-align:left;" value="보기" onclick="fn_egov_list_QustnrQestnManag('${resultInfo.qestnrId}','${resultInfo.qestnrTmplatId}','QRM'); return false;"></span>
		</form>
	</td>
	<td class="lt_text3" nowrap>
		<form name="subForm" method="post" action="<c:url value='/uss/olp/qqm/EgovQustnrQestnManageList.do'/>">
		<input name="qestnrId" type="hidden" value="${resultInfo.qestnrId}">
		<input name="qestnrTmplatId" type="hidden" value="${resultInfo.qestnrTmplatId}">
		<input name="searchMode" type="hidden" value="Y">
		<span class="link"><input type="submit" style="width:40px;border:solid 0px black;text-align:left;" value="보기" onclick="fn_egov_list_QustnrQestnManag('${resultInfo.qestnrId}','${resultInfo.qestnrTmplatId}','QQM'); return false;"></span>
		</form>
	</td>
	<td class="lt_text3" nowrap>
		<form name="subForm" method="post" action="<c:url value='/uss/olp/qri/EgovQustnrRespondInfoList.do'/>">
		<input name="qestnrId" type="hidden" value="${resultInfo.qestnrId}">
		<input name="qestnrTmplatId" type="hidden" value="${resultInfo.qestnrTmplatId}">
		<input name="searchMode" type="hidden" value="Y">
		<span class="link"><input type="submit" style="width:40px;border:solid 0px black;text-align:left;" value="보기" onclick="fn_egov_list_QustnrQestnManag('${resultInfo.qestnrId}','${resultInfo.qestnrTmplatId}','QRI'); return false;"></span>
		</form>
	</td>
	<td class="lt_text3" nowrap>
		<form name="subForm" method="post" action="<c:url value='/uss/olp/qnn/EgovQustnrRespondInfoManageStatistics.do'/>">
		<input name="qestnrId" type="hidden" value="${resultInfo.qestnrId}">
		<input name="qestnrTmplatId" type="hidden" value="${resultInfo.qestnrTmplatId}">
		<input name="searchMode" type="hidden" value="">
		<span class="link"><input type="submit" style="width:40px;border:solid 0px black;text-align:left;" value="보기" onclick="fn_egov_statistics_QustnrQestnManag('${resultInfo.qestnrId}','${resultInfo.qestnrTmplatId}'); return false;"></span>
		</form>
	</td>
	<td class="lt_text3" nowrap>${resultInfo.frstRegisterNm}</td>
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
