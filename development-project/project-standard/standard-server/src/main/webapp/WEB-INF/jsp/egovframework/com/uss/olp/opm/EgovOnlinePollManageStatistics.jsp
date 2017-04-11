<%--
  Class Name : EgovOnlinePollManageStatistics.jsp
  Description : 온라인POLL관리 통계 페이지
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
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>EGOV-COM</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_QustnrQestnManage(){

}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_QustnrQestnManage(){
	var vFrom = document.QustnrQestnManageForm;
	vFrom.action = "<c:url value='/uss/olp/opm/listOnlinePollManage.do' />";
	vFrom.submit();
}

</script>
</head>
<body onLoad="fn_egov_init_QustnrQestnManage();">
<DIV id="content" style="width:712px">
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<!--  상단타이틀 -->
<form name="QustnrQestnManageForm" action="<c:url value=''/>" method="post">
<!-- ----------------- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지">&nbsp;온라인POLL관리 통계</td>
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
    <th width="20%" height="23" class="required_text" nowrap >POLL명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%">
소녀시대 가창력에 관한 여러분의 의견은?
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >POLL시작일자<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%">
2009-01-01
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >POLL종료일자<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%">
2009-01-30
    </td>
  </tr>
  <tr>
    <th height="23" class="required_text" >POLL종류<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
    <td>
기타
    </td>
  </tr>
</table>

<!--  줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<!--  그래프출력  -->
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

    			<tr>
    				<td style="background-color:#E3E3E3;" width="10px" height="28px"></td>
    				<td style="background-color:#E3E3E3;" width="100px">높다</td>
    				<td style="background-color:#E3E3E3;">
    					<img src="<c:url value='/images/egovframework/com/uss/olp/qnn/chart/chart1.JPG'/>" width="40px" height="8" alt="POLL 막대그래프1"> 40%
    				</td>
    			</tr>
    			<tr>
    				<td style="background-color:#E3E3E3;" width="10px" height="28px"></td>
    				<td style="background-color:#E3E3E3;" width="100px">낮다</td>
    				<td style="background-color:#E3E3E3;">
    					<img src="<c:url value='/images/egovframework/com/uss/olp/qnn/chart/chart2.JPG'/>" width="60px" height="8" alt="POLL 막대그래프2"> 60%
    				</td>
    			</tr>
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
<center>
<!--  목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" title="버튼이미지" width="8" height="20" alt="버튼이미지"></td>
  <td class="btnBackground" nowrap><a href="JavaScript:fn_egov_list_QustnrQestnManage();"><spring:message code="button.list" /></a>
  </td>
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" title="버튼이미지" width="8" height="20" alt="버튼이미지"></td>
  <td>&nbsp;</td>
</tr>
</table>
</center>


</form>
</DIV>

</body>
</html>
