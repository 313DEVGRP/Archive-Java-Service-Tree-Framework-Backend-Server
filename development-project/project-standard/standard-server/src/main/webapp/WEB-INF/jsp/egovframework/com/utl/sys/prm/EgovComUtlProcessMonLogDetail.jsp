<%
 /**
  * @Class Name  : EgovComUtlProcessMonLogDetail.jsp
  * @Description : EgovComUtlProcessMonLogDetail 화면
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
	<head>
		<title>프로세스모니터링로그 상세조회</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
		
		<script type="text/javaScript" language="javascript">
		<!--
		/* ********************************************************
		 * 목록 으로 가기
		 ******************************************************** */
		function fnList(){
			location.href = "<c:url value='/utl/sys/prm/EgovComUtlProcessMonLogList.do'/>";
		}
		-->
		</script>
	</head>
	
	<body>
	
	<!-- 자바스크립트 경고 태그  -->
	<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
	
		<DIV id="content" style="width:712px">						
			<form name="Form" action="" method="post">
				<input name="processNm" type="hidden">
					<table width="700" cellpadding="8" class="table-search" border="0">
			 			<tr>
			  				<td width="100%" class="title_left">
			   				<h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif'/>" width="16" height="16" hspace="3" align="absmiddle" alt="">&nbsp;프로세스모니터링로그 상세조회</h1></td>
			 			</tr>
					</table>
					<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register" 
					summary="이 표는 프로세스모니터링 로그 대상 정보를 제공하며, 로그ID, 프로세스ID, 프로세스명, 상태, 로그, 마지막 생성일시로 구성되어 있습니다 .">
					<caption>프로세스모니터링로그 상세조회</caption>
					  	<tr> 
					    	<th scope="row" width="20%" height="23" class="required_text">로그ID<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수입력표시"  width="15" height="15"></th>
					    	<td>${result.logId}</td>
					  	</tr>
					  	<tr> 
					    	<th scope="row" width="20%" height="23" class="required_text">프로세스ID<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수입력표시"  width="15" height="15"></th>
					    	<td>${result.processId}</td>
					  	</tr>								  						
					  	<tr> 
					    	<th scope="row" width="20%" height="23" class="required_text">프로세스명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수입력표시"  width="15" height="15"></th>
					    	<td>${result.processNm}</td>
					  	</tr>
					  	<tr>
					    	<th scope="row" width="20%" height="23" class="required_text">상태<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수입력표시"  width="15" height="15"></th>          
					    	<td>${result.procsSttus}</td>    
					  	</tr>
						<c:if test="${result.procsSttus == '오류'}">
					  	<tr>
					    	<th scope="row" width="20%" height="23" class="required_text">로그<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수입력표시"  width="15" height="15"></th>          
					    	<td>${result.logInfo}</td>    
					  	</tr>
		  				</c:if>					  	 					  	 					  	
					  	<tr>
					    	<th scope="row" width="20%" height="23" class="required_text">마지막 생성일시<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수입력표시"  width="15" height="15"></th>          
					    	<td>${result.creatDt}</td>    
					  	</tr>  
					</table>
					<table width="700" border="0" cellspacing="0" cellpadding="0">
					  	<tr> 
					    	<td height="10"></td>
					  	</tr>
					</table>
					<table border="0" cellspacing="0" cellpadding="0" align="center">
						<tr> 
					  	<td><span class="button"><input type="submit" value="<spring:message code="button.list" />" onclick="fnList(); return false;"></span></td>	         
						</tr>																			
					</table>
			</form>
		</DIV>
	</body>					
</html>