<%--
  Class Name : EgovOnlinePollPartcptnRegist.jsp
  Description : 온라인POLL참여 등록 페이지
  Modification Information
 
    수정일     		수정자		수정내용
    ----------		------		-----------------------------------------------------
    2008.03.09		장동한		최초 생성
    2011.07.06		옥찬우		Tag 변수값수정 ( Line 180 : pollKindCode -> pollKnd )
 
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
<c:set var="ImgUrl" value="/images/egovframework/com/uss/olp/opp/"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>온라인POLL참여 등록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />"></script>
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_OnlinePollPartcptn(){

}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_OnlinePollPartcptn(){
	location.href = "<c:url value='/uss/olp/opm/listOnlinePollPartcptn.do' />";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_save_OnlinePollPartcptn(){
	var varFrom = document.OnlinePollPartcptn;

	if(confirm("<spring:message code="common.save.msg" />")){ 
		varFrom.action =  "<c:url value='/uss/olp/opp/registOnlinePollPartcptn.do' />";
		return true;
	}else{
		return false;
	}

	return true;
}


</script>
</head>
<body onLoad="fn_egov_init_OnlinePollPartcptn()">
<DIV id="content" style="width:712px">
<%-- noscript 테그 --%>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<!--  상단타이틀 -->
<form id="OnlinePollPartcptn" name="OnlinePollPartcptn" action="<c:url value='/uss/olp/opp/registOnlinePollPartcptn.do' />" onsubmit="return fn_egov_save_OnlinePollPartcptn()" method="post">
<!-- ----------------- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지">&nbsp;온라인POLL참여 등록</td>
 </tr>
</table>
<!--  줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<!--  등록  폼 영역  -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register">
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >POLL명<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%">
		&nbsp;<c:out value="${PollManage[0].pollNm}" escapeXml="false" />
    </td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >POLL시작일자<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%">
		&nbsp;<c:out value="${PollManage[0].pollBeginDe}" escapeXml="false" />
    </td>
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text" nowrap >POLL종료일자<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%">
		&nbsp;<c:out value="${PollManage[0].pollEndDe}" escapeXml="false" />
    </td>
  </tr>
  <tr> 
    <th height="23" class="required_text" >POLL종류<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
    <td>
	<c:forEach items="${pollKindCodeList}" var="resultInfo" varStatus="pollKindStatus">
		<c:if test="${resultInfo.code eq PollManage[0].pollKindCode}">
			&nbsp;<c:out value="${resultInfo.codeNm}" escapeXml="false" />
		</c:if>
	</c:forEach>
    </td>
  </tr> 
</table>

<!--  줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<!--  등록폼  -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register">
<tr> 
    <td colspan="2">
    	<table width="100%" border="0" cellpadding="2" cellspacing="0">
		<tr>
			<td colspan="2" height="1"></td>
		</tr>
    	<tr>
    	<td style="padding:0px 0px 0px 0px;margin:0px 0px 0px 0px;background-color:#E3E3E3;">
    			    		
    		<table width="100%" border="0" cellpadding="0" cellspacing="0">
   			<c:forEach items="${PollItem}" var="resultInfo" varStatus="status">
   			<tr>
   				<td style="background-color:#E3E3E3;" width="10px" height="28px"></td>   				
   				<td style="background-color:#E3E3E3;" width="20px">
   					<input type="radio" name="pollIemId" value="${resultInfo.pollIemId}" style="border:0px;" <c:if test="${status.count == '1'}">checked</c:if>>
   				</td>
   				<td style="background-color:#E3E3E3;"><c:out value="${resultInfo.pollIemNm}" escapeXml="false" /></td>
   			</tr>	
			</c:forEach>
    		</table>	    		
    		
    	</tr>
		<tr>
			<td colspan="2" height="1"></td>
		</tr>
    	</table>

    </td>
</tr>
<tr>
	<td colspan="2" height="1"></td>
</tr>
</table>
<!--  줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<center>
<!--  목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr> 
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt="버튼이미지"></td>
  <td class="btnBackground" nowrap><a href="<c:url value='/uss/olp/opp/listOnlinePollPartcptn.do' />"><spring:message code="button.list" /> </a> 
  </td>
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>      
  <td>&nbsp;</td>
  <td>
	<span class="button">
		<input type="submit" value="<spring:message code="button.save" />">
	</span>
  </td>      
</tr>
</table>
</center>
<input name="pollId" type="hidden" value="${PollManage[0].pollId}"/>
<input name="cmd" type="hidden" value="<c:out value='save'/>"/>
</form>
</DIV>

</body>
</html>
