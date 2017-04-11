<% 
/**
 * @Class Name : EgovNtwrkSvcMntrngLogDetail.jsp
 * @Description : 네트워크서비스모니터로그 상세보기
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
<validator:javascript formName="ntwrkSvcMntrngLogVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript">
	function fn_egov_init_NtwrkSvcMntrngLog(){
	
	}
	
	/* ********************************************************
	 * 목록 으로 가기
	 ******************************************************** */
	function fn_egov_list_ntwrksvcmntrnglog(){
		document.ntwrkSvcMntrngLogVO.action = "<c:url value='/utl/sys/nsm/selectNtwrkSvcMntrngLogList.do'/>";
		document.ntwrkSvcMntrngLogVO.submit();	
	}	

</script>
<title>네트워크서비스모니터로그 상세보기</title>
</head>
<body onLoad="fn_egov_init_NtwrkSvcMntrngLog()">

<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<div id="border" style="width:730px">

<form:form commandName="ntwrkSvcMntrngLogVO" name="ntwrkSvcMntrngLogVO" method="post" action="${pageContext.request.contextPath}/utl/sys/nsm/selectNtwrkSvcMntrngLogList.do">

	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="100%"class="title_left">
	   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">
	   &nbsp;네트워크서비스모니터링로그 상세보기</h1></td>
	 </tr>
	</table>
	
	<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="이 표는 네트워크서비스모니터링 로그 정보를 제공하며, 로그ID, 시스템IP, 시스템포트, 시스템명, 모니터링상태, 로그정보, 생성일시 정보로 구성되어 있습니다 .">
	<caption>네트워크서비스모니터로그 상세보기</caption>
	<tbody>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >로그ID<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <c:out value="${ntwrkSvcMntrngLog.logId}" escapeXml="false" />
	    </td>
	  </tr>
	  <tr> 
		<th scope="row" width="20%" height="23" class="required_text" nowrap >시스템IP<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
		<td width="80%" >
			<c:out value="${ntwrkSvcMntrngLog.sysIp}" escapeXml="false" />
		</td>
	  </tr>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >시스템포트<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <c:out value="${ntwrkSvcMntrngLog.sysPort}" escapeXml="false" />
	    </td>
	  </tr>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >시스템명<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <c:out value="${ntwrkSvcMntrngLog.sysNm}" escapeXml="false" />
	    </td>
	  </tr>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >모니터링상태<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <c:out value="${ntwrkSvcMntrngLog.mntrngSttus}" escapeXml="false" />
	    </td>
	  </tr>
	  <c:if test="${ntwrkSvcMntrngLog.mntrngSttus} ne '정상'">
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >로그정보<img src="${ImgUrl}icon/no_required.gif" width="15" height="15" alt="선택항목"></th>
	    <td width="80%" >
	    	<textarea id="logInfo" name="logInfo" rows="10" cols="75" title="로그정보"><c:out value="${ntwrkSvcMntrngLog.logInfo}" escapeXml="false" /></textarea>
	    </td>
	  </tr>
	  </c:if>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >생성일시<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <c:out value="${ntwrkSvcMntrngLog.creatDt}" escapeXml="false" />
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
	  <td>
	  	<span class="button"><input type="submit" value="<spring:message code="button.list" />" onclick="fn_egov_list_ntwrksvcmntrnglog(); return false;"></span>
	  </td>
	</tr>
	</table>
	</div>
	
	<input type="hidden" id="sysIp" name="sysIp" value="<c:out value='${ntwrkSvcMntrngLog.sysIp}'/>"/>
	<input type="hidden" id="sysPort" name="sysPort" value="<c:out value='${ntwrkSvcMntrngLog.sysPort}'/>"/>
	<input type="hidden" id="logId" name="logId" value="<c:out value='${ntwrkSvcMntrngLog.logId}'/>"/>
	<!-- 검색조건 유지 -->
    <input type="hidden" name="searchWrd" value="<c:out value='${ntwrkSvcMntrngLogVO.searchWrd}'/>" />
    <input type="hidden" name="searchCnd" value="<c:out value='${ntwrkSvcMntrngLogVO.searchCnd}'/>" />
    <input type="hidden" name="pageIndex" value="<c:out value='${ntwrkSvcMntrngLogVO.pageIndex}'/>" />
    <input name="searchBgnDe" type="hidden" value="<c:out value='${ntwrkSvcMntrngLogVO.searchBgnDe}'/>">
   	<input name="searchEndDe" type="hidden" value="<c:out value='${ntwrkSvcMntrngLogVO.searchEndDe}'/>">
   	<input name="searchBgnHour" type="hidden" value="<c:out value='${ntwrkSvcMntrngLogVO.searchBgnHour}'/>">
   	<input name="searchEndHour" type="hidden" value="<c:out value='${ntwrkSvcMntrngLogVO.searchEndHour}'/>">
    <!-- 검색조건 유지 -->
</form:form>

</div>

</body>
</html>