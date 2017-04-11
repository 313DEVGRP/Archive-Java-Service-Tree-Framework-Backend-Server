<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
<title>기념일 상세 조회</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<script type="text/javaScript" language="javascript" defer="defer">
<!--
/*설명 : 기념일 목록 조회 */
function fncSelectAnnvrsryManageList(pageNo){
    document.DetailForm.searchCondition.value = "1";
    document.DetailForm.action = "<c:url value='/uss/ion/ans/selectAnnvrsryManageList.do'/>";
    document.DetailForm.submit();
}

/*설명 : 기념일 수정조회 */
function fncSelectAnnvrsryManage() {
	document.DetailForm.cmd.value  = "update";
    document.DetailForm.action = "<c:url value='/uss/ion/ans/selectAnnvrsryManage.do'/>";
    document.DetailForm.submit();   
}
/*설명 : 기념일 삭제처리*/
function fncDeleteAnnvrsry() {
    var varFrom = document.getElementById("deleteForm");
    varFrom.action = "<c:url value='/uss/ion/ans/deleteAnnvrsryManage.do'/>";
    if(confirm("삭제 하시겠습니까?")){
        varFrom.submit();
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
	<form id="DetailForm" name="DetailForm" action="<c:url value='/uss/ion/ans/selectAnnvrsryManageList.do'/>" method="post">  
	<div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div>
	<input type="hidden" name="searchCondition" >
	<input type="hidden" name="cmd" >
	<input type="hidden" name="annId"      value="<c:out value="${annvrsryManageVO.annId      }"/>">
	</form>
	<table width="100%" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="30%"class="title_left">
	   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;기념일 상세</h1></td>
	  <td width="60%">&nbsp;</td>
	  <th width="10%" align="right">
	       <table border="0" cellspacing="0" cellpadding="0">
	        <tr> 
	          <td>
	          	<form id="selectForm" name="selectForm" action="<c:url value='/uss/ion/ans/selectAnnvrsryManage.do'/>" method="post">  
				<input type="hidden" name="cmd"        value="update">
				<input type="hidden" name="annId"      value="<c:out value="${annvrsryManageVO.annId      }"/>">
				<span class="button"><input type="submit" value="<spring:message code="button.update" />" onclick="fncSelectAnnvrsryManage(); return false;"></span>
				</form></td>
	          <td>&nbsp;&nbsp;</td>
	          <td>
	            <form id="deleteForm" name="deleteForm" method="post" action="<c:url value='/uss/ion/ans/deleteAnnvrsryManage.do'/>">
				<input type="hidden" name="annId"   value="<c:out value="${annvrsryManageVO.annId      }"/>">
	            <span class="button"><input type="submit" value="<spring:message code="button.delete" />" onclick="fncDeleteAnnvrsry(); return false;"></span>
	            </form></td>     
	          <td>&nbsp;&nbsp;</td>
	          <td><span class="button"><a href="<c:url value='/uss/ion/ans/selectAnnvrsryManageList.do'/>?searchCondition=1" onclick="fncSelectAnnvrsryManageList(); return false;"><spring:message code="button.list" /></a></span></td> 
	        </tr>
	       </table>
	  </th>  
	 </tr>
	</table>
	<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="기념일관리 상세" >
	<caption>기념일관리 상세</caption>
	  <tr> 
	    <th height="23" class="required_text" scope="row">신청자<img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시" width="15" height="15"></th>
	    <td><c:out value="${annvrsryManageVO.annvrsryTemp1      }"/></td>
	    <th height="23" class="required_text" scope="row">소속<img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시" width="15" height="15"></th>
	    <td><c:out value="${annvrsryManageVO.annvrsryTemp2      }"/></td>
	  </tr> 
	  <tr> 
	    <th height="23" class="required_text" scope="row">기념일구분<img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시" width="15" height="15"></th>
	    <td><c:out value="${annvrsryManageVO.annvrsryTemp3      }"/></td>
	    <th height="23" class="required_text" scope="row">기념일<img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시" width="15" height="15"></th>
	    <td><c:out value="${annvrsryManageVO.annvrsryTemp4      }"/>&nbsp;&nbsp;
	    <c:if test="${'1' eq annvrsryManageVO.reptitSe}"><b>매년반복</b></c:if>
	    </td>
	  </tr>
	  <tr> 
	    <th height="23" class="required_text" scope="row">기념일제목<img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시" width="15" height="15"></th>
	    <td colspan="3"><c:out value="${annvrsryManageVO.annvrsryNm      }"/> </td>
	  </tr>
	  <tr> 
	    <th height="23" class="required_text" scope="row">메모<img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>
	    <td colspan="3">
	       	<TEXTAREA id="textArae" style="width:95%;height:100px;" title="메모" readOnly><c:out value="${annvrsryManageVO.memo      }"  escapeXml="false"/></TEXTAREA>
	    </td> 
	  </tr>
	  <tr> 
	    <th width="20%" height="23" class="required_text" scope="row">알림시작일<img src="/images/egovframework/com/cmm/icon/no_required.gif" alt="필수입력표시" width="15" height="15"></th>
	    <td width="20%">D-<c:out value="${annvrsryManageVO.annvrsryBeginDe      }"/>일전 알림</td>
	    <th width="20%" height="23" class="required_text" scope="row">알림설정<img src="/images/egovframework/com/cmm/icon/no_required.gif" alt="필수입력표시" width="15" height="15"></th>
	    <td width="40%"><c:out value="${annvrsryManageVO.annvrsryTemp5      }"/> </td>
	  </tr>
	</table>

<!-- ********** 여기까지 내용 *************** -->
		</td>
	</tr>
</table>            
</DIV>
</body>
</html>