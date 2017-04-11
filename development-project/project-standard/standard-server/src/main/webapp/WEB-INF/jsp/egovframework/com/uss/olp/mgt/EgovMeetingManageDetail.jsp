<%--
  Class Name : EgovMeetingManageDetail.jsp
  Description : 회의정보 상세조회 페이지
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2008.03.09    장동한          최초 생성

    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.09

--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>회의정보 상세조회</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />">
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_MeetingManage(){


}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_MeetingManage(){
	location.href = "<c:url value='/uss/olp/mgt/EgovMeetingManageList.do' />";
}
/* ********************************************************
 * 수정화면으로  바로가기
 ******************************************************** */
function fn_egov_modify_MeetingManage(){
	var varFrom = document.getElementById("MeetingManageForm");

	varFrom.action = "<c:url value='/uss/olp/mgt/EgovMeetingManageModify.do' />";;
	varFrom.submit();
}
/* ********************************************************
 * 삭제 처리
 ******************************************************** */
 function fn_egov_delete_MeetingManage(){
		var vFrom = document.MeetingManageForm;
		if(confirm("삭제 하시겠습니까?")){
			vFrom.cmd.value = 'del';
			vFrom.action = "<c:url value='/uss/olp/mgt/EgovMeetingManageDetail.do' />";
			vFrom.submit();
		}else{
			vFrom.cmd.value = '';
		}
}
</script>
</head>
<body onLoad="fn_egov_init_MeetingManage();">
<DIV id="content" style="width:712px">
<!-- 자바스크립트 경고 태그  -->
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<!-- 상단타이틀 -->
<form name="MeetingManageForm"  id="MeetingManageForm" action="<c:url value='/uss/olp/mgt/EgovMeetingManageDetail.do' />" method="post">
<!-- 상단 타이틀  영역 -->
<div class="title_left" style="width:100%;margin:0 0 0 0;">
	<h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align:middle; display:inline-block;" alt=" ">&nbsp;회의정보 상세조회</h1>
</div>

<!-- 줄간격조정  -->
<div style="width:100%;border:solid 0px #000000;height:3px"></div>

<!-- 록  폼 영역  -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="상세조회 목록을 제공한다.">
<caption>상세조회 목록을 제공한다</caption>
  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap >회의제목<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" title="필수항목" alt="필수항목"></th>
    <td width="80%">
     	  ${resultList[0].mtgNm}
    </td>
  </tr>

  <tr>
    <th scope="row" height="23" class="required_text" >회의 안건 내용<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" title="필수항목" alt="필수항목"></th>
    <td>
     ${resultList[0].mtgMtrCn}
    </td>
  </tr>

  <tr>
    <th scope="row" height="23" class="required_text" >회의순서<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" title="필수항목" alt="필수항목"></th>
    <td>
     ${resultList[0].mtgSn}
    </td>
  </tr>

  <tr>
    <th scope="row" height="23" class="required_text" >회의회차<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" title="필수항목" alt="필수항목"></th>
    <td>
     ${resultList[0].mtgCo}
    </td>
  </tr>

  <tr>
    <th scope="row" height="23" class="required_text" >회의일자<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" title="필수항목" alt="필수항목"></th>
    <td>
     ${resultList[0].mtgDe}
    </td>
  </tr>
  <tr>
    <th scope="row" height="23" class="required_text" >회의장소<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" title="필수항목" alt="필수항목"></th>
    <td>
     ${resultList[0].mtgPlace}
    </td>
  </tr>
  <tr>
    <th scope="row" height="23" class="required_text" >회의시작시간<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" title="필수항목" alt="필수항목"></th>
    <td>
		<c:forTokens var="one"
		            items="${resultList[0].mtgBeginTime}"
		            delims=":" varStatus="sts">
  				<c:if test="${sts.count == 1}">${one}시</c:if>
		        <c:if test="${sts.count == 2}">${one}분</c:if>
		</c:forTokens>
    </td>
  </tr>
  <tr>
    <th scope="row" height="23" class="required_text" >회의종료시간<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" title="필수항목" alt="필수항목"></th>
    <td>
		<c:forTokens var="one"
		            items="${resultList[0].mtgEndTime}"
		            delims=":" varStatus="sts">
  				<c:if test="${sts.count == 1}">${one}시</c:if>
		        <c:if test="${sts.count == 2}">${one}분</c:if>
		</c:forTokens>
    </td>
  </tr>
  <tr>
    <th scope="row" height="23" class="required_text" >비공개 회의여부<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" title="필수항목" alt="필수항목"></th>
    <td>
    <c:if test="${resultList[0].clsdrMtgAt eq '1'}">예</c:if>
	<c:if test="${resultList[0].clsdrMtgAt eq ''}">아니오</c:if>
    </td>
  </tr>

  <tr>
    <th scope="row" height="23" class="required_text" >열람 개시일<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" title="필수항목" alt="필수항목"></th>
    <td>
     ${resultList[0].readngBeginDe}
    </td>
  </tr>
  <tr>
    <th scope="row" height="23" class="required_text" >열람 여부<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" title="필수항목" alt="필수항목"></th>
    <td>
    ${resultList[0].readngAt}
    </td>
  </tr>

  <tr>
    <th scope="row" height="23" class="required_text" >
    <DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;">회의결과 내용</DIV></th>
    <td>
    ${resultList[0].mtgResultCn}
    </td>
  </tr>

  <tr>
    <th scope="row" height="23" class="required_text">
    <DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;">회의결과 여부</DIV></th>
    <td>
    <c:if test="${resultList[0].mtgResultEnnc eq '1'}">예</c:if>
	<c:if test="${resultList[0].mtgResultEnnc eq ''}">아니오</c:if>
    </td>
  </tr>

  <tr>
    <th scope="row" height="23" class="required_text" >
    <DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;">기타 사항</DIV></th>
    <td>
    ${resultList[0].etcMatter}
    </td>
  </tr>

  <tr>
    <th scope="row" height="23" class="required_text">
      <DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;">주관부서</DIV></th>
    <td>
    ${resultList[0].mngtDeptNm}
    </td>
  </tr>
  <tr>
    <th scope="row" height="23" class="required_text">
  <DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;">주관자ID</DIV></th>
    <td>
    ${resultList[0].mnaerIds}
    </td>
  </tr>
  <tr>
    <th scope="row" height="23" class="required_text">
    <DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;">주관자명</DIV></th>
    <td>
    ${resultList[0].mnaerNm}
    </td>
  </tr>
  <tr>
    <th scope="row" height="23" class="required_text">
    <DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;">주관자부서</DIV></th>
    <td>
     ${resultList[0].mnaerDeptNm}
    </td>
  </tr>

  <tr>
    <th scope="row" height="23" class="required_text" >
    <DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;">회의여부</DIV></th>
    <td>
    ${resultList[0].mtnAt}
    </td>
  </tr>

  <tr>
    <th scope="row" height="23" class="required_text" >
    <DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;">불참석자수</DIV></th>
    <td>
    ${resultList[0].nonatdrnCo}
    </td>
  </tr>
  <tr>
    <th scope="row" height="23" class="required_text" >
      <DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;">참석자수</DIV></th>
    <td>
    ${resultList[0].atdrnCo}
    </td>
  </tr>
<!--
  <tr>
    <th height="23" class="required_text" nowrap>파일첨부</th>
    <td>
      <input type="file" name="upFile">
    </td>
-->
</table>
<!-- 줄간격조정  -->
<div style="width:100%;border:solid 0px #000000;height:3px"></div>

<input name="mtgId" type="hidden" value="${resultList[0].mtgId}">
<input name="cmd" type="hidden" value="">
<div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div>
</form>
<center>
<!-- 목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center" summary="수정/삭제/목록 버튼을 제공한다.">
<caption>수정/삭제/목록 버튼을 제공한다</caption>
<tr>
	<td>
		<form name="formUpdt" action="<c:url value='/uss/olp/mgt/EgovMeetingManageModify.do'/>" method="post">
		<span class="button"><input type="submit" value="<spring:message code="button.update" />" onclick="fn_egov_modify_MeetingManage(); return false;"></span>
		<input name="mtgId" type="hidden" value="${resultList[0].mtgId}">
		</form>
	</td>
	<td width="3"></td>
	<td>
		<form name="formDelete" action="<c:url value='/uss/olp/mgt/EgovMeetingManageDetail.do'/>" method="post">
		<span class="button"><input type="submit" value="<spring:message code="button.delete" />" onclick="fn_egov_delete_MeetingManage(); return false;"></span>
		<input name="mtgId" type="hidden" value="${resultList[0].mtgId}">
		<input name="cmd" type="hidden" value="del">
		</form>
	</td>
	<td width="3"></td>
	<td>
		<form name="formList" action="<c:url value='/uss/olp/mgt/EgovMeetingManageList.do'/>" method="post">
		<span class="button"><input type="submit" value="<spring:message code="button.list" />" onclick="fn_egov_list_MeetingManage(); return false;"></span>
		</form>
	</td>
	<th scope="col">&nbsp;</th>
</tr>
</table>

</center>

</DIV>

</body>
</html>
