<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%
 /**
  * @Class Name : EgovSysHistRegist.jsp
  * @Description : 시스템 이력 정보 등록 화면
  * @Modification Information
  * @
  * @  수정일       수정자          수정내용
  * @ -------      --------    ---------------------------
  * @ 2009.03.09    이삼섭          최초 생성
  * @ 2011.07.08    이기하          패키지 분리로 경로 수정(sym.log -> sym.log.slg)
  *
  *  @author 공통서비스 개발팀 이삼섭
  *  @since 2009.03.09
  *  @version 1.0
  *  @see
  *
  */
%>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>" ></script>
<script type="text/javascript">
	function fn_egov_regist_sysHist(){
		document.history.action = "<c:url value='/sym/log/slg/InsertSysHistory.do'/>";
		document.history.submit();
	}

	function fn_egov_select_sysHist(){
		document.history.action = "<c:url value='/sym/log/slg/SelectSysHistoryList.do'/>";
		document.history.submit();
	}
</script>
<title>시스템 이력 등록</title>
</head>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<form:form commandName="history" name="history" method="post" enctype="multipart/form-data" >
<input name="pageIndex" type="hidden" value="1" />
<input type="hidden" name="posblAtchFileNumber" value="3" />

	<table width="700" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="100%" class="title_left"><h1 class="title_left">
	   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;시스템 이력등록</h1></td>
	 </tr>
	</table>
	<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="이력구분, 시스템명, 이력내용, 첨부파일을 입력해서 시스템 이력을 등록하는 테이블이다.">
	<CAPTION style="display: none;">시스템 이력등록</CAPTION>
	  <tr>
	    <th height="23" class="required_text" scope="row" ><spring:message code="sym.log.histSeCode" />
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
	    <td>
	   	<select name="histSeCode" class="select" title="<spring:message code="sym.log.histSeCode" />">
			   <option selected value=''>--선택하세요--</option>
			<c:forEach var="result" items="${resultList}" varStatus="status">
				<option value='<c:out value="${result.code}"/>'><c:out value="${result.codeNm}"/></option>
			</c:forEach>
		   </select>
		   <form:errors path="histSeCode" />
	    </td>
	  </tr>
	 <tr>
	    <th width="20%" height="23" class="required_text" scope="row" nowrap ><label for="sysNm"><spring:message code="sym.log.sysNm" /></label>
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
	    <td width="80%" nowrap >
	      <input name="sysNm" type="text" size="60" value="<c:out value='${history.sysNm}'/>" maxlength="60" id="sysNm">
	      <form:errors path="sysNm" />
	    </td>
	  </tr>
	  <tr>
	    <th width="20%" height="23" class="required_text" scope="row" nowrap ><label for="histCn"><spring:message code="sym.log.histCn" /></label>
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
	    <td width="80%" nowrap>
	      <textarea name="histCn" class="textarea"  cols="50" rows="8"  style="width:450px;" id="histCn"><c:out value='${history.histCn}'/></textarea>
	      <form:errors path="histCn" />
	    </td>
	  </tr>
	  <tr>
	    <th width="20%" height="23" class="required_text" scope="row">
	    	<spring:message code="sym.log.atchFile" />
	    	<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="선택입력표시">
	    </th>
	    <td width="80%" nowrap>
            <table width="100%" cellspacing="0" cellpadding="0" border="0" align="center" class="UseTable">
			    <tr>
			        <td><input name="file_1" id="egovComFileUploader" type="file" title="<spring:message code="sym.log.atchFile" />"></td>
			    </tr>
			    <tr>
			        <td>
			        	<div id="egovComFileList"></div>
			        </td>
			    </tr>
   	        </table>
	    </td>
	  </tr>
	</table>
	<table width="700" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="10"></td>
	  </tr>
	</table>
	<div id="border" style="width:700px" align="center">
	<table border="0" cellspacing="0" cellpadding="0">
	<tr>
	  <!--
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt=""></td>
      <td style="background-image:URL(<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>);" class="text_left" nowrap>
      <a href="#noscript" onclick="fn_egov_regist_sysHist(); return false;">등록</a>
      </td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
      -->
      <td><span class="button"><input type="submit" value="등록" onclick="fn_egov_regist_sysHist(); return false;"></span></td>
      <td width="10"></td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt=""></td>
      <td style="background-image:URL(<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>);" class="text_left" nowrap>
      <a href="#noscript" onclick="fn_egov_select_sysHist(); return false;">목록</a>
      </td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
	</tr>
	</table>
	</div>
     <script type="text/javascript">
	     var maxFileNum = document.history.posblAtchFileNumber.value;
	     if(maxFileNum==null || maxFileNum==""){
	    	 maxFileNum = 3;
	     }
		 var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum );
		 multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );
     </script>
</form:form>
</body>
</html>
