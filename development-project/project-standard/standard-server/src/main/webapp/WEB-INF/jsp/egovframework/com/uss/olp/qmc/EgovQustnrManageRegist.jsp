<%--
  Class Name : EgovQustnrManageRegist.jsp
  Description : 설문관리 등록 페이지
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
<title>설문관리 등록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css">
<link type="text/css" rel="stylesheet" href="${CssUrl}button.css">
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>

<validator:javascript formName="qustnrManageVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript" language="javascript">


/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_QustnrManage(){

	//document.getElementById("qestnrBeginDe").value = "2008-01-01";
	//document.getElementById("qestnrEndDe").value = "2008-01-30";
}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_QustnrManage(){
	location.href = "<c:url value='/uss/olp/qmc/EgovQustnrManageList.do' />";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_save_QustnrManage(form){

	var sStartDay = form.qestnrBeginDe.value.replaceAll("-","");
	var sEndDay = form.qestnrEndDe.value.replaceAll("-","");

	var iStartDay = parseInt(sStartDay);
	var iEndDay = parseInt(sEndDay);

	if(confirm("<spring:message code="common.save.msg" />")){
		if(!validateQustnrManageVO(form)){
			return;
		}else{
			if(iStartDay > iEndDay || iEndDay < iStartDay){
				alert("설문기간  시작일은 종료일  보다 클수 없고 \n\n설문기간 종료일은 시작일 보다 작을수 없습니다!");
				return;
			}
			form.submit();
		}
	}
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
</head>
<body onLoad="fn_egov_init_QustnrManage()">
<DIV id="content" style="width:712px">

<!-- 자바스크립트 경고 태그  -->
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<!-- 상단타이틀 -->
<form:form commandName="qustnrManageVO" name="qustnrManageVO">

<!-- 상단 타이틀  영역 -->
<div class="title_left" style="width:100%;margin:0 0 0 0;">
	<h1><img src="<c:out value="${ImgUrl}" />icon/tit_icon.gif" width="16" height="16" hspace="3" style="vertical-align:middle; display:inline-block;" alt="제목아이콘이미지">&nbsp;설문관리 등록</h1>
</div>

<!--  줄간격조정  -->
<div style="width:100%;border:solid 0px #000000;height:3px"></div>

<!-- 수정  폼 영역  -->

<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="등록 을 제공한다">
<caption>등록 을 제공한다</caption>
  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="qestnrSj">설문제목</label><img src="${ImgUrl}icon/required.gif" title="필수항목" alt="필수항목" width="15" height="15"></th>
    <td width="80%" nowrap>
      <form:input path="qestnrSj" size="73" cssClass="txaIpt" maxlength="250" title="설문제목 입력"/>
      <form:errors path="qestnrSj"/>
    </td>
  </tr>
  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="qestnrPurps">설문목적</label><img src="${ImgUrl}icon/required.gif" title="필수항목" alt="필수항목" width="15" height="15"></th>
    <td width="80%" nowrap>
    	<form:textarea path="qestnrPurps" rows="3" cols="20" cssClass="txaClass" title="설문목적 입력"/>
    	<form:errors path="qestnrPurps"/>
    </td>
  </tr>
  <tr>
    <th scope="row" height="23" class="required_text" ><label for="qestnrWritngGuidanceCn">설문작성안내 내용</label><img src="${ImgUrl}icon/required.gif" title="필수항목" alt="필수항목" width="15" height="15"></th>
    <td>
    	<form:textarea path="qestnrWritngGuidanceCn" rows="3" cols="20" cssClass="txaClass" title="설문작성안내 내용 입력"/>
    	<form:errors path="qestnrWritngGuidanceCn"/>
    </td>
  </tr>

  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="qestnrTrget">설문대상</label><img src="${ImgUrl}icon/required.gif" title="필수항목" alt="필수항목" width="15" height="15"></th>
    <td width="80%" nowrap>
		<form:select path="qestnrTrget" title="설문대상 선택">
			<option value="">선택</option>
		    <form:options items="${comCode034}" itemValue="code" itemLabel="codeNm"/>
		</form:select>
		<div><form:errors path="qestnrTrget"/></div>
    </td>
  </tr>

  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="qestnrBeginDe">설문기간</label><img src="${ImgUrl}icon/required.gif" title="필수항목" alt="필수항목" width="15" height="15"></th>
    <td width="80%" nowrap>
      <form:input path="qestnrBeginDe" size="10" maxlength="10" readonly="true" title="설문대상 시작일 입력"/>
      <form:errors path="qestnrBeginDe"/>
      <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(document.forms[0], document.forms[0].qestnrBeginDe);">
      <img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" align="middle" style="border:0px" alt="달력창팝업버튼이미지">
      </a>
      ~<form:input path="qestnrEndDe" size="10" maxlength="10" readonly="true" title="설문대상 종료일 입력"/>
      <form:errors path="qestnrEndDe"/>
      <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(document.forms[0], document.forms[0].qestnrEndDe);">
      <img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" align="middle"  style="border:0px" alt="달력창팝업버튼이미지">
      </a>
    </td>
  </tr>

    <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap >템플릿 유형<img src="${ImgUrl}icon/required.gif" title="필수항목" alt="필수항목" width="15" height="15"></th>
    <td width="80%" nowrap>

		<table border="0" cellspacing="0" cellpadding="0" align="center">
		<tr>
		<c:forEach items="${listQustnrTmplat}" var="resultQustnrTmplat" varStatus="status">
		<td><img src="<c:url value='/uss/olp/qtm/EgovQustnrTmplatManageImg.do' />?qestnrTmplatId=${resultQustnrTmplat.qestnrTmplatId}" align="middle" alt="템플릿유형 이미지" title="템플릿유형 이미지"></td>
		</c:forEach>
		</tr>
		<tr>
		<c:forEach items="${listQustnrTmplat}" var="resultQustnrTmplat" varStatus="status">
		  <td height="10" align="center"><input type="radio" name="qestnrTmplatId" value="${resultQustnrTmplat.qestnrTmplatId}" style="border:0px" checked>${resultQustnrTmplat.qestnrTmplatTy}</td>
		</c:forEach>
		</tr>
		</table>

    </td>
  </tr>
</table>

<!-- 줄간격조정  -->
<div style="width:100%;border:solid 0px #000000;height:3px"></div>

<center>
<!-- 목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center" summary="목록/저장 버튼을 제공한다.">
<caption>목록/저장 버튼을 제공한다</caption>
<tr>
	<td><img src="<c:out value="${ImgUrl}" />btn/bu2_left.gif" width="8" height="20" alt="버튼이미지"></td>
	<td class="btnBackground" nowrap><a href="<c:url value='/uss/olp/qmc/EgovQustnrManageList.do' />">목록</a></td>
	<td><img src="<c:out value="${ImgUrl}" />btn/bu2_right.gif" width="8" height="20" alt="버튼이미지"></td>
	<th scope="col">&nbsp;</th>
	<td>
		<span class="button"><input type="submit" value="저장" onClick="fn_egov_save_QustnrManage(this.form); return false;"></span>
	</td>
</tr>
</table>

</center>

<input name="cmd" type="hidden" value="<c:out value='save'/>">
<input type="hidden" name="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>">
<!-- <input type="button" value="button" onclick="fn_egov_save_QustnrManage(this.form);"/>  -->
</form:form>

</DIV>

</body>
</html>
