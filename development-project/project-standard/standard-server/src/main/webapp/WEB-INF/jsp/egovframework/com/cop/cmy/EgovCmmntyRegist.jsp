<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="ImgUrl" value="/images/egovframework/com/cmm"/>

<%
 /**
  * @Class Name : EgovCmmntyRegist.jsp
  * @Description : 커뮤니티 속성 등록화면
  * @Modification Information
  * @
  * @  수정일      수정자            수정내용
  * @ -------        --------    ---------------------------
  * @ 2009.04.02   이삼섭          최초 생성
  *
  *  @author 공통서비스 개발팀 이삼섭
  *  @since 2009.04.02
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
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/showModalDialog.js'/>"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="community" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript">
	function fn_egov_regist_cmmnty(){
		if (!validateCommunity(document.community)){
			return;
		}

		if (confirm('<spring:message code="common.regist.msg" />')) {
			document.community.action = "<c:url value='/cop/cmy/insertCmmntyInf.do'/>";
			document.community.submit();
		}
	}

	function fn_egov_select_cmmntyInfs(){
		document.community.action = "<c:url value='/cop/cmy/selectCmmntyInfs.do'/>";
		document.community.submit();
	}

	function fn_egov_inqire_tmplat(){
		var retVal;
		var url = "<c:url value='/cop/com/openPopup.do?requestUrl=/cop/tpl/selectTemplateInfsPop.do&typeFlag=CMY&width=850&height=360'/>";
		var openParam = "dialogWidth: 850px; dialogHeight: 360px; resizable: 0, scroll: 1, center: 1";

		retVal = window.showModalDialog(url,"p_tmplatInqire", openParam, "templateCallback");
		if (retVal != null) {
			var tmp = retVal.split("|");
			document.community.tmplatId.value = tmp[0];
			document.community.tmplatNm.value = tmp[1];
		}
	}
	
	function templateCallback(retVal) {
		if (retVal != null) {
			var tmp = retVal.split("|");
			document.community.tmplatId.value = tmp[0];
			document.community.tmplatNm.value = tmp[1];
		}		
	}

	function fn_egov_inqire_user(){
		var retVal;
		var url = "<c:url value='/cop/com/openPopup.do?requestUrl=/cop/com/selectUserList.do&width=850&height=360'/>";
		var openParam = "dialogWidth: 850px; dialogHeight: 360px; resizable: 0, scroll: 1, center: 1";

		retVal = window.showModalDialog(url,"p_userInqire", openParam, "userCallback");

		if(retVal != null){
			var tmp = retVal.split("|");
			document.community.emplyrId.value = tmp[0];
			document.community.emplyrNm.value = tmp[1];
		}
	}
	
	function userCallback(retVal) {
		if (retVal != null) {
			var tmp = retVal.split("|");
			document.community.emplyrId.value = tmp[0];
			document.community.emplyrNm.value = tmp[1];
		}		
	}
</script>
<title>커뮤니티 생성</title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>


</head>
<body>
<form:form commandName="community" name="community" method="post" >
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>

<div id="border" style="width:730px">

	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="100%"class="title_left">
	  	<h1>
	  		<img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지">&nbsp;커뮤니티 생성
	  	</h1>
	  </td>
	 </tr>
	</table>
	<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register"  summary="커뮤니티명, 커뮤니티 소개, 템플릿 정보, 커뮤니티 관리자 입니다" >
	  <tr>
	    <th scope="col" width="20%" height="23" class="required_text" nowrap >
	    	<label for="cmmntyNm">
	    		커뮤니티명
	    	</label>
	    	<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
	    </th>
	    <td width="80%" nowrap colspan="3">
	      <input name="cmmntyNm" type="text" size="60" value="" maxlength="60" style="width:100%" title="커뮤니티명">
	      <br/><form:errors path="cmmntyNm" />
	    </td>
	  </tr>
	  <tr>
	    <th scope="col" height="23" class="required_text" >
	    	<label for="cmmntyIntrcn">
	    		커뮤니티 소개
	    	</label>
	    	<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
	    </th>
	    <td colspan="3">
	      <textarea name="cmmntyIntrcn" class="textarea"  cols="75" rows="4"  style="width:100%" title="커뮤니티 소개"></textarea>
	      <form:errors path="cmmntyIntrcn" />
	    </td>
	  </tr>
	  <tr>
	    <th scope="col" width="20%" height="23" class="required_text" nowrap >템플릿 정보
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
	    <td width="30%" nowrap colspan="3">
	     <input name="tmplatId" type="hidden" value="" >
	     <input name="tmplatNm" type="text" size="20" value=""  maxlength="20" readonly  title="템플릿 정보">
	     &nbsp;<a href="#LINK" onClick="javascript:fn_egov_inqire_tmplat();" style="selector-dummy: expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/search.gif' />"
	     			width="15" height="15" align="middle" alt="search"></a>
		<br/><form:errors path="tmplatId" />
	    </td>
	  </tr>
	  <tr>
	    <th scope="col" width="20%" height="23" class="required_text" nowrap >커뮤니티 관리자
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
	    <td width="30%" nowrap colspan="3">
	     <input name="emplyrId" type="hidden" value="" >
	     <input name="emplyrNm" type="text" size="20" value=""  maxlength="20" readonly title="커뮤니티 관리자">
	     &nbsp;<a href="#LINK" onClick="javascript:fn_egov_inqire_user()" style="selector-dummy: expression(this.hideFocus=false);">
	     		<img src="<c:url value='/images/egovframework/com/cmm/icon/search.gif' />" width="15" height="15" align="middle" alt="새창"></a>
		<br/><form:errors path="emplyrId" />
	    </td>
	  </tr>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="10"></td>
	  </tr>
	</table>
	<div align="center">
	<table border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
	<!-- 
		<td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif' />" width="8" height="20" alt="버튼이미지"></td>
		<td class="btnBackground" nowrap><a href="<c:url value='/cop/cmy/selectCmmntyInfs.do'/>"><spring:message code="button.list" /></a></td>
		<td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif' />" width="8" height="20" alt="버튼이미지"></td>
		<td>&nbsp;</td>
 	-->
		<td>
			<span class="button"><input type="submit" value="<spring:message code="button.list" />" title="<spring:message code="button.list" />" onclick="fn_egov_select_cmmntyInfs(); return false;"></span>
		</td>
		<td width="10"></td>
		<td>
			<span class="button"><input type="submit" value="<spring:message code="button.create" />" title="<spring:message code="button.create" />" onclick="javascript:fn_egov_regist_cmmnty(); return false;"></span>
		</td>
	</tr>
	</table>
	</div>
</div>
</form:form>
</body>
</html>
