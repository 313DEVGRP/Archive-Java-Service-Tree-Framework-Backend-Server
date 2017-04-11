<%
 /**
  * @Class Name  : EgovComDamPersonalRegist.jsp
  * @Description : EgovComDamPersonalRegist 화면
  * @Modification Information
  * @
  * @  수정일       수정자                   수정내용
  * @ -------      --------    ---------------------------
  * @ 2010.08.12  	박종선                  최초 생성
  * @ 2011.08.12    정진오		"지식유형명" 항목 필수 항목 표시 image가 보이도록 수정함
  * @ 2011.10.07	이기하		조직명 선택 후 화면 재로딩되는 오류 주석처리
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
<%@ page import="java.util.Date"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
	<head>
		<title>개인지식 등록</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js'/>" ></script>
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
			knoPersonal.orgnztId.focus();

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
		function fn_egov_regist_KnoPersonal(form){
			if(confirm("<spring:message code="common.save.msg" />")){
				if(!validateKnoPersonal(form)){
					return;
				}else{
					form.cmd.value = "Regist";
					form.action = "<c:url value='/dam/per/EgovComDamPersonalRegist.do'/>";
					form.submit();
				}
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

	<body onLoad="fn_egov_initl_knoPersonal();">
		<DIV id="content" style="width:712px">

			<!-- 파일첨부를 위한 폼명 및 Enctype 설정 -->
			<form:form commandName="knoPersonal" name="knoPersonal" method="post" enctype="multipart/form-data">

				<!-- 상단 타이틀  영역 -->
				<table width="700" cellpadding="8" class="table-search" border="0">
		 			<tr>
		  				<td width="100%"class="title_left">
		   					<h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif'/>" width="16" height="16" hspace="3" align="middle" alt="">&nbsp;개인지식 등록</h1></td>
		 			</tr>
				</table>

				<!-- 등록  폼 영역  -->
				<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register"
				summary="이 표는 개인지식관리 정보를 제공하며, 조직명, 지식유형, 지식명, 지식내용, 수집일자, 공개여부, 파일첨부 정보로 구성되어 있습니다 .">
				<caption>개인지식관리 등록</caption>
		  			<tr>
						<th scope="row" width="20%" height="23" class="required_text" nowrap >조직명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수항목" title="필수항목"  width="15" height="15"></th>
					    <td width="80%" nowrap>
						<!-- 	<select name="orgnztId" class="select" onChange="javascript:fn_egov_get_CodeId(document.knoPersonal)">  -->
							<select name="orgnztId" class="select" >
								<option value="">선택</option>
								<c:forEach var="knoPersonal" items="${mapTeamList}" varStatus="status">
									<option value='<c:out value="${knoPersonal.orgnztId}"/>' <c:if test="${knoPersonal.orgnztId == mapMaterial.orgnztId}">selected="selected"</c:if> ><c:out value="${knoPersonal.orgnztNm}"/></option>
								</c:forEach>
							</select>
					    </td>
					</tr>
					<tr>
					    <th scope="row" width="20%" height="23" class="required_text" nowrap >지식유형명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수항목" title="필수항목"  width="15" height="15"></th>
					    <td width="80%" nowrap>
							<select name="knoTypeCd" class="select">
								<option value="">선택</option>
								<c:forEach var="knoPersonal" items="${mapMaterialList}" varStatus="status">
									<option value='<c:out value="${knoPersonal.knoTypeCd}"/>'><c:out value="${knoPersonal.knoTypeNm}"/></option>
								</c:forEach>
							</select>
					    </td>
					</tr>
		  			<tr>
		    			<th scope="row" width="20%" height="23" class="required_text" nowrap >지식명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수항목" title="필수항목"  width="15" height="15"></th>
		    			<td width="80%" nowrap>
		      				<form:input  path="knoNm" title="지식명" size="60" maxlength="60"/>
		      				<form:errors path="knoNm"/>
		    			</td>
		  			</tr>
		  			<tr>
		    			<th scope="row" width="20%" height="23" class="required_text" nowrap >지식내용<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수항목" title="필수항목"  width="15" height="15"></th>
		    			<td width="80%" nowrap>
		      				<form:textarea  path="knoCn" title="지식내용" cols="300" rows="10" cssClass="txaClass"/>
		      				<form:errors path="knoCn"/>
		    			</td>
		  			</tr>
		  			<tr>
		    			<th scope="row" width="20%" height="23" class="required_text" nowrap >수집일자<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수항목" title="필수항목"  width="15" height="15"  align="middle"></th>
		    			<td width="80%" nowrap>
						<input type="hidden" name="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" />
		    			<input id="colYmd" name="colYmd" type="hidden" value=""/>
						<input name="vcolYmd" type="text" title="수집일자" size="10" value=""  maxlength="10" readonly
						onClick="javascript:fn_egov_NormalCalendar(document.knoPersonal, document.knoPersonal.colYmd, document.knoPersonal.vcolYmd);" />
						<a href="#LINK" onClick="fn_egov_NormalCalendar(document.knoPersonal, document.knoPersonal.colYmd, document.knoPersonal.vcolYmd);" style="selector-dummy:expression(this.hideFocus=false);">
						<img src="<c:url value='/images/egovframework/com/sym/cal/bu_icon_carlendar.gif'/>" alt="달력창팝업버튼이미지"></a>
		   				</td>
		  			</tr>
		  			<tr>
		    			<th scope="row" width="20%" height="23" class="required_text" nowrap >공개여부&nbsp;&nbsp;&nbsp;</th>
		    			<td width="80%" nowrap>
					     	<spring:message code="cop.public" /> : <input type="radio" name="othbcAt" class="radio2" value="Y">&nbsp;
					     	<spring:message code="cop.private" /> : <input type="radio" name="othbcAt" class="radio2" value="N" checked>
					     	<br/><form:errors path="othbcAt" />
		    			</td>
		  			</tr>
				  	<!-- 첨부파일 테이블 레이아웃 설정 Start -->
				  	<tr>
		    			<th scope="row" width="20%" height="23" class="required_text" nowrap >파일첨부&nbsp;&nbsp;&nbsp;</th>
						<td colspan="3">
				    		<table width="580px" cellspacing="0" cellpadding="0" border="0" align="center" class="UseTable">
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
				  	<!-- 첨부파일 테이블 레이아웃 End -->
				</table>
				<!-- 줄간격조정  -->
				<table width="700" cellspacing="0" cellpadding="0" border="0">
					<tr>
						<td height="5px"></td>
					</tr>
				</table>
				<!-- 목록/저장버튼  -->
				<table border="0" cellspacing="0" cellpadding="0" align="center">
					<tr>
  						<td><span class="button"><input type="submit" value="저장" onclick="fn_egov_regist_KnoPersonal(document.knoPersonal); return false;"></span></td>
				  		<td width="10"></td>
				  		<td><span class="button"><input type="submit" value="<spring:message code="button.list" />" onclick="fn_egov_list_KnoPersonal(); return false;"></span></td>
					</tr>
				</table>

				<input type="hidden" name="posblAtchFileNumber" id="posblAtchFileNumber" value="3" />
				<!-- <input name="cmd" type="hidden" value="<c:out value='save'/>"> -->
				<input name="cmd" type="hidden" value="<c:out value='Regist'/>">

			</form:form>
		</DIV>
	</body>
</html>