<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
  Class Name : EgovDiaryManageRegist.jsp
  Description : 일지관리 등록 페이지
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2008.03.09    장동한          최초 생성

    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.09

--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="ImgUrl" value="/images/egovframework/com/cop/smt/dsm/"/>
<c:set var="CssUrl" value="/css/egovframework/com/cop/smt/dsm/"/>
<html lang="ko">
<head>
<title></title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>


<meta http-equiv="content-type" content="text/html; charset=utf-8" >
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css'/>">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>" ></script>

<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/showModalDialog.js'/>" ></script>

<validator:javascript formName="diaryManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_DiaryManage(){
	   var maxFileNum = document.getElementById('posblAtchFileNumber').value;

	   if(maxFileNum==null || maxFileNum==""){
	     	maxFileNum = 3;
	    }

	   var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum );

	   multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );

}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_DiaryManage(){
	location.href = "<c:url value='/cop/smt/dsm/EgovDiaryManageList.do' />";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_save_DiaryManage(form){

	if(confirm("<spring:message code="common.save.msg" />")){

		form.action =  "<c:url value='/cop/smt/dsm/EgovDiaryManageRegistActor.do' />";

		if(!validateDiaryManageVO(form)){
			return;
		}else{
			form.submit();
		}
	}
}

/* ********************************************************
 * 일정정보 팝업열기
 ******************************************************** */
 function fn_egov_Schdule_DiaryManage(){

 	window.showModalDialog("<c:url value='/cop/smt/sdm/EgovDeptSchdulManageListPopup.do' />", self,"dialogWidth=800px;dialogHeight=500px;resizable=yes;center=yes");

 }
/************************************************************************
//셀렉트박스 값 컨트롤 함수
************************************************************************/
function fn_egov_SelectBoxValue(sbName)
{
	var FValue = "";
	for(var i=0; i < document.getElementById(sbName).length; i++)
	{
	if(document.getElementById(sbName).options[i].selected == true){

	FValue=document.getElementById(sbName).options[i].value;
	}
	}

	return  FValue;
}

</script>
</head>
<body onLoad="fn_egov_init_DiaryManage()">
<DIV id="content" style="width:712px">
<!-- 상단타이틀 -->
<form:form commandName="diaryManageVO"  action="" name="deptSchdulManageVO" method="post" enctype="multipart/form-data">
<!--  상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif'/>" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지">&nbsp;일지관리 등록</td>
 </tr>
</table>
<!-- 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<!-- 등록  폼 영역  -->

<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register">
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >일정정보<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%">
	<table width="100%" cellspacing="0" cellpadding="0" border="0">
		<tr>
			<td width="300px" style="padding:0px 0px 0px 0px;margin:0px 0px 0px 0px;">
			<form:input path="schdulCn" size="40" cssClass="txaIpt" readonly="true" maxlength="255" />
			</td>
			<td style="padding:0px 0px 0px 2px;margin:0px 0px 0px 0px;">
			<a href="#" onClick="fn_egov_Schdule_DiaryManage()">
				<img src="<c:url value='/images/egovframework/com/cmm/icon/search2.gif'/>"  align="middle" style="border:0px" alt="일정정보" title="일정정보">
			</a>
			</td>
		</tr>
		</table>
		<form:hidden path="schdulId" />
		<div><form:errors path="schdulId" cssClass="error"/></div>
		<div><form:errors path="schdulCn" cssClass="error"/></div>
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >일지명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%">
      <form:input path="diaryNm" size="73" cssClass="txaIpt" maxlength="255"/>
      <div><form:errors path="diaryNm" cssClass="error"/></div>
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >지시사항<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%">
        <form:textarea path="drctMatter" rows="3" cols="20" cssClass="txaClass"/>
    	<div><form:errors path="drctMatter" cssClass="error"/></div>
    </td>
  </tr>

  <tr>
    <th width="20%" height="23" class="required_text" nowrap >특이사항<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%">
        <form:textarea path="partclrMatter" rows="3" cols="20" cssClass="txaClass"/>
    	<div><form:errors path="partclrMatter" cssClass="error"/></div>
    </td>
  </tr>

  <tr>
    <th width="20%" height="23" class="required_text" nowrap >진척율<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%">
		<table cellspacing="0" cellpadding="0" border="0">
		<tr>
			<td width="50px" style="padding:0px 0px 0px 0px;margin:0px 0px 0px 0px;">
			<form:input path="diaryProcsPte" size="3" cssClass="txaIpt" maxlength="3" />
			</td>
			<td>%</td>
		</tr>
		</table>
    </td>
  </tr>
<!-- 첨부파일 테이블 레이아웃 설정 Start..-->
  <tr>
	<th height="23" class="required_text" nowrap>파일첨부<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif'/>" width="15" height="15" alt="선택입력표시"></th>
	<td>
	<!--  첨부파일 갯수를 위한 hidden -->
	<input type="hidden" name="posblAtchFileNumber" id="posblAtchFileNumber" value="3" />
	<!--첨부파일 테이블 레이아웃 End.-->
    	<table width="580px" cellspacing="0" cellpadding="0" border="0" align="center" class="UseTable">
			<tr>
				<td><input name="file_1" id="egovComFileUploader" type="file" title="첨부파일명 입력"/></td>
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
<!-- 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<center>
<!-- 목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
<!--
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt="버튼이미지"></td>
  <td background="<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif' />" class="text_left" nowrap><a href="JavaScript:fn_egov_list_DiaryManage();"><spring:message code="button.list" /></a>
  </td>
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
  <td>&nbsp;</td>
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt="버튼이미지"></td>
  <td background="<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif' />" class="text_left" nowrap><a href="JavaScript:fn_egov_save_DiaryManage(document.forms[0]);"><spring:message code="button.save" /></a>
  </td>
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
-->
  <td><span class="button"><input type="submit" value="<spring:message code="button.list" />" title="<spring:message code="button.list" />" onclick="javascript:fn_egov_list_DiaryManage();return false;"></span></td>
  <td>&nbsp;</td>
  <td><span class="button"><input type="submit" value="<spring:message code="button.save" />" title="<spring:message code="button.save" />" onclick="javascript:fn_egov_save_DiaryManage(document.forms[0])();return false;"></span></td>
</tr>
</table>
</center>
<input name="cmd" id="cmd" type="hidden" value="<c:out value='save'/>"/>
</form:form>
</DIV>

</body>
</html>
