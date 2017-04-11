<%--
  Class Name : EgovQustnrRespondManageRegist.jsp
  Description : 응답자정보 등록 페이지
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
<html lang="ko">
<head>
<title>응답자정보 등록</title>
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
		varFrom.action =  "<c:url value='/uss/olp/qrm/EgovQustnrRespondManageRegist.do' />";
		varFrom.brth.value = fn_egov_SelectBoxValue('brthYYYY') + "" + fn_egov_SelectBoxValue('brthMM') + "" + fn_egov_SelectBoxValue('brthDD');
		
		if(varFrom.qestnrCn.value == "" ||
				varFrom.qestnrTmplatId.value == "" ||
				varFrom.qestnrId.value == ""  
				){
			alert("설문지정보를  입력해주세요!");
			varFrom.qestnrCn.focus();
			return;
		}
		
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

 	window.showModalDialog("<c:url value='/uss/olp/qmc/EgovQustnrManageListPopup.do' />", self,"dialogWidth:800px;dialogHeight:500px;resizable:yes;center:yes");
 	
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
<body onLoad="fn_egov_init_QustnrRespondManage()">
<DIV id="content" style="width:712px">
<!-- 자바스크립트 경고 태그  -->
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<!-- 상단타이틀 -->
<form:form commandName="qustnrRespondManageVO" name="qustnrRespondManageVO" action="" method="post">
<!-- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <h1><img src="${ImgUrl}icon/tit_icon.gif" width="16" height="16" hspace="3" align="middle" alt="">&nbsp;응답자정보 등록</h1></td>
 </tr>
</table>

<!-- 등록  폼 영역  -->

<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="이 표는 응답자정보를 제공하며, 설문관리정보, 성별, 직업, 생년월일, 응답자명, 전화번호 정보로 구성되어 있습니다 .">
  <tr> 
    <th scope="row" width="20%" height="23" class="required_text" nowrap >설문지정보<img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목" width="15" height="15"></th>
    <td width="80%" nowrap>
	<input name="qestnrCn" id="qestnrCn" type="text" title="설문지정보 입력" size="73" value="" maxlength="4000" style="width:300px;">
    <a href="#LINK" onClick="fn_egov_QustnrManageListPopup_QustnrItemManage()">   	
	<img src="${ImgUrl}icon/search2.gif" onClick=""align="middle" style="border:0px" alt="설문지정보" title="설문지정보">
	</a>
	<input name="qestnrId" id="qestnrId" type="hidden" value="">
	<input name="qestnrTmplatId" id="qestnrTmplatId" type="hidden" value="">  
    </td>
  </tr>
  <tr> 
    <th scope="row" width="20%" height="23" class="required_text" nowrap >성별<img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목" width="15" height="15"></th>
    <td width="80%" nowrap>


<form:select path="sexdstnCode" title="성별 선택">
	<option value="">선택</option>
	<form:options items="${comCode014}" itemValue="code" itemLabel="codeNm"/>
</form:select>
<div><form:errors path="sexdstnCode"/></div> 

      	
    </td>
  </tr>
  <tr> 
    <th scope="row" width="20%" height="23" class="required_text" nowrap >직업<img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목" width="15" height="15"></th>
    <td width="80%" nowrap>

<form:select path="occpTyCode" title="직업 선택">
	<option value="">선택</option>
	<form:options items="${comCode034}" itemValue="code" itemLabel="codeNm"/>
</form:select>
<div><form:errors path="occpTyCode"/></div> 

    </td>
  </tr>
  <tr> 
    <th scope="row" height="23" class="required_text" >생년월일<img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목" width="15" height="15"></th>
    <td>
       <select name="brthYYYY" id="brthYYYY" title="생년 선택">
	     <c:forEach var="h" begin="1960" end="2009" step="1">
	      	<option value="${h}">${h}</option>
	      </c:forEach>
       </select>년
       <select name="brthMM" id="brthMM" title="월 선택">
	     <c:forEach var="h" begin="1" end="12" step="1">
	      	<option value="<c:if test="${h < 10}">0</c:if>${h}"><c:if test="${h < 10}">0</c:if>${h}</option>
	      </c:forEach>
       </select>월
       <select name="brthDD" id="brthDD" title="일 선택">
	     <c:forEach var="h" begin="1" end="31" step="1">
	      	<option value="<c:if test="${h < 10}">0</c:if>${h}"><c:if test="${h < 10}">0</c:if>${h}</option>
	      </c:forEach>
       </select>일
       <input name="brth" id="brth" type="hidden" value="">
    </td>
  </tr> 
  
  <tr> 
    <th scope="row" width="20%" height="23" class="required_text" nowrap >응답자명<img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목" width="15" height="15"></th>
    <td width="80%" nowrap>
		<input name="respondNm" type="text" title="응답자명 입력" size="73" value="" maxlength="50" style="width:120px;">
		<div><form:errors path="respondNm" cssClass="error" /></div>
    </td>
  </tr>
  
  <tr> 
    <th scope="row" width="20%" height="23" class="required_text" nowrap >전화번호<img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목" width="15" height="15"></th>
    <td width="80%" nowrap>
      <input name="areaNo" type="text" title="지역번호 입력" size="4" value="" maxlength="4">-
      <input name="middleTelno" type="text" title="국번 입력" size="4" value="" maxlength="4">-
      <input name="endTelno" type="text" title="전화번호 입력" size="4" value="" maxlength="4">
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

<input name="cmd" type="hidden" value="<c:out value='save'/>">
</form:form>
</DIV>

</body>
</html>
