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
  * @Class Name : EgovClubUpdt.jsp
  * @Description : 동호회 수정화면
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
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css" >
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/showModalDialog.js'/>"></script>
<script type="text/javascript">
	function fn_egov_updt_clb(){
		if (confirm('<spring:message code="common.update.msg" />')) {
			document.club.action = "<c:url value='/cop/clb/updateClbInf.do'/>";
			document.club.submit();
		}
	}

	function fn_egov_select_clbInfs(){
		document.club.action = "<c:url value='/cop/clb/selectClubInfs.do'/>";
		document.club.submit();
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

	function fn_egov_inqire_cmmntyUser(clbId){
		var retVal;
		var url = "<c:url value='/cop/com/openPopup.do?requestUrl=/cop/com/selectClubUserList.do&trgetId="+clbId+"&width=850&height=360'/>";
		var openParam = "dialogWidth: 850px; dialogHeight: 360px; resizable: 0, scroll: 1, center: 1";

		retVal = window.showModalDialog(url,"p_userInqire", openParam, "communityUserCallback");

		if(retVal != null){
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

</script>
<title>동호회 정보수정</title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>


</head>
<body>
<form:form commandName="club" name="club" method="post" >
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
<input name="clbId" type="hidden" value='<c:out value="${clubVO.clbId}" />' />
<input name="cmmntyId" type="hidden" value='<c:out value="${clubVO.cmmntyId}" />' />


<div id="border" style="width:730px">
	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="100%"class="title_left">
	  	<h1>
	  		<img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" alt="">&nbsp;동호회 정보수정
	  	</h1>
	  </td>
	 </tr>
	</table>
	<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register"  summary="소속 커뮤니티 정보, 동호회 명, 동호회 소개, 게시판 정보, 템플릿 정보, 동호회 운영자, 사용여부, 생성자, 생성일시   입니다" >
	  <tr>
	    <th scope="col" width="20%" height="23" class="" nowrap >소속 커뮤니티 정보</th>
	    <td width="30%" nowrap colspan="3"><c:out value="${clubVO.cmmntyNm}" />
	    </td>
	  </tr>
	  <tr>
	    <th scope="col" width="20%" height="23" class="required_text" nowrap ><label for="clbNm">동호회 명
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></label></th>
	    <td width="80%" nowrap colspan="3">
	      <input name="clbNm" type="text" size="60" id = "clbNm" value='<c:out value="${clubVO.clbNm}" />' maxlength="60" style="width:100%">
	      <br/><form:errors path="clbNm" />
	    </td>
	  </tr>
	  <tr>
	    <th scope="col" height="23" class="required_text" ><label for="clbIntrcn">동호회 소개
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></label></th>
	    <td colspan="3">
	      <textarea name="clbIntrcn" class="textarea"  id="clbIntrcn" cols="75" rows="4" style="width:100%"><c:out value="${clubVO.clbIntrcn}" /></textarea>
	      <form:errors path="clbIntrcn" />
	    </td>
	  </tr>
	  <tr>
	    <th scope="col" width="20%" height="23" class="" nowrap >게시판 정보</th>
	    <td width="30%" nowrap colspan="3">
	    	<c:forEach var="result" items="${result}" varStatus="status">
	     		<c:out value="${result.bbsNm}" /> /
	     	</c:forEach>
	    </td>
	  </tr>
	  <tr>
	    <th scope="col" width="20%" height="23" class="required_text" nowrap ><label for="tmplatNm">템플릿 정보
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></label></th>
	    <td width="30%" nowrap colspan="3">
	    <input name="tmplatId" type="hidden" value='<c:out value="${clubVO.tmplatId}" />' />
	    <input name="tmplatNm" type="text" size="20" id="tmplatNm" value='<c:out value="${clubVO.tmplatNm}" />'  maxlength="20" readonly >
	     &nbsp;<a href="#LINK" onclick="javascript:fn_egov_inqire_tmplat()" style="selector-dummy: expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/search.gif' />"
	     			width="15" height="15" align="middle" alt="search" /></a>
	     <br/><form:errors path="tmplatId" />
	    </td>
	  </tr>
	  <tr>
	    <th scope="col" width="20%" height="23" class="required_text" nowrap ><label for="emplyrNm">동호회 운영자
	    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></label></th>
	    <td width="30%" nowrap colspan="3">
	    <input name="emplyrId" type="hidden" value='<c:out value="${clubUser.emplyrId}" />' />
	    <input name="emplyrNm" type="text" size="20" id = "emplyrNm" value='<c:out value="${clubUser.emplyrNm}" />' maxlength="20" readonly >
	     &nbsp;<a href="#LINK" onclick="javascript:fn_egov_inqire_cmmntyUser('<c:out value="${clubVO.clbId}" />');" style="selector-dummy: expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/search.gif' />"
	     			width="15" height="15" align="middle" alt="search"></a>
	     	<br/><form:errors path="emplyrId" />
	    </td>
	  </tr>
	  <tr>
	    <th scope="col" width="20%" height="23" class="required_text" nowrap >사용여부
		<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
	    <td width="80%" nowrap class="" colspan="3">
	  	<spring:message code="button.use" /> : <input type="radio" name="useAt" class="radio2" value="Y" <c:if test="${clubVO.useAt == 'Y'}"> checked="checked"</c:if>>&nbsp;
	   	<spring:message code="button.notUsed" /> : <input type="radio" name="useAt" class="radio2" value="N" <c:if test="${clubVO.useAt== 'N'}"> checked="checked"</c:if> onclick="alert('<spring:message code="cop.delete.confirm.msg" />');">
	    </td>
	  </tr>
	  <tr>
	    <th scope="col" width="20%" height="23" class="" nowrap >생성자</th>
	    <td width="30%" nowrap>
	     <c:out value="${clubVO.frstRegisterNm}" />
	    </td>
	    <th scope="col" width="20%" height="23" class="" nowrap >생성일시</th>
	    <td width="30%" nowrap>
	     <c:out value="${clubVO.frstRegisterPnttm}" />
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

      <span class="button"><input type="submit" value="수정" onclick="fn_egov_updt_clb();"></span>
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
