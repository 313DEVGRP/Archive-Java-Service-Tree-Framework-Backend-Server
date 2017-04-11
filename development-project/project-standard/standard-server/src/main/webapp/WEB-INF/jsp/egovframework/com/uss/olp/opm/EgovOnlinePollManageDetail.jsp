<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%--
  Class Name : EgovOnlinePollManageDetail.jsp
  Description : 온라인POLL관리 상세보기
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2008.03.09    장동한          최초 생성

    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.09
--%>

<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%pageContext.setAttribute("crlf", "\r\n"); %>

<html lang="ko">
<head>

<title>온라인POLL관리</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />">

<script type="text/javaScript" language="javascript">
	/* ********************************************************
	 * 초기화
	 ******************************************************** */
	function fn_egov_init_OnlinePollManage(){
		document.getElementById('PollIemView').src="<c:url value='/uss/olp/opm/listOnlinePollItem.do' />?pollId=${onlinePollManage.pollId}";
	}
	/* ********************************************************
	 * 목록 으로 가기
	 ******************************************************** */
	function fn_egov_list_OnlinePollManage(){
		location.href = "<c:url value='/uss/olp/opm/listOnlinePollManage.do' />";
	}
	/* ********************************************************
	 * 수정처리화면
	 ******************************************************** */
	function fn_egov_modify_OnlinePollManage(){
		var vFrom = document.OnlinePollManageForm;
		vFrom.cmd.value = '';
		vFrom.action = "<c:url value='/uss/olp/opm/updtOnlinePollManage.do' />";;
		vFrom.submit();

	}
	/* ********************************************************
	 * 삭제처리
	 ******************************************************** */
	function fn_egov_delete_OnlinePollManage(){
		var vFrom = document.OnlinePollManageForm;
		if(confirm("삭제 하시겠습니까?")){
			vFrom.cmd.value = 'del';
			vFrom.action = "<c:url value='/uss/olp/opm/detailOnlinePollManage.do' />";
			vFrom.submit();
		}else{
			vFrom.cmd.value = '';
		}
	}
</script>

</head>

<body onLoad="fn_egov_init_OnlinePollManage();">
	<DIV id="content" style="width:712px">

	<noscript class="noScriptTitle">
		자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.
	</noscript>

	<!--  상단타이틀 -->
	<form name="OnlinePollManageForm" action="<c:url value=''/>" method="post">

	<!-- ----------------- 상단 타이틀  영역 -->
	<table width="100%" cellpadding="8" class="table-search" border="0">
		<tr>
			<td width="100%"class="title_left">
				<img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif'/>" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지">
				&nbsp;온라인POLL관리 상세보기
			</td>
	 	</tr>
	</table>

	<!--  줄간격조정  -->
	<table width="100%" cellspacing="0" cellpadding="0" border="0">
		<tr>
			<td height="3px"></td>
		</tr>
	</table>

	<!--  상세보기  폼 영역  -->
	<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register">
		<tr>
	    	<th width="20%" height="23" class="required_text" nowrap >
	    		POLL명
	    		<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif'/>" width="15" height="15" alt="필수입력표시">
	    	</th>
	    	<td width="80%">
	 			&nbsp;<c:out value="${onlinePollManage.pollNm}" />
	    	</td>
	  	</tr>
		<tr>
			<th width="20%" height="23" class="required_text" nowrap >
				POLL시작일자
				<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif'/>" width="15" height="15" alt="필수입력표시">
			</th>
		    <td width="80%">
				&nbsp;<c:out value="${fn:substring(onlinePollManage.pollBeginDe, 0, 10)}"/>
		    </td>
	  	</tr>
		<tr>
			<th width="20%" height="23" class="required_text" nowrap >
				POLL종료일자
				<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif'/>" width="15" height="15" alt="필수입력표시">
			</th>
	    	<td width="80%">
				&nbsp;<c:out value="${fn:substring(onlinePollManage.pollEndDe, 0, 10)}"/>
	    	</td>
		</tr>
		<tr>
			<th height="23" class="required_text" >
				POLL종류
				<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif'/>" width="15" height="15" alt="필수입력표시">
			</th>
	    	<td>
	 			<c:forEach items="${pollKindCodeList}" var="resultInfo" varStatus="pollKindStatus">
					<c:if test="${resultInfo.code eq onlinePollManage.pollKindCode}">
						&nbsp;<c:out value="${resultInfo.codeNm}" />
					</c:if>
				</c:forEach>
	    	</td>
	  	</tr>
		<tr>
			<th width="20%" height="23" class="required_text" nowrap >
				POLL페기유무
				<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif'/>" width="15" height="15" alt="필수입력표시">
			</th>
	    	<td width="80%">
				&nbsp;<c:out value="${onlinePollManage.pollDsuseYn}"/>
	    	</td>
		</tr>
		<tr>
			<th width="20%" height="23" class="required_text" nowrap >
				POLL자동페기유무
				<img src="<c:url value='/images/egovframework/com/cmm/icon/no_required.gif'/>" width="15" height="15" alt="필수입력표시">
			</th>
	    	<td width="80%">
	    		&nbsp;<c:out value="${onlinePollManage.pollAutoDsuseYn}"/>
	    	</td>
	  	</tr>
	</table>
	<input name="pollId" type="hidden" value="${onlinePollManage.pollId}">
	<input name="cmd" type="hidden" value="<c:out value=''/>"/>
	</form>

	<!--  줄간격조정  -->
	<table width="100%" cellspacing="0" cellpadding="0" border="0">
		<tr>
			<td height="3px"></td>
		</tr>
	</table>

	<center>

	<table border="0" cellspacing="0" cellpadding="0" align="center">
		<tr>

			<td>
				<form name="formUpdt" action="<c:url value='/uss/olp/opm/updtOnlinePollManage.do'/>" method="post">
					<span class="button">
						<input type="submit" value="<spring:message code="button.update" />" onclick="fn_egov_modify_OnlinePollManage(); return false;">
					</span>
					<input name="pollId" type="hidden" value="${onlinePollManage.pollId}">
				</form>
			</td>
			<td width="3"></td>
			<td>
				<form name="formDelete" action="<c:url value='/uss/olp/opm/detailOnlinePollManage.do'/>" method="post">
					<span class="button">
						<input type="submit" value="<spring:message code="button.delete" />" onclick="fn_egov_delete_OnlinePollManage(); return false;">
					</span>
					<input name="pollId" type="hidden" value="${onlinePollManage.pollId}">
					<input name="cmd" type="hidden" value="<c:out value='del'/>"/>
				</form>
			</td>
			<td width="3"></td>
			<td>
				<form name="formList" action="<c:url value='/uss/olp/opm/listOnlinePollManage.do'/>" method="post">
					<span class="button">
						<input type="submit" value="<spring:message code="button.list" />" onclick="fn_egov_search_OnlinePollManage(); return false;">
					</span>
				</form>
			</td>
		</tr>
	</table>

	<!--  줄간격조정  -->
	<table width="100%" cellspacing="0" cellpadding="0" border="0">
		<tr>
			<td height="3px"></td>
		</tr>
	</table>

	<!--  줄간격조정  -->
	<table width="100%" cellspacing="0" cellpadding="0" border="0">
		<tr>
			<td height="3px"></td>
		</tr>
	</table>

	<!-- 온라인POLL항목 iframe  -->
	<iframe id="PollIemView" src="" title="온라인POLL항목"  width="100%" frameborder="0" scrolling="no" marginwidth="0" marginheight="0">
	</iframe>

	</center>

</DIV>
</body>
</html>
