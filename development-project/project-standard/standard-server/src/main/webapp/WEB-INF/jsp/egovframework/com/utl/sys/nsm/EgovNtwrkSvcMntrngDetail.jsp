<% 
/**
 * @Class Name : EgovNtwrkSvcMntrngDetail.jsp
 * @Description : 네트워크서비스모니터대상 상세보기
 * @Modification Information
 * @
 * @  수정일      수정자            수정내용
 * @ -------        --------    ---------------------------
 * @ 2010.08.17   장철호          최초 생성
 *
 *  @author 공통컴포넌트개발팀 장철호
 *  @since 2010.08.17
 *  @version 1.0 
 *  @see
 *  
 */
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="ImgUrl" value="/images/egovframework/com/cmm/"/>
<c:set var="CssUrl" value="/css/egovframework/com/"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='${CssUrl}/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='${CssUrl}/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="ntwrkSvcMntrngVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript">
	function fn_egov_init_NtwrkSvcMntrng(){
	
	}

	function fn_egov_update_ntwrksvcmntrng() {
		document.ntwrkSvcMntrngVO.action = "<c:url value='/utl/sys/nsm/modifyNtwrkSvcMntrng.do'/>";
		document.ntwrkSvcMntrngVO.submit();	
	}

	function fn_egov_delete_ntwrksvcmntrng(){
		if(confirm("삭제 하시겠습니까?")){
			document.ntwrkSvcMntrngVO.action = "<c:url value='/utl/sys/nsm/deleteNtwrkSvcMntrng.do'/>";
			document.ntwrkSvcMntrngVO.submit();
		}
	}
	
	/* ********************************************************
	 * 목록 으로 가기
	 ******************************************************** */
	function fn_egov_list_ntwrksvcmntrng(){
		document.ntwrkSvcMntrngVO.action = "<c:url value='/utl/sys/nsm/selectNtwrkSvcMntrngList.do'/>";
		document.ntwrkSvcMntrngVO.submit();	
	}	

</script>
<title>네트워크서비스모니터대상 상세보기</title>
</head>
<body onLoad="fn_egov_init_NtwrkSvcMntrng()">

<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<div id="border" style="width:730px">

<form:form commandName="ntwrkSvcMntrngVO" name="ntwrkSvcMntrngVO" method="post" action="${pageContext.request.contextPath}/utl/sys/nsm/modifyNtwrkSvcMntrng.do">

	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="100%"class="title_left">
	   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">
	   &nbsp;네트워크서비스모니터대상 상세보기</h1></td>
	 </tr>
	</table>
	
	<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="이 표는 네트워크서비스모니터링 대상 정보를 제공하며, 시스템IP, 시스템포트, 시스템명, 관리자명, 관리자이메일주소, 모니터링상태, 마지막생성일시 정보로 구성되어 있습니다 .">
	<caption>네트워크서비스모니터대상 상세보기</caption>
	<tbody>
	  <tr> 
		<th scope="row" width="20%" height="23" class="required_text" nowrap >시스템IP<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
		<td width="80%" >
			<c:out value="${ntwrkSvcMntrngVO.sysIp1}" escapeXml="false" />.<c:out value="${ntwrkSvcMntrngVO.sysIp2}" escapeXml="false" />.<c:out value="${ntwrkSvcMntrngVO.sysIp3}" escapeXml="false" />.<c:out value="${ntwrkSvcMntrngVO.sysIp4}" escapeXml="false" />
			<div><form:errors path="sysIp1" cssClass="error"/></div>
			<div><form:errors path="sysIp2" cssClass="error"/></div>
			<div><form:errors path="sysIp3" cssClass="error"/></div>
			<div><form:errors path="sysIp4" cssClass="error"/></div>
		</td>
	  </tr>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >시스템포트<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <c:out value="${ntwrkSvcMntrngVO.sysPort}" escapeXml="false" />
	    </td>
	  </tr>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >시스템명<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <c:out value="${ntwrkSvcMntrngVO.sysNm}" escapeXml="false" />
	    </td>
	  </tr>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >관리자명<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <c:out value="${ntwrkSvcMntrngVO.mngrNm}" escapeXml="false" />
	    </td>
	  </tr>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >관리자이메일주소<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <c:out value="${ntwrkSvcMntrngVO.mngrEmailAddr}" escapeXml="false" />
	    </td>
	  </tr>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >모니터링상태<img src="${ImgUrl}icon/no_required.gif" width="15" height="15" alt="선택항목"></th>
	    <td width="80%" >
	      <c:out value="${ntwrkSvcMntrngVO.mntrngSttus}" escapeXml="false" />
	    </td>
	  </tr>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >마지막 생성일시<img src="${ImgUrl}icon/no_required.gif" width="15" height="15" alt="선택항목"></th>
	    <td width="80%" >
	      <c:out value="${ntwrkSvcMntrngVO.creatDt}" escapeXml="false" />
	    </td>
	  </tr>
	</tbody>
	</table>
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr> 
	    <td height="10"></td>
	  </tr>
	</table>
  	<div align="center">
	<table border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
	  <td><span class="button"><input type="submit" value="<spring:message code="button.update" />" onclick="fn_egov_update_ntwrksvcmntrng(); return false;"></span></td>
      <td>&nbsp;&nbsp;</td>
      <td><span class="button"><a href="<c:url value='/utl/sys/nsm/deleteNtwrkSvcMntrng.do'/>?sysIp=<c:out value='${ntwrkSvcMntrngVO.sysIp}'/>&amp;sysPort=<c:out value='${ntwrkSvcMntrngVO.sysPort}'/>" onclick="fn_egov_delete_ntwrksvcmntrng(); return false;"><spring:message code="button.delete" /></a></span></td>
      <td>&nbsp;&nbsp;</td>
      <td><span class="button"><a href="<c:url value='/utl/sys/nsm/selectNtwrkSvcMntrngList.do'/>?searchWrd=<c:out value='${ntwrkSvcMntrngVO.searchWrd}'/>&amp;searchCnd=<c:out value='${ntwrkSvcMntrngVO.searchCnd}'/>&amp;pageIndex=<c:out value='${ntwrkSvcMntrngVO.pageIndex}'/>" onclick="fn_egov_list_ntwrksvcmntrng(); return false;"><spring:message code="button.list" /></a></span></td>
	</tr>
	</table>
	</div>
	
	<input type="hidden" id="sysIp" name="sysIp" value="<c:out value='${ntwrkSvcMntrngVO.sysIp}'/>"/>
	<input type="hidden" id="sysPort" name="sysPort" value="<c:out value='${ntwrkSvcMntrngVO.sysPort}'/>"/>
	<!-- 검색조건 유지 -->
    <input type="hidden" name="searchWrd" value="<c:out value='${ntwrkSvcMntrngVO.searchWrd}'/>" />
    <input type="hidden" name="searchCnd" value="<c:out value='${ntwrkSvcMntrngVO.searchCnd}'/>" />
    <input type="hidden" name="pageIndex" value="<c:out value='${ntwrkSvcMntrngVO.pageIndex}'/>" />
    <!-- 검색조건 유지 -->
</form:form>

</div>

</body>
</html>