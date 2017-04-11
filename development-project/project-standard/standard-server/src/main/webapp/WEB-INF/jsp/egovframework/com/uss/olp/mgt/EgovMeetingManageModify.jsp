<%--
  Class Name : EgovMeetingManageModify.jsp
  Description : 회의정보 수정 페이지
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2008.03.09    장동한          최초 생성
	2011.09.15     서준식             회의 시작, 종료 시간 Validation 추가
    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.09

--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="ImgUrl" value="${pageContext.request.contextPath}/images/egovframework/com/cmm/"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>회의정보 수정</title>
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />">
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/uss/olp/mgt/EgovUtilMeetingManage.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js'/>"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="meetingManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
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
 * 저장처리화면
 ******************************************************** */
function fn_egov_save_MeetingManage(){

	var mtgBeginHH = eval(document.getElementById("mtgBeginHH").value);
	var mtgBeginMM = eval(document.getElementById("mtgBeginMM").value);
	var mtgEndHH = eval(document.getElementById("mtgEndHH").value);
	var mtgEndMM = eval(document.getElementById("mtgEndMM").value);

	if(mtgBeginHH > mtgEndHH){
		alert("회의 시작시간이 종료 시간보다 늦습니다.");
		return;
	}else if(mtgBeginHH == mtgEndHH){
		if(mtgBeginMM > mtgEndMM){
			alert("회의 시작시간이 종료 시간보다 늦습니다.");
			return;
		}
	}


	var varFrom = document.getElementById("meetingManageVO");
	if(confirm("저장 하시겠습니까?")){
		varFrom.action =  "<c:url value='/uss/olp/mgt/EgovMeetingManageModify.do' />";

		if(!validateMeetingManageVO(varFrom)){
			return;
		}else{

			if(varFrom.nonatdrnCo.value == ""){varFrom.nonatdrnCo.value = "0"};
			if(varFrom.atdrnCo.value == ""){varFrom.atdrnCo.value = "0"};

			varFrom.mtgBeginTime.value = fn_egov_SelectBoxValue('mtgBeginHH') + ":" + fn_egov_SelectBoxValue('mtgBeginMM');
			varFrom.mtgEndTime.value = fn_egov_SelectBoxValue('mtgEndHH') + ":" + fn_egov_SelectBoxValue('mtgEndMM');
			varFrom.submit();
		}
	}
}
/* ********************************************************
 * 주관자 부서 팝업창열기
 ******************************************************** */
function fn_egov_mnaerDept_MeetingManage(){

	var arrParam = new Array(1);
	arrParam[0] = self;
	arrParam[1] = "typeMeeting1";

 	window.showModalDialog("<c:url value='/uss/olp/mgt/EgovMeetingManageLisAuthorGroupPopup.do' />", arrParam ,"dialogWidth:800px;dialogHeight:500px;resizable:yes;cente:yes");
 }
/* ********************************************************
 * 주관 부서 팝업창열기
 ******************************************************** */
function fn_egov_mngtDeptNm_MeetingManage(){

	var arrParam = new Array(1);
	arrParam[0] : self;
	arrParam[1] = "typeMeeting2";

 	window.showModalDialog("<c:url value='/uss/olp/mgt/EgovMeetingManageLisAuthorGroupPopup.do' />", arrParam ,"dialogWidth:800px;dialogHeight:500px;resizable:yes;center:yes");
 }

/* ********************************************************
 * 아이디  팝업창열기
 ******************************************************** */
function fn_egov_mnaer_MeetingManage(){
	var arrParam = new Array(1);
	arrParam[0] = window;
	arrParam[1] = "typeMeeting";

  	window.showModalDialog("<c:url value='/uss/olp/mgt/EgovMeetingManageLisEmpLyrPopup.do' />", arrParam,"dialogWidth:800px;dialogHeight:500px;resizable:yes;center:yes");
}
</script>
</head>
<body onLoad="fn_egov_init_MeetingManage();">
<DIV id="content" style="width:712px">
<!-- 자바스크립트 경고 태그  -->
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<!-- 상단타이틀 -->
<form:form commandName="meetingManageVO"  action="" method="post">
<!-- 상단 타이틀  영역 -->
<div class="title_left" style="width:100%;margin:0 0 0 0;">
	<h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align:middle; display:inline-block;" alt=" ">&nbsp;회의정보 수정</h1>
</div>

<!-- 줄간격조정  -->
<div style="width:100%;border:solid 0px #000000;height:3px"></div>

<!-- - 등록  폼 영역  -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register">
  <tr>
    <th width="20%" height="23" class="required_text" nowrap><label for="mtgNm">회의제목</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" title="필수항목" alt="필수항목"></th>
    <td width="80%" nowrap>
     	   <input name="mtgNm" type="text" size="73" value="${resultList[0].mtgNm}" maxlength="100" style="width:99%;" title="회의제목 입력">
     	   <div><form:errors path="mtgNm" cssClass="error" /></div>
    </td>
  </tr>

  <tr>
    <th height="23" class="required_text"><label for="mtgMtrCn">회의 안건 내용</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" title="필수항목" alt="필수항목"></th>
    <td>
      <textarea name="mtgMtrCn" class="textarea"  cols="75" rows="4"  style="width:99%;" title="회의안간내용 입력">${resultList[0].mtgMtrCn}</textarea>
      <div><form:errors path="mtgMtrCn" cssClass="error" /></div>
    </td>
  </tr>

  <tr>
    <th height="23" class="required_text"><label for="mtgSn">회의순서</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" title="필수항목" alt="필수항목"></th>
    <td>
      <input name="mtgSn" type="text" size="73" value="${resultList[0].mtgSn}" maxlength="10" style="width:60px;" title="회의순서 입력">
      <div><form:errors path="mtgSn" cssClass="error" /></div>
    </td>
  </tr>

  <tr>
    <th height="23" class="required_text"><label for="mtgCo">회의회차</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" title="필수항목" alt="필수항목"></th>
    <td>
      <input name="mtgCo" type="text" size="73" value="${resultList[0].mtgCo}" maxlength="5" style="width:60px;" title="회의회차 입력">
      <div><form:errors path="mtgCo" cssClass="error" /></div>
    </td>
  </tr>

  <tr>
    <th height="23" class="required_text"><label for="mtgDe">회의일자</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" title="필수항목" alt="필수항목"></th>
    <td>
      <input name="mtgDe" id="mtgDe" type="text" size="73" value="${resultList[0].mtgDe}" maxlength="10" style="width:80px;" title="회의일자입력">
       <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar( document.getElementById('meetingManageVO'),  document.getElementById('mtgDe') );">
      <img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />"  align="middle" style="border:0px" alt="달력창팝업버튼이미지">
      </a>
      <div><form:errors path="mtgDe" cssClass="error" /></div>
    </td>
  </tr>
  <tr>
    <th height="23" class="required_text"><label for="mtgPlace">회의장소</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" title="필수항목" alt="필수항목"></th>
    <td>
      <input name="mtgPlace" type="text" size="73" value="${resultList[0].mtgPlace}" maxlength="70" style="width:200px;" title="회의장소 입력">
      <div><form:errors path="mtgPlace" cssClass="error" /></div>
    </td>
  </tr>
  <tr>
    <th height="23" class="required_text"><label for="mtgBeginHH">회의시작시간</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" title="필수항목" alt="필수항목"></th>
    <td>

		<c:forTokens var="one"
		            items="${resultList[0].mtgBeginTime}"
		            delims=":" varStatus="sts">
		         <c:if test="${sts.count == 1}">

		         <select name="mtgBeginHH" id="mtgBeginHH" title="시 선택">
			     <c:forEach var="h" begin="1" end="24" step="1">
			      	<option value="${h}" <c:if test="${h == one}">selected</c:if>>${h}시</option>
			      </c:forEach>
			     </select>

		         </c:if>
		         <c:if test="${sts.count == 2}">

				     <select name="mtgBeginMM" id="mtgBeginMM" title="분 선택">
				     <option value="0">0분</option>
				      <c:forEach var="m" begin="1" end="60" step="1">
				      	<option value="${m}" <c:if test="${m == one}">selected</c:if>>${m}분</option>
				      </c:forEach>
				    </select>

		         </c:if>

		</c:forTokens>
		<input name="mtgBeginTime" type="hidden" value="" id="mtgBeginTime">
		<div><form:errors path="mtgBeginHH" cssClass="error" /></div>
		<div><form:errors path="mtgBeginMM" cssClass="error" /></div>
    </td>
  </tr>
  <tr>
    <th height="23" class="required_text"><label for="mtgEndHH">회의종료시간</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" title="필수항목" alt="필수항목"></th>
    <td>
		<c:forTokens var="one"
		            items="${resultList[0].mtgEndTime}"
		            delims=":" varStatus="sts">
		         <c:if test="${sts.count == 1}">

		         <select name="mtgEndHH" id="mtgEndHH" title="시 선택">
			     <c:forEach var="h" begin="1" end="24" step="1">
			      	<option value="${h}" <c:if test="${h == one}">selected</c:if>>${h}시</option>
			      </c:forEach>
			     </select>

		         </c:if>
		         <c:if test="${sts.count == 2}">

				     <select name="mtgEndMM" id="mtgEndMM" title="분 선택">
				     <option value="0">0분</option>
				      <c:forEach var="m" begin="1" end="60" step="1">
				      	<option value="${m}" <c:if test="${m == one}">selected</c:if>>${m}분</option>
				      </c:forEach>
				    </select>

		         </c:if>

		</c:forTokens>

       <input name="mtgEndTime" type="hidden" value="" id="mtgEndTime">
       <div><form:errors path="mtgEndHH" cssClass="error" /></div>
       <div><form:errors path="mtgEndMM" cssClass="error" /></div>
    </td>
  </tr>
  <tr>
    <th height="23" class="required_text"><label for="clsdrMtgAt">비공개 회의여부</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" title="필수항목" alt="필수항목"></th>
    <td>
     <input name="clsdrMtgAt" type="checkbox" style="border:0px;" value="1" title="비공개회의여부 선택" <c:if test="${resultList[0].clsdrMtgAt == '1'}">checked</c:if>>
    </td>
  </tr>

  <tr>
    <th height="23" class="required_text"><label for="readngBeginDe">열람 개시일</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" title="필수항목" alt="필수항목"></th>
    <td>
      <input name="readngBeginDe" id="readngBeginDe" type="text" size="73" value="${resultList[0].readngBeginDe}" maxlength="10" title="열람개시일선택" style="width:80px;">
       <a href="#LINK" onClick="javascript:fn_egov_NormalCalendar(document.getElementById('meetingManageVO'),  document.getElementById('readngBeginDe'));">
      <img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />"  align="middle" style="border:0px" alt="달력창팝업버튼이미지">
      </a>
      <div><form:errors path="readngBeginDe" cssClass="error" /></div>
    </td>
  </tr>
  <tr>
    <th height="23" class="required_text"><label for="readngAt">열람 여부</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" title="필수항목" alt="필수항목"></th>
    <td>
       <select name="readngAt" title="열람여부 선택">
       	<option value="N" <c:if test="${resultList[0].readngAt == 'N'}">selected</c:if>>N</option>
       	<option value="Y" <c:if test="${resultList[0].readngAt == 'Y'}">selected</c:if>>Y</option>
      	</select>
    </td>
  </tr>

  <tr>
    <th height="23" class="required_text" >
  <DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;"><label for="mtgResultCn">회의결과 내용</label></DIV></th>
    <td>
      <textarea name="mtgResultCn" class="textarea"  cols="75" rows="4"  title="회의결과내용 입력" style="width:99%;">${resultList[0].mtgResultCn}</textarea>
    </td>
  </tr>

  <tr>
    <th height="23" class="required_text">
  <DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;"><label for="mtgResultEnnc">회의결과 여부</label></DIV></th>
    <td>
     <input name="mtgResultEnnc" type="checkbox" style="border:0px;" value="1" title="회의결과여부 선택" <c:if test="${resultList[0].mtgResultEnnc == '1'}">checked</c:if>>
    </td>
  </tr>

  <tr>
    <th height="23" class="required_text" >
  <DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;"><label for="etcMatter">기타 사항</label></DIV></th>
    <td>
      <textarea name="etcMatter" class="textarea"  cols="75" rows="2" title="기타사항 입력" style="width:99%;">${resultList[0].etcMatter}</textarea>
    </td>
  </tr>

  <tr>
    <th height="23" class="required_text">
  <DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;"><label for="mngtDeptNm">주관부서</label></DIV></th>
    <td>
      <input name="mngtDeptNm" id="mngtDeptNm" type="text" size="73" value="${resultList[0].mngtDeptNm}" maxlength="2000" title="주관부서 입력" style="width:100px;" readOnly>
      <a href="<c:url value='/uss/olp/mgt/EgovMeetingManageLisAuthorGroupPopup.do' />" target="_blank" title="주관부서 선택  팝업 새창으로" onclick="fn_egov_mngtDeptNm_MeetingManage();return false">
      <img src="<c:url value='/images/egovframework/com/cmm/icon/search2.gif' />" align="middle" style="border:0px" alt="주관부서 찾기버튼" title="주관부서 찾기버튼">
      </a>
      <input name="mngtDeptId" id="mngtDeptId" type="hidden" value="${resultList[0].mngtDeptId}" >
    </td>
  </tr>
  <tr>
    <th height="23" class="required_text">
  <DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;"><label for="mnaerNm">주관자명</label></DIV></th>
    <td>
      <input name="mnaerNm" id="mnaerNm" type="text" size="73" value="${resultList[0].mnaerIds}" title="주관자명 입력" maxlength="2000" style="width:100px;" readOnly>
      <a href="<c:url value='/uss/olp/mgt/EgovMeetingManageLisEmpLyrPopup.do' />" target="_blank" title="주관자ID 선택  팝업 새창으로" onclick="fn_egov_mnaer_MeetingManage();return false">
      <img src="<c:url value='/images/egovframework/com/cmm/icon/search2.gif' />" align="middle" style="border:0px" alt="주관자ID 찾기버튼" title="주관자ID 찾기 버튼">
      </a>
      <input name="mnaerId" id="mnaerId" type="hidden" value="${resultList[0].mnaerId}" >
    </td>
  </tr>

  <tr>
    <th height="23" class="required_text">
  <DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;"><label for="mnaerDeptNm">주관자부서</label></DIV></th>
    <td>
      <input name="mnaerDeptNm"  id="mnaerDeptNm" type="text" size="73" title="주관부서 입력" value="${resultList[0].mnaerDeptNm}" maxlength="2000" style="width:100px;" readOnly>
      <a href="<c:url value='/uss/olp/mgt/EgovMeetingManageLisAuthorGroupPopup.do' />" target="_blank" title="주관자부서 선택  팝업 새창으로" onclick="fn_egov_mnaerDept_MeetingManage();return false">
      <img src="<c:url value='/images/egovframework/com/cmm/icon/search2.gif' />" align="middle" style="border:0px" alt="주관자부서 찾기버튼" title="주관자부서 찾기 버튼">
      </a>
	  <input name="mnaerDeptId"  id="mnaerDeptId" type="hidden" value="${resultList[0].mnaerDeptId}" >
    </td>
  </tr>

  <tr>
    <th height="23" class="required_text" >
   <DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;"><label for="mtnAt">회의여부</label></DIV></th>
    <td>
       <select name="mtnAt" title="회의여부 선택">
       	<option value="Y"  <c:if test="${resultList[0].mtnAt == 'Y'}">selected</c:if>>Y</option>
       	<option value="N"  <c:if test="${resultList[0].mtnAt == 'N'}">selected</c:if>>N</option>
      	</select>
    </td>
  </tr>

  <tr>
    <th height="23" class="required_text" >
  <DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;"><label for="nonatdrnCo">불참석자수</label></DIV></th>
    <td>
      <input name="nonatdrnCo" id="nonatdrnCo" type="text" size="73" value="${resultList[0].nonatdrnCo}" title="불참석자수 입력" maxlength="10" style="width:60px;">
    </td>
  </tr>
  <tr>
    <th height="23" class="required_text" >
  <DIV style="padding:0px 0px 0px 0px;margin:0px 15px 0px 0px;border:solid 0px;"><label for="atdrnCo">참석자수</label></DIV></th>
    <td>
      <input name="atdrnCo" id="atdrnCo" type="text" size="73" value="${resultList[0].atdrnCo}" maxlength="10" title="참석자수 입력" style="width:60px;">
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

<center>
<!-- 목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center" summary="목록/저장 버튼을 제공한다.">
<caption>목록/저장 버튼을 제공한다</caption>
<tr>
	<td><img src="<c:out value="${ImgUrl}" />btn/bu2_left.gif" width="8" height="20" alt="버튼이미지"></td>
	<td class="btnBackground" nowrap><a href="<c:url value='/uss/olp/mgt/EgovMeetingManageList.do' />">목록</a></td>
	<td><img src="<c:out value="${ImgUrl}" />btn/bu2_right.gif" width="8" height="20" alt="버튼이미지"></td>
	<td>&nbsp;</td>
	<td>
		<span class="button"><input type="submit" value="저장" onclick="fn_egov_save_MeetingManage(); return false;"></span>
	</td>
</tr>
</table>
</center>
<input type="hidden" name="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>">
<input name="mtgId" type="hidden" value="<c:out value='${resultList[0].mtgId}'/>">
<input name="cmd" type="hidden" value="<c:out value='save'/>">
</form:form>
</DIV>

</body>
</html>
