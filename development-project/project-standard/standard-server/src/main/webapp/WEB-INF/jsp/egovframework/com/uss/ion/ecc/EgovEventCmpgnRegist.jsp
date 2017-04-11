<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
  Class Name : EgovEventCmpgnRegist.jsp
  Description : 행사/이벤트/캠페인 등록
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2008.03.12    장동한          최초 생성

    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.12

--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator"%>

<html lang="ko">
<head>
<title>캠페인등록화면</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" >
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />" >
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="eventCmpgnVO" staticJavascript="false" xhtml="true" cdata="false" />
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_EventCmpgn(){
}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_EventCmpgn(){
	location.href = "<c:url value='/uss/ion/ecc/EgovEventCmpgnList.do' />";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_save_EventCmpgn(){


	var varFrom = document.getElementById("eventCmpgnVO");

	if(confirm("저장 하시겠습니까?")){

		varFrom.action =  "<c:url value='/uss/ion/ecc/EgovEventCmpgnRegist.do' />";
		if(!validateEventCmpgnVO(varFrom)){
			return;
		}else{
			<%-- 업무사용자만 승인 가능하도록 처리--%>
			<c:if test="${SUserSe eq 'USR'}">
			if(document.getElementsByName("eventConfmAt")[0].checked == true ){
				if(document.getElementById("eventConfmDe").value == ""){
					alert("승인 신청일을 입력해주세요!");
					document.getElementById("eventConfmDe").focus();
					return;
				}
			}
			</c:if>
			if(document.getElementById("svcUseNmprCo").value == ""){
				document.getElementById("svcUseNmprCo").value = "0" ;
			}
			varFrom.submit();
		}

	}
}
</script>
</head>
<body>
<DIV id="content" style="width: 712px">
<form:form commandName="eventCmpgnVO"  name="eventCmpgnVO" action="${pageContext.request.contextPath}/uss/ion/ecc/EgovEventCmpgnRegist.do"
           method="post" enctype="multipart/form-data">
	<!-- ----------------- 상단 타이틀  영역 -->
	<table width="100%" cellpadding="8" class="table-search" border="0">
		<tr>
			<td width="100%" class="title_left">
				<h1>
					<img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />"
					     width="16" height="16" hspace="3" align="middle" alt="" />&nbsp;행사/이벤트/캠페인등록
				</h1>
			</td>
		</tr>
	</table>
	<table width="100%" cellspacing="0" cellpadding="0" border="0">
		<tr>
			<td height="3px"></td>
		</tr>
	</table>
	<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register"
	       summary="행사유형, 행사내용, 행사시작일자, 행사종료일자, 서비스이용인원수, 담당자명, 준비물내용, 승인내용, 승인일 입니다" >
		<tr>
			<th scope="col" width="20%" height="23" class="required_text" nowrap>
				<label for="eventTyCode">행사유형</label>
				<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="행사유형">
			</th>
			<td width="80%" nowrap>
				<select name="eventTyCode" title="행사유형">
					<option value="">선택</option>
					<c:forEach items="${comCode035}" var="comCodeList"
						varStatus="status">
						<option value="${fn:trim(comCodeList.code)}">${comCodeList.codeNm}</option>
					</c:forEach>
				</select>
				<div><form:errors path="eventTyCode" cssClass="error" /></div>
			</td>
		</tr>

		<tr>
			<th scope="col" width="20%" height="23" class="required_text" nowrap>
				<label for="eventCn">행사내용</label>
				<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="행사내용">
			</th>
			<td width="80%" nowrap>
				<textarea name="eventCn" class="textarea" cols="75" rows="4" style="width: 100%;" title="행사내용"></textarea>
				<div><form:errors path="eventCn" cssClass="error" /></div>
			</td>
		</tr>

		<tr>
			<th scope="col" width="20%" height="23" class="required_text" nowrap>
				<label for="eventSvcBeginDe">행사시작일자</label>
				<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="행사시작일자">
			</th>
			<td width="80%" nowrap>
				<input name="eventSvcBeginDe" type="text" size="73" value="" maxlength="10" style="width: 80px;" title="행사시작일자">
				<a href="#LINK" onclick="javascript:fn_egov_NormalCalendar(document.forms[0], document.forms[0].eventSvcBeginDe);">
				<img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" align="middle" style="border: 0px" alt="달력창팝업버튼이미지"></a>
				<div><form:errors path="eventSvcBeginDe" cssClass="error" /></div>
			</td>
		</tr>

		<tr>
			<th scope="col" width="20%" height="23" class="required_text" nowrap>
				<label for="eventSvcEndDe">행사종료일자</label>
				<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
			</th>
			<td width="80%" nowrap>
				<input name="eventSvcEndDe" type="text" size="73" value="" maxlength="10" style="width: 80px;" title="행사종료일자">
				<a href="#LINK" onclick="javascript:fn_egov_NormalCalendar(document.forms[0], document.forms[0].eventSvcEndDe);">
					<img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" style="border: 0px" alt="달력창팝업버튼이미지">
				</a>
				<div><form:errors path="eventSvcEndDe" cssClass="error" /></div>
			</td>
		</tr>

		<tr>
			<th scope="col" width="20%" height="23" class="required_text" nowrap><label for="svcUseNmprCo">서비스이용인원수</label></th>
			<td width="80%" nowrap><input name="svcUseNmprCo"
				id="svcUseNmprCo" type="text" size="73" value="" maxlength="10"
				style="width: 60px;" title="서비스이용인원수"></td>
		</tr>

		<tr>
			<th scope="col" width="20%" height="23" class="required_text" nowrap><label for="chargerNm">담당자명</label></th>
			<td width="80%" nowrap><input name="chargerNm" id="chargerNm"
				type="text" size="73" value="" maxlength="50" style="width: 100px;" title="담당자명">
			</td>
		</tr>

		<tr>
			<th scope="col" width="20%" height="23" class="required_text" nowrap><label for="prparetgCn">준비물내용</label></th>
			<td width="80%" nowrap><textarea name="prparetgCn"
				class="textarea" cols="75" rows="4" style="width: 100%;" title="준비물내용"></textarea>
			<div><form:errors path="prparetgCn" cssClass="error" /></div>
			</td>
		</tr>
		<%-- 업무사용자만 승인 가능하도록 처리--%>
		<c:if test="${SUserSe eq 'USR'}">
			<tr>
				<th scope="col" width="20%" height="23" class="required_text" nowrap>승인여부</th>
				<td width="80%" nowrap>
				승인:<input name="eventConfmAt" type="radio" value="Y" />
				미승인:<input name="eventConfmAt" type="radio" value="N" onClick="document.forms[0].eventConfmDe.value='';" checked />
				</td>
			</tr>

			<tr>
				<th scope="col" width="20%" height="23" class="required_text" nowrap><label for="eventConfmDe">승인일</label></th>
				<td width="80%" nowrap><input name="eventConfmDe"
					id="eventConfmDe" type="text" size="73" value="" maxlength="10"
					style="width: 80px;" readonly="readonly" title="승인일"> <a
					href="#LINK" onclick="javascript:fn_egov_NormalCalendar(document.forms[0], document.forms[0].eventConfmDe);">
				<img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />"
					onClick="" align="middle" style="border: 0px" alt="달력창팝업버튼이미지"></a></td>
			</tr>
		</c:if>
	</table>
	<c:if test="${SUserSe ne 'USR'}">
		<input name="eventConfmAt" id="eventConfmAt" type="hidden" value="" />
		<input name="eventConfmDe" id="eventConfmDe" type="hidden" value="" />
	</c:if>
	<table width="100%" cellspacing="0" cellpadding="0" border="0">
		<tr>
			<td height="3px"></td>
		</tr>
	</table>
	<table border="0" cellspacing="0" cellpadding="0" align="center">
		<tr>
			<td><span class="button">
					<a href="<c:url value='/uss/ion/ecc/EgovEventCmpgnList.do' />" onclick="javascript:fn_egov_list_EventCmpgn();">목록</a>
				</span></td>
			<td>&nbsp;</td>
			<td><span class="button">
					<a href="#Link" onclick="javascript:fn_egov_save_EventCmpgn();">저장</a>
				</span></td>
		</tr>
	</table>

	<input type="hidden" name="cal_url" id="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" />
	<input name="cmd" id="cmd" type="hidden" value="<c:out value='save'/>" />
</form:form></DIV>

</body>
</html>
