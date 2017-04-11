<%--
  Class Name : EgovQustnrItemManageRegist.jsp
  Description : 설문항목 등록 페이지
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
<title>회의정보 관리</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css">
<link type="text/css" rel="stylesheet" href="${CssUrl}button.css">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="qustnrItemManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/showModalDialog.js'/>" ></script>
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_QustnrItemManage(){

	document.getElementById("iemSn").value = "1";
	//document.getElementById("qestnrEndDe").value = "2008-01-30";
}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_QustnrItemManage(){
	location.href = "<c:url value='/uss/olp/qim/EgovQustnrItemManageList.do' />";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_save_QustnrItemManage(){
	var varFrom = document.getElementById("qustnrItemManageVO");

	if(confirm("<spring:message code="common.save.msg" />")){

		varFrom.action =  "<c:url value='/uss/olp/qim/EgovQustnrItemManageRegist.do' />";

		if(varFrom.qestnrCn.value == "" ||
				varFrom.qestnrTmplatId.value == "" ||
				varFrom.qestnrId.value == ""
				){
			alert("설문지정보를  입력해주세요!");
			varFrom.qestnrCn.focus();
			return;

		}
		if(varFrom.qestnrQesitmCn.value == "" ||
				varFrom.qestnrQesitmId.value == ""
				){
			alert("설문문항정보를  입력해주세요!");
			varFrom.qestnrQesitmCn.focus();
			return;

		}

		if(!validateQustnrItemManageVO(varFrom)){
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
 /* ********************************************************
  * 설문지문항정보 팝업창열기
  ******************************************************** */
  function fn_egov_QustnrQestnManageListPopup_QustnrItemManage(){

	var sParam = "";
	sParam = sParam + "searchCondition=QESTNR_ID";
	sParam = sParam + "&searchKeyword=" + document.getElementById("qestnrId").value;

  	window.showModalDialog("<c:url value='/uss/olp/qqm/EgovQustnrQestnManageListPopup.do' />?" + sParam, self,"dialogWidth:800px;dialogHeight:500px;resizable:yes;center:yes");

  }
</script>
</head>
<body onLoad="fn_egov_init_QustnrItemManage()">
<DIV id="content" style="width:712px">
<!-- 자바스크립트 경고 태그  -->
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<!-- 상단타이틀 -->
<form:form commandName="qustnrItemManageVO"  action="" method="post">
<!-- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <h1><img src="${ImgUrl}icon/tit_icon.gif" width="16" height="16" hspace="3" align="middle" alt="">&nbsp;설문항목 등록</h1></td>
 </tr>
</table>

<!-- 등록  폼 영역  -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="이 표는 설문항목 목록 정보를 제공하며, 설문정보, 설문문항정보, 항목순번, 항목내용, 기타답변여부 정보로 구성되어 있습니다 .">
<tr>
<th scope="row" width="20%" height="23" class="required_text" nowrap>설문정보<img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목" width="15" height="15"></th>
<td width="80%" nowrap>
  <input name="qestnrCn" id="qestnrCn" type="text" size="73" value="" title="설문정보 입력" maxlength="4000" style="width:300px;">
   <a href="#LINK" onClick="fn_egov_QustnrManageListPopup_QustnrItemManage()">
   <img src="${ImgUrl}icon/search2.gif" onClick=""align="middle" style="border:0px" alt="설문정보" title="설문정보">
   </a>
  <input name="qestnrId" id="qestnrId" type="hidden" value="">
  <input name="qestnrTmplatId" id="qestnrTmplatId" type="hidden" value="">
</td>
</tr>
<tr>
<th scope="row" width="20%" height="23" class="required_text" nowrap>설문문항정보<img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목" width="15" height="15"></th>
<td width="80%" nowrap>
  <input name="qestnrQesitmCn" id="qestnrQesitmCn" type="text" title="설문문항정보 입력" size="73" value="" maxlength="4000" style="width:300px;">
   <a href="#LINK" onClick="fn_egov_QustnrQestnManageListPopup_QustnrItemManage()">
  <img src="${ImgUrl}icon/search2.gif" align="middle" alt="설문문항정보" title="설문문항정보">
  </a>
  <input name="qestnrQesitmId" id="qestnrQesitmId" type="hidden" value="">
</td>
</tr>
<tr>
<th scope="row" height="23" class="required_text" >항목 순번<img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목" width="15" height="15"></th>
<td>
  <input name="iemSn" id="iemSn" type="text" size="5" title="항목 순번" value="" maxlength="5" style="width:100px;">
  <div><form:errors path="iemSn" cssClass="error" /></div>
</td>
</tr>
<tr>
<th scope="row" height="23" class="required_text" >항목 내용<img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목" width="15" height="15"></th>
<td>
  <textarea name="iemCn" class="textarea" title="항목 내용 입력" cols="75" rows="5"  style="width:100%;"></textarea>
  <div><form:errors path="iemCn" cssClass="error" /></div>
</td>
</tr>
<tr>
<th scope="row" width="20%" height="23" class="required_text" nowrap >기타답변여부<img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목" width="15" height="15"></th>
<td width="80%" nowrap>
   <select name="etcAnswerAt" title="기타답변여부 선택">
   	<option value="N">N</option>
   	<option value="Y">Y</option>
  	</select>
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
  <td class="btnBackground" nowrap><a href="<c:url value='/uss/olp/qim/EgovQustnrItemManageList.do' />">목록</a></td>
  <td><img src="${ImgUrl}btn/bu2_right.gif"  width="8" height="20" alt="버튼이미지"></td>
  <td>&nbsp;</td>
  <td><span class="button"><input type="submit" value="저장" onclick="fn_egov_save_QustnrItemManage(document.forms[0]); return false;"></span></td>
</tr>
</table>
</center>

<input name="cmd" type="hidden" value="<c:out value='save'/>">
</form:form>
</DIV>

</body>
</html>
