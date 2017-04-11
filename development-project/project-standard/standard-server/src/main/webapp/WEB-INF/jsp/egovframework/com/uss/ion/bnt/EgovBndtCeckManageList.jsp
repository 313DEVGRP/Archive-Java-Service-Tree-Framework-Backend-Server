<%
/**
 * @Class Name : EgovBndtCeckManageList.java
 * @Description : EgovBndtCeckManageList jsp
 * @Modification Information
 * @
 * @  수정일                    수정자                수정내용
 * @ ---------     --------    ---------------------------
 * @ 2010.07.20    이      용                최초 생성
 *
 *  @author 이      용
 *  @since 2010.07.20
 *  @version 1.0
 *  @see
 *  
 *  Copyright (C) 2009 by MOPAS  All right reserved.
 */
%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>당직체크관리 목록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<script type="text/javaScript" language="javascript">
<!--
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
 /*설명 : 회의실 목록 페이지 조회 */
 function linkPage(pageNo){
	var varForm				 = document.all["listForm"];
	varForm.searchCondition.value = "1";
	varForm.pageIndex.value = pageNo;
	varForm.action = "<c:url value='/uss/ion/bnt/EgovBndtCeckManageList.do'/>";
	varForm.submit();
 }

/* ********************************************************
 * 조회 처리 
 ******************************************************** */
 /*설명 : 목록 조회 */
 function fncSelectMtgPlaceManageList(pageNo){
	 var varForm				 = document.all["listForm"];
	 //varForm.searchCondition.value = "1";
	 varForm.pageIndex.value = pageNo;
	 varForm.action = "<c:url value='/uss/ion/bnt/EgovBndtCeckManageList.do'/>";
	 varForm.submit();
 }

/* ********************************************************
 * 등록 처리 함수 
 ******************************************************** */
function fncBndtCeckManageRegist(){
	location.href = "/uss/ion/bnt/EgovBndtCeckManageRegist.do";
}

/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fncBndtCeckManageDetail(bndtCeckSe, bndtCeckCd){
	var varForm				 = document.all["listForm"];
	varForm.bndtCeckSe.value = bndtCeckSe;
	varForm.bndtCeckCd.value = bndtCeckCd;
	varForm.action           = "<c:url value='/uss/ion/bnt/EgovBndtCeckManage.do'/>";
	varForm.submit();
}

-->
</script>
</head>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<div id="border" style="width:730px">
<table border="0">
  <tr>
    <td width="700">
<!-- ********** 여기서 부터 본문 내용 *************** -->
	
	<form name="listForm" action="<c:url value='/uss/ion/bnt/EgovBndtCeckManageList.do'/>" method="post">
	<input type="hidden" name="searchCondition">
	<input type="hidden" name="bndtCeckSe">
	<input type="hidden" name="bndtCeckCd">
	<input type="hidden" name="pageIndex" value="<c:if test="${empty bndtCeckManageVO.pageIndex }">1</c:if><c:if test="${!empty bndtCeckManageVO.pageIndex }"><c:out value='${bndtCeckManageVO.pageIndex}'/></c:if>">
	
		<table width="700" cellpadding="8" class="table-search" border="0">
		 <tr>
		  <td width="40%"class="title_left">
		   <h1><img src="/images/egovframework/com/cmm/icon/tit_icon.gif" width="16" height="16" hspace="3" style="vertical-align: middle" alt="">&nbsp;당직체크관리 목록</h1></td>
		  <th>
		  </th>
		  <td width="10%"></td>
		  <td width="35%"></td>
		  <th width="10%">
		       <table border="0" cellspacing="0" cellpadding="0">
		        <tr> 
		          <td><span class="button"><input type="submit" value="<spring:message code="button.inquire" />" onclick="fncSelectMtgPlaceManageList('1'); return false;"></span></td>
		          <td>&nbsp;&nbsp;</td>
		          <td><span class="button"><a href="<c:url value='/uss/ion/bnt/EgovBndtCeckManageRegist.do'/>?searchCondition=1" onclick="fncBndtCeckManageRegist(); return false;"><spring:message code="button.create" /></a></span></td>     
		        </tr>
		       </table>
		  </th>  
		 </tr>
		</table>
		<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="당직체크관리 검색조건" >
	      <caption>당직체크관리 검색조건</caption>
		  <tr>
		    <th width="20%" height="23" class="required_text"  scope="row"><label for="searchBndtCeckSe">당직구분</label><img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>          
		    <td width="30%"  >
		        <select name="searchBndtCeckSe" title="당직구분">
		        	<option value="" <c:if test="${bndtCeckManageVO.searchBndtCeckSe eq '' }">selected</c:if>>전체</option>
		            <c:forEach items="${bndtCeckSeList}" var="result" varStatus="status">
			       	   <option value="<c:out value="${result.code}"/>" <c:if test="${result.code eq bndtCeckManageVO.searchBndtCeckSe}">selected</c:if>><c:out value="${result.codeNm }"/></option>
		            </c:forEach>
		      	</select>
		    </td>
		    <th width="20%" height="23" class="required_text"  scope="row"><label for="searchKeyword">당직체크코드명</label><img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>          
		    <td width="30%" nowrap >
		    	    <input name="searchKeyword" type="text" size="20" value="${bndtCeckManageVO.searchKeyword}"  maxlength="100" title="당직체크코드명"> 
	        </td>
		  </tr> 
		  <tr>
		    <th width="20%" height="23" class="required_text"  scope="row"><label for="searchUseAt">사용여부</label><img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>          
		    <td width="30%" colspan=3>
		        <select name="searchUseAt" title="사용여부">
			       	<option value=""  <c:if test="${bndtCeckManageVO.searchUseAt eq '' }">selected</c:if>>전체</option>
			       	<option value="Y" <c:if test="${bndtCeckManageVO.searchUseAt eq 'Y' }">selected</c:if>>사용</option>
			       	<option value="N" <c:if test="${bndtCeckManageVO.searchUseAt eq 'N' }">selected</c:if>>미사용</option>
		      	</select>
		    </td>
		  </tr> 
		</table>
	</form>
	<table width="700" cellspacing="0" cellpadding="0" border="0">
	<tr>
		<td height="3px"></td>
	</tr>
	</table>
	
	<table width="700" cellpadding="0" class="table-list" border="0" summary="이 표는 당직체크관리리스트의 정보를 제공하며 당직체크구분, 당직체크코드, 당직체크코드명, 사용여부로 구성되어 있습니다." >
    <caption>당직체크관리 목록</caption>
	<thead>
	<tr>  
		<th class="title" width="10%" scope="col" >순번</th>
		<th class="title" width="20%" scope="col" >당직체크구분</th>
		<th class="title" width="30%" scope="col" >당직체크코드</th>
		<th class="title" width="30%" scope="col" >당직체크코드명</th>
		<th class="title" width="10%" scope="col" >사용여부</th>
	</tr>
	</thead>     
	<tbody>
	<c:forEach items="${bndtCeckManageList}" var="resultInfo" varStatus="status">
	<tr>
		<td class="lt_text3" nowrap><c:out value="${(bndtCeckManageVO.pageIndex - 1) * bndtCeckManageVO.pageSize + status.count}"/></td>
		<td class="lt_text3" nowrap><c:out value="${resultInfo.bndtCeckTemp1}"/></td>
		<td class="lt_text3" nowrap><c:out value="${resultInfo.bndtCeckCd}"/></td>
		<td class="lt_text3"  nowrap>
        <form name="item" method="post" action="<c:url value='/uss/ion/bnt/EgovBndtCeckManage.do'/>">
        	<input type="hidden" name="bndtCeckSe" value="<c:out value="${resultInfo.bndtCeckSe      }"/>">
	        <input type="hidden" name="bndtCeckCd" value="<c:out value="${resultInfo.bndtCeckCd      }"/>">
            <span class="link"><input type="submit" value="<c:out value="${resultInfo.bndtCeckCdNm}"/>" onclick="fncBndtCeckManageDetail('<c:out value="${resultInfo.bndtCeckSe}"/>','<c:out value="${resultInfo.bndtCeckCd}"/>'); return false;" style="text-align : left;"></span>
        </form></td>
		<td class="lt_text3" nowrap><c:if test="${resultInfo.useAt == 'Y'}">사용</c:if><c:if test="${resultInfo.useAt == 'N'}">미사용</c:if></td>
	</tr>   
	</c:forEach>
	
	<c:if test="${fn:length(bndtCeckManageList) == 0}">
		<tr> 
			<td class="lt_text3" colspan="5">
				<spring:message code="common.nodata.msg" />
			</td>
		</tr>   	          				 			   
	</c:if>
	    	
	    	
	</tbody>  
	</table>
	
	<table width="700" cellspacing="0" cellpadding="0" border="0">
	<tr>
		<td height="3px"></td>
	</tr>
	</table>

	<c:if test="${!empty bndtCeckManageVO.pageIndex }">
	<div align="center">
	    <div>
	        <ui:pagination paginationInfo="${paginationInfo}"
	                       type="image"
	                       jsFunction="linkPage" />
	    </div>
	</div>
	</c:if>

<!-- ********** 여기까지 내용 *************** -->
</td>
</tr>
</table>
</div>
</body>
</html>
