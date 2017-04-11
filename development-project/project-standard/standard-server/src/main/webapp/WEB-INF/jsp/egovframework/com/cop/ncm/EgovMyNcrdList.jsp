<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : EgovMyNcrdList.jsp
  * @Description : 내가 등록한 명함목록 조회
  * @Modification Information
  * @
  * @  수정일      수정자            수정내용
  * @ -------        --------    ---------------------------
  * @ 2009.03.30   이삼섭          최초 생성
  *
  *  @author 공통서비스 개발팀 이삼섭
  *  @since 2009.03.30
  *  @version 1.0
  *  @see
  *
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function press(event) {
		if (event.keyCode==13) {
			fn_egov_select_ncrdInfs('1');
		}
	}
	function fn_egov_select_ncrdInfs(pageNo){
		document.frm.pageIndex.value = pageNo;
		document.frm.action = "<c:url value='/cop/ncm/selectMyNcrdUseInf.do'/>";
		document.frm.submit();
	}
	function fn_egov_addNcrdInf(){
		document.frm.action = "<c:url value='/cop/ncm/addNcrdInf.do'/>";
		document.frm.submit();
	}
	function fn_egov_update_ncrdInf(ncrdId){
		document.frm.ncrdId.value = ncrdId;
		document.frm.action = "<c:url value='/cop/ncm/selectNcrdInf.do'/>";
		document.frm.submit();
	}
	function fn_egov_popupNcrdInf(ncrdId){
		window.open("<c:url value='/cop/ncm/selectNcrdInfPopup.do' />?ncrdId="+ncrdId,"명함조회","width=640, height=350");
	}
</script>
<title>나의 명함목록</title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>


</head>
<body>
<form name="frm" method="post" action="<c:url value='/cop/ncm/selectMyNcrdUseInf.do'/>">
<input type="hidden" name="ncrdId" />

<div id="border" style="width:730px">
	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="40%"class="title_left">
	   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="제목버튼이미지">
	   &nbsp;나의 명함목록</td>
	  <th >
	  </th>
	  <td width="10%" >
	   	<select name="searchCnd" class="select" title="검색조건선택">
			   <option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >이름</option>
			   <option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >회사명</option>
			   <option value="2" <c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if> >부서명</option>
		   </select>
		</td>
	  <td width="35%">
	    <input name="searchWrd" type="text" size="35" value="<c:out value="${searchVO.searchWrd}"/>" maxlength="35" onkeypress="press(event);" title="검색단어입력">
	  </td>
	  <th width="10%">
	   <table border="0" cellspacing="0" cellpadding="0">
	    <tr>      
	      <td>
	      	<span class="button"><input type="button" onclick="fn_egov_select_ncrdInfs('1')" value="조회"/></span>
	      </td>      
	      <td>&nbsp;&nbsp;</td>
	      <td>
	      	<span class="button"><input type="button" onclick="fn_egov_addNcrdInf()" value="등록"/></span>
	      </td>  
	    </tr>
	   </table>
	  </th>
	 </tr>
	</table>
	<table width="100%" cellpadding="8" class="table-line">
	 <thead>
	  <tr>
	    <!-- th class="title" width="3%" nowrap><input type="checkbox" name="all_check" class="check2"></th-->
	    <th class="title" width="10%" nowrap>번호</th>
	    <th class="title" width="22%" nowrap>이름</th>
	    <th class="title" width="20%" nowrap>회사명</th>
	    <th class="title" width="20%" nowrap>부서명</th>
	    <th class="title" width="15%" nowrap>등록일자</th>
	  </tr>
	 </thead>
	 <tbody>
		 <c:forEach var="result" items="${resultList}" varStatus="status">
		  <tr>
		    <!--td class="lt_text3" nowrap><input type="checkbox" name="check1" class="check2"></td-->
		    <td class="lt_text3" nowrap><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
		    <td class="lt_text3" nowrap>
		    	<c:choose>
		    		<c:when test="${result.frstRegisterId == uniqId}">
						<a href="<c:url value='/cop/ncm/selectNcrdInf.do?ncrdId='/><c:out value='${result.ncrdId}'/>">
						<c:out value="${result.ncrdNm}"/></a>
		    		</c:when>
		    		<c:otherwise>
						<a href="<c:url value='/cop/ncm/selectNcrdInfPopup.do?ncrdId='/><c:out value='${result.ncrdId}'/>" target="_blank">
		    			<c:out value="${result.ncrdNm}"/></a>
		    		</c:otherwise>
		    	</c:choose>
		    </td>
		    <td class="lt_text3" nowrap><c:out value="${result.cmpnyNm}"/></td>
		    <td class="lt_text3" nowrap><c:out value="${result.deptNm}"/></td>
			<td class="lt_text3" nowrap><c:out value="${result.creatDt}"/></td	>
		  </tr>
		 </c:forEach>
		 <c:if test="${fn:length(resultList) == 0}">
		  <tr>
		    <td class="lt_text3" nowrap colspan="5" ><spring:message code="common.nodata.msg" /></td>
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
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_ncrdInfs" />
	</div>
	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
</div>
</form>
</body>
</html>
