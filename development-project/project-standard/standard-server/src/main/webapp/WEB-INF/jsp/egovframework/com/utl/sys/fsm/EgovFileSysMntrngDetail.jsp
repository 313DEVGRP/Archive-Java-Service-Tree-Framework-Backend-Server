<% 
/**
 * @Class Name : EgovFileSysMntrngDetail.jsp
 * @Description : 파일시스템모니터대상 상세보기
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
	
	}

	function fn_egov_update_filesysmntrng() {
		document.fileSysMntrngVO.action = "<c:url value='/utl/sys/fsm/modifyFileSysMntrng.do'/>";
		document.fileSysMntrngVO.submit();	
	}

	function fn_egov_delete_filesysmntrng(){
		if(confirm("삭제 하시겠습니까?")){
			document.fileSysMntrngVO.action = "<c:url value='/utl/sys/fsm/deleteFileSysMntrng.do'/>";
			document.fileSysMntrngVO.submit();
		}
	}
	
	/* ********************************************************
	 * 목록 으로 가기
	 ******************************************************** */
	function fn_egov_list_filesysmntrng(){
		document.fileSysMntrngVO.action = "<c:url value='/utl/sys/fsm/selectFileSysMntrngList.do'/>";
		document.fileSysMntrngVO.submit();	
	}	

</script>
<title>파일시스템모니터대상 상세보기</title>
</head>
<body onLoad="fn_egov_init_FileSysMntrng()">

<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<div id="border" style="width:730px">

<form:form commandName="fileSysMntrngVO" name="fileSysMntrngVO" method="post" action="${pageContext.request.contextPath}/utl/sys/fsm/modifyFileSysMntrng.do">

	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="100%"class="title_left">
	   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">
	   &nbsp;파일시스템모니터대상 상세보기</h1></td>
	 </tr>
	</table>
	
	<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="이 표는 파일시스템모니터링 대상 정보를 제공하며, 파일시스템명, 파일시스템관리명, 파일시스템 크기, 파일시스템 임계치, 파일시스템사용량, 관리자명, 관리자이메일주소, 모니터링상태, 마지막생성일시 정보로 구성되어 있습니다 .">
	<caption>파일시스템모니터대상 상세보기</caption>
	<tbody>
	  <tr> 
		<th scope="row" width="20%" height="23" class="required_text" nowrap >파일시스템명<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
		<td width="80%" >
			<c:out value='${fileSysMntrngVO.fileSysNm}'/>
		</td>
	  </tr>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >파일시스템관리명<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <c:out value='${fileSysMntrngVO.fileSysManageNm}'/>
	    </td>
	  </tr>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >파일시스템 크기<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <c:out value='${fileSysMntrngVO.fileSysMg}'/>G
	    </td>
	  </tr>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >파일시스템 임계치<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <c:out value='${fileSysMntrngVO.fileSysThrhldRt}'/>% (<c:out value='${fileSysMntrngVO.fileSysThrhld}'/>G)
	    </td>
	  </tr>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >파일시스템 사용량<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <c:out value='${fileSysMntrngVO.fileSysUsgRt}'/>% (<c:out value='${fileSysMntrngVO.fileSysUsgQty}'/>G)
	    </td>
	  </tr>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >관리자명<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <c:out value='${fileSysMntrngVO.mngrNm}'/>
	    </td>
	  </tr>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >관리자이메일주소<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <c:out value='${fileSysMntrngVO.mngrEmailAddr}'/>
	    </td>
	  </tr>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >모니터링상태<img src="${ImgUrl}icon/no_required.gif" width="15" height="15" alt="선택항목"></th>
	    <td width="80%" >
	      <c:out value="${fileSysMntrngVO.mntrngSttus}" />
	    </td>
	  </tr>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >마지막 생성일시<img src="${ImgUrl}icon/no_required.gif" width="15" height="15" alt="선택항목"></th>
	    <td width="80%" >
	      <c:out value="${fileSysMntrngVO.creatDt}" />
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
	  <td><span class="button"><input type="submit" value="<spring:message code="button.update" />" onclick="fn_egov_update_filesysmntrng(); return false;"></span></td>
      <td>&nbsp;&nbsp;</td>
      <td><span class="button"><a href="<c:url value='/utl/sys/fsm/deleteFileSysMntrng.do'/>?fileSysId=<c:out value='${fileSysMntrngVO.fileSysId}'/>" onclick="fn_egov_delete_filesysmntrng(); return false;"><spring:message code="button.delete" /></a></span></td>
      <td>&nbsp;&nbsp;</td>
      <td><span class="button"><a href="<c:url value='/utl/sys/fsm/selectFileSysMntrngList.do'/>?searchWrd=<c:out value='${fileSysMntrngVO.searchWrd}'/>&amp;searchCnd=<c:out value='${fileSysMntrngVO.searchCnd}'/>&amp;pageIndex=<c:out value='${fileSysMntrngVO.pageIndex}'/>" onclick="fn_egov_list_filesysmntrng(); return false;"><spring:message code="button.list" /></a></span></td>
	</tr>
	</table>
	</div>
	<input type="hidden" name="fileSysId" value="<c:out value='${fileSysMntrngVO.fileSysId}'/>" />
	<!-- 검색조건 유지 -->
    <input type="hidden" name="searchWrd" value="<c:out value='${fileSysMntrngVO.searchWrd}'/>" />
    <input type="hidden" name="searchCnd" value="<c:out value='${fileSysMntrngVO.searchCnd}'/>" />
    <input type="hidden" name="pageIndex" value="<c:out value='${fileSysMntrngVO.pageIndex}'/>" />
    <!-- 검색조건 유지 -->
</form:form>

</div>

</body>
</html>