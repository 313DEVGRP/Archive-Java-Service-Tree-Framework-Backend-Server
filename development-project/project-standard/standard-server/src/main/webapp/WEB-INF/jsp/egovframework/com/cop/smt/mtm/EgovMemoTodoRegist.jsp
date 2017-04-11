<%
/**
 * @Class Name : EgovMemoTodoRegist.jsp
 * @Description : 메모할일 등록
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

	function fn_egov_insert_memotodo() {
		if (!validateMemoTodoVO(document.memoTodoVO)){
			return;
		}

		var todoBeginHourMin = document.memoTodoVO.todoBeginHour.value + document.memoTodoVO.todoBeginMin.value;
		var todoEndHourMin = document.memoTodoVO.todoEndHour.value + document.memoTodoVO.todoEndMin.value;

		if(todoBeginHourMin > todoEndHourMin){
			alert("할일종료시분이 할일시작시분보다 빠를수 없습니다.");
			return;
		}

		if (confirm('<spring:message code="common.regist.msg" />')) {
			document.memoTodoVO.action = "<c:url value='/cop/smt/mtm/insertMemoTodo.do'/>";
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
<title>메모할일 등록</title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>


</head>
<body onLoad="fn_egov_init_MemoTodo()">

<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<div id="border" style="width:730px">

<form:form commandName="memoTodoVO" name="memoTodoVO" method="post" action="${pageContext.request.contextPath}/cop/smt/mtm/insertMemoTodo.do' />">

	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="100%"class="title_left">
	   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">
	   &nbsp;메모할일 등록</h1></td>
	 </tr>
	</table>

	<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register"  summary="이 표는 메모할일 정보를  등록하기 위한 표이며, 할일일시, 작성자, 할일제목, 할일내용 정보로 구성되어 있습니다 .">
	<caption>메모할일 등록</caption>
	<tbody>
	  <tr>
		<th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="todoDe">할일일시</label><img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
		<td width="80%" >
			<form:input path="todoDe" size="10" maxlength="10" title="할일일자"/>
			<input type="hidden" name="cal_url" id="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" >
		    <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(document.forms[0], document.forms[0].todoDe);">
		    <img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" style="border:0px;vertical-align: bottom" alt="달력창팝업버튼이미지">
		    </a>

		    <form:select path="todoBeginHour" title="할일시작 시 선택">
	            <form:options items="${todoBeginHour}" itemValue="code" itemLabel="codeNm"/>
	        </form:select>시
	        <form:select path="todoBeginMin" title="할일시작 분 선택">
	            <form:options items="${todoBeginMin}" itemValue="code" itemLabel="codeNm"/>
	        </form:select>분
			~
	        <form:select path="todoEndHour" title="할일종료 시 선택">
	            <form:options items="${todoEndHour}" itemValue="code" itemLabel="codeNm"/>
	        </form:select>시
	        <form:select path="todoEndMin" title="할일종료 분 선택">
	            <form:options items="${todoEndMin}" itemValue="code" itemLabel="codeNm"/>
	        </form:select>분
			<div><form:errors path="todoDe" cssClass="error"/></div>
		</td>
	  </tr>
	  <tr>
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >작성자<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <c:out value="${memoTodoVO.wrterNm}" escapeXml="false" />
	      <input type="hidden" name="wrterId" id="wrterId" value="${memoTodoVO.wrterId}"/>
	      <input type="hidden" name="wrterNm" id="wrterNm" value="${memoTodoVO.wrterNm}"/>
	    </td>
	  </tr>
	  <tr>
	    <th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="todoNm">할일제목</label><img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <form:input path="todoNm" size="75" maxlength="255" title="할일제목"/>
	      <div><form:errors path="todoNm" cssClass="error"/></div>
	    </td>
	  </tr>
	  <tr>
	    <th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="todoCn">할일내용</label><img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <form:textarea path="todoCn" rows="5" cols="75" title="할일내용"/>
    	  <div><form:errors path="todoCn" cssClass="error"/></div>
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
	  <td><span class="button"><input type="submit" value="<spring:message code="button.save" />" onclick="fn_egov_insert_memotodo(); return false;"></span></td>
      <td>&nbsp;&nbsp;</td>
      <td><span class="button"><a href="<c:url value='/cop/smt/mtm/selectMemoTodoList.do'/>?searchWrd=<c:out value='${memoTodoVO.searchWrd}'/>&amp;searchCnd=<c:out value='${memoTodoVO.searchCnd}'/>&amp;pageIndex=<c:out value='${memoTodoVO.pageIndex}'/>&amp;searchDe=<c:out value='${memoTodoVO.searchDe}'/>&amp;searchBgnDe=<c:out value='${memoTodoVO.searchBgnDe}'/>&amp;searchEndDe=<c:out value='${memoTodoVO.searchEndDe}'/>" onclick="fn_egov_list_memotodo(); return false;"><spring:message code="button.list" /></a></span></td>
	</tr>
	</table>
	</div>
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
