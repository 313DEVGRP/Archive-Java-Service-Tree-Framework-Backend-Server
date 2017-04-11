<% 
/**
 * @Class Name : EgovMemoReprtDetail.jsp
 * @Description : 메모보고 상세보기
 * @Modification Information
 * @
 * @  수정일      수정자            수정내용
 * @ -------        --------    ---------------------------
 * @ 2010.07.23   장철호          최초 생성
 *
 *  @author 공통컴포넌트개발팀 장철호
 *  @since 2010.07.23
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
<%pageContext.setAttribute("crlf", "\r\n"); %>
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
	function fn_egov_init_MemoReprt(){
	
	}
	/* ********************************************************
	 * 메모보고 수정 으로 가기
	 ******************************************************** */
	
	function fn_egov_modify_memoreprt() {
		document.memoReprtVO.action = "<c:url value='/cop/smt/mrm/modifyMemoReprt.do'/>";
		document.memoReprtVO.submit();					
	}

	/* ********************************************************
	 * 목록 으로 가기
	 ******************************************************** */
	function fn_egov_list_memoreprt(){
		document.memoReprtVO.action = "<c:url value='/cop/smt/mrm/selectMemoReprtList.do'/>";
		document.memoReprtVO.submit();	
	}	

	function fn_egov_delete_memoreprt(){
		if(confirm("삭제 하시겠습니까?")){
			document.memoReprtVO.action = "<c:url value='/cop/smt/mrm/deleteMemoReprt.do'/>";
			document.memoReprtVO.submit();
		}
	}

	function fn_egov_confirm_memoreprt(){
		if(confirm("의견등록을 하시겠습니까?")){
			document.memoReprtVO.action = "<c:url value='/cop/smt/mrm/updateMemoReprtDrctMatter.do'/>";
			document.memoReprtVO.submit();
		}
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

	 	window.showModalDialog("<c:url value='/uss/ion/ism/selectSanctnerListPopup.do' />", arrParam,"dialogWidth=800px;dialogHeight=500px;resizable=yes;center=yes");
	}
</script>
<title>메모보고 상세보기</title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>


</head>
<body onLoad="fn_egov_init_MemoReprt()">

<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<div id="border" style="width:730px">

<form:form commandName="memoReprtVO" name="memoReprtVO" method="post" action="${pageContext.request.contextPath}/cop/smt/mrm/updateMemoReprt.do' />">

	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="100%"class="title_left">
	   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">
	   &nbsp;메모보고 상세보기</h1></td>
	 </tr>
	</table>
	
	<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register"  summary="이 표는 메모보고 정보를 제공하며, 보고일자, 작성자, 보고대상자, 보고제목, 보고내용, 파일첨부, 보고서상태 정보로 구성되어 있습니다 .">
	<caption>메모보고 상세보기</caption>
	<tbody>
	  <tr> 
		<th scope="row" width="20%" height="23" class="required_text" nowrap >보고일자<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
		<td width="80%" >
			<c:out value="${memoReprt.reprtDe}" escapeXml="false" />
		</td>
	  </tr>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >작성자<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <c:out value="${memoReprt.wrterClsfNm}" escapeXml="false" />
	      <c:out value="${memoReprt.wrterNm}" escapeXml="false" />
	    </td>
	  </tr>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >보고대상자<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	    	<c:out value="${memoReprt.reportrClsfNm}" escapeXml="false" />
			<c:out value="${memoReprt.reportrNm}" escapeXml="false" />
	    </td>
	  </tr>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >보고제목<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <c:out value="${memoReprt.reprtSj}" escapeXml="false" />
	    </td>
	  </tr>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >보고내용<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <br/>
	      <c:out value="${fn:replace(memoReprt.reprtCn , crlf , '<br>')}" escapeXml="false" />
	      <br/><br/>
	    </td>
	  </tr>
	  <!-- 첨부파일 테이블 레이아웃 -->
	  <tr>
		<th height="23" class="required_text" nowrap>파일첨부<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="선택항목"></th>
		<td>
			<c:import charEncoding="utf-8" url="/cmm/fms/selectFileInfs.do" > 
			<c:param name="param_atchFileId" value="${memoReprt.atchFileId}" /> 
			</c:import>	      
		 </td>
	  </tr>
	 <!-- //첨부파일 테이블 레이아웃 -->
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >보고서상태<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <c:out value="${memoReprt.reprtSttus}" escapeXml="false" />
	    </td>
	  </tr>
	  <c:choose>
	  <c:when test="${memoReprt.wrterId eq uniqId && memoReprt.reportrId ne uniqId}">
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >의견/지시사항<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="선택항목"></th>
	    <td width="80%" >
	      <br/>
	      <c:out value="${fn:replace(memoReprt.drctMatter , crlf , '<br>')}" escapeXml="false" />
	      <br/><br/>
	    </td>
	  </tr>
	  </c:when>
	  <c:otherwise>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="drctMatter">의견/지시사항</label><img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="선택항목"></th>
	    <td width="80%" >
	      <textarea id="drctMatter" name="drctMatter" rows="5" cols="75" title="의견/지시사항"><c:out value="${memoReprt.drctMatter}" escapeXml="false" /></textarea>
	      <div><form:errors path="drctMatter" cssClass="error"/></div>
	    </td>
	  </tr>
	  </c:otherwise>
	  </c:choose>
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
	<c:if test="${memoReprt.reportrId eq uniqId}">	
	  <td><span class="button"><a href="<c:url value='/cop/smt/mrm/updateMemoReprtDrctMatter.do'/>?searchWrd=<c:out value='${memoReprtVO.searchWrd}'/>&amp;searchCnd=<c:out value='${memoReprtVO.searchCnd}'/>&amp;pageIndex=<c:out value='${memoReprtVO.pageIndex}'/>&amp;searchSttus=<c:out value='${memoReprtVO.searchSttus}'/>&amp;searchDrctMatter=<c:out value='${memoReprtVO.searchDrctMatter}'/>&amp;searchBgnDe=<c:out value='${memoReprtVO.searchBgnDe}'/>&amp;searchEndDe=<c:out value='${memoReprtVO.searchEndDe}'/>" onclick="fn_egov_confirm_memoreprt(); return false;">의견등록</a></span></td>
	  <td>&nbsp;&nbsp;</td>
	</c:if>
	<c:if test="${memoReprt.reprtSttus eq '미확인' && memoReprt.wrterId eq uniqId}">	
	  <td><span class="button"><input type="submit" value="<spring:message code="button.update" />" onclick="fn_egov_modify_memoreprt(); return false;"></span></td>
      <td>&nbsp;&nbsp;</td>
	  <td><span class="button"><a href="<c:url value='/cop/smt/mrm/deleteMemoReprt.do'/>?reprtId=<c:out value='${memoReprtVO.reprtId}'/>" onclick="fn_egov_delete_memoreprt(); return false;"><spring:message code="button.delete" /></a></span></td>
      <td>&nbsp;&nbsp;</td>
    </c:if>
      <td><span class="button"><input type="submit" value="<spring:message code="button.list" />" onclick="fn_egov_list_memoreprt(); return false;"></span></td>
	</tr>
	
	</table>
	</div>
	
	<form:hidden path="reprtId" />
	
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
