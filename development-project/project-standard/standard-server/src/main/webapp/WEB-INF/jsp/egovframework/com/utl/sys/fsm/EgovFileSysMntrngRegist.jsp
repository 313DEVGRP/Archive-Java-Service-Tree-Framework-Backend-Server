<% 
/**
 * @Class Name : EgovFileSysMntrngRegist.jsp
 * @Description : 파일시스템모니터대상 등록
 * @Modification Information
 * @
 * @  수정일      수정자            수정내용
 * @ -------        --------    ---------------------------
 * @ 2010.08.18   장철호          최초 생성
 *
 *  @author 공통컴포넌트개발팀 장철호
 *  @since 2010.08.18
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
<validator:javascript formName="fileSysMntrngVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript">
	function fn_egov_init_FileSysMntrng(){
		document.fileSysMntrngVO.fileSysMg.value = "<c:out value='${fileSysMgValue}'/>";
		if(document.fileSysMntrngVO.fileSysMg.value == ""){
			document.fileSysMntrngVO.fileSysMg.value = 0;
		}

		if("${notApplicableFileSys}" == "true"){
			alert("파일시스템명이 올바르지 않습니다.");
		}
	}

	function fn_egov_insert_filesysmntrng() {
		if (!validateFileSysMntrngVO(document.fileSysMntrngVO)){
			return;
		}

		if(eval(document.fileSysMntrngVO.fileSysMg.value) < 1){
			alert("파일시스템확인 버튼을 클릭하여, 파일시스템의 크기를 확인해야 합니다.");
			return;
		}

		if(eval(document.fileSysMntrngVO.fileSysThrhld.value) < 1){
			alert("파일시스템 임계치를 1G 이상 입력하여야 합니다.");
			return;
		}
		
		if(eval(document.fileSysMntrngVO.fileSysThrhld.value) > eval(document.fileSysMntrngVO.fileSysMg.value)){
			alert("파일시스템 임계치는 파일시스템 크기보다 클 수 없습니다.");
			return;
		}
		
		if (confirm('<spring:message code="common.regist.msg" />')) {
			document.fileSysMntrngVO.action = "<c:url value='/utl/sys/fsm/insertFileSysMntrng.do'/>";
			document.fileSysMntrngVO.submit();					
		}
	}

	function fn_egov_select_filesysmg() {
		document.fileSysMntrngVO.action = "<c:url value='/utl/sys/fsm/selectFileSysMg.do'/>";
		document.fileSysMntrngVO.submit();					
	}

	/* ********************************************************
	 * 목록 으로 가기
	 ******************************************************** */
	function fn_egov_list_filesysmntrng(){
		document.fileSysMntrngVO.action = "<c:url value='/utl/sys/fsm/selectFileSysMntrngList.do'/>";
		document.fileSysMntrngVO.submit();	
	}	

</script>
<title>파일시스템모니터대상 등록</title>
</head>
<body onLoad="fn_egov_init_FileSysMntrng()">

<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<div id="border" style="width:730px">

<form:form commandName="fileSysMntrngVO" name="fileSysMntrngVO" method="post" action="${pageContext.request.contextPath}/utl/sys/fsm/insertFileSysMntrng.do">

	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="100%"class="title_left">
	   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">
	   &nbsp;파일시스템모니터대상 등록</h1></td>
	 </tr>
	</table>
	
	<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="이 표는 파일시스템모니터링 대상 정보를  등록하기 위한 표이며, 파일시스템명, 파일시스템관리명, 파일시스템 크기, 파일시스템 임계치, 관리자명, 관리자이메일주소 정보로 구성되어 있습니다 .">
	<caption>파일시스템모니터대상 등록</caption>
	<tbody>
	  <tr> 
		<th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="fileSysNm">파일시스템명</label><img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
		<td width="80%" >
			<form:input path="fileSysNm" size="50" maxlength="60" title="파일시스템명"/>
			<span class="button"><a href="<c:url value='/utl/sys/fsm/selectFileSysMg.do'/>?searchWrd=<c:out value='${fileSysMntrngVO.searchWrd}'/>&amp;searchCnd=<c:out value='${fileSysMntrngVO.searchCnd}'/>&amp;pageIndex=<c:out value='${fileSysMntrngVO.pageIndex}'/>" onclick="fn_egov_select_filesysmg(); return false;">파일시스템확인</a></span>
		</td>
	  </tr>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="fileSysManageNm">파일시스템관리명</label><img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <form:input path="fileSysManageNm" size="65" maxlength="255" title="파일시스템관리명"/>
	      <div><form:errors path="fileSysManageNm" cssClass="error"/></div>
	    </td>
	  </tr>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="fileSysMg">파일시스템 크기</label><img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <form:input path="fileSysMg" size="8" maxlength="8" title="파일시스템 크기" readonly="true"/>G
	      <div><form:errors path="fileSysMg" cssClass="error"/></div>
	    </td>
	  </tr>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="fileSysThrhld">파일시스템 임계치</label><img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <form:input path="fileSysThrhld" size="8" maxlength="8" title="파일시스템 임계치"/>G
	      <div><form:errors path="fileSysThrhld" cssClass="error"/></div>
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
	  <td><span class="button"><input type="submit" value="<spring:message code="button.save" />" onclick="fn_egov_insert_filesysmntrng(); return false;"></span></td>
      <td>&nbsp;&nbsp;</td>
      <td><span class="button"><a href="<c:url value='/utl/sys/fsm/selectFileSysMntrngList.do'/>?searchWrd=<c:out value='${fileSysMntrngVO.searchWrd}'/>&amp;searchCnd=<c:out value='${fileSysMntrngVO.searchCnd}'/>&amp;pageIndex=<c:out value='${fileSysMntrngVO.pageIndex}'/>" onclick="fn_egov_list_filesysmntrng(); return false;"><spring:message code="button.list" /></a></span></td>
	</tr>
	</table>
	</div>
	<!-- 검색조건 유지 -->
    <input type="hidden" name="searchWrd" value="<c:out value='${fileSysMntrngVO.searchWrd}'/>" />
    <input type="hidden" name="searchCnd" value="<c:out value='${fileSysMntrngVO.searchCnd}'/>" />
    <input type="hidden" name="pageIndex" value="<c:out value='${fileSysMntrngVO.pageIndex}'/>" />
    <!-- 검색조건 유지 -->
</form:form>

</div>

</body>
</html>