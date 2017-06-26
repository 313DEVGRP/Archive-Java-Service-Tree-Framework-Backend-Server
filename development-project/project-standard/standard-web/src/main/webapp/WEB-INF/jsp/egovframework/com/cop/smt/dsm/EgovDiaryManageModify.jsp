<%
 /**
  * @Class Name : EgovStplatCnRegist.jsp
  * @Description : 일지관리 수정 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.03.09    장동한          최초 생성
  *   2016.08.09    장동한          표준프레임워크 v3.6 개선
  *
  *  @author 공통서비스팀 
  *  @since 2009.03.09
  *  @version 1.0
  *  @see
  *  
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="pageTitle"><spring:message code="comCopSmtDsm.title"/></c:set>
<%pageContext.setAttribute("crlf", "\r\n"); %>

<!DOCTYPE html>
<html>
<head>
<title>${pageTitle} <spring:message code="title.update" /></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">

<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>" ></script>

<validator:javascript formName="diaryManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_DiaryManage(){
	var existFileNum = document.diaryManageVO.fileListCnt.value;
	var maxFileNum = document.diaryManageVO.posblAtchFileNumber.value;

	if(existFileNum=="undefined" || existFileNum ==null){
		existFileNum = 0;
	}

	if(maxFileNum=="undefined" || maxFileNum ==null){
		maxFileNum = 0;
	}

	var uploadableFileNum = maxFileNum - existFileNum;

	if(uploadableFileNum<0) {
		uploadableFileNum = 0;
	}

	if(uploadableFileNum != 0){

		 fn_egov_check_file('Y');

		var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), uploadableFileNum );
		multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );

	}else{
		fn_egov_check_file('N');
	}
}


function fn_egov_check_file(flag) {
	if(flag=="Y") {
		document.getElementById('file_upload_posbl').style.display = "block";
		document.getElementById('file_upload_imposbl').style.display = "none";
	} else {
		document.getElementById('file_upload_posbl').style.display = "none";
		document.getElementById('file_upload_imposbl').style.display = "block";
	}
}

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_DiaryManage(){
	location.href = "<c:url value='/cop/smt/dsm/EgovDiaryManageList.do' />";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_save_DiaryManage(form){
	if(confirm("<spring:message code="common.save.msg" />")){

		if(!validateDiaryManageVO(form)){
			return false;
		}else{
			form.submit();
		}
	}
}
</script>
</head>
<body onLoad="fn_egov_init_DiaryManage();">

<form:form commandName="diaryManageVO"  action="${pageContext.request.contextPath}/cop/smt/dsm/EgovDiaryManageModifyActor.do" name="deptSchdulManageVO" method="post" enctype="multipart/form-data" onSubmit="fn_egov_save_DiaryManage(document.forms[0]); return false;"> 
<div class="wTableFrm">
	<!-- 타이틀 -->
	<h2>${pageTitle} <spring:message code="title.update" /></h2>

	<!-- 등록폼 -->
	<table class="wTable" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
	<caption>${pageTitle} <spring:message code="title.update" /></caption>
	<colgroup>
		<col style="width: 16%;"><col style="width: ;">
	</colgroup>
	<tbody>
		<!-- 입력 -->
		<c:set var="inputTxt"><spring:message code="input.input" /></c:set>
		<!-- 일지정보 -->
		<c:set var="title"><spring:message code="comCopSmtDsm.regist.schdulCn"/></c:set>
		<tr>
			<th><label for="schdulCn">${title}</label> <span class="pilsu">*</span></th>
			<td class="left">
			
				<c:out value="${fn:replace(diaryManageVO.schdulCn , crlf , '<br/>')}" escapeXml="false" />
				<div style="display:none"><form:input path="schdulCn" /></div>
				<div style="display:none"><form:input path="schdulId" /></div>
				<div><form:errors path="schdulId" cssClass="error"/></div>
				<div><form:errors path="schdulCn" cssClass="error"/></div>

			</td>
		</tr>
		<!-- 일지명 -->
		<c:set var="title"><spring:message code="comCopSmtDsm.regist.diaryNm"/></c:set>
		<tr>
			<th><label for="diaryNm">${title}</label> <span class="pilsu">*</span></th>
			<td class="nopd">
				<form:input path="diaryNm" size="73" cssClass="txaIpt" maxlength="255"/>
				<div><form:errors path="diaryNm" cssClass="error"/></div>
			</td>
		</tr>
		<!-- 지시사항 -->
		<c:set var="title"><spring:message code="comCopSmtDsm.regist.drctMatter"/></c:set>
		<tr>
			<th><label for="drctMatter">${title}</label> <span class="pilsu">*</span></th>
			<td class="nopd">
				<form:textarea path="drctMatter" rows="3" cols="20" cssClass="txaClass"/>
				<div><form:errors path="drctMatter" cssClass="error"/></div>
			</td>
		</tr>
		<!-- 특이사항 -->
		<c:set var="title"><spring:message code="comCopSmtDsm.regist.partclrMatter"/></c:set>
		<tr>
			<th><label for="partclrMatter">${title}</label> <span class="pilsu">*</span></th>
			<td class="nopd">
				<form:textarea path="partclrMatter" rows="3" cols="20" cssClass="txaClass"/>
				<div><form:errors path="partclrMatter" cssClass="error"/></div>
			</td>
		</tr>
		<!-- 진척율 -->
		<c:set var="title"><spring:message code="comCopSmtDsm.regist.diaryProcsPte"/></c:set>
		<tr>
			<th><label for="diaryProcsPte">${title}</label> <span class="pilsu">*</span></th>
			<td class="nopd">
  				<form:input path="diaryProcsPte" size="3" cssClass="txaIpt" maxlength="3" style="width:10%;" /> %
  				<div><form:errors path="diaryProcsPte" cssClass="error"/></div>
			</td>
		</tr>
		<!-- 첨부파일 -->
		<c:set var="title"><spring:message code="comCopSmtDsm.regist.Atch"/></c:set>
		<tr>
			<th><label for="infoProvdAgreCn">${title}</label> </th>
			<td class="nopd">

			<c:import charEncoding="utf-8" url="/cmm/fms/selectFileInfs.do" >
				<c:param name="param_atchFileId" value="${diaryManageVO.atchFileId}" />
			</c:import>
			
	 <c:if test="${diaryManageVO.atchFileId eq null || diaryManageVO.atchFileId eq ''}">
	  	<input type="hidden" name="fileListCnt" value="0" />
	  	<input name="atchFileAt" type="hidden" value="N">
	  </c:if>
	
	  <c:if test="${diaryManageVO.atchFileId ne null && diaryManageVO.atchFileId ne ''}">
	  	<input name="atchFileAt" type="hidden" value="Y">
	  </c:if>
	    <div id="file_upload_posbl"  style="display:none;" >
            <table width="500px" cellspacing="0" cellpadding="0" border="0" align="left" class="UseTable">
			    <tr>
			        <td style="padding:0px 0px 0px 0px;margin:0px 0px 0px 0px;"><input name="file_1" id="egovComFileUploader" type="file" title="첨부파일명 입력"/></td>
			    </tr>
			    <tr>
			        <td style="padding:0px 0px 0px 0px;margin:0px 0px 0px 0px;">
			        	<div id="egovComFileList"></div>
			        </td>
			    </tr>
   	        </table>
		</div>
		<div id="file_upload_imposbl"  style="display:none;" >
            <table width="500px" cellspacing="0" cellpadding="0" border="0" align="left" class="UseTable">
			    <tr>
			        <td style="padding:0px 0px 0px 0px;margin:0px 0px 0px 0px;"><spring:message code="common.imposbl.fileupload" /></td>
			    </tr>
   	        </table>
		</div>
			</td>
		</tr>
	</tbody>
	</table>
	
	<!-- 하단 버튼 -->
	<div class="btn">
		<input type="submit" class="s_submit" value="<spring:message code="button.save" />" title="<spring:message code="button.save" /> <spring:message code="input.button" />" />
		<span class="btn_s"><a href="<c:url value='/cop/smt/dsm/EgovDiaryManageList.do' />"  title="<spring:message code="button.list" />  <spring:message code="input.button" />"><spring:message code="button.list" /></a></span>
	</div><div style="clear:both;"></div>
	
</div><!-- div end(wTableFrm)  -->

<input type="hidden" name="posblAtchFileNumber" value="3" />
<input name="diaryId" id="diaryId" type="hidden" value="${diaryManageVO.diaryId}">
<input name="cmd" id="cmd" type="hidden" value="<c:out value='save'/>"/>
</form:form>

</body>
</html>
