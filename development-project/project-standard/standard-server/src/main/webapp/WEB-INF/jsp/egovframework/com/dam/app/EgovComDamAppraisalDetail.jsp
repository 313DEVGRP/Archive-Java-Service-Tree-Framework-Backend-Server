<%
 /**
  * @Class Name  : EgovComDamAppraisalDetail.jsp
  * @Description : EgovComDamAppraisalDetail 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2010.08.17  박종선                  최초 생성
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

<c:set var="ImgUrl" value="/images/egovframework/com/cmm/"/>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
	<head>
		<title>지식평가 상세조회</title>
		
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">						
		
		<script type="text/javaScript" language="javascript">
		<!--
		/* ********************************************************
		 * 목록 으로 가기
		 ******************************************************** */
		function fnList(){
			location.href = "/dam/app/EgovComDamAppraisalList.do";
		}
		/* ********************************************************
		 * 수정화면으로  바로가기
		 ******************************************************** */
		function fnModify(){
			var varForm			= document.all["Form"];
			varForm.action      = "<c:url value='/dam/app/EgovComDamAppraisalModify.do'/>";
			varForm.knoId.value = "${result.knoId}";
			varForm.submit();
		}
		-->
		</script>
	</head>
	
	<body>
	
	<!-- 자바스크립트 경고 태그  -->
	<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>	
	
		<DIV id="content" style="width:712px">	
	
			<form name="Form" action="<c:url value='/dam/per/EgovComDamPersonalModify.do'/>" method="post">
			<input name="knoId" type="hidden">
				<table width="700" cellpadding="8" class="table-search" border="0">
		 			<tr>
		  				<td width="100%" class="title_left">
		   				<h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="">&nbsp;지식평가 상세조회</h1></td>
		 			</tr>
				</table>
				<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register" 
				summary="이 표는 지식평가관리 대상 정보를 제공하며 조직명, 지식유형명, 지식명, 지식내용, 첨부파일 목록, 평가일자, 평가결과 정보로 구성되어 있습니다 .">
				<caption>지식평가관리 상세정보</caption>
		  			<tr>
		    			<th scope="row" width="20%" height="23" class="required_text" nowrap >조직명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수항목" title="필수항목"  width="15" height="15"></th>          
		    			<td>${result.orgnztNm}</td>    
		  			</tr>		
		  			<tr> 
		    			<th scope="row" width="20%" height="23" class="required_text" nowrap >지식유형명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수항목" title="필수항목"  width="15" height="15"></th>
		    			<td>${result.knoTypeNm}</td>
		  			</tr>
					<tr>
						<th scope="row" width="20%" height="23" class="required_text" nowrap >지식명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수항목" title="필수항목"  width="15" height="15"></th>          
					    <td>${result.knoNm}</td>    
					</tr>
					<tr> 
					    <th scope="row" width="20%" height="23" class="required_text" nowrap >지식내용<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수항목" title="필수항목"  width="15" height="15"></th>
					    <td>
					      <textarea name="knoCn" class="textarea" title="지식내용"  cols="300" rows="10"  style="width:450px;" readonly>${result.knoCn}</textarea>           
					    </td>
					</tr>				
				  	<c:if test="${result.atchFileId != ''}">
					<tr> 
						<th scope="row" width="20%" height="23" class="required_text" nowrap >첨부파일 목록&nbsp;&nbsp;&nbsp;</th>
						    <td colspan="6">
								<c:import url="/cmm/fms/selectFileInfs.do" >
									<c:param name="param_atchFileId" value="${result.atchFileId}" />
								</c:import>								
						    </td>
					</tr>
				  	</c:if>
					<tr>
						<th scope="row" width="20%" height="23" class="required_text" nowrap >평가일자<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수항목" title="필수항목"  width="15" height="15"></th>          
					    <td>
						    <c:if test="${result.appYmd == null}">진행중</c:if>
						    <c:if test="${result.appYmd != null}">${result.appYmd}</c:if>
					    </td>    
					</tr>
		  			<tr>
		    			<th scope="row" width="20%" height="23" class="required_text" nowrap >평가결과<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수항목" title="필수항목"  width="15" height="15"></th>          
		    			<td>
							<c:if test="${result.knoAps == null}">평가중</c:if>	    			
						    <c:if test="${result.knoAps == '1'}">승인</c:if>
						    <c:if test="${result.knoAps == '2'}">반려</c:if>		
		    			</td>    
		  			</tr>							  	
				</table>
				<table width="700" border="0" cellspacing="0" cellpadding="0">
		  			<tr> 
		    			<td height="10"></td>
		  			</tr>
				</table>
				<table border="0" cellspacing="0" cellpadding="0" align="center">
					<tr>
						<!-- <td><span class="button"><input type="submit" value="<spring:message code="button.update" />" onclick="fnModify(); return false;"></span></td> -->
						<td><span class="button"><input type="submit" value="평가" onclick="fnModify(); return false;"></span></td>								
		  				<td width="10"></td>
					  	<td><span class="button"><input type="submit" value="<spring:message code="button.list" />" onclick="fnList(); return false;"></span></td>	  				         
					</tr>
				</table>
			</form>
		</DIV>			
	</body>
</html>