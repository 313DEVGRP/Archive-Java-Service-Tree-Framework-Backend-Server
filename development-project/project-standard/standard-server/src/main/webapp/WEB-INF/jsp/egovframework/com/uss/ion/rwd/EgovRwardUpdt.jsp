<%
/**
 * @Class Name  : EgovRwardUpdt.java
 * @Description : EgovRwardUpdt.jsp
 * @Modification Information
 * @
 * @  수정일                    수정자                수정내용
 * @ ---------     --------    ---------------------------
 * @ 2010.07.20    이      용                최초 생성
 *
 *  @author 이      용
 *  @since 2010.08.05
 *  @version 1.0
 *  @see
 *  
 *  Copyright (C) 2009 by MOPAS  All right reserved.
 */
%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>포상수정</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />" ></script>
<validator:javascript formName="rwardManage" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">
<!--
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fncEgovRwardManageList(){
	location.href = "/uss/ion/rwd/selectRwardManageList.do";
}

/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fncUpdtRwardManage() {
    var varFrom = document.getElementById("rwardManage");
    varFrom.action = "<c:url value='/uss/ion/rwd/updtRwardManage.do'/>";
    if(confirm("저장 하시겠습니까?")){
        if(!validateRwardManage(varFrom)){           
            return;
        }else{
        	varFrom.cmd.value="detail";
             varFrom.submit();
        } 
    }
}
-->
</script>
</head>

<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<div id="border" style="width:730px">
<table border="0">
  <tr>
    <td width="700">
<!-- ********** 여기서 부터 본문 내용 *************** -->

<form:form commandName="rwardManage" name="rwardManage" method="post" action="${pageContext.request.contextPath}/uss/ion/rwd/updtRwardManage.do" enctype="multipart/form-data">
<form:hidden  path="rwardId"/>
<form:hidden  path="rwardManId"/>
<form:hidden  path="infrmlSanctnId"/>
<form:hidden  path="sanctnerId"/>
	<c:if test="${rwardManageVO.atchFileId eq null || rwardManageVO.atchFileId eq ''}">
	 	<input type="hidden" name="fileListCnt" value="0" />
	 	<input type="hidden" name="atchFileAt" value="N">
	</c:if> 
	
	<c:if test="${rwardManageVO.atchFileId ne null && rwardManageVO.atchFileId ne ''}">
	 	<input type="hidden" name="atchFileAt" value="Y"> 
	</c:if> 
<input type="hidden" name="cmd" value="updt"/>
<input type="hidden" name="returnUrl"           value="/uss/ion/rwd/EgovRwardManageDetail.do" />
<input type="hidden" name="posblAtchFileNumber" id="posblAtchFileNumber" value="3" />  
<input type="hidden" name="rwardManNm" value="<c:out value='${rwardManageVO.rwardManNm}'/>">
<input type="hidden" name="orgnztNm" value="<c:out value='${rwardManageVO.orgnztNm}'/>">


<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="30%"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;포상수정</h1></td>
  <td width="60%">&nbsp;</td>
  <th width="10%" align="right">
       <table border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td>&nbsp;&nbsp;</td>
	      <td><span class="button"><input type="submit" value="<spring:message code="button.save" />" onclick="fncUpdtRwardManage(); return false;"></span></td>
          <td>&nbsp;&nbsp;</td>
          <td><span class="button"><a href="<c:url value='/uss/ion/rwd/selectRwardManageList.do'/>?searchCondition=1" onclick="fncEgovRwardManageList(); return false;"><spring:message code="button.list" /></a></span></td>     
        </tr>
       </table>
  </th>  
 </tr>
</table>
	
	
	
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%" class="title_left">
   <img src="/images/egovframework/com/cmm/icon/tit_icon.gif" width="9" height="9" hspace="3" style="vertical-align: middle" alt="">&nbsp;포상자</td>
 </tr>
</table>
<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="포상자 정보" >
<caption>포상자정보</caption>
  <tr>
    <th width="20%" height="23" class="required_text"  scope="row">포상자<img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="30%"><c:out value='${rwardManageVO.rwardManNm}'/></td>
    <th width="20%" height="23" class="required_text"  scope="row">소속<img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>          
    <td width="30%"><c:out value='${rwardManageVO.orgnztNm}'/></td>
  </tr> 
</table>

<table width="700" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td >&nbsp; </td>
</tr>
</table>
<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="포상 수정" >
<caption>포상 수정</caption>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row" >포상구분<img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td colspan="3"  >
      <form:select path="rwardCd" title="포상구분">
	      <form:options items="${rwardCodeList}" itemValue="code" itemLabel="codeNm"/>
      </form:select></td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row" ><label for="rwardNm">포상명</label><img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="30%"  ><form:input  path="rwardNm" id="rwardNm" title="포상명"/></td>
    <th width="20%" height="23" class="required_text" scope="row" >포상일<img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="30%"  >
      <input type="hidden" name="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" />
      <form:input path="rwardDe" size="10" maxlength="10" title="포상일자"/>
      <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(document.rwardManage, document.rwardManage.rwardDe, document.rwardManage.rwardDe);" title="새 창으로 이동"
    	style="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" alt="달력창팝업버튼이미지"
	    width="15" height="15"></a>
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="pblenCn">공적사항</label><img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td colspan="3"  >
      <form:textarea path="pblenCn" rows="4" cols="70" cssClass="txaClass" title="공적사항"/>
      <form:errors   path="pblenCn"/>
    </td>
  </tr>
<!-- 첨부파일 테이블 레이아웃 설정 Start..-->
	<c:if test="${rwardManageVO.atchFileId ne null && rwardManageVO.atchFileId ne ''}">
	<tr> 
		<th height="23" class="required_text" scope="row" >첨부파일목록<img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>
		    <td colspan="3">
				<!-- c:import charEncoding="utf-8" url="/cmm/fms/selectFileInfs.do" -->
				<c:import url="/cmm/fms/selectFileInfsForUpdate.do" charEncoding="utf-8">
					<c:param name="param_atchFileId" value="${rwardManageVO.atchFileId}" />
				</c:import>								
		    </td>
	</tr>
  </c:if>	
<!-- 첨부파일 테이블 레이아웃 End.-->

  <tr>
	<th width="20%" height="23" class="required_text" scope="row"><label for="file_1">파일첨부</label><img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>
	<td colspan="3">

    	<table width="100%" cellspacing="0" cellpadding="0" border="0" align="center" class="UseTable">
			<tr>
				<td><input name="file_1" id="egovComFileUploader" type="file" title="첨부파일" /></td>
			</tr>
			<tr>
				<td>
			    	<div id="egovComFileList"></div>
			    </td>
			</tr>
   	    </table>		      
	 </td>
  </tr>
<!-- 첨부파일 테이블 레이아웃 End.-->

</table>
<!-- 결재권자 정보 Include -->
<jsp:include page="/uss/ion/ism/selectInfrmlSanctn.do" flush="true"> 
<jsp:param name="infrmlSanctnId" value="${rwardManageVO.infrmlSanctnId}"/>
</jsp:include>
<!-- //결재권자 정보 Include -->

</form:form>
<!-- ********** 여기까지 내용 *************** -->
</td>
</tr>
</table>   
</div>

<!-- 첨부파일 업로드 가능화일 설정 Start..-->  
<script type="text/javascript">
var maxFileNum = document.getElementById('posblAtchFileNumber').value;
   if(maxFileNum==null || maxFileNum==""){
     maxFileNum = 3;
   }
   var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum );
   multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );
</script> 
<!-- 첨부파일 업로드 가능화일 설정 End.-->


</body>
</html>