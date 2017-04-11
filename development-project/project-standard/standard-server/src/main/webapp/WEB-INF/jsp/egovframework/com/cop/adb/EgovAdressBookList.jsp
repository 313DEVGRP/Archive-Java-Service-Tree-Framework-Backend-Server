<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : EgovAdressBookList.jsp
  * @Description :등록한 주소록목록 조회
  * @Modification Information
  * @
  * @  수정일      수정자            수정내용
  * @ -------        --------    ---------------------------
  * @ 2009.09.25   윤성록          최초 생성
  *
  *  @author 공통컴포넌트개발팀  윤성록
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
			fn_egov_select_adbkInfs('1');
		}
	}

	function fn_egov_select_adbkInfs(pageNo){
		document.frm.pageIndex.value = pageNo;
		document.frm.action = "<c:url value='/cop/adb/selectAdbkList.do'/>";
		document.frm.submit();
	}

	function fn_egov_addadbkInf(){
		document.frm.action = "<c:url value='/cop/adb/addAdbkInf.do'/>";
		document.frm.submit();
	}

	function fn_egov_deleteAdbk(adbkId){

		if(confirm("삭제 하시겠습니까?")){
			document.deleteItem.adbkId.value = adbkId;
			document.deleteItem.action = "<c:url value='/cop/adb/deleteAdbkInf.do'/>";
			document.deleteItem.submit();
		}

		return true;
	}

	function fn_egov_update_adbkInf(adbkId){
		document.item.adbkId.value = adbkId;
		document.item.action = "<c:url value='/cop/adb/updateAdbkInf.do'/>";
		document.item.submit();
		return true;
	}


</script>
<title>나의 주소록목록</title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>


</head>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>


<div id="border" style="width:730px">
<form name="frm" action = "<c:url value='/cop/adb/selectAdbkList.do'/>" method="post">

<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
<input type="hidden" name="adbkId" value = "'<c:out value="${searchVO.adbkId}" />'" >

	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="30%"class="title_left">
	   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">
	   &nbsp;나의 주소록목록</td>
	  <th >
	  </th>
	  <td width="10%" >
	   	<select name="searchCnd" class="select" title="검색조건선택">
	   	       <option <c:if test="${searchVO.searchCnd == ''}">selected="selected"</c:if> >--선택하세요--</option>
			   <option  value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >주소록명</option>
			   <option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >공개범위</option>
			   <option value="2" <c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if> >등록자</option>
		   </select>
		</td>
	  <td width="35%">
	    <input name="searchWrd" type="text" size="35" value="<c:out value="${searchVO.searchWrd}"/>" maxlength="35" onkeypress="press(event);" title="검색단어입력">
	  </td>
	  <th width="10%">
	   <table border="0" cellspacing="0" cellpadding="0">
	    <tr>
		  <td><span class="button"><input type="submit" value="조회" onclick="fn_egov_select_adbkInfs('1'); return false;"></span></td>
	       <td>&nbsp;&nbsp;</td>
	      <td><span class="button"><a href="<c:url value='/cop/adb/addAdbkInf.do'/>?pageIndex=<c:out value='${searchVO.pageIndex}'/>" onclick="fn_egov_addadbkInf(); return false;">등록</a></span></td>
	    </tr>
	   </table>
	  </th>
	 </tr>
	</table>
	</form>

	<table width="100%" cellpadding="8" class="table-list" summary="주소록에 대한 목록을 제공한다.">
	 <thead>
	  <tr>
	    <th class="title" width="10%" nowrap>순번</th>
	    <th class="title" width="30%" nowrap>주소록명</th>
	    <th class="title" width="15%" nowrap>공개범위</th>
	    <th class="title" width="20%" nowrap>등록자명</th>
	    <th class="title" width="15%" nowrap>등록일자</th>
	    <th class="title" width="10%" nowrap>삭제</th>
	  </tr>
	 </thead>
	 <tbody>
		 <c:forEach var="result" items="${resultList}" varStatus="status">
		  <tr>
		    <td class="lt_text3" nowrap><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
		   	<td class="lt_text3" nowrap>
		   	 <form name="item" method="post" action="<c:url value='/cop/adb/updateAdbkInf.do'/>">
				<input type="hidden" name="adbkId" value="<c:out value="${result.adbkId}"/>">
				<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
				<span class="link"><input type="submit" value="<c:out value="${result.adbkNm}"/>"
				onclick="fn_egov_update_adbkInf('<c:out value="${result.adbkId}"/>'); return false;"></span>
			</form>
		    </td>
		    <td class="lt_text3" nowrap><c:out value="${result.othbcScope}"/></td>
		    <td class="lt_text3" nowrap><c:out value="${result.wrterId}"/></td>
			<td class="lt_text3" nowrap><c:out value="${fn:substring(result.frstRegisterPnttm, 0, 10)}"/></td>
			<td >
			<c:if test="${result.wrterId == userId}">
			   <form name="deleteItem" method="post" action="<c:url value='/cop/adb/deleteAdbkInf.do'/>">
			   	 <input type="hidden" name="adbkId" value="<c:out value="${result.adbkId}"/>"/>
 					<span class="button"><input type="submit" value="삭제" onClick="javascript:fn_egov_deleteAdbk('<c:out value="${result.adbkId}" />'); return false;">
				 		</span>
				</form>
		    </c:if>
			</td>
		  </tr>
		 </c:forEach>
		 <c:if test="${fn:length(resultList) == 0}">
		  <tr>
		    <td class="lt_text3"  colspan="6" ><spring:message code="common.nodata.msg" /></td>
		  </tr>
		 </c:if>
	 </tbody>
	</table>
	<div align="center">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_adbkInfs" />
	</div>


</div>
</body>
</html>
