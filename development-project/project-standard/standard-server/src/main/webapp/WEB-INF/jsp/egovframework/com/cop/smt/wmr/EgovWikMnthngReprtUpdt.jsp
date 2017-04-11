<%
/**
 * @Class Name : EgovWikMnthngReprtUpdt.jsp
 * @Description : 주간/월간보고 수정
 * @Modification Information
 * @
 * @  수정일      수정자            수정내용
 * @ -------        --------    ---------------------------
 * @ 2010.07.21   장철호          최초 생성
 *
 *  @author 공통컴포넌트개발팀 장철호
 *  @since 2010.07.21
 *  @version 1.0
 *  @see
 *
 */
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="ImgUrl" value="/images/egovframework/com/cmm/"/>
<c:set var="CssUrl" value="/css/egovframework/com/cop/smt/wmr/"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/utl/EgovCmmUtl.js' />"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="wikMnthngReprtVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript">
	function fn_egov_init_WikMnthngReprt(){
		var existFileNum = document.wikMnthngReprtVO.fileListCnt.value;
		var maxFileNum = document.wikMnthngReprtVO.posblAtchFileNumber.value;


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

	function fn_egov_update_wikmnthngreprt() {
		if (!validateWikMnthngReprtVO(document.wikMnthngReprtVO)){
			return;
		}

		var bgnDe = document.wikMnthngReprtVO.reprtBgnDe.value.split("-").join("");
		var endDe = document.wikMnthngReprtVO.reprtEndDe.value.split("-").join("");

		if(bgnDe != ""){
			if(isDate(bgnDe, "해당시작일자") == false) {
		        return;
		    }
		}

		if(endDe != ""){
		    if(isDate(endDe, "해당종료일자") == false) {
		        return;
		    }
		}

		if(bgnDe != "" && endDe != ""){
			if(eval(bgnDe) > eval(endDe)){
				alert("해당종료일자가 해당시작일자보다 빠를수 없습니다.");
				return;
			}
		}

		if (confirm('<spring:message code="common.regist.msg" />')) {
			document.wikMnthngReprtVO.action = "<c:url value='/cop/smt/wmr/updateWikMnthngReprt.do'/>";
			document.wikMnthngReprtVO.submit();
		}
	}

	/* ********************************************************
	 * 목록 으로 가기
	 ******************************************************** */
	function fn_egov_list_wikmnthngreprt(){
		document.wikMnthngReprtVO.action = "<c:url value='/cop/smt/wmr/selectWikMnthngReprtList.do'/>";
		document.wikMnthngReprtVO.submit();
	}


	/* ********************************************************
	* 아이디  팝업창열기
	******************************************************** */
	function fn_egov_reportr_WikMnthngReprt(strTitle, frmUniqId, frmEmplNo, frmEmplyrNm, frmOrgnztNm){
		var arrParam = new Array(6);
		arrParam[0] = window;
		arrParam[1] = strTitle;
		arrParam[2] = frmUniqId;
		arrParam[3] = frmEmplNo;
		arrParam[4] = frmEmplyrNm;
		arrParam[5] = frmOrgnztNm;

	 	window.showModalDialog("<c:url value='/cop/smt/wmr/selectReportrListPopup.do' />", arrParam,"dialogWidth=800px;dialogHeight=500px;resizable=yes;center=yes");
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
<title>주간/월간보고 수정</title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>


</head>
<body onLoad="fn_egov_init_WikMnthngReprt()">

<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<div id="border" style="width:730px">

<form:form commandName="wikMnthngReprtVO" name="wikMnthngReprtVO" method="post" action="${pageContext.request.contextPath}/cop/smt/wmr/updateWikMnthngReprt.do' />" enctype="multipart/form-data">

	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="100%"class="title_left">
	   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">
	   &nbsp;주간/월간보고 수정</h1></td>
	 </tr>
	</table>

	<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="이 표는 주간/월간보고 정보를 수정하기 위한 표이며, 보고유형, 보고일자, 해당일자, 작성자, 보고대상자, 보고서제목, 금주보고내용, 차주보고내용, 특이사항, 파일첨부 , 보고서상태 정보로 구성되어 있습니다 .">
	<caption>주간/월간보고 수정</caption>
	<tbody>
	  <tr>
		<th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="reprtSe">보고유형</label><img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
		<td width="80%" >
			<form:radiobutton path="reprtSe" value="1" />주간보고
	       <form:radiobutton path="reprtSe" value="2" />월간보고
	       <div><form:errors path="reprtSe" cssClass="error"/></div>
		</td>
	  </tr>
	  <tr>
		<th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="reprtDe">보고일자</label><img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
		<td width="80%" >
			<input type="hidden" name="cal_url" id="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" >
			<form:input path="reprtDe" size="10" maxlength="10" title="보고일자"/>
		    <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(document.forms[0], document.forms[0].reprtDe);">
		    <img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" style="border:0px;vertical-align: bottom" alt="달력창팝업버튼이미지">
		    </a>
			<div><form:errors path="reprtDe" cssClass="error"/></div>
		</td>
	  </tr>
	  <tr>
		<th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="reprtBgnDe">해당일자</label><img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
		<td width="80%" >
			<form:input path="reprtBgnDe" size="10" maxlength="10" title="해당 시작일자"/>
		    <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(document.forms[0], document.forms[0].reprtBgnDe);">
		    <img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" style="border:0px;vertical-align: bottom" alt="달력창팝업버튼이미지">
		    </a>

		    <form:input path="reprtEndDe" size="10" maxlength="10" title="해당 종료일자"/>
		    <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(document.forms[0], document.forms[0].reprtEndDe);">
		    <img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" style="border:0px;vertical-align: bottom" alt="달력창팝업버튼이미지">
		    </a>
			<div><form:errors path="reprtBgnDe" cssClass="error"/></div>
			<div><form:errors path="reprtEndDe" cssClass="error"/></div>
		</td>
	  </tr>
	  <tr>
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >작성자<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <c:out value="${wikMnthngReprtVO.wrterClsfNm}" escapeXml="false" />
	      &nbsp;
	      <c:out value="${wikMnthngReprtVO.wrterNm}" escapeXml="false" />
	      <input type="hidden" name="wrterId" id="wrterId" value="${wikMnthngReprtVO.wrterId}"/>
	      <input type="hidden" name="wrterNm" id="wrterNm" value="${wikMnthngReprtVO.wrterNm}"/>
	      <input type="hidden" name="wrterClsfNm" id="wrterClsfNm" value="${wikMnthngReprtVO.wrterClsfNm}"/>
	    </td>
	  </tr>
	  <tr>
	    <th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="reportrNm">보고대상자</label><img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
			<table cellspacing="0" cellpadding="0" border="0">
			<tr>
				<td width="100px" style="padding:0px 0px 0px 0px;margin:0px 0px 0px 0px;">
				<form:input path="reportrNm" size="15" readonly="true" maxlength="10" title="보고대상명"/>
				</td>
				<td style="padding:0px 0px 0px 2px;margin:0px 0px 0px 0px;">
				<a href="<c:url value='/cop/smt/wmr/selectReportrListPopup.do' />" target="_blank"  title="새 창으로 이동"  onClick="fn_egov_reportr_WikMnthngReprt('보고대상자', 'reportrId', '', 'reportrNm', '');return false;">
				<img src="${ImgUrl}icon/search.gif" style="border:0px" alt="보고대상자 검색" title="보고대상자 검색">
				</a>
				</td>
			</tr>
			</table>
			<div><form:errors path="reportrNm" cssClass="error"/></div>
	       <form:hidden path="reportrId" />

	    </td>
	  </tr>
	  <tr>
	    <th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="reprtSj">보고서제목</label><img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <form:input path="reprtSj" size="75" maxlength="255" title="보고서제목"/>
	      <div><form:errors path="reprtSj" cssClass="error"/></div>
	    </td>
	  </tr>
	  <tr>
	    <th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="reprtThswikCn">금주보고내용</label><img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <form:textarea path="reprtThswikCn" rows="7" cols="90" title="금주보고내용"/>
    	  <div><form:errors path="reprtThswikCn" cssClass="error"/></div>
	    </td>
	  </tr>
	  <tr>
	    <th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="reprtLesseeCn">차주보고내용</label><img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <form:textarea path="reprtLesseeCn" rows="7" cols="90" title="차주보고내용"/>
    	  <div><form:errors path="reprtLesseeCn" cssClass="error"/></div>
	    </td>
	  </tr>
	  <tr>
	    <th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="partclrMatter">특이사항</label><img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="선택항목"></th>
	    <td width="80%" >
	      <form:textarea path="partclrMatter" rows="5" cols="90" title="특이사항"/>
    	  <div><form:errors path="partclrMatter" cssClass="error"/></div>
	    </td>
	  </tr>
	  <!-- 첨부목록 -->
		  <c:if test="${wikMnthngReprtVO.atchFileId ne null && wikMnthngReprtVO.atchFileId ne ''}">
			<tr>
				<th scope="row" height="23" class="required_text">첨부파일 목록<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="선택항목"></th>
			    <td>
					<c:import charEncoding="utf-8" url="/cmm/fms/selectFileInfsForUpdate.do" >
						<c:param name="param_atchFileId" value="${wikMnthngReprtVO.atchFileId}" />
					</c:import>
			    </td>
			</tr>
		  </c:if>
	 <!-- //첨부목록 -->

	 <!-- 첨부화일 업로드 -->
		  <tr>
			<th scope="row" height="23" class="required_text"><label for="file_1">파일첨부</label><img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="선택항목"></th>
			<td style="padding:0px 0px 0px 0px;margin:0px 0px 0px 0px;" >
			    <div id="file_upload_posbl"  style="display:none;" >
		            <table width="500px" cellspacing="0" cellpadding="0" border="0" align="left" class="UseTable">
					    <tr>
					        <td style="padding:0px 0px 0px 0px;margin:0px 0px 0px 0px;"><input name="file_1" id="egovComFileUploader" type="file" title="파일첨부"/></td>
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
    <!-- //첨부화일 업로드 -->
	    <tr>
		    <th scope="row" width="20%" height="23" class="required_text" nowrap >보고서 상태<img src="${ImgUrl}icon/no_required.gif" width="15" height="15" alt="선택항목"></th>
		    <td width="80%" >
		      <c:out value="${wikMnthngReprtVO.reprtSttus}" escapeXml="false" />
		    </td>
		  </tr>
	</tbody>
	</table>

	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="10"></td>
	  </tr>
	</table>
  	<div align="center">
	<table border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
	  <td><span class="button"><input type="submit" value="<spring:message code="button.save" />" onclick="fn_egov_update_wikmnthngreprt(); return false;"></span></td>
      <td>&nbsp;&nbsp;</td>
      <td><span class="button"><a href="<c:url value='/cop/smt/wmr/selectWikMnthngReprtList.do'/>?searchWrd=<c:out value='${wikMnthngReprtVO.searchWrd}'/>&amp;searchCnd=<c:out value='${wikMnthngReprtVO.searchCnd}'/>&amp;pageIndex=<c:out value='${wikMnthngReprtVO.pageIndex}'/>&amp;searchSttus=<c:out value='${wikMnthngReprtVO.searchSttus}'/>&amp;searchDe=<c:out value='${wikMnthngReprtVO.searchDe}'/>&amp;searchBgnDe=<c:out value='${wikMnthngReprtVO.searchBgnDe}'/>&amp;searchEndDe=<c:out value='${wikMnthngReprtVO.searchEndDe}'/>" onclick="fn_egov_list_wikmnthngreprt(); return false;"><spring:message code="button.list" /></a></span></td>
	</tr>
	</table>
	</div>

	<input type="hidden" name="returnUrl" value="<c:url value='/cop/smt/wmr/modifyWikMnthngReprt.do' />" />
	<form:hidden path="reprtId" />
	<!-- 첨부파일 갯수를 위한 hidden -->
	<c:if test="${wikMnthngReprtVO.atchFileId eq null || wikMnthngReprtVO.atchFileId eq ''}">
	 	<input type="hidden" name="fileListCnt" value="0" />
	 	<input type="hidden" name="atchFileAt" value="N">
	</c:if>

	<c:if test="${wikMnthngReprtVO.atchFileId ne null && wikMnthngReprtVO.atchFileId ne ''}">
	 	<input type="hidden" name="atchFileAt" value="Y">
	</c:if>
	<input type="hidden" name="posblAtchFileNumber" id="posblAtchFileNumber" value="3" />
	<!-- //첨부파일 갯수를 위한 hidden -->

	<!-- 검색조건 유지 -->
    <input type="hidden" name="searchWrd" value="<c:out value='${wikMnthngReprtVO.searchWrd}'/>" />
    <input type="hidden" name="searchCnd" value="<c:out value='${wikMnthngReprtVO.searchCnd}'/>" />
    <input type="hidden" name="pageIndex" value="<c:out value='${wikMnthngReprtVO.pageIndex}'/>" />
    <input type="hidden" name="searchSttus" value="<c:out value='${wikMnthngReprtVO.searchSttus}'/>" />
    <input type="hidden" name="searchDe" value="<c:out value='${wikMnthngReprtVO.searchDe}'/>" />
    <input type="hidden" name="searchBgnDe" value="<c:out value='${wikMnthngReprtVO.searchBgnDe}'/>" />
    <input type="hidden" name="searchEndDe" value="<c:out value='${wikMnthngReprtVO.searchEndDe}'/>" />
    <!-- 검색조건 유지 -->
</form:form>

</div>

</body>
</html>
