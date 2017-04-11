<%
 /**
  * @Class Name  : EgovComDamMapMaterialModify.jsp
  * @Description : EgovComDamMapMaterialModify 화면
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
		<title>지식맵(유형별) 수정</title>
		
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">		
		<script type="text/javascript" src="/js/egovframework/com/sym/cal/EgovCalPopup.js" ></script>
		<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
		<validator:javascript formName="mapMaterial" staticJavascript="false" xhtml="true" cdata="false"/>
		
		<script type="text/javaScript" language="javascript">
		<!--
		/* ********************************************************
		 * 초기화
		 ******************************************************** */
		function fn_egov_initl_MapMaterial(){
			// 첫 입력란에 포커스..
			mapMaterial.knoTypeNm.focus();
		}		
		/* ********************************************************
		 * 목록 으로 가기
		 ******************************************************** */
		function fn_egov_list_MapMaterial(){
			location.href = "<c:url value='/dam/map/mat/EgovComDamMapMaterialList.do'/>";
		}
		/* ********************************************************
		 * 저장처리화면
		 ******************************************************** */
		function fn_egov_modify_MapMaterial(form){
		
			var ls_clYmd = mapMaterial.clYmd.value;
		
			/*if (mapMaterial.clYmd.value !="")	{
				ls_clYmd = fn_egov_remove_string(ls_clYmd,"-");
				mapMaterial.clYmd.value = ls_clYmd;
			}*/
			
			if(confirm("<spring:message code="common.save.msg" />")){
				if(!validateMapMaterial(form)){ 			
					return;
				}else{
					if (mapMaterial.clYmd.value !="")	{
					ls_clYmd = fn_egov_remove_string(ls_clYmd,"-");
					mapMaterial.clYmd.value = ls_clYmd;
					}					
					form.submit();
				}
			}
		}
		
		/* ********************************************************
		* 입력받은문자열중에서 제거 문자열을 제외 문자열을 리턴한다.
		******************************************************** */
		function fn_egov_remove_string(srcStr, cndStr) {
			
		   var	result = null;
			var rtnStr = null;
		   
		   for (var i = 0; i < srcStr.length; i++) {
		   	
		       if (srcStr.charAt(i) == cndStr) {
		           result = srcStr.substring(0, i);
		           
		           // 첫번째 제거 문자열을 제외한 전체 문자열
		           srcStr = result + srcStr.substring(i+1, srcStr.length);
		           
		           // 최종변환 문자열
		           rtnStr = srcStr;
		       }
		   }
		   
		   return rtnStr;
		}
		-->
		</script>
	</head>

	<body onLoad="fn_egov_initl_MapMaterial();">
		<DIV id="content" style="width:712px">
			
			<form:form commandName="mapMaterial" name="mapMaterial" method="post">
			<input name="cmd" type="hidden" value="Modify">
			<form:hidden path="orgnztId"/>
			<form:hidden path="knoTypeCd"/>				
				<!-- 상단 타이틀  영역 -->
				<table width="700" cellpadding="8" class="table-search" border="0">
 					<tr>
  						<td width="100%"class="title_left">
   						<h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif'/>" width="16" height="16" hspace="3" align="middle" alt="">&nbsp;지식맵(유형별) 수정</h1></td>
 					</tr>
				</table>

				<!-- 줄간격조정  -->
				<table width="700" cellspacing="0" cellpadding="0" border="0">
					<tr>
						<td height="3px"></td>
					</tr>
				</table>

				<!-- 등록  폼 영역  -->
				<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register" 
				summary="이 표는 지식맵(유형별) 대상 정보를 제공하며, 조직ID, 조직명, , 지식유형코드, 지식유형명, 지식URL, 분류일자 정보로 구성되어 있습니다 .">
				<caption>지식맵(유형별) 수정</caption>
					<tr>
				    	<th scope="row" width="20%" height="23" class="required_text" nowrap >조직ID<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수항목" title="필수항목"  width="15" height="15"></th>          
	    				<td>${mapMaterial.orgnztId}</td>
				  	</tr>
					<tr>
				    	<th scope="row" width="20%" height="23" class="required_text" nowrap >조직명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수항목" title="필수항목"  width="15" height="15"></th>          
	    				<td>${mapMaterial.orgnztNm}</td>
				  	</tr>					  			  					
					<tr>
				    	<th scope="row" width="20%" height="23" class="required_text" nowrap >지식유형코드<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수항목" title="필수항목"  width="15" height="15"></th>          
	    				<td>${mapMaterial.knoTypeCd}</td>
				  	</tr>
				  	<tr>
				    	<th scope="row" width="20%" height="23" class="required_text" nowrap >지식유형명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수항목" title="필수항목"  width="15" height="15"></th>          
				    	<td width="80%" nowrap>
				      		<form:input  path="knoTypeNm" title="지식유형명" size="60" maxlength="20"/>
				      		<form:errors path="knoTypeNm"/>
				    	</td>    
				  	</tr>			  	
				  	<tr>
				    	<th scope="row" width="20%" height="23" class="required_text" nowrap >지식URL<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수항목" title="필수항목"  width="15" height="15"></th>          
				    	<td width="80%" nowrap>
				      		<form:input  path="knoUrl" title="지식URL" size="60" maxlength="100"/>
				      		<form:errors path="knoUrl"/>
				    	</td>    
				  	</tr>
				  	<tr> 
				    	<th scope="row" width="20%" height="23" class="required_text" nowrap >분류일자<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수항목" title="필수항목"  width="15" height="15"></th>
				    	<td width="80%" nowrap>
					  		<input type="hidden" name="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" />	  
					  		<input name="clYmd" type="text" title="분류일자" size="10" value="${mapMaterial.clYmd}"  readonly /> 
					  		<a href="#LINK" onClick="fn_egov_NormalCalendar(mapMaterial,'', mapMaterial.clYmd);">					  		
				      		<img name="calendarImg" src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />"  align="middle" style="border:0px" alt="분류일자" title="분류일자">
				      		</a>	  
					  		<div><form:errors path="clYmd"/></div>
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
  						<td><span class="button"><input type="submit" value="저장" onclick="fn_egov_modify_MapMaterial(document.mapMaterial); return false;"></span></td>
				  		<td width="10"></td> 	  									 
				  		<td><span class="button"><input type="submit" value="<spring:message code="button.list" />" onclick="fn_egov_list_MapMaterial(); return false;"></span></td>			  		
					</tr>
				</table>
			</form:form>

		</DIV>
	</body>
</html>