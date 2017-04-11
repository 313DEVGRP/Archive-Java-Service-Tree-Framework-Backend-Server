<%
 /**
  * @Class Name  : EgovComDamPersonalModify.jsp
  * @Description : EgovComDamPersonalModify 화면
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
		<title>개인지식 수정</title>

		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>" ></script>
		<script type="text/javascript" src="/js/egovframework/com/sym/cal/EgovCalPopup.js" ></script>
		<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
		<validator:javascript formName="knoPersonal" staticJavascript="false" xhtml="true" cdata="false"/>

		<script type="text/javaScript" language="javascript">
		<!--
		/* ********************************************************
		 * 초기화
		 ******************************************************** */
		function fn_egov_initl_knoPersonal(){

			var maxFileNum = document.getElementById('posblAtchFileNumber').value;

			   if(maxFileNum==null || maxFileNum==""){

			     maxFileNum = 3;

			    }

			   var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum );

			   multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );

			// 첫 입력란에 포커스..
			knoPersonal.knoNm.focus();

		}
		/* ********************************************************
		 * 목록 으로 가기
		 ******************************************************** */
		function fn_egov_list_KnoPersonal(){
			location.href = "<c:url value='/dam/per/EgovComDamPersonalList.do'/>";
		}
		/* ********************************************************
		 * 저장처리화면
		 ******************************************************** */
		function fn_egov_modify_KnoPersonal(){

			var form = document.knoPersonal;

			if(confirm("<spring:message code="common.save.msg" />")){

				form.action = "<c:url value='/dam/per/EgovComDamPersonalModify.do'/>";

				if(!validateKnoPersonal(form)){
					return;
				}else{
					form.submit();
				}
			}
		}
		-->
		</script>
	</head>

	<body onLoad="fn_egov_initl_knoPersonal();">
		<DIV id="content" style="width:712px">

			<!-- 파일첨부를 위한 폼명 및 Enctype 설정 -->
			<form:form commandName="knoPersonal" name="knoPersonal" action="<c:url value='/dam/per/EgovComDamPersonalModifyView.do'/>" method="post" enctype="multipart/form-data">

			<input name="cmd" type="hidden" value="Modify">
			<input name="knoId" type="hidden" value="<c:out value='${knoPersonal.knoId}'/>">
			<form:hidden path="orgnztId"/>
			<form:hidden path="knoTypeCd"/>

				<!-- 상단 타이틀  영역 -->
				<table width="700" cellpadding="8" class="table-search" border="0">
 					<tr>
  						<td width="100%"class="title_left">
   						<h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif'/>" width="16" height="16" hspace="3" align="middle" alt="">&nbsp;개인지식 수정</h1></td>
 					</tr>
				</table>

				<!-- 등록  폼 영역  -->
				<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register"
				summary="이 표는 개인지식관리 정보를 제공하며, 조직명, 지식유형명, 지식명, 지식내용, 수집일자, 공개여부, 파일첨부 정보로 구성되어 있습니다 .">
				<caption>개인지식관리 수정</caption>
					<tr>
				    	<th scope="row" width="20%" height="23" class="required_text" nowrap >조직명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수항목" title="필수항목"  width="15" height="15"></th>
	    				<td>${knoPersonal.orgnztNm}</td>
				  	</tr>
					<tr>
				    	<th scope="row" width="20%" height="23" class="required_text" nowrap >지식유형명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수항목" title="필수항목"  width="15" height="15"></th>
	    				<td>${knoPersonal.knoTypeNm}</td>
				  	</tr>
				  	<tr>
				    	<th scope="row" width="20%" height="23" class="required_text" nowrap >지식명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수항목" title="필수항목"  width="15" height="15"></th>
				    	<td width="80%" nowrap>
				      		<form:input  path="knoNm" title="지식명" size="60" maxlength="60"/>
				      		<form:errors path="knoNm"/>
				    	</td>
				  	</tr>
				  	<tr>
				    	<th scope="row" width="20%" height="23" class="required_text" nowrap >지식내용<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수항목" title="필수항목" width="15" height="15"></th>
				    	<td width="80%" nowrap>
				      		<textarea name="knoCn" class="textarea" title="지식내용" cols="300" rows="10" style="width:450px;">${knoPersonal.knoCn}</textarea>
				    	</td>
				  	</tr>
				  	<tr>
				    	<th scope="row" width="20%" height="23" class="required_text" nowrap >수집일자<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수항목" title="필수항목"  width="15" height="15"></th>
				    	<td width="80%" nowrap>
					  		<input type="hidden" name="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" />
					  		<input name="colYmd" type="text" title="수집일달력" size="10" value="${knoPersonal.colYmd}"  readonly />
					  		<a href="#LINK" onClick="fn_egov_NormalCalendar(knoPersonal,'', knoPersonal.colYmd);">
				      		<img name="calendarImg" src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />"  align="middle" style="border:0px" alt="달력창팝업버튼이미지">
				      		</a>
					  		<div><form:errors path="colYmd"/></div>
				    	</td>
				  	</tr>
		  			<tr>
		    			<th scope="row" width="20%" height="23" class="required_text" nowrap >공개여부&nbsp;&nbsp;&nbsp;</th>
		    			<td width="80%" nowrap>
					     	<spring:message code="cop.public" /> : <input type="radio" name="othbcAt" class="radio2" value="Y"
					     	<c:if test="${knoPersonal.othbcAt == 'Y'}"> checked="checked"</c:if> />&nbsp;
					     	<spring:message code="cop.private" /> : <input type="radio" name="othbcAt" class="radio2" value="N"
					     	<c:if test="${knoPersonal.othbcAt == 'N'}"> checked="checked"</c:if> />
					     	<br/><form:errors path="othbcAt" />
		    			</td>
		  			</tr>

					<!-- 첨부파일 테이블 레이아웃 설정 Start -->
					<c:if test="${knoPersonal.atchFileId ne ''}">
						<tr>
							<th scope="row" height="23" class="required_text" >첨부파일목록&nbsp;&nbsp;&nbsp;</th>
							<td>
								<c:import url="/cmm/fms/selectFileInfsForUpdate.do" charEncoding="utf-8">
									<c:param name="param_atchFileId" value="${knoPersonal.atchFileId}" />
								</c:import>
							</td>
						</tr>
					</c:if>
					<!-- 첨부파일 테이블 레이아웃 End -->

					<!-- 첨부화일 업로드를 위한 Start -->
					<tr>
					<th scope="row" height="23" class="required_text">파일첨부&nbsp;&nbsp;&nbsp;</th>
						<td>

						   	<table width="100%" cellspacing="0" cellpadding="0" border="0" align="center" class="UseTable">
								<tr>
									<td><input name="file_1" id="egovComFileUploader" type="file" title="첨부파일명 입력"/></td>
								</tr>
								<tr>
									<td>
								    	<div id="egovComFileList"></div>
								    </td>
								</tr>
						  	    </table>
						 </td>
					 </tr>
					 <!-- 첨부화일 업로드를 위한 end.. -->
				</table>

			  	<c:if test="${knoPersonal.atchFileId eq ''}">
			  	<input type="hidden" name="fileListCnt" value="0" />
			  	<input name="atchFileAt" type="hidden" value="N">
			  	</c:if>

			  	<c:if test="${knoPersonal.atchFileId ne ''}">
			  	<input name="atchFileAt" type="hidden" value="Y">
			  	</c:if>

				<!-- 첨부파일 개수 설정을 위한 Hidden 설정 -->
				<input type="hidden" name="posblAtchFileNumber" id="posblAtchFileNumber" value="3" />
				<input type="hidden" name="returnUrl" value="<c:url value='/dam/per/EgovComDamPersonalModifyView.do'/>" >

				<!-- 줄간격조정  -->
				<table width="700" cellspacing="0" cellpadding="0" border="0">
					<tr>
						<td height="3px"></td>
					</tr>
				</table>

				<!-- 목록/저장버튼  -->
				<table border="0" cellspacing="0" cellpadding="0" align="center">
					<tr>
  						<td><span class="button"><input type="submit" value="저장" onclick="fn_egov_modify_KnoPersonal(); return false;"></span></td>
				  		<td width="10"></td>
				  		<td><span class="button"><input type="submit" value="<spring:message code="button.list" />" onclick="fn_egov_list_KnoPersonal(); return false;"></span></td>
					</tr>
				</table>
			</form:form>

		</DIV>
	</body>
</html>