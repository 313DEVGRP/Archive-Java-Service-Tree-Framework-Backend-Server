<%--
  Class Name : EgovNoteEmpList.jsp
  Description : 수신자 /참조자 선택
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2010.07.20    장동한          최초 생성

    author   : 공통서비스 개발팀 장동한
    since    : 2010.07.20

--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>쪽지 관리(보내기)-수신자/참조자 선택</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/uss/ion/ntm/listEgovNoteEmpListPopup.do'/>";
   	document.listForm.submit();
}
/* ********************************************************
 * 등록 처리 함수
 ******************************************************** */
function fn_egov_regist_NoteEmp(){
	location.href = "<c:url value='/uss/olp/mgt/EgovNoteEmpRegist.do'/>";
}
/* ********************************************************
 * 수정 처리 함수
 ******************************************************** */
function fn_egov_modify_NoteEmp(){
	location.href = "<c:url value='/uss/olp/mgt/EgovNoteEmpModify.do'/>";
}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_detail_NoteEmp(mtgId){
	var vFrom = document.listForm;
	vFrom.mtgId.value = mtgId;
	vFrom.action = "<c:url value='/uss/olp/mgt/EgovNoteEmpDetail.do'/>";
	vFrom.submit();
}
/* ********************************************************
 * 삭제 처리 함수
 ******************************************************** */
function fn_egov_delete_NoteEmp(mtgId){
	var vFrom = document.listForm;
	if(confirm("삭제 하시겠습니까?")){
		vFrom.mtgId.value = mtgId;
		vFrom.cmd.value = 'del';
		vFrom.action = "<c:url value='/uss/olp/mgt/EgovNoteEmpList.do'/>";
		vFrom.submit();
	}else{
		vFrom.cmd.value = '';
	}
}
/* ********************************************************
 * 검색 함수
 ******************************************************** */
function fn_egov_search_NoteEmp(){
	var vFrom = document.listForm;
	vFrom.pageIndex.value = "1";
	vFrom.action = "<c:url value='/uss/ion/ntm/listEgovNoteEmpListPopup.do'/>";
	vFrom.submit();

}
/* ********************************************************
 * 선택 처리 함수
 ******************************************************** */
function fn_egov_open_Popup(cnt, uniqId){

	if(opener != null){
		alert( opener.document.getElementById("noteCn").value );
	}

}
/* ********************************************************
* 화면 닫기 함수
******************************************************** */
function fn_egov_close_NoteEmp(){

	var FLength = document.getElementsByName("checkList").length;

	var strSplit;
	var arrSplit;
	var strRecptnSe;
	var strRecptnSeCode;
	//select 박스 수신자 객체
	var selRecptnEmp = opener.document.getElementById("recptnEmp");

	if( FLength == 1){
		if(document.getElementsByName("checkList")[0].checked == true){
			strSplit = document.getElementsByName("checkList")[0].value;
			arrSplit = strSplit.split("|");

			//수신 체크시
			if(opener.document.getElementsByName("recptnSe")[0].checked == true){
				strRecptnSe = "수신";
				strRecptnSeCode = "1";
			}else{
				strRecptnSe = "참조";
				strRecptnSeCode = "2";
			}
			//추가할 option 객체
			var option = document.createElement("option");
			option.appendChild(document.createTextNode(strRecptnSe+":"+arrSplit[1]+"("+arrSplit[2]+")"));
			option.setAttribute("value", arrSplit[0]);

			opener.fn_egov_recptnEmpOption_NoteManage(strRecptnSe+":"+arrSplit[1]+"("+arrSplit[2]+")",arrSplit[0],strRecptnSeCode);
		}
	}else{
		for(var i=0; i < FLength; i++)
		{
			if(document.getElementsByName("checkList")[i].checked == true){

				strSplit = document.getElementsByName("checkList")[i].value;
				arrSplit = strSplit.split("|");

				//수신 체크시
				if(opener.document.getElementsByName("recptnSe")[0].checked == true){
					strRecptnSe = "수신";
					strRecptnSeCode = "1";
				}else{
					strRecptnSe = "참조";
					strRecptnSeCode = "2";
				}
				//추가할 option 객체
				var option = document.createElement("option");
				option.appendChild(document.createTextNode(strRecptnSe+":"+arrSplit[1]+"("+arrSplit[2]+")"));
				option.setAttribute("value", arrSplit[0]);

				opener.fn_egov_recptnEmpOption_NoteManage(strRecptnSe+":"+arrSplit[1]+"("+arrSplit[2]+")",arrSplit[0],strRecptnSeCode);

			}
		}
	}

	window.close();

}
/* ********************************************************
* 이름/이이디 클릭시 단건 입력
******************************************************** */
function fn_egov_close_NoteEmpOne(i){

	var FLength = document.getElementsByName("checkList").length;

	var strSplit;
	var arrSplit;
	var strRecptnSe;
	var strRecptnSeCode;
	//select 박스 수신자 객체
	var selRecptnEmp = opener.document.getElementById("recptnEmp");

	if( FLength == 1){
		if(document.getElementsByName("checkList")[0] != null && document.getElementsByName("checkList")[0] != undefined){

			strSplit = document.getElementsByName("checkList")[0].value;
			arrSplit = strSplit.split("|");

			//수신 체크시
			if(opener.document.getElementsByName("recptnSe")[0].checked == true){
				strRecptnSe = "수신";
				strRecptnSeCode = "1";
			}else{
				strRecptnSe = "참조";
				strRecptnSeCode = "2";
			}
			//추가할 option 객체
			var option = document.createElement("option");
			option.appendChild(document.createTextNode(strRecptnSe+":"+arrSplit[1]+"("+arrSplit[2]+")"));
			option.setAttribute("value", arrSplit[0]);

			opener.fn_egov_recptnEmpOption_NoteManage(strRecptnSe+":"+arrSplit[1]+"("+arrSplit[2]+")",arrSplit[0],strRecptnSeCode);

		}
	}else{
			if(document.getElementsByName("checkList")[i] != null && document.getElementsByName("checkList")[i] != undefined){

				strSplit = document.getElementsByName("checkList")[i].value;
				arrSplit = strSplit.split("|");

				//수신 체크시
				if(opener.document.getElementsByName("recptnSe")[0].checked == true){
					strRecptnSe = "수신";
					strRecptnSeCode = "1";
				}else{
					strRecptnSe = "참조";
					strRecptnSeCode = "2";
				}
				//추가할 option 객체
				var option = document.createElement("option");
				option.appendChild(document.createTextNode(strRecptnSe+":"+arrSplit[1]+"("+arrSplit[2]+")"));
				option.setAttribute("value", arrSplit[0]);

				opener.fn_egov_recptnEmpOption_NoteManage(strRecptnSe+":"+arrSplit[1]+"("+arrSplit[2]+")",arrSplit[0],strRecptnSeCode);

			}
	}

	window.close();

}
/* ********************************************************
* 체크 박스 선택 함수
******************************************************** */
function fn_egov_checkAll_NoteEmp(){

	var FLength = document.getElementsByName("checkList").length;
	var checkAllValue = document.getElementById('checkAll').checked;

	//undefined
	if( FLength == 1){
		document.getElementsByName("checkList")[0].checked = checkAllValue;
	}else{
		for(var i=0; i < FLength; i++)
		{
			document.getElementsByName("checkList")[i].checked = checkAllValue;
		}
	}

}
</script>
</head>
<body>
<DIV id="header" style="width:712px; ">
<!-- noscript 테그 -->
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<form name="listForm" id="listForm" action="<c:url value='/uss/ion/ntm/listEgovNoteEmpListPopup.do'/>" method="post">
<table width="100%" cellpadding="1" class="table-search" border="0" summary="타이틀/검색폼을 제공한다.">
<caption>타이틀/검색폼을 제공한다</caption>
 <tr>
  <th scope="col" class="title_left"><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif'/>" width="16" height="16" hspace="3" style="vertical-align:middle; display:inline-block;" alt=" " title=" ">&nbsp;수신자/참조자 선택</th>
  <td width="110px">
   	<select name="searchCondition" title="검색조건" class="select" style="width:100%">
		   <option value=''>--선택하세요--</option>
		   <option value='EMPLYR_NM' <c:if test="${searchCondition == 'EMPLYR_NM'}">selected</c:if>>이름</option>
		   <option value='EMPLYR_ID' <c:if test="${searchCondition == 'EMPLYR_ID'}">selected</c:if>>아이디</option>
		   <option value='OFFM_TELNO' <c:if test="${searchCondition == 'OFFM_TELNO'}">selected</c:if>>전화번호</option>
	   </select>
	</td>
  <td width="180px">
    <input name="searchKeyword" title="검색어" type="text" size="10" value="${searchKeyword}" maxlength="35" style="width:100%" onkeyup="if(window.event.keyCode==13){fn_egov_search_NoteEmp(); return false;}">
  </td>
  <td width="3px"></td>
  <td scope="col" width="30px" align="center">
	<table border="0" cellspacing="0" cellpadding="0" align="center" summary="조회 버튼을 제공한다.">
	<caption>조회 버튼을 제공한다</caption>
	<tr>
	  <th scope="col" style="padding:0 0 0 0;"><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>"  width="8" height="20" alt="버튼이미지"></th>
	  <td class="btnBackground" style="padding:0 0 0 0;"><input type="submit" value="조회" onclick="fn_egov_search_NoteEmp(); return false;" class="btnNew" style="height:20px;width:26px;" ></td>
	  <td style="padding:0 0 0 0;"><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>"  width="8" height="20" alt="버튼이미지"></td>
	</tr>
	</table>
  </td>
 </tr>
</table>
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
</form>
<!--  줄간격조정  -->
<div style="width:100%;height:3px"></div>

</DIV>
<!--  목록  -->
<DIV id="content" style="width:712px;height:270px;overflow:auto; border:0px solid black;">
<form name="contentForm" id="contentForm" action="<c:url value='/uss/ion/ntm/listEgovNoteEmpListPopup.do'/>" method="post">
<table width="100%" cellpadding="0" class="table-line" border="0" summary="목록 을 제공한다.">
<caption>목록 을 제공한다</caption>
<thead>
<tr>
    <th scope="col" class="title" width="35px" nowrap>순번</th>
    <th scope="col" class="title" width="100px" nowrap>아이디</th>
    <th scope="col" class="title" width="100px" nowrap>이름</th>
    <th scope="col" class="title" width="100px" nowrap>전화번호</th>
    <th scope="col" class="title">주소</th>
    <th scope="col" class="title" width="30px"><center><input type="checkbox" name="checkAll" title="전체선택" id="checkAll" value="1" onClick="fn_egov_checkAll_NoteEmp();"></center></th>
</tr>
</thead>
<tbody>
<%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
<c:if test="${fn:length(resultList) == 0}">
<tr>
<td class="lt_text3" colspan="9">
	<spring:message code="common.nodata.msg" />
</td>
</tr>
</c:if>
<%-- 데이터를 화면에 출력해준다  --%>
<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
<tr>
		<td class="lt_text3">${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}</td>
		<td class="lt_text3L"><a href="#LINK" onClick="fn_egov_close_NoteEmpOne(${status.count-1});">${resultInfo.emplyrId}</a></td>
		<td class="lt_text3L"><a href="#LINK" onClick="fn_egov_close_NoteEmpOne(${status.count-1});">${resultInfo.emplyrNm}</a></td>
		<td class="lt_text3"><a href="#LINK" onClick="fn_egov_close_NoteEmpOne(${status.count-1});">${resultInfo.offmTelno}</a></td>
		<td class="lt_text3L"><a href="#LINK" onClick="fn_egov_close_NoteEmpOne(${status.count-1});">${resultInfo.homeAdres} ${resultInfo.detailAdres}</a></td>

    	<td class="lt_text3"><input type="checkbox" name="checkList" title="선택" value="${resultInfo.uniqId}|${resultInfo.emplyrId}|${resultInfo.emplyrNm}"></td>
    	<!--  <a href="#" onClick="JavaScript:fn_egov_open_Popup('${status.count}', '${resultInfo.uniqId}')">선택 </a> -->
</tr>
</c:forEach>
</tbody>
</table>
<div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div>
</form>
<%-- 줄간격  --%>
<div style="width:100%;border:solid 0px #000000;height:3px"></div>

<div align="center">
		<ui:pagination paginationInfo = "${paginationInfo}"
				type="image"
				jsFunction="linkPage"
				/>
</div>
</DIV>
<%-- 줄간격  --%>
<div style="width:100%;border:solid 0px #000000;height:20px"></div>

<%-- 닫기 버튼  --%>
<DIV id="bottom" style="width:712px">
<center>
	<table border="0" cellspacing="0" cellpadding="0" align="center" summary="닫기/선택  버튼을 제공한다.">
	<caption>닫기/선택  버튼을 제공한다</caption>
	<tr>
	     <th scope="col"><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>"  width="8" height="20" alt="버튼이미지"></th>
	     <td class="btnBackground"><a href="#LINK" onClick="window.close()">닫기</a></td>
	     <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
	     <td>&nbsp;</td>
	     <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>"  width="8" height="20" alt="버튼이미지"></td>
	     <td class="btnBackground"><a href="#LINK" onClick="fn_egov_close_NoteEmp()">선택</a></td>
	     <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
	     <td>&nbsp;</td>
	</tr>
	</table>
</center>
</DIV>
</body>
</html>