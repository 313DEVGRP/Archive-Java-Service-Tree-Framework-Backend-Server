<%
/**
 * @Class Name : EgovReturnPopup.java
 * @Description : EgovReturnPopup jsp
 * @Modification Information
 * @
 * @  수정일                    수정자                수정내용
 * @ ---------     --------    ---------------------------
 * @ 2010.08.02    이      용                최초 생성
 *
 *  @author 이      용
 *  @since 2010.08.02
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
<html lang="ko">
<head>
<title>반려</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/showModalDialogCallee.js'/>" ></script>
<script type="text/javaScript" language="javascript">
	/* ********************************************************
	* 반려 처리화면
	******************************************************** */
	function fncPopUpReturn() {
		var varFrom = document.all["targetForm"];
		getDialogArguments();
	    var opener = parent.window.dialogArguments;
		if(opener[2] != '' && opener[0].document.getElementById(opener[2]) != null){
			opener[0].document.getElementById(opener[2]).value = varFrom.returnResn.value;
		}
		if(opener[3] != '' && opener[0].document.getElementById(opener[3]) != null){
			opener[0].document.getElementById(opener[3]).value = "R";
		}
	    if(confirm("반려처리  하시겠습니까?")){
	        opener[0].fncReturn();
	    	parent.window.close();
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
<form id="targetForm" name="targetForm" method="post" action="#LINK">
<input type="hidden" name="cmd">
<input type="hidden" name="checkedEventRceptForConfm">

   <table width="700" cellpadding="0" class="table-search" border="0">
	 <tr>
	  <td width="40%" height="17" class="title_left">
	   <h1><img src="/images/egovframework/com/cmm/icon/tit_icon.gif" width="16" height="16" hspace="3" style="vertical-align: middle" alt="">&nbsp;반려</h1>
	  </td>
	  <td width="50%" height="17">&nbsp;</td>
	  <th width="10%" height="17">
       <table border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td>&nbsp;&nbsp;</td>
          <td><span class="button"><input type="submit" value="반려" onclick="fncPopUpReturn(); return false;"></span></td>     
          <td><span class="button"><a href="#LINK" onclick="parent.window.close(); return false;">닫기</a></span></td>     
        </tr>
       </table>
	  </th>  
	 </tr>
	</table>


<!-- ------------------------------------------------------------------ 등록  폼 영역  -->
<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register">
  <tr>
    <th scope="row" width="20%" height="23" class="required_text"><label for="returnResn">반려사유</label><img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="80%">
      <textarea id="returnResn" name="returnResn" class="txaClass" rows="4" cols="70" title="반려사유"><c:out value='${rwardManageVO.returnResn}'/></textarea>
    </td>    
  </tr> 
</table>
</form>
<!-- ********** 여기까지 내용 *************** -->
</td>
</tr>
</table>   
</div>
</body>
</html>