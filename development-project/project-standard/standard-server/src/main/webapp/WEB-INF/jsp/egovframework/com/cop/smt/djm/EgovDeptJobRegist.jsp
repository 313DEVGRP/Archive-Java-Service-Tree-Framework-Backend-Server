<% 
/**
 * @Class Name : EgovDeptJobRegist.jsp
 * @Description : 부서업무 등록
 * @Modification Information
 * @
 * @  수정일      수정자            수정내용
 * @ -------        --------    ---------------------------
 * @ 2010.07.12   장철호          최초 생성
 *
 *  @author 공통컴포넌트개발팀 장철호
 *  @since 2010.07.12
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
<c:set var="CssUrl" value="/css/egovframework/com/cop/smt/djm/"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>" ></script>

<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/showModalDialog.js'/>" ></script>

<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="deptJobVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript">
	function fn_egov_init_DeptJob(){
		var maxFileNum = document.getElementById('posblAtchFileNumber').value;
		   
	   if(maxFileNum==null || maxFileNum==""){
	     	maxFileNum = 3;
	    }
	        
	   var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum );
	   
	   multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );		
	   document.getElementsByName("priort")[1].checked = true;
	}

	function fn_egov_insert_deptjob() {
		if (!validateDeptJobVO(document.deptJobVO)){
			return;
		}
		
		if (confirm('<spring:message code="common.regist.msg" />')) {
			document.deptJobVO.action = "<c:url value='/cop/smt/djm/insertDeptJob.do'/>";
			document.deptJobVO.submit();					
		}
	}

	/* ********************************************************
	 * 목록 으로 가기
	 ******************************************************** */
	function fn_egov_list_deptjob(){
		document.deptJobVO.action = "<c:url value='/cop/smt/djm/selectDeptJobList.do'/>";
		document.deptJobVO.submit();	
	}	

	/* ********************************************************
	* 부서업무함  팝업창열기
	******************************************************** */
	function fn_egov_dept_DeptJobBx(strType){
		var arrParam = new Array(1);
		arrParam[0] = window;
		arrParam[1] = strType;
		arrParam[2] = document.deptJobVO.deptId.value;

		window.showModalDialog("<c:url value='/cop/smt/djm/selectDeptJobBxListPopup.do' />", arrParam,"dialogWidth=800px;dialogHeight=500px;resizable=yes;center=yes");
	}


	
	/* ********************************************************
	* 아이디  팝업창열기
	******************************************************** */
	function fn_egov_charger_DeptJob(strTitle, frmUniqId, frmEmplNo, frmEmplyrNm, frmOrgnztNm){
		var arrParam = new Array(6);
		arrParam[0] = window;
		arrParam[1] = strTitle;
		arrParam[2] = frmUniqId;
		arrParam[3] = frmEmplNo;
		arrParam[4] = frmEmplyrNm;
		arrParam[5] = frmOrgnztNm;

	 	window.showModalDialog("<c:url value='/cop/smt/djm/selectChargerListPopup.do' />", arrParam,"dialogWidth=800px;dialogHeight=500px;resizable=yes;center=yes");
	}

</script>
<title>부서업무 등록</title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>


</head>
<body onLoad="fn_egov_init_DeptJob()">

<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<div id="border" style="width:730px">

<form:form commandName="deptJobVO" name="deptJobVO" method="post" action="${pageContext.request.contextPath}/cop/smt/djm/insertDeptJob.do' />" enctype="multipart/form-data">

	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="100%"class="title_left">
	   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">
	   &nbsp;부서업무 등록</h1></td>
	 </tr>
	</table>
	
	<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="이 표는 부서업무 정보를  등록하기 위한 표이며, 부서, 부서업무함명, 제목, 내용, 업무담당자, 우선순위, 파일첨부 정보로 구성되어 있습니다 .">
	<caption>부서업무 등록</caption>
	<tbody>
	  <tr> 
		<th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="deptNm">부서</label><img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
		<td width="80%" >
			<input type="text" name="deptNm" id="deptNm" size="20" maxlength="20" title="부서" class="readOnlyClass" value="${deptJobVO.deptNm}" readOnly>
			<div><form:errors path="deptNm" cssClass="error"/></div>
		   <form:hidden path="deptId" /> 
		</td>
	  </tr>
	  <tr> 
		<th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="deptJobBxNm">부서업무함명</label><img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
		<td width="80%" >
			<table cellspacing="0" cellpadding="0" border="0">
			<tr>
				<td width="180px" style="padding:0px 0px 0px 0px;margin:0px 0px 0px 0px;">
				<form:input path="deptJobBxNm" size="30" readonly="true" maxlength="255" title="부서업무함명"/>
				</td>
				<td style="padding:0px 0px 0px 2px;margin:0px 0px 0px 0px;">
				<a href="<c:url value='/cop/smt/djm/selectDeptJobBxListPopup.do' />" target="_blank"  title="새 창으로 이동"  onClick="fn_egov_dept_DeptJobBx('typeDeptJobBx');return false;">
				<img src="<c:url value='/images/egovframework/com/cmm/icon/search.gif' />" style="border:0px" alt="부서업무함" title="부서업무함">
				</a>
				</td>
			</tr>
			</table>
			<div><form:errors path="deptJobBxNm" cssClass="error"/></div>
		   <form:hidden path="deptJobBxId" />
		</td>
	  </tr>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="deptJobNm">제목</label><img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <form:input path="deptJobNm" size="75" maxlength="255" title="제목"/>
	      <div><form:errors path="deptJobNm" cssClass="error"/></div>
	    </td>
	  </tr>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="deptJobCn">내용</label><img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <form:textarea path="deptJobCn" rows="5" cols="90" title="내용"/>
    	  <div><form:errors path="deptJobCn" cssClass="error"/></div>
	    </td>
	  </tr>
	   <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="chargerNm">업무담당자</label><img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
			<table cellspacing="0" cellpadding="0" border="0">
			<tr>
				<td width="100px" style="padding:0px 0px 0px 0px;margin:0px 0px 0px 0px;">
				<form:input path="chargerNm" size="73" cssClass="txaIpt" readonly="true" maxlength="10" title="담당자"/>
				</td>
				<td style="padding:0px 0px 0px 2px;margin:0px 0px 0px 0px;">
				<a href="<c:url value='/cop/smt/djm/selectChargerListPopup.do' />" target="_blank"  title="새 창으로 이동" onClick="fn_egov_charger_DeptJob('담당자', 'chargerId', '', 'chargerNm', '');return false;">
				<img src="<c:url value='/images/egovframework/com/cmm/icon/search.gif' />" style="border:0px" alt="담당자" title="담당자">
				</a>
				</td>
			</tr>
			</table>
			<div><form:errors path="chargerNm" cssClass="error"/></div>
	       <form:hidden path="chargerId" />       
	    </td>
	  </tr>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >우선순위<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%">
	       <form:radiobutton path="priort" value="1" />높음
	       <form:radiobutton path="priort" value="2" />보통
	       <form:radiobutton path="priort" value="3"/>낮음
	       <div><form:errors path="priort" cssClass="error"/></div>
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
	  <td><span class="button"><input type="submit" value="<spring:message code="button.save" />" onclick="fn_egov_insert_deptjob(); return false;"></span></td>
      <td>&nbsp;&nbsp;</td>
      <td><span class="button"><a href="<c:url value='/cop/smt/djm/selectDeptJobList.do'/>?searchWrd=<c:out value='${deptJobVO.searchWrd}'/>&amp;searchCnd=<c:out value='${deptJobVO.searchCnd}'/>&amp;pageIndex=<c:out value='${deptJobVO.pageIndex}'/>&amp;searchDeptId=<c:out value='${deptJobVO.searchDeptId}'/>&amp;searchDeptJobBxId=<c:out value='${deptJobVO.searchDeptJobBxId}'/>" onclick="fn_egov_list_deptjob(); return false;"><spring:message code="button.list" /></a></span></td>
	</tr>
	</table>
	</div>
	<!-- 첨부파일 갯수 -->
	<input type="hidden" name="posblAtchFileNumber" id="posblAtchFileNumber" value="3" />
	<!-- //첨부파일 갯수 -->
	<!-- 검색조건 유지 -->
    <input type="hidden" name="searchWrd" value="<c:out value='${deptJobVO.searchWrd}'/>" />
    <input type="hidden" name="searchCnd" value="<c:out value='${deptJobVO.searchCnd}'/>" />
    <input type="hidden" name="pageIndex" value="<c:out value='${deptJobVO.pageIndex}'/>" />
    <input type="hidden" name="searchDeptId" value="<c:out value='${deptJobVO.searchDeptId}'/>" />
    <input type="hidden" name="searchDeptJobBxId" value="<c:out value='${deptJobVO.searchDeptJobBxId}'/>" />
    <!-- 검색조건 유지 -->
</form:form>

</div>

</body>
</html>
