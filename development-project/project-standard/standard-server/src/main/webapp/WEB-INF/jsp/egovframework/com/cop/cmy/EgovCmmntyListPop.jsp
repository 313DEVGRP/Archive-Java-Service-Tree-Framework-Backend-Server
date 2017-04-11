<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : EgovCmmntyList.jsp
  * @Description : 커뮤니티 목록 조회화면
  * @Modification Information
  * @
  * @  수정일      수정자            수정내용
  * @ -------        --------    ---------------------------
  * @ 2009.04.02   이삼섭          최초 생성
  *
  *  @author 공통서비스 개발팀 이삼섭
  *  @since 2009.04.02
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
			fn_egov_select_cmmntyInfs('1');
		}
	}

	function fn_egov_select_cmmntyInfs(pageIndex){
		document.frm.pageIndex.value = pageIndex;
		document.frm.action = "<c:url value='/cop/cmy/selectCmmntyInfsByPop.do'/>";
		document.frm.submit();
	}

	function fn_egov_returnCmmntyInfo(cmmntyId, cmmntyNm){
		var retVal = cmmntyId +"|"+cmmntyNm;
		parent.fn_egov_returnValue(retVal);
	}

	function fn_egov_close(){
		parent.closeWindow();
	}
</script>
<title>커뮤니티 목록</title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>

</head>
<body>
<form name="frm" method="post" action="<c:url value='/cop/cmy/selectCmmntyInfsByPop.do'/>">
<input type="hidden" name="cmmntyId" />

	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="40%"class="title_left">
	  	<h1>
	  		<img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="제목버튼이미지">&nbsp;커뮤니티 목록
	  	</h1>
	  </td>
	  <th >
	  </th>
	  <td width="10%" >
	   		<select name="searchCnd" class="select" title="검색조건선택">
			   <!-- option selected value=''--><!--선택하세요--><!-- /option-->
			   <option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >커뮤니티명</option>
		   </select>
		</td>
	  <td width="35%">
	    <input name="searchWrd" type="text" size="35" value='<c:out value="${searchVO.searchWrd}"/>'  maxlength="35" title="검색어 입력" >
	  </td>
	  <th width="10%">
		<span class="button"><input type="submit" value="조회" onclick="fn_egov_select_cmmntyInfs('1'); return false;"></span>
	  </th>
	 </tr>
	</table>
	<table width="100%" cellpadding="8" class="table-line" summary="번호, 커뮤니티명, 생성자, 생성일, 사용여부, 선택   목록입니다"  >
	 <thead>
	  <tr>
	    <!--th class="title" width="3%" nowrap><input type="checkbox" name="all_check" class="check2"></th-->
	    <th scope="col" class="title" width="10%" nowrap>번호</th>
	    <th scope="col" class="title" width="40%" nowrap>커뮤니티명</th>
	    <th scope="col" class="title" width="20%" nowrap>생성자</th>
	    <th scope="col" class="title" width="15%" nowrap>생성일</th>
	    <th scope="col" class="title" width="8%" nowrap>사용여부</th>
	    <th scope="col" class="title" width="7%" nowrap>선택</th>
	  </tr>
	 </thead>
	 <tbody>
		 <c:forEach var="result" items="${resultList}" varStatus="status">
		  <tr>
		    <!--td class="lt_text3" nowrap><input type="checkbox" name="check1" class="check2"></td-->
		    <td class="lt_text3" nowrap><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
		    <td class="lt_text3" nowrap>
		    	<c:out value="${result.cmmntyNm}"/>
		    </td>
		    <td class="lt_text3" nowrap><c:out value="${result.frstRegisterNm}"/></td>
		    <td class="lt_text3" nowrap><c:out value="${result.frstRegisterPnttm}"/></td>
		    <td class="lt_text3" nowrap>
		    <c:choose>
		    	<c:when test="${result.useAt == 'Y'}">
		    		<spring:message code="button.use" />
		    	</c:when>
		    	<c:otherwise>
		    		<spring:message code="button.notUsed" />
		    	</c:otherwise>
		    </c:choose>
		    </td>
		    <td class="lt_text3" nowrap>
		    	<c:if test="${result.useAt == 'Y'}">
		    		<input type="button" value="선택"
		    			onClick="javascript:fn_egov_returnCmmntyInfo('<c:out value="${result.cmmntyId}"/>','<c:out value="${result.cmmntyNm}"/>');" />
		    	</c:if>
		    </td>
		  </tr>
		 </c:forEach>
		 <c:if test="${fn:length(resultList) == 0}">
		  <tr>
		    <td class="lt_text3" nowrap colspan="6" ><spring:message code="common.nodata.msg" /></td>
		  </tr>
		 </c:if>

	 </tbody>
	 <!--tfoot>
	  <tr class="">
	   <td colspan=6 align="center"></td>
	  </tr>
	 </tfoot -->
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="10"></td>
	  </tr>
	</table>
	<div align="center">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_cmmntyInfs" />
	</div>
	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="10"></td>
	  </tr>
	</table>
	<div align="center">
	<span class="button"><input type="button" value="닫기" onclick="fn_egov_close();" alt="닫기"></span>
	</div>
</form>
</body>
</html>
