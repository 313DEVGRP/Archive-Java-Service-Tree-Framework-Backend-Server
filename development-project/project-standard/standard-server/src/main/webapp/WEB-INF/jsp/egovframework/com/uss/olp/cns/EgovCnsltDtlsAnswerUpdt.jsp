<%
 /**
  * @Class Name : EgovCnsltCnAnswerUpdt.jsp
  * @Description : EgovCnsltCnAnswerUpdt 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.02.01   박정규              최초 생성
  *
  *  @author 공통서비스팀
  *  @since 2009.02.01
  *  @version 1.0
  *  @see
  *
  */
%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>상담내역답변 수정</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="cnsltManageVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_cnsltdtlsanswer(){

	// 첫 입력란에 포커스..
	cnsltManageVO.managtCn.focus();

}

/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_updt_cnsltdtlsanswer(form, cnsltId){

	// 서버사이드 테스트용
	/*
		form.action = "<c:url value='/uss/olh/wor/WordDicaryRegist.do'/>";
		form.submit();
		return;
	*/

	if (!validateCnsltManageVO(form)) {

		return;

	} else {


		form.cnsltId.value = cnsltId;
		form.action = "<c:url value='/uss/olp/cnm/CnsltDtlsAnswerUpdt.do'/>";
		form.submit();

	}

}

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_inqire_qnaanswerlist() {

	cnsltManageVO.action = "<c:url value='/uss/olp/cnm/CnsltAnswerListInqire.do'/>";
	cnsltManageVO.submit();

}

/* ********************************************************
 * 메일발송을 위한 화면을 호출
 ******************************************************** */
function fn_egov_pop_mailform() {

	var url 	= "<c:url value='/ems/insertSndngMailView.do'/>";
	var	status 	= "width=640,height=480,top=200,left=200";

	window.open(url,'popup', status);

}


</script>
</head>
<body onLoad="fn_egov_initl_cnsltdtlsanswer();">
<DIV id="content" style="width:700px">
<!-- 상단타이틀 -->
<form:form commandName="cnsltManageVO" action="${pageContext.request.contextPath}/uss/olp/cnm/CnsltDtlsAnswerUpdt.do" method="post">

<!-- hidden 화일정의 -->
<input name="cnsltId" type="hidden" value="<c:out value='${result.cnsltId}'/>">

<input name="writngPassword" type="hidden" value="<c:out value='${result.writngPassword}'/>">


<!-- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="left" alt="제목아이콘이미지">&nbsp;상담내역답변수정</h1></td>
 </tr>
</table>

<!-- 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<!-- 등록  폼 영역  -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="이 표는 상담내역답변 정보를  수정하기 위한 표이며, 작성자명, 전화번호, 휴대폰전화번호, 이메일, 상담정보, 상담내용, 진행처리상태, 답변내용 정보로 구성되어 있습니다 .">
<caption>상담내역답변 수정</caption>
  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="cnsltCn">작성자명</label>&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
    	<input name="wrterNm" type="text" size="22" value="<c:out value='${result.wrterNm}'/>" maxlength="20" class="readOnlyClass" readonly title="작성자명">
    </td>
  </tr>

  <tr>
    <th scope="row" height="23" class="required_text" ><label for="areaNo">전화번호</label>&nbsp;&nbsp;</th>
    <td>
		<input name="areaNo" type="text" size="5" value="<c:out value='${result.areaNo}'/>" maxlength="5" class="readOnlyClass" readonly title="전화번호(지역)">-
		<input name="middleTelno" type="text" size="5" value="<c:out value='${result.middleTelno}'/>" maxlength="5" class="readOnlyClass" readonly title="전화번호(국번)">-
		<input name="endTelno" type="text" size="5" value="<c:out value='${result.endTelno}'/>" maxlength="5" class="readOnlyClass" readonly title="전화번호(지번)">
    </td>
  </tr>

  <tr>
    <th scope="row" height="23" class="required_text" ><label for="firstMoblphonNo">휴대폰전화번호</label>&nbsp;&nbsp;</th>
    <td>
		<input name="firstMoblphonNo" 	type="text" size="5" value="<c:out value='${result.firstMoblphonNo}'/>" maxlength="5" title="휴대폰전화번호(앞번)" class="readOnlyClass" readonly>-
		<input name="middleMbtlnum" 	type="text" size="5" value="<c:out value='${result.middleMbtlnum}'/>" maxlength="5" title="휴대폰전화번호(국번)" class="readOnlyClass" readonly>-
		<input name="endMbtlnum" 		type="text" size="5" value="<c:out value='${result.endMbtlnum}'/>" maxlength="5" title="휴대폰전화번호(지번)" class="readOnlyClass" readonly>
    </td>
  </tr>

  <tr>
    <th scope="row" height="23" class="required_text" ><label for="emailAdres">이메일</label>&nbsp;&nbsp;</th>
    <td>
		<input name="emailAdres" type="text" size="30" value="<c:out value='${result.emailAdres}'/>" maxlength="30" title="이메일" class="readOnlyClass" readonly>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input name="emailAnswerAt" type="checkbox" disabled value="Y" <c:if test="${result.emailAnswerAt == 'Y'}">checked</c:if> title="이메일답변여부"> 이메일답변여부

  			<c:if test="${result.emailAnswerAt == 'Y'}">
  			    &nbsp;&nbsp;&nbsp;
				<a href = "<c:url value='/images/egovframework/com/cmm/icon/search2.gif'/>" onClick="javascript:fn_egov_pop_mailform(); return false;" alt="발송메일 등록 팝업"></a>
 			</c:if>

    </td>
  </tr>

  <tr>
    <th scope="row" height="23" class="required_text" ><label for="cnsltSj">상담제목</label>&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
    	<input name="cnsltSj" type="text" size="70" value="<c:out value="${result.cnsltSj}"/>" maxlength="70" class="readOnlyClass" readonly title="상담제목">
   	</td>
  </tr>

  <tr>
    <th scope="row" height="23" class="required_text" ><label for="cnsltCn">상담내용</label>&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
      <textarea name="cnsltCn" class="readOnlyClass"  cols="300" rows="20"  style="width:450px;" title="상담내용" readonly><c:out value="${result.cnsltCn}"/></textarea>
    </td>
  </tr>

  <tr>
    <th scope="row" height="23" class="required_text" ><label for="qnaProcessSttusCode">진행처리상태</label>&nbsp;&nbsp;</th>
    <td>
     	<select name="qnaProcessSttusCode" class="select" title="진행처리상태">
  		   <option selected value="<c:out value='${result.qnaProcessSttusCode}'/>"><c:out value='${result.qnaProcessSttusCodeNm}'/>&nbsp;&nbsp;</option>
			<c:forEach var="result" items="${resultList}" varStatus="status">
				<option value='<c:out value="${result.code}"/>'><c:out value="${result.codeNm}"/></option>
			</c:forEach>
  		</select>
    </td>
  </tr>

  <tr>
    <th scope="row" height="23" class="required_text" ><label for="managtCn">답변내용</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수항목"></th>
    <td width="80%" nowrap>
      <form:textarea path="managtCn" cols="300" rows="20" cssClass="txaClass"  title="답변내용"/>
      <div><form:errors path="managtCn"/></div>
    </td>
  </tr>

</table>

<!-- 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<!-- 목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td><span class="button"><input type="submit" value="답변" onclick="fn_egov_updt_cnsltdtlsanswer(document.forms[0],'<c:out value="${result.cnsltId}"/>'); return false;"></span></td>
  <td>&nbsp;&nbsp;</td>
  <td><span class="button"><a href="<c:url value='/uss/olp/cnm/CnsltAnswerListInqire.do'/>" onclick="fn_egov_inqire_qnaanswerlist(); return false;"><spring:message code="button.list" /></a></span></td>
  <td>&nbsp;&nbsp;</td>
</tr>
</table>

</form:form>
</DIV>

</body>
</html>
