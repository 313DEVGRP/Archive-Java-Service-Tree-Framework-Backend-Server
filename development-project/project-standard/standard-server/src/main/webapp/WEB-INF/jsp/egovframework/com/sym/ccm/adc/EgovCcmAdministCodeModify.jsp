<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
 /**
  * @Class Name  : EgovCcmAdministCodeModify.jsp
  * @Description : EgovCcmAdministCodeModify 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.04.01   이중호              최초 생성
  *
  *  @author 공통서비스팀
  *  @since 2009.04.01
  *  @version 1.0
  *  @see
  *
  */
%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<html lang="ko">
<head>
<title>행정코드 수정</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="administCode" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />" ></script>
<script type="text/javaScript" language="javascript">

	/* ********************************************************
	 * 목록 으로 가기
	 ******************************************************** */
	function fn_egov_list_AdministCode(){
		location.href = "<c:url value='/sym/ccm/adc/EgovCcmAdministCodeList.do' />";
	}
	
	/* ********************************************************
	 * 저장처리화면
	 ******************************************************** */
	 function fn_egov_modify_AdministCode(form){
			var creatDe = document.administCode.creatDe.value;
			var ablDe   = document.administCode.ablDe.value;
	
			if (creatDe > ablDe && ablDe != "") {
				alert("생성일, 폐기일 전후가 잘못되었습니다.\n확인 후 처리하시오.");
				//abort;
				document.administCode.ablDe.value = "";
				administCode.vablDe.value = "";
				return false;
			}
	
			if(confirm("<spring:message code='common.save.msg'/>")){
			if(!validateAdministCode(form)){
				return;
			}else{
				form.submit();
			}
		}
	}
	
	/* ********************************************************
	 * 행정코드 팝업 창 열기
	 ******************************************************** */
	function fn_egov_AdministCodePopup(upperAdministZoneCode,upperAdministZoneNm){
	
		var retVal;
	
		var url = "<c:url value='/sym/ccm/adc/EgovCcmAdministCodePopup.do' />";
	
		var varParam = new Object();
		//varParam.administZoneSe = administCode.administZoneSe.value;
		varParam.administZoneSe = document.getElementById("administCode").administZoneSe.value;
	
		// IE
		//var openParam = "dialogWidth:252px;dialogHeight:175px;scroll:no;status:no;center:yes;resizable:yes;";
	
		// FIREFOX
		var openParam = "dialogWidth:700px;dialogHeight:500px;scroll:no;status:no;center:yes;resizable:yes;";
	
	 	retVal = window.showModalDialog(url, varParam, openParam);
	 	
	 	if(retVal) {
			upperAdministZoneCode.value = retVal.administZoneCode;
			upperAdministZoneNm.value   = retVal.administZoneNm;
		}
	}
	
	function showModalDialogCallback(retVal) {
		 
		if(retVal) {
    		document.administCode.upperAdministZoneCode.value = retVal.administZoneCode;
    		document.administCode.upperAdministZoneNm.value   = retVal.administZoneNm;
		}
	}
	
	function fnInit() {
		document.administCode.vcreatDe.value = "<c:out value='${fn:substring(administCode.creatDe, 0,4)}'/>-<c:out value='${fn:substring(administCode.creatDe, 4,6)}'/>-<c:out value='${fn:substring(administCode.creatDe, 6,8)}'/>";
		document.administCode.vablDe.value   = "<c:out value='${fn:substring(administCode.ablDe, 0,4)}'/>-<c:out value='${fn:substring(administCode.ablDe, 4,6)}'/>-<c:out value='${fn:substring(administCode.ablDe, 6,8)}'/>";
	}

</script>
</head>
<body onLoad="fnInit();">
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<DIV id="content" style="width:712px">
<!-- 상단타이틀 -->
<form:form commandName="administCode" name="administCode" method="post">
<input name="cmd" type="hidden" value="Modify">
<form:hidden path="administZoneSe"/>
<form:hidden path="administZoneCode"/>
<!-- 상단 타이틀  영역 -->
<table width="700" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left"><h1 class="title_left">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;행정코드 수정</h1></td>
 </tr>
</table>
<!-- 줄간격조정  -->
<table width="700" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<!-- 등록  폼 영역  -->
<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="행정구역명, 생성일자, 폐기일자, 상위행정구역코드, 사용여부를 수정할 수 있는 행정코드 수정 테이블이다.">
<CAPTION style="display: none;">행정코드 수정</CAPTION>
  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap >행정구역구분<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td>
		<select name="administZoneSe" disabled title="행정구역구분">
			<option value="1" <c:if test="${administCode.administZoneSe == '1'}">selected="selected"</c:if> >법정동</option>
			<option value="2" <c:if test="${administCode.administZoneSe == '2'}">selected="selected"</c:if> >행정동</option>
		</select>
    </td>
  </tr>
  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap >행정구역코드<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td>${administCode.administZoneCode}</td>
  </tr>
  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap >행정구역명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td width="80%" nowrap>
      <form:input  path="administZoneNm" size="60" maxlength="60" title="행정구역명"/>
      <form:errors path="administZoneNm"/>
    </td>
  </tr>
  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap >생성일자<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td width="80%" nowrap>
    <input type="hidden" name="cal_url" id="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" >
      <input name="vcreatDe" size="10" maxlength="10" readonly onClick="javascript:fn_egov_NormalCalendar(document.administCode, document.administCode.creatDe, document.administCode.vcreatDe);" title="생성일자(새창)"/>
		<a href="#noscript" onclick="fn_egov_NormalCalendar(document.administCode, document.administCode.creatDe, document.administCode.vcreatDe); return false;" style="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" alt="달력창팝업버튼이미지"></a>
      <form:hidden path="creatDe"/>
      <form:errors path="creatDe"/>
    </td>
  </tr>
  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap >폐기일자<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td width="80%" nowrap>
      <input  name="vablDe" size="10" maxlength="10" readonly onClick="javascript:fn_egov_NormalCalendar(document.administCode, document.administCode.ablDe, document.administCode.vablDe);" title="폐기일자(새창)"/>
		<a href="#noscript" onclick="fn_egov_NormalCalendar(document.administCode, document.administCode.ablDe, document.administCode.vablDe); return false;" style="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" alt="달력창팝업버튼이미지"></a>
      <form:hidden path="ablDe"/>
      <form:errors path="ablDe"/>
    </td>
  </tr>
  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap >상위행정구역코드<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td width="80%" nowrap>
      <input  name="upperAdministZoneNm" size="60" maxlength="60" value="${administCode.upperAdministZoneNm}" readonly onClick="javascript:fn_egov_AdministCodePopup(administCode.upperAdministZoneCode,administCode.upperAdministZoneNm)" title="상위행정구역코드"/>
		<a href="#noscript" onclick="fn_egov_AdministCodePopup(administCode.upperAdministZoneCode,administCode.upperAdministZoneNm); return false;" style="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/search2.gif' />" alt="행정코드찾기"></a>
      <form:hidden  path="upperAdministZoneCode"/>
      <form:errors path="upperAdministZoneCode"/>
    </td>
  </tr>
  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap >사용여부<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" alt="필수입력표시"  width="15" height="15"></th>
    <td width="30%" nowrap class="title_left" colspan="3">
      <form:select path="useAt" title="사용여부">
	      <form:option value="Y" label="Yes"/>
	      <form:option value="N" label="No"/>
      </form:select>
    </td>
  </tr>
</table>
<table width="700" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="10"></td>
  </tr>
</table>

<!-- 줄간격조정  -->
<table width="700" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
<tr><td>
<!-- 목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <!-- 
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif' />" alt="목록" width="8" height="20"></td>
  <td style="background-image:URL(<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>);" class="text_left" nowrap><a href="#noscript" onclick="fn_egov_list_AdministCode(); return false;">목록</a></td>
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif' />" alt="목록" width="8" height="20"></td>
  <td width="10"></td>
   -->
  <td><span class="button"><input type="submit" value="목록" onclick="fn_egov_list_AdministCode(); return false;"></span></td>
  <td><span class="button"><input type="submit" value="저장" onclick="fn_egov_modify_AdministCode(document.administCode); return false;"></span></td>
</tr>
</table>
</td></tr>
</table>

</form:form>
</DIV>
</body>
</html>
