<%
/**
 * @Class Name : EgovMtgPlaceResveRegist.java
 * @Description : EgovMtgPlaceResveRegist.jsp
 * @Modification Information 
 * @
 * @  수정일                    수정자                수정내용
 * @ ---------     --------    ---------------------------
 * @ 2010.06.29    이      용                최초 생성
 *
 *  @author 이      용
 *  @since 2010.06.29
 *  @version 1.0
 *  @see
 *  
 *  Copyright (C) 2009 by MOPAS  All right reserved.
 */
%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>회의실예약관리 목록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />" ></script>
<script type="text/javaScript" language="javascript" defer="defer">
<!--
/*설명 : 회의실  예약목록 조회 */
function fncSelectMtgPlaceResveManageList(pageNo){
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/uss/ion/mtg/selectMtgPlaceResveManageList.do'/>";
    document.listForm.submit();
}

/*설명 : 회의실 예약 화면 호출 */
function fncInsertMtgPlaceResve() {
	if(document.listForm.pageIndex.value == "") {
		document.listForm.pageIndex.value = 1;
	} 
    document.listForm.action = "<c:url value='/uss/ion/mtg/selectMtgPlaceResveManage.do'/>";
    document.listForm.submit(); 
}

-->
</script>

</head>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<div id="border" style="width:730px">
<table border="0">
  <tr>
    <td width="700">
<!-- ********** 여기서 부터 본문 내용 *************** -->
<form name="listForm" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManageList.do'/>" method="post"> 

<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="40%"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;회의실예약관리 목록</h1></td>
  <td width="50%">&nbsp;</td>
  <th width="10%" align="right">
     <span class="button"><input type="submit" value="<spring:message code="button.inquire" />" onclick="fncSelectMtgPlaceResveManageList('1'); return false;"></span>
  </th>  
 </tr>
</table>


<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="회의실예약 검색조건" >
	<caption>회의실예약 검색조건</caption>
  <tr> 
    <th width="20%" height="23" class="required_text" >회의일자<img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>
    <td width="80%">
		  <input type="hidden" name="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" />
	      <input type="hidden" name="resveDe" value="<c:out value='${mtgPlaceManageVO.resveDe    }'/>" />
	      <input name="resveDeView" type="text" size="10" value="${mtgPlaceManageVO.resveDeView  }"  readOnly 
	      	onClick="javascript:fn_egov_NormalCalendar(document.listForm, document.listForm.resveDe, document.listForm.resveDeView);" title="회의일자">
	      <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(document.listForm, document.listForm.resveDe, document.listForm.resveDeView);" 
	    	style="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" alt="달력창팝업버튼이미지"
		    width="15" height="15"></a> ※회의일자 변경시 조회 버튼 클릭하셔야 예약 리스트가 조회됩니다.
    </td>
  </tr> 
</table>
<br>
<input type="hidden" name="mtgPlaceId">
<input type="hidden" name="resveId">
<input type="hidden" name="pageIndex">
<input type="hidden" name="cmd">
<input type="hidden" name="searchCondition" value="1">
</form>  
<table border="0" cellspacing="0" cellpadding="0">
	<tr> 
		<td>
		※회의실 예약은  회의실의 색이 없는 빈 시간을 클릭하시면 예약신청화면으로 이동합니다. (그래프 클릭시 상세화면 이동.)<p>
		</td>
	</tr>	
</table>
<table width="100%" cellpadding="0" cellspacing="1" class="table-line" border="1" style="table-layout:fixed" summary="회의실예약 목록" >
	<caption>회의실예약 목록</caption>
 <thead>
  <tr>
    <th class="title"    scope="col">회의실명</th>
    <th class="title" width="40px" colspan="2" scope="col">08</th>
    <th class="title" width="40px" colspan="2" scope="col">09</th>
    <th class="title" width="40px" colspan="2" scope="col">10</th>
    <th class="title" width="40px" colspan="2" scope="col">11</th>
    <th class="title" width="40px" colspan="2" scope="col">12</th>
    <th class="title" width="40px" colspan="2" scope="col">13</th>
    <th class="title" width="40px" colspan="2" scope="col">14</th>
    <th class="title" width="40px" colspan="2" scope="col">15</th>
    <th class="title" width="40px" colspan="2" scope="col">16</th>
    <th class="title" width="40px" colspan="2" scope="col">17</th>
    <th class="title" width="40px" colspan="2" scope="col">18</th>
    <th class="title" width="40px" colspan="2" scope="col">19</th>
    <th class="title" width="40px" colspan="2" scope="col">20</th>
  </tr>
 </thead>    

 <tbody>
 <c:forEach var="mtgPlaceResveManage" items="${mtgPlaceManageList}" varStatus="status">
  <tr>
    <td class="lt_text3"  ><c:out value='${mtgPlaceResveManage.mtgPlaceNm}'/></td> 
    
    <c:if test="${mtgPlaceResveManage.resveTemp0800!='0' }">
    <td   bgcolor="#431508"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManageDetail.do'/>">
            <input type="hidden" name="resveId"    value="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp0800,0,20) }'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="cmd" value="detail">
            <span  class="link"  style="background:pink;">
            <Acronym Title="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp0800,20,fn:length(mtgPlaceResveManage.resveTemp0800))}'/>">
            <input type="submit" value="" style="width:100%;" onclick="fncSelectMtgPlaceResveManage('<c:out value="${mtgPlaceResveManage.mtgPlaceId}"/>',
                                                                                  '<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp0830,0,20) }'/>','updt'); return false;"></Acronym></span>
        </form>
    </td>
    </c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp0800=='0' }">
    <td   bgcolor="#FFFFFF"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManage.do'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="resveId"    value="">
            <input type="hidden" name="cmd"        value="insert">
            <input type="hidden" name="resveBeginTm" value="0800">
            <input type="hidden" name="resveEndTm"   value="0800">
            <input type="hidden" name="resveDe"    value="<c:out value='${mtgPlaceManageVO.resveDe         }'/>">
            <span  class="link"  style="background:#ffffff;">
            <input type="submit" value="   " style="width:100%; height:100%;" ></span>
        </form>
   </td>
   </c:if>
   
   
   
   
   
   
   
   
    <c:if test="${mtgPlaceResveManage.resveTemp0830!='0' }">
    <td   bgcolor="#431508"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManageDetail.do'/>">
            <input type="hidden" name="resveId"    value="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp0830,0,20) }'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="cmd" value="detail">
            <span  class="link"  style="background:pink;">
            <Acronym Title="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp0830,20,fn:length(mtgPlaceResveManage.resveTemp0830))}'/>">
            <input type="submit" value="    " style="width:100%; height:100%;" ></Acronym></span>
        </form>
    </td>
    </c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp0830=='0' }"><td   bgcolor="#FFFFFF"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManage.do'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="resveId"    value="">
            <input type="hidden" name="cmd"        value="insert">
            <input type="hidden" name="resveBeginTm" value="0830">
            <input type="hidden" name="resveEndTm"   value="0830">
            <input type="hidden" name="resveDe" value="<c:out value='${mtgPlaceManageVO.resveDe         }'/>">
            <span  class="link"  style="background:#ffffff;">
            <input type="submit" value="    " style="width:100%; height:100%;" ></span>
        </form>
    </td></c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp0900!='0' }">
    <td   bgcolor="#431508"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManageDetail.do'/>">
            <input type="hidden" name="resveId"    value="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp0900,0,20) }'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="cmd" value="detail">
            <span  class="link"  style="background:pink;" >
            <Acronym Title="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp0900,20,fn:length(mtgPlaceResveManage.resveTemp0900))}'/>">
            <input type="submit" value="    " style="width:100%; height:100%;"  ></Acronym></span>
        </form>
    </td>
    </c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp0900=='0' }"><td   bgcolor="#FFFFFF"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManage.do'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="resveId"    value="">
            <input type="hidden" name="cmd"        value="insert">
            <input type="hidden" name="resveBeginTm" value="0900">
            <input type="hidden" name="resveEndTm"   value="0900">
            <input type="hidden" name="resveDe" value="<c:out value='${mtgPlaceManageVO.resveDe         }'/>">
            <span  class="link"  style="background:#ffffff;">
            <input type="submit" value="    " style="width:100%; height:100%;" ></span>
        </form>
    </td></c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp0930!='0' }">
    <td   bgcolor="#431508"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManageDetail.do'/>">
            <input type="hidden" name="resveId"    value="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp0930,0,20) }'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="cmd" value="detail">
            <span  class="link"  style="background:pink;">
            <Acronym Title="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp0930,20,fn:length(mtgPlaceResveManage.resveTemp0930))}'/>">
            <input type="submit" value="    " style="width:100%; height:100%;" ></Acronym></span>
        </form>
    </td>
    </c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp0930=='0' }"><td   bgcolor="#FFFFFF"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManage.do'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="resveId"    value="">
            <input type="hidden" name="cmd"        value="insert">
            <input type="hidden" name="resveBeginTm" value="0930">
            <input type="hidden" name="resveEndTm"   value="0930">
            <input type="hidden" name="resveDe" value="<c:out value='${mtgPlaceManageVO.resveDe         }'/>">
            <span  class="link"  style="background:#ffffff;">
            <input type="submit" value="    " style="width:100%; height:100%;" ></span>
        </form>
    </td></c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp1000!='0' }">
    <td   bgcolor="#431508"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManageDetail.do'/>">
            <input type="hidden" name="resveId"    value="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp1000,0,20) }'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="cmd" value="detail">
            <span  class="link"  style="background:pink;">
            <Acronym Title="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp1000,20,fn:length(mtgPlaceResveManage.resveTemp1000))}'/>">
            <input type="submit" value="    " style="width:100%; height:100%;" ></Acronym></span>
        </form>
    </td>
    </c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp1000=='0' }"><td   bgcolor="#FFFFFF"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManage.do'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="resveId"    value="">
            <input type="hidden" name="cmd"        value="insert">
            <input type="hidden" name="resveBeginTm" value="1000">
            <input type="hidden" name="resveEndTm"   value="1000">
            <input type="hidden" name="resveDe" value="<c:out value='${mtgPlaceManageVO.resveDe         }'/>">
            <span  class="link"  style="background:#ffffff;">
            <input type="submit" value="    " style="width:100%; height:100%;" ></span>
        </form>
    </td></c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp1030!='0' }">
    <td   bgcolor="#431508"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManageDetail.do'/>">
            <input type="hidden" name="resveId"    value="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp1030,0,20) }'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="cmd" value="detail">
            <span  class="link"  style="background:pink;">
            <Acronym Title="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp1030,20,fn:length(mtgPlaceResveManage.resveTemp1030))}'/>">
            <input type="submit" value="    " style="width:100%; height:100%;" ></Acronym></span>
        </form>
    </td>
    </c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp1030=='0' }"><td   bgcolor="#FFFFFF"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManage.do'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="resveId"    value="">
            <input type="hidden" name="cmd"        value="insert">
            <input type="hidden" name="resveBeginTm" value="1030">
            <input type="hidden" name="resveEndTm"   value="1030">
            <input type="hidden" name="resveDe" value="<c:out value='${mtgPlaceManageVO.resveDe         }'/>">
            <span  class="link"  style="background:#ffffff;">
            <input type="submit" value="    " style="width:100%; height:100%;" ></span>
        </form>
    </td></c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp1100!='0' }">
    <td   bgcolor="#431508"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManageDetail.do'/>">
            <input type="hidden" name="resveId"    value="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp1100,0,20) }'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="cmd" value="detail">
            <span  class="link"  style="background:pink;">
            <Acronym Title="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp1100,20,fn:length(mtgPlaceResveManage.resveTemp1100))}'/>">
            <input type="submit" value="    " style="width:100%; height:100%;" ></Acronym></span>
        </form>
    </td>
    </c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp1100=='0' }"><td   bgcolor="#FFFFFF"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManage.do'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="resveId"    value="">
            <input type="hidden" name="cmd"        value="insert">
            <input type="hidden" name="resveBeginTm" value="1100">
            <input type="hidden" name="resveEndTm"   value="1100">
            <input type="hidden" name="resveDe" value="<c:out value='${mtgPlaceManageVO.resveDe         }'/>">
            <span  class="link"  style="background:#ffffff;">
            <input type="submit" value="    " style="width:100%; height:100%;" ></span>
        </form>
    </td></c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp1130!='0' }">
    <td   bgcolor="#431508"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManageDetail.do'/>">
            <input type="hidden" name="resveId"    value="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp1130,0,20) }'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="cmd" value="detail">
            <span  class="link"  style="background:pink;">
            <Acronym Title="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp1130,20,fn:length(mtgPlaceResveManage.resveTemp1130))}'/>">
            <input type="submit" value="    " style="width:100%; height:100%;" ></Acronym></span>
        </form>
    </td>
    </c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp1130=='0' }"><td   bgcolor="#FFFFFF"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManage.do'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="resveId"    value="">
            <input type="hidden" name="cmd"        value="insert">
            <input type="hidden" name="resveBeginTm" value="1130">
            <input type="hidden" name="resveEndTm"   value="1130">
            <input type="hidden" name="resveDe" value="<c:out value='${mtgPlaceManageVO.resveDe         }'/>">
            <span  class="link"  style="background:#ffffff;">
            <input type="submit" value="    " style="width:100%; height:100%;" ></span>
        </form>
    </td></c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp1200!='0' }">
    <td   bgcolor="#431508"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManageDetail.do'/>">
            <input type="hidden" name="resveId"    value="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp1200,0,20) }'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="cmd" value="detail">
            <span  class="link"  style="background:pink;">
            <Acronym Title="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp1200,20,fn:length(mtgPlaceResveManage.resveTemp1200))}'/>">
            <input type="submit" value="    " style="width:100%; height:100%;" ></Acronym></span>
        </form>
    </td>
    </c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp1200=='0' }"><td   bgcolor="#FFFFFF"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManage.do'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="resveId"    value="">
            <input type="hidden" name="cmd"        value="insert">
            <input type="hidden" name="resveBeginTm" value="1200">
            <input type="hidden" name="resveEndTm"   value="1200">
            <input type="hidden" name="resveDe" value="<c:out value='${mtgPlaceManageVO.resveDe         }'/>">
            <span  class="link"  style="background:#ffffff;">
            <input type="submit" value="    " style="width:100%; height:100%;" ></span>
        </form>
    </td></c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp1230!='0' }">
    <td   bgcolor="#431508"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManageDetail.do'/>">
            <input type="hidden" name="resveId"    value="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp1230,0,20) }'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="cmd" value="detail">
            <span  class="link"  style="background:pink;">
            <Acronym Title="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp1230,20,fn:length(mtgPlaceResveManage.resveTemp1230))}'/>">
            <input type="submit" value="    " style="width:100%; height:100%;" ></Acronym></span>
        </form>
    </td>
    </c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp1230=='0' }"><td   bgcolor="#FFFFFF"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManage.do'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="resveId"    value="">
            <input type="hidden" name="cmd"        value="insert">
            <input type="hidden" name="resveBeginTm" value="1230">
            <input type="hidden" name="resveEndTm"   value="1230">
            <input type="hidden" name="resveDe" value="<c:out value='${mtgPlaceManageVO.resveDe         }'/>">
            <span  class="link"  style="background:#ffffff;">
            <input type="submit" value="    " style="width:100%; height:100%;" ></span>
        </form>
    </td></c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp1300!='0' }">
    <td   bgcolor="#431508"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManageDetail.do'/>">
            <input type="hidden" name="resveId"    value="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp1300,0,20) }'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="cmd" value="detail">
            <span  class="link"  style="background:pink;">
            <Acronym Title="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp1300,20,fn:length(mtgPlaceResveManage.resveTemp1300))}'/>">
            <input type="submit" value="    " style="width:100%; height:100%;" ></Acronym></span>
        </form>
    </td>
    </c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp1300=='0' }"><td   bgcolor="#FFFFFF"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManage.do'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="resveId"    value="">
            <input type="hidden" name="cmd"        value="insert">
            <input type="hidden" name="resveBeginTm" value="1300">
            <input type="hidden" name="resveEndTm"   value="1300">
            <input type="hidden" name="resveDe" value="<c:out value='${mtgPlaceManageVO.resveDe         }'/>">
            <span  class="link"  style="background:#ffffff;">
            <input type="submit" value="    " style="width:100%; height:100%;" ></span>
        </form>
    </td></c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp1330!='0' }">
    <td   bgcolor="#431508"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManageDetail.do'/>">
            <input type="hidden" name="resveId"    value="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp1330,0,20) }'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="cmd" value="detail">
            <span  class="link"  style="background:pink;">
            <Acronym Title="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp1330,20,fn:length(mtgPlaceResveManage.resveTemp1330))}'/>">
            <input type="submit" value="    " style="width:100%; height:100%;" ></Acronym></span>
        </form>
    </td>
    </c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp1330=='0' }"><td   bgcolor="#FFFFFF"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManage.do'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="resveId"    value="">
            <input type="hidden" name="cmd"        value="insert">
            <input type="hidden" name="resveBeginTm" value="1330">
            <input type="hidden" name="resveEndTm"   value="1330">
            <input type="hidden" name="resveDe" value="<c:out value='${mtgPlaceManageVO.resveDe         }'/>">
            <span  class="link"  style="background:#ffffff;">
            <input type="submit" value="    " style="width:100%; height:100%;" ></span>
        </form>
    </td></c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp1400!='0' }">
    <td   bgcolor="#431508"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManageDetail.do'/>">
            <input type="hidden" name="resveId"    value="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp1400,0,20) }'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="cmd" value="detail">
            <span  class="link"  style="background:pink;">
            <Acronym Title="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp1400,20,fn:length(mtgPlaceResveManage.resveTemp1400))}'/>">
            <input type="submit" value="    " style="width:100%; height:100%;" ></Acronym></span>
        </form>
    </td>
    </c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp1400=='0' }"><td   bgcolor="#FFFFFF"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManage.do'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="resveId"    value="">
            <input type="hidden" name="cmd"        value="insert">
            <input type="hidden" name="resveBeginTm" value="1400">
            <input type="hidden" name="resveEndTm"   value="1400">
            <input type="hidden" name="resveDe" value="<c:out value='${mtgPlaceManageVO.resveDe         }'/>">
            <span  class="link"  style="background:#ffffff;">
            <input type="submit" value="    " style="width:100%; height:100%;" ></span>
        </form>
    </td></c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp1430!='0' }">
    <td   bgcolor="#431508"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManageDetail.do'/>">
            <input type="hidden" name="resveId"    value="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp1430,0,20) }'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="cmd" value="detail">
            <span  class="link"  style="background:pink;">
            <Acronym Title="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp1430,20,fn:length(mtgPlaceResveManage.resveTemp1430))}'/>">
            <input type="submit" value="    " style="width:100%; height:100%;" ></Acronym></span>
        </form>
    </td>
    </c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp1430=='0' }"><td   bgcolor="#FFFFFF"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManage.do'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="resveId"    value="">
            <input type="hidden" name="cmd"        value="insert">
            <input type="hidden" name="resveBeginTm" value="1430">
            <input type="hidden" name="resveEndTm"   value="1430">
            <input type="hidden" name="resveDe" value="<c:out value='${mtgPlaceManageVO.resveDe         }'/>">
            <span  class="link"  style="background:#ffffff;">
            <input type="submit" value="    " style="width:100%; height:100%;" ></span>
        </form>
    </td></c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp1500!='0' }">
    <td   bgcolor="#431508"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManageDetail.do'/>">
            <input type="hidden" name="resveId"    value="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp1500,0,20) }'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="cmd" value="detail">
            <span  class="link"  style="background:pink;">
            <Acronym Title="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp1500,20,fn:length(mtgPlaceResveManage.resveTemp1500))}'/>">
            <input type="submit" value="    " style="width:100%; height:100%;" ></Acronym></span>
        </form>
    </td>
    </c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp1500=='0' }"><td   bgcolor="#FFFFFF"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManage.do'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="resveId"    value="">
            <input type="hidden" name="cmd"        value="insert">
            <input type="hidden" name="resveBeginTm" value="1500">
            <input type="hidden" name="resveEndTm"   value="1500">
            <input type="hidden" name="resveDe" value="<c:out value='${mtgPlaceManageVO.resveDe         }'/>">
            <span  class="link"  style="background:#ffffff;">
            <input type="submit" value="    " style="width:100%; height:100%;" ></span>
        </form>
    </td></c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp1530!='0' }">
    <td   bgcolor="#431508"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManageDetail.do'/>">
            <input type="hidden" name="resveId"    value="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp1530,0,20) }'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="cmd" value="detail">
            <span  class="link"  style="background:pink;">
            <Acronym Title="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp1530,20,fn:length(mtgPlaceResveManage.resveTemp1530))}'/>">
            <input type="submit" value="    " style="width:100%; height:100%;" ></Acronym></span>
        </form>
    </td>
    </c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp1530=='0' }"><td   bgcolor="#FFFFFF"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManage.do'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="resveId"    value="">
            <input type="hidden" name="cmd"        value="insert">
            <input type="hidden" name="resveBeginTm" value="1530">
            <input type="hidden" name="resveEndTm"   value="1530">
            <input type="hidden" name="resveDe" value="<c:out value='${mtgPlaceManageVO.resveDe         }'/>">
            <span  class="link"  style="background:#ffffff;">
            <input type="submit" value="    " style="width:100%; height:100%;" ></span>
        </form>
    </td></c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp1600!='0' }">
    <td   bgcolor="#431508"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManageDetail.do'/>">
            <input type="hidden" name="resveId"    value="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp1600,0,20) }'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="cmd" value="detail">
            <span  class="link"  style="background:pink;">
            <Acronym Title="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp1600,20,fn:length(mtgPlaceResveManage.resveTemp1600))}'/>">
            <input type="submit" value="    " style="width:100%; height:100%;" ></Acronym></span>
        </form>
    </td>
    </c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp1600=='0' }"><td   bgcolor="#FFFFFF"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManage.do'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="resveId"    value="">
            <input type="hidden" name="cmd"        value="insert">
            <input type="hidden" name="resveBeginTm" value="1600">
            <input type="hidden" name="resveEndTm"   value="1600">
            <input type="hidden" name="resveDe" value="<c:out value='${mtgPlaceManageVO.resveDe         }'/>">
            <span  class="link"  style="background:#ffffff;">
            <input type="submit" value="    " style="width:100%; height:100%;" ></span>
        </form>
    </td></c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp1630!='0' }">
    <td   bgcolor="#431508"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManageDetail.do'/>">
            <input type="hidden" name="resveId"    value="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp1630,0,20) }'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="cmd" value="detail">
            <span  class="link"  style="background:pink;">
            <Acronym Title="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp1630,20,fn:length(mtgPlaceResveManage.resveTemp1630))}'/>">
            <input type="submit" value="    " style="width:100%; height:100%;" ></Acronym></span>
        </form>
    </td>
    </c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp1630=='0' }"><td   bgcolor="#FFFFFF"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManage.do'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="resveId"    value="">
            <input type="hidden" name="cmd"        value="insert">
            <input type="hidden" name="resveBeginTm" value="1630">
            <input type="hidden" name="resveEndTm"   value="1630">
            <input type="hidden" name="resveDe" value="<c:out value='${mtgPlaceManageVO.resveDe         }'/>">
            <span  class="link"  style="background:#ffffff;">
            <input type="submit" value="    " style="width:100%; height:100%;" ></span>
        </form>
    </td></c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp1700!='0' }">
    <td   bgcolor="#431508"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManageDetail.do'/>">
            <input type="hidden" name="resveId"    value="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp1700,0,20) }'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="cmd" value="detail">
            <span  class="link"  style="background:pink;">
            <Acronym Title="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp1700,20,fn:length(mtgPlaceResveManage.resveTemp1700))}'/>">
            <input type="submit" value="    " style="width:100%; height:100%;" ></Acronym></span>
        </form>
    </td>
    </c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp1700=='0' }"><td   bgcolor="#FFFFFF"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManage.do'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="resveId"    value="">
            <input type="hidden" name="cmd"        value="insert">
            <input type="hidden" name="resveBeginTm" value="1700">
            <input type="hidden" name="resveEndTm"   value="1700">
            <input type="hidden" name="resveDe" value="<c:out value='${mtgPlaceManageVO.resveDe         }'/>">
            <span  class="link"  style="background:#ffffff;">
            <input type="submit" value="    " style="width:100%; height:100%;" ></span>
        </form>
    </td></c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp1730!='0' }">
    <td   bgcolor="#431508"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManageDetail.do'/>">
            <input type="hidden" name="resveId"    value="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp1730,0,20) }'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="cmd" value="detail">
            <span  class="link"  style="background:pink;">
            <Acronym Title="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp1730,20,fn:length(mtgPlaceResveManage.resveTemp1730))}'/>">
            <input type="submit" value="    " style="width:100%; height:100%;" ></Acronym></span>
        </form>
    </td>
    </c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp1730=='0' }"><td   bgcolor="#FFFFFF"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManage.do'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="resveId"    value="">
            <input type="hidden" name="cmd"        value="insert">
            <input type="hidden" name="resveBeginTm" value="1730">
            <input type="hidden" name="resveEndTm"   value="1730">
            <input type="hidden" name="resveDe" value="<c:out value='${mtgPlaceManageVO.resveDe         }'/>">
            <span  class="link"  style="background:#ffffff;">
            <input type="submit" value="    " style="width:100%; height:100%;" ></span>
        </form>
    </td></c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp1800!='0' }">
    <td   bgcolor="#431508"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManageDetail.do'/>">
            <input type="hidden" name="resveId"    value="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp1800,0,20) }'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="cmd" value="detail">
            <span  class="link"  style="background:pink;">
            <Acronym Title="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp1800,20,fn:length(mtgPlaceResveManage.resveTemp1800))}'/>">
            <input type="submit" value="    " style="width:100%; height:100%;" ></Acronym></span>
        </form>
    </td>
    </c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp1800=='0' }"><td   bgcolor="#FFFFFF"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManage.do'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="resveId"    value="">
            <input type="hidden" name="cmd"        value="insert">
            <input type="hidden" name="resveBeginTm" value="1800">
            <input type="hidden" name="resveEndTm"   value="1800">
            <input type="hidden" name="resveDe" value="<c:out value='${mtgPlaceManageVO.resveDe         }'/>">
            <span  class="link"  style="background:#ffffff;">
            <input type="submit" value="    " style="width:100%; height:100%;" ></span>
        </form>
    </td></c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp1830!='0' }">
    <td   bgcolor="#431508"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManageDetail.do'/>">
            <input type="hidden" name="resveId"    value="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp1830,0,20) }'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="cmd" value="detail">
            <span  class="link"  style="background:pink;">
            <Acronym Title="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp1830,20,fn:length(mtgPlaceResveManage.resveTemp1830))}'/>">
            <input type="submit" value="    " style="width:100%; height:100%;" ></Acronym></span>
        </form>
    </td>
    </c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp1830=='0' }"><td   bgcolor="#FFFFFF"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManage.do'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="resveId"    value="">
            <input type="hidden" name="cmd"        value="insert">
            <input type="hidden" name="resveBeginTm" value="1830">
            <input type="hidden" name="resveEndTm"   value="1830">
            <input type="hidden" name="resveDe" value="<c:out value='${mtgPlaceManageVO.resveDe         }'/>">
            <span  class="link"  style="background:#ffffff;">
            <input type="submit" value="    " style="width:100%; height:100%;" ></span>
        </form>
    </td></c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp1900!='0' }">
    <td   bgcolor="#431508"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManageDetail.do'/>">
            <input type="hidden" name="resveId"    value="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp1900,0,20) }'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="cmd" value="detail">
            <span  class="link"  style="background:pink;">
            <Acronym Title="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp1900,20,fn:length(mtgPlaceResveManage.resveTemp1900))}'/>">
            <input type="submit" value="    " style="width:100%; height:100%;" ></Acronym></span>
        </form>
    </td>
    </c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp1900=='0' }"><td   bgcolor="#FFFFFF"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManage.do'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="resveId"    value="">
            <input type="hidden" name="cmd"        value="insert">
            <input type="hidden" name="resveBeginTm" value="1900">
            <input type="hidden" name="resveEndTm"   value="1900">
            <input type="hidden" name="resveDe" value="<c:out value='${mtgPlaceManageVO.resveDe         }'/>">
            <span  class="link"  style="background:#ffffff;">
            <input type="submit" value="    " style="width:100%; height:100%;" ></span>
        </form>
    </td></c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp1930!='0' }">
    <td   bgcolor="#431508"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManageDetail.do'/>">
            <input type="hidden" name="resveId"    value="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp1930,0,20) }'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="cmd" value="detail">
            <span  class="link"  style="background:pink;">
            <Acronym Title="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp1930,20,fn:length(mtgPlaceResveManage.resveTemp1930))}'/>">
            <input type="submit" value="    " style="width:100%; height:100%;" ></Acronym></span>
        </form>
    </td>
    </c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp1930=='0' }"><td   bgcolor="#FFFFFF"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManage.do'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="resveId"    value="">
            <input type="hidden" name="cmd"        value="insert">
            <input type="hidden" name="resveBeginTm" value="1930">
            <input type="hidden" name="resveEndTm"   value="1930">
            <input type="hidden" name="resveDe" value="<c:out value='${mtgPlaceManageVO.resveDe         }'/>">
            <span  class="link"  style="background:#ffffff;">
            <input type="submit" value="    " style="width:100%; height:100%;" ></span>
        </form>
    </td></c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp2000!='0' }">
    <td   bgcolor="#431508"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManageDetail.do'/>">
            <input type="hidden" name="resveId"    value="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp2000,0,20) }'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="cmd" value="detail">
            <span  class="link"  style="background:pink;">
            <Acronym Title="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp2000,20,fn:length(mtgPlaceResveManage.resveTemp2000))}'/>">
            <input type="submit" value="    " style="width:100%; height:100%;" ></Acronym></span>
        </form>
    </td>
    </c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp2000=='0' }"><td   bgcolor="#FFFFFF"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManage.do'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="resveId"    value="">
            <input type="hidden" name="cmd"        value="insert">
            <input type="hidden" name="resveBeginTm" value="2000">
            <input type="hidden" name="resveEndTm"   value="2000">
            <input type="hidden" name="resveDe" value="<c:out value='${mtgPlaceManageVO.resveDe         }'/>">
            <span  class="link"  style="background:#ffffff;">
            <input type="submit" value="    " style="width:100%; height:100%;" ></span>
        </form>
    </td></c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp2030!='0' }">
    <td   bgcolor="#431508"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManageDetail.do'/>">
            <input type="hidden" name="resveId"    value="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp2030,0,20) }'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="cmd" value="detail">
            <span  class="link"  style="background:pink;">
            <Acronym Title="<c:out value='${fn:substring(mtgPlaceResveManage.resveTemp2030,20,fn:length(mtgPlaceResveManage.resveTemp2030))}'/>">
            <input type="submit" value="    " style="width:100%; height:100%;" ></Acronym></span>
        </form>
    </td>
    </c:if>
    <c:if test="${mtgPlaceResveManage.resveTemp2030=='0' }"><td   bgcolor="#FFFFFF"  >
        <form name="item" method="post" action="<c:url value='/uss/ion/mtg/selectMtgPlaceResveManage.do'/>">
            <input type="hidden" name="mtgPlaceId" value="<c:out value='${mtgPlaceResveManage.mtgPlaceId      }'/>">
            <input type="hidden" name="resveId"    value="">
            <input type="hidden" name="cmd"        value="insert">
            <input type="hidden" name="resveBeginTm" value="2030">
            <input type="hidden" name="resveEndTm"   value="2030">
            <input type="hidden" name="resveDe" value="<c:out value='${mtgPlaceManageVO.resveDe         }'/>">
            <span  class="link"  style="background:#ffffff;">
            <input type="submit" value="    " style="width:100%; height:100%;" ></span>
        </form>
    </td></c:if>
  </tr>   
 </c:forEach>
 </tbody>  
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="10"></td>
  </tr>
</table>


<!-- ********** 여기까지 내용 *************** -->
</td>
</tr>
</table>            
</DIV>
</body>
</html>