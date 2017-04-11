<%
/**
 * @Class Name : EgovBndtManageRegist.java
 * @Description : EgovBndtManageRegist jsp
 * @Modification Information
 * @
 * @  수정일                    수정자                수정내용
 * @ ---------     --------    ---------------------------
 * @ 2010.07.20    이      용                최초 생성
 *
 *  @author 이      용
 *  @since 2010.07.20
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
<title>당직  등록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<c:set var="ImgUrl" value="/images/egovframework/com/cmm/"/>
<c:set var="CssUrl" value="/css/egovframework/com/uss/ion/bnt/"/>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="bndtManage" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/showModalDialog.js'/>" ></script>
<script type="text/javaScript" language="javascript">

	/* ********************************************************
	 * 목록 으로 가기
	 ******************************************************** */
	function fncBndtManageList(){
		location.href = "/uss/ion/bnt/EgovBndtManageList.do";
	}
	
	/* ********************************************************
	 * 저장처리화면
	 ******************************************************** */
	 function fncInsertBndtManage() {
		    var varForm = document.getElementById("bndtManage");
		    varForm.action = "<c:url value='/uss/ion/bnt/insertBndtManage.do'/>";
	
		    if(confirm("저장 하시겠습니까?")){
		        if(!validateBndtManage(varForm)){           
		            return;
		        }else{
		        	varForm.submit();
		        } 
		    }
		}
	
	/* ********************************************************
	* 아이디  팝업창열기
	* fn_egov_schdulCharger_LeaderSchdule
	* param 타이틀, ID 폼명, 사원번호 폼명, 사원명 폼명, 부서명 폼명
	* ******************************************************** */
	function fn_egov_schdulCharger_LeaderSchdule_Bndt(strTitle, frmUniqId, frmEmplNo, frmEmplyrNm, frmOrgnztNm){
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

<!-- 상단타이틀 -->
<form:form commandName="bndtManage" name="bndtManage" method="post" action="${pageContext.request.contextPath}/uss/ion/bnt/insertBndtManage.do">
<input name="cmd" type="hidden" value="insert"/>

<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="30%"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;당직  등록</h1></td>
  <td width="60%">&nbsp;</td>
  <th width="10%" align="right">
       <table border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td>&nbsp;&nbsp;</td>
          <td><span class="button"><input type="submit" value="<spring:message code="button.save" />" onclick="fncInsertBndtManage(); return false;"></span></td>     
          <td>&nbsp;&nbsp;</td>
          <td><span class="button"><a href="<c:url value='/uss/ion/bnt/EgovBndtManageList.do'/>?searchCondition=1" onclick="fncBndtManageList(); return false;"><spring:message code="button.list" /></a></span></td>     
        </tr>
       </table>
  </th>  
 </tr>
</table>

<!-- 등록  폼 영역  -->
<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="당직 등록" >
<caption>당직 등록</caption>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="bndtId">당직자명</label><img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="80%" >
      <input name="bndtIdName" id="bndtIdName" type="text" title="당직자명" readonly/>
      <form:hidden  path="bndtId"/>
      <form:errors path="bndtId"/>
	<a href="/uss/ion/ism/selectSanctnerListPopup.do" target="_blank"  title="새 창으로 이동"  onClick="fn_egov_schdulCharger_LeaderSchdule_Bndt('당직 대상자', 'bndtId', '', 'bndtIdName', 'orgnztNm');return false;">
	<img src="${ImgUrl}search2.gif" style="border:0px" alt="당직" title="당직">
	</a>
    </td>
  </tr> 
  <tr> 
    <th width="20%" height="23" class="required_text" scope="row"><label for="orgnztNm">소속</label><img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>
    <td width="80%">
        <input name="orgnztNm" id="orgnztNm" type="text" title="소속" class="readOnlyClass" readonly>
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="bndtDe">당직일자</label><img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="80%">
      <form:input  path="bndtDe" size="10" maxlength="10" title="당직일자" />
      <form:errors path="bndtDe"/>
    </td>    
  </tr> 
  <tr> 
    <th width="20%" height="23" class="required_text" scope="row"><label for="remark">비고</label><img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt=""></th>
    <td width="30%" class="title_left">
      <form:textarea path="remark" rows="4" cols="70" cssClass="txaClass" title="비고" />
      <form:errors path="remark"/>
    </td>    
  </tr>     
</table>
</form:form>
<!-- ********** 여기까지 내용 *************** -->
</td>
</tr>
</table>   
</div>
</body>
</html>
