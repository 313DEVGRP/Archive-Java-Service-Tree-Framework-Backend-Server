<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : EgovClubListByCmmntyId.jsp
  * @Description : 동호회 목록 조회화면 - 해당 커뮤니티에 속하는
  * @Modification Information
  * @
  * @  수정일      수정자            수정내용
  * @ -------        --------    ---------------------------
  * @ 2009.04.06   이삼섭          최초 생성
  *
  *  @author 공통서비스 개발팀 이삼섭
  *  @since 2009.04.06
  *  @version 1.0
  *  @see
  *
  */
%>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css" >
<script type="text/javascript">
	function fn_egov_inqire_clbInf(clbId) {
		document.frm.clbId.value = clbId;
		document.frm.action = "<c:url value='/cop/clb/selectClubInf.do'/>";
		document.frm.submit();
	}

	function fn_egov_select_clbInfs(pageIndex){
		document.frm.pageIndex.value = pageIndex;
		document.frm.action = "<c:url value='/cop/clb/selectClubInfByCmmntyId.do'/>";
		document.frm.submit();
	}
</script>
<title>소속 동호회 목록</title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>

</head>
<body>
<form name="frm" method="post">
<input type="hidden" name="cmmntyId"  vlaue='${cmmntyId}'/>
<input type="hidden" name="clbId" />

<div id="border" style="width:730px">
	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="40%"class="title_left">
	  	<h1>
	  		<img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="absmiddle" alt="제목버튼이미지">&nbsp;소속 동호회 목록
	  	</h1>
	  </td>
	  <th >
	  </th>
	  <td width="10%" ></td>
	  <td widht="35%"></td>
	  <th width="10%">
	  </th>
	 </tr>
	</table>
	<table width="100%" cellpadding="8" class="table-line">
	 <thead>
	  <tr>
	    <th class="title" width="10%" nowrap>번호</th>
	    <th class="title" width="30%" nowrap>동호회명</th>
	    <th class="title" width="20%" nowrap>등록일</th>
	    <th class="title" width="17%" nowrap>사용여부</th>
	  </tr>
	 </thead>
	 <tbody>
		<c:forEach var="result" items="${result}" varStatus="status">
		  <tr>
		    <td class="lt_text3" nowrap><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
		    <td class="lt_text3" nowrap>
		     	<a href="javascript:fn_egov_inqire_clbInf('<c:out value="${result.clbId}"/>')">
		    	<c:out value="${result.clbNm}"/></a>
		    </td>
		    <td class="lt_text3" nowrap><c:out value="${result.frstRegisterPnttm}"/></td>
		    <td class="lt_text3" nowrap>
		    	<c:if test="${result.useAt == 'N'}"><spring:message code="button.notUsed" /></c:if>
		    	<c:if test="${result.useAt == 'Y'}"><spring:message code="button.use" /></c:if>
		    </td>
		  </tr>
		</c:forEach>
		<c:if test="${fn:length(result) == 0}">
		  <tr>
		    <td class="lt_text3" nowrap colspan="4" ><spring:message code="common.nodata.msg" /></td>
		  </tr>
		 </c:if>
	 </tbody>

	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="10"></td>
	  </tr>
	</table>

</div>
</form>
</body>
</html>
