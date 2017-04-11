<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
 /**
  * @Class Name  : EgovCcmZipSearchList.jsp
  * @Description : EgovCcmZipSearchList 화면
  * @Modification Information
  * @
  * @  수정일        수정자              수정내용
  * @ ---------     --------    ---------------------------
  * @ 2009.04.01     이중호              최초 생성
  * @ 2011.11.22     이기하              도로명주소 추가
  * @ 2013.05.23     이기하              RegExp 수정(addr.replace("/^\s+|\s+$/g",""); => addr.replace(/^\s+|\s+$/g,""))
  *
  *  @author 공통서비스팀
  *  @since 2009.04.01
  *  @version 1.0
  *  @see
  *
  */
--%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<link rel="stylesheet" type="text/css" href="<c:url value='/css/egovframework/com/sym/ccm/zip/zip.css' />" >
<link rel="stylesheet" type="text/css" href="<c:url value='/css/egovframework/com/button.css' />" >
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/showModalDialogCallee.js'/>" ></script>
<title>우편번호 찾기</title>
<script type="text/javaScript" language="JavaScript">
<!--
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function fn_egov_pageview(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/sym/ccm/zip/EgovCcmZipSearchList.do'/>";
   	document.listForm.submit();
}
/* ********************************************************
 * 조회 처리
 ******************************************************** */
function fn_egov_search_Zip(){
	document.listForm.pageIndex.value = 1;
	document.listForm.searchList.value = document.getElementById("searchList").value;
	document.listForm.searchCondition.value = document.getElementById("searchCondition").value;
	document.listForm.searchCondition2.value = document.getElementById("searchCondition2").value;
   	document.listForm.submit();
}
/* ********************************************************
 * 결과 우편번호,주소 반환
 ******************************************************** */
function fn_egov_return_Zip(zip,addr){
	var retVal   = new Object();
	var sZip     = zip;
	var vZip     = zip.substring(0,3)+zip.substring(3,6);
	var sAddr    = addr.replace(/^\s+|\s+$/g,"");
	retVal.sZip  = sZip;
	retVal.vZip  = vZip;
	retVal.sAddr = sAddr;
	
	setReturnValue(retVal);
	
	parent.window.returnValue = retVal;
	parent.window.close();
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

<form:form name="listForm" action="${pageContext.request.contextPath}/sym/ccm/zip/EgovCcmZipSearchList.do" method="post">
<table style="width:650px;margin:0 auto" cellpadding="8" class="table-search" border="0">
 <tr>
  <td style="width:40%" class="title_left">
		<img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지" /> 우편번호 찾기
  </td>
  <td>
	<select name="searchList" id="searchList" class="select" title="searchList" onChange="fn_egov_list()"> 
		<option value='1' <c:if test="${searchList == '1'}">selected="selected"</c:if>>주소</option>
		<option value='2' <c:if test="${searchList == '2'}">selected="selected"</c:if>>도로명주소</option>
	</select>
  </td>
    <td width="20%">
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
  <td style="width:20%" class="title_right">
    	<input name="searchKeyword" type="text" size="20" value="${searchVO.searchKeyword}"  maxlength="20" title="입력창">
  </td>
  <th style="width:5%">
   <table border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td><span class="button"><input type="submit" value="조회" onclick="javascript:fn_egov_search_Zip();" class="btnNew" style="height:20px;width:26px;padding:0px 0px 0px 0px;" ></span></td>
      <td width="10"></td>
    </tr>
   </table>
  </th>
 </tr>
</table>

<table style="width:650px;margin:0 auto" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<table style="width:650px;margin:0 auto" cellpadding="0" class="table-line" border="0" summary="우편번호 건색 결과를 알려주는 테이블입니다.우편번호 및 주소 내용을 담고 있습니다">
<thead>
<tr>
	<th class="title" style="width:25%" scope="col" nowrap="nowrap">우편번호</th>
	<th class="title" style="width:75%" scope="col" nowrap="nowrap">주소</th>
</tr>
</thead>
<tbody>
<%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
<c:if test="${fn:length(resultList) == 0}">
<tr>
<td class="lt_text3" colspan="2">
	<spring:message code="common.nodata.msg" />
</td>
</tr>
</c:if>
<c:if test="${searchList == '1'}">
	<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
		<tr style="cursor:pointer;cursor:hand;" onclick="javascript:fn_egov_return_Zip( '${resultInfo.zip}', '${resultInfo.ctprvnNm} ${resultInfo.signguNm} ${resultInfo.emdNm} ${resultInfo.liBuldNm}');">
			<td class="lt_text3" nowrap="nowrap" ><c:out value='${fn:substring(resultInfo.zip, 0,3)}'/>-<c:out value='${fn:substring(resultInfo.zip, 3,6)}'/></td>
			<td class="lt_text" nowrap="nowrap" >${resultInfo.ctprvnNm} ${resultInfo.signguNm} ${resultInfo.emdNm} ${resultInfo.liBuldNm} ${resultInfo.lnbrDongHo}</td>
		</tr>
	</c:forEach>
</c:if>
<c:if test="${searchList == '2'}">
	<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
		<tr style="cursor:pointer;cursor:hand;" onclick="javascript:fn_egov_return_Zip( '${resultInfo.zip}', '${resultInfo.ctprvnNm} ${resultInfo.signguNm} ${resultInfo.rdmn} ${resultInfo.bdnbrMnnm} <c:if test="${resultInfo.bdnbrSlno != ''}">- ${resultInfo.bdnbrSlno}</c:if> ${resultInfo.buldNm} ${resultInfo.detailBuldNm}');">
			<td class="lt_text3" nowrap><c:out value='${fn:substring(resultInfo.zip, 0,3)}'/>-<c:out value='${fn:substring(resultInfo.zip, 3,6)}'/></td>
			<td class="lt_text"  nowrap>${resultInfo.ctprvnNm} ${resultInfo.signguNm} ${resultInfo.rdmn} ${resultInfo.bdnbrMnnm} <c:if test="${resultInfo.bdnbrSlno != ''}">- ${resultInfo.bdnbrSlno}</c:if> ${resultInfo.buldNm} ${resultInfo.detailBuldNm}</td>
		</tr>
	</c:forEach>
</c:if>
</tbody>
</table>

<table style="width:650px;margin:0 auto" cellspacing="0" cellpadding="0" border="0">
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

<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
<input type=hidden name="searchList">
</form:form>
</body>
</html>


