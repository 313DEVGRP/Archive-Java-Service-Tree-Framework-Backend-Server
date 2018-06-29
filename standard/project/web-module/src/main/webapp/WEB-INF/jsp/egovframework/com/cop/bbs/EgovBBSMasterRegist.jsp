<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
 /**
  * @Class Name : EgovBBSMasterRegist.jsp
  * @Description : EgovBBSMasterRegist 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.02.01   박정규              최초 생성
  *   2016.06.13   김연호              표준프레임워크 v3.6 개선
  *
  *  @author 공통서비스팀 
  *  @since 2009.02.01
  *  @version 1.0
  *  @see
  *  
  */
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="pageTitle"><spring:message code="comCopBbs.boardMasterVO.title"/></c:set>
<!DOCTYPE html>
<html>
<head>
<title>${pageTitle} <spring:message code="title.create" /></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="boardMasterVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init(){

	// 첫 입력란에 포커스
	document.getElementById("boardMasterVO").bbsNm.focus();

}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_regist_bbs(form){
	//input item Client-Side validate
	if (!validateBoardMasterVO(form)) {	
		return false;
	} else {
		
		var validateForm = document.getElementById("boardMasterVO");

		//방명록 게시판의 경우 답장 불가, 파일첨부 불가
		if(validateForm.bbsTyCode.value == 'BBST03') {
			if(validateForm.replyPosblAt.value == 'Y') {
				alert("<spring:message code="comCopBbs.boardMasterVO.guestReply" />");
				return;
			}
			if(validateForm.fileAtchPosblAt.value == 'Y') {
				alert("<spring:message code="comCopBbs.boardMasterVO.guestFile" />");
				return;
			}
		}
		
		
		if(confirm("<spring:message code="common.regist.msg" />")){	
			form.submit();	
		}
	} 
}
</script>

</head>
<body onLoad="fn_egov_init();">

<!-- javascript warning tag  -->
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>

<form:form commandName="boardMasterVO" action="${pageContext.request.contextPath}/cop/bbs/insertBBSMaster.do" method="post" onSubmit="fn_egov_regist_bbs(document.forms[0]); return false;"> 
<div class="wTableFrm">
	<!-- 타이틀 -->
	<h2>${pageTitle} <spring:message code="title.create" /></h2>

	<!-- 등록폼 -->
	<table class="wTable" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
	<caption>${pageTitle } <spring:message code="title.create" /></caption>
	<colgroup>
		<col style="width: 20%;"><col style="width: ;">
	</colgroup>
	<tbody>
		<!-- 입력 -->
		<c:set var="inputTxt"><spring:message code="input.input" /></c:set>
		<!-- 게시판명 -->
		<c:set var="title"><spring:message code="comCopBbs.boardMasterVO.regist.bbsNm"/> </c:set>
		<tr>
			<th><label for="bbsNm">${title} <span class="pilsu">*</span></label></th>
			<td class="left">
			    <form:input path="bbsNm" title="${title} ${inputTxt}" size="70" maxlength="70" />
   				<div><form:errors path="bbsNm" cssClass="error" /></div>
			</td>
		</tr>
		<!-- 게시판 소개내용 -->
		<c:set var="title"><spring:message code="comCopBbs.boardMasterVO.regist.bbsIntrcn"/> </c:set>
		<tr>
			<th><label for="bbsIntrcn">${title } <span class="pilsu">*</span></label></th>
			<td class="nopd">
				<form:textarea path="bbsIntrcn" title="${title} ${inputTxt}" cols="300" rows="20" />
				<div><form:errors path="bbsIntrcn" cssClass="error" /></div>
			</td>
		</tr>
		
		<!-- 게시판 유형 -->
		<c:set var="title"><spring:message code="comCopBbs.boardMasterVO.regist.bbsTyCode"/> </c:set>
		<tr>
			<th><label for="bbsTyCode">${title} <span class="pilsu">*</span></label></th>
			<td class="left">
				<form:select path="bbsTyCode" title="${title} ${inputTxt}" cssClass="txt">
					<form:option value="" label="--선택하세요--" />
					<form:options items="${bbsTyCode}" itemValue="code" itemLabel="codeNm" />
				</form:select>
				<div><form:errors path="bbsTyCode" cssClass="error" /></div>
			</td>
		</tr>
		
		<!-- 답장가능여부 -->
		<c:set var="title"><spring:message code="comCopBbs.boardMasterVO.regist.replyPosblAt"/> </c:set>
		<tr>
			<th><label for="replyPosblAt">${title} <span class="pilsu">*</span></label></th>
			<td class="left">
				<form:select path="replyPosblAt" title="${title} ${inputTxt }" cssClass="txt">
					<form:option value="" label="--선택하세요--" />
					<form:option value="Y"  label="예" />
	  		   		<form:option value='N'>아니오</form:option>
				</form:select>
				<div><form:errors path="replyPosblAt" cssClass="error" /></div>
			</td>
		</tr>
		
		<!-- 파일첨부가능여부 -->
		<c:set var="title"><spring:message code="comCopBbs.boardMasterVO.regist.fileAtchPosblAt"/> </c:set>
		<tr>
			<th><label for="fileAtchPosblAt">${title} <span class="pilsu">*</span></label></th>
			<td class="left">
				<form:select path="fileAtchPosblAt" title="${title} ${inputTxt}" cssClass="txt">
					<form:option value="" label="--선택하세요--" />
					<form:option value="Y"  label="예" />
	  		   		<form:option value='N'>아니오</form:option>
				</form:select>
				<div><form:errors path="fileAtchPosblAt" cssClass="error" /></div>
			</td>
		</tr>
		
		<!-- 첨부가능파일숫자 -->
		<c:set var="title"><spring:message code="comCopBbs.boardMasterVO.regist.atchPosblFileNumber"/> </c:set>
		<tr>
			<th><label for="atchPosblFileNumber">${title } <span class="pilsu">*</span></label></th>
			<td class="left">
				<form:select path="atchPosblFileNumber" title="${title} ${inputTxt }" cssClass="txt">
					<form:option value="0" selected="selected">없음</form:option>
					<form:option value='1'>1</form:option>
	  		   		<form:option value='2'>2</form:option>
	  		   		<form:option value='3'>3</form:option>
				</form:select>
				<div><form:errors path="atchPosblFileNumber" cssClass="error" /></div>
			</td>
		</tr>
		
		<!-- 사용여부 -->
		<c:set var="title"><spring:message code="comCopBbs.boardMasterVO.regist.useAt"/> </c:set>
		<tr>
			<th><label for="useAt">${title } <span class="pilsu">*</span></label></th>
			<td class="left">
				<form:select path="useAt" title="${title} ${inputTxt }" cssClass="txt">
					<form:option value="" label="--선택하세요--" />
					<form:option value="Y"  label="예" />
	  		   		<form:option value='N'>아니오</form:option>
				</form:select>
				<div><form:errors path="useAt" cssClass="error" /></div>
			</td>
		</tr>
		
	</tbody>
	</table>

	<!-- 하단 버튼 -->
	<div class="btn">
		<input type="submit" class="s_submit" value="<spring:message code="button.create" />" title="<spring:message code="button.create" /> <spring:message code="input.button" />" />
		<span class="btn_s"><a href="<c:url value='/cop/bbs/selectBBSMasterInfs.do' />"  title="<spring:message code="button.list" />  <spring:message code="input.button" />"><spring:message code="button.list" /></a></span>
	</div><div style="clear:both;"></div>
	
</div>

<input name="cmmntyId" type="hidden" value="<c:out value='${searchVO.cmmntyId}'/>">
<input name="cmd" type="hidden" value="<c:out value='save'/>">
</form:form>

</body>
</html>
