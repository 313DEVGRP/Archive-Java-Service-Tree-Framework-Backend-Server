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
  * @Class Name : EgovCmmntyUpdt.jsp
  * @Description : 커뮤니티 수정화면
  * @Modification Information
  * @
  * @  수정일      수정자            수정내용
  * @ -------        --------    ---------------------------
  * @ 2009.04.04   이삼섭          최초 생성
  *
  *  @author 공통서비스 개발팀 이삼섭
  *  @since 2009.04.04
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
	function fn_egov_select_cmmntyInfs(){
		document.community.action = "<c:url value='/cop/cmy/selectCmmntyInfs.do'/>";
		document.community.submit();
	}

	function fn_egov_updtCmmntyInf(){
		if (!validateCommunity(document.community)){
			return;
		}

		if (confirm('<spring:message code="common.update.msg" />')) {
			document.community.action = "<c:url value='/cop/cmy/updtCmmntyInf.do'/>";
			document.community.submit();
		}
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

	function fn_egov_inqire_user(cmmntyId){
		var retVal;
		var url = "<c:url value='/cop/com/openPopup.do?requestUrl=/cop/com/selectCmmntyUserList.do&trgetId="+cmmntyId+"&width=850&height=360'/>";
		var openParam = "dialogWidth: 850px; dialogHeight: 360px; resizable: 0, scroll: 1, center: 1";

		retVal = window.showModalDialog(url,"p_userInqire", openParam, "communityUserCallback");

		if(retVal != null){
			var tmp = retVal.split("|");
			document.community.emplyrId.value = tmp[0];
			document.community.emplyrNm.value = tmp[1];
		}
	}
	
	function communityUserCallback(retVal) {
		if (retVal != null) {
			var tmp = retVal.split("|");
			document.community.emplyrId.value = tmp[0];
			document.community.emplyrNm.value = tmp[1];
		}
	}
</script>
<title>커뮤니티 정보수정</title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>


</head>
<body>
<form:form commandName="community" name="community" method="post" >
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
<input name="cmmntyId" type="hidden" value="<c:out value='${cmmntyVO.cmmntyId}'/>"/>

<div id="border" style="width:730px">
	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="100%"class="title_left">
	   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="제목버튼이미지">
	   &nbsp;커뮤니티 정보수정</td>
	  <td width="30%">

	  </td>
	 </tr>
	</table>
	<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register">
	  <tr>
	    <th width="20%" height="23" class="required_text" nowrap >
	    	<label for="cmmntyNm">
	    		커뮤니티 명
	    	</label>
	    	<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
	    </th>
	    <td width="80%" nowrap colspan="3">
	    <input type="text" name="cmmntyNm" value='<c:out value="${cmmntyVO.cmmntyNm}" />' size="60"  maxlength="60"  style="width:100%" title="커뮤니티이름수정"/>
	    <br/><form:errors path="cmmntyNm" />
	    </td>
	  </tr>

	  <tr>
	    <th height="23" class="required_text" >
	  		<label for="cmmntyIntrcn">
	    		커뮤니티 소개
	    	</label>
	    	<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
	    </th>
	    <td colspan="3">
	    <textarea name="cmmntyIntrcn" class="textarea" cols="75" rows="4"  style="width:100%" title="커뮤니티소개입력"><c:out value="${cmmntyVO.cmmntyIntrcn}" /></textarea>
	    <form:errors path="cmmntyIntrcn" />
	    </td>
	  </tr>

	  <tr>
	    <th width="20%" height="23" class="" nowrap >게시판 정보</th>
	    <td width="30%" nowrap colspan="3">
	    	<c:forEach var="result" items="${result}" varStatus="status">
	     		<c:out value="${result.bbsNm}" /> /
	     	</c:forEach>
	    </td>
	  </tr>
	  <tr>
	    <th width="20%" height="23" class="required_text" nowrap >
	    	<label for="tmplatNm">
	    		템플릿 정보
	    	</label>
	    	<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
	    </th>
	    <td width="30%" nowrap >
	     <input name="tmplatNm" type="text" size="20" value='<c:out value="${cmmntyVO.tmplatNm}" />'  maxlength="20" readonly title="템플릿이름">
	     <input name="tmplatId" type="hidden" size="20" value='<c:out value="${cmmntyVO.tmplatId}"/>' >
	     &nbsp;<a href="javascript:fn_egov_inqire_tmplat();" style="selector-dummy: expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/search.gif' />"
	     			width="15" height="15" align="middle" alt="search"></a>
	     <br/><form:errors path="tmplatId" />
	    </td>
	    <th width="20%" height="23" class="required_text" nowrap >
	    	<label for="emplyrNm">
	    		커뮤니티 관리자
	    	</label>
	    	<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
	    </th>
	    <td width="30%" nowrap >
	     <input name="emplyrNm" type="text" size="20" value='<c:out value="${cmmntyUser.emplyrNm}" />'  maxlength="20" readonly title="커뮤니티관리자이름">
	     <input name="emplyrId" type="hidden" size="20" value='<c:out value="${cmmntyUser.emplyrId}"/>' >
	     &nbsp;<a href="javascript:fn_egov_inqire_user('<c:out value="${cmmntyVO.cmmntyId}"/>');" style="selector-dummy: expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/search.gif' />"
	     			width="15" height="15" align="middle" alt="required"></a>
	    <br/><form:errors path="emplyrId" />
	    </td>
	  </tr>
	  <tr>
	    <th width="20%" height="23" class="required_text" nowrap >
	    	<label for="useAt">
	    		사용여부
	    	</label>
	    	<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
	    </th>
	    <td width="80%" nowrap class="" colspan="3">
	     	<spring:message code="button.use" /> : <input type="radio" name="useAt" class="radio2" value="Y" <c:if test="${cmmntyVO.useAt == 'Y'}"> checked="checked"</c:if>>&nbsp;
	     	<spring:message code="button.notUsed" /> : <input type="radio" name="useAt" class="radio2" value="N" <c:if test="${cmmntyVO.useAt== 'N'}"> checked="checked"</c:if> onclick="alert('<spring:message code="cop.delete.confirm.msg" />');">
	    </td>
	  </tr>
	  <tr>
	    <th width="20%" height="23" class="" nowrap >생성자</th>
	    <td width="30%" nowrap><c:out value="${cmmntyVO.frstRegisterNm}" />
	    </td>
	    <th width="20%" height="23" class="" nowrap >생성일시</th>
	    <td width="30%" nowrap>
	     <c:out value="${cmmntyVO.frstRegisterPnttm}" />
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
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt="버튼이미지"></td>
      <td background="<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>" class="text_left" nowrap>
      <a href="javascript:fn_egov_updtCmmntyInf();"><spring:message code="button.update" /></a>
      </td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
      <td width="10"></td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt="버튼이미지"></td>
      <td background="<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>" class="text_left" nowrap>
      <a href="javascript:fn_egov_select_cmmntyInfs();"><spring:message code="button.list" /></a>
      </td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
     -->
      <td><span class="button"><input type="submit" value="<spring:message code="button.update" />" title="<spring:message code="button.update" />" onclick="javascript:fn_egov_updtCmmntyInf();return false;"></span></td>
      <td width="10"></td>
      <td><span class="button"><input type="button" value="<spring:message code="button.list" />" title="<spring:message code="button.list" />" onclick="javascript:fn_egov_select_cmmntyInfs();return false;"></span></td>
	</tr>
	</table>
	</div>
</div>
</form:form>
</body>
</html>
