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
  * @Class Name : EgovClubRegist.jsp
  * @Description : 동호회 생성화면
  * @Modification Information
  * @
  * @  수정일      수정자            수정내용
  * @ -------        --------    ---------------------------
  * @ 2009.04.06   이삼섭          최초 생성
  *
  *  @author 공통서비스 개발팀 이삼섭
  *  @since 2009.04.06
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
<validator:javascript formName="club" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript">
	function fn_egov_select_clbInfs(){
		document.club.action = "<c:url value='/cop/clb/selectClubInfs.do'/>";
		document.club.submit();
	}

	function fn_egov_regist_clb(){
		if (!validateClub(document.club)){
			return;
		}

		if (confirm('<spring:message code="common.regist.msg" />')) {
			document.club.action = "<c:url value='/cop/clb/insertClubInf.do'/>";
			document.club.submit();
		}
	}

	function fn_egov_inqire_tmplat(){
		var retVal;
		var url = "<c:url value='/cop/com/openPopup.do?requestUrl=/cop/tpl/selectTemplateInfsPop.do&typeFlag=CLB&width=850&height=360'/>";
		var openParam = "dialogWidth: 850px; dialogHeight: 360px; resizable: 0, scroll: 1, center: 1";

		retVal = window.showModalDialog(url,"p_tmplatInqire", openParam, "templateCallback");
		if (retVal != null) {
			var tmp = retVal.split("|");
			document.club.tmplatId.value = tmp[0];
			document.club.tmplatNm.value = tmp[1];
		}
	}
	
	function templateCallback(retVal) {
		if (retVal != null) {
			var tmp = retVal.split("|");
			document.club.tmplatId.value = tmp[0];
			document.club.tmplatNm.value = tmp[1];
		}
	}

	function fn_egov_inqire_cmmntyUser(){
		var cmmntyId = document.club.cmmntyId.value;
		if(cmmntyId==''){
			alert("커뮤니티 정보를 먼저 선택하세요");
			return;
		}
		var retVal;
		var url = "<c:url value='/cop/com/openPopup.do?requestUrl=/cop/com/selectCmmntyUserList.do&trgetId="+cmmntyId+"&width=850&height=360'/>";
		var openParam = "dialogWidth: 850px; dialogHeight: 360px; resizable: 0, scroll: 1, center: 1";

		retVal = window.showModalDialog(url,"p_userInqire", openParam, "communityUserCallback");

		if (retVal != null) {
			var tmp = retVal.split("|");
			document.club.emplyrId.value = tmp[0];
			document.club.emplyrNm.value = tmp[1];
		}
	}
	
	function communityUserCallback(retVal) {
		if (retVal != null) {
			var tmp = retVal.split("|");
			document.club.emplyrId.value = tmp[0];
			document.club.emplyrNm.value = tmp[1];
		}
	}

	function fn_egov_inqire_cmmnty(){
		var retVal;
		var url = "<c:url value='/cop/com/openPopup.do?requestUrl=/cop/cmy/selectCmmntyInfsByPop.do&width=850&height=360'/>";
		var openParam = "dialogWidth: 850px; dialogHeight: 360px; resizable: 0, scroll: 1, center: 1";

		retVal = window.showModalDialog(url,"p_cmmntyInqire", openParam, "communityCallback");
		if (retVal != null) {
			var tmp = retVal.split("|");
			document.club.cmmntyId.value = tmp[0];
			document.club.cmmntyNm.value = tmp[1];
		}
	}
	
	function communityCallback(retVal) {
		if (retVal != null) {
			var tmp = retVal.split("|");
			document.club.cmmntyId.value = tmp[0];
			document.club.cmmntyNm.value = tmp[1];
		}
	}
</script>
<title>동호회 생성</title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>


</head>
<body>
<form:form commandName="club" name="club" method="post" >


<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>

<div id="border" style="width:730px">

	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="100%"class="title_left">
	  	<h1>
	  		<img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지">&nbsp;동호회 생성
	  	</h1>
	  </td>
	 </tr>
	</table>
	<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="소속 커뮤니티 정보,동호회 명,동호회 소개,템플릿 정보,동호회 운영자 입니다">
	  <tr>
	    <th scope="col" width="20%" height="23" class="required_text" nowrap ><label for="cmmntyNm">소속 커뮤니티 정보
	    	<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></label>
	    </th>
	    <td width="30%" nowrap colspan="3">
	     	<input type="hidden" name="cmmntyId" value="" />
	     	<input type="text" name="cmmntyNm" value="" size="20" readOnly id="cmmntyNm"/>
	     &nbsp;<a href="#LINK" onclick="javascript:fn_egov_inqire_cmmnty()" style="selector-dummy: expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/search.gif' />"
	     			width="15" height="15" align="middle" alt="search"></a>
	     <br/><form:errors path="cmmntyId" />
	    </td>
	  </tr>
	  <tr>
	    <th scope="col" width="20%" height="23" class="required_text" nowrap ><label for="clbNm">동호회 명
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></label></th>
	    <td width="80%" nowrap colspan="3">
	      <input name="clbNm" type="text" size="60" value="" maxlength="60" style="width:100%" id="clbNm">
	      <br/><form:errors path="clbNm" />
	    </td>
	  </tr>
	  <tr>
	    <th scope="col" height="23" class="required_text" ><label for="clbIntrcn">동호회 소개
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></label></th>
	    <td colspan="3">
	      <textarea name="clbIntrcn" class="textarea"  cols="75" rows="4"  style="width:100%" id="clbIntrcn"></textarea>
	      <form:errors path="clbIntrcn" />
	    </td>
	  </tr>
	  <tr>
	    <th scope="col" width="20%" height="23" class="required_text" nowrap ><label for="tmplatNm">템플릿 정보
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></label></th>
	    <td width="30%" nowrap colspan="3">
	     <input name="tmplatId" type="hidden" value="" >
	     <input name="tmplatNm" type="text" size="20" value=""  maxlength="20" readonly id="tmplatNm">
	     &nbsp;<a href="#LINK" onclick="javascript:fn_egov_inqire_tmplat()"style="selector-dummy: expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/search.gif' />"
	     			width="15" height="15" align="middle" alt="search"></a>
	     <br/><form:errors path="tmplatId" />
	    </td>
	  </tr>
	  <tr>
	    <th scope="col" width="20%" height="23" class="required_text" nowrap ><label for="emplyrNm">동호회 운영자
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></label></th>
	    <td width="30%" nowrap colspan="3">
	     <input name="emplyrId" type="hidden" value="" >
	     <input name="emplyrNm" type="text" size="20" value=""  maxlength="20" readonly id="emplyrNm">
	     &nbsp;<a href="#LINK" onclick="javascript:fn_egov_inqire_cmmntyUser()" style="selector-dummy: expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/search.gif' />"
	     			width="15" height="15" align="middle" alt="search"></a>
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
      <td></td>
      <td >

       <span class="button"><input type="submit" value="등록" onclick="fn_egov_regist_clb();"></span>
      </td>
      <td></td>
      <td width="10"></td>
      <td></td>
      <td >
      <span class="button"><input type="submit" value="목록" onclick="fn_egov_select_clbInfs();"></span>

      </td>
      <td></td>
	</tr>
	</table>
	</div>
</div>
</form:form>
</body>
</html>
