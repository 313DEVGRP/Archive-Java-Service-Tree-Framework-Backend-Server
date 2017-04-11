<% 
/**
 * @Class Name : EgovNtwrkSvcMntrngUpdt.jsp
 * @Description : 네트워크서비스모니터대상 수정
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
		if (!validateNtwrkSvcMntrngVO(document.ntwrkSvcMntrngVO)){
			return;
		}
		
		if (confirm('<spring:message code="common.regist.msg" />')) {
			document.ntwrkSvcMntrngVO.action = "<c:url value='/utl/sys/nsm/updateNtwrkSvcMntrng.do'/>";
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
<title>네트워크서비스모니터대상 수정</title>
</head>
<body onLoad="fn_egov_init_NtwrkSvcMntrng()">

<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<div id="border" style="width:730px">

<form:form commandName="ntwrkSvcMntrngVO" name="ntwrkSvcMntrngVO" method="post" action="${pageContext.request.contextPath}/utl/sys/nsm/updateNtwrkSvcMntrng.do">

	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="100%"class="title_left">
	   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">
	   &nbsp;네트워크서비스모니터대상 수정</h1></td>
	 </tr>
	</table>
	
	<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="이 표는 네트워크서비스모니터링 대상 정보를 등록할 수 있는 표이며, 시스템IP, 시스템포트, 시스템명, 관리자명, 관리자이메일주소 정보로 구성되어 있습니다 .">
	<caption>네트워크서비스모니터대상 수정</caption>
	<tbody>
	  <tr> 
		<th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="sysIp1">시스템IP</label><img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
		<td width="80%" >
			<form:input path="sysIp1" size="3" maxlength="3" title="시스템IP1"/> . 
			<form:input path="sysIp2" size="3" maxlength="3" title="시스템IP2"/> . 
			<form:input path="sysIp3" size="3" maxlength="3" title="시스템IP3"/> .
			<form:input path="sysIp4" size="3" maxlength="3" title="시스템IP4"/>
			<div><form:errors path="sysIp1" cssClass="error"/></div>
			<div><form:errors path="sysIp2" cssClass="error"/></div>
			<div><form:errors path="sysIp3" cssClass="error"/></div>
			<div><form:errors path="sysIp4" cssClass="error"/></div>
		</td>
	  </tr>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="sysPort">시스템포트</label><img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <form:input path="sysPort" size="5" maxlength="5" title="시스템포트"/>
	      <div><form:errors path="sysPort" cssClass="error"/></div>
	    </td>
	  </tr>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="sysNm">시스템명</label><img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <form:input path="sysNm" size="65" maxlength="255" title="시스템명"/>
	      <div><form:errors path="sysNm" cssClass="error"/></div>
	    </td>
	  </tr>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="mngrNm">관리자명</label><img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <form:input path="mngrNm" size="5" maxlength="60" title="관리자명"/>
	      <div><form:errors path="mngrNm" cssClass="error"/></div>
	    </td>
	  </tr>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="mngrEmailAddr">관리자이메일주소</label><img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <form:input path="mngrEmailAddr" size="25" maxlength="50" title="관리자이메일주소"/>
    	  <div><form:errors path="mngrEmailAddr" cssClass="error"/></div>
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
	  <td><span class="button"><input type="submit" value="<spring:message code="button.save" />" onclick="fn_egov_update_ntwrksvcmntrng(); return false;"></span></td>
      <td>&nbsp;&nbsp;</td>
      <td><span class="button"><a href="<c:url value='/utl/sys/nsm/selectNtwrkSvcMntrngList.do'/>?searchWrd=<c:out value='${ntwrkSvcMntrngVO.searchWrd}'/>&amp;searchCnd=<c:out value='${ntwrkSvcMntrngVO.searchCnd}'/>&amp;pageIndex=<c:out value='${ntwrkSvcMntrngVO.pageIndex}'/>" onclick="fn_egov_list_ntwrksvcmntrng(); return false;"><spring:message code="button.list" /></a></span></td>
	</tr>
	</table>
	</div>
	
	<input type="hidden" id="oldSysIp" name="oldSysIp" value="<c:out value='${ntwrkSvcMntrngVO.sysIp}'/>"/>
	<input type="hidden" id="oldSysPort" name="oldSysPort" value="<c:out value='${ntwrkSvcMntrngVO.sysPort}'/>"/>
	<!-- 검색조건 유지 -->
    <input type="hidden" name="searchWrd" value="<c:out value='${ntwrkSvcMntrngVO.searchWrd}'/>" />
    <input type="hidden" name="searchCnd" value="<c:out value='${ntwrkSvcMntrngVO.searchCnd}'/>" />
    <input type="hidden" name="pageIndex" value="<c:out value='${ntwrkSvcMntrngVO.pageIndex}'/>" />
    <!-- 검색조건 유지 -->
</form:form>

</div>

</body>
</html>