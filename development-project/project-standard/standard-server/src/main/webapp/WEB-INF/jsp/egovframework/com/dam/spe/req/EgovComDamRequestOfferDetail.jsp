<%--
  Class Name : EgovComDamRequestOfferDetail.jsp
  Description : 지식 정보제공/정보요청 등록
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2010.08.30    장동한          최초 생성
 
    author   : 공통서비스 개발팀 장동한
    since    : 2010.08.30
    
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<%--  자마스크립트 메세지 출력 --%>
${reusltScript}
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>지식 정보제공/정보요청 -상세조회</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_RequestOffer(){

}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_modify_RequestOffer(){
	var vFrom = document.RequestOfferForm;
	vFrom.cmd.value = '';
	vFrom.action = "<c:url value='/dam/spe/req/updtRequestOffer.do'/>";;
	vFrom.submit();

}
/* ********************************************************
 * 삭제처리
 ******************************************************** */
function fn_egov_delete_RequestOffer(){
	var vFrom = document.RequestOfferForm;
	if(confirm("삭제 하시겠습니까?")){
		vFrom.cmd.value = 'del';
		vFrom.action = "<c:url value='/dam/spe/req/detailRequestOffer.do'/>";
		vFrom.submit();
	}else{
		vFrom.cmd.value = '';
	}
}
</script>
</head>
<body onLoad="fn_egov_init_RequestOffer();">
<DIV id="content" style="width:712px">
<%-- noscript 테그 --%>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<!-- 상단타이틀 -->
<form name="RequestOfferForm" action="<c:url value='/dam/spe/req/detailRequestOffer.do'/>" method="post">
<!-- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif'/>" width="16" height="16" hspace="3" style="vertical-align:middle; display:inline-block;" alt="">&nbsp;지식 정보제공/정보요청  상세조회</h1></td>
 </tr>
</table>

<!-- 등록  폼 영역  -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" 
summary="이 표는 지식 정보제공/정보요청  정보를 제공하며, 조직명, 지식유형명, 지식명, 지식내용, 첨부파일  정보로 구성되어 있습니다 .">
<caption>지식 정보제공/정보요청 상세조회</caption>
<tr> 
	<th scope="row" width="20%" height="23" class="required_text">조직명</th>
	<td width="80%" colspan="3">
	<div style="padding:0px 0px 0px 0px;margin:0px 0px 0px 2px;">
	<c:forEach var="knoPersonal" items="${mapTeamList}" varStatus="status">							
	<c:if test="${knoPersonal.orgnztId == requestOfferVO.orgnztId}"><c:out value="${knoPersonal.orgnztNm}"/></c:if>
	</c:forEach>
	</div>
	</td>
</tr>
<tr> 
	<th scope="row" width="20%" height="23" class="required_text">지식유형명</th>
	<td width="80%" colspan="3">
	<div style="padding:0px 0px 0px 0px;margin:0px 0px 0px 2px;">
		<c:forEach var="knoPersonal" items="${mapMaterialList}" varStatus="status">
		<c:if test="${knoPersonal.knoTypeCd == requestOfferVO.knoTypeCd}"><c:out value="${knoPersonal.knoTypeNm}"/></c:if>
		</c:forEach>	
	</div>
	</td>
</tr>
<tr> 
	<th scope="row" width="20%" height="23" class="required_text">지식명</th>
	<td width="80%" colspan="3">&nbsp;<c:out value="${requestOfferVO.knoNm}" /></td>
</tr>
<tr> 
	<th scope="row" width="20%" height="23" class="required_text" valign="middle">
	<div style="border:solid 0px;vertical-align:middle;" >지식내용</div>
	</th>
	<td width="80%" colspan="3">&nbsp;
	<div style="padding:0px 0px 0px 0px;margin:0px 0px 0px 2px;">
	<c:out value="${fn:replace(requestOfferVO.knoCn , crlf , '<br/>')}" escapeXml="false" />
	<br>
	<br>
	</div>
	</td>
</tr>
<!-- 첨부파일 테이블 레이아웃 설정 Start.. -->
  <tr>
	<th scope="row" height="20%" class="required_text" nowrap>파일첨부</th>
	<td>
		<c:import charEncoding="utf-8" url="/cmm/fms/selectFileInfs.do" > 
		<c:param name="param_atchFileId" value="${requestOfferVO.atchFileId}" /> 
		</c:import>	      
	 </td>
  </tr>
<!-- 첨부파일 테이블 레이아웃 End. -->
</table>
<input name="knoId" type="hidden" value="${requestOfferVO.knoId}">
<input name="cmd" type="hidden" value="<c:out value=''/>">
<div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div>
</form>


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
<td>&nbsp;</td>
<%-- 자기 글일때만 수정/삭제버튼 활성화 --%>
<c:if test="${requestOfferVO.frstRegisterId eq USER_UNIQ_ID}">
	<td>
		<form name="formUpdt" action="<c:url value='/dam/spe/req/updtRequestOffer.do'/>" method="post"> 
		<span class="button"><input type="submit" value="<spring:message code="button.update" />" onclick="fn_egov_modify_RequestOffer(); return false;"></span>
		<input name="knoId" type="hidden" value="${requestOfferVO.knoId}">
		</form>
	</td>
	<td width="3"></td>
	<td>
		<form name="formDelete" action="<c:url value='/dam/spe/req/detailRequestOffer.do'/>" method="post"> 
		<span class="button"><input type="submit" value="<spring:message code="button.delete" />" onclick="fn_egov_delete_RequestOffer(); return false;"></span>
		<input name="knoId" type="hidden" value="${requestOfferVO.knoId}">
		<input name="cmd" type="hidden" value="<c:out value='del'/>"/>
		</form>
	</td>
</c:if>
<c:if test="${IS_SPE eq 'Y'}">
	<td width="3"></td>
	<td>
		<form name="formReply" action="<c:url value='/dam/spe/req/registRequestOffer.do'/>" method="post"> 
		<span class="button"><input type="submit" value="답변" onclick="this.form.submit();return false;"></span>
		<input name="knoId" type="hidden" value="${requestOfferVO.knoId}">
		
		<input name="ansDepth" type="hidden" value="${requestOfferVO.ansDepth + 1 }">
		<input name="ansSeq" type="hidden" value="${requestOfferVO.ansSeq + 1}">
		<input name="ansParents" type="hidden" value="${requestOfferVO.knoId}">
		<input name="ansNumber" type="hidden" value="${requestOfferVO.ansNumber}">
		
		<input name="orgnztId" type="hidden" value="${requestOfferVO.orgnztId}">
		<input name="knoTypeCd" type="hidden" value="${requestOfferVO.knoTypeCd}">
		<input name="cmd" type="hidden" value="reply">
		
		</form>
	</td>
</c:if>
	<td width="3"></td>
	<td> 
		<form name="formList" action="<c:url value='/dam/spe/req/listRequestOffer.do'/>" method="post">
		<span class="button"><input type="submit" value="<spring:message code="button.list" />"></span>
		</form>
	</td>
</tr>
</table>



<!-- 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

</center>

</DIV>

</body>
</html>