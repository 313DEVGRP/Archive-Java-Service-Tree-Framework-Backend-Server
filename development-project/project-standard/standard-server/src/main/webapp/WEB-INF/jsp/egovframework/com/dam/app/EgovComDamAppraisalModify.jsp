<%
 /**
  * @Class Name  : EgovComDamAppraisalModify.jsp
  * @Description : EgovComDamAppraisalModify 화면
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
		<title>지식평가 수정</title>

		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>" ></script>
		<script type="text/javascript" src="/js/egovframework/com/sym/cal/EgovCalPopup.js" ></script>
		<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
		<validator:javascript formName="knoAppraisal" staticJavascript="false" xhtml="true" cdata="false"/>

		<script type="text/javaScript" language="javascript">
		<!--
		/* ********************************************************
		 * 초기화
		 ******************************************************** */
		function fn_egov_initl_KnoAppraisal(){

			// 첫 입력란에 포커스..
			knoAppraisal.appYmd.focus();

		}
		/* ********************************************************
		 * 목록 으로 가기
		 ******************************************************** */
		function fn_egov_list_KnoAppraisal(){
			location.href = "<c:url value='/dam/app/EgovComDamAppraisalList.do' />";
		}
		/* ********************************************************
		 * 저장처리화면
		 ******************************************************** */
		function fn_egov_modify_KnoAppraisal(form){

			var ls_appYmd = knoAppraisal.appYmd.value;

			if(confirm("<spring:message code="common.save.msg" />")){
				if(!validateKnoAppraisal(form)){
					return;
				}else{
					if (knoAppraisal.appYmd.value !="")	{
						ls_appYmd = fn_egov_remove_string(ls_appYmd,"-");
						knoAppraisal.appYmd.value = ls_appYmd;
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

	<body onLoad="fn_egov_initl_KnoAppraisal();">
		<DIV id="content" style="width:712px">

			<form:form commandName="knoAppraisal" name="knoAppraisal" method="post">

			<input name="cmd" type="hidden" value="Modify">
			<input name="knoId" type="hidden" value="<c:out value='${knoAppraisal.knoId}'/>">
			<form:hidden path="orgnztId"/>
			<form:hidden path="knoTypeCd"/>
			<form:hidden path="knoNm"/>

				<!-- 상단 타이틀  영역 -->
				<table width="700" cellpadding="8" class="table-search" border="0">
 					<tr>
  						<td width="100%"class="title_left">
   						<h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="">&nbsp;지식평가 수정</h1></td>
 					</tr>
				</table>

				<!-- 등록  폼 영역  -->
				<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register"
				summary="이 표는 지식평가관리 대상 정보를 제공하며 조직명, 지식유형명, 지식명, 지식내용, 첨부파일 목록, 평가일자, 평가결과 정보로 구성되어 있습니다 .">
				<caption>지식평가관리 수정</caption>
					<tr>
				    	<th scope="row" width="20%" height="23" class="required_text" nowrap >조직명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수항목" title="필수항목"  width="15" height="15"></th>
	    				<td>${knoAppraisal.orgnztNm}</td>
				  	</tr>
					<tr>
				    	<th scope="row" width="20%" height="23" class="required_text" nowrap >지식유형명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수항목" title="필수항목"  width="15" height="15"></th>
	    				<td>${knoAppraisal.knoTypeNm}</td>
				  	</tr>
				  	<tr>
				    	<th scope="row" width="20%" height="23" class="required_text" nowrap >지식명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수항목" title="필수항목"  width="15" height="15"></th>
				    	<td width="80%" nowrap>${knoAppraisal.knoNm}</td>
				  	</tr>
				  	<tr>
				    	<th scope="row" width="20%" height="23" class="required_text" nowrap >지식내용<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수항목" title="필수항목" width="15" height="15"></th>
				    	<td width="80%" nowrap>
				      		<textarea name="knoCn" class="textarea" title="지식내용" cols="300" rows="10" style="width:450px;" readonly>${knoAppraisal.knoCn}</textarea>
				    	</td>
				  	</tr>
				 	<!-- 첨부목록을 보여주기 위한 -->
				  	<c:if test="${knoAppraisal.atchFileId ne null && knoAppraisal.atchFileId ne ''}">
					<tr>
						<th scope="row" height="23" class="required_text">첨부파일 목록&nbsp;&nbsp;</th>
					    <td>
							<c:import charEncoding="utf-8" url="/cmm/fms/selectFileInfs.do" >
								<c:param name="param_atchFileId" value="${knoAppraisal.atchFileId}" />
							</c:import>
					    </td>
					</tr>
				  	</c:if>
				  	<tr>
				    	<th scope="row" width="20%" height="23" class="required_text" nowrap >평가일자<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수항목" title="필수항목"  width="15" height="15"></th>
				    	<td width="80%" nowrap>
					  		<input type="hidden" name="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" />
					  		<input name="appYmd" type="text" title="평가일달력" size="10" value="${knoAppraisal.appYmd}"  readonly />
					  		<a href="#LINK" onClick="fn_egov_NormalCalendar(knoAppraisal,'', knoAppraisal.appYmd);">
				      		<img name="calendarImg" src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />"  align="middle" style="border:0px" alt="달력창팝업버튼이미지">
				      		</a>
					  		<div><form:errors path="appYmd"/></div>
				    	</td>
				  	</tr>
					<tr>
				    	<th scope="row" width="20%" height="23" class="required_text" nowrap >평가결과<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수항목" title="필수항목"  width="15" height="15"></th>
	    				<td>
							<select name="knoAps" title="평가결과 선택">
							    <option value="1" <c:if test="${knoAppraisal.knoAps == '1'}">selected</c:if> >승인</option>
							    <option value="2" <c:if test="${knoAppraisal.knoAps == '2'}">selected</c:if> >반려</option>
							</select>
	    				</td>
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
  						<td><span class="button"><input type="submit" value="저장" onclick="fn_egov_modify_KnoAppraisal(document.forms[0]); return false;"></span></td>
				  		<td width="10"></td>
				  		<td><span class="button"><input type="submit" value="<spring:message code="button.list" />" onclick="fn_egov_list_KnoAppraisal(); return false;"></span></td>
					</tr>
				</table>
			</form:form>

		</DIV>
	</body>
</html>