<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : EgovAdressBookPopup.jsp
  * @Description : 주소록 구성원등록을 위한 사용자및 명함 목록화면
  * @Modification Information
  * @
  * @  수정일      수정자            수정내용
  * @ -------   --------    ---------------------------
  * @ 2009.09.25   윤성록          최초 생성
  *
  *  @author 공통컴포넌트팀  윤성록
  *  @since 2009.09.25
  *  @version 1.0
  *  @see
  *
  */
%>

<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function press(event) {
		if (event.keyCode==13) {
			fn_egov_select_userInfo('1');
		}
	}
	function fn_egov_returnUserInfo(uniqId){

		var retVal = uniqId;
		 parent.fn_egov_returnValue(retVal);

	}

	function fn_egov_select_userInfo(pageIndex){
		document.frm.pageIndex.value = pageIndex;
		document.frm.action = "<c:url value='/cop/adb/selectManList.do'/>";
		document.frm.submit();
	}

	function fn_egov_close(){
		parent.closeWindow();
	}
</script>
<title> <c:if test="${searchVO.searchCnd  == '0'}">사용자 목록</c:if>
		<c:if test="${searchVO.searchCnd  == '1'}">명함목록</c:if> </title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>

</head>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<form name="frm"  method="post" action = "<c:url value='/cop/adb/selectManList.do'/>">
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
<input type="hidden" name="PopFlag" value="Y" >

	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="35%"class="title_left">
		<h1>
		   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">
		   &nbsp;<c:if test="${searchVO.searchCnd == '0'}">사용자 목록</c:if>
			     <c:if test="${searchVO.searchCnd == '1'}">명함목록</c:if>
		</h1>
	   </td>
	  <th style="width: 28px">
	  </th>
	   <td width="15%" style="width: 84px">

		<select name="searchCnd" class="select" title="검색조건선택">
			   <option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if>>사용자명</option>
			   <option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if>>명함명</option>
		   </select></td>
		<td>
	    <input name="searchWrd" type="text" size="35" value='<c:out value="${searchVO.searchWrd}"/>' maxlength="35" onkeypress="press(event);" title="검색단어입력">
	  </td>
	  <th width="10%">
	   <table border="0" cellspacing="0" cellpadding="0">
	    <tr>
	    <td><span class="button"><input type="submit" value="조회" onclick="fn_egov_select_userInfo('1'); return false;"></span></td>

	    </tr>
	   </table>
	  </th>
	 </tr>
	</table>
</form>

	<table width="100%" cellpadding="9" class="table-list" summary="주소록 구성원에 대한 조회및 목록을 제공한다.">
	 <thead>
	  <tr>
	    <th class="title" width="5%" nowrap>번호</th>
	    <c:if test="${searchVO.searchCnd == '0'}">
	  	  <th class="title" width="10%" nowrap>사용자아이디</th>
	  	  <th class="title" width="10%" nowrap>사용자명</th>

	    </c:if>
	     <c:if test="${searchVO.searchCnd == '1'}">
	  	  <th class="title" width="10%" nowrap>명함아이디</th>
	  	  <th class="title" width="10%" nowrap>명함명</th>
	    </c:if>
	  	  <th class="title" width="20%" nowrap>이메일</th>
	  	  <th class="title" width="12%" nowrap>집전화번호</th>
	  	  <th class="title" width="12%" nowrap>휴대폰번호</th>
	      <th class="title" width="12%" nowrap>회사번호</th>
	      <th class="title" width="12%" nowrap>팩스번호</th>
	      <th class="title" width="7%" nowrap>선택</th>
	  </tr>
	 </thead>
	 <tbody>
		 <c:forEach var="result" items="${resultList}" varStatus="status">
		  <tr>
		    <td class="lt_text3" nowrap><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
		    <c:if test="${searchVO.searchCnd == '0'}">
		    	<td class="lt_text3" ><c:out value="${result.emplyrId}" /></td>

		    </c:if>
		    <c:if test="${searchVO.searchCnd == '1'}">
		    	<td class="lt_text3" nowrap><c:out value="${result.ncrdId}" /></td>

		    </c:if>
		    	<td class="lt_text3" nowrap><c:out value="${result.nm}"/></td>
		    	<td class="lt_text3" nowrap><c:out value="${result.emailAdres}"/></td>
		    	<td class="lt_text3" nowrap><c:out value="${result.homeTelno}"/></td>
		    	<td class="lt_text3" nowrap><c:out value="${result.moblphonNo}"/></td>
		    	<td class="lt_text3" nowrap><c:out value="${result.offmTelno}"/></td>
		    	<td class="lt_text3" nowrap><c:out value="${result.fxnum}"/></td>
		    <c:if test="${searchVO.searchCnd == '0'}">
				<td >
					<span class="button"><input type="submit" name="selectUser" value="선택"
		    				onClick="javascript:fn_egov_returnUserInfo('<c:out value="${result.emplyrId}" />');" ></span>
				</td>
			</c:if>
			<c:if test="${searchVO.searchCnd == '1'}">
				<td >
					<span class="button"><input type="submit" name="selectUser" value="선택"
		    				onClick="javascript:fn_egov_returnUserInfo('<c:out value="${result.ncrdId}" />');"  ></span>
				</td>
			</c:if>
		  </tr>
		 </c:forEach>
		 <c:if test="${fn:length(resultList) == 0}">
		  <tr>
			   <td class="lt_text3" colspan="9" ><spring:message code="common.nodata.msg" /></td>
		  </tr>
		 </c:if>
	 </tbody>
	</table>

	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="10"></td>
	  </tr>
	</table>
	<div align="center">
		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_select_userInfo" />
	</div>


<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="10"></td>
	  </tr>
	</table>
	<div align="center">
	<table border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
	<td>
      <span class="button"><input type="submit" name="selectUser" value="닫기"
		    				onClick="fn_egov_close();"  ></span>
      </td>
	</tr>
	</table>
	</div>

</body>
</html>
