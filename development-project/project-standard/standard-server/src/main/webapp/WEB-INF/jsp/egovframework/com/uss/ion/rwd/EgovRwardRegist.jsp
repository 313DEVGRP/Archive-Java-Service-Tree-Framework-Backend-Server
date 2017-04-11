<%
/**
 * @Class Name : EgovRwardRegist.java
 * @Description : EgovRwardRegist.jsp
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
<title>포상등록</title>
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
	/* ********************************************************
	 * 목록 으로 가기
	 ******************************************************** */
	function fncEgovRwardManageList(){
		location.href = "/uss/ion/rwd/selectRwardManageList.do";
	}
	
	/* ********************************************************
	 * 저장처리화면
	 ******************************************************** */
	function fncInsertEgovRwardManage() {
	    var varFrom = document.getElementById("rwardManage");
	    varFrom.action = "<c:url value='/uss/ion/rwd/insertRwardManage.do'/>";
	    if(confirm("저장 하시겠습니까?")){
	        if(!validateRwardManage(varFrom)){           
	            return;
	        }else{
	             varFrom.submit();
	        } 
	    }
	}
			
	/* ********************************************************
	* 아이디  팝업창열기
	* fn_egov_schdulCharger_LeaderSchdule
	* param 타이틀, ID 폼명, 사원번호 폼명, 사원명 폼명, 부서명 폼명
	* ******************************************************** */
	function fn_egov_schdulCharger_LeaderSchdule_Rward(strTitle, frmUniqId, frmEmplNo, frmEmplyrNm, frmOrgnztNm){
		var arrParam = new Array(6);
		arrParam[0] = window;
		arrParam[1] = strTitle;
		arrParam[2] = frmUniqId;
		arrParam[3] = frmEmplNo;
		arrParam[4] = frmEmplyrNm;
		arrParam[5] = frmOrgnztNm;
	
	 	window.showModalDialog("/uss/ion/ism/selectSanctnerListPopup.do", arrParam,"dialogWidth=800px;dialogHeight=500px;resizable=yes;center=yes");
	}
</script>
</head>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<div id="border" style="width:730px">
<table border="0">
  <tr>
    <td width="700">
<!-- ********** 여기서 부터 본문 내용 *************** -->
<!-- 상단타이틀(파일첨부를 위한 폼명 및 Enctype 설정 -->
<form:form commandName="rwardManage" name="rwardManage" method="post" action="${pageContext.request.contextPath}/uss/ion/rwd/insertRwardManage.do" enctype="multipart/form-data">
<!-- 첨부파일 개수 설정을 위한 Hidden 설정 -->	
<input type="hidden" name="posblAtchFileNumber" id="posblAtchFileNumber" value="3" />
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="30%"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;포상신청</h1></td>
  <td width="60%">&nbsp;</td>
  <th width="10%" align="right">
       <table border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td>&nbsp;&nbsp;</td>
          <td><span class="button"><input type="submit" value="<spring:message code="button.save" />" onclick="fncInsertEgovRwardManage(); return false;"></span></td>
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
    <th width="20%" height="23" class="required_text"  scope="row"><label for="rwardManId">포상자</label><img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="30%"  >
        <input name="rwardManNm" id="rwardManNm" type="text" size="20" value="" title="포상자" readonly>
        <form:hidden path="rwardManId"/>
	    <span class="link"><a href="/uss/ion/ism/selectSanctnerListPopup.do" target="_blank"  title="새 창으로 이동"  onClick="fn_egov_schdulCharger_LeaderSchdule_Rward('포상자', 'rwardManId', '', 'rwardManNm', 'rwardManOrgnztNm');return false;">
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/search2.gif' />" alt="검색"  width="15" height="15">
	    </a></span>
    </td>
    <th width="20%" height="23" class="required_text" scope="row"><label for="rwardManOrgnztNm">소속 </label><img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>          
    <td width="30%"  ><input name="rwardManOrgnztNm" id="rwardManOrgnztNm" type="text" size="25" value="" title="소속" readonly></td>
  </tr> 
</table>

<table width="700" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td >&nbsp; </td>
</tr>
</table>


<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register" ummary="포상 등록" >
<caption>포상 등록</caption>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="rwardCd">포상구분</label><img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td colspan="3"  >
      <form:select path="rwardCd" title="포상구분">
	      <form:options items="${rwardCodeList}" itemValue="code" itemLabel="codeNm"/>
      </form:select>
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="rwardNm">포상명</label><img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="30%"  ><form:input  path="rwardNm" title="포상명"/></td>
    <th width="20%" height="23" class="required_text" scope="row"><label for="rwardDe">포상일</label><img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
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
      <form:errors path="pblenCn"/>
    </td>
  </tr>

<!-- 첨부파일 테이블 레이아웃 설정 Start..-->
  <tr>
	<th width="20%" height="23" class="required_text" scope="row"><label for="file_1">첨부파일</label><img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>
	<td colspan="3" >
    	<table width="100%" cellspacing="0" cellpadding="0" border="0" align="center" class="UseTable">
			<tr>
				<td><input name="file_1" id="egovComFileUploader" type="file"  title="첨부파일"/></td>
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

<!-- 결재권자 지정 Include -->
<jsp:include page="/WEB-INF/jsp/egovframework/com/uss/ion/ism/EgovInfrmlSanctnRegist.jsp" flush="true"/> 
<!-- //결재권자 지정 Include -->


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