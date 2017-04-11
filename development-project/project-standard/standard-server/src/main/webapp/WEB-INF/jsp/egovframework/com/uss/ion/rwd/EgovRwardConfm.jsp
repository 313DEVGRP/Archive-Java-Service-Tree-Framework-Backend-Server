<%
/**
 * @Class Name  : EgovRwardConfm.java
 * @Description : EgovRwardConfm.jsp
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
<title>포상승인</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />" ></script>
<validator:javascript formName="rwardManage" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">

	/* ********************************************************
	 * 포상승인목록 으로 가기
	 ******************************************************** */
	function fncEgovRwardConfmList(){
		location.href = "/uss/ion/rwd/EgovRwardConfmList.do";
	}

	<c:if test="${rwardManageVO.confmAt eq 'A' }">
		/* ********************************************************
		 * 승인 처리  팝업창열기
		 * fncCtsnnReturn
		 * param 반려구분
		 ******************************************************** */
		 function fncConfmRwardManage(){
			var varForm	= document.all["rwardManage"];
		
			var arrParam = new Array(4);
			arrParam[0] = window;
			arrParam[1] = "포상신청 - 승인";
			arrParam[2] = "returnResn";
			arrParam[3] = "confmAt";
			
			window.showModalDialog("/uss/ion/ism/EgovConfmPopup.do", arrParam,"dialogWidth=780px;dialogHeight=170px;resizable=yes;center=yes");
		 }
	
	
		/* ********************************************************
		 * 포상승인처리화면
		 ******************************************************** */
		function fncConfm() {
		    var varFrom = document.getElementById("rwardManage");
		    varFrom.confmAt.value = "C";
		    varFrom.action = "<c:url value='/uss/ion/rwd/updtRwardConfm.do'/>";
	        if(!validateRwardManage(varFrom)){           
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
		 function fncReturnRwardManage(){
			var varForm	= document.all["rwardManage"];
		
			var arrParam = new Array(4);
			arrParam[0] = window;
			arrParam[1] = "포상신청 - 반려";
			arrParam[2] = "returnResn";
			arrParam[3] = "confmAt";
			
			window.showModalDialog("/uss/ion/ism/EgovReturnPopup.do", arrParam,"dialogWidth=780px;dialogHeight=170px;resizable=yes;center=yes");
		 }
	
	   /* ********************************************************
		* 포상반려처리화면
		******************************************************** */
		function fncReturn() {
		    var varFrom = document.getElementById("rwardManage");
		    varFrom.confmAt.value = "R";
		    varFrom.action = "<c:url value='/uss/ion/rwd/updtRwardConfm.do'/>";
	        if(!validateRwardManage(varFrom)){           
	            return;
	        }else{
	             varFrom.submit();
	        } 
		}
	</c:if>	
</script>
</head>

<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<div id="border" style="width:730px">
<table border="0">
  <tr>
    <td width="700">
<!-- ********** 여기서 부터 본문 내용 *************** -->
<form:form commandName="rwardManage" name="rwardManage" method="post" action="#LINK">
<div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div>
<form:hidden  path="rwardId"/>
<form:hidden  path="rwardManId"/>
<form:hidden  path="rwardCd"/>
<form:hidden  path="rwardDe"/>
<form:hidden  path="infrmlSanctnId"/>
<form:hidden  path="confmAt"/>
<form:hidden  path="returnResn"/>
<form:hidden  path="rwardNm"/>
<form:hidden  path="pblenCn"/>
<form:hidden  path="sanctnerId"/>
<input type="hidden" name="posblAtchFileNumber" value="3" />
</form:form>
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="30%"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;포상승인</h1></td>
  <td width="60%">&nbsp;</td>
  <th width="10%" align="right">
       <table border="0" cellspacing="0" cellpadding="0">
        <tr> 
        <c:if test="${rwardManageVO.confmAt eq 'A' }">
          <td>&nbsp;&nbsp;</td>
	      <td><span class="button"><input type="submit" value="승인" onclick="fncConfmRwardManage(); return false;"></span></td>
          <td>&nbsp;&nbsp;</td>
          <td><span class="button"><a href="#LINK" onclick="fncReturnRwardManage(); return false;">반려</a></span></td>     
	    </c:if>
          <td>&nbsp;&nbsp;</td>
          <td><span class="button"><a href="<c:url value='/uss/ion/rwd/EgovRwardConfmList.do'/>?searchCondition=1" onclick="fncEgovRwardConfmList(); return false;"><spring:message code="button.list" /></a></span></td>     
        </tr>
       </table>
  </th>  
 </tr>
</table>

<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%" class="title_left">
   <img src="/images/egovframework/com/cmm/icon/tit_icon.gif" width="9" height="9" hspace="3" style="vertical-align: middle" alt="">&nbsp;포상자</td>
 </tr>
</table>
<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register"  summary="포상자정보" >
     <caption>포상자정보</caption>
  <tr>
    <th width="20%" height="23" class="required_text"   scope="row">포상자<img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>          
    <td width="30%"><c:out value='${rwardManageVO.rwardManNm}'/></td>
    <th width="20%" height="23" class="required_text"   scope="row">소속<img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>          
    <td width="30%"><c:out value='${rwardManageVO.orgnztNm}'/></td>
  </tr> 
</table>

<table width="700" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td >&nbsp; </td>
</tr>
</table>

<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register"  summary="포상승인" >
     <caption>포상승인</caption>
  <tr>
    <th width="20%" height="23" class="required_text"   scope="row">포상구분<img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td colspan="3"  ><c:out value='${rwardManageVO.rwardCdNm}'/></td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text"   scope="row">포상명<img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="30%"  ><c:out value='${rwardManageVO.rwardNm}'/></td>
    <th width="20%" height="23" class="required_text"   scope="row">포상일<img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="30%"  ><c:out value='${rwardManageVO.rwardDe}'/></td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text"   scope="row">공적사항<img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>          
    <td colspan="3"  >
       <textarea id="remark" name="pblenCn" class="txaClass" rows="4" cols="70" title="공적사항" readOnly><c:out value='${rwardManageVO.pblenCn}'/></textarea>
    </td>
  </tr>

<!-- 첨부파일 테이블 레이아웃 설정 Start..-->
  <c:if test="${result.atchFileId != ''}">
	<tr> 
		<th height="23" class="required_text"  scope="row">첨부파일목록<img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>
		    <td colspan="3">
				<c:import charEncoding="utf-8" url="/cmm/fms/selectFileInfs.do" >
					<c:param name="param_atchFileId" value="${rwardManageVO.atchFileId}" />
				</c:import>								
		    </td>
	</tr>
  </c:if>	
<!-- 첨부파일 테이블 레이아웃 End.-->

</table>

<!-- 결재권자 정보 Include -->
<jsp:include page="/uss/ion/ism/selectInfrmlSanctn.do" flush="true"> 
<jsp:param name="infrmlSanctnId" value="${rwardManageVO.infrmlSanctnId}"/>
</jsp:include>
<!-- //결재권자 정보 Include  /cmm/fms/selectImageFileInfs.do-->


<!-- ********** 여기까지 내용 *************** -->
</td>
</tr>
</table>   
</div>
</body>
</html>