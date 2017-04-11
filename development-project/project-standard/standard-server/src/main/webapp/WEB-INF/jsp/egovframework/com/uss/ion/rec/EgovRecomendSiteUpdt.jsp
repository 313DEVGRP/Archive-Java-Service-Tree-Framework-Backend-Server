<%
 /**
  * @Class Name : EgovWordDicaryUpdt.jsp
  * @Description : EgovWordDicaryUpdt 화면
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
<title>추천사이트수정</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" >
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />" >
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />" >
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />" ></script>

<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="recomendSiteManageVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_recomendsiteinfo(){

    // 첫 입력란에 포커스..
    recomendSiteManageVO.recomendSiteNm.focus();

}

/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_updt_recomendsiteinfo(form, recomendSiteId){

    var ls_confmDe = form.confmDe.value;

    if (form.confmDe.value !="")    {
        ls_confmDe = fn_egov_remove_string(ls_confmDe,"-");
        form.confmDe.value = ls_confmDe;
    }

    if (!validateRecomendSiteManageVO(form)) {

        return;

    } else {

        form.recomendSiteId.value = recomendSiteId;
        form.action = "<c:url value='/uss/ion/rec/RecomendSiteUpdt.do'/>";
        form.submit();

    }

}

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_inqire_recomendsitelist() {

    recomendSiteManageVO.action = "<c:url value='/uss/ion/rec/RecomendSiteListInqire.do'/>";
    recomendSiteManageVO.submit();

}

/* ********************************************************
 * 입력받은문자열중에서 제거 문자열을 제외 문자열을 리턴한다.
 ******************************************************** */
function fn_egov_remove_string(srcStr, cndStr) {

    var result = null;
    var rtnStr = null;

    for (var i = 0; i < srcStr.length; i++) {

        if (srcStr.charAt(i) == cndStr) {
            result = srcStr.substring(0, i);

            // 첫번째 제거 문자열을 제외한 전체 문자열
            srcStr = result + srcStr.substring(i+1, srcStr.length);

            // 최종변환 문자열
            rtnStr = srcStr;
        }
    }

    return rtnStr;
}

/* ********************************************************
 * 승인 클릭 시...
 ******************************************************** */
function fn_egov_recomendConfirm() {

    // 승인일자에 널 처리..
    recomendSiteManageVO.calendarImg.disabled = false;

}

/* ********************************************************
 * 미승인 클릭 시...
 ******************************************************** */
function fn_egov_recomendCancel() {

    // 승인일자에 널 처리..
    recomendSiteManageVO.confmDe.value = "";
    recomendSiteManageVO.calendarImg.disabled = true;

}

</script>
</head>
<body onLoad="fn_egov_initl_recomendsiteinfo();">
<DIV id="content" style="width:700px">
<!-- 상단타이틀 -->
<form:form commandName="recomendSiteManageVO" name="recomendSiteManageVO" action="${pageContext.request.contextPath}/uss/ion/rec/RecomendSiteInfoUpdtView.do" method="post"
      onsubmit="javascript:return FormValidation(document.recomendSiteManageVO);">

<!-- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0" summary="제목 정보테이블">
 <tr>
  <td width="100%"class="title_left">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="제목이미지">&nbsp;추천사이트수정</td>
 </tr>
</table>

<!-- 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
    <td height="3px"></td>
</tr>
</table>

<!-- 등록  폼 영역  -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="추천사이트 정보 수정테이블">
  <tr>
    <th width="20%" height="23" class="required_text" nowrap ><label id="idRecomendSiteNm" for="recomendSiteNm">추천사이트명</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력"></th>
    <td width="80%" nowrap>
      <form:input path="recomendSiteNm" size="70" maxlength="70" />
      <div><form:errors path="recomendSiteNm"/></div>
    </td>
  </tr>

  <tr>
    <th height="23" class="required_text" ><label id="idRecomendSiteUrl" for="recomendSiteUrl">추천사이트 URL</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력"></th>
    <td>
      <form:input path="recomendSiteUrl" size="70" maxlength="70" />
      <div><form:errors path="recomendSiteUrl"/></div>
    </td>
  </tr>

  <tr>
    <th height="23" class="required_text" ><label id="idRecomendSiteDc" for="recomendSiteDc">추천사이트 설명</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력"></th>
    <td>
      <form:textarea path="recomendSiteDc" cols="200" rows="10" cssClass="txaClass" />
      <div><form:errors path="recomendSiteDc"/></div>
    </td>
  </tr>

  <tr>
    <th height="23" class="required_text" ><label id="idRecomendResnCn" for="recomendResnCn">추천사유내용</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력"></th>
    <td>
      <form:textarea path="recomendResnCn" cols="200" rows="10" cssClass="txaClass" />
      <div><form:errors path="recomendResnCn"/></div>
    </td>
  </tr>


  <tr>
    <th height="23" class="required_text" ><label id="idRecomendConfmAt" for="recomendConfmAt">추천승인여부</label><img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="선택입력"></th>
    <td>
        승인:   <input type="radio" name="recomendConfmAt" class="radio1" value="Y" onClick="javascript:fn_egov_recomendConfirm();"
                <c:if test="${result.recomendConfmAt == 'Y'}">checked</c:if> >&nbsp;
        미승인: <input type="radio" name="recomendConfmAt" class="radio1" value="N" onClick="javascript:fn_egov_recomendCancel();"
                <c:if test="${result.recomendConfmAt == 'N'}">checked</c:if> >&nbsp;
    </td>
  </tr>

  <tr>
    <th width="20%" height="23" class="required_text" nowrap ><label id="idConfmDe" for="confmDe">승인일자</label><img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif' />" width="15" height="15" alt="선택입력"></th>
    <td width="80%" nowrap>
      <input type="hidden" name="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" />
      <input name="confmDe" id="confmDe" type="text" size="10" value="<c:out value='${fn:substring(result.confmDe, 0,4)}'/>-<c:out value='${fn:substring(result.confmDe, 4,6)}'/>-<c:out value='${fn:substring(result.confmDe, 6,8)}'/>"  readonly />
      <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(recomendSiteManageVO,'', recomendSiteManageVO.confmDe);">
      <img name="calendarImg" src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />"  align="middle" style="border:0px" alt="달력창팝업버튼이미지">
      </a>
      <div><form:errors path="confmDe"/></div>

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
    <td><span class="button"><input type="submit" value="<spring:message code="button.update" />" onclick="fn_egov_updt_recomendsiteinfo(document.forms[0],'<c:out value="${result.recomendSiteId}"/>'); return false;"></span></td>
    <td>&nbsp;&nbsp;</td>
    <td>
        <span class="button">
        <a href="<c:url value='/uss/ion/rec/RecomendSiteListInqire.do'/>"
           onclick="javascript:fn_egov_inqire_recomendsitelist(); return false;"><spring:message code="button.list" /></a>
        </span>
    </td>

</tr>
</table>

<input name="recomendSiteId" type="hidden" value="">

</form:form>
</DIV>

</body>
</html>
