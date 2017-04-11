<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
 /**
  * @Class Name : EgovFaqCnUpdt.jsp
  * @Description : EgovFaqCnUpdt 화면
  * @Modification Information
  * @
  * @ 수정일   		수정자		수정내용
  * @ ----------	------		---------------------------
  * @ 2009.02.01	박정규		최초 생성
  * @ 2011.07.18	옥찬우		경로수정( Line 161 : /com/cmm/fms/selectFileInfs.do -> /cmm/fms/selectFileInfs.do )
  * @ 2011.07.20	옥찬우		<Input> Tag id 속성추가( Line : 113 )
  * @							파일 첨부 갯수 제한기능을 위한 내용추가 ( Line : 200 ~ 206 )
  *
  *  @author 공통서비스팀
  *  @since 2009.02.01
  *  @version 1.0
  *  @see
  *
  **/
%>

<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<html lang="ko">
<head>
<title>FAQ내용수정</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />">
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>" ></script>

<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="faqManageVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_faqcn(){

	// 첫 입력란에 포커스..
	faqManageVO.qestnSj.focus();

}

/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_updt_faqcn(form, faqId){

	// 서버사이드 테스트용
	/*
		form.action = "<c:url value='/uss/olh/faq/FaqCnUpdt.do'/>";
		form.submit();
		return;
	*/

	if (!validateFaqManageVO(form)) {

		return;

	} else {

		if	(confirm("수정하시겠습니까?"))	{

			// form.faqId.value = faqId; 주석처리
			form.action = "<c:url value='/uss/olh/faq/FaqCnUpdt.do'/>";
			form.submit();

		}



	}

}

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_inqire_faqcnlist() {

	faqManageVO.action = "<c:url value='/uss/olh/faq/FaqListInqire.do'/>";
	faqManageVO.submit();

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


</script>
</head>
<body onLoad="fn_egov_initl_faqcn();">
<DIV id="content" style="width:712px">

<!-- 상단타이틀 파일첨부를 위한 폼명 및 Enctype 설정-->
<form:form commandName="faqManageVO" action="${pageContext.request.contextPath}/uss/olh/faq/FaqCnUpdt.do" method="post"  enctype="multipart/form-data">

<!-- FaqCnUpdtView.do Call을 위한 처리-->
<input name="faqId" type="hidden" value="<c:out value='${result.faqId}'/>">

<!-- 첨부파일을 위한 Hidden -->
<input type="hidden" name="posblAtchFileNumber" id="posblAtchFileNumber" value="3">

<!-- 첨부파일 삭제 후 리턴 URL -->
<input type="hidden" name="returnUrl" id="returnUrl" value="<c:url value='/uss/olh/faq/FaqCnUpdtView.do'/>"/>

<!-- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="left" alt="제목아이콘이미지">&nbsp;FAQ내용수정</h1></td>
 </tr>
</table>

<!-- 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<!-- 등록  폼 영역  -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="FAQ에 대한 정보를 수정합니다.">
<caption>FAQ내용수정</caption>
  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="qestnSj">질문제목</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수항목"></th>
    <td width="80%" nowrap>
        <form:input path="qestnSj" size="70" maxlength="70" title="질문제목"/>
    	<div><form:errors path="qestnSj"/></div>
    </td>
  </tr>

  <tr>
    <th scope="row" height="23" class="required_text" ><label for="qestnCn">질문내용</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수항목"></th>
    <td>
      <form:textarea path="qestnCn" cols="300" rows="15" cssClass="txaClass"  title="질문내용"/>
      <div><form:errors path="qestnCn"/></div>
    </td>
  </tr>

  <tr>
    <th scope="row" height="23" class="required_text" ><label for="answerCn">답변내용</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수항목"></th>
    <td>
      <form:textarea path="answerCn" cols="300" rows="15" cssClass="txaClass"  title="답변내용"/>
      <div><form:errors path="answerCn"/></div>
    </td>
  </tr>

 <!-- 첨부목록을 보여주기 위한 -->
  <c:if test="${result.atchFileId != ''}">
	<tr>
		<th scope="row" height="23" class="required_text">첨부파일 목록&nbsp;&nbsp;</th>
		    <td >
				<c:import charEncoding="utf-8" url="/cmm/fms/selectFileInfs.do" >
					<c:param name="param_atchFileId" value="${result.atchFileId}" />
				</c:import>
		    </td>
	</tr>
  </c:if>

	<c:if test="${result.atchFileId == null}">
		<input type="hidden" name="fileListCnt" id="fileListCnt" value="0" >
		<input name="atchFileAt" id="atchFileAt" type="hidden" value="N">
	</c:if>

	<c:if test="${result.atchFileId != null}">
		<input name="atchFileAt" id="atchFileAt" type="hidden" value="Y">
	</c:if>



 <!--첨부화일 업로드를 위한 Start -->
  <tr>
	<th height="23" class="required_text"><label for="file_1">파일첨부&nbsp;&nbsp;</label></th>
		<td colspan="3">
		    <div id="file_upload_posbl" >
	            <table width="580px" cellspacing="0" cellpadding="0" border="0" align="center" class="UseTable">
				    <tr>
				        <td><input name="file_1" id="egovComFileUploader" type="file" title="파일첨부" /></td>
				    </tr>
				    <tr>
				        <td>
				        	<div id="egovComFileList"></div>
				        </td>
				    </tr>
	   	        </table>
			</div>
			<div id="file_upload_imposbl"  style="display:none;" >
                <table width="580px" cellspacing="0" cellpadding="0" border="0" align="center" class="UseTable">
                    <tr>
                        <td><spring:message code="common.imposbl.fileupload" /></td>
                    </tr>
                </table>
            </div>
		</td>
  </tr>
 <!-- 첨부화일 업로드를 위한 end..-->

</table>

<!-- 첨부파일 업로드 가능화일 설정(Update) Start..-->
<script type="text/javascript">

var existFileNum = null;
	var maxFileNum = null;

	if (document.getElementById('fileListCnt') != null) {
	    existFileNum = document.getElementById('fileListCnt').value;
	}

	if (document.getElementById('posblAtchFileNumber') != null) {
	    maxFileNum = document.getElementById('posblAtchFileNumber').value;
	}

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

</script>
<!-- 첨부파일 업로드 가능화일 설정(Update) End.-->


<!-- 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<!-- 목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td><span class="button"><input type="submit" value="<spring:message code="button.update" />" onclick="fn_egov_updt_faqcn(document.forms[0],'<c:out value="${result.faqId}"/>'); return false;" ></span></td>
  <td>&nbsp;&nbsp;</td>
  <td><span class="button"><a href="<c:url value='/uss/olh/faq/FaqListInqire.do'/>" onclick="fn_egov_inqire_faqcnlist(); return false;"><spring:message code="button.list" /></a></span></td>
  <td>&nbsp;&nbsp;</td>
</tr>
</table>


</form:form>
</DIV>

</body>
</html>
