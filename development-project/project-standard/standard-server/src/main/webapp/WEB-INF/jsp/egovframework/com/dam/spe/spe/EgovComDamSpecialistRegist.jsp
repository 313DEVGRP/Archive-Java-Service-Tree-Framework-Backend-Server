<%
 /**
  * @Class Name  : EgovComDamSpecialistRegist.jsp
  * @Description : EgovComDamSpecialistRegist 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2010.07.23  박종선                  최초 생성
  *	  2011.08.12     정진오		  "지식유형명" 항목 필수 항목 표시 image가 보이도록 수정함
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
		<title>지식전문가 등록</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js'/>" ></script>
		<script type="text/javascript" src="<c:url value='/validator.do'/>"></script>
		<validator:javascript formName="knoSpecialist" staticJavascript="false" xhtml="true" cdata="false"/>
		
		<script type="text/javaScript" language="javascript">
		<!--
		/* ********************************************************
		 * 초기화
		 ******************************************************** */
		function fn_egov_initl_KnoSpecialist(){
			// 첫 입력란에 포커스..
			knoSpecialist.orgnztId.focus();
		}	
		/* ********************************************************
		 * 목록 으로 가기
		 ******************************************************** */
		function fn_egov_list_KnoSpecialist(){
			location.href = "<c:url value='/dam/spe/spe/EgovComDamSpecialistList.do'/>";
		}
		/* ********************************************************
		 * 저장처리화면
		 ******************************************************** */
		 function fn_egov_regist_KnoSpecialist(form){
			if(confirm("<spring:message code="common.save.msg" />")){
				if(!validateKnoSpecialist(form)){ 			
					return;
				}else{
					form.cmd.value = "Regist";
					form.action = "<c:url value='/dam/spe/spe/EgovComDamSpecialistRegist.do'/>";								
					form.submit();
				}
			}
		}		
		/* ********************************************************
		 * 사용자검색 팝업
		 ******************************************************** */
		function fn_egov_inqire_user(){
			var retVal;
			var url = "<c:url value='/cop/com/openPopup.do?requestUrl=/cop/com/selectUserList.do&width=850&height=550'/>";
			var openParam = "dialogWidth: 850px; dialogHeight: 550px; resizable: 0, scroll: 1, center: 1";

			retVal = window.showModalDialog(url,"p_userInqire", openParam);		

			if(retVal != null){
				var tmp = retVal.split("|");
				document.knoSpecialist.speId.value = tmp[0];
				document.knoSpecialist.userNm.value = tmp[1];
			}	
		}
		
		function showModalDialogCallback(retVal) {
			if(retVal != null){
				var tmp = retVal.split("|");
				document.knoSpecialist.speId.value = tmp[0];
				document.knoSpecialist.userNm.value = tmp[1];
			}	
		}
		/* ********************************************************
		 * 지식유형 가져오기
		 ******************************************************** */
		function fn_egov_get_CodeId(form){
		 	form.cmd.value = "";
		 	form.submit();
		}			
		-->
		</script>
	</head>

	<body onLoad="fn_egov_initl_KnoSpecialist();">
		<DIV id="content" style="width:712px">
		
			<form:form commandName="knoSpecialist" name="knoSpecialist" method="post">
			
				<!-- 상단 타이틀  영역 -->
				<table width="700" cellpadding="8" class="table-search" border="0">
		 			<tr>
		  				<td width="100%"class="title_left">
		   					<h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif'/>" width="16" height="16" hspace="3" align="middle" alt="">&nbsp;지식전문가 등록</h1></td>
		 			</tr>
				</table>
		
				<!-- 등록  폼 영역  -->
				<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register" 
				summary="이 표는 지식전문가 정보를 제공하며, 조직명, 지식유형명, 전문가성명, 등급, 전문가설명, 승인일자 정보로 구성되어 있습니다 .">
				<caption>지식전문가 등록</caption>	  									
		  			<tr>
						<th scope="row" width="20%" height="23" class="required_text" nowrap >조직명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수항목" title="필수항목"  width="15" height="15"></th>          
					    <td width="80%" nowrap>
							<select name="orgnztId" class="select" onChange="javascript:fn_egov_get_CodeId(document.knoSpecialist)">
								<option value="">선택</option>
								<c:forEach var="knoSpecialist" items="${mapTeamList}" varStatus="status">							
									<option value='<c:out value="${knoSpecialist.orgnztId}"/>' <c:if test="${knoSpecialist.orgnztId == mapMaterial.orgnztId}">selected="selected"</c:if> ><c:out value="${knoSpecialist.orgnztNm}"/></option>
								</c:forEach>			  		   
							</select>						
					    </td>
					</tr>
					<tr>
					    <th scope="row" width="20%" height="23" class="required_text" nowrap >지식유형명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수항목" title="필수항목"  width="15" height="15"></th>          
					    <td width="80%" nowrap>
							<select name="knoTypeCd" class="select">						
								<option value="">선택</option>
								<c:forEach var="knoSpecialist" items="${mapMaterialList}" varStatus="status">
									<option value='<c:out value="${knoSpecialist.knoTypeCd}"/>'><c:out value="${knoSpecialist.knoTypeNm}"/></option>
								</c:forEach>			  		   
							</select>	
					    </td>
					</tr>					
					<tr> 
		    			<th scope="row" width="20%" height="23" class="required_text" nowrap >전문가명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수항목" title="필수항목"  width="15" height="15"></th>
					    <td width="80%" nowrap>
					      <input name="userNm" type="text" size="30" value='<c:out value="${knoSpecialist.userNm}" />' maxlength="60" >
					      <input name="speId" type="hidden" value='<c:out value="${knoSpecialist.speId}" />'>
					      &nbsp;<a href="javascript:fn_egov_inqire_user()" style="selector-dummy: expression(this.hideFocus=false);">
					      <img src="<c:url value='/images/egovframework/com/cmm/icon/search.gif' />" width="15" height="15" align="absmiddle" alt="search"/></a>
					     <br/><form:errors path="userNm" />			
					    </td>
					</tr>
					<tr>
					    <th scope="row" width="20%" height="23" class="required_text" nowrap >등급<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수항목" title="필수항목"  width="15" height="15"></th>          
					    <td width="80%" nowrap>
						   	<select name="appTypeCd" title="등급 선택">
							   	<option value="1">수석</option>
							   	<option value="2">책임</option>
							   	<option value="3">선임</option>					   	
						  	</select>
					    </td>
					</tr>
		  			<tr>
		    			<th scope="row" width="20%" height="23" class="required_text" nowrap >전문가설명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수항목" title="필수항목"  width="15" height="15"></th>          
		    			<td width="80%" nowrap>
		      				<form:textarea  path="speExpCn" title="전문가설명" cols="100" rows="10" cssClass="txaClass"/>
		      				<form:errors path="speExpCn"/>
		    			</td>    
		  			</tr>			  																						
		  			<tr> 
		    			<th scope="row" width="20%" height="23" class="required_text" nowrap >승인일자<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수항목" title="필수항목"  width="15" height="15"  align="middle"></th>
		    			<td width="80%" nowrap>
						<input type="hidden" name="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" />
		    			<input id="speConfmDe" name="speConfmDe" type="hidden" value=""/>
						<input name="vspeConfmDe" type="text" title="승인일자" size="10" value=""  maxlength="10" readonly 
						onClick="javascript:fn_egov_NormalCalendar(document.knoSpecialist, document.knoSpecialist.speConfmDe, document.knoSpecialist.vspeConfmDe);" />
						<a href="#LINK" onClick="fn_egov_NormalCalendar(document.knoSpecialist, document.knoSpecialist.speConfmDe, document.knoSpecialist.vspeConfmDe);" 
						style="selector-dummy:expression(this.hideFocus=false);">											
						<img src="<c:url value='/images/egovframework/com/sym/cal/bu_icon_carlendar.gif'/>" alt="달력창팝업버튼이미지"></a>
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
  						<td><span class="button"><input type="submit" value="저장" onclick="fn_egov_regist_KnoSpecialist(document.knoSpecialist); return false;"></span></td>
				  		<td width="10"></td>
				  		<td><span class="button"><input type="submit" value="<spring:message code="button.list" />" onclick="fn_egov_list_KnoSpecialist(); return false;"></span></td>				  		  						  
					</tr>
				</table>
		
				<!-- <input name="cmd" type="hidden" value="<c:out value='save'/>"> -->
				<input name="cmd" type="hidden" value="<c:out value='Regist'/>">
			</form:form>
		</DIV>
	</body>
</html>