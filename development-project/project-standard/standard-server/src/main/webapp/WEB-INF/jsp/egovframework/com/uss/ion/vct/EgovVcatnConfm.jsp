<%
/**
 * @Class Name  : EgovVcatnConfm.java
 * @Description : EgovVcatnConfm.jsp
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
<title>휴가승인</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />" ></script>
<validator:javascript formName="vcatnManage" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">
	/* ********************************************************
	 * 휴가승인목록 으로 가기
	 ******************************************************** */
	function fncEgovVcatnConfmList(){
		location.href = "/uss/ion/vct/EgovVcatnConfmList.do";
	}
	<c:if test="${vcatnManageVO.confmAt eq 'A' }">
	/* ********************************************************
	 * 승인 처리  팝업창열기
	 * fncConfmVcatnManage
	 * param 반려구분
	 ******************************************************** */
	 function fncConfmVcatnManage(){
		var varForm	= document.all["vcatnManage"];
	
		var arrParam = new Array(4);
		arrParam[0] = window;
		arrParam[1] = "휴가신청 - 승인";
		arrParam[2] = "returnResn";
		arrParam[3] = "confmAt";
		
		window.showModalDialog("/uss/ion/ism/EgovConfmPopup.do", arrParam,"dialogWidth=780px;dialogHeight=170px;resizable=yes;center=yes");
	 }
	
	/* ********************************************************
	 * 휴가승인처리화면
	 ******************************************************** */
	function fncConfm() {
		var varFrom = document.getElementById("vcatnManage");
		varFrom.confmAt.value = "C";
		varFrom.action = "<c:url value='/uss/ion/vct/updtVcatnConfm.do'/>";
		
		//if(!fncHTMLTagFilter(varFrom.vcatnResn.value)) return;
		
	    if(!validateVcatnManage(varFrom)){           
	        return;
	    }else{
	         varFrom.submit();
	    } 
	}
	
	/* ********************************************************
	 * 반려 처리  팝업창열기
	 * fncCtsnnReturn
	 * param 반려구분
	 ******************************************************** */
	 function fncReturnVcatnManage(){
		var varForm	= document.all["vcatnManage"];
	
		var arrParam = new Array(4);
		arrParam[0] = window;
		arrParam[1] = "휴가신청 - 반려";
		arrParam[2] = "returnResn";
		arrParam[3] = "confmAt";
	
		window.showModalDialog("/uss/ion/ism/EgovReturnPopup.do", arrParam,"dialogWidth=780px;dialogHeight=170px;resizable=yes;center=yes");
	 }
	
	/* ********************************************************
	 * 휴가반려처리화면
	 ******************************************************** */
	function fncReturn() {
		var varFrom = document.getElementById("vcatnManage");
		varFrom.confmAt.value = "R";
		varFrom.action = "<c:url value='/uss/ion/vct/updtVcatnConfm.do'/>";
	    if(!validateVcatnManage(varFrom)){           
	        return;
	    }else{
	         varFrom.submit();
	    } 
	}
	</c:if>
	
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
		}
	}
</script>
</head>

<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<div id="border" style="width:730px">
<table border="0">
  <tr>
    <td width="700">
<!-- ********** 여기서 부터 본문 내용 *************** -->

<form:form commandName="vcatnManage" name="vcatnManage" method="post" action="#LINK">
<div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div>
<form:hidden  path="applcntId"/>
<form:hidden  path="vcatnSe"/>
<form:hidden  path="bgnde"/>
<form:hidden  path="endde"/>
<form:hidden  path="infrmlSanctnId"/>
<form:hidden  path="occrrncYear"/>
<form:hidden  path="confmAt"/>
<form:hidden  path="sanctnerId"/>
<form:hidden  path="returnResn"/>
<input type="hidden" name="vcatnResn"/>


<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="30%"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;휴가승인</h1></td>
  <td width="60%">&nbsp;</td>
  <th width="10%" align="right">
       <table border="0" cellspacing="0" cellpadding="0">
        <tr> 
        <c:if test="${vcatnManageVO.confmAt eq 'A' }">
          <td>&nbsp;&nbsp;</td>
	      <td><span class="button"><input type="submit" value="승인" onclick="fncConfmVcatnManage(); return false;"></span></td>
          <td>&nbsp;&nbsp;</td>
          <td><span class="button"><a href="#LINK" onclick="fncReturnVcatnManage(); return false;">반려</a></span></td>     
	    </c:if>
          <td>&nbsp;&nbsp;</td>
          <td><span class="button"><a href="<c:url value='/uss/ion/vct/EgovVcatnConfmList.do'/>?searchCondition=1" onclick="fncEgovVcatnConfmList(); return false;"><spring:message code="button.list" /></a></span></td>     
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
<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register"  summary="신청자 정보" >
	<caption>신청자 정보</caption>
  <tr>
    <th width="20%" height="23" class="required_text">신청자<img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>          
    <td width="30%"><c:out value='${vcatnManageVO.applcntNm}'/></td>
    <th width="20%" height="23" class="required_text">소속<img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>          
    <td width="30%"><c:out value='${vcatnManageVO.orgnztNm}'/></td>
  </tr> 
</table>

<table width="700" cellspacing="0" cellpadding="0" border="0"  summary="신청자 연차 정보" >
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


<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register"  summary="휴가승인/반려" >
<caption>휴가승인/반려</caption>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row">휴가구분<img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td colspan="3"><c:out value='${vcatnManageVO.vcatnSeNm}'/></td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row">시작일자<img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="30%"><c:out value='${vcatnManageVO.bgnde}'/></td>
    <c:if test="${vcatnManageVO.vcatnSe ne '02' }">
    <th width="20%" height="23" class="required_text" scope="row">종료일자<img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="30%"  ><c:out value='${vcatnManageVO.endde}'/></td>
    </c:if>
    <c:if test="${vcatnManageVO.vcatnSe eq '02' }">
    <th width="20%" height="23" class="required_text" scope="row" >정오구분<img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="30%">
       <c:if test="${vcatnManageVO.noonSe eq '1' }">오전 </c:if>
       <c:if test="${vcatnManageVO.noonSe eq '2' }">오후 </c:if>
    </td>
    </c:if>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text" scope="row">휴가사유<img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td colspan="3">
       <textarea id="vcatnResnView" name="vcatnResnView" class="txaClass" rows="4" cols="70" title="휴가사유" readonly><c:out value='${vcatnManageVO.vcatnResn}' escapeXml="false"/></textarea>
    </td>
  </tr>
</table>

<!-- 결재권자 정보 Include -->
<jsp:include page="/uss/ion/ism/selectInfrmlSanctn.do" flush="true"/> 
<!-- //결재권자 정보 Include -->

</form:form>
<!-- ********** 여기까지 내용 *************** -->
</td>
</tr>
</table>   
</div>
</body>
</html>