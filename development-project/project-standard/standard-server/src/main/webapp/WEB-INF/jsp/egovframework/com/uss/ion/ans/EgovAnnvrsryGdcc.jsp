<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%

/**
 * @Class Name : EgovAnnvrsryGdcc.java
 * @Description : EgovAnnvrsryGdcc jsp
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
    document.DetailForm.action = "<c:url value='/uss/ion/ans/selectAnnvrsryManageList.do'/>";
    document.DetailForm.submit();
}

-->
</script>
</head>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<div id="border" style="width:430px">
<table border="0">
  <tr>
    <td width="400">
<!-- ********** 여기서 부터 본문 내용 *************** -->

<form name="DetailForm" action="<c:url value='/uss/ion/ans/selectAnnvrsryManageList.do'/>" method="post">    
<input type="hidden" name="cmd" >
<input type="hidden" name="annId"       value="<c:out value="${annvrsryManageVO.annId      }"/>">
<input type="hidden" name="usid"       value="<c:out value="${annvrsryManageVO.usid      }"/>">
<input type="hidden" name="annvrsrySe" value="<c:out value="${annvrsryManageVO.annvrsrySe}"/>">
<input type="hidden" name="annvrsryNm" value="<c:out value="${annvrsryManageVO.annvrsryNm}"/>">
<input type="hidden" name="annvrsryDe" value="<c:out value="${annvrsryManageVO.annvrsryDe}"/>">
<input type="hidden" name="cldrSe"     value="<c:out value="${annvrsryManageVO.cldrSe    }"/>">
</form>

<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="80%"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;기념일 안내</h1></td>
  <td width="10%">&nbsp;</td>
  <th width="10%" align="right">
  </th>  
 </tr>
</table>

<table width="400" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="기념일 알림화면" >
<caption>기념일 알림화면</caption>
  <tr> 
    <th height="23" class="required_text" scope="row">사용자</th>
    <td>&nbsp;<c:out value="${annvrsryManageVO.annvrsryTemp1      }"/></td>
  </tr> 
  <tr>
    <th height="23" class="required_text" scope="row">소속</th>
    <td>&nbsp;<c:out value="${annvrsryManageVO.annvrsryTemp2      }"/></td>
  </tr> 
  <tr> 
    <th width="150" height="23" class="required_text" scope="row">기념일자</th>
    <td width="250" >&nbsp;<c:out value="${annvrsryManageVO.annvrsryTemp4      }"/></td>
  </tr> 
  <tr> 
    <th width="150" height="23" class="required_text" scope="row" >기념일 제목</th>
    <td width="250" >&nbsp;<c:out value="${annvrsryManageVO.annvrsryNm      }"/></td>
  </tr> 
  <tr>
    <th width="150" height="23" class="required_text" scope="row" >메모</th>
    <td width="250" >
			<TEXTAREA id="textArae" style="width:100%;height:100px;" readOnly><c:out value="${annvrsryManageVO.memo      }"/></TEXTAREA>
    </td>
  </tr>
  <tr> 
    <th width="150" height="23" class="required_text" scope="row" >D-day</th>
    <td width="250" >&nbsp;D-<c:out value="${annvrsryManageVO.annvrsryBeginDe      }"/></td>
  </tr>
</table>
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <th width="100%" align="center">
       <table border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td><span class="button"><a href="<c:url value='/uss/ion/ans/selectAnnvrsryManageList.do'/>?searchCondition=1" onclick="fncSelectAnnvrsryManageList(); return false;"><spring:message code="button.list" /></a></span></td> 
        </tr>
       </table>
  </th>  
 </tr>
</table>

<!-- ********** 여기까지 내용 *************** -->
</td>
</tr>
</table>            
</DIV>
</body>
</html>
