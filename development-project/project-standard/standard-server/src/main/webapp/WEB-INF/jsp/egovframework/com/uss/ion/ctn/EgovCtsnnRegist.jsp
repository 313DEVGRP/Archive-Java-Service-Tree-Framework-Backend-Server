<%
/**
 * @Class Name : EgovCtsnnRegist.java
 * @Description : EgovCtsnnRegist.jsp
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
<title>경조사 등록</title>
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
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/showModalDialog.js'/>" ></script>
<validator:javascript formName="ctsnnManage" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">

	/* ********************************************************
	 * 목록 으로 가기
	 ******************************************************** */
	function fncEgovCtsnnManageList(){
		location.href = "/uss/ion/ctn/selectCtsnnManageList.do";
	}

	/* ********************************************************
	 * 저장처리화면
	 ******************************************************** */
	function fncInsertEgovCtsnnManage() {
	    var varFrom = document.getElementById("ctsnnManage");
	    varFrom.action = "<c:url value='/uss/ion/ctn/insertCtsnnManage.do'/>";
	    if(confirm("저장 하시겠습니까?")){
	        if(!validateCtsnnManage(varFrom)){           
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
	function fn_egov_schdulCharger_LeaderSchdule_Ctsnn(strTitle, frmUniqId, frmEmplNo, frmEmplyrNm, frmOrgnztNm){
		var arrParam = new Array(6);
		arrParam[0] = window;
		arrParam[1] = strTitle;
		arrParam[2] = frmUniqId;
		arrParam[3] = frmEmplNo;
		arrParam[4] = frmEmplyrNm;
		arrParam[5] = frmOrgnztNm;
	
	 	window.showModalDialog("/uss/ion/ism/selectSanctnerListPopup.do", arrParam,"dialogWidth=800px;dialogHeight=500px;resizable=yes;center=yes");
	}
	
	function showModalDialogCallback(retVal) {
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
<form:form commandName="ctsnnManage" name="ctsnnManage" method="post" action="${pageContext.request.contextPath}/uss/ion/ctn/insertCtsnnManage.do" >

<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="30%"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;경조사 신청</h1></td>
  <td width="60%">&nbsp;</td>
  <th width="10%" align="right">
       <table border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td><span class="button"><a href="<c:url value='/uss/ion/ctn/selectCtsnnManageList.do'/>?searchCondition=1" onclick="fncEgovCtsnnManageList(); return false;"><spring:message code="button.list" /></a></span></td>     
          <td>&nbsp;&nbsp;</td>
          <td><span class="button"><input type="submit" value="저장" onclick="fncInsertEgovCtsnnManage(); return false;"></span></td>
        </tr>
       </table>
  </th>  
 </tr>
</table>

<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%" class="title_left">
   <img src="/images/egovframework/com/cmm/icon/tit_icon.gif" width="9" height="9" hspace="3" style="vertical-align: middle" alt="">&nbsp;경조 신청자</td>
 </tr>
</table>
<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="소속정보" >
<caption>소속정보</caption>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="usid">경조신청자</label><img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>          
    <td width="30%"  >
        <input name="usNm" id="usNm" type="text" size="10" value="" title="경조신청자" readonly>
        <form:hidden path="usid"/>
	    <span class="link"><!-- a href="/uss/ion/ism/selectSanctnerListPopup.do" target="_blank"  title="새 창으로 이동" onClick="fn_egov_schdulCharger_LeaderSchdule('경조신청자', 'usid', '', 'usNm', 'usOrgnztNm');return false;"-->
	    <a href="/uss/ion/ism/selectSanctnerListPopup.do" target="_blank"  title="새 창으로 이동"  onClick="fn_egov_schdulCharger_LeaderSchdule_Ctsnn('경조신청자', 'usid', '', 'usNm', 'usOrgnztNm');return false;">
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/search2.gif' />" alt="검색"  width="15" height="15">
	    </a></span>
    </td>
    <th width="20%" height="23" class="required_text" scope="row"><label for="usOrgnztNm">소속</label><img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>          
    <td width="30%"  ><input name="usOrgnztNm" id="usOrgnztNm" type="text" size="25" value="" title="소속" readonly></td>
  </tr> 
</table>
<table width="700" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td >&nbsp; </td>
</tr>
</table>

<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="경조신청" >
<caption>경조신청</caption>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="ctsnnNm">경조명</label><img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td colspan="3"><form:input  path="ctsnnNm" title="경조명" /></td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="ctsnnCd">경조구분</label><img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="30%">
      <form:select path="ctsnnCd" title="경조구분">
	      <form:options items="${ctsnnCodeList}" itemValue="code" itemLabel="codeNm"/>
      </form:select>
    </td>
    <th width="20%" height="23" class="required_text" scope="row"><label for="occrrDe">발생일</label><img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="30%">
      <form:input path="occrrDe" title="경조 발생일" size="10" maxlength="10"/>
      <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(document.ctsnnManage, document.ctsnnManage.occrrDe, document.ctsnnManage.occrrDe);" title="새 창으로 이동"
    	   style  ="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" alt="달력창팝업버튼이미지"
	      width  ="15" height="15"></a>
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="trgterNm">대상자명</label><img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td colspan="3"><form:input  path="trgterNm" title="대상자명"/></td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="relate">관계</label><img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="30%">
      <form:select path="relate" title="관계">
	      <form:options items="${relateCodeList}" itemValue="code" itemLabel="codeNm"/>
      </form:select>
    </td>
    <th width="20%" height="23" class="required_text" scope="row"><label for="brth">생년월일</label><img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="30%">
      <input type="hidden" name="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" />
      <form:input path="brth" title="생년월일" size="10" maxlength="10"/>
      <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(document.ctsnnManage, document.ctsnnManage.brth, document.ctsnnManage.brth);" title="새 창으로 이동"
    	   style="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" alt="달력창팝업버튼이미지"
	      width="15" height="15"></a>
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="remark">비고</label><img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>          
    <td colspan="3">
      <form:textarea path="remark" rows="4" cols="70" cssClass="txaClass" title="비고"/>
      <form:errors   path="remark"/>
    </td>
  </tr>
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
</body>
</html>