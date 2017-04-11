<%--
  Class Name : EgovQustnrTmplatManageList.jsp
  Description : 설문템플릿 목록 페이지
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
<title>설문템플릿 목록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css">
<link type="text/css" rel="stylesheet" href="${CssUrl}button.css">
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/uss/olp/qtm/EgovQustnrTmplatManageList.do'/>";
   	document.listForm.submit();
}
/* ********************************************************
 * 등록 처리 함수
 ******************************************************** */
function fn_egov_regist_QustnrTmplatManage(){
	location.href = "<c:url value='/uss/olp/qtm/EgovQustnrTmplatManageRegist.do' />";
}
/* ********************************************************
 * 수정 처리 함수
 ******************************************************** */
function fn_egov_modify_QustnrTmplatManage(){
	location.href = "<c:url value='/uss/olp/qtm/EgovQustnrTmplatManageModify.do' />";
}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_detail_QustnrTmplatManage(qestnrTmplatId){
	var vFrom = document.listForm;
	vFrom.qestnrTmplatId.value = qestnrTmplatId;
	vFrom.action = "<c:url value='/uss/olp/qtm/EgovQustnrTmplatManageDetail.do' />";
	vFrom.submit();
}
/* ********************************************************
 * 삭제 처리 함수
 ******************************************************** */
function fn_egov_delete_QustnrTmplatManage(mtgId){
	var vFrom = document.listForm;
	if(confirm("삭제 하시겠습니까?")){
		vFrom.mtgId.value = mtgId;
		vFrom.cmd.value = 'del';
		vFrom.action = "<c:url value='/uss/olp/qtm/EgovQustnrTmplatManageList.do' />";
		vFrom.submit();
	}else{
		vFrom.cmd.value = '';
	}
}
/* ********************************************************
 * 검색 함수
 ******************************************************** */
function fn_egov_search_QustnrTmplatManage(){
	var vFrom = document.listForm;

	vFrom.action = "<c:url value='/uss/olp/qtm/EgovQustnrTmplatManageList.do' />";
	vFrom.submit();

}
</script>
</head>
<body>

<DIV id="content" style="width:712px">
<!-- 자바스크립트 경고 태그  -->
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<form name="listForm" id="listForm" action="${pageContext.request.contextPath}/uss/olp/qtm/EgovQustnrTmplatManageList.do" method="post">
<!--  상단타이틀/검색조건/검색어  -->
<table width="100%" cellpadding="1" class="table-search" border="0" summary="타이틀/검색폼/등록 버튼을 제공한다.">
<caption>타이틀/검색폼/등록 버튼을 제공한다.</caption>
 <tr>
  <td class="title_left">
   <h1><img src="<c:out value="${ImgUrl}" />icon/tit_icon.gif" width="16" height="16" hspace="3" align="middle" style="vertical-align:middle; display:inline-block;" alt="제목아이콘이미지">&nbsp;설문템플릿 목록</h1>
   </td>
  <th scope="col"></th>
  <td width="100px">
   	<select name="searchCondition" class="select" style="width:100%" title="검색조건선택">
		   <option value=''>선택하세요</option>
		   <option value='QUSTNR_TMPLAT_DC' <c:if test="${searchCondition == 'QUSTNR_TMPLAT_DC'}">selected</c:if>>템플릿설명</option>
		   <option value='QUSTNR_TMPLAT_TY' <c:if test="${searchCondition == 'QUSTNR_TMPLAT_TY'}">selected</c:if>>템플릿유형</option>
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
      <td class="btnBackground" nowrap><input type="submit" value="<spring:message code="button.inquire" />" onclick="fn_egov_search_QustnrTmplatManage(); return false;" class="btnNew" style="height:20px;width:26px;padding:0px 0px 0px 0px;" ></td>
      <td><img src="<c:out value="${ImgUrl}" />btn/bu2_right.gif" width="8" height="20" alt="버튼이미지"></td>
      <td>&nbsp;</td>
      <td><img src="<c:out value="${ImgUrl}" />btn/bu2_left.gif" width="8" height="20" alt="버튼이미지"></td>
      <td class="btnBackground" nowrap><a href="<c:url value='/uss/olp/qtm/EgovQustnrTmplatManageRegist.do' />"><spring:message code="button.create" /></a></td>
      <td><img src="<c:out value="${ImgUrl}" />btn/bu2_right.gif" width="8" height="20" alt="버튼이미지"></td>
      <th scope="col">&nbsp;</th>
    </tr>
   </table>
  </th>
 </tr>
</table>
<input name="qestnrTmplatId" type="hidden" value="">
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
</form>
<!--  줄간격  -->
<div style="width:100%;border:solid 0px #000000;height:3px"></div>

<!-- 설문 템플릿 리스트  -->
<table width="100%" cellpadding="0" class="table-line" border="0" summary="목록 을 제공한다.">
<caption>목록 을 제공한다</caption>
<thead>
<tr>
	<th scope="col" class="title" width="35px" nowrap>순번</th>
	<th scope="col" class="title" width="100px" nowrap>템플릿유형</th>
	<th scope="col" class="title" width="100px" nowrap>템플릿유형<br>이미지정보</th>
	<th scope="col" class="title" >템플릿설명</th>
	<th scope="col" class="title" width="70px" nowrap>작성자명</th>
	<th scope="col" class="title" width="70px" nowrap>등록일자</th>
</tr>
</thead>
<tbody>
<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
<tr>
	<td class="lt_text3" nowrap>${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}</td>
	<td class="lt_text3L" nowrap><div class="divDotText" style="width:100px;">${resultInfo.qestnrTmplatTy}</div></td>
	<td class="lt_text3"><img src="<c:url value='/uss/olp/qtm/EgovQustnrTmplatManageImg.do' />?qestnrTmplatId=${resultInfo.qestnrTmplatId}" alt="${resultInfo.qestnrTmplatTy}템플릿이미지" title="${resultInfo.qestnrTmplatTy}템플릿이미지"></td>
	<!-- onLoad="if(this.width>65){this.width=65}" -->
	<td class="lt_text3L" nowrap>
		<form name="subForm" method="post" action="<c:url value='/uss/olp/qtm/EgovQustnrTmplatManageDetail.do'/>">
    	<input name="qestnrTmplatId" type="hidden" value="${resultInfo.qestnrTmplatId}">
		<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
    	<span class="link"><input type="submit" style="width:320px;border:solid 0px black;text-align:left;" value="<c:out value="${resultInfo.qestnrTmplatCn}"/>" onclick="fn_egov_detail_QustnrTmplatManage('${resultInfo.qestnrTmplatId}'); return false;"></span>
    	</form>

	</td>
	<td class="lt_text3">${resultInfo.frstRegisterNm}</td>
	<td class="lt_text3">${fn:substring(resultInfo.frstRegisterPnttm, 0, 10)}</td>
</tr>
</c:forEach>
 <c:if test="${fn:length(resultList) == 0}">
  <tr>
    <td class="lt_text3"  colspan="6" ><spring:message code="common.nodata.msg" /></td>
  </tr>
 </c:if>
</tbody>
</table>
<!--  줄간격  -->
<div style="width:100%;border:solid 0px #000000;height:3px"></div>

<!--  페이지네비게이션  -->
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
