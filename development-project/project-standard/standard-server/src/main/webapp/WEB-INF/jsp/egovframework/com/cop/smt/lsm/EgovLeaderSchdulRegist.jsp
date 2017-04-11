<%--
  Class Name : EgovLeaderSchdulRegist.jsp
  Description : 간부일정관리 등록 페이지
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2010.06.29    장철호          최초 생성

    author   : 공통서비스 개발팀 장철호
    since    : 2010.06.29

--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="ImgUrl" value="${pageContext.request.contextPath}/images/egovframework/com/cop/smt/lsm/"/>
<c:set var="CssUrl" value="${pageContext.request.contextPath}/css/egovframework/com/cop/smt/lsm/"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/utl/EgovCmmUtl.js' />"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="leaderSchdulVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">


/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_LeaderSchdul(){

	   //document.getElementsByName('reptitSeCode')[0].checked = true;
	   if("${leaderSchdulVO.schdulBgnDe}".length > 0){
		   var schdulBgnde = "${leaderSchdulVO.schdulBgnDe}";
		   document.getElementById("schdulBgndeYYYMMDD").value = schdulBgnde.substring(0,4) + "-" + schdulBgnde.substring(4,6) + "-" + schdulBgnde.substring(6,8);
	   }

	   if("${leaderSchdulVO.schdulEndDe}".length > 0){
		   var schdulEndde = "${leaderSchdulVO.schdulEndDe}";
		   document.getElementById("schdulEnddeYYYMMDD").value = schdulEndde.substring(0,4) + "-" + schdulEndde.substring(4,6) + "-" + schdulEndde.substring(6,8);
	   }

	   document.getElementById("schdulChargerId").value = "${schdulChargerId}";
	   document.getElementById("schdulChargerName").value = "${schdulChargerName}";
	   document.getElementsByName('reptitSeCode')[0].checked = true;
	   document.getElementById("endDay").style.display = "none";
}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_LeaderSchdul(){
	var vFrom = document.leaderSchdulVO;
	vFrom.action = "<c:url value='/cop/smt/lsm/usr/selectLeaderSchdulList.do' />";
	vFrom.submit();
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_save_LeaderSchdul(form){
	//form.submit();return;

	if(form.reptitSeCode[0].checked){
		form.schdulEnddeYYYMMDD.value = form.schdulBgndeYYYMMDD.value;
	}

	if(!validateLeaderSchdulVO(form)){
		return;
	}

	var schdulBgndeYYYMMDD = document.getElementById('schdulBgndeYYYMMDD').value;
	var schdulEnddeYYYMMDD = document.getElementById('schdulEnddeYYYMMDD').value;

	if(isDate(schdulBgndeYYYMMDD, "일정시작일자") == false) {
        return;
    }

    if(isDate(schdulEnddeYYYMMDD, "일정종료일자") == false) {
        return;
    }

    var schdulBgnHourMin = fn_egov_SelectBoxValue('schdulBgndeHH') +  fn_egov_SelectBoxValue('schdulBgndeMM');
	var schdulEndHourMin = fn_egov_SelectBoxValue('schdulEnddeHH') +  fn_egov_SelectBoxValue('schdulEnddeMM');

	if(schdulBgnHourMin > schdulEndHourMin){
		alert("일정종료시분이 일정시작시분보다 빠를수 없습니다.");
		return;
	}

	form.schdulBgnDe.value = schdulBgndeYYYMMDD.replaceAll('-','') + fn_egov_SelectBoxValue('schdulBgndeHH') +  fn_egov_SelectBoxValue('schdulBgndeMM');
	form.schdulEndDe.value = schdulEnddeYYYMMDD.replaceAll('-','') + fn_egov_SelectBoxValue('schdulEnddeHH') +  fn_egov_SelectBoxValue('schdulEnddeMM');

	if(parseInt(form.schdulBgnDe.value) > parseInt(form.schdulEndDe.value)){
		alert("일정종료일시가 일정시작일시보다 빠를수 없습니다.");
		return;
	}

	if(confirm("<spring:message code="common.save.msg" />")){
		form.submit();

	}
}


/* ********************************************************
* 아이디  팝업창열기
* fn_egov_schdulCharger_LeaderSchdule
* param 타이틀, ID 폼명, 사원번호 폼명, 사원명 폼명, 부서명 폼명
******************************************************** */
function fn_egov_schdulCharger_LeaderSchdule(strTitle, frmUniqId, frmEmplNo, frmEmplyrNm, frmOrgnztNm){
	var arrParam = new Array(6);
	arrParam[0] = window;
	arrParam[1] = strTitle;
	arrParam[2] = frmUniqId;
	arrParam[3] = frmEmplNo;
	arrParam[4] = frmEmplyrNm;
	arrParam[5] = frmOrgnztNm;

 	window.showModalDialog("<c:url value='/cop/smt/lsm/selectEmplyrListPopup.do' />", arrParam,"dialogWidth=800px;dialogHeight=500px;resizable=yes;center=yes");
}

function viewEndDay(num){
	if(num == "1"){
		document.getElementById("endDay").style.display = "none";
	}else{
		document.getElementById("endDay").style.display = "";
	}
}

/* ********************************************************
* RADIO BOX VALUE FUNCTION
******************************************************** */
function fn_egov_RadioBoxValue(sbName)
{
	var FLength = document.getElementsByName(sbName).length;
	var FValue = "";
	for(var i=0; i < FLength; i++)
	{
		if(document.getElementsByName(sbName)[i].checked == true){
			FValue = document.getElementsByName(sbName)[i].value;
		}
	}
	return FValue;
}
/* ********************************************************
* SELECT BOX VALUE FUNCTION
******************************************************** */
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
/* ********************************************************
* PROTOTYPE JS FUNCTION
******************************************************** */
String.prototype.trim = function(){
	return this.replace(/^\s+|\s+$/g, "");
}

String.prototype.replaceAll = function(src, repl){
	 var str = this;
	 if(src == repl){return str;}
	 while(str.indexOf(src) != -1) {
	 	str = str.replace(src, repl);
	 }
	 return str;
}
</script>
<title>간부일정관리 등록</title>
</head>
<body onLoad="fn_egov_init_LeaderSchdul()">
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<div id="content" style="width:712px">
<form:form commandName="leaderSchdulVO" action="${pageContext.request.contextPath}/cop/smt/lsm/mng/insertLeaderSchdul.do" name="leaderSchdulVO" method="post">
<!-- 상단타이틀 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <h1><img src="${ImgUrl}icon/tit_icon.gif" width="16" height="16" hspace="3" style="vertical-align: middle" alt="">&nbsp;간부일정관리 등록</h1></td>
 </tr>
</table>
<!-- //상단타이틀 -->
<!-- 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<!-- //줄간격조정  -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="이 표는 간부일정정보를 등록하기 위한 표이며, 일정구분, 간부, 일정명, 일정내용, 일정장소, 반복구분, 날짜/시간, 담당자 정보로 구성되어 있습니다 .">
<caption>간부일정관리 등록</caption>
<tbody>
  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="schdulSe">일정구분</label><img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
    <td width="80%" >
        <form:select path="schdulSe" title="일정구분 선택">
            <form:option value="" label="선택"/>
            <form:options items="${schdulSe}" itemValue="code" itemLabel="codeNm"/>
        </form:select>
        <div><form:errors path="schdulSe" cssClass="error"/></div>
    </td>
 </tr>
 <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="leaderName">간부</label><img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
    <td width="80%" >
		<table cellspacing="0" cellpadding="0" border="0">
		<tr>
			<td width="100px" style="padding:0px 0px 0px 0px;margin:0px 0px 0px 0px;">
			<form:input path="leaderName" size="15" readonly="true" maxlength="10" title="간부명"/>
			</td>
			<td style="padding:0px 0px 0px 2px;margin:0px 0px 0px 0px;">
			<a href="<c:url value='/cop/smt/lsm/selectEmplyrListPopup.do' />" target="_blank"  title="새 창으로 이동"  onClick="fn_egov_schdulCharger_LeaderSchdule('간부', 'leaderId', '', 'leaderName', '');return false;">
			<img src="${ImgUrl}icon/search2.gif" style="border:0px" alt="간부선택 검색" title="간부선택 검색">
			</a>
			</td>
		</tr>
		</table>
		<div><form:errors path="leaderName" cssClass="error"/></div>
       <form:hidden path="leaderId" />

    </td>
  </tr>
  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="schdulNm">일정명</label><img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
    <td width="80%" >
      <form:input path="schdulNm" size="92" maxlength="255" title="일정명"/>
      <div><form:errors path="schdulNm" cssClass="error"/></div>
    </td>
  </tr>
  <tr>
    <th scope="row" height="23" class="required_text" ><label for="schdulNm">일정내용</label><img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
    <td>
        <form:textarea path="schdulCn" rows="5" cols="90" title="일정내용"/>
    	<div><form:errors path="schdulCn" cssClass="error"/></div>
    </td>
  </tr>
 <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="schdulPlace">일정장소</label><img src="${ImgUrl}icon/no_required.gif" width="15" height="15" alt="선택항목"></th>
    <td width="80%" >
      <form:input path="schdulPlace" size="92" maxlength="255" title="일정장소"/>
      <div><form:errors path="schdulPlace" cssClass="error"/></div>
    </td>
  </tr>
  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="reptitSeCode">반복구분</label><img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
    <td width="80%">
       <form:radiobutton path="reptitSeCode" value="1" onchange="viewEndDay('1')" onclick="viewEndDay('1')"/>반복없음
       <form:radiobutton path="reptitSeCode" value="2" onchange="viewEndDay('2')" onclick="viewEndDay('2')"/>매일
       <form:radiobutton path="reptitSeCode" value="3" onchange="viewEndDay('3')" onclick="viewEndDay('3')"/>매주
       <form:radiobutton path="reptitSeCode" value="4" onchange="viewEndDay('4')" onclick="viewEndDay('4')"/>매월
       <div><form:errors path="reptitSeCode" cssClass="error"/></div>
    </td>
  </tr>
  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="schdulBgndeYYYMMDD">날짜/시간</label><img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
    <td width="80%" >
    <table cellspacing="0" cellpadding="0" border="0">
		<tr>
			<td>
			    <form:input path="schdulBgndeYYYMMDD" size="10" maxlength="10" title="일정시작일자"/>
			    <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(document.forms[0], document.forms[0].schdulBgndeYYYMMDD);">
			    <img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" style="border:0px;vertical-align: bottom" alt="달력창팝업버튼이미지">
			    </a>
			    &nbsp&nbsp
		    </td>
		    <td>
			    <div id="endDay">~&nbsp&nbsp
			    <form:input path="schdulEnddeYYYMMDD" size="10" maxlength="10" title="일정종료일자"/>
			    <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(document.forms[0], document.forms[0].schdulEnddeYYYMMDD);">
			    <img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" style="border:0px;vertical-align: bottom" alt="달력창팝업버튼이미지">
			    </a>&nbsp;
				</div>
			</td>
			<td>
		        <form:select path="schdulBgndeHH" title="일정시작 시 선택">
		            <form:options items="${schdulBgndeHH}" itemValue="code" itemLabel="codeNm"/>
		        </form:select>시
		        <form:select path="schdulBgndeMM" title="일정시작 분 선택">
		            <form:options items="${schdulBgndeMM}" itemValue="code" itemLabel="codeNm"/>
		        </form:select>분
				~
		        <form:select path="schdulEnddeHH" title="일정종료 시 선택">
		            <form:options items="${schdulEnddeHH}" itemValue="code" itemLabel="codeNm"/>
		        </form:select>시
		        <form:select path="schdulEnddeMM" title="일정종료 분 선택">
		            <form:options items="${schdulEnddeMM}" itemValue="code" itemLabel="codeNm"/>
		        </form:select>분
		      </td>
		  </tr>
	</table>
    </td>
  </tr>
  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="schdulChargerName">담당자</label><img src="${ImgUrl}icon/required.gif" width="15" height="15" alt="필수항목"></th>
    <td width="80%" >
		<table cellspacing="0" cellpadding="0" border="0">
		<tr>
			<td width="100px" style="padding:0px 0px 0px 0px;margin:0px 0px 0px 0px;">
			<form:input path="schdulChargerName" size="15" readonly="true" maxlength="10" title="담당자명"/>
			</td>
			<td style="padding:0px 0px 0px 2px;margin:0px 0px 0px 0px;">
			<a href="<c:url value='/cop/smt/lsm/selectEmplyrListPopup.do' />" target="_blank"  title="새 창으로 이동"  onClick="fn_egov_schdulCharger_LeaderSchdule('담당자', 'schdulChargerId', '', 'schdulChargerName', '');return false;">
			<img src="${ImgUrl}icon/search2.gif" style="border:0px" alt="담당자선택 검색" title="담당자선택 검색">
			</a>
			</td>
		</tr>
		</table>
		<div><form:errors path="schdulChargerName" cssClass="error"/></div>
       <form:hidden path="schdulChargerId" />

    </td>
  </tr>
</tbody>
</table>
<!-- 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="10"></td>
</tr>
</table>
<!-- //줄간격조정  -->
<center>
<!-- 목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
	<td><span class="button"><input type="submit" value="<spring:message code="button.save" />" onclick="fn_egov_save_LeaderSchdul(document.forms[0]); return false;"></span></td>
    <td>&nbsp;&nbsp;</td>
    <td><span class="button"><a href="<c:url value='/cop/smt/lsm/usr/selectLeaderSchdulList.do'/>" onclick="fn_egov_list_LeaderSchdul(); return false;"><spring:message code="button.list" /></a></span></td>
</tr>
</table>
<!-- /목록/저장버튼  -->
</center>
<input name="searchMode" id="searchMode" type="hidden" value="<c:out value='${searchMode}'/>">
<input name="year" id="year" type="hidden" value="<c:out value='${year}'/>">
<input name="month" id="month" type="hidden" value="<c:out value='${month}'/>">
<input name="week" id="week" type="hidden" value="<c:out value='${week}'/>">
<input name="day" id="day" type="hidden" value="<c:out value='${day}'/>">
<input name="schdulBgnDe" id="schdulBgnDe" type="hidden">
<input name="schdulEndDe" id="schdulEndDe" type="hidden">
<input name="cmd" id="cmd" type="hidden" value="<c:out value='save'/>">
<input type="hidden" name="cal_url" id="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" >
</form:form>
</div>

</body>
</html>
