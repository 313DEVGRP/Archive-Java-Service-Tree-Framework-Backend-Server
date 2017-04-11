<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%--
  Class Name : EgovOnlinePollResultList.jsp
  Description : 온라인POLL결과 목록 페이지
  Modification Information
 
	수정일    		수정자		수정내용
	----------		------		---------------------------
	2008.03.09		장동한		최초 생성
 
    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.09
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html lang="ko">
<head>
<title>EGOV-COM</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javaScript" language="javascript">
	/* ********************************************************
	 * 삭제함수
	 ******************************************************** */
	function fn_egov_del_OnlinePollResult(pollResultId){
		var vFrom = document.listForm;
	
		if(confirm("삭제 하시겠습니까?")){
			vFrom.pollResultId.value = pollResultId;
			vFrom.action = "<c:url value='/uss/olp/opr/delOnlinePollResult.do' />";	
			vFrom.submit();
		}
		
	}
</script>
</head>

<DIV id="content" style="width:712px">
	
	<%-- noscript 테그 --%>
	<noscript class="noScriptTitle">
		자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.
	</noscript>

	<table width="100%" cellspacing="0" cellpadding="0" border="0">
		<tr>
			<td height="3px"></td>
		</tr>
	</table>
	
	<!-- ----------------- 상단 타이틀  영역 -->
	<table width="100%" cellpadding="8" class="table-search" border="0">
		<tr>
			<td width="100%"class="title_left">
				<img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="온라인POLL결과 목록 제목버튼">&nbsp;온라인POLL결과  목록
			</td>
		</tr>
	</table>
	
	<table width="100%" cellspacing="0" cellpadding="0" border="0">
		<tr>
			<td height="3px"></td>
		</tr>
	</table>
	
	<table width="100%" cellpadding="0" class="table-line" border="0">
		<thead>
			<tr>  
				<th class="title" width="35px" nowrap>순번</th>
				<th class="title" nowrap>온라인POLL항목</th>
				<th class="title" width="70px" nowrap>등록자</th>       
				<th class="title" width="70px" nowrap>등록일자</th>  
				<th class="title" width="30px" nowrap></th>               
			</tr>
		</thead> 
	
		<tbody>
			<%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
			<c:if test="${fn:length(resultList) == 0}">
				<tr> 
					<td class="lt_text3" colspan="5">
						<spring:message code="common.nodata.msg" />
					</td>
				</tr>   	          				 			   
			</c:if>
			
			<%-- 데이터를 화면에 출력해준다 --%>
			<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
				<tr>
				    <td class="lt_text3"><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
				    <td class="lt_text3L" align="center"><c:out value="${resultInfo.pollIemNm}"/></td>
				    <td class="lt_text3"><c:out value="${resultInfo.frstRegisterNm}"/></td>
				    <td class="lt_text3"><c:out value="${fn:substring(resultInfo.frstRegisterPnttm, 0, 10)}"/></td>
				    <td class="lt_text3">
					    	<form name="subForm" method="post" action="<c:url value='/uss/olp/opr/delOnlinePollResult.do'/>">
								<input name="pollId" type="hidden" value="<c:out value="${resultInfo.pollId}"/>">
								<input name="pollResultId" type="hidden" value="<c:out value="${resultInfo.pollResultId}"/>">
								<span class="link">
									<input type="submit" value="삭제" onclick="fn_egov_del_OnlinePollResult('<c:out value="${resultInfo.pollResultId}"/>'); return false;" style="width:30px;cursor:pointer;cursor:hand;">
								</span>
					    	</form>
				    </td>
				</tr>  
			</c:forEach>
		</tbody>
	</table>
	
	<br>
	
	<!--  목록버튼  -->
	<form name="listForm" action="<c:url value='/uss/olp/opr/delOnlinePollResult.do'/>" method="post">
		<input name="pollId" type="hidden" value="${resultList[0].pollId}">
		<input name="pollResultId" type="hidden" value="">
	</form>

	<center>
	<table border="0" cellspacing="0" cellpadding="0" align="center">
		<tr> 
			<td>
				<img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt="버튼이미지">
				</td>
			<td class="btnBackground" nowrap>
				<a href="<c:url value='/uss/olp/opm/listOnlinePollManage.do' />"><spring:message code="button.list" /></a> 
			</td>
			<td>
				<img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지">
			</td>      
			<td>&nbsp;</td>    
		</tr>
	</table>
	</center>
</DIV>
</html>
