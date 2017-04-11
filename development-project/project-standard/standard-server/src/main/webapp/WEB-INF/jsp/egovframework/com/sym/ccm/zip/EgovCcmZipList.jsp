<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
 /**
  * @Class Name  : EgovCcmZipList.jsp
  * @Description : EgovCcmZipList 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.04.01   이중호              최초 생성
  *
  *  @author 공통서비스팀
  *  @since 2009.04.01
  *  @version 1.0
  *  @see
  *
  */
%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="ko">
<head>
<title>우편번호 목록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/sym/ccm/zip/zip.css'/>">
<link href="<c:url value='/css/egovframework/com/button.css'/>" rel="stylesheet" type="text/css">
<script type="text/javaScript" language="javascript">
<!--
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function fn_egov_pageview(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/sym/ccm/zip/EgovCcmZipList.do'/>";
   	document.listForm.submit();
}
/* ********************************************************
 * 조회 처리
 ******************************************************** */
function fn_egov_search_Zip(){
	sC1 = document.listForm.searchCondition.value;
	sC2 = document.listForm.searchCondition2.value;
	sK = document.listForm.searchKeyword.value;
	if (sC1 == "1" || sC2 == "1") {
		document.listForm.searchKeyword.value = sK.replace(/\-/, "");
	}
	document.listForm.pageIndex.value = 1;
   	document.listForm.submit();
}
/* ********************************************************
 * 등록 처리 함수
 ******************************************************** */
function fn_egov_regist_Zip(){
//	location.href = "<c:url value='/sym/ccm/zip/EgovCcmZipRegist.do'/>";
	var varForm	   			 = document.getElementById("Form");
	varForm.action 			 = "<c:url value='/sym/ccm/zip/EgovCcmZipRegist.do'/>";
	varForm.searchList.value = document.getElementById("searchList").value;
	varForm.submit();
}
/* ********************************************************
 * 엑셀등록 처리 함수
 ******************************************************** */
function fn_egov_regist_ExcelZip(){
//	location.href = "<c:url value='/sym/ccm/zip/EgovCcmExcelZipRegist.do' />";
	var varForm	   			 = document.getElementById("Form");
	varForm.action 			 = "<c:url value='/sym/ccm/zip/EgovCcmExcelZipRegist.do'/>";
	varForm.searchList.value = document.getElementById("searchList").value;
	varForm.submit();
}
/* ********************************************************
 * 수정 처리 함수
 ******************************************************** */
function fn_egov_modify_Zip(){
	location.href = "";
}
/* ********************************************************
 * 상세회면 처리 함수(일반주소)
 ******************************************************** */
function fn_egov_detail_Zip(zip,sn){
	var varForm				 = document.getElementById("Form");
	varForm.action           = "<c:url value='/sym/ccm/zip/EgovCcmZipDetail.do'/>";
	varForm.zip.value        = zip;
	varForm.sn.value         = sn;
	varForm.searchList.value = "1";
	varForm.submit();
}
/* ********************************************************
 * 상세회면 처리 함수(도로명주소)
 ******************************************************** */
function fn_egov_detail_RdmnCode_Zip(rdmnCode, sn){
	var varForm				 = document.getElementById("Form");
	varForm.action           = "<c:url value='/sym/ccm/zip/EgovCcmZipDetail.do'/>";
	varForm.rdmnCode.value   = rdmnCode;
	varForm.sn.value         = sn;
	varForm.searchList.value = "2";
	varForm.submit();
}
/* ********************************************************
 * 목록회면 처리 함수
 ******************************************************** */
function fn_egov_list(){
	if (document.getElementById("searchList").value == 1) {
		document.getElementById("searchCondition").style.display="block";
		document.getElementById("searchCondition2").style.display="none";
	} else {
		document.getElementById("searchCondition").style.display="none";
		document.getElementById("searchCondition2").style.display="block";
	}
}
-->
</script>
</head>
<body onLoad="fn_egov_list()">
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<DIV id="content" style="display">
<form:form name="listForm" action="<c:url value='/sym/ccm/zip/EgovCcmZipList.do'/>" method="post">
<table width="700" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="18%"class="title_left"><h1 class="title_left">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif'/>" width="16" height="16" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;우편번호 목록</h1></td>
  <td width="10%" >
	   	<select name="searchList" id="searchList" class="select" title="searchList" onChange="fn_egov_list()"> 
		   <option value='1' <c:if test="${searchVO.searchList == '1'}">selected="selected"</c:if>>주소</option>
		   <option value='2' <c:if test="${searchVO.searchList == '2'}">selected="selected"</c:if>>도로명주소</option>
	    </select>
  </td>
  <td width="10%">
		<select name="searchCondition" id="searchCondition" class="select" title="searchCondition" style="display:none">
		   <option value='1' <c:if test="${searchVO.searchCondition == '1'}">selected="selected"</c:if>>우편번호</option>
		   <option value='2' <c:if test="${searchVO.searchCondition == '2'}">selected="selected"</c:if>>시도명</option>
		   <option value='3' <c:if test="${searchVO.searchCondition == '3'}">selected="selected"</c:if>>시군구명</option>
		   <option value='4' <c:if test="${searchVO.searchCondition == '4'}">selected="selected"</c:if>>읍면동명</option>
		   <option value='5' <c:if test="${searchVO.searchCondition == '5'}">selected="selected"</c:if>>리건물명</option>
		</select>
	   	<select name="searchCondition2" id="searchCondition2" class="select" title="searchCondition" style="display:none">
			   <option value='1' <c:if test="${searchVO.searchCondition2 == '1'}">selected="selected"</c:if>>우편번호</option>
			   <option value='2' <c:if test="${searchVO.searchCondition2 == '2'}">selected="selected"</c:if>>시도명</option>
			   <option value='3' <c:if test="${searchVO.searchCondition2 == '3'}">selected="selected"</c:if>>시군구명</option>
			   <option value='4' <c:if test="${searchVO.searchCondition2 == '4'}">selected="selected"</c:if>>도로명</option>
			   <option value='5' <c:if test="${searchVO.searchCondition2 == '5'}">selected="selected"</c:if>>건물명</option>
			   <option value='6' <c:if test="${searchVO.searchCondition2 == '6'}">selected="selected"</c:if>>상세건물명</option>
		</select>
	</td>
	<td width="23%">
	    <input name="searchKeyword" type="text" size="25" value="${searchVO.searchKeyword}"  maxlength="25" id="searchKeyword">
    </td>
      <td width="28%" >
	      <span class="button"><input type="submit" value="조회" onclick="fn_egov_search_Zip(); return false;"></span>
	      <span class="button"><input type="submit" value="등록" onclick="fn_egov_regist_Zip(); return false;"></span>
	      <span class="button"><input type="submit" value="엑셀등록" onclick="fn_egov_regist_ExcelZip(); return false;"></span>
      </td>
 </tr>
</table>

<table width="700" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<table width="700" cellpadding="0" class="table-line" border="0" summary="우편번호와 주소를 출력하는 우편번호 목록 테이블이다.">
<CAPTION style="display: none;">우편번호 목록</CAPTION>
<thead>
<tr>
	<th class="title" width="10%" scope="col" nowrap>순번</th>
	<th class="title" width="20%" scope="col" nowrap>우편번호</th>
	<th class="title" width="70%" scope="col" nowrap>주소</th>
</tr>
</thead>

<tbody>
<c:choose>
<c:when test="${searchVO.searchList != '2'}">
	<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
	<tr style="cursor:pointer;cursor:hand;" onclick="javascript:fn_egov_detail_Zip('${resultInfo.zip}','${resultInfo.sn}');">
		<td class="lt_text3" nowrap><c:out value="${(searchVO.pageIndex - 1) * searchVO.pageSize + status.count}"/></td>
		<td class="lt_text3" nowrap><c:out value='${fn:substring(resultInfo.zip, 0,3)}'/>-<c:out value='${fn:substring(resultInfo.zip, 3,6)}'/></td>
		<td class="lt_text"  nowrap>${resultInfo.ctprvnNm} ${resultInfo.signguNm} ${resultInfo.emdNm} ${resultInfo.liBuldNm} ${resultInfo.lnbrDongHo}</td>
	</tr>
	</c:forEach>
</c:when>
<c:otherwise>
	<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
	<tr style="cursor:pointer;cursor:hand;" onclick="javascript:fn_egov_detail_RdmnCode_Zip('${resultInfo.rdmnCode}','${resultInfo.sn}');">
		<td class="lt_text3" nowrap><c:out value="${(searchVO.pageIndex - 1) * searchVO.pageSize + status.count}"/></td>
		<td class="lt_text3" nowrap><c:out value='${fn:substring(resultInfo.zip, 0,3)}'/>-<c:out value='${fn:substring(resultInfo.zip, 3,6)}'/></td>
		<td class="lt_text"  nowrap>${resultInfo.ctprvnNm} ${resultInfo.signguNm} ${resultInfo.rdmn} ${resultInfo.bdnbrMnnm} <c:if test="${resultInfo.bdnbrSlno != ''}">- ${resultInfo.bdnbrSlno}</c:if> ${resultInfo.buldNm} ${resultInfo.detailBuldNm}</td>
	</tr>
	</c:forEach>
</c:otherwise>
</c:choose>

<c:if test="${fn:length(resultList) == 0}">
	<tr>
		<td class="lt_text3" colspan=3>
			<spring:message code="common.nodata.msg" />
		</td>
	</tr>
</c:if>

</tbody>
</table>

<table width="700" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
	<td>
		<div align="center">
			<div>
				<ui:pagination paginationInfo = "${paginationInfo}"
						type="image"
						jsFunction="fn_egov_pageview"
						/>
			</div>
		</div>
	</td>
</tr>
</table>

<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>

</form:form>
<form:form name="Form" id="Form" method="post" action="">
	<input type=hidden name="zip">
	<input type=hidden name="sn" value="0">
	<input type=hidden name="rdmnCode">
	<input type=hidden name="searchList">
	<input type="submit" id="invisible" class="invisible">
</form:form>
</DIV>


</body>
</html>
