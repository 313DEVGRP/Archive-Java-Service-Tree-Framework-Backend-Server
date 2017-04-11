<%
 /**
  * @Class Name  : EgovComDamMapTeamDetail.jsp
  * @Description : EgovComDamMapTeamDetail 화면
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

<c:set var="ImgUrl" value="<c:url value='/images/egovframework/com/cmm/'/>"/>
<c:set var="CssUrl" value="<c:url value='/css/egovframework/com/'/>"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
	<head>
		<title>지식맵(조직별) 상세조회</title>
		
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<link type="text/css" rel="stylesheet" href="${CssUrl}com.css">
		<link type="text/css" rel="stylesheet" href="${CssUrl}button.css">				
		
		<script type="text/javaScript" language="javascript">
		<!--
		/* ********************************************************
		 * 초기화
		 ******************************************************** */
		function fnInit(){
		}
		/* ********************************************************
		 * 목록 으로 가기
		 ******************************************************** */
		function fnList(){
			location.href = "/dam/map/tea/EgovComDamMapTeamList.do";
		}
		/* ********************************************************
		 * 수정화면으로  바로가기
		 ******************************************************** */
		function fnModify(){
			var varForm				 = document.all["Form"];
			varForm.action           = "<c:url value='/dam/map/tea/EgovComDamMapTeamModify.do'/>";
			varForm.orgnztId.value   = "${result.orgnztId}";
			varForm.submit();
		}
		/* ********************************************************
		 * 삭제 처리 함수
		 ******************************************************** */
		function fnDelete(){
			if (confirm("<spring:message code="common.delete.msg" />")) {
				var varForm				 = document.all["Form"];
				varForm.action           = "<c:url value='/dam/map/tea/EgovComDamMapTeamRemove.do'/>";
				varForm.orgnztId.value   = "${result.orgnztId}";
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
		
			<form name="Form" action="<c:url value='/dam/map/tea/EgovComDamMapTeamModify.do'/>" method="post">
			<input name="orgnztId" type="hidden">
				<table width="100%" cellpadding="8" class="table-search" border="0">
		 			<tr>
		  				<td width="100%" class="title_left">
		   				<h1><img src="${ImgUrl}icon/tit_icon.gif" width="16" height="16" hspace="3" align="middle" alt="">&nbsp;지식맵(조직별) 상세조회</h1></td>
		 			</tr>
				</table>
				<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" 
				summary="이 표는 지식맵(조직별) 정보를 제공하며, 조직ID, 조직명, 지식URL, 분류일자 정보로 구성되어 있습니다 .">
				<caption>지식맵(조직별) 상세조회</caption>
		  			<tr> 
		    			<th scope="row" width="20%" height="23" class="required_text">조직ID<img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목"  width="15" height="15"></th>
		    			<td>${result.orgnztId}</td>
		  			</tr>
		  			<tr>
		    			<th scope="row" width="20%" height="23" class="required_text">조직명<img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목"  width="15" height="15"></th>          
		    			<td>${result.orgnztNm}</td>    
		  			</tr>
					<tr>
						<th scope="row" width="20%" height="23" class="required_text">지식URL<img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목"  width="15" height="15"></th>          
					    <td>${result.knoUrl}</td>    
					</tr>   
					<tr>
						<th scope="row" width="20%" height="23" class="required_text">분류일자<img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목"  width="15" height="15"></th>          
					    <td>${result.clYmd}</td>    
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