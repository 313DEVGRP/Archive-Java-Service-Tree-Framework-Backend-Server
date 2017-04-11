<%
/**
 * @Class Name : EgovEventReqstUpdt.java
 * @Description : EgovEventReqstUpdt jsp
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
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>행사수정</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />" ></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="eventManage" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">
<!--
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fncEventReqstManageList(){
	location.href = "/uss/ion/evt/EgovEventReqstManageList.do";
}
/* ********************************************************
* 저장처리화면
******************************************************** */
function fncUpdtEventReqstManage() {
    var varFrom = document.getElementById("eventManage");
    varFrom.action = "<c:url value='/uss/ion/evt/EgovEventReqstSave.do'/>";
    vEventBeginDe = varFrom.eventBeginDe.value.split("-").join("");
    vEventEndDe   = varFrom.eventEndDe.value.split("-").join("");
    vRceptBeginDe = varFrom.rceptBeginDe.value.split("-").join("");
    vRceptEndDe   = varFrom.rceptEndDe.value.split("-").join("");
    vRefrnUrl     = varFrom.refrnUrl.value.split("-").join("");
    vPsncpa       = varFrom.psncpa.value;
    vPartcptCt    = varFrom.partcptCt.value;

    if(vEventBeginDe > vEventEndDe){
	    alert("행사시작일이  행사종료일보다 늦습니다. 행사기간을 확인해 주세요");
	    return;
    }
    if(vRceptBeginDe > vRceptEndDe){
	    alert("행사접수시작일이  행사접수종료일보다 늦습니다. 행사접수기간을  확인해 주세요");
	    return;
    }
    
    if(vRceptEndDe > vEventBeginDe){
	    alert("행사접수는 행사시작일 이전에  접수종료되어어 합니다.  행사기간/행사접수기간을  확인해 주세요");
	    return;
    }

	if(!urlCheck(vRefrnUrl) && vRefrnUrl!=""){
		alert("참조URL의 형식이 URL 형식과 틀립니다. 확안해 주세요");
		return;
	}

    if(isNaN(vPartcptCt)){
        alert("참가비용은 숫자만 입력가능합니다.");
    	return;
	}

	if(varFrom.ctOccrrncAt[1].checked){
		if(vPartcptCt <= 0){
			alert("참가비용이 유료인 경우  0원 이상 입력하셔야 합니다. 확안해 주세요");
			return;
		}
	}
    if(isNaN(vPsncpa)){
        alert("정원은 숫자만 입력가능합니다.");
    	return;
	}	
	if(vPsncpa <= 0){
		alert("정원은  0명을 이상 입력하셔야 합니다. 확안해 주세요");
		return;
	}

	


	
    if(confirm("저장 하시겠습니까?")){
       if(!validateEventManage(varFrom)){           
          return;
       }else{
          varFrom.submit();
       } 
    }
}



/* ********************************************************
 * 참가비용체크
 ******************************************************** */
 function fncOccrrncAt(vValue) {
	  var varFrom = document.getElementById("eventManage");
	  if(vValue == "1"){ //무료
		  varFrom.partcptCt.value = 0;
	      varFrom.partcptCt.readOnly = true;
	  }else if(vValue == "2"){ //유료
		  varFrom.partcptCt.value = 0;
	      varFrom.partcptCt.readOnly = false;
	  }
 }
/* ********************************************************
 * URL 여부 체크
 ******************************************************** */
function urlCheck(vValue){
 return vValue.search(/^\s*['http://']+[\w\~\-\.]+\.[\w\~\-]+(\.[\w\~\-]+)+\s*$/g)>=0;
}

/* ********************************************************
 * 숫자 여부 체크
 ******************************************************** */
function checkNum(inputValue) 
{
	alert(isNaN(inputValue));
   var checkCode = inputValue.charCodeAt(inputValue.length-1); 
   var str; 
   alert(checkCode)
   if(checkCode >= 33 && checkCode <= 47 || checkCode >= 58 && checkCode <= 125) 
   {
	      return false;
   }
   return true;
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
<!-- 상단타이틀 -->
<form:form commandName="eventManage" name="eventManage" method="post" action="${pageContext.request.contextPath}/uss/ion/evt/EgovEventReqstSave.do">
<input name="cmd" type="hidden" value="updt"/>
<form:hidden  path="eventNm" />
<form:hidden  path="eventSe" />
<form:hidden  path="eventId" />
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="30%"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;행사  수정</h1></td>
  <td width="60%">&nbsp;</td>
  <th width="10%" align="right">
       <table border="0" cellspacing="0" cellpadding="0">
        <tr> 
	      <td><span class="button"><input type="submit" value="<spring:message code="button.save" />" onclick="fncUpdtEventReqstManage(); return false;"></span></td>
          <td>&nbsp;&nbsp;</td>
          <td><span class="button"><a href="<c:url value='/uss/ion/evt/EgovEventReqstManageList.do'/>?searchCondition=1" onclick="fncEventReqstManageList(); return false;"><spring:message code="button.list" /></a></span></td>     
        </tr>
       </table>
  </th>  
 </tr>
</table>
<!-- 등록  폼 영역  -->
<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="행사관리 수정" >
<caption>행사관리 수정</caption>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row">행사구분<img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="80%"  colspan="3"><c:out value='${eventManageVO.eventTemp3}'/></td>
  </tr> 
  <tr> 
    <th width="20%" height="23" class="required_text" scope="row">행사명<img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>
    <td width="80%" ><c:out value='${eventManageVO.eventNm}'/></td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="eventPurps">행사목적</label><img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="80%" >
      <form:input  path="eventPurps" size="80" maxlength="200" title="행사목적"/>
      <form:errors path="eventPurps"/>
    </td>    
  </tr> 

  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="eventBeginDe">행사기간</label><img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="80%" >
    <input type="hidden" name="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" />
      <form:input path="eventBeginDe" size="10" maxlength="10" title="행사 시작일자"/>
      <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(document.eventManage, document.eventManage.eventBeginDe, document.eventManage.eventBeginDe);" title="새 창으로 이동"
    	style="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" alt="달력창팝업버튼이미지"
	    width="15" height="15"></a>
	    ~
	  
      <form:input path="eventEndDe" size="10" maxlength="10" title="행사 종료일자"/>
      <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(document.eventManage, document.eventManage.eventEndDe, document.eventManage.eventEndDe);" title="새 창으로 이동"
    	style="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" alt="달력창팝업버튼이미지"
	    width="15" height="15"></a> (<c:out value='${eventManageVO.eventTemp1}'/>일간)
    </td>    
  </tr> 
  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="eventAuspcInsttNm">행사주최</label><img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="80%" >
      <form:input  path="eventAuspcInsttNm" size="60" maxlength="60" title="행사주최"/>
      <form:errors path="eventAuspcInsttNm"/>
    </td>    
  </tr> 
  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="eventMngtInsttNm">행사주관</label><img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="80%" >
      <form:input  path="eventMngtInsttNm" size="60" maxlength="60" title="행사주관"/>
      <form:errors path="eventMngtInsttNm"/>
    </td>    
  </tr> 
  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="eventPlace">행사장소</label><img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="80%" >
      <form:input  path="eventPlace" size="80" maxlength="200" title="행사장소"/>
      <form:errors path="eventPlace"/>
    </td>    
  </tr> 
  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="refrnUrl">참조URL</label><img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>          
    <td width="80%" >
      <form:input  path="refrnUrl" size="80" maxlength="1024" title="참조URL"/>
      <form:errors path="refrnUrl"/>
    </td>    
  </tr> 
  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="eventCn">행사내용</label><img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="80%" >
      <form:textarea path="eventCn" rows="4" cols="70" cssClass="txaClass" title="참조URL"/>
      <form:errors path="eventCn"/>
    </td>    
  </tr> 
  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="ctOccrrncAt">참가비용</label><img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="80%" >
      <input name="ctOccrrncAt" type="radio" value="1" onClick="javascript:fncOccrrncAt(this.value)" <c:if test="${eventManageVO.ctOccrrncAt == '1'}">checked</c:if> title="무료">무료
      <input name="ctOccrrncAt" type="radio" value="2" onClick="javascript:fncOccrrncAt(this.value)" <c:if test="${eventManageVO.ctOccrrncAt == '2'}">checked</c:if> title="유료">유료
      <form:input  path="partcptCt" size="10" maxlength="9" title="유료금액 "/>
      <form:errors path="partcptCt"/>만원
    </td>    
  </tr> 
  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="psncpa">정원</label><img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="80%" >
      <form:input  path="psncpa" size="10" maxlength="9" title="정원 "/>
      <form:errors path="psncpa"/>
    </td>    
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="rceptBeginDe">행사접수기간</label><img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="80%" >
	  
      <form:input path="rceptBeginDe" size="10" maxlength="10" title="행사접수 시작일자"/>
      <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(document.eventManage, document.eventManage.rceptBeginDe, document.eventManage.rceptBeginDe);" title="새 창으로 이동"
    	style="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" alt="달력창팝업버튼이미지"
	    width="15" height="15"></a>
	    ~
	  
      <form:input path="rceptEndDe" size="10" maxlength="10" title="행사접수 종료일자"/>
      <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(document.eventManage, document.eventManage.rceptEndDe, document.eventManage.rceptEndDe);" title="새 창으로 이동"
    	style="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" alt="달력창팝업버튼이미지"
	    width="15" height="15"></a>
    </td>    
  </tr>
</table>
</form:form>
<!-- ********** 여기까지 내용 *************** -->
</td>
</tr>
</table>   
</div>
</body>
</html>
