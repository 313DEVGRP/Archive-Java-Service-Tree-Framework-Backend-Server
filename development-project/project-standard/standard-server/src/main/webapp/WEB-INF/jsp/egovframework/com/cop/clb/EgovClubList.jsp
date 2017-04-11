<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : EgovClubList.jsp
  * @Description : 동호회 목록 조회화면
  * @Modification Information
  * @
  * @  수정일      수정자            수정내용
  * @ -------        --------    ---------------------------
  * @ 2009.04.06   이삼섭          최초 생성
  *
  *  @author 공통서비스 개발팀 이삼섭
  *  @since 2009.04.06
  *  @version 1.0
  *  @see
  *
  */
%>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css" >
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function press(event) {
		if (event.keyCode==13) {
			fn_egov_select_clbInfs('1');
		}
	}

	function fn_egov_insert_addClbInf(){

		document.frm.action = "<c:url value='/cop/clb/addClubInf.do'/>";
		document.frm.submit();
	}

	function fn_egov_select_clbInfs(pageIndex){
		document.frm.pageIndex.value = pageIndex;
		document.frm.action = "<c:url value='/cop/clb/selectClubInfs.do'/>";
		document.frm.submit();
	}

	function fn_egov_inqire_clbInf(clbId){
		document.frm.clbId.value = clbId;
		document.frm.action = "<c:url value='/cop/clb/selectClubInf.do'/>";
		document.frm.submit();
	}
</script>
<title>동호회 목록</title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>


</head>
<body>
<div id="border" style="width:730px">
<form:form commandName="frm" name="frm" method="post" >
<input type="hidden" name="cmmntyId" />
<input type="hidden" name="clbId" />
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="40%"class="title_left">
	  	<h1>
	  		<img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지">&nbsp;동호회 목록
	  	</h1>
	  </td>
	  <th >
	  </th>
	  <td width="10%" >
	   	<select name="searchCnd" class="select" title="검색조건선택">
			   <option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >동호회명</option>
			   <option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >커뮤니티명</option>
		   </select>
		</td>
	  <td width="35%">
	    <input name="searchWrd" type="text" size="35" value='<c:out value="${searchVO.searchWrd}"/>' maxlength="35" title="검색단어입력">
	  </td>
	  <th width="10%">
	   <table border="0" cellspacing="0" cellpadding="0">
	    <tr>
	      <td></td>
	      <td >
	      <span class="button"><input type="submit" value="조회" onclick="javascript:fn_egov_select_clbInfs('1')"></span>
	      </td>
	      <td></td>
	      <td>&nbsp;&nbsp;</td>
	      <td></td>
	      <td >
	      	      <span class="button"><input type="submit" value="등록" onclick="javascript:fn_egov_insert_addClbInf()"></span>
	      </td>
	      <td></td>
	    </tr>
	   </table>
	  </th>
	 </tr>
	</table>
</form:form>
	<table width="100%" cellpadding="8" class="table-line"  summary="번호,동호회명,커뮤니티명,등록일,사용여부   목록입니다" >
	 <thead>
	  <tr>
	    <th scope="col" class="title" width="10%" nowrap>번호</th>
	    <th scope="col" class="title" width="30%" nowrap>동호회명</th>
	    <th scope="col" class="title" width="20%" nowrap>커뮤니티명</th>
	    <th scope="col" class="title" width="20%" nowrap>등록일</th>
	    <th scope="col" class="title" width="17%" nowrap>사용여부</th>
	  </tr>
	 </thead>
	 <tbody>
		<c:forEach var="result" items="${resultList}" varStatus="status">
		  <tr>
		    <td class="lt_text3" nowrap><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
		    <td class="lt_text3" nowrap>

		    	<!-- 2010.11.1
				<form name="subForm" method="post" action="<c:url value='/cop/clb/selectClubInf.do'/>">
					<input name="clbId"     type="hidden" value="${result.clbId}">
					<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
					<span class="link"><input type="submit" style="width:320px;border:solid 0px black;text-align:left;" value="<c:out value="${result.clbNm}"/>" onclick="javascript:fn_egov_inqire_clbInf('<c:out value="${result.clbId}"/>')"></span>
				</form>
				-->

				<input name="clbId"     type="hidden" value="${result.clbId}">
				<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">

				<a href="<c:url value='/cop/clb/selectClubInf.do'/>?clbId=<c:out value='${result.clbId}'/>" onclick="event(this.href); return false;" style="width:320px;border:solid 0px black;text-align:left;">
					<c:out value="${result.clbNm}"/>
				</a>

		    </td>
		    <td class="lt_text3" nowrap><c:out value="${result.cmmntyNm}"/></td>
		    <td class="lt_text3" nowrap><c:out value="${result.frstRegisterPnttm}"/></td>
		    <td class="lt_text3" nowrap>
		    	<c:if test="${result.useAt == 'N'}"><spring:message code="button.notUsed" /></c:if>
		    	<c:if test="${result.useAt == 'Y'}"><spring:message code="button.use" /></c:if>
		    </td>
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
		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_select_clbInfs" />
	</div>

</div>

</body>
</html>
