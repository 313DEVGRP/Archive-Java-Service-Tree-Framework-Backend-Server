<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%

/**
 * @Class Name : EgovMtgPlaceManageList.java
 * @Description : EgovMtgPlaceManageList jsp
 * @Modification Information
 * @
 * @  수정일                    수정자                수정내용
 * @ ---------     --------    ---------------------------
 * @ 2010.06.29    이      용                최초 생성
 *
 *  @author 이      용
 *  @since 2010.06.29
 *  @version 1.0
 *  @see
 *  
 *  Copyright (C) 2009 by MOPAS  All right reserved.
 */
 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css'    />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<title>회의실관리 목록</title>
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<script type="text/javaScript" language="javascript" defer="defer">
<!--
/*설명 : 회의실  목록 조회 */
function fncSelectMtgPlaceManageList(pageNo){
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/uss/ion/mtg/selectMtgPlaceManageList.do'/>";
    document.listForm.submit();
}

/*설명 : 회의실 상세조회 */
function fncSelectMtgPlaceManage(mtgPlaceId) {
    document.listForm.mtgPlaceId.value = mtgPlaceId;
    document.listForm.action = "<c:url value='/uss/ion/mtg/selectMtgPlaceManage.do'/>";
    document.listForm.submit();   
}
/*설명 : 회의실 신규등록 화면 호출 */
function fncInsertMtgPlace() {
	if(document.listForm.pageIndex.value == "") {
		document.listForm.pageIndex.value = 1;
	} 
    document.listForm.action = "<c:url value='/uss/ion/mtg/insertViewMtgPlace.do'/>";
    document.listForm.submit(); 
}
/*설명 : 회의실 목록 페이지 조회 */
function linkPage(pageNo){
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/uss/ion/mtg/selectMtgPlaceManageList.do'/>";
    document.listForm.submit();
}
/*설명 : 회의실 목록 조회 enter키 처리 */
function press() {
    if (event.keyCode==13) {
    	fncSelectMtgPlaceManageList('1');
    }
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
<form name="listForm" action="<c:url value='/uss/ion/mtg/selectMtgPlaceManageList.do'/>" method="post">    
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="30%"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;회의실관리 목록</h1></td>
  <td width="60%">&nbsp;</td>
  <th width="10%" align="right">
       <table border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td><span class="button"><input type="submit" value="<spring:message code="button.inquire" />" onclick="fncSelectMtgPlaceManageList('1'); return false;"></span></td>
          <td>&nbsp;&nbsp;</td>
          <td><span class="button"><a href="<c:url value='/uss/ion/mtg/insertViewMtgPlace.do'/>?searchCondition=1" onclick="fncInsertMtgPlace(); return false;"><spring:message code="button.create" /></a></span></td>     
        </tr>
       </table>
  </th>  
 </tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="회의실관리 검색조건" >
	<caption>회의실관리 검색조건</caption>
  <tr> 
    <th width="20%" height="23" class="required_text" scope="row"><label for="searchKeyword">회의실명</label><img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>
    <td width="80%" >
		<input name="searchKeyword" type="text" size="80" value="<c:out value="${mtgPlaceManageVO.searchKeyword }"/>" maxlength="70" title="검색명">
    </td>
  </tr>
</table>
<input type="hidden" name="mtgPlaceId">
<input type="hidden" name="pageIndex" value="<c:if test="${empty mtgPlaceManageVO.pageIndex }">1</c:if><c:if test="${!empty mtgPlaceManageVO.pageIndex }"><c:out value='${mtgPlaceManageVO.pageIndex}'/></c:if>">
<input type="hidden" name="searchCondition" value="1">
</form>
<br>

<table width="100%" cellpadding="0" class="table-list" summary="회의실관리에 대한 목록을 제공한다.">
<caption>회의실관리에 대한 목록</caption>
 <thead>
  <tr>
    <th class="title" width="7%"  scope="col">번호</th>
    <th class="title" width="20%" scope="col">회의실명</th>
    <th class="title" width="25%" scope="col">개방시간(From~To)</th>
    <th class="title" width="10%" scope="col">수용인원</th>
    <th class="title" scope="col">위치</th> 
  </tr>
 </thead>   
 <tbody>
 <c:forEach var="mtgPlaceManage" items="${mtgPlaceManageList}" varStatus="status">
  <tr>
    <td class="lt_text3" nowrap><c:out value="${(mtgPlaceManageVO.pageIndex - 1) * mtgPlaceManageVO.pageSize + status.count}"/></td>
    <td class="lt_textL" nowrap>
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceManage.do'/>">
            <input type="hidden" name="mtgPlaceId"  value="<c:out value="${mtgPlaceManage.mtgPlaceId}"/>">
            <span class="link"><input type="submit" value="<c:out value="${mtgPlaceManage.mtgPlaceNm}"/>" onclick="fncSelectMtgPlaceManage('<c:out value="${mtgPlaceManage.mtgPlaceId}"/>'); return false;" style="text-align : left;"></span>
        </form>
    </td>
    <td class="lt_text3" nowrap><c:out value="${mtgPlaceManage.opnBeginTm}"/> ~ <c:out value="${mtgPlaceManage.opnEndTm}"/></td>
    <td class="lt_text3" nowrap><c:out value="${mtgPlaceManage.aceptncPosblNmpr}"/>명</td>
    <td class="lt_text3" nowrap><c:out value="${mtgPlaceManage.mtgPlaceTemp3}"/> <c:out value="${mtgPlaceManage.lcDetail}"/></td> 
  </tr>
 </c:forEach>
 </tbody>  
 </table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"></td>
  </tr>
</table>

<c:if test="${!empty mtgPlaceManageVO.pageIndex }">
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
</DIV>
</body>
</html>