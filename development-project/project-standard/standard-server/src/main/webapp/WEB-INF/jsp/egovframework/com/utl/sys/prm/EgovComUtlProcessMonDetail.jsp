<%
 /**
  * @Class Name  : EgovComUtlProcessMonDetail.jsp
  * @Description : EgovComUtlProcessMonDetail 화면
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
		<title>HTTP모니터링 상세조회</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
		
		<script type="text/javaScript" language="javascript">
		<!--
		/* ********************************************************
		 * 목록 으로 가기
		 ******************************************************** */
		function fnList(){
			location.href = "<c:url value='/utl/sys/prm/EgovComUtlProcessMonList.do'/>";
		}
		/* ********************************************************
		 * 수정화면으로  바로가기
		 ******************************************************** */
		function fnModify(){
			var varForm				 = document.all["Form"];
			varForm.action           = "<c:url value='/utl/sys/prm/EgovComUtlProcessMonModify.do'/>";
			varForm.processNm.value  = "${result.processNm}";
			varForm.submit();
		}
		/* ********************************************************
		 * 삭제 처리 함수
		 ******************************************************** */
		function fnDelete(){
			if (confirm("<spring:message code="common.delete.msg" />")) {
				var varForm				 = document.all["Form"];
				varForm.action           = "<c:url value='/utl/sys/prm/EgovComUtlProcessMonRemove.do'/>";
				varForm.processNm.value  = "${result.processNm}";
				varForm.submit();
			}
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
			   				<h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif'/>" width="16" height="16" hspace="3" align="absmiddle" alt="">&nbsp;프로세스모니터링 상세조회</h1></td>
			 			</tr>
					</table>
					<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register" 
					summary="이 표는 프로세스모니터링 대상 정보를 제공하며, 프로세스명, 상태, 관리자명, 관리자이메일로 구성되어 있습니다 .">
					<caption>프로세스모니터링 상세조회</caption>
					  	<tr> 
					    	<th scope="row" width="20%" height="23" class="required_text">프로세스명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수입력표시"  width="15" height="15"></th>
					    	<td>${result.processNm}</td>
					  	</tr>
					  	<tr>
					    	<th scope="row" width="20%" height="23" class="required_text">상태<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수입력표시"  width="15" height="15"></th>          
					    	<td>${result.procsSttus}</td>    
					  	</tr> 					  	
					  	<tr>
					    	<th scope="row" width="20%" height="23" class="required_text">관리자명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수입력표시"  width="15" height="15"></th>          
					    	<td>${result.mngrNm}</td>    
					  	</tr> 
					  	<tr>
					    	<th scope="row" width="20%" height="23" class="required_text">관리자이메일<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수입력표시"  width="15" height="15"></th>          
					    	<td>${result.mngrEmailAddr}</td>    
					  	</tr>     
					</table>
					<table width="700" border="0" cellspacing="0" cellpadding="0">
					  	<tr> 
					    	<td height="10"></td>
					  	</tr>
					</table>
					<table border="0" cellspacing="0" cellpadding="0" align="center">
						<tr> 
						<td><span class="button"><input type="submit" value="<spring:message code="button.update" />" onclick="fnModify(); return false;"></span></td>				
		  				<td width="10"></td>	  				
					  	<td><span class="button"><input type="submit" value="<spring:message code="button.delete" />" onclick="fnDelete(); return false;"></span></td>	  				
		  				<td width="10"></td>
					  	<td><span class="button"><input type="submit" value="<spring:message code="button.list" />" onclick="fnList(); return false;"></span></td>	         
						</tr>																			
					</table>
			</form>
		</DIV>
	</body>					
</html>