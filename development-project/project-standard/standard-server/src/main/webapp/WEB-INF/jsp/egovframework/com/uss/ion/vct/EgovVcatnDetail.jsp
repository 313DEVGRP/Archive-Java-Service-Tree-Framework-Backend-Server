<%
/**
 * @Class Name : EgovVcatnManageDetail.java
 * @Description : EgovVcatnManageDetail.jsp
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
<title>휴가상세조회</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style><script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />" ></script>
<validator:javascript formName="vcatnManage" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">
<!--
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fncEgovVcatnManageList(){
	location.href = "/uss/ion/vct/EgovVcatnManageList.do";
}
<c:if test="${vcatnManageVO.confmAt eq 'A' }">
	/* ********************************************************
	* 수정화면으로  바로가기
	******************************************************** */
	function fncEgovVcatnManage() {
			var varFrom = document.getElementById("vcatnManage");
			varFrom.action = "<c:url value='/uss/ion/vct/EgovVcatnManageDetail.do'/>";
			varFrom.submit();   
	}
	/* ********************************************************
	* 삭제처리화면
	******************************************************** */
	function fncDeleteVcatnManage() {
		    var varFrom = document.getElementById("vcatnManage");
		    varFrom.action = "<c:url value='/uss/ion/vct/deleteVcatnManage.do'/>";
		    if(confirm("삭제 하시겠습니까?")){
	            varFrom.submit();
		    }
	}
</c:if>
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

<form name="vcatnManage" id="vcatnManage" method="post" action="${pageContext.request.contextPath}/uss/ion/vct/EgovVcatnManageDetail.do">
<div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div>
<input type="hidden" name="applcntId" value="<c:out value='${vcatnManageVO.applcntId}'/>"/>
<input type="hidden" name="vcatnSe"   value="<c:out value='${vcatnManageVO.vcatnSe}'/>"/>
<input type="hidden" name="bgnde"     value="<c:out value='${vcatnManageVO.bgnde}'/>"/>
<input type="hidden" name="endde"     value="<c:out value='${vcatnManageVO.endde}'/>"/>
<input type="hidden" name="occrrncYear" value="<c:out value='${vcatnManageVO.occrrncYear}'/>"/>
<input type="hidden" name="cmd"       value="updt"/>
</form>
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="30%"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;휴가상세조회</h1></td>
  <td width="60%">&nbsp;</td>
  <th width="10%" align="right">
       <table border="0" cellspacing="0" cellpadding="0">
          <tr> 
	          <c:if test="${vcatnManageVO.confmAt eq 'A' }">
		          <td>&nbsp;&nbsp;</td>
		          <td>
		          	<form id="updtForm" name="updtForm" action="<c:url value='/uss/ion/vct/EgovVcatnManageDetail.do'/>" method="post">  
		          	<input type="hidden" name="cmd"       value="updt"/>
					<input type="hidden" name="applcntId" value="<c:out value='${vcatnManageVO.applcntId}'/>"/>
					<input type="hidden" name="vcatnSe"   value="<c:out value='${vcatnManageVO.vcatnSe}'/>"/>
					<input type="hidden" name="bgnde"     value="<c:out value='${vcatnManageVO.bgnde}'/>"/>
					<input type="hidden" name="endde"     value="<c:out value='${vcatnManageVO.endde}'/>"/>
					<input type="hidden" name="occrrncYear" value="<c:out value='${vcatnManageVO.occrrncYear}'/>"/>
					<span class="button"><input type="submit" value="<spring:message code="button.update" />" onclick="fncEgovVcatnManage(); return false;"></span>
					</form>
		          </td>
		          <td>&nbsp;&nbsp;</td>
		          <td>
		          	<form id="deleteForm" name="deleteForm" action="<c:url value='/uss/ion/vct/deleteVcatnManage.do'/>" method="post">  
					<input type="hidden" name="applcntId" value="<c:out value='${vcatnManageVO.applcntId}'/>"/>
					<input type="hidden" name="vcatnSe"   value="<c:out value='${vcatnManageVO.vcatnSe}'/>"/>
					<input type="hidden" name="bgnde"     value="<c:out value='${vcatnManageVO.bgnde}'/>"/>
					<input type="hidden" name="endde"     value="<c:out value='${vcatnManageVO.endde}'/>"/>
					<input type="hidden" name="occrrncYear" value="<c:out value='${vcatnManageVO.occrrncYear}'/>"/>
					<span class="button"><input type="submit" value="<spring:message code="button.delete" />" onclick="fncDeleteVcatnManage(); return false;"></span>
					</form>
				  </td>     
	          </c:if>
	          <td>&nbsp;&nbsp;</td>
	          <td><span class="button"><a href="<c:url value='/uss/ion/vct/EgovVcatnManageList.do'/>?searchCondition=1" onclick="fncEgovVcatnManageList(); return false;"><spring:message code="button.list" /></a></span></td>     
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
    <th width="20%" height="23" class="required_text"   scope="row">신청자<img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>          
    <td width="30%"  ><c:out value='${vcatnManageVO.applcntNm}'/></td>
    <th width="20%" height="23" class="required_text"   scope="row">소속<img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""> </th>          
    <td width="30%"  ><c:out value='${vcatnManageVO.orgnztNm}'/></td>
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


<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="휴가관리 상세" >
<caption>휴가관리 상세</caption>
  <tr>
    <th width="20%" height="23" class="required_text"   scope="row">휴가구분<img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td colspan="3"  ><c:out value='${vcatnManageVO.vcatnSeNm}'/></td>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text"   scope="row">시작일자<img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="30%"  ><c:out value='${vcatnManageVO.bgnde}'/></td>

    <c:if test="${vcatnManageVO.vcatnSe ne '02' }">
    <th width="20%" height="23" class="required_text"   scope="row">종료일자<img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="30%"  ><c:out value='${vcatnManageVO.endde}'/></td>
    </c:if>
    <c:if test="${vcatnManageVO.vcatnSe eq '02' }">
    <th width="20%" height="23" class="required_text"   scope="row">정오구분<img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="30%">
       <c:if test="${vcatnManageVO.noonSe eq '1' }">오전 </c:if>
       <c:if test="${vcatnManageVO.noonSe eq '2' }">오후 </c:if>
    </td>
    </c:if>
  </tr>
  <tr>
    <th width="20%" height="23" class="required_text"   scope="row">휴가사유<img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td colspan="3"  >
       <textarea id="remark" name="vcatnResn" class="txaClass" rows="4" cols="70" title="휴가사유" readonly><c:out value='${vcatnManageVO.vcatnResn}' escapeXml="false" /></textarea>
    </td>
  </tr>
</table>

<!-- 결재권자 정보 Include -->
<jsp:include page="/uss/ion/ism/selectInfrmlSanctn.do" flush="true"> 
<jsp:param name="infrmlSanctnId" value="${vcatnManageVO.infrmlSanctnId}"/>
</jsp:include>
<!-- //결재권자 정보 Include -->


<!-- ********** 여기까지 내용 *************** -->
</td>
</tr>
</table>   
</div>
</body>
</html>