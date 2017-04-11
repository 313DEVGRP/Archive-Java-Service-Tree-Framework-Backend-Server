<%--
  Class Name : EgovIndvdlInfoPolicyList.jsp
  Description : 개인정보보호정책 목록 페이지
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
<c:set var="ImgUrl" value="/images/egovframework/com/uss/sam/ipm/"/>
<c:set var="CssUrl" value="/css/egovframework/com/uss/sam/ipm/"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>개인정보보호정책 관리</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" >
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />">

<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/uss/sam/ipm/listIndvdlInfoPolicy.do'/>";
   	document.listForm.submit();
}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_detail_IndvdlInfoPolicy(indvdlInfoPolicyId){
	var vFrom = document.listForm; 
	vFrom.indvdlInfoId.value = indvdlInfoPolicyId; 
	vFrom.action = "<c:url value='/uss/sam/ipm/detailIndvdlInfoPolicy.do' />"; 
	vFrom.submit();
}

/* ********************************************************
 * 검색 함수
 ******************************************************** */
function fn_egov_search_IndvdlInfoPolicy(){
	var vFrom = document.listForm;

	vFrom.action = "<c:url value='/uss/sam/ipm/listIndvdlInfoPolicy.do' />";
	vFrom.submit();
	
}
</script>
</head>
<body>
<DIV id="content" style="width:712px">
<%-- noscript 테그 --%>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<form name="listForm" action="${pageContext.request.contextPath}/uss/sam/ipm/listIndvdlInfoPolicy.do" method="post">
<table width="100%" cellpadding="1" class="table-search" border="0">
 <tr>
  <td class="title_left">

   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif'/>" alt="개인정보보호정책 목록" width="16" height="16" hspace="3" align="middle">&nbsp;개인정보보호정책 목록</td>
  <th>
  </th>
  <td width="150px">
   	<select title="개인정보보호정책조회 조건" name="searchCondition" class="select" style="width:100%">
		   <option value=''>--선택하세요--</option>
		   <option value='INDVDL_INFO_POLICY_NM' <c:if test="${searchCondition == 'INDVDL_INFO_POLICY_NM'}">selected</c:if>>개인정보보호정책명</option>
		   <option value='INDVDL_INFO_POLICY_CN' <c:if test="${searchCondition == 'INDVDL_INF_POLICY_CN'}">selected</c:if>>개인정보보호정책내용</option>
	   </select>
	</td>
  <td width="180px">
    <input title="검색어" name="searchKeyword" type="text" size="10" value="" maxlength="35" style="width:100%"> 
  </td>
  <th width="70px" align="center">

  <table border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td>&nbsp;</td>  
      <td>
      	<span class="button"><input type="submit" value="<spring:message code="button.inquire" />" onclick="fn_egov_search_IndvdlInfoPolicy(); return false;"></span>
      </td>
      <td>&nbsp;</td>   
      <td>
      	<span class="button"><a href="<c:url value='/uss/sam/ipm/registIndvdlInfoPolicy.do' />"><spring:message code="button.create" /></a></span> 
      </td>
      <td>&nbsp;</td>    
    </tr>
   </table>
  
  </th>  
 </tr>
</table>
<input name="indvdlInfoId" type="hidden" value="">
<input name="searchMode" type="hidden" value="">
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
</form>

<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<table width="100%" cellpadding="0" class="table-line" border="0">
<thead>
  <tr>  
    <th class="title" width="35px" nowrap>순번</th>
    <th class="title" width="60px" nowrap>동의여부</th>
    <th class="title" nowrap>개인정보보호정책명</th>
    <th class="title" width="70px" nowrap>등록자</th>       
    <th class="title" width="70px" nowrap>등록일자</th>                 
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
    <td class="lt_text3" nowrap><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
    <td class="lt_text3">
    <c:if test="${resultInfo.indvdlInfoscrPolicyAgreAt == 'Y'}">예</c:if>
    <c:if test="${resultInfo.indvdlInfoscrPolicyAgreAt == 'N'}">아니오</c:if>
    </td>
    <td class="lt_text3L" nowrap>
    	<form name="subForm" method="post" action="<c:url value='/uss/sam/ipm/detailIndvdlInfoPolicy.do'/>">
    	<input name="indvdlInfoId" type="hidden" value="${resultInfo.indvdlInfoPolicyId}">
		<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
    	<span class="link"><input type="submit" style="width:450px;text-align:left;" value="<c:out value="${resultInfo.indvdlInfoPolicyNm}"/>" onclick="fn_egov_detail_IndvdlInfoPolicy('<c:out value="${resultInfo.indvdlInfoPolicyId}"/>'); return false;"></span>
    	</form>
    </td>
    <td class="lt_text3"><c:out value="${resultInfo.frstRegisterNm}"/></td>
    <td class="lt_text3"><c:out value="${fn:substring(resultInfo.frstRegistPnttm, 0, 10)}"/></td>
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

</body>
</html>
