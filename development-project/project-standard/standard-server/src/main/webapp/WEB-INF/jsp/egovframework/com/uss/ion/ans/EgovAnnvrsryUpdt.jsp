<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%

/**
 * @Class Name : EgovAnnvrsryDetail.java
 * @Description : EgovAnnvrsryDetail jsp
 * @Modification Information
 * @
 * @  수정일                    수정자                수정내용
 * @ ---------     --------    ---------------------------
 * @ 2010.06.30    이      용                최초 생성
 *
 *  @author 이      용
 *  @since 2010.06.30
 *  @version 1.0
 *  @see
 *  
 *  Copyright (C) 2009 by MOPAS  All right reserved.
 */
 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>기념일 수정</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />" ></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="annvrsryManage" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">
<!--
/*설명 : 기념일 목록조회*/
function fncSelectAnnvrsryManageList() {
    var varFrom = document.getElementById("annvrsryManage");
    varFrom.action = "<c:url value='/uss/ion/ans/selectAnnvrsryManageList.do'/>";
    varFrom.submit();       
}
/*설명 : 기념일 수정처리*/
function fncUpdateAnnvrsry() {
    var varFrom = document.getElementById("annvrsryManage");
    varFrom.action = "<c:url value='/uss/ion/ans/updateAnnvrsryManage.do'/>";

    if(confirm("저장 하시겠습니까?")){
        if(!validateAnnvrsryManage(varFrom)){           
            return;
        }else{
            varFrom.submit();
        } 
    }
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
<form:form commandName="annvrsryManage" name="annvrsryManage" method="post" action="${pageContext.request.contextPath}/uss/ion/ans/updateAnnvrsryManage.do"> 
<form:hidden path="annId"   />
<form:hidden path="usid"   />

<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="30%"class="title_left">
    <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;기념일 수정</h1></td>
  <td width="60%">&nbsp;</td>
  <th width="10%" align="right">
       <table border="0" cellspacing="0" cellpadding="0">
        <tr> 
	      <td><span class="button"><input type="submit" value="<spring:message code="button.save" />" onclick="fncUpdateAnnvrsry(); return false;"></span></td>
          <td>&nbsp;&nbsp;</td>
          <td><span class="button"><a href="<c:url value='/uss/ion/ans/selectAnnvrsryManageList.do'/>?searchCondition=1" onclick="fncSelectAnnvrsryManageList(); return false;"><spring:message code="button.list" /></a></span></td>     
        </tr>
       </table>
  </th>  
 </tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="기념일관리 수정" >
<caption>기념일관리 수정</caption>
  <tr> 
    <th height="23" class="required_text" scope="row">신청자<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt="필수입력표시"></th>
    <td><c:out value="${annvrsryManageVO.annvrsryTemp1      }"/></td>
    <th height="23" class="required_text" scope="row">소속<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt="필수입력표시"></th>
    <td><c:out value="${annvrsryManageVO.annvrsryTemp2      }"/></td>
  </tr> 
  <tr> 
    <th height="23" class="required_text" scope="row">기념일구분<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt="필수입력표시"></th>
    <td>
      <form:select path="annvrsrySe" title="기념일구분">
	      <form:options items="${annvrsrySeCode}" itemValue="code" itemLabel="codeNm"/>
      </form:select></td>
    <th height="23" class="required_text" scope="row">기념일<img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt="필수입력표시"></th>
    <td>
    	  <input type="hidden" name="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" />
		  <form:input  path="annvrsryDe" size="10" maxlength="10" title="기념일" />
	      <a href="#LINK" onclick="javascript:fn_egov_NormalCalendar(document.annvrsryManage, document.annvrsryManage.annvrsryDe, document.annvrsryManage.annvrsryDe);" 
	    	style="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" alt="달력창팝업버튼이미지"
		    width="15" height="15"></a>
	     	양력 : <form:radiobutton path="cldrSe"  value="1" title="양력"/>&nbsp;
	     	음력 : <form:radiobutton path="cldrSe"  value="2" title="음력"/>
	     	<br/><form:errors path="cldrSe" />
	     	&nbsp;&nbsp;매년반복 : <input type="checkbox" name="reptitSe" id="reptitSe" title="반복여부" value="1" <c:if test="${'1' eq annvrsryManageVO.reptitSe}">checked</c:if>>
	     	</td>
  </tr>
  <tr> 
    <th height="23" class="required_text" scope="row"><label for="annvrsryNm">기념일명</label><img src="/images/egovframework/com/cmm/icon/required.gif" width="15" height="15" alt="필수입력표시"></th>
    <td colspan="3">
      
      <form:input  path="annvrsryNm" size="80" maxlength="255" title="기념일명"/>
      <form:errors path="annvrsryNm"/></td>
  </tr>
  <tr> 
    <th height="23" class="required_text" scope="row"><label for="memo">메모</label><img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>
    <td colspan="3">
       <TEXTAREA name="memo" id="memo" style="width:95%;height:100px;" title="메모"><c:out value="${annvrsryManageVO.memo      }"   escapeXml="false"/></TEXTAREA>
     </td> 
  </tr>
  <tr> 
    <th width="20%" height="23" class="required_text" scope="row"><label for="annvrsryBeginDe">알림시작일</label><img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>
    <td width="20%" nowrap>D-
        <select name="annvrsryBeginDe" title="알림시작일" >
	       	<option value="7" <c:if test='${annvrsryManageVO.annvrsryBeginDe == "7"}'>selected</c:if>>일주일</option>
	       	<option value="3" <c:if test='${annvrsryManageVO.annvrsryBeginDe == "3"}'>selected</c:if>>3일</option>
	       	<option value="2" <c:if test='${annvrsryManageVO.annvrsryBeginDe == "2"}'>selected</c:if>>2일</option>
	       	<option value="1" <c:if test='${annvrsryManageVO.annvrsryBeginDe == "1"}'>selected</c:if>>1일</option>
      	</select> 전 부터 알림
    </td>
    <th width="20%" height="23" class="required_text" scope="row"><label for="annvrsrySetup">알림설정</label><img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>
    <td width="40%" nowrap>
    <input name="annvrsrySetup" name="annvrsrySetup" type="radio" style="border:0px;" value="Y" title="알림설정" <c:if test='${annvrsryManageVO.annvrsrySetup == "Y"}'>checked</c:if>>ON <input name="annvrsrySetup" type="radio" style="border:0px;" value="N" <c:if test='${annvrsryManageVO.annvrsrySetup == "N"}'>checked</c:if>>OFF</td>
  </tr>
</table>
</form:form>
<!-- ********** 여기까지 내용 *************** -->
</td>
</tr>
</table>            
</DIV>
</body>
</html>
