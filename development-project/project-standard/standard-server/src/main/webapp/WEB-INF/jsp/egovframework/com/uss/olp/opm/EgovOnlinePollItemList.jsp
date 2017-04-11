<%--
  Class Name : EgovOnlinePollItemList.jsp
  Description : 온라인POLL항목 목록 페이지
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.08.05    장동한          최초 생성

    author   : 공통서비스 개발팀 장동한
    since    : 2009.08.05
--%>

<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:set var="ImgUrl" value="/images/egovframework/com/uss/olp/opm/"/>
<c:set var="CssUrl" value="/css/egovframework/com/uss/olp/opm/"/>
<c:set var="resultListCont" value="0"/>

<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
	<c:set var="resultListCont" value="${resultListCont+1}"/>
</c:forEach>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>EGOV-COM</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">

<script type="text/javaScript" language="javascript">
	//전역변수 설정
	var ifr= parent.document.all? parent.document.all.PollIemView : parent.document.getElementById("PollIemView") ;

	function do_resize() {
		resizeFrame(1);
	}

	//가로길이는 유동적인 경우가 드물기 때문에 주석처리!
	function resizeFrame(re) {
		if(ifr){
			var innerHeight = document.body.scrollHeight + (document.body.offsetHeight - document.body.clientHeight);
			//if(ifr.style.height != innerHeight) //주석제거시 다음 구문으로 교체 -> if (ifr.style.height != innerHeight || ifr.style.width != innerWidth)
			//{ifr.style.height = innerHeight;}
			ifr.setAttribute("height",innerHeight);
		}
	}
	window.onload = function(){
		do_resize();
	}

	/* ********************************************************
	 * 등록 처리 함수
	 ******************************************************** */
	function fn_egov_regist_OnlinePollItem(){
		var vFrom = document.registForm;


		if(vFrom.registFormCmd.value != 'updt'){
			vFrom.action = "<c:url value='/uss/olp/opm/registOnlinePollItem.do' />";
			vFrom.pollIemId.value = '';
		}

		if(confirm("<spring:message code="common.save.msg" />")){

			 if( vFrom.pollIemNm.value == ""){
					alert("온라인POLL 항목명을  입력해주세요!");
					vFrom.pollIemNm.focus();
					return;
			 }

			//중복된 항목명 체크
			if(!fn_egov_search_OnlinePollItemList(vFrom.pollIemNm.value)){
				alert("[" + vFrom.pollIemNm.value + "]항목명이 중복 되었습니다!");
				vFrom.pollIemNm.value = "";
				return;
			}

			 vFrom.submit();
		}
	}
	/* ********************************************************
	* 삭제 처리 함수
	******************************************************** */
	function fn_egov_del_OnlinePollItem(pollIemId){
		var vFrom = document.registForm;
		vFrom.action = "<c:url value='/uss/olp/opm/delOnlinePollItem.do' />";

		vFrom.pollIemId.value = pollIemId;

		if(confirm("삭제 하시겠습니까?")){
			 vFrom.submit();
		}
	}
	/* ********************************************************
	* 수정화면으로 전환 함수
	******************************************************** */
	function fn_egov_modify_display_OnlinePollItem(pollIemNm, pollIemId){
		var vFrom = document.registForm;
		vFrom.action = "<c:url value='/uss/olp/opm/updtOnlinePollItem.do' />";
		vFrom.pollIemNm.value = pollIemNm;
		vFrom.pollIemId.value = pollIemId;
		vFrom.registFormCmd.value = 'updt';

		document.getElementById('divPollIem').innerHTML = '수정';

	}
	/* ********************************************************
	 * 상세회면 처리 함수
	 ******************************************************** */
	function fn_egov_detail_OnlinePollItem(pollId){
		var vFrom = document.listForm;
		vFrom.pollId.value = pollId;
		vFrom.action = "<c:url value='/uss/olp/opm/detailOnlinePollManage.do' />";
		vFrom.submit();
	}

	/* ********************************************************
	 * 검색 함수
	 ******************************************************** */
	function fn_egov_search_OnlinePollManage(){
		var vFrom = document.listForm;

		vFrom.action = "<c:url value='/uss/olp/opm/listOnlinePollManage.do' />";
		vFrom.submit();
	}

	/* ********************************************************
	* 등록된 항목 유효성 검사
	******************************************************** */
	function fn_egov_search_OnlinePollItemList(sSearch){

		var arrPollItemList = new Array(<c:forEach items="${resultList}" var="resultInfo" varStatus="status">'${resultInfo.pollIemNm}'<c:if test="${status.count != resultListCont}">,</c:if></c:forEach>);
		for(var i=0;i<arrPollItemList.length;i++){

			if(arrPollItemList[i].trim() == sSearch){
				return false;
			}
		}
		return true;

	}

	/* ********************************************************
	* PROTOTYPE JS FUNCTION
	******************************************************** */
	String.prototype.trim = function(){
		return this.replace(/^\s+|\s+$/g, "");
	}

</script>
<style TYPE="text/css">
	body {
		scrollbar-face-color: #F6F6F6;
		scrollbar-highlight-color: #bbbbbb;
		scrollbar-3dlight-color: #FFFFFF;
		scrollbar-shadow-color: #bbbbbb;
		scrollbar-darkshadow-color: #FFFFFF;
		scrollbar-track-color: #FFFFFF;
		scrollbar-arrow-color: #bbbbbb;
		margin-left:"0px"; margin-right:"0px"; margin-top:"0px"; margin-bottom:"0px";
	}

	td {font-family: "돋움"; font-size: 9pt; color:#595959;}
	th {font-family: "돋움"; font-size: 9pt; color:#000000;}
	select {font-family: "돋움"; font-size: 9pt; color:#595959;}

	/*  흰색배경 inputbox  */
	 textarea, input, select {
	 	padding-left:2px color:#555555; \
	 	border:1px solid #9BBED2;
	 	font-family: "돋움";
	 	font-size: 9pt; color:#595959;
	 }

	.divDotText {
	overflow:hidden;
	text-overflow:ellipsis;
	}

	/* 타이틀_볼드_좌측정렬 */
	.title_left{
		font-family:"돋움";
		font-size:9pt; color:#000000 ;
	        font-weight: bold ;
	        vertical-align: middle;
	        text-align:left
	}

	/* 리스트 테이블 */
	.table-line{BORDER-TOP: #1A90D8 2px solid; BORDER-bottom: #BABABA 1px solid;border-collapse: collapse;}
	.table-line th{
		BORDER-bottom: #A3A3A3 1px solid;
		padding-left:2;padding-right:2;
		background-color: #E4EAF8; height:20px;
	}
	.table-line td{
		BORDER-bottom: #E0E0E0 1px solid;
		padding-left:2;padding-right:2;
		background-color: #F7F7F7;
		height:20px;
	}

	/* 타이틀_볼드 */
	.title{ font-family:"돋움"; font-size:9pt; color:#000000 ;
	        font-weight: bold ; vertical-align: middle
	}
	.lt_text3 { font-size:9pt; color:#000000; font-family:"돋움, Arial"; height:24px; text-align:center; vertical-align:middle;
	}

	img    { border:0; }
	table	{ margin:0; padding:0; }
	A:link { font-size:9pt; font-family:"돋움";color:#000000; text-decoration:none; }
	A:visited { font-size:9pt; font-family:"돋움";color:#000000; text-decoration:none; }
	A:active { font-size:9pt; font-family:"돋움";color:red; text-decoration:none; }
	A:hover { font-size:9pt; font-family:"돋움";color:red;text-decoration:none;}

	/* 버튼이미지 */
	.btnBackground {
		background-image:url(<c:url value="/images/egovframework/com/cmm/uss/umt/button/bu2_bg.gif"/>);
	}
</style>
</head>

<BODY>

<form name="listForm" action="<c:url value='' />" method="post">
	<div id="content" style="width:712px">
		<noscript class="noScriptTitle">
			자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.
		</noscript>

		<!--  줄간격조정  -->
		<table width="100%" cellspacing="0" cellpadding="0" border="0">
			<tr>
				<td height="3px"></td>
			</tr>
		</table>

		<!-- ----------------- 상단 타이틀  영역 -->
		<table width="100%" cellpadding="8" class="table-search" border="0">
			<tr>
				<td width="100%"class="title_left">
					<img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지">
					&nbsp;온라인POLL항목 정보
				</td>
			</tr>
		</table>

		<table width="100%" cellpadding="0" class="table-line" border="0" id="pollIemTable" >
			<thead>
				<tr>
					<th class="title" nowrap>항목명</th>
					<th class="title" width="30px" nowrap></th>
					<th class="title" width="30px" nowrap></th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
					<tr>
		    			<td class="lt_text3L">
		 					<c:out value="${resultInfo.pollIemNm}"/>
		   				</td>
		   				<td class="lt_text3">
		   					<a href="#" onClick="JavaScript:fn_egov_modify_display_OnlinePollItem('${resultInfo.pollIemNm}','${resultInfo.pollIemId}')">
		   						수정
		   					</a>
		   				</td>
		   				<td class="lt_text3">
		   					<a href="#" onClick="JavaScript:fn_egov_del_OnlinePollItem('${resultInfo.pollIemId}');">
		   						삭제
		   					</a>
		   				</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<!--  줄간격조정  -->
		<table width="100%" cellspacing="0" cellpadding="0" border="0">
			<tr>
				<td height="5px"></td>
			</tr>
		</table>
	</div>
</form>

	<form name="registForm" action="<c:url value='' />" method="post">
		<input name="pollId" type="hidden" value="${onlinePollItem.pollId}">
		<input name="pollIemId" type="hidden" value="">
		<input name="registFormCmd" type="hidden" value="">

		<!--  온라인POLL항목 입력 -->
		<table width="100%" cellspacing="0" cellpadding="0" border="0">
			<tr>
			    <td width="2px" nowrap></td>
			    <td nowrap><input name="pollIemNm" id="pollIemNm" type="text" size="100" value="" maxlength="255" style="width:100%;" title="POLL 세부항목 입력"></td>
			    <td width="2px" nowrap></td>
			    <td width="33px" align="right" nowrap>
				<table border="0" cellspacing="0" cellpadding="0" align="right">
					<tr>
						<td>&nbsp;</td>
						<td>
							<img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt="버튼이미지">
						</td>
						<td class="btnBackground" onClick="JavaScript:fn_egov_regist_OnlinePollItem();" style="cursor:pointer;cursor:hand;" nowrap>
							<DIV id="divPollIem"><spring:message code="button.create" /></DIV>
						</td>
						<td>
							<img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지">
						</td>
					</tr>
				</table>
				</td>
			</tr>
		</table>

	<!--  줄간격조정  -->
	<table width="100%" cellspacing="0" cellpadding="0" border="0">
	<tr>
		<td height="3px"></td>
	</tr>
	</table>
<!-- /DIV -->
</form>
</BODY>
</HTML>
