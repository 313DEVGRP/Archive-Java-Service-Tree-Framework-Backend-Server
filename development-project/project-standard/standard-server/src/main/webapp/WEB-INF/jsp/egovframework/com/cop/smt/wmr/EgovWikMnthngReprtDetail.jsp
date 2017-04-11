<% 
/**
 * @Class Name : EgovWikMnthngReprtDetail.jsp
 * @Description : 주간/월간보고 상세보기
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
<%pageContext.setAttribute("crlf", "\r\n"); %>
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
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="wikMnthngReprtVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript">
	function fn_egov_init_WikMnthngReprt(){
		
	}

	function fn_egov_modify_wikmnthngreprt() {
		document.wikMnthngReprtVO.action = "<c:url value='/cop/smt/wmr/modifyWikMnthngReprt.do'/>";
		document.wikMnthngReprtVO.submit();					
	}

	function fn_egov_delete_wikmnthngreprt(){
		if(confirm("삭제 하시겠습니까?")){
			document.wikMnthngReprtVO.action = "<c:url value='/cop/smt/wmr/deleteWikMnthngReprt.do'/>";
			document.wikMnthngReprtVO.submit();
		}
	}

	function fn_egov_confirm_wikmnthngreprt(){
		if(confirm("승인 하시겠습니까?")){
			document.wikMnthngReprtVO.action = "<c:url value='/cop/smt/wmr/confirmWikMnthngReprt.do'/>";
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

	 	window.showModalDialog("<c:url value='/uss/ion/ism/selectSanctnerListPopup.do' />", arrParam,"dialogWidth=800px;dialogHeight=500px;resizable=yes;center=yes");
	}
</script>
<title>주간/월간보고 상세보기</title>
</head>
<body onLoad="fn_egov_init_WikMnthngReprt()">

<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<div id="border" style="width:730px">

<form:form commandName="wikMnthngReprtVO" name="wikMnthngReprtVO" method="post" action="${pageContext.request.contextPath}/cop/smt/wmr/modifyWikMnthngReprt.do' />">

	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="100%"class="title_left">
	   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">
	   &nbsp;주간/월간보고 상세보기</h1></td>
	 </tr>
	</table>
	
	<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register"  summary="이 표는 주간/월간보고 정보를 제공하며, 보고유형, 보고일자, 해당일자, 작성자, 보고대상자, 보고서제목, 금주보고내용, 차주보고내용, 특이사항, 파일첨부, 보고서상태 정보로 구성되어 있습니다 .">
	<caption>주간/월간보고 상세보기</caption>
	<tbody>
	  <tr> 
		<th scope="row" width="20%" height="23" class="required_text" nowrap >보고유형<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
		<td width="80%" >
			<c:forEach items="${reprtSe}" var="reprtSeInfo" varStatus="status">
		    <c:if test="${reprtSeInfo.code eq wikMnthngReprt.reprtSe}">	
		     <c:out value="${reprtSeInfo.codeNm}" escapeXml="false" />
		    </c:if>
		    </c:forEach>
		</td>
	  </tr>
	  <tr> 
		<th scope="row" width="20%" height="23" class="required_text" nowrap >보고일자<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
		<td width="80%" >
			<c:out value="${wikMnthngReprt.reprtDe}" escapeXml="false" />
		</td>
	  </tr>
	  <tr> 
		<th scope="row" width="20%" height="23" class="required_text" nowrap >해당일자<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
		<td width="80%" >
			<c:out value="${wikMnthngReprt.reprtBgnDe}" escapeXml="false" />
			~
			<c:out value="${wikMnthngReprt.reprtEndDe}" escapeXml="false" />
		</td>
	  </tr>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >작성자<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <c:out value="${wikMnthngReprt.wrterClsfNm}" escapeXml="false" />
	      <c:out value="${wikMnthngReprt.wrterNm}" escapeXml="false" />
	    </td>
	  </tr>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >보고대상자<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	    	<c:out value="${wikMnthngReprt.reportrClsfNm}" escapeXml="false" />
			<c:out value="${wikMnthngReprt.reportrNm}" escapeXml="false" />
	    </td>
	  </tr>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >보고서제목<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" >
	      <c:out value="${wikMnthngReprt.reprtSj}" escapeXml="false" />
	    </td>
	  </tr>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >금주보고내용<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" style="border-top : 1px solid #a3a3a3; border-left : 1px solid #a3a3a3; border-right : 1px solid #a3a3a3; ">
	      <br/>
	      <c:out value="${fn:replace(wikMnthngReprt.reprtThswikCn , crlf , '<br>')}" escapeXml="false" />
	      <br/><br/>
	    </td>
	  </tr>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >차주보고내용<img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
	    <td width="80%" style="border-top : 1px solid #a3a3a3; border-left : 1px solid #a3a3a3; border-right : 1px solid #a3a3a3; ">
	      <br/>
	      <c:out value="${fn:replace(wikMnthngReprt.reprtLesseeCn , crlf , '<br>')}" escapeXml="false" />
	      <br/><br/>
	    </td>
	  </tr>
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >특이사항<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="선택항목"></th>
	    <td width="80%" style="border-top : 1px solid #a3a3a3; border-left : 1px solid #a3a3a3; border-right : 1px solid #a3a3a3; border-bottom : 1px solid #a3a3a3; ">
	      <br/>
	      <c:out value="${fn:replace(wikMnthngReprt.partclrMatter , crlf , '<br>')}" escapeXml="false" />
	      <br/><br/>
	    </td>
	  </tr>
	  <!-- 첨부파일 테이블 레이아웃 -->
	  <tr>
		<th height="23" class="required_text" nowrap>파일첨부<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="선택항목"></th>
		<td>
			<c:import charEncoding="utf-8" url="/cmm/fms/selectFileInfs.do" > 
			<c:param name="param_atchFileId" value="${wikMnthngReprt.atchFileId}" /> 
			</c:import>	      
		 </td>
	  </tr>
	 <!-- //첨부파일 테이블 레이아웃 -->
	  <tr> 
	    <th scope="row" width="20%" height="23" class="required_text" nowrap >보고서 상태<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="선택항목"></th>
	    <td width="80%" >
	      <c:out value="${wikMnthngReprt.reprtSttus}" escapeXml="false" />
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
	<c:if test="${fn:substring(wikMnthngReprt.reprtSttus,0,2) eq '등록' && wikMnthngReprt.reportrId eq uniqId}">	
	  <td><span class="button"><a href="<c:url value='/cop/smt/wmr/confirmWikMnthngReprt.do'/>?searchWrd=<c:out value='${wikMnthngReprtVO.searchWrd}'/>&amp;searchCnd=<c:out value='${wikMnthngReprtVO.searchCnd}'/>&amp;pageIndex=<c:out value='${wikMnthngReprtVO.pageIndex}'/>&amp;searchSttus=<c:out value='${wikMnthngReprtVO.searchSttus}'/>&amp;searchDe=<c:out value='${wikMnthngReprtVO.searchDe}'/>&amp;searchBgnDe=<c:out value='${wikMnthngReprtVO.searchBgnDe}'/>&amp;searchEndDe=<c:out value='${wikMnthngReprtVO.searchEndDe}'/>" onclick="fn_egov_confirm_wikmnthngreprt(); return false;">승인</a></span></td>
	  <td>&nbsp;&nbsp;</td>
	</c:if>
	<c:if test="${fn:substring(wikMnthngReprt.reprtSttus,0,2) eq '등록' && wikMnthngReprt.wrterId eq uniqId}">	
	  <td><span class="button"><input type="submit" value="<spring:message code="button.update" />" onclick="fn_egov_modify_wikmnthngreprt(); return false;"></span></td>
      <td>&nbsp;&nbsp;</td>
	  <td><span class="button"><a href="<c:url value='/cop/smt/wmr/deleteWikMnthngReprt.do'/>?reprtId=<c:out value='${wikMnthngReprtVO.reprtId}'/>" onclick="fn_egov_delete_wikmnthngreprt(); return false;"><spring:message code="button.delete" /></a></span></td>
      <td>&nbsp;&nbsp;</td>
    </c:if>
      <td><span class="button"><input type="submit" value="<spring:message code="button.list" />" onclick="fn_egov_list_wikmnthngreprt(); return false;"></span></td>
	</tr>
	</table>
	</div>
	
	<form:hidden path="reprtId" />
	
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
