<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%
 /**
  * @Class Name : EgovTnextrlHrInfoRegist.jsp
  * @Description : 외부인사 속성 등록화면
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css"> 
<title>외부인사정보</title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>

<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css'/>">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="tnextrlHrInfoVO" staticJavascript="false" xhtml="true" cdata="false" />
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/showModalDialog.js'/>" ></script>
<script type="text/javaScript" language="javascript">
	/* ********************************************************
	 * 초기화
	 ******************************************************** */
	function fn_egov_init_TnextrlHrInfo(){
		//	document.getElementById("bsnsYear").value = "2009";
	}
	
	/* ********************************************************
	 * 목록 으로 가기
	 ******************************************************** */
	function fn_egov_list_TnextrlHrInfo(){
		location.href = "<c:url value='/uss/ion/ecc/EgovTnextrlHrInfoList.do' />";
	}
	
	/* ********************************************************
	 * 저장처리화면
	 ******************************************************** */
	function fn_egov_save_TnextrlHrInfo(){
		var varFrom = document.getElementById("tnextrlHrInfoVO");
	
		if(confirm("저장 하시겠습니까?")){
			varFrom.action =  "<c:url value='/uss/ion/ecc/EgovTnextrlHrInfoRegist.do' />";
			varFrom.brth.value = fn_egov_SelectBoxValue('brthYYYY') + "" + fn_egov_SelectBoxValue('brthMM') + "" + fn_egov_SelectBoxValue('brthDD');
	
			if(varFrom.eventCn.value == "" || varFrom.eventId.value == "" ){
				alert("행사/이벤트/캠페인 정보를  선택 해주세요!");
				varFrom.eventCn.focus();
				return;
			}
			if(!validateTnextrlHrInfoVO(varFrom)){
				return;
			}else{
				varFrom.submit();
			}
		}
	}
	/* ********************************************************
	 * 이벤트 조회 팝업
	 ******************************************************** */
	function fn_egov_EventCmpgnListPopup_TnextrlHrInfo(){
		window.showModalDialog("<c:url value='/uss/ion/ecc/EgovEventCmpgnListPopup.do' />", self,"dialogWidth=800px;dialogHeight=500px;resizable=yes;center=yes");
	}
	
	/************************************************************************
	//
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
<body onLoad="fn_egov_init_TnextrlHrInfo();">
<div id="content" style="width:712px">
<!-- 상단타이틀 -->
<form:form commandName="tnextrlHrInfoVO" name="tnextrlHrInfoVO" action="" method="post">

<!-- 상단 타이틀  영역 -->
<table width="100%" cellpadding="3" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
	<img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif'/>" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지">&nbsp;외부인사정보 등록
  </td>
 </tr>
</table>
<!-- 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<!-- 등록  폼 영역  -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="행사/이벤트/캠페인 정보, 성별, 외부인사명, 생년월일, 직업유형, 소속기관, 전화번호, 이메일주소 입니다">
  <tr>
    <th scope="col" width="20%" height="23" class="required_text"><label for="eventCn">행사/이벤트/캠페인 정보</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="행사/이벤트/캠페인 정보" title="행사/이벤트/캠페인 정보"></th>
    <td width="80%" nowrap>
      <input name="eventCn" id="eventCn" type="text" size="73" value="" maxlength="70" style="width:300px;" readonly="readonly" title="eventCn">
      <a href="#Link" onClick="fn_egov_EventCmpgnListPopup_TnextrlHrInfo()">
      <img src="<c:url value='/images/egovframework/com/cmm/icon/search2.gif'/>" align="middle" style="border:0px" alt="행사/이벤트/캠페인 정보" title="행사/이벤트/캠페인 정보">
      </a>
      <input name="eventId" id="eventId" type="hidden" value="5">
    </td>
  </tr>
  <tr>
    <th scope="col" height="23" class="required_text"><label for="sexdstnCode">성별</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="성별" title="성별"></th>
    <td>
		<select name="sexdstnCode" title="성별">
			<option value="">선택</option>
			<c:forEach items="${comCode014}" var="comCodeList" varStatus="status">
				<option value="${comCodeList.code}">${comCodeList.codeNm}</option>
			</c:forEach>
		</select>
      	<div><form:errors path="sexdstnCode" cssClass="error" /></div>
    </td>
  </tr>

  <tr>
    <th scope="col" width="20%" height="23" class="required_text" ><label for="extrlHrNm">외부인사명</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="외부인사명" title="외부인사명"></th>
    <td width="80%">
       <input name="extrlHrNm" type="text" size="73" value="" maxlength="50" style="width:300px;" alt="외부인사명" title="외부인사명">
       <div><form:errors path="extrlHrNm" cssClass="error" /></div>
    </td>
  </tr>

  <tr>
    <th scope="col" width="20%" height="23" class="required_text" ><label for="brthYYYY">생년월일</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="생년월일" title="생년월일"></th>
    <td width="80%">
       <select name="brthYYYY" id="brthYYYY" title="생년">
       	<option value="">선택</option>
	     <c:forEach var="h" begin="1960" end="2009" step="1">
	      	<option value="${h}">${h}</option>
	      </c:forEach>
       </select>년
       <select name="brthMM" id="brthMM" title="생년월">
       	<option value="">선택</option>
	     <c:forEach var="h" begin="1" end="12" step="1">
	      	<option value="<c:if test="${h < 10}">0</c:if>${h}"><c:if test="${h < 10}">0</c:if>${h}</option>
	      </c:forEach>
       </select>월
       <select name="brthDD" id="brthDD" title="생년일">
       <option value="">선택</option>
	     <c:forEach var="h" begin="1" end="31" step="1">
	      	<option value="<c:if test="${h < 10}">0</c:if>${h}"><c:if test="${h < 10}">0</c:if>${h}</option>
	      </c:forEach>
       </select>일
       <input name="brth" id="brth" type="hidden" value="">
       <div><form:errors path="brthYYYY" cssClass="error" /></div>
       <div><form:errors path="brthMM" cssClass="error" /></div>
       <div><form:errors path="brthDD" cssClass="error" /></div>
    </td>
  </tr>

  <tr>
    <th scope="col" width="20%" height="23" class="required_text" nowrap ><label for="occpTyCode">직업유형</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="직업유형" title="직업유형"></th>
    <td width="80%" nowrap>
		<select name="occpTyCode" title="직업유형">
			<option value="">선택</option>
			<c:forEach items="${comCode034}" var="comCodeList" varStatus="status">
				<option value="${comCodeList.code}">${comCodeList.codeNm}</option>
			</c:forEach>
		</select>
      	<div><form:errors path="occpTyCode" cssClass="error" /></div>
    </td>
  </tr>

  <tr>
    <th scope="col" width="20%" height="23" class="required_text" nowrap ><label for="psitnInsttNm">소속기관</label></th>
    <td width="80%" nowrap>
       <input name="psitnInsttNm" type="text" size="73" value="" maxlength="70" style="width:300px;" alt="소속기관" title="소속기관">
    </td>
  </tr>

  <tr>
    <th scope="col" width="20%" height="23" class="required_text" nowrap ><label for="areaNo">전화번호</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="전화번호" title="전화번호"></th>
    <td width="80%" nowrap>
	    <input name="areaNo" type="text" size="4" value="" maxlength="4" title="전화번호(지역)">-
	    <input name="middleTelno" type="text" size="4" value="" maxlength="4" title="전화번호(국번)">-
	    <input name="endTelno" type="text" size="4" value="" maxlength="4" title="전화번호(지번)" >
		<div><form:errors path="areaNo" cssClass="error" /></div>
		<div><form:errors path="middleTelno" cssClass="error" /></div>
		<div><form:errors path="endTelno" cssClass="error" /></div>
    </td>
  </tr>
  <tr>
    <th scope="col" width="20%" height="23" class="required_text" nowrap ><label for="emailAdres">이메일주소</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="이메일주소" title="이메일주소"></th>
    <td width="80%" nowrap>
       <input name="emailAdres" type="text" size="73" value="" maxlength="50" style="width:300px;" alt="이메일주소" title="이메일주소">
       <div><form:errors path="endTelno" cssClass="error" /></div>
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
      <td ><span class="button"><input type="button" value="목록" onclick="JavaScript:fn_egov_list_TnextrlHrInfo();"></span></td>
      <td width="10"></td>
<!-- 
     <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt="버튼이미지"></td>
	 <td background="<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>" class="text_left" nowrap><a href="JavaScript:fn_egov_save_TnextrlHrInfo();"><spring:message code="button.save" /></a>
  	 </td>
  	 <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
      <td></td>
 -->
 	  <td><span class="button"><input type="submit" value="<spring:message code="button.save" />" title="<spring:message code="button.save" />" onclick="javascript:fn_egov_save_TnextrlHrInfo();return false;"></span></td>
	</tr>
	</table>
</center>
<input name="cmd" type="hidden" value="<c:out value='save'/>"/>
</form:form>
</div>

</body>
</html>
