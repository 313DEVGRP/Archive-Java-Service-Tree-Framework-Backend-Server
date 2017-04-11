<%
 /**
  * @Class Name : EgovRecomendSiteDetailInqure.jsp
  * @Description : EgovRecomendSiteDetailInqure 화면
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
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>추천사이트관리</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" >
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />" >
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />" >
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_recomendsiteinfo(){



}

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_inqire_recomendsitelist() {

    document.RecomendSiteManageForm.action = "<c:url value='/uss/ion/rec/RecomendSiteListInqire.do'/>";
    document.RecomendSiteManageForm.submit();

}

/* ********************************************************
 * 수정처리화면
 ******************************************************** */
function fn_egov_updt_recomendsiteinfo(recomendSiteId){

    // Update하기 위한 키값(recomendSiteId)을 셋팅
    document.RecomendSiteManageForm.recomendSiteId.value = recomendSiteId;
    document.RecomendSiteManageForm.action = "<c:url value='/uss/ion/rec/RecomendSiteUpdtView.do'/>";
    document.RecomendSiteManageForm.submit();

}


function fn_egov_delete_recomendsiteinfo(recomendSiteId){

    if  (confirm("<spring:message code="common.delete.msg" />"))    {

        // Delete하기 위한 키값(recomendSiteId)을 셋팅
        document.RecomendSiteManageForm.recomendSiteId.value = recomendSiteId;
        document.RecomendSiteManageForm.action = "<c:url value='/uss/ion/rec/RecomendSiteDelete.do'/>";
        document.RecomendSiteManageForm.submit();

    }


}

</script>
</head>

<body onLoad="fn_egov_initl_recomendsiteinfo();">
<DIV id="content" style="width:700px">
<!-- 상단타이틀 -->
<form name="RecomendSiteManageForm" action="<c:url value='/uss/ion/rec/RecomendSiteDetailInqire.do'/>" method="post">

<!-- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0" summary="제목 정보테이블">
 <tr>
  <td width="100%"class="title_left">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="제목이미지">&nbsp;추천사이트상세조회</td>
 </tr>
</table>

<!-- 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
    <td height="3px"></td>
</tr>
</table>

<!-- 등록  폼 영역  -->
<table width="90%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="추천사이트 정보테이블">

  <tr>
    <th width="20%" height="23" class="required_text" nowrap >추천사이트명&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
        <c:out value="${result.recomendSiteNm}"/>
    </td>
  </tr>

  <tr>
    <th width="20%" height="23" class="required_text" nowrap >추천사이트 URL&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
        <c:out value="${result.recomendSiteUrl}"/>
    </td>
  </tr>

  <tr>
    <th height="23" class="required_text" ><label id="idRecomendSiteDc" for="recomendSiteDc">추천사이트 설명</label>&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
      <textarea name="recomendSiteDc" id="recomendSiteDc" class="textarea"  cols="300" rows="10"  style="width:450px;"  readonly><c:out value="${result.recomendSiteDc}"/></textarea>
    </td>
  </tr>

  <tr>
    <th height="23" class="required_text" ><label id="idRecomendResnCn" for="recomendResnCn">추천사유내용</label>&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
      <textarea name="recomendResnCn" id="recomendResnCn" class="textarea"  cols="300" rows="5"  style="width:450px;"   readonly><c:out value="${result.recomendResnCn}"/></textarea>

    </td>
  </tr>

  <tr>
    <th height="23" class="required_text" >추천승인여부&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
                            <c:choose>
                                <c:when test="${result.recomendConfmAt == 'Y'}">
                                    승인
                                </c:when>
                                <c:otherwise>
                                    미승인
                                </c:otherwise>
                            </c:choose>
    </td>
  </tr>

  <tr>
    <th height="23" class="required_text" >승인일자&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
        <c:out value='${fn:substring(result.confmDe, 0,4)}'/>-<c:out value='${fn:substring(result.confmDe, 4,6)}'/>-<c:out value='${fn:substring(result.confmDe, 6,8)}'/>
    </td>
  </tr>

  <tr>
    <th height="23" class="required_text" >등록일자&nbsp;&nbsp;</th>
    <td width="80%" nowrap>
        <c:out value="${result.lastUpdusrPnttm}"/>
    </td>
  </tr>

</table>

<!--  줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
    <td height="10px"></td>
</tr>
</table>

<!-- 목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr>

    <td><span class="button">
        <a href="<c:url value='/uss/ion/rec/RecomendSiteUpdtView.do'/>"
           onclick="fn_egov_updt_recomendsiteinfo('<c:out value="${result.recomendSiteId}"/>'); return false;"><spring:message code="button.update" /></a>
        </span>
    </td>
    <td>&nbsp;&nbsp;&nbsp;</td>
    <td><span class="button"><input type="submit" value="<spring:message code="button.delete" />"
    		  onclick="fn_egov_delete_recomendsiteinfo('<c:out value="${result.recomendSiteId}"/>'); return false;"></span></td>
    <td><span class="button">
        <a href="<c:url value='/uss/ion/rec/RecomendSiteListInqire.do'/>"
           onclick="fn_egov_inqire_recomendsitelist(); return false;"><spring:message code="button.list" /></a>
        </span>
    </td>

</tr>
</table>

<input name="recomendSiteId" type="hidden" value="">
</form>
</DIV>

</body>
</html>
