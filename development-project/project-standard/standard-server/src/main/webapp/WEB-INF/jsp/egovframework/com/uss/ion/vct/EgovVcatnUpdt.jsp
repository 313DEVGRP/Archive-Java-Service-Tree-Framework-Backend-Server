<%
/**
 * @Class Name  : EgovVcatnUpdt.java
 * @Description : EgovVcatnUpdt.jsp
 * @Modification Information
 * @
 * @  수정일                    수정자                수정내용
 * @ ---------     --------    ---------------------------
 * @ 2010.07.20    이      용                최초 생성
 *
 *  @author 이      용
 *  @since 2010.08.05
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
<title>휴가수정</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style><script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />" ></script>
<validator:javascript formName="vcatnManage" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">
<!--
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fncEgovVcatnManageList(){
	location.href = "/uss/ion/vct/EgovVcatnManageList.do";
}

/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fncUpdtVcatnManage() {
    var varForm = document.getElementById("vcatnManage");
    if(varForm.bgnde.value == ""){
        alert("휴가 시작일자가 존재하지 않습니다. 휴가일자를 확인하세요.");
        return;
    }
    if(varForm.endde.value == "" && varForm.vcatnSe.value != "02"){
        alert("휴가종료일자가 존재하지 않습니다. 휴가일자를 확인하세요.");
        return;
    }
    
    if(varForm.bgnde.value > varForm.endde.value){
        if(varForm.vcatnSe.value != "02"){
	        alert("휴가일자 검색조건의 시작일자가 종료일자보다  늦습니다. 휴가일자를 확인하세요.");
	        return;
        }
	}
    varForm.action = "<c:url value='/uss/ion/vct/updtVcatnManage.do'/>";
    if(!fncHTMLTagFilter(varForm.vcatnResn.value)) return;
    if(confirm("저장 하시겠습니까?")){
        if(!validateVcatnManage(varForm)){           
            return;
        }else{
        	varForm.submit();
        } 
    }
}
		
function fncNoonSeSpan(vValue){
	var sHEndde = vcatnManage.endde.value;
	//var sHNoonSe = vcatnManage.noonSe.value;
	var vTemp = "";
    if(vValue != "02"){
		vTemp += " <input type='hidden' name='cal_url' value='<c:url value='/sym/cal/EgovNormalCalPopup.do'/>' />";
		vTemp += "  <input name='enddeView' type='text' size='10' value='"+sHEndde+"' readOnly	onClick='javascript:fn_egov_NormalCalendar(document.vcatnManage, document.vcatnManage.endde, document.vcatnManage.enddeView);'>";
		vTemp += "  <img src='<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />' onClick='javascript:fn_egov_NormalCalendar(document.vcatnManage, document.vcatnManage.endde, document.vcatnManage.enddeView);' alt='달력' width='15' height='15'> ";
        nameSpan.innerHTML = "<label for='endde'>종료일자</label>";
    }
    if(vValue == "02"){

    	vTemp += "  <input name='noonSe' type='radio' value='1' checked>오전";
    	vTemp += "  <input name='noonSe' type='radio' value='2' >오후";
  /*      
        if(sHNoonSe == 2){
        	vTemp += "  <input name='noonSe' type='radio' value='1'>오전";
        	vTemp += "  <input name='noonSe' type='radio' value='2' checked>오후";
        }
        else{
        	vTemp += "  <input name='noonSe' type='radio' value='1' checked>오전";
        	vTemp += "  <input name='noonSe' type='radio' value='2' >오후";
        }
*/
        nameSpan.innerHTML = "<label for='noonSe'>정오구분</label>";
    }
    noonSeSpan.innerHTML = vTemp;
}

function fncHTMLTagFilter(vValue) {
    var tempValue ="";
	for (var i = 0; i < vValue.length; i++) {
	   c = vValue.charAt(i);
		switch (c) {
		case '<':
			tempValue += "&lt;";
			break;
		case '>':
			tempValue += "&gt;";
			break;
		case '&':
			tempValue += "&amp;";
			break;
		case '"':
			tempValue += "&quot;";
			break;
		case '\'':
			tempValue += "&apos;";
			break;	
		default:
			tempValue += c;
			break;
		}
	}
	if(tempValue.length > 200){
		alert("휴가사유 항목의 입력값이 200자(한글100자)를 초과하였습니다. \n \n특수문자('<','>','&','\"', '\'')를 사용하신 경 우  \n\n해당 문자('&lt;','&gt;','&amp;','&quot;','&apos;')로 치환 처리되어 문자수가 초과처리 될수도 있습니다 .")
		return false;
	}else return true;
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

<form:form commandName="vcatnManage" name="vcatnManage" method="post" action="${pageContext.request.contextPath}/uss/ion/vct/updtVcatnManage.do">
<input type="hidden" name="applcntIdKey" value="<c:out value='${vcatnManageVO.applcntId}'/>" />
<input type="hidden" name="vcatnSeKey"   value="<c:out value='${vcatnManageVO.vcatnSe  }'/>" />
<input type="hidden" name="bgndeKey"     value="<c:out value='${vcatnManageVO.bgnde    }'/>" />
<input type="hidden" name="enddeKey"     value="<c:out value='${vcatnManageVO.endde    }'/>" />
<form:hidden  path="applcntId"/>
<form:hidden  path="bgnde"/>
<form:hidden  path="endde"/>
<form:hidden  path="infrmlSanctnId"/>
<form:hidden  path="occrrncYear"/>
<form:hidden  path="sanctnerId"/>




<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="30%"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;휴가수정</h1></td>
  <td width="60%">&nbsp;</td>
  <th width="10%" align="right">
       <table border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td>&nbsp;&nbsp;</td>
	      <td><span class="button"><input type="submit" value="<spring:message code="button.save" />" onclick="fncUpdtVcatnManage(); return false;"></span></td>
          <td>&nbsp;&nbsp;</td>
          <td><span class="button"><a href="#LINK" onclick="fncEgovVcatnManageList(); return false;"><spring:message code="button.list" /></a></span></td>     
        </tr>
       </table>
  </th>  
 </tr>
</table>

<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%" class="title_left">
   <img src="/images/egovframework/com/cmm/icon/tit_icon.gif" width="9" height="9" hspace="3" alt="">&nbsp;휴가 신청자</td>
 </tr>
</table>
<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="신청자 정보" >
<caption>신청자 정보</caption>
  <tr>
    <th width="20%" height="23" class="required_text"  scope="row">신청자<img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>          
    <td width="30%" ><c:out value='${vcatnManageVO.applcntNm}'/>

    
    </td>
    <th width="20%" height="23" class="required_text"  scope="row">소속<img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>          
    <td width="30%"><c:out value='${vcatnManageVO.orgnztNm}'/></td>
  </tr> 
</table>

<table width="700" cellspacing="0" cellpadding="0" border="0" summary="신청자 연차 정보" >
<caption>신청자 연차 정보</caption>
<tr>
	<td colspan="4">&nbsp; </td>
</tr>
<tr>
	<td width="120px">[발생연차: ${vcatnManageVO.occrncYrycCo}  ]</td>
	<td width="120px">[사용연차: ${vcatnManageVO.useYrycCo   }  ]</td>
	<td width="120px">[잔여연차: ${vcatnManageVO.remndrYrycCo}  ]</td>
	<td width="340px"> </td>
</tr>
<tr>
	<td colspan="4">&nbsp; </td>
</tr>
</table>


<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="휴가관리 수정" >
<caption>휴가관리 수정</caption>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="vcatnSe">휴가구분</label><img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td colspan="3">
      <form:select path="vcatnSe" onchange="javascript:fncNoonSeSpan(this.value);" title="휴가구분">
	      <form:options items="${vcatnSeCode}" itemValue="code" itemLabel="codeNm"/>
      </form:select>
    </td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="bgnde">시작일자</label><img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="30%">
      <input type="hidden" name="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" />
      <input name="bgndeView" type="text" size="10" value="<c:out value='${vcatnManageVO.bgnde  }'/>" maxlength="10" title="휴가 시작일자">
      <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(document.vcatnManage, document.vcatnManage.bgnde, document.vcatnManage.bgndeView);" 
    	style="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" alt="달력창팝업버튼이미지"
	    width="15" height="15"></a></td>
    
    <c:if test="${vcatnManageVO.vcatnSe ne '02' }">
    <th width="20%" height="23" class="required_text"   scope="row"><span id="nameSpan"><label for="endde">종료일자</label></span><img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="30%"  >
    	<span id="noonSeSpan"> 
	      <input type="hidden" name="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" />
	      <input name="enddeView" type="text" size="10" value="<c:out value='${vcatnManageVO.endde  }'/>" maxlength="10" title="휴가 종료일자">
	      <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(document.vcatnManage, document.vcatnManage.endde, document.vcatnManage.enddeView);" 
	    	style="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" alt="달력창팝업버튼이미지"
		    width="15" height="15"></a>
    	</span></td>
    </c:if>
    <c:if test="${vcatnManageVO.vcatnSe eq '02' }">
    <th width="20%" height="23" class="required_text"   scope="row"><span id="nameSpan"><label for="noonSe">정오구분</label></span><img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="30%">
        <span id="noonSeSpan">
    	<input name='noonSe' type='radio' value='1' <c:if test="${vcatnManageVO.noonSe eq '1' }">checked </c:if>>오전
    	<input name='noonSe' type='radio' value='2' <c:if test="${vcatnManageVO.noonSe eq '2' }">checked </c:if>>오후
    	</span>
     </td>
    </c:if>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row"><label for="vcatnResn">휴가사유</label><img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td colspan="3">
           <textarea id="vcatnResn" name="vcatnResn" class="txaClass" rows="4" cols="70" title="휴가사유"><c:out value='${vcatnManageVO.vcatnResn}' escapeXml="false" /></textarea>
    </td>
  </tr>
</table>

<!-- 결재권자 정보 Include -->
<jsp:include page="/uss/ion/ism/selectInfrmlSanctn.do" flush="true"> 
<jsp:param name="infrmlSanctnId" value="${vcatnManageVO.infrmlSanctnId}"/>
</jsp:include>
<!-- //결재권자 정보 Include -->

</form:form>
<!-- ********** 여기까지 내용 *************** -->
</td>
</tr>
</table>   
</div>
</body>
</html>