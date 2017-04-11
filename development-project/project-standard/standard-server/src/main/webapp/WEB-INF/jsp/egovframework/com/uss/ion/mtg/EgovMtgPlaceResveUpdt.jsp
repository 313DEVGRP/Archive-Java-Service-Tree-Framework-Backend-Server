<%
/**
 * @Class Name : EgovMtgPlaceResveUpdt.java
 * @Description : EgovMtgPlaceResveUpdt.jsp
 * @Modification Information
 * @
 * @  수정일                    수정자                수정내용
 * @ ---------     --------    ---------------------------
 * @ 2010.06.29    이      용                최초 생성
 *
 *  @author 이      용
 *  @since 2010.06.29
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
<title>회의실 예약수정</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />" ></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="mtgPlaceResve" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">
	function fncSelectMtgPlaceResveManageList() {
	    var varFrom = document.getElementById("mtgPlaceResve");
	    varFrom.action = "<c:url value='/uss/ion/mtg/selectMtgPlaceResveManageList.do'/>";
	    varFrom.submit();
	}
	
	function fncUpdtMtgPlaceResve() {
	     var varFrom = document.getElementById("mtgPlaceResve");
	     varFrom.action = "<c:url value='/uss/ion/mtg/updtMtgPlaceResve.do'/>";
		 if(varFrom.dplactCeck.value == "")  alert("회의실 예약 중복확인을 하신 후 회의실 예약을 해주세요.");
		 else if(varFrom.dplactCeck.value == "N") alert("이미 회의실이 예약되어 있습니다.");
		 else if(varFrom.dplactCeck.value == "Y") {
		     if(confirm("저장 하시겠습니까?")){
			     if(!validateMtgPlaceResve(varFrom)){
			         return;
			     }else{
			        varFrom.submit();
			     }
		     }
		 }
	}
	
	function fncDeleteMtgPlaceResve() {
	    var varFrom = document.getElementById("mtgPlaceResve");
	    varFrom.action = "<c:url value='/uss/ion/mtg/deleteMtgPlaceResve.do'/>";
	    if(confirm("삭제 하시겠습니까?")){
	        varFrom.submit();
	    }
	}
	
	/* ********************************************************
	* 회의실 중복여부 확인  팝업창열기
	* fn_egov_dplact_ceck
	* ******************************************************** */
	function fn_egov_dplact_ceck(){
	
		var varFrom = document.getElementById("mtgPlaceResve");
		var beginTm = varFrom.resveBeginTm.value;
		var endTm   = varFrom.resveEndTm.value;
	
		if((endTm-beginTm) > 0){
			var arrParam = new Array(1);
			arrParam[0] = window;
		    sTempValue = "sTmResveDe="+varFrom.resveDe.value+"&sTmResveBeginTm="+varFrom.resveBeginTm.value+"&sTmResveEndTm="+varFrom.resveEndTm.value+"&sTmMtgPlaceId="+varFrom.mtgPlaceId.value+"&sTmResveId="+varFrom.resveId.value;
		 	window.showModalDialog("/uss/ion/mtg/mtgPlaceResveDplactCeck.do?"+sTempValue, arrParam,"dialogWidth=450px;dialogHeight=150px;resizable=yes;center=yes");
	   }
	   else alert("예약시작시간이  예약종료시간보다 작거나 같습니다. 예약시간을 확인해  주세요.");
	}
	
	/* ********************************************************
	* 회의실 이미지  팝업창열기
	* fn_egov_dplact_ceck
	* ******************************************************** */
	function fn_mtgPlace_image(){
		var varFrom = document.getElementById("mtgPlaceResve");
		var arrParam = new Array(1);
		arrParam[0] = window;
	    sTempValue = "sTmMtgPlaceId="+varFrom.mtgPlaceId.value;
	 	window.showModalDialog("/uss/ion/mtg/selectMtgPlaceImage.do?"+sTempValue, arrParam,"dialogWidth=720px;dialogHeight=400px;resizable=yes;center=yes");
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
<form:form commandName="mtgPlaceResve" name="mtgPlaceResve" method="post" action="${pageContext.request.contextPath}/uss/ion/mtg/updtMtgPlaceResve.do">
<input type="hidden" name="cmd" value="updt" >
<input type="hidden" name="mtgPlaceId" value ="<c:out value='${mtgPlaceManageVO.mtgPlaceId}'/>">
<input type="hidden" name="resveId"    value ="<c:out value='${mtgPlaceManageVO.resveId   }'/>"/>
<input type="hidden" name="resveManId" value ="<c:out value='${mtgPlaceManageVO.resveManId   }'/>"/>

<input type="hidden" name="dplactCeck" id="dplactCeck">

<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="30%"class="title_left">
     <h1><img src="/images/egovframework/com/uss/ion/mtg/icon/tit_icon.gif" width="16" height="16" hspace="3" style="vertical-align: middle" alt="">&nbsp;회의실 예약수정</h1></td>
  <td width="60%">&nbsp;</td>
  <th width="10%" align="right">

       <table border="0" cellspacing="0" cellpadding="0">
        <tr>
	      <td><span class="button"><input type="submit" value="<spring:message code="button.save" />" onclick="fncUpdtMtgPlaceResve(); return false;"></span></td>
          <td>&nbsp;&nbsp;</td>
          <td><span class="button"><a href="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManageList.do'/>?searchCondition=1" onclick="fncSelectMtgPlaceResveManageList(); return false;"><spring:message code="button.list" /></a></span></td>
        </tr>
       </table>
  </th>
 </tr>
</table>


<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="회의실예약관리 수정" >
<caption>회의실예약관리수정</caption>

  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="mtgSj">제목</label><img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt="필수입력표시"></th>
    <td colspan ="3">
       <input name="mtgSj" type="text" size="50" value="<c:out value='${mtgPlaceManageVO.mtgSj}'/>" maxlength="70" style="width:90%;" title="제목">
    </td>
  </tr>
  <tr>
    <th height="23" class="required_text" scope="row">회의실명<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt="필수입력표시"></th>
    <td colspan ="3"><c:out value='${mtgPlaceManageVO.mtgPlaceNm}'/></td>
  </tr>
  <tr>
    <th height="23" class="required_text" scope="row">회의실 위치<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt="필수입력표시"></th>
    <td colspan ="3"><c:out value='${mtgPlaceManageVO.lcSe}'/> <c:out value='${mtgPlaceManageVO.lcDetail}'/>
	    <c:if test="${!empty mtgPlaceManageVO.atchFileId}">
	    	<span class="button"><a href="#LINK" onclick="fn_mtgPlace_image(); return false;" title="새창으로">회의실 이미지</a></span>
	    </c:if>
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row">예약자<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt="필수입력표시"></th>
    <td width="30%"><c:out value='${mtgPlaceManageVO.mtgPlaceTemp4}'/></td>
    <th width="20%" height="23" class="required_text" scope="row">소속<img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>
    <td width="30%"><c:out value='${mtgPlaceManageVO.mtgPlaceTemp5}'/></td>
  </tr>
  <tr>
    <th height="23" class="required_text"  scope="row"><label for="resveDe">예약시간</label><img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt="필수입력표시"></th>
    <td colspan ="3">
    	  <input type="hidden" name="cal_url" id="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" >
	      <input name="resveDe" type="text" size="10" value="${mtgPlaceManageVO.resveDe }" title="예약일자" size="10" maxlength="10" >
	      <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(document.mtgPlaceResve, document.mtgPlaceResve.resveDe, document.mtgPlaceResve.resveDe);"
	    	style="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" alt="달력창팝업버튼이미지"
		    width="15" height="15"></a>
        <select name="resveBeginTm" title="예약시작시간">
	       	<option value="800"  <c:if test="${mtgPlaceManageVO.resveBeginTm == '800' }"> selected </c:if>>08:00</option>
	       	<option value="830"  <c:if test="${mtgPlaceManageVO.resveBeginTm == '830' }"> selected </c:if>>08:30</option>
	       	<option value="900"  <c:if test="${mtgPlaceManageVO.resveBeginTm == '900' }"> selected </c:if>>09:00</option>
	       	<option value="930"  <c:if test="${mtgPlaceManageVO.resveBeginTm == '930' }"> selected </c:if>>09:30</option>
	       	<option value="1000" <c:if test="${mtgPlaceManageVO.resveBeginTm == '1000'}"> selected </c:if>>10:00</option>
	       	<option value="1030" <c:if test="${mtgPlaceManageVO.resveBeginTm == '1030'}"> selected </c:if>>10:30</option>
	       	<option value="1100" <c:if test="${mtgPlaceManageVO.resveBeginTm == '1100'}"> selected </c:if>>11:00</option>
	       	<option value="1130" <c:if test="${mtgPlaceManageVO.resveBeginTm == '1130'}"> selected </c:if>>11:30</option>
	       	<option value="1200" <c:if test="${mtgPlaceManageVO.resveBeginTm == '1200'}"> selected </c:if>>12:00</option>
	       	<option value="1230" <c:if test="${mtgPlaceManageVO.resveBeginTm == '1230'}"> selected </c:if>>12:30</option>
	       	<option value="1300" <c:if test="${mtgPlaceManageVO.resveBeginTm == '1300'}"> selected </c:if>>13:00</option>
	       	<option value="1330" <c:if test="${mtgPlaceManageVO.resveBeginTm == '1330'}"> selected </c:if>>13:30</option>
	       	<option value="1400" <c:if test="${mtgPlaceManageVO.resveBeginTm == '1400'}"> selected </c:if>>14:00</option>
	       	<option value="1430" <c:if test="${mtgPlaceManageVO.resveBeginTm == '1430'}"> selected </c:if>>14:30</option>
	       	<option value="1500" <c:if test="${mtgPlaceManageVO.resveBeginTm == '1500'}"> selected </c:if>>15:00</option>
	       	<option value="1530" <c:if test="${mtgPlaceManageVO.resveBeginTm == '1530'}"> selected </c:if>>15:30</option>
	       	<option value="1600" <c:if test="${mtgPlaceManageVO.resveBeginTm == '1600'}"> selected </c:if>>16:00</option>
	       	<option value="1630" <c:if test="${mtgPlaceManageVO.resveBeginTm == '1630'}"> selected </c:if>>16:30</option>
	       	<option value="1700" <c:if test="${mtgPlaceManageVO.resveBeginTm == '1700'}"> selected </c:if>>17:00</option>
	       	<option value="1730" <c:if test="${mtgPlaceManageVO.resveBeginTm == '1730'}"> selected </c:if>>17:30</option>
	       	<option value="1800" <c:if test="${mtgPlaceManageVO.resveBeginTm == '1800'}"> selected </c:if>>18:00</option>
	       	<option value="1830" <c:if test="${mtgPlaceManageVO.resveBeginTm == '1830'}"> selected </c:if>>18:30</option>
	       	<option value="1900" <c:if test="${mtgPlaceManageVO.resveBeginTm == '1900'}"> selected </c:if>>19:00</option>
	       	<option value="1930" <c:if test="${mtgPlaceManageVO.resveBeginTm == '1930'}"> selected </c:if>>19:30</option>
	       	<option value="2000" <c:if test="${mtgPlaceManageVO.resveBeginTm == '2000'}"> selected </c:if>>20:00</option>
	       	<option value="2030" <c:if test="${mtgPlaceManageVO.resveBeginTm == '2030'}"> selected </c:if>>20:30</option>
	       	<option value="2100" <c:if test="${mtgPlaceManageVO.resveBeginTm == '2100'}"> selected </c:if>>21:00</option>
      	</select>
~        <select name="resveEndTm" title="예약종료시간">
	       	<option value="800"  <c:if test="${mtgPlaceManageVO.resveEndTm == '800' }"> selected </c:if>>08:00</option>
	       	<option value="830"  <c:if test="${mtgPlaceManageVO.resveEndTm == '830' }"> selected </c:if>>08:30</option>
	       	<option value="900"  <c:if test="${mtgPlaceManageVO.resveEndTm == '900' }"> selected </c:if>>09:00</option>
	       	<option value="930"  <c:if test="${mtgPlaceManageVO.resveEndTm == '930' }"> selected </c:if>>09:30</option>
	       	<option value="1000" <c:if test="${mtgPlaceManageVO.resveEndTm == '1000'}"> selected </c:if>>10:00</option>
	       	<option value="1030" <c:if test="${mtgPlaceManageVO.resveEndTm == '1030'}"> selected </c:if>>10:30</option>
	       	<option value="1100" <c:if test="${mtgPlaceManageVO.resveEndTm == '1100'}"> selected </c:if>>11:00</option>
	       	<option value="1130" <c:if test="${mtgPlaceManageVO.resveEndTm == '1130'}"> selected </c:if>>11:30</option>
	       	<option value="1200" <c:if test="${mtgPlaceManageVO.resveEndTm == '1200'}"> selected </c:if>>12:00</option>
	       	<option value="1230" <c:if test="${mtgPlaceManageVO.resveEndTm == '1230'}"> selected </c:if>>12:30</option>
	       	<option value="1300" <c:if test="${mtgPlaceManageVO.resveEndTm == '1300'}"> selected </c:if>>13:00</option>
	       	<option value="1330" <c:if test="${mtgPlaceManageVO.resveEndTm == '1330'}"> selected </c:if>>13:30</option>
	       	<option value="1400" <c:if test="${mtgPlaceManageVO.resveEndTm == '1400'}"> selected </c:if>>14:00</option>
	       	<option value="1430" <c:if test="${mtgPlaceManageVO.resveEndTm == '1430'}"> selected </c:if>>14:30</option>
	       	<option value="1500" <c:if test="${mtgPlaceManageVO.resveEndTm == '1500'}"> selected </c:if>>15:00</option>
	       	<option value="1530" <c:if test="${mtgPlaceManageVO.resveEndTm == '1530'}"> selected </c:if>>15:30</option>
	       	<option value="1600" <c:if test="${mtgPlaceManageVO.resveEndTm == '1600'}"> selected </c:if>>16:00</option>
	       	<option value="1630" <c:if test="${mtgPlaceManageVO.resveEndTm == '1630'}"> selected </c:if>>16:30</option>
	       	<option value="1700" <c:if test="${mtgPlaceManageVO.resveEndTm == '1700'}"> selected </c:if>>17:00</option>
	       	<option value="1730" <c:if test="${mtgPlaceManageVO.resveEndTm == '1730'}"> selected </c:if>>17:30</option>
	       	<option value="1800" <c:if test="${mtgPlaceManageVO.resveEndTm == '1800'}"> selected </c:if>>18:00</option>
	       	<option value="1830" <c:if test="${mtgPlaceManageVO.resveEndTm == '1830'}"> selected </c:if>>18:30</option>
	       	<option value="1900" <c:if test="${mtgPlaceManageVO.resveEndTm == '1900'}"> selected </c:if>>19:00</option>
	       	<option value="1930" <c:if test="${mtgPlaceManageVO.resveEndTm == '1930'}"> selected </c:if>>19:30</option>
	       	<option value="2000" <c:if test="${mtgPlaceManageVO.resveEndTm == '2000'}"> selected </c:if>>20:00</option>
	       	<option value="2030" <c:if test="${mtgPlaceManageVO.resveEndTm == '2030'}"> selected </c:if>>20:30</option>
	       	<option value="2100" <c:if test="${mtgPlaceManageVO.resveEndTm == '2100'}"> selected </c:if>>21:00</option>
      	</select>
      	<span class="button"><a href="#LINK" onclick="fn_egov_dplact_ceck(); return false;" title="새창으로">중복체크</a></span>
    </td>
  </tr>
  <tr>
    <th height="23" class="required_text"  scope="row"><label for="atndncNmpr">참석인원</label><img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>
    <td colspan ="3">
    <input name="atndncNmpr" type="text" size="10" value="<c:out value='${mtgPlaceManageVO.atndncNmpr}'/>" maxlength="3" style="width:5%;" title="참석인원">명
    </td>
  </tr>
  <tr>
    <th height="23" class="required_text"  scope="row"><label for="mtgCn">회의내용</label><img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>
    <td colspan ="3">
      <textarea id="mtgCn" name="mtgCn" class="txaClass" rows="4" cols="70" title="회의내용"><c:out value='${mtgPlaceManageVO.mtgCn}'/></textarea>
    </td>
  </tr>
</table>
</form:form>
<!-- ********** 여기까지 내용 *************** -->
</td>
</tr>
</table>
</DIV>
</body>
</html>