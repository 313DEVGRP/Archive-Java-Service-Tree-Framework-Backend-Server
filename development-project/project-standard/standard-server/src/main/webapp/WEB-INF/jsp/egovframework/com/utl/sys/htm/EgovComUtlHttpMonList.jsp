<%
 /**
  * @Class Name  : EgovComUtlHttpMonList.jsp
  * @Description : EgovComUtlHttpMonList 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2010.06.30  박종선                  최초 생성
  *
  *  @author 공통서비스팀 
  *  @since 2010.05.01
  *  @version 1.0
  *  @see
  *  
  *  Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.*"  %>
<%@ page import="java.io.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
	<head>
		<title>HTTP모니터링 목록</title>
		
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">		
		
		<script type="text/javascript" src="/js/egovframework/com/cmm/utl/EgovCmmUtl.js"></script>		
		<script type="text/javaScript" language="javascript">
		<!--
		/* ********************************************************
		 * 초기화
		 ******************************************************** */
		function fn_egov_initl_HttpMon(){
			// 첫 입력란에 포커스..
			var form = document.listForm; 
			form.searchCondition.focus();
		}		
		/* ********************************************************
		 * 페이징 처리 함수
		 ******************************************************** */
		function linkPage(pageNo){
			var form = document.listForm;			
			document.listForm.pageIndex.value = pageNo;
			document.listForm.action = "<c:url value='/utl/sys/htm/EgovComUtlHttpMonList.do'/>";
			form.submit();
		}
		/* ********************************************************
		 * 조회 처리 
		 ******************************************************** */
		function fnSearch(){
			var form = document.listForm;					
			form.pageIndex.value = 1;
		   	form.submit();
		}
		/* ********************************************************
		 * 로그조회 함수 
		 ******************************************************** */
		function fnSearchLog(){
			location.href = "<c:url value='/utl/sys/htm/EgovComUtlHttpMonLogList.do'/>";
		}
		-->
		</script>
	</head>

	<body onLoad="fn_egov_initl_HttpMon();">
		<div id="border" style="width:712px">
		
		<!-- 자바스크립트 경고 태그  -->
		<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
				
		<form name="listForm" action="<c:url value='/utl/sys/htm/EgovComUtlHttpMonList.do'/>" method="post">
			<table width="100%" cellpadding="8" class="table-search" border="0">
 				<tr>
  					<td width="30%" class="title_left">
   					<h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif'/>" width="16" height="16" hspace="3" style="vertical-align: middle" alt="">&nbsp;HTTP모니터링 목록</h1></td>
					<td width="20%">
   						<select name="searchCondition" class="select" title="조회조건 선택">
		   					<option value=''>--선택하세요--</option>
		   					<option value='1' <c:if test="${searchVO.searchCondition == '1'}">selected="selected"</c:if>>관리자명</option>
		   					<option value='2' <c:if test="${searchVO.searchCondition == '2'}">selected="selected"</c:if>>상태</option>		   
	   					</select>
					</td>
  					<td width="20%">
    				<input name="searchKeyword" type="text" size="35" value="${searchVO.searchKeyword}"  maxlength="35" title="검색어 입력"> 
  					</td>
  					<th width="30%">
   						<table border="0" cellspacing="0" cellpadding="0">
	    					<tr> 
	      						<td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" alt="조회버튼" title="조회버튼" width="8" height="20"></td>
      							<td class="btnBackground"><input type="submit" value="<spring:message code="button.inquire" />"
      							 onclick="fnSearch(); return false;" class="btnNew" style="height:20px;width:26px;padding:0px 0px 0px 0px;" >
      							</td>	      						
	      						<td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" alt="조회버튼" title="조회버튼" width="8" height="20"></td>
      							<td>&nbsp;</td>
							    <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" alt="등록버튼" title="등록버튼" width="8" height="20"></td>
							    <td class="btnBackground"><a href="<c:url value='/utl/sys/htm/EgovComUtlHttpMonRegist.do'/>"><spring:message code="button.create" /></a></td>
							    <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" alt="등록버튼" title="등록버튼" width="8" height="20"></td>      
      							<td>&nbsp;</td>
	      						<td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" alt="조회버튼" title="조회버튼" width="8" height="20"></td>
      							<td class="btnBackground"><input type="submit" value="로그"
      							 onclick="fnSearchLog(); return false;" class="btnNew" style="height:20px;width:26px;padding:0px 0px 0px 0px;" >
      							</td>	      						
	      						<td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" alt="조회버튼" title="조회버튼" width="8" height="20"></td>						
	    					</tr>						    
   						</table>
  					</th>  
 				</tr>
			</table>

			<table width="100%" cellpadding="2" class="table-line" border="0" 
			summary="이 표는 HTTP서비스모니터링 대상 정보를 제공하며, 웹서비스종료, 시스템URL, 상태, 관리자명, 생성일시 정보로 구성되어 있습니다 .">
			<caption>HTTP모니터링 목록</caption>			
				<thead>
					<tr>
						<th scope="col" class="title" width="10%" nowrap="nowrap">순번</th>					  
						<th scope="col" class="title" width="15%" nowrap="nowrap">웹서비스종류</th>
						<th scope="col" class="title" width="20%" nowrap="nowrap">시스템URL</th>						
						<th scope="col" class="title" width="15%" nowrap="nowrap">상태</th>						
						<th scope="col" class="title" width="20%" nowrap="nowrap">관리자명</th>
						<th scope="col" class="title" width="25%" nowrap="nowrap">생성일시</th>						
					</tr>
				</thead>    

				<tbody>					  										
					<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
						<tr>	
							<td class="lt_text3"><c:out value="${(searchVO.pageIndex - 1) * searchVO.pageSize + status.count}"/></td>
							<td class="lt_text3">${resultInfo.webKind}</td>
							<td class="lt_text3">
							<a href="<c:url value='/utl/sys/htm/EgovComUtlHttpMonDetail.do'/>?pageIndex=${searchVO.pageIndex}&amp;sysId=${resultInfo.sysId}"><c:out value="${resultInfo.siteUrl}"/></a>								
							</td>							
							<td class="lt_text3">${resultInfo.httpSttusCd}</td>
							<td class="lt_text3">${resultInfo.mngrNm}</td>													
							<td class="lt_text3">${resultInfo.creatDt}</td>
						</tr>   
					</c:forEach>
														
					<!-- 데이터가 없을때 화면에 메세지를 출력해준다 -->	
					<c:if test="${fn:length(resultList) == 0}">
						<tr> 
							<td class="lt_text3" colspan="6">
								<spring:message code="common.nodata.msg" />
							</td>
						</tr>   	          				 			   
					</c:if>
				</tbody>  
			</table>

			<table width="100%" cellspacing="0" cellpadding="0" border="0">
				<tr>
					<td height="10"></td>
				</tr>
			</table>

			<div align="center">
				<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="linkPage" />
			</div>
	
			<input type="hidden" name="sysId">
			<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>

		</form>
		</div>
	</body>
</html>