<% 
/**
 * @Class Name : EgovMemoTodoListToday.jsp
 * @Description : 메모할일 목록조회 (오늘의 할일) 
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

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />"></script>
<script type="text/javascript">

	function fn_egov_init_memotodo(){
		
	}
	function fn_egov_inqire_memotodo(todoId) {
		document.frm.todoId.value = todoId;
		document.frm.action = "<c:url value='/cop/smt/mtm/selectMemoTodo.do'/>";
		document.frm.submit();	
	}

	/* ********************************************************
	 * 목록 으로 가기
	 ******************************************************** */
	function fn_egov_list_memotodo(){
		document.frm.action = "<c:url value='/cop/smt/mtm/selectMemoTodoList.do'/>";
		document.frm.submit();	
	}	
</script>
<title>오늘의 할일 목록조회</title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>


</head>
<body onLoad="fn_egov_init_memotodo()">

<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<div id="border" style="width:730px">

	<form name="frm" method="post" action="<c:url value='/cop/smt/mtm/selectMemoTodoList.do'/>">

	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
	<input type="hidden" name="todoId">
	<table width="100%" cellpadding="8" class="table-search" border="0">
	<tbody>
	 <tr>
	  <td width="70%" class="title_left">
	   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;오늘의 할일 목록 [ <c:out value="${resultToday}"/> ]</h1></td>
		<td width="30%" align="right" >
			&nbsp;
		</td>
	 </tr>
	</tbody>
	</table>
	</form>
	<table width="100%" cellpadding="8" class="table-list"  summary="이 표는 메모할일 중 오늘의 할일 정보를 제공하며, 할일일시, 할일제목, 작성자, 작성일자 정보로 구성되어 있습니다 .">
	 <caption>오늘의 할일 목록</caption>
	 <thead>
	  <tr>
	    <th scope="col" class="title" width="10%" nowrap>번호</th>
	    <th scope="col" class="title" width="20%" nowrap>할일일시</th>
	    <th scope="col" class="title" width="40%" nowrap>할일제목</th>
	    <th scope="col" class="title" width="15%" nowrap>작성자</th>
	    <th scope="col" class="title" width="15%" nowrap>작성일자</th>
	  </tr>
	 </thead>    
	 <tbody>
		 <c:forEach var="result" items="${resultList}" varStatus="status">
		  <tr>
		    <!--td class="lt_text3" nowrap><input type="checkbox" name="check1" class="check2"></td-->
		    <td class="lt_text3" nowrap><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>	
		    <td class="lt_text3" nowrap>
		    	<c:out value="${result.todoBeginHour}"/>:<c:out value="${result.todoBeginMin}"/>
		    	~
		    	<c:out value="${result.todoEndHour}"/>:<c:out value="${result.todoEndMin}"/>
		    </td>
		    <td class="lt_text2" nowrap>
		     <form name="memoReprtVO" method="post" action="<c:url value='/cop/smt/mtm/selectMemoTodo.do'/>">
		    	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
		    	<input name="searchCnd" type="hidden" value="<c:out value='${searchVO.searchCnd}'/>">
		    	<input name="searchWrd" type="hidden" value="<c:out value='${searchVO.searchWrd}'/>">
		    	<input name="searchBgnDe" type="hidden" value="<c:out value='${searchVO.searchBgnDe}'/>">
		    	<input name="searchEndDe" type="hidden" value="<c:out value='${searchVO.searchEndDe}'/>">
		    	<input name="searchSttus" type="hidden" value="<c:out value='${searchVO.searchDe}'/>">
				<input type="hidden" name="todoId" value="<c:out value="${result.todoId}"/>">
				<span class="link"><input type="submit" value="<c:out value="${result.todoNm}"/>" onclick="javascript:fn_egov_inqire_memotodo('<c:out value="${result.todoId}"/>'); return false;"></span>
			 </form>
			</td>
			<td class="lt_text3" nowrap><c:out value="${result.wrterNm}"/></td>
		    <td class="lt_text3" nowrap><c:out value="${fn:substring(result.frstRegisterPnttm, 0, 10)}"/></td>
		  </tr>
		 </c:forEach>	  
		 <c:if test="${fn:length(resultList) == 0}">
		  <tr>
		    <td class="lt_text3" nowrap colspan="5"><spring:message code="common.nodata.msg" /></td>  
		  </tr>		 
		 </c:if>
	 </tbody>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr> 
	    <td height="10"></td>
	  </tr>
	</table>
	<table border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td><span class="button"><input type="submit" value="전체목록" onclick="fn_egov_list_memotodo(); return false;"></span></td>
	</tr>
	</table>
</div>
</body>
</html>
