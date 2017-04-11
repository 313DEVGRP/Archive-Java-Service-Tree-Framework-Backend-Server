<%
 /**
  * @Class Name : EgovCnsltDetailInqure.jsp
  * @Description : EgovCnsltDetailInqure 화면
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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>상담 상세조회</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />">
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/showModalDialog.js'/>" ></script>
<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_inqire_cnsltlist() {

	document.CnsltManageForm.action = "<c:url value='/uss/olp/cns/CnsltListInqire.do'/>";
	document.CnsltManageForm.submit();

}

/* ********************************************************
 * 수정처리화면
 ******************************************************** */
function fn_egov_updt_cnsltdtls(cnsltId){

	// Update하기 위한 키값을 셋팅
	document.CnsltManageForm.cnsltId.value = cnsltId;

	var url 	= "<c:url value='/uss/olp/cns/CnsltPasswordConfirmView.do'/>";
	var	status 	= "dialogWidth:300px;dialogHeight:140px;resizable:no;center:yes";


	// 작성비밀번호 확인 화면을 호출한다.
	var returnValue = window.showModalDialog(url, self, status);

	// 결과값을 받아. 결과를 Submit한다.
 	if	(returnValue)	{

 		document.CnsltManageForm.action = "<c:url value='/uss/olp/cns/CnsltPasswordConfirm.do'/>";
 		document.CnsltManageForm.submit();

 	}


}

function showModalDialogCallback(returnValue) {
	if	(returnValue)	{

 		document.CnsltManageForm.action = "<c:url value='/uss/olp/cns/CnsltPasswordConfirm.do'/>";
 		document.CnsltManageForm.submit();

 	}
}
/**********************************************************
 * 삭제처리화면
 ******************************************************** */
function fn_egov_delete_cnsltdtls(cnsltId){

	if	(confirm("<spring:message code="common.delete.msg" />"))	{

		// Delete하기 위한 키값을 셋팅
		document.CnsltManageForm.cnsltId.value = cnsltId;
		document.CnsltManageForm.action = "<c:url value='/uss/olp/cns/CnsltDtlsDelete.do'/>";
		document.CnsltManageForm.submit();

	}

}

/*********************************************************
 * 작성비밀번호.체크..
 ******************************************************** */
function fn_egov_passwordConfirm(){

	alert("작성 비밀번호를 확인 바랍니다!");

}


</script>
</head>

<body>
<DIV id="content" style="width:712px">
<!-- 상단타이틀 -->
<form name="CnsltManageForm" action="<c:url value='/uss/olp/cns/CnsltPasswordConfirm.do'/>" method="post">

<!-- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="left" alt="제목아이콘이미지">&nbsp;상담 상세조회</h1></td>
 </tr>
</table>

<!-- 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<!-- 등록  폼 영역  -->
<table width="98%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="이 표는 상담 정보를 제공하며, 작성자명, 전화, 휴대폰전화번호, 이메일, 작성일자, 조회횟수, 처리상태, 상담제목, 상담내용 정보로 구성되어 있습니다 ." >
<caption>상담 상세조회</caption>
  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap >작성자명&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
    	<c:out value="${result.wrterNm}"/>
    </td>
  </tr>

  <tr>
    <th scope="row" height="23" class="required_text" >전화&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
    	<c:if test="${result.areaNo != null}">
      		<c:out value="${result.areaNo}"/>-<c:out value="${result.middleTelno}"/>-<c:out value="${result.endTelno}"/>
		</c:if>
    </td>
  </tr>

  <tr>
    <th scope="row" height="23" class="required_text" >휴대폰전화번호&nbsp;&nbsp;</th>
    <td width="80%" nowrap>

    	<c:if test="${result.firstMoblphonNo != null}">
      		<c:out value="${result.firstMoblphonNo}"/>-<c:out value="${result.middleMbtlnum}"/>-<c:out value="${result.endMbtlnum}"/>
		</c:if>

    </td>
  </tr>

  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap >이메일&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
    	<c:out value="${result.emailAdres}"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	<input name="emailAnswerAt" type="checkbox"  disabled <c:if test="${result.emailAnswerAt == 'Y'}">checked</c:if> title="이메일답변여부"> 이메일답변여부
    </td>
  </tr>

  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap >작성일자&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
    	<c:out value="${result.writngDe}"/>
    </td>
  </tr>

  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap >조회횟수&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
    	<c:out value="${result.inqireCo}"/>
    </td>
  </tr>

  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap >처리상태&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
    	<c:out value="${result.qnaProcessSttusCodeNm}"/>
    </td>
  </tr>

  <tr>
    <th scope="row" height="23" class="required_text" >상담제목&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
      <c:out value="${result.cnsltSj}"/>
    </td>
  </tr>

  <tr>
    <th scope="row" height="23" class="required_text" ><label for="cnsltCn">상담내용</label>&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
      <textarea name="cnsltCn" class="textarea_readonly"  cols="300" rows="15"  style="width:450px;" readonly title="상담내용"><c:out value="${result.cnsltCn}"/></textarea>
    </td>
  </tr>

  <c:if test="${result.atchFileId != ''}">
	<tr>
		<th scope="row" height="23">첨부파일 목록</th>
		    <td colspan="6">
				<c:import charEncoding="utf-8" url="/cmm/fms/selectFileInfs.do" >
					<c:param name="param_atchFileId" value="${result.atchFileId}" />
				</c:import>
		    </td>
	</tr>
  </c:if>

<!--답변내용이 있을경우 Display... -->
<c:if test="${result.qnaProcessSttusCode == '3'}">
  <tr>
    <th scope="row" height="23" class="required_text" ><label for="managtCn">답변내용</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수항목"></th>
    <td width="80%" nowrap>
      <textarea name="managtCn" class="textarea"  cols="300" rows="15"  style="width:450px;" readonly title="답변내용"><c:out value="${result.managtCn}"/></textarea>
    </td>
  </tr>

  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap >담당부서<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수항목"></th>
    <td width="80%" nowrap>
    	<c:out value="${result.orgnztNm}"/>
    </td>
  </tr>

  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap >답변일자<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수항목"></th>
    <td width="80%" nowrap>
  		<c:if test="${result.managtDe != null}">
  			<c:out value="${result.managtDe}"/>
 		</c:if>
    </td>
  </tr>

  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap >답변자<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수항목"></th>
    <td width="80%" nowrap>
    	<c:out value="${result.emplyrNm}"/>
    </td>
  </tr>

  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap >전화번호<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수항목"></th>
    <td width="80%" nowrap>
    	<c:out value="${result.offmTelno}"/>
    </td>
  </tr>

  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap >이메일<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수항목"></th>
    <td width="80%" nowrap>
    	<c:out value="${result.aemailAdres}"/>
    </td>
  </tr>

</c:if>



</table>

<!-- 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="10px"></td>
</tr>
</table>

<!-- 목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td><span class="button"><input type="submit" value="<spring:message code="button.update" />" onclick="fn_egov_updt_cnsltdtls('<c:out value="${result.cnsltId}"/>'); return false;"></span></td>
  <td>&nbsp;&nbsp;</td>
  <td><span class="button"><a href="<c:url value='/uss/olp/cns/CnsltDtlsDelete.do'/>?cnsltId=<c:out value='${result.cnsltId}'/>" onclick="fn_egov_delete_cnsltdtls('<c:out value="${result.cnsltId}"/>'); return false;"><spring:message code="button.delete" /></a></span></td>
  <td>&nbsp;&nbsp;</td>
  <td><span class="button"><a href="<c:url value='/uss/olp/cns/CnsltListInqire.do'/>" onclick="fn_egov_inqire_cnsltlist(); return false;"><spring:message code="button.list" /></a></span></td>
  <td>&nbsp;&nbsp;</td>
</tr>
</table>

<c:if test="${result.passwordConfirmAt == 'N,'}">
  <tr>
  	<td class="lt_text3" colspan=10>
	<script>
		fn_egov_passwordConfirm();
	</script>
  	</td>
  </tr>
</c:if>

<input name="cnsltId" type="hidden" value="">
<input name="writngPassword" 	type="hidden" value="">
<input name="passwordConfirmAt" type="hidden" value="">

</form>
</DIV>

</body>
</html>
