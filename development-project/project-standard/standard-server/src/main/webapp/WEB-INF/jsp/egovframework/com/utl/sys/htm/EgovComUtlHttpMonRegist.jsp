<%
 /**
  * @Class Name  : EgovComUtlHttpMonRegist.jsp
  * @Description : EgovComUtlHttpMonRegist 화면
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
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
	<head>
		<title>HTTP모니터링 등록</title>
		
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
		<validator:javascript formName="httpMon" staticJavascript="false" xhtml="true" cdata="false"/>
		
		<script type="text/javaScript" language="javascript">
		<!--
		/* ********************************************************
		 * 초기화
		 ******************************************************** */
		function fn_egov_initl_HttpMon(){
			// 첫 입력란에 포커스..
			httpMon.webKind.focus();
		}			
		/* ********************************************************
		 * 목록 으로 가기
		 ******************************************************** */
		function fn_egov_list_HttpMon(){
			location.href = "<c:url value='/utl/sys/htm/EgovComUtlHttpMonList.do'/>";
		}
		/* ********************************************************
		 * 저장처리화면
		 ******************************************************** */
		 function fn_egov_regist_HttpMon(form){
			if(confirm("<spring:message code="common.save.msg" />")){
				if(!validateHttpMon(form)){ 			
					return;
				}else{
					form.submit();
				}
			}
		}
		-->
		</script>
	</head>

	<body onLoad="fn_egov_initl_HttpMon();">
		<DIV id="content" style="width:712px">
		
			<form:form commandName="httpMon" name="httpMon" method="post">
				<!-- 상단 타이틀  영역 -->
				<table width="700" cellpadding="8" class="table-search" border="0">
				 	<tr>
				  		<td width="100%"class="title_left">
				   		<h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif'/>" width="16" height="16" hspace="3" align="middle" alt="">&nbsp;HTTP모니터링 등록</h1></td>
				 	</tr>
				</table>
	
				<!-- 등록  폼 영역  -->
				<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register" 
				summary="이 표는 HTTP서비스모니터링 대상 정보를 제공하며, 웹서비스종료, 시스템URL, 상태, 관리자명, 관리자이메일 정보로 구성되어 있습니다 .">
				<caption>HTTP모니터링 등록</caption>
					<tr>
					    <th scope="row" width="20%" height="23" class="required_text">웹서비스종류<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수항목" title="필수항목" width="15" height="15"></th>          
					    <td width="80%">
						   	<select name="webKind" title="웹서비스종류">
							   	<option value="TOMCAT">TOMCAT</option>
							   	<option value="WEBLOGIC">WEBLOGIC</option>
							   	<option value="JEUS">JEUS</option>
							   	<option value="JBOSS">JBOSS</option>								   							   	
						  	</select>
					    </td>
					</tr>					  	
				  	<tr>
					    <th scope="row" width="20%" height="23" class="required_text">시스템URL<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수입력표시" title="필수항목" width="15" height="15"></th>          
					    <td width="80%" colspan="3">
					      <form:input  path="siteUrl" size="30" maxlength="30"/>
					      <form:errors path="siteUrl"/>
					    </td>
				  	</tr> 				  	
				  	<tr>
					    <th scope="row" width="20%" height="23" class="required_text">관리자명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수입력표시" title="필수항목" width="15" height="15"></th>          
					    <td width="80%">
					      <form:input  path="mngrNm" size="60" maxlength="60"/>
					      <form:errors path="mngrNm"/>
					    </td>    
				  	</tr> 
				  	<tr>
					    <th scope="row" width="20%" height="23" class="required_text">관리자이메일<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수입력표시" title="필수항목" width="15" height="15"></th>          
					    <td width="80%">
					      <form:input  path="mngrEmailAddr" size="60" maxlength="60"/>
					      <form:errors path="mngrEmailAddr"/>
					    </td>    
				  	</tr>    
				</table>
				
				<table width="700" border="0" cellspacing="0" cellpadding="0">
					<tr> 
				    	<td height="10"></td>
				  	</tr>
				</table>
	
				<!-- 줄간격조정  -->
				<table width="700" cellspacing="0" cellpadding="0" border="0">
					<tr>
						<td height="3px"></td>
					</tr>
				</table>
				
				<!-- 목록/저장버튼  -->
				<table border="0" cellspacing="0" cellpadding="0" align="center">
					<tr>							  		    
  						<td><span class="button"><input type="submit" value="저장" onclick="fn_egov_regist_HttpMon(document.httpMon); return false;"></span></td>
				  		<td width="10"></td>
				  		<td><span class="button"><input type="submit" value="<spring:message code="button.list" />" onclick="fn_egov_list_HttpMon(); return false;"></span></td>				  		 						 
					</tr>
				</table>
	
				<input name="cmd" type="hidden" value="<c:out value='save'/>"/>
			</form:form>
		</DIV>
	</body>
</html>