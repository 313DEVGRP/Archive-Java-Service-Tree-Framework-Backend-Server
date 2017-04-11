<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : EgovBkmkMenuPopup.jsp
  * @Description : 바로가기메뉴 등록을 위한 메뉴목록
  * @Modification Information
  * @
  * @  수정일      수정자            수정내용
  * @ -------        --------    ---------------------------
  * @ 2009.09.25   윤성록          최초 생성
  *
  *  @author 공통컴포넌트팀 윤성록
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
			fn_egov_select_menuInfo('1');
		}
	}
	function fn_egov_return_menuInfo(menuId, menuNm){
		var retVal = menuId +","+ menuNm;
		//alert(retVal);
		parent.fn_egov_returnValue(retVal);
	}

	function fn_egov_select_menuInfo(pageIndex){

		document.frm.pageIndex.value = pageIndex;
		document.frm.action = "<c:url value='/sym/mnu/bmm/selectMenuList.do'/>";
		document.frm.submit();
	}

	function fn_egov_close(){
		parent.closeWindow();
	}
</script>
<title>메뉴목록</title>
</head>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<form name="frm" action ="<c:url value='/sym/mnu/bmm/selectMenuList.do'/>" method="post">

<input type="hidden" name="PopFlag" value="Y" >
<input type="hidden" name="searchCnd" value ="0" >
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">

	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="40%"class="title_left">
	   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">
	   &nbsp;메뉴 목록</td>
	  <th >
	  </th>
	  <td width="10%" >메뉴명 </td>
	  <td width="40%">
	    <input name="searchWrd" type="text" size="35" value='<c:out value="${searchVO.searchWrd}"/>' maxlength="35" onkeypress="press(event);" title="검색단어입력">
	  </td>
	  <th width="10%">
	   <table border="0" cellspacing="0" cellpadding="0">
	    <tr>
	       <td><span class="button"><input type="submit" value="조회" onclick="fn_egov_select_menuInfo('1'); return false;"></span></td>

	    </tr>
	   </table>
	  </th>
	 </tr>
	</table>

	<table width="100%" cellpadding="8" class="table-line" summary="바로가기 메뉴관리에 등록할 메뉴의 조회">
	 <thead>
	  <tr>
	    <!-- th class="title" width="3%" nowrap><input type="checkbox" name="all_check" class="check2"></th-->
	    <th class="title" width="10%" nowrap>번호</th>
	    <th class="title" width="15%" nowrap>메뉴명</th>
	    <th class="title" width="15%" nowrap>메뉴DC</th>
	    <th class="title" width="8%" nowrap>선택</th>
	  </tr>
	 </thead>
	 <tbody>
		 <c:forEach var="result" items="${resultList}" varStatus="status">
		  <tr>
		    <!--td class="lt_text3" nowrap><input type="checkbox" name="check1" class="check2"></td-->
		    <td class="lt_text3" nowrap><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
		    <td class="lt_text3" nowrap><c:out value="${result.menuNm}" /></td>
		    <td class="lt_text3" nowrap><c:out value="${result.menuDc}" /></td>

			<td >
				<span class="button"><input type="submit" name="selectUser" value="선택"
		    				onClick="javascript:fn_egov_return_menuInfo('<c:out value="${result.menuId}" />','${result.menuNm}');" ></span>
				</td>



		  </tr>
		 </c:forEach>
		 <c:if test="${fn:length(resultList) == 0}">
		  <tr>
		    <td class="lt_text3" nowrap colspan="4" ><spring:message code="common.nodata.msg" /></td>
		  </tr>
		 </c:if>
	 </tbody>
	</table>
	</form>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="10"></td>
	  </tr>
	</table>
	<div align="center">
		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_select_menuInfo" />
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
