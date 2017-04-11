<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : EgovCmmntyInqire.jsp
  * @Description : 커뮤니티 조회화면
  * @Modification Information
  * @
  * @  수정일      수정자            수정내용
  * @ -------        --------    ---------------------------
  * @ 2009.04.04   이삼섭          최초 생성
  *
  *  @author 공통서비스 개발팀 이삼섭
  *  @since 2009.04.04
  *  @version 1.0
  *  @see
  *
  */
%>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function fn_egov_select_cmmntyInfs() {
		document.frm.action = "<c:url value='/cop/cmy/selectCmmntyInfs.do'/>";
		document.frm.submit();
	}

	function fn_egov_updtCmmntyInf(cmmntyId) {
		document.frm.param_cmmntyId.value = cmmntyId;
		document.frm.action = "<c:url value='/cop/cmy/forUpdateCmmntyInf.do'/>";
		document.frm.submit();
	}
</script>
<title>커뮤니티 정보조회</title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
	td.bgA { background:url(<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>);}
</style>


</head>
<body>
<form name="frm" method="post" action="<c:url value='/cop/cmy/selectCmmntyInfs.do'/>">
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
<input name="cmmntyId" type="hidden" value="<c:out value='${cmmntyVO.cmmntyId}'/>"/>
<input name="param_cmmntyId" type="hidden" />

<div id="border" style="width:730px">
	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="100%"class="title_left">
	  	<h1>
	  		<img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="제목버튼이미지">&nbsp;커뮤니티 정보조회
	  	</h1>
	  </td>
	 </tr>
	</table>
	<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register">
	  <tr>
	    <th width="20%" height="23" class="" nowrap >커뮤니티 명</th>
	    <td width="80%" nowrap colspan="3"><c:out value="${cmmntyVO.cmmntyNm}" />
	    </td>
	  </tr>
	  <tr>
	    <th height="23" class="" >커뮤니티 소개</th>
	    <td colspan="3"><c:out value="${cmmntyVO.cmmntyIntrcn}" />
	    </td>
	  </tr>
	  <tr>
	    <th width="20%" height="23" class="" nowrap >템플릿 정보</th>
	    <td width="30%" nowrap colspan="3"><c:out value="${cmmntyVO.cmmntyNm}" />
	    </td>
	  </tr>
	  <tr>
	    <th width="20%" height="23" class="" nowrap >게시판 정보</th>
	    <td width="30%" nowrap colspan="3">
	    	<c:forEach var="result" items="${result}" varStatus="status">
	     		<c:out value="${result.bbsNm}" /> /
	     	</c:forEach>
	    </td>
	  </tr>
	  <tr>
	    <th width="20%" height="23" class="" nowrap >사용여부</th>
	    <td width="80%" nowrap class="" colspan="3">
	    <c:if test="${cmmntyVO.useAt == 'Y'}"><spring:message code="button.use" /></c:if>
	    <c:if test="${cmmntyVO.useAt == 'N'}"><spring:message code="button.notUsed" /></c:if>
	    </td>
	  </tr>
	  <tr>
	    <th width="20%" height="23" class="" nowrap >생성자</th>
	    <td width="30%" nowrap><c:out value="${cmmntyVO.frstRegisterNm}" />
	    </td>
	    <th width="20%" height="23" class="" nowrap >생성일시</th>
	    <td width="30%" nowrap>
	     <c:out value="${cmmntyVO.frstRegisterPnttm}" />
	    </td>
	  </tr>
	  <tr>
	    <th width="20%" height="23" class="" nowrap >제공 URL</th>
	    <td width="80%" nowrap colspan="3">
			<a href="<c:out value="${cmmntyVO.provdUrl}" />" target="_new">
	    	   	<c:out value="${cmmntyVO.provdUrl}" />
			</a>
	    </td>
	  </tr>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="10"></td>
	  </tr>
	</table>
	<c:import url="/cop/clb/selectClubInfByCmmntyId.do" charEncoding="utf-8">
		<c:param name="param_cmmntyId" value="${cmmntyVO.cmmntyId}" />
	</c:import>

	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="10"></td>
	  </tr>
	</table>
	<div align="center">
	<table border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
	  <c:if test="${cmmntyVO.useAt == 'Y'}">
        <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt="버튼이미지"></td>
        <td class="text_left bgA">
        <a href="javascript:fn_egov_updtCmmntyInf('<c:out value="${cmmntyVO.cmmntyId}"/>');">수정</a>
        </td>
        <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
        <td width="10"></td>
      </c:if>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt="버튼이미지"></td>
      <td class="text_left bgA">
      <a href="javascript:fn_egov_select_cmmntyInfs();">목록</a>
      </td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
	</tr>
	</table>
	</div>
</div>
</form>
</body>
</html>
