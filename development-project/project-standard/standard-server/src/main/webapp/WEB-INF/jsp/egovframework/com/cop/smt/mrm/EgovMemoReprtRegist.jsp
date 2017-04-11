<%
/**
 * @Class Name : EgovMemoReprtRegist.jsp
 * @Description : 메모보고 등록
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
<c:set var="CssUrl" value="/css/egovframework/com/"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>" ></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="memoReprtVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript">
	//웹에디터설정
	_editor_area = "reprtCn";
	_editor_url = "<c:url value='/html/egovframework/com/cmm/utl/htmlarea3.0/'/>";

	function fn_egov_init_MemoReprt(){
	   var maxFileNum = document.getElementById('posblAtchFileNumber').value;

	   if(maxFileNum==null || maxFileNum==""){
	     	maxFileNum = 3;
	    }

	   var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum );

	   multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );
	}

	function fn_egov_insert_memoreprt() {

		if( editor.getHTML() == "" ){
			alert("보고내용은 필수 입력값입니다.");
			return;
		}else{
			document.memoReprtVO.reprtCn.value = editor.getHTML()
		}

		if (!validateMemoReprtVO(document.memoReprtVO)){
			return;
		}

		if (confirm('<spring:message code="common.regist.msg" />')) {
			document.memoReprtVO.action = "<c:url value='/cop/smt/mrm/insertMemoReprt.do'/>";
			document.memoReprtVO.submit();
		}
	}

	/* ********************************************************
	 * 목록 으로 가기
	 ******************************************************** */
	function fn_egov_list_memoreprt(){
		document.memoReprtVO.action = "<c:url value='/cop/smt/mrm/selectMemoReprtList.do'/>";
		document.memoReprtVO.submit();
	}


	/* ********************************************************
	* 아이디  팝업창열기
	******************************************************** */
	function fn_egov_reportr_MemoReprt(strTitle, frmUniqId, frmEmplNo, frmEmplyrNm, frmOrgnztNm){
		var arrParam = new Array(6);
		arrParam[0] = window;
		arrParam[1] = strTitle;
		arrParam[2] = frmUniqId;
		arrParam[3] = frmEmplNo;
		arrParam[4] = frmEmplyrNm;
		arrParam[5] = frmOrgnztNm;

	 	window.showModalDialog("<c:url value='/cop/smt/mrm/selectReportrListPopup.do' />", arrParam,"dialogWidth=800px;dialogHeight=500px;resizable=yes;center=yes");
	}
</script>
<script type="text/javascript" src="<c:url value='/html/egovframework/com/cmm/utl/htmlarea3.0/htmlarea.js'/>"></script>
<title>메모보고 등록</title>
</head>
<body onLoad="fn_egov_init_MemoReprt();HTMLArea.init(); HTMLArea.onload = initEditor;">

<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<div id="border" style="width:730px">

<form:form commandName="memoReprtVO" name="memoReprtVO" method="post" action="${pageContext.request.contextPath}/cop/smt/mrm/insertMemoReprt.do' />" enctype="multipart/form-data">

	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="100%"class="title_left">
	   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">
	   &nbsp;메모보고 등록</h1></td>
	 </tr>
	</table>

	<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register"  summary="이 표는 메모보고 정보를  등록하기 위한 표이며, 보고일자, 작성자, 보고대상자, 보고제목, 보고내용, 파일첨부 정보로 구성되어 있습니다 .">
	<caption>메모보고 등록</caption>
	<tbody>
	  <tr>
		<th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="reprtDe">보고일자</label><img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
		<td width="80%" >
			<form:input path="reprtDe" size="10" maxlength="10" title="보고일자"/>
			<input type="hidden" name="cal_url" id="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" >
		    <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(document.forms[0], document.forms[0].reprtDe);">
		    <img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" style="border:0px;vertical-align: bottom" alt="달력창팝업버튼이미지">
		    </a>
			<div><form:errors path="reprtDe" cssClass="error"/></div>
		</td>
	  </tr>
	  <tr>
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >작성자<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <c:out value="${memoReprtVO.wrterClsfNm}" escapeXml="false" />
	      &nbsp;
	      <c:out value="${memoReprtVO.wrterNm}" escapeXml="false" />
	      <input type="hidden" name="wrterId" id="wrterId" value="${memoReprtVO.wrterId}"/>
	      <input type="hidden" name="wrterNm" id="wrterNm" value="${memoReprtVO.wrterNm}"/>
	      <input type="hidden" name="wrterClsfNm" id="wrterClsfNm" value="${memoReprtVO.wrterClsfNm}"/>
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
				<a href="<c:url value='/cop/smt/mrm/selectReportrListPopup.do' />" target="_blank"   title="새 창으로 이동"  onClick="fn_egov_reportr_MemoReprt('보고대상', 'reportrId', '', 'reportrNm', '');return false;">
				<img src="<c:url value='/images/egovframework/com/cmm/icon/search.gif' />" style="border:0px" alt="보고대상 검색" title="보고대상 검색">
				</a>
				</td>
			</tr>
			</table>
			<div><form:errors path="reportrNm" cssClass="error"/></div>
	       <form:hidden path="reportrId" />

	    </td>
	  </tr>
	  <tr>
	    <th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="reprtSj">보고제목</label><img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <form:input path="reprtSj" size="75" maxlength="255" title="제목"/>
	      <div><form:errors path="reprtSj" cssClass="error"/></div>
	    </td>
	  </tr>
	  <tr>
	    <th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="reprtCn">보고내용</label><img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <form:textarea path="reprtCn" rows="35" cols="95" title="보고내용"/>
    	  <div><form:errors path="reprtCn" cssClass="error"/></div>
	    </td>
	  </tr>
	  <!-- 첨부파일 테이블 레이아웃 설정 -->
	  <tr>
		<th scope="row" height="23" class="required_text" nowrap>파일첨부<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="선택항목"></th>
		<td>
	    	<table width="580px" cellspacing="0" cellpadding="0" border="0" align="center" class="UseTable">
				<tr>
					<td><input name="file_1" id="egovComFileUploader" type="file" title="파일첨부"/></td>
				</tr>
				<tr>
					<td>
				    	<div id="egovComFileList"></div>
				    </td>
				</tr>
	   	    </table>
		 </td>
	  </tr>
	  <!-- //첨부파일 테이블 레이아웃 설정 -->
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
	  <td><span class="button"><input type="submit" value="<spring:message code="button.save" />" onclick="fn_egov_insert_memoreprt(); return false;"></span></td>
      <td>&nbsp;&nbsp;</td>
      <td><span class="button"><a href="<c:url value='/cop/smt/mrm/selectMemoReprtList.do'/>?searchWrd=<c:out value='${memoReprtVO.searchWrd}'/>&amp;searchCnd=<c:out value='${memoReprtVO.searchCnd}'/>&amp;pageIndex=<c:out value='${memoReprtVO.pageIndex}'/>&amp;searchSttus=<c:out value='${memoReprtVO.searchSttus}'/>&amp;searchDrctMatter=<c:out value='${memoReprtVO.searchDrctMatter}'/>&amp;searchBgnDe=<c:out value='${memoReprtVO.searchBgnDe}'/>&amp;searchEndDe=<c:out value='${memoReprtVO.searchEndDe}'/>" onclick="fn_egov_list_memoreprt(); return false;"><spring:message code="button.list" /></a></span></td>
	</tr>
	</table>
	</div>
	<!-- 첨부파일 갯수 -->
	<input type="hidden" name="posblAtchFileNumber" id="posblAtchFileNumber" value="3" />
	<!-- //첨부파일 갯수 -->
	<!-- 검색조건 유지 -->
    <input type="hidden" name="searchWrd" value="<c:out value='${memoReprtVO.searchWrd}'/>" />
    <input type="hidden" name="searchCnd" value="<c:out value='${memoReprtVO.searchCnd}'/>" />
    <input type="hidden" name="pageIndex" value="<c:out value='${memoReprtVO.pageIndex}'/>" />
    <input type="hidden" name="searchSttus" value="<c:out value='${memoReprtVO.searchSttus}'/>" />
    <input type="hidden" name="searchDrctMatter" value="<c:out value='${memoReprtVO.searchDrctMatter}'/>" />
    <input type="hidden" name="searchBgnDe" value="<c:out value='${memoReprtVO.searchBgnDe}'/>" />
    <input type="hidden" name="searchEndDe" value="<c:out value='${memoReprtVO.searchEndDe}'/>" />
    <!-- 검색조건 유지 -->
</form:form>

</div>

</body>
</html>
