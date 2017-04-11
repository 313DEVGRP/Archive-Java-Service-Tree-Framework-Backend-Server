<%--
  Class Name : EgovQustnrQestnManageList.jsp
  Description : 설문문항 목록 페이지
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2008.03.09    장동한          최초 생성

    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.19

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
<title>설문문항 목록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css">
<link type="text/css" rel="stylesheet" href="${CssUrl}button.css">
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/uss/olp/qqm/EgovQustnrQestnManageList.do'/>";
   	document.listForm.submit();
}
/* ********************************************************
 * 등록 처리 함수
 ******************************************************** */
function fn_egov_regist_QustnrQestnManage(){
	var vFrom = document.listForm;
	vFrom.cmd.value = '';
	vFrom.action = "<c:url value='/uss/olp/qqm/EgovQustnrQestnManageRegist.do' />";
	vFrom.submit();
}
/* ********************************************************
 * 수정 처리 함수
 ******************************************************** */
function fn_egov_modify_QustnrQestnManage(){
	location.href = "<c:url value='/uss/olp/qqm/EgovQustnrQestnManageModify.do' />";
}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_detail_QustnrQestnManage(qestnrQesitmId){
	var vFrom = document.listForm;
	vFrom.qestnrQesitmId.value = qestnrQesitmId;
	vFrom.action = "<c:url value='/uss/olp/qqm/EgovQustnrQestnManageDetail.do' />";
	vFrom.submit();
}
/* ********************************************************
 * 문항통계
 ******************************************************** */
function fn_egov_statistics_QustnrQestnManage(qestnrQesitmId){
	var vFrom = document.listForm;
	vFrom.qestnrQesitmId.value = qestnrQesitmId;
	vFrom.action = "<c:url value='/uss/olp/qqm/EgovQustnrQestnManageStatistics.do' />";
	vFrom.submit();
}

/* ********************************************************
 * 삭제 처리 함수
 ******************************************************** */
function fn_egov_delete_QustnrQestnManage(qestnrId){
	var vFrom = document.listForm;
	if(confirm("삭제 하시겠습니까?")){
		vFrom.qestnrId.value = qestnrId;
		vFrom.cmd.value = 'del';
		vFrom.action = "<c:url value='/uss/olp/qqm/EgovQustnrQestnManageList.do' />";
		vFrom.submit();
	}else{
		vFrom.cmd.value = '';
	}
}
/* ********************************************************
 * 검색 함수
 ******************************************************** */
function fn_egov_search_QustnrQestnManage(){
	var vFrom = document.listForm;

	vFrom.action = "<c:url value='/uss/olp/qqm/EgovQustnrQestnManageList.do' />";
	vFrom.submit();

}
</script>
</head>
<body>
<DIV id="content" style="width:712px">
<!-- 자바스크립트 경고 태그  -->
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<form name="listForm" id="listForm" action="<c:url value='/uss/olp/qqm/EgovQustnrQestnManageList.do'/>" method="post">
<table width="100%" cellpadding="1" border="0" summary="타이틀/검색폼/등록 버튼을 제공한다.">
<caption>타이틀/검색폼/등록 버튼을 제공한다.</caption>
 <tr>
  <td class="title_left">
	<h1><img src="<c:out value="${ImgUrl}" />icon/tit_icon.gif" width="16" style="vertical-align:middle; display:inline-block;" height="16" hspace="3" align="middle" alt="제목아이콘이미지">&nbsp;설문문항 목록</h1>
   </td>
  <th scope="col"> </th>
  <td width="110px">
   	<select name="searchCondition" class="select" style="width:100%" title="검색조건선택">
		   <option value=''>--선택하세요--</option>
		   <option value='QESTN_CN' <c:if test="${searchVO.searchCondition == 'QESTN_CN'}">selected</c:if>>질문내용</option>
		   <option value='MXMM_CHOISE_CO' <c:if test="${searchVO.searchCondition == 'MXMM_CHOISE_CO'}">selected</c:if>>최대선택건수</option>
	   </select>
	</td>
  <td width="180px">
    <input name="searchKeyword" type="text" size="10" value="${searchKeyword}" maxlength="35" title="검색어 입력" style="width:100%">
  </td>
  <td width="1px"></td>
  <th width="70px" align="center">

   <table border="0" cellspacing="0" cellpadding="0" align="center" summary="조회/등록 버튼을 제공한다.">
   <caption>조회/등록 버튼을 제공한다</caption>
    <tr>
      <td><img src="${ImgUrl}btn/bu2_left.gif"  width="8" height="20" alt="버튼이미지"></td>
      <td class="btnBackground" nowrap><input type="submit" value="<spring:message code="button.inquire" />" onclick="fn_egov_search_QustnrQestnManage(); return false;" class="btnNew" style="height:20px;width:26px;padding:0px 0px 0px 0px;" ></td>
      <td><img src="<c:out value="${ImgUrl}" />btn/bu2_right.gif" width="8" height="20" alt="버튼이미지"></td>
      <td>&nbsp;</td>
      <td><img src="<c:out value="${ImgUrl}" />btn/bu2_left.gif" width="8" height="20" alt="버튼이미지"></td>
      <td class="btnBackground" nowrap><a href="<c:url value='/uss/olp/qqm/EgovQustnrQestnManageRegist.do' />"><spring:message code="button.create" /></a></td>
      <td><img src="<c:out value="${ImgUrl}" />btn/bu2_right.gif" width="8" height="20" alt="버튼이미지"></td>
      <td>&nbsp;</td>
    </tr>
   </table>

  </th>
 </tr>
</table>

<c:if test="${qustnrQestnManageVO.searchMode == 'Y'}">
<input name="qestnrTmplatId" id="qestnrTmplatId" type="hidden" value="${qustnrQestnManageVO.qestnrTmplatId}">
<input name="qestnrId" id="qestnrId" type="hidden" value="${qustnrQestnManageVO.qestnrId}">
<input name="searchMode" id="searchMode" type="hidden" value="${qustnrQestnManageVO.searchMode}">
</c:if>

<input name="qestnrQesitmId" type="hidden" value="">
<input name="cmd" type="hidden" value="">

<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">

</form>

<div style="width:100%;border:solid 0px #000000;height:3px"></div>

<table width="100%" cellpadding="0" class="table-line" summary="목록 을 제공한다.">
<caption>목록 을 제공한다</caption>
 <thead>
  <tr>
    <th scope="col" class="title" width="35px" nowrap>순번</th>
    <th scope="col" class="title" nowrap>질문내용</th>
    <th scope="col" class="title" width="70px" nowrap>질문유형</th>
    <th scope="col" class="title" width="70px" nowrap>질문항목</th>
    <th scope="col" class="title" width="50px" nowrap>통계</th>
    <th scope="col" class="title" width="70px" nowrap>등록자</th>
    <th scope="col" class="title" width="70px" nowrap>등록일자</th>
  </tr>
 </thead>
 <tbody>
 <%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
<c:if test="${fn:length(resultList) == 0}">
<tr>
<td class="lt_text3" colspan="7">
	<spring:message code="common.nodata.msg" />
</td>
</tr>
</c:if>
 <%-- 데이터를 화면에 출력해준다 --%>
<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
  <tr>
    <td class="lt_text3" nowrap>${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}</td>
    <td class="lt_text3L" nowrap>
		<form name="subForm" method="post" action="<c:url value='/uss/olp/qqm/EgovQustnrQestnManageDetail.do'/>">
		<c:if test="${qustnrQestnManageVO.searchMode == 'Y'}">
		<input name="qestnrTmplatId" id="qestnrTmplatId" type="hidden" value="${qustnrQestnManageVO.qestnrTmplatId}">
		<input name="qestnrId" id="qestnrId" type="hidden" value="${qustnrQestnManageVO.qestnrId}">
		<input name="searchMode" id="searchMode" type="hidden" value="${qustnrQestnManageVO.searchMode}">
		</c:if>
		<!-- <input name="qestnrQesitmId" id="qestnrQesitmId" type="hidden" value="${resultInfo.qestnrQesitmId}">  -->
			<span class="link"><input type="submit" style="width:340px;border:solid 0px black;text-align:left;" value="<c:out value="${resultInfo.qestnCn}"/>" onclick="fn_egov_detail_QustnrQestnManage('${resultInfo.qestnrQesitmId}'); return false;"></span>
		</form>
    </td>
    <td class="lt_text3" nowrap>
    <c:if test="${resultInfo.qestnTyCode == '1'}">객관식</c:if>
    <c:if test="${resultInfo.qestnTyCode == '2'}">주관식</c:if>
    </td>
    <td class="lt_text3" nowrap>
	    <form name="subForm" method="post" action="<c:url value='/uss/olp/qim/EgovQustnrItemManageList.do'/>">
	    <!-- <input name="qestnrQesitmId" id="qestnrQesitmId" type="hidden" value="${resultInfo.qestnrQesitmId}">  -->
	    <input name="searchMode" type="hidden" value="Y">
	    <span class="link"><input type="submit" style="width:40px;border:solid 0px black;text-align:left;" value="보기"></span>
	    </form>
    </td>
    <td class="lt_text3" nowrap>

		<form name="subForm" method="post" action="<c:url value='/uss/olp/qqm/EgovQustnrQestnManageStatistics.do'/>">
		<c:if test="${qustnrQestnManageVO.searchMode == 'Y'}">
		<input name="qestnrTmplatId" type="hidden" value="${qustnrQestnManageVO.qestnrTmplatId}">
		<input name="qestnrId" type="hidden" value="${qustnrQestnManageVO.qestnrId}">
		<input name="searchMode" type="hidden" value="${qustnrQestnManageVO.searchMode}">
		</c:if>
		<input name="qestnrQesitmId" type="hidden" value="${resultInfo.qestnrQesitmId}">
			<span class="link"><input type="submit" style="width:40px;border:solid 0px black;text-align:left;" value="보기" onclick="fn_egov_statistics_QustnrQestnManage('${resultInfo.qestnrQesitmId}'); return false;"></span>
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
