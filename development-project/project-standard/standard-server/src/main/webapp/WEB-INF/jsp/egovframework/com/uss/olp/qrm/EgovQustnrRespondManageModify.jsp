<%--
  Class Name : EgovQustnrRespondManageModify.jsp
  Description : 응답자정보 수정 페이지
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
<c:set var="ImgUrl" value="${pageContext.request.contextPath}/images/egovframework/com/cmm/"/>
<c:set var="CssUrl" value="${pageContext.request.contextPath}/css/egovframework/com/"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%pageContext.setAttribute("crlf", "\r\n"); %>
<html lang="ko">
<head>
<title>회의정보 관리</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css">
<link type="text/css" rel="stylesheet" href="${CssUrl}button.css">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="qustnrRespondManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/showModalDialog.js'/>" ></script>
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_QustnrRespondManage(){

}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_QustnrRespondManage(){
	location.href = "<c:url value='/uss/olp/qrm/EgovQustnrRespondManageList.do' />";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_save_QustnrRespondManage(){
	var varFrom = document.qustnrRespondManageVO;

	if(confirm("<spring:message code="common.save.msg" />")){
		varFrom.action =  "<c:url value='/uss/olp/qrm/EgovQustnrRespondManageModify.do' />";

		varFrom.brth.value = fn_egov_SelectBoxValue('brthYYYY') + "" + fn_egov_SelectBoxValue('brthMM') + "" + fn_egov_SelectBoxValue('brthDD');

		if(!validateQustnrRespondManageVO(varFrom)){
			return;
		}else{
			varFrom.submit();
		}
	}
}
/* ********************************************************
 * 설문지정보 팝업창열기
 ******************************************************** */
 function fn_egov_QustnrManageListPopup_QustnrItemManage(){

 	window.showModalDialog("<c:url value='/uss/olp/qmc/EgovQustnrManageListPopup.do' />", self,"dialogWidth800px;dialogHeight500px;resizableyes;centeryes");

 }
 /* ********************************************************
  * 설문지문항정보 팝업창열기
  ******************************************************** */
  function fn_egov_QustnrQestnManageListPopup_QustnrItemManage(){

	var sParam = "";
	sParam = sParam + "searchCondition=QESTNR_ID";
	sParam = sParam + "&searchKeyword=" + document.getElementById("qestnrId").value;

  	window.showModalDialog("<c:url value='/uss/olp/qrm/EgovQustnrQestnManageListPopup.do' />?" + sParam, self,"dialogWidth800px;dialogHeight500px;resizableyes;centeryes");

  }
/* ********************************************************
 * 설문항목정보 팝업창열기
 ******************************************************** */
function fn_egov_QustnrItemManageListPopup_QustnrItemManage(){

	var sParam = "";
	sParam = sParam + "searchCondition=QESTNR_QESITM_ID";
	sParam = sParam + "&searchKeyword=" + document.getElementById("qestnrQesitmId").value;

  	window.showModalDialog("<c:url value='/uss/olp/qim/EgovQustnrItemManageListPopup.do' />?" + sParam, self,"dialogWidth800px;dialogHeight500px;resizableyes;centeryes");

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
<body onLoad="fn_egov_init_QustnrRespondManage();">
<DIV id="content" style="width:712px">
<!-- 자바스크립트 경고 태그  -->
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<!-- 상단타이틀 -->
<form:form commandName="qustnrRespondManageVO" name="qustnrRespondManageVO" action="" method="post">
<!-- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <h1><img src="${ImgUrl}icon/tit_icon.gif" width="16" height="16" hspace="3" align="middle" alt="">&nbsp;응답자정보 수정</h1></td>
 </tr>
</table>

<!-- 등록  폼 영역  -->

<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="이 표는 응답자정보를 제공하며, 설문관리정보, 성별, 직업, 생년월일, 응답자명, 전화번호 정보로 구성되어 있습니다 .">
  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap >설문관리정보<img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목" width="15" height="15"></th>
    <td width="80%" nowrap>
	<c:out value="${fn:replace(resultList[0].qestnrSj , crlf , '<br/>')}" escapeXml="false" />
    </td>
  </tr>
  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap >성별<img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목" width="15" height="15"></th>
    <td width="80%" nowrap>

<select name="sexdstnCode" title="성별 선택">
	<option value="">선택</option>
	<c:forEach items="${comCode014}" var="comCodeList" varStatus="status">
		<option value="${comCodeList.code}" <c:if test="${comCodeList.code eq resultList[0].sexdstnCode}">selected</c:if>>${comCodeList.codeNm}</option>
	</c:forEach>
</select>

    </td>
  </tr>
  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap >직업<img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목" width="15" height="15"></th>
    <td width="80%" nowrap>

<select name="occpTyCode" title="직업 선택">
	<option value="">선택</option>
	<c:forEach items="${comCode034}" var="comCodeList" varStatus="status">
		<option value="${comCodeList.code}" <c:if test="${comCodeList.code eq resultList[0].occpTyCode}">selected</c:if>>${comCodeList.codeNm}</option>
	</c:forEach>
</select>

    </td>
  </tr>
  <tr>
    <th scope="row" height="23" class="required_text" >생년월일<img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목" width="15" height="15"></th>
    <td>
       <select name="brthYYYY" id="brthYYYY" title="년도 선택">
	     <c:forEach var="h" begin="1960" end="2009" step="1">
	      	<option value="${h}" <c:if test="${fn:substring(resultList[0].brthdy, 0, 4) ==  h}">selected</c:if>>${h}</option>
	      </c:forEach>
       </select>년
       <select name="brthMM" id="brthMM" title="월 선택">
	     <c:forEach var="h" begin="1" end="12" step="1">
			<c:choose>
			    <c:when test="${h < 10}">
			 	<c:set var="brthMM" value="0${h}"/>
			    </c:when>
			    <c:otherwise>
			    <c:set var="brthMM" value="${h}"/>
			    </c:otherwise>
			</c:choose>
	      	<option value="<c:if test="${h < 10}">0</c:if>${h}" <c:if test="${fn:substring(resultList[0].brthdy, 4, 6) ==  brthMM}">selected</c:if>><c:if test="${h < 10}">0</c:if>${h}</option>
	      </c:forEach>
       </select>월
       <select name="brthDD" id="brthDD" title="일 선택">
	     <c:forEach var="h" begin="1" end="31" step="1">
			<c:choose>
			    <c:when test="${h < 10}">
			 	<c:set var="brthDD" value="0${h}"/>
			    </c:when>
			    <c:otherwise>
			    <c:set var="brthDD" value="${h}"/>
			    </c:otherwise>
			</c:choose>
	      	<option value="<c:if test="${h < 10}">0</c:if>${h}" <c:if test="${fn:substring(resultList[0].brthdy, 6, 8) ==  brthDD}">selected</c:if>><c:if test="${h < 10}">0</c:if>${h}</option>
	      </c:forEach>
       </select>일
       <input name="brth" id="brth" type="hidden" value="">

    </td>
  </tr>

  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap >응답자명<img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목" width="15" height="15"></th>
    <td width="80%" nowrap>
		<input name="respondNm" type="text" title="응답자명 입력" size="73" value="${resultList[0].respondNm}" maxlength="50" style="width:120px;">
		<div><form:errors path="respondNm" cssClass="error" /></div>
    </td>
  </tr>

  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap >전화번호<img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목" width="15" height="15"></th>
    <td width="80%" nowrap>
      <input name="areaNo" type="text" title="지역번호 입력" size="4" value="${resultList[0].areaNo}" maxlength="4">-
      <input name="middleTelno" type="text" title="국번 입력" size="4" value="${resultList[0].middleTelno}" maxlength="4">-
      <input name="endTelno" type="text" size="4" title="번호 입력" value="${resultList[0].endTelno}" maxlength="4">
      <div><form:errors path="areaNo" cssClass="error" /></div>
      <div><form:errors path="middleTelno" cssClass="error" /></div>
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
  <td><img src="${ImgUrl}btn/bu2_left.gif"  width="8" height="20" alt="버튼이미지"></td>
  <td class="btnBackground" nowrap><a href="<c:url value='/uss/olp/qrm/EgovQustnrRespondManageList.do' />">목록</a></td>
  <td><img src="${ImgUrl}btn/bu2_right.gif"  width="8" height="20" alt="버튼이미지"></td>
  <td>&nbsp;</td>
  <td><span class="button"><input type="submit" value="저장" onclick="fn_egov_save_QustnrRespondManage(document.forms[0]); return false;"></span></td>
</tr>
</table>
</center>
<input name="qestnrRespondId" type="hidden" value="${resultList[0].qestnrRespondId}">
<input name="cmd" type="hidden" value="<c:out value='save'/>">
</form:form>
</DIV>

</body>
</html>
