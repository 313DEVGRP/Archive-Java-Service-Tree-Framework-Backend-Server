<%
 /**
  * @Class Name  : EgovComDamManagementModify.jsp
  * @Description : EgovComDamManagementModify 화면
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
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
	<head>
		<title>지식정보 수정</title>
		
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>" ></script>		
		<script type="text/javascript" src="/js/egovframework/com/sym/cal/EgovCalPopup.js" ></script>
		<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
		<validator:javascript formName="knoManagement" staticJavascript="false" xhtml="true" cdata="false"/>
		
		<script type="text/javaScript" language="javascript">
		<!--
		/* ********************************************************
		 * 초기화
		 ******************************************************** */
		function fn_egov_initl_KnoManagement(){				
			   			
			// 첫 입력란에 포커스..
			knoManagement.knoAps.focus();

		}		
		/* ********************************************************
		 * 목록 으로 가기
		 ******************************************************** */
		function fn_egov_list_KnoManagement(){
			location.href = "/dam/mgm/EgovComDamManagementList.do";
		}
		/* ********************************************************
		 * 저장처리화면
		 ******************************************************** */
		function fn_egov_modify_KnoManagement(form){
		
			var ls_junkYmd = knoManagement.junkYmd.value;
		
			if (knoManagement.junkYmd.value !="")	{
				ls_junkYmd = fn_egov_remove_string(ls_junkYmd,"-");
				knoManagement.junkYmd.value = ls_junkYmd;
			}
			
			if(confirm("<spring:message code="common.save.msg" />")){
				if(!validateKnoManagement(form)){ 			
					return;
				}else{
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

	<body onLoad="fn_egov_initl_KnoManagement();">
		<DIV id="content" style="width:712px">
					
			<form:form commandName="knoManagement" name="knoManagement" action="/dam/mgm/EgovComDamManagementModify.do" method="post">	
						
			<input name="cmd" type="hidden" value="Modify">
			<input name="knoId" type="hidden" value="<c:out value='${knoManagement.knoId}'/>">
							
				<!-- 상단 타이틀  영역 -->
				<table width="700" cellpadding="8" class="table-search" border="0">
 					<tr>
  						<td width="100%"class="title_left">
   						<h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="">&nbsp;지식정보 수정</h1></td>
 					</tr>
				</table>

				<!-- 등록  폼 영역  -->
				<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register" 
				summary="이 표는 지식정보관리 정보를 제공하며, 조직명, 지식유형명, 등록일자, 등록자명, 지식명, 지식내용, 공개여부, 평가일자, 평가자명, 평가결과, 지식정제, 폐기일자, 첨부파일 정보로 구성되어 있습니다 .">
				<caption>지식정보관리 수정</caption>
					<tr>
				    	<th scope="row" width="20%" height="23" class="required_text" nowrap >조직명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수항목" title="필수항목"  width="15" height="15"></th>          
	    				<td>${knoManagement.orgnztNm}</td>
				  	</tr>
					<tr>
				    	<th scope="row" width="20%" height="23" class="required_text" nowrap >지식유형명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수항목" title="필수항목"  width="15" height="15"></th>          
	    				<td>${knoManagement.knoTypeNm}</td>
				  	</tr>
					<tr>
						<th scope="row" width="20%" height="23" class="required_text">등록일자<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수항목" title="필수항목"  width="15" height="15"></th>          
					    <td>${knoManagement.frstRegisterPnttm}</td>    
					</tr>
		  			<tr> 
		    			<th scope="row" width="20%" height="23" class="required_text" nowrap >등록자명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수항목" title="필수항목"  width="15" height="15"></th>
		    			<td>${knoManagement.userNm}</td>
		  			</tr>				  	
				  	<tr>
				    	<th scope="row" width="20%" height="23" class="required_text" nowrap >지식명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수항목" title="필수항목"  width="15" height="15"></th>          
	    				<td>${knoManagement.knoNm}</td>				    	   
				  	</tr>
				  	<tr> 
				    	<th scope="row" width="20%" height="23" class="required_text" nowrap >지식내용<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수항목" title="필수항목" width="15" height="15"></th>
				    	<td width="80%" nowrap>
				      		<textarea name="knoCn" class="textarea" title="지식내용" cols="300" rows="5" style="width:450px;" readonly>${knoManagement.knoCn}</textarea>               
				    	</td>
				  	</tr>
					<tr>
						<th scope="row" width="20%" height="23" class="required_text" nowrap >공개여부<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수항목" title="필수항목"  width="15" height="15"></th>          
					    <td>
						    <c:choose>
						    	<c:when test="${knoManagement.othbcAt == 'Y'}">
						    		<spring:message code="cop.public" />
						    	</c:when>
						    	<c:otherwise>
						    		<spring:message code="cop.private" />
						    	</c:otherwise>
						    </c:choose>				    
					    </td>    
					</tr>			  					  					  				  					  	
				  	<tr> 
				    	<th scope="row" width="20%" height="23" class="required_text" nowrap >평가일자<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수항목" title="필수항목"  width="15" height="15"></th>
					    <td>
						    <c:if test="${knoManagement.appYmd == null}">진행중</c:if>
						    <c:if test="${knoManagement.appYmd != null}">${knoManagement.appYmd}</c:if>
					    </td>
				  	</tr>
		  			<tr> 
		    			<th scope="row" width="20%" height="23" class="required_text" nowrap >평가자명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수항목" title="필수항목"  width="15" height="15"></th>
		    			<td>${knoManagement.speNm}</td>
		  			</tr>
		  			<tr>
		    			<th scope="row" width="20%" height="23" class="required_text" nowrap >평가결과<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수항목" title="필수항목"  width="15" height="15"></th>          
		    			<td>
							<c:if test="${knoManagement.knoAps == null}">평가중</c:if>	    			
						    <c:if test="${knoManagement.knoAps == '1'}">승인</c:if>
						    <c:if test="${knoManagement.knoAps == '2'}">반려</c:if>		
		    			</td>    
		  			</tr>
					<tr>
				    	<th scope="row" width="20%" height="23" class="required_text" nowrap >지식정제<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수항목" title="필수항목"  width="15" height="15"></th>          
	    				<td>
							<select name="knoAps" title="지식정제 선택">				  		 							    
							    <option value="3" <c:if test="${knoManagement.knoAps == '3'}">selected</c:if> >폐기</option>
							</select>						  	    				
	    				</td>				    	
				  	</tr>			  			
					<tr>
						<th scope="row" width="20%" height="23" class="required_text" nowrap >폐기일자&nbsp;&nbsp;&nbsp;</th>          
				    	<td width="80%" nowrap>
					  		<input type="hidden" name="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" />	  
					  		<input name="junkYmd" type="text" title="수집일달력" size="10" value="${knoManagement.junkYmd}"  readonly /> 
					  		<a href="#LINK" onClick="fn_egov_NormalCalendar(knoManagement,'', knoManagement.junkYmd);">					  		
				      		<img name="calendarImg" src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />"  align="middle" style="border:0px" alt="폐기일자" title="폐기일자">
				      		</a>	  
					  		<div><form:errors path="junkYmd"/></div>
				    	</td>						
					</tr>									  	
				 	<!-- 첨부목록을 보여주기 위한 -->  
				  	<c:if test="${knoManagement.atchFileId ne null && knoManagement.atchFileId ne ''}">
					<tr> 
						<th scope="row" height="23" class="required_text">첨부파일 목록&nbsp;&nbsp;&nbsp;</th>
					    <td>
							<c:import charEncoding="utf-8" url="/cmm/fms/selectFileInfs.do" >
								<c:param name="param_atchFileId" value="${knoManagement.atchFileId}" />
							</c:import>		
					    </td>
					</tr>
				  	</c:if>	  		  	
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
  						<td><span class="button"><input type="submit" value="저장" onclick="fn_egov_modify_KnoManagement(document.forms[0]); return false;"></span></td>
				  		<td width="10"></td>  						
				  		<td><span class="button"><input type="submit" value="<spring:message code="button.list" />" onclick="fn_egov_list_KnoManagement(); return false;"></span></td>	  												     				  		
					</tr>
				</table>			
			</form:form>

		</DIV>
	</body>
</html>