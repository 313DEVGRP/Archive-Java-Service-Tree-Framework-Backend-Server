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
<title>설문관리 목록 팝업</title>
<base target="_self">
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
	document.listForm.action = "<c:url value='/uss/olp/qmc/EgovQustnrManageListPopup.do'/>";
   	document.listForm.submit();
}
/* ********************************************************
 * 검색 함수
 ******************************************************** */
function fn_egov_search_QustnrManage(){
	var vFrom = document.listForm;

	vFrom.action = "<c:url value='/uss/olp/qmc/EgovQustnrManageListPopup.do' />";
	vFrom.submit();

}
/* ********************************************************
 * 선택 처리 함수
 ******************************************************** */
function fn_egov_open_QustnrManage(qestnrId, qestnrTmplatId, cnt){

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
	opener.document.getElementById("qestnrCn").value = document.getElementById("iptText_"+ cnt).value;

	window.returnValue=true;
	window.close();

}
</script>
</head>
<body>

<DIV id="content" style="width:712px">
<!-- 자바스크립트 경고 태그  -->
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<form name="listForm" id="listForm" action="<c:url value='/uss/olp/qmc/EgovQustnrManageListPopup.do'/>" method="post">
<table width="100%" cellpadding="1" class="table-search" border="0">
 <tr>
  <td class="title_left">
   <h1><img src="<c:out value="${ImgUrl}" />icon/tit_icon.gif" style="vertical-align:middle; display:inline-block;" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지">&nbsp;설문관리 목록</h1>
   </td>
  <th scope="col"> </th>
  <td width="110px">
   	<select name="searchCondition" class="select" style="width:100%" title="검색조건선택">
		   <option value=''>--선택하세요--</option>
		   <option value='QESTNR_TMPLAT_CN' <c:if test="${searchCondition == 'QESTNR_TMPLAT_CN'}">selected</c:if>>템플릿설명</option>
		   <option value='QESTNR_TMPLAT_TY' <c:if test="${searchCondition == 'QESTNR_TMPLAT_TY'}">selected</c:if>>템플릿유형</option>
	   </select>
	</td>
  <td width="180px">
    <input name="searchKeyword" type="text" size="10" value="${searchKeyword}" title="검색어 입력" maxlength="35" style="width:100%">
  </td>
  <th width="40px" align="center">

   <table border="0" cellspacing="0" cellpadding="0" align="center" summary="조회 버튼을 제공한다.">
   <caption>조회 버튼을 제공한다</caption>
    <tr>
      <td><img src="${ImgUrl}btn/bu2_left.gif"  width="8" height="20" alt="버튼이미지"></td>
      <td class="btnBackground" nowrap><input type="submit" value="<spring:message code="button.inquire" />" onclick="fn_egov_search_QustnrManage(); return false;" class="btnNew" style="height:20px;width:26px;padding:0px 0px 0px 0px;" ></td>
      <td><img src="<c:out value="${ImgUrl}" />btn/bu2_right.gif" width="8" height="20" alt="버튼이미지"></td>
    </tr>
   </table>

  </th>
 </tr>
</table>

<div style="width:100%;border:solid 0px #000000;height:3px"></div>

<table width="100%" cellpadding="0" class="table-line" border="0" summary="목록 을 제공한다">
<caption>목록 을 제공한다</caption>
<thead>
<tr>
	<th scope="col" class="title" width="35px" nowrap>번호</th>
	<th scope="col" class="title" nowrap>설문제목</th>
	<th scope="col" class="title" width="150px" nowrap>설문기간</th>
	<th scope="col" class="title" width="80px" nowrap>등록자</th>
	<th scope="col" class="title" width="80px" nowrap>등록일자</th>
	<th scope="col" class="title" width="30px" nowrap></th>
</tr>
</thead>
<%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
<c:if test="${fn:length(resultList) == 0}">
<tr>
<td class="lt_text3" colspan="9">
	<spring:message code="common.nodata.msg" />
</td>
</tr>
</c:if>
<tbody>
<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
<tr>
	<td class="lt_text3" nowrap>${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}</td>
	<td class="lt_text3L" nowrap>
	 <div class="divDotText" style="width:330px; border:solid 0px;"><a href="#LINK" onClick="fn_egov_open_QustnrManage('${resultInfo.qestnrId}', '${resultInfo.qestnrTmplatId}', '${status.count}')">${resultInfo.qestnrSj}</a></div>
	 </td>
	<td class="lt_text3" nowrap>${resultInfo.qestnrBeginDe}~${resultInfo.qestnrEndDe}</td>
	<td class="lt_text3" nowrap>${resultInfo.frstRegisterNm}</td>
	<td class="lt_text3" nowrap>${fn:substring(resultInfo.frstRegisterPnttm, 0, 10)}</td>
	<td class="lt_text3">
	<a href="#LINK" onClick="fn_egov_open_QustnrManage('${resultInfo.qestnrId}', '${resultInfo.qestnrTmplatId}', '${status.count}')">선택</a>
	<input name="iptText_${status.count}" id="iptText_${status.count}" type="hidden" value="${resultInfo.qestnrSj}">
	</td>

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
<input name="qestnrId" type="hidden" value="">

<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">

</form>

</DIV>

</body>
</html>
