<% 
/**
 * @Class Name : EgovMemoTodoDetail.jsp
 * @Description : 메모할일 상세보기
 * @Modification Information
 * @
 * @  수정일      수정자            수정내용
 * @ -------        --------    ---------------------------
 * @ 2010.08.06   장철호          최초 생성
 *
 *  @author 공통컴포넌트개발팀 장철호
 *  @since 2010.08.06
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
<%pageContext.setAttribute("crlf", "\r\n"); %>
<c:set var="ImgUrl" value="/images/egovframework/com/cmm/"/>
<c:set var="CssUrl" value="/css/egovframework/com/cop/smt/mtm/"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="memoTodoVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript">
	function fn_egov_init_MemoTodo(){
	
	}

	function fn_egov_update_memotodo() {
		document.memoTodoVO.action = "<c:url value='/cop/smt/mtm/modifyMemoTodo.do'/>";
		document.memoTodoVO.submit();					
	}

	function fn_egov_delete_memotodo(){
		if(confirm("삭제 하시겠습니까?")){
			document.memoTodoVO.action = "<c:url value='/cop/smt/mtm/deleteMemoTodo.do'/>";
			document.memoTodoVO.submit();
		}
	}
	
	/* ********************************************************
	 * 목록 으로 가기
	 ******************************************************** */
	function fn_egov_list_memotodo(){
		document.memoTodoVO.action = "<c:url value='/cop/smt/mtm/selectMemoTodoList.do'/>";
		document.memoTodoVO.submit();	
	}	

</script>
<title>메모할일 상세보기</title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>


</head>
<body onLoad="fn_egov_init_MemoTodo()">

<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<div id="border" style="width:730px">

<form:form commandName="memoTodoVO" name="memoTodoVO" method="post" action="${pageContext.request.contextPath}/cop/smt/mtm/modifyMemoTodo.do' />">

	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="100%"class="title_left">
	   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">
	   &nbsp;메모할일 상세보기</h1></td>
	 </tr>
	</table>
	
	<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register"  summary="이 표는 메모할일 정보를 제공하며, 할일일시, 작성자, 할일제목, 할일내용 정보로 구성되어 있습니다 .">
	<caption>메모할일 상세보기</caption>
	<tbody>
	  <tr> 
		<th scope="row" width="20%" height="23" class="required_text" nowrap >할일일시<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
		<td width="80%" >
			<c:out value="${memoTodo.todoDe}" escapeXml="false" />
			<c:out value="${memoTodo.todoBeginHour}" escapeXml="false" />:<c:out value="${memoTodo.todoBeginMin}" escapeXml="false" />
			~ 
			<c:out value="${memoTodo.todoEndHour}" escapeXml="false" />:<c:out value="${memoTodo.todoEndMin}" escapeXml="false" />
		</td>
	  </tr>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >작성자<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <c:out value="${memoTodo.wrterNm}" escapeXml="false" />
	      <input type="hidden" name="wrterId" id="wrterId" value="${memoTodo.wrterId}"/>
	      <input type="hidden" name="wrterNm" id="wrterNm" value="${memoTodo.wrterNm}"/>
	    </td>
	  </tr>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >할일제목<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <c:out value="${memoTodo.todoNm}" escapeXml="false" />
	    </td>
	  </tr>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >할일내용<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	       <br/>
	       <c:out value="${fn:replace(memoTodo.todoCn , crlf , '<br>')}" escapeXml="false" />
	       <br/><br/>
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
	  <td><span class="button"><input type="submit" value="<spring:message code="button.update" />" onclick="fn_egov_update_memotodo(); return false;"></span></td>
      <td>&nbsp;&nbsp;</td>
      <td><span class="button"><a href="<c:url value='/cop/smt/mtm/deleteMemoTodo.do'/>?todoId=<c:out value='${memoTodoVO.todoId}'/>" onclick="fn_egov_delete_memotodo(); return false;"><spring:message code="button.delete" /></a></span></td>
      <td>&nbsp;&nbsp;</td>
      <% 
      	if(request.getHeader("REFERER").indexOf("Today") < 0){
      %>
      <td><span class="button"><a href="<c:url value='/cop/smt/mtm/selectMemoTodoList.do'/>?searchWrd=<c:out value='${memoTodoVO.searchWrd}'/>&amp;searchCnd=<c:out value='${memoTodoVO.searchCnd}'/>&amp;pageIndex=<c:out value='${memoTodoVO.pageIndex}'/>&amp;searchDe=<c:out value='${memoTodoVO.searchDe}'/>&amp;searchBgnDe=<c:out value='${memoTodoVO.searchBgnDe}'/>&amp;searchEndDe=<c:out value='${memoTodoVO.searchEndDe}'/>" onclick="fn_egov_list_memotodo(); return false;"><spring:message code="button.list" /></a></span></td>
	  <%
	  	}else{
	  %>
	  <td><span class="button"><a href="<c:url value='/cop/smt/mtm/selectMemoTodoListToday.do'/>"><spring:message code="button.list" /></a></span></td>
	  <%
	  	}
	  %>
    </tr>
	</table>
	</div>
	<form:hidden path="todoId" />
	
	<!-- 검색조건 유지 -->
    <input type="hidden" name="searchWrd" value="<c:out value='${memoTodoVO.searchWrd}'/>" />
    <input type="hidden" name="searchCnd" value="<c:out value='${memoTodoVO.searchCnd}'/>" />
    <input type="hidden" name="pageIndex" value="<c:out value='${memoTodoVO.pageIndex}'/>" />
    <input type="hidden" name="searchDe" value="<c:out value='${memoTodoVO.searchDe}'/>" />
    <input type="hidden" name="searchBgnDe" value="<c:out value='${memoTodoVO.searchBgnDe}'/>" />
    <input type="hidden" name="searchEndDe" value="<c:out value='${memoTodoVO.searchEndDe}'/>" />
    <!-- 검색조건 유지 -->
</form:form>

</div>

</body>
</html>
