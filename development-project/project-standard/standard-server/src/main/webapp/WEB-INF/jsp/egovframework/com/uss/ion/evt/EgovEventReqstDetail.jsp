<%
/**
 * @Class Name : EgovEventReqstDetail.java
 * @Description : EgovEventReqstDetail jsp
 * @Modification Information
 * @
 * @  수정일                    수정자                수정내용
 * @ ---------     --------    ---------------------------
 * @ 2010.07.20    이      용                최초 생성
 *   2011.08.17    	정진오		선택입력사항을 표시하는 이미지 icon 경로가
 * 								다른 패키지로 되어 있던 것을 당해 패키지 경로로 수정함 *
 *  @author 이      용
 *  @since 2010.07.20
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
<%@ page import="egovframework.com.utl.fcc.service.EgovDateUtil" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>행사  상세</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
	<c:if test="${check_popup == 'Y'}">
	body { margin-left:23px; margin-right:0px; margin-top:0px; margin-bottom:0px;}
	</c:if>
</style>
<script type="text/javaScript" language="javascript">
<c:if test="${empty check_popup}">
<!--
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fncEventReqstManageList(){
	location.href = "/uss/ion/evt/EgovEventReqstManageList.do";
}
<c:if test="${eventManageVO.eventAtdrnCount == 0 && eventManageVO.eventDayCount >= 0}">
/* ********************************************************
* 수정화면으로  바로가기
******************************************************** */
function fncEventReqstManage() {
		var varFrom = document.getElementById("eventManage");
		varFrom.cmd.value  = "updt";
		varFrom.action = "<c:url value='/uss/ion/evt/EgovEventReqstDetail.do'/>";
		varFrom.submit();   
}
/* ********************************************************
* 삭제처리화면
******************************************************** */

function fncDeleteEventReqstManage() {
   var varFrom = document.getElementById("eventManage");
   varFrom.action = "<c:url value='/uss/ion/evt/EgovEventReqstDelete.do'/>";
   if(confirm("삭제 하시겠습니까?")){
       varFrom.submit();
   }
}
</c:if>
-->
</c:if>
</script>
</head>

<body>
<c:if test="${empty check_popup}">
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
</c:if>
<div id="border" style="width:730px">
<table border="0">
  <tr>
    <td width="700">
<!-- ********** 여기서 부터 본문 내용 *************** -->
<!-- 상단타이틀 -->
<form name="eventManage" id="eventManage" method="post" action="${pageContext.request.contextPath}/uss/ion/evt/EgovEventReqstDetail.do">
<div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div>
<input name="cmd" type="hidden" value="updt"/>
<input name="eventId" type="hidden" value="<c:out value='${eventManageVO.eventId}'/>"/>
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="30%"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;행사  상세</h1></td>
  <td width="60%">&nbsp;</td>
  <th width="10%" align="right">
       <table border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <c:if test="${check_popup == 'Y'}">
              <td>&nbsp;&nbsp;</td>
          </c:if>
          <c:if test="${empty check_popup}">
              <c:if test="${eventManageVO.eventAtdrnCount == 0 && eventManageVO.eventDayCount >= 0}">
	          	  <td><span class="button"><input type="submit" value="<spring:message code="button.update" />" onclick="fncEventReqstManage(); return false;"></span></td>
		          <td>&nbsp;&nbsp;</td>
		          <td align="right"><span class="button"><a href="<c:url value='/uss/ion/evt/EgovEventReqstDelete.do'/>?eventId=<c:out value='${eventManageVO.eventId}'/>" onclick="fncDeleteEventReqstManage(); return false;"><spring:message code="button.delete" /></a></span></td>     
			  </c:if>
			  <td>&nbsp;&nbsp;</td>
	          <td><span class="button"><a href="<c:url value='/uss/ion/evt/EgovEventReqstManageList.do'/>" onclick="fncEventReqstManageList(); return false;"><spring:message code="button.list" /></a></span></td> 
          </c:if>
        </tr>
       </table>
  </th>  
 </tr>
</table>

<!-- 등록  폼 영역  -->
<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="행사관리 상세" >
<caption>행사관리 상세</caption>
  <tr>
    <th width="20%" height="23" class="required_text"  scope="row">행사구분<img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="80%" ><c:out value='${eventManageVO.eventTemp3}'/></td>
  </tr> 
  <tr> 
    <th width="20%" height="23" class="required_text"  scope="row">행사명<img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>
    <td width="80%" ><c:out value='${eventManageVO.eventNm}'/></td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text"  scope="row">행사목적<img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="80%" ><c:out value='${eventManageVO.eventPurps}'/></td>    
  </tr> 

  <tr>
    <th width="20%" height="23" class="required_text"  scope="row">행사기간<img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="80%" ><c:out value='${eventManageVO.eventBeginDe}'/> ~ <c:out value='${eventManageVO.eventEndDe}'/> (<c:out value='${eventManageVO.eventTemp1}'/>일간)</td>    
  </tr> 
  <tr>
    <th width="20%" height="23" class="required_text"  scope="row">행사주최<img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="80%" ><c:out value='${eventManageVO.eventAuspcInsttNm}'/></td>    
  </tr> 
  <tr>
    <th width="20%" height="23" class="required_text"  scope="row">행사주관<img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="80%" ><c:out value='${eventManageVO.eventMngtInsttNm}'/></td>    
  </tr> 
  <tr>
    <th width="20%" height="23" class="required_text"  scope="row">행사장소<img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="80%" ><c:out value='${eventManageVO.eventPlace}'/></td>    
  </tr> 
  <tr>
    <th width="20%" height="23" class="required_text"  scope="row">참조URL<img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>          
    <td width="80%" >
    <c:if test="${!empty eventManageVO.refrnUrl}">
       <a href="<c:out value='${eventManageVO.refrnUrl}'/>" target="_blank"  title="새 창으로 이동" ><c:out value='${eventManageVO.refrnUrl}'/></a>
    </c:if>
    </td>    
  </tr> 
  <tr>
    <th width="20%" height="23" class="required_text"  scope="row">행사내용<img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="80%" >
       <textarea id="remark" name="eventCn" class="txaClass" rows="4" cols="70" title="행사내용" readonly ><c:out value='${eventManageVO.eventCn}'/></textarea>
    </td>    
  </tr> 
  <tr>
    <th width="20%" height="23" class="required_text"  scope="row">참가비용<img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="80%" > 
       <c:if test="${eventManageVO.ctOccrrncAt == '1'}"> 무료 </c:if>
       <c:if test="${eventManageVO.ctOccrrncAt == '2'}"> 유료       
          <c:out value='${eventManageVO.partcptCt}'/>만원
       </c:if>
    </td>    
  </tr> 
  <tr>
    <th width="20%" height="23" class="required_text"  scope="row">정원<img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="80%" ><c:out value='${eventManageVO.psncpa}'/>
    </td>    
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text"  scope="row">행사접수기간<img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="80%" >
       <c:out value='${eventManageVO.rceptBeginDe}'/> ~ <c:out value='${eventManageVO.rceptEndDe}'/>
    </td>    
  </tr>
</table>

 <c:if test="${check_popup == 'Y'}">
	<table width="700"  border="0" cellspacing="0" cellpadding="0">
	 <tr> 
	   <td width="45%">&nbsp;</td>     
	   <td width="10%">&nbsp;</td> 
	   <td width="45%">&nbsp;</td> 
	 </tr>
	  <tr> 
	   <td width="45%">&nbsp;</td>     
	   <td width="10%">&nbsp;</td> 
	   <td width="45%">&nbsp;</td> 
	 </tr>
	 <tr> 
	   <td width="45%">&nbsp;</td>     
	   <td width="10%" align="center">
		   <span class="button">
		   <a href="javascript:window.close()" onclick="javascript:window.close(); return false;">닫기</a>
		   </span>
	   </td>     
	   <td width="45%">&nbsp;</td> 
	 </tr>
	</table>
</c:if>

</form>
<!-- ********** 여기까지 내용 *************** -->
</td>
</tr>
</table>   
</div>
</body>
</html>
