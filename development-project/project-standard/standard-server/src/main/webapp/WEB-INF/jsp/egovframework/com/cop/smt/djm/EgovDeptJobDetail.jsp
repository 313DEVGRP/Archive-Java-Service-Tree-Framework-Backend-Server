<%
/**
 * @Class Name : EgovDeptJobDetail.jsp
 * @Description : 부서업무 상세보기
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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<c:set var="ImgUrl" value="/images/egovframework/com/cmm/"/>
<c:set var="CssUrl" value="/css/egovframework/com/cop/smt/djm/"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>" ></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<!-- showmodal 대체처리  -->
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/showModalDialog.js'/>" ></script>
<validator:javascript formName="deptJobVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript">
	function fn_egov_init_DeptJob(){

	}

	function fn_egov_modify_deptjob() {
		document.deptJobVO.action = "<c:url value='/cop/smt/djm/modifyDeptJob.do'/>";
		document.deptJobVO.submit();
	}

	function fn_egov_delete_deptjob(){
		if(confirm("삭제 하시겠습니까?")){
			document.deptJobVO.action = "<c:url value='/cop/smt/djm/deleteDeptJob.do'/>";
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
	* 부서  팝업창열기
	******************************************************** */
	function fn_egov_dept_Dept(strType){
		var arrParam = new Array(1);
		arrParam[0] = window;
		arrParam[1] = strType;

		window.showModalDialog("<c:url value='/cop/smt/djm/selectDeptListPopup.do' />", arrParam,"dialogWidth=800px;dialogHeight=500px;resizable=yes;center=yes");
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
	function fn_egov_charger_DeptJob(strType){
		var arrParam = new Array(1);
		arrParam[0] = window;
		arrParam[1] = strType;

	 	window.showModalDialog("<c:url value='/uss/ion/ism/selectSanctnerListPopup.do' />", arrParam,"dialogWidth=800px;dialogHeight=500px;resizable=yes;center=yes");
	}
</script>
<title>부서업무 상세보기</title>
</head>
<body onLoad="fn_egov_init_DeptJob()">

<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<div id="border" style="width:730px">

<form:form commandName="deptJobVO" name="deptJobVO" method="post" action="${pageContext.request.contextPath}/cop/smt/djm/modifyDeptJob.do" >

	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="100%"class="title_left">
	   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">
	   &nbsp;부서업무 상세보기</h1></td>
	 </tr>
	</table>

	<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register"  summary="이 표는 부서업무 정보를 제공하며, 부서, 부서업무함명, 제목, 내용, 업무담당자, 우선순위, 파일첨부 정보로 구성되어 있습니다 .">
	<caption>부서업무 상세보기</caption>
	<tbody>
	  <tr>
		<th scope="row" width="20%" height="23" class="required_text" nowrap >부서<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
		<td width="80%" >
			 <c:out value="${deptJob.deptNm}" escapeXml="false" />
		</td>
	  </tr>
	  <tr>
		<th scope="row" width="20%" height="23" class="required_text" nowrap >부서업무함명<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
		<td width="80%" >
			<c:out value="${deptJob.deptJobBxNm}" escapeXml="false" />
		</td>
	  </tr>
	  <tr>
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >제목<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      	<c:out value="${deptJob.deptJobNm}" escapeXml="false" />
	    </td>
	  </tr>
	  <tr>
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >내용<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <br/>
	      <c:out value="${fn:replace(deptJob.deptJobCn , crlf , '<br>')}" escapeXml="false" />
	      <br/><br/>
	    </td>
	  </tr>
	   <tr>
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >업무담당자<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
			<c:out value="${deptJob.chargerNm}" escapeXml="false" />
	    </td>
	  </tr>
	  <tr>
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >우선순위<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%">
	       	<c:forEach items="${priort}" var="priortInfo" varStatus="status">
		    <c:if test="${priortInfo.code eq deptJob.priort}">
		     <c:out value="${priortInfo.codeNm}" escapeXml="false" />
		    </c:if>
		    </c:forEach>
	    </td>
	  </tr>
	  <!-- 첨부파일 테이블 레이아웃 -->
	  <tr>
		<th scope="row" height="23" class="required_text" nowrap>파일첨부<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="선택항목"></th>
		<td>
			<c:import charEncoding="utf-8" url="/cmm/fms/selectFileInfs.do" >
			<c:param name="param_atchFileId" value="${deptJob.atchFileId}" />
			</c:import>
		 </td>
	  </tr>
	 <!-- //첨부파일 테이블 레이아웃 -->
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
	  <td><span class="button"><input type="submit" value="<spring:message code="button.update" />" onclick="fn_egov_modify_deptjob(); return false;"></span></td>
      <td>&nbsp;&nbsp;</td>
	  <td><span class="button"><a href="<c:url value='/cop/smt/djm/deleteDeptJob.do'/>?deptJobId=<c:out value='${deptJobVO.deptJobId}'/>" onclick="fn_egov_delete_deptjob(); return false;"><spring:message code="button.delete" /></a></span></td>
      <td>&nbsp;&nbsp;</td>
      <td><span class="button"><a href="<c:url value='/cop/smt/djm/selectDeptJobList.do'/>?searchWrd=<c:out value='${deptJobVO.searchWrd}'/>&amp;searchCnd=<c:out value='${deptJobVO.searchCnd}'/>&amp;pageIndex=<c:out value='${deptJobVO.pageIndex}'/>&amp;searchDeptId=<c:out value='${deptJobVO.searchDeptId}'/>&amp;searchDeptJobBxId=<c:out value='${deptJobVO.searchDeptJobBxId}'/>" onclick="fn_egov_list_deptjob(); return false;"><spring:message code="button.list" /></a></span></td>
	</tr>
	</table>
	</div>
	<form:hidden path="deptJobId" />
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
