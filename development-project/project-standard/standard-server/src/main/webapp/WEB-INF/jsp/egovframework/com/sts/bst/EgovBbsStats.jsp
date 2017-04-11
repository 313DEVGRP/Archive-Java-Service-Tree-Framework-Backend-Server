<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : EgovBbsStats.jsp
  * @Description : 게시물통계 조회 화면
  * @Modification Information
  * @
  * @  수정일       수정자          수정내용
  * @ -------      --------    ---------------------------
  * @ 2009.03.19    박지욱          최초 생성
  * @ 2011.07.17    이기하          패키지 분리(sts -> sts.bst)
  *   2011.09.15    서준식          평균/최고/최소 조회수, 최고게시자 오류 수정
  *  @author 공통서비스 개발팀 박지욱
  *  @since 2009.03.19
  *  @version 1.0
  *  @see
  *
  */
%>

<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<title>MOPAS 게시물통계 조회</title>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />"></script>
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 기간구분 변경
 ******************************************************** */
function fnChangePdKind(){
	var v_pdKind = document.getElementById("PD");
	document.listForm.pdKind.value = v_pdKind.options[v_pdKind.selectedIndex].value;
}
/* ********************************************************
 * 통계구분 변경
 ******************************************************** */
function fnChangeStsKind(){
	for (var i = document.listForm.DTSTKIND.options.length-1;i>=1;i--) {
		document.listForm.DTSTKIND.options[i] = null;
	}
	var v_statsKind = document.getElementById("STKIND");
	var v_detailStatsKind = document.getElementById("DTSTKIND");
	var v_com004 = document.getElementById("COM004");
	var v_com005 = document.getElementById("COM005");
	var v_com009 = document.getElementById("COM009");
	var code = v_statsKind.options[v_statsKind.selectedIndex].value;
	document.listForm.statsKind.value = code;

	if (code == "COM004") {
		for(var j = 0; j < v_com004.options.length; j++) {
			v_detailStatsKind.appendChild(v_com004.options[j].cloneNode(true));
		}
	} else if (code == "COM005") {
		for(var j = 0; j < v_com005.options.length; j++) {
			v_detailStatsKind.appendChild(v_com005.options[j].cloneNode(true));
		}
	} else if (code == "COM009") {
		for(var j = 0; j < v_com009.options.length; j++) {
			v_detailStatsKind.appendChild(v_com009.options[j].cloneNode(true));
		}
	}
}
/* ********************************************************
 * 세부통계구분 변경
 ******************************************************** */
function fnChangeDetailKind(){
	var v_detailStatsKind = document.getElementById("DTSTKIND");
	document.listForm.detailStatsKind.value = v_detailStatsKind.options[v_detailStatsKind.selectedIndex].value;
}
/*********************************************************
 * 조회 처리
 *********************************************************/
function fnSearch(){
	var fromDate = document.listForm.fromDate.value;
	var toDate = document.listForm.toDate.value;
	var pdKind = document.listForm.pdKind.value;
	var statsKind = document.listForm.statsKind.value;
	var detailStatsKind = document.listForm.detailStatsKind.value;
	var tabKind = document.listForm.tabKind.value;

	if (fromDate == "") {
		alert("기간 시작일자를 입력하세요");
		return;
	} else if (toDate == "") {
		alert("기간 종료일자를 입력하세요");
		return;
	} else if (pdKind == "") {
		alert("기간 구분을 선택하세요");
		return;
	} else if (statsKind == "") {
		alert("통계 구분을 선택하세요");
		return;
	}

	if (tabKind == "") {
		document.listForm.tabKind.value = "tab1";
	}

	if (tabKind == "tab4" || tabKind == "tab5") {
		alert("게시물 통계검색 최고/최소조회정보, 최고게시자 정보는 일별 검색만 적용됩니다.");
	}

	document.listForm.action = "<c:url value='/sts/bst/selectBbsStats.do'/>";
   	document.listForm.submit();
}
/* ********************************************************
 * 초기화
 ******************************************************** */
function fnInitAll(){

	// 시작일자, 종료일자
	if (document.listForm.fromDate.value == "" && document.listForm.toDate.value == "") {
		var now = new Date();
	    var year= now.getFullYear();
	    var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
	    var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
		var toDay = year + mon + day;
		document.listForm.fromDate.value = toDay;
		document.listForm.toDate.value = toDay;
		toDay = year + "-" + mon + "-" + day;
		document.listForm.fDate.value = toDay;
		document.listForm.tDate.value = toDay;
	} else if (document.listForm.fromDate.value != "" && document.listForm.toDate.value != "") {
		var fromDate = document.listForm.fromDate.value;
		var toDate = document.listForm.toDate.value;
		document.listForm.fDate.value = fromDate.substring(0, 4) + "-" + fromDate.substring(4, 6) + "-" + fromDate.substring(6, 8);
		document.listForm.tDate.value = toDate.substring(0, 4) + "-" + toDate.substring(4, 6) + "-" + toDate.substring(6, 8);
	}

	// 기간구분
	var pdKind = document.listForm.pdKind.value;
	var v_pdKind = document.getElementById("PD");
	for(var i = 0; i < v_pdKind.options.length; i++) {
		if (pdKind == v_pdKind.options[i].value) {
			v_pdKind.selectedIndex = i;
		}
	}

	// 통계구분
	var statsKind = document.listForm.statsKind.value;
	var v_statsKind = document.getElementById("STKIND");
	for(var j = 0; j < v_statsKind.options.length; j++) {
		if (statsKind == v_statsKind.options[j].value) {
			v_statsKind.selectedIndex = j;
			fnChangeStsKind();
		}
	}

	// 탭 초기화
	var tabKind = document.listForm.tabKind.value;
	var objTab1 = document.getElementById("tab1");
	objTab1.style.display = "none";
	var objTab2 = document.getElementById("tab2");
	objTab2.style.display = "none";
	var objTab3 = document.getElementById("tab3");
	objTab3.style.display = "none";
	var objTab4 = document.getElementById("tab4");
	objTab4.style.display = "none";
	var objTab5 = document.getElementById("tab5");
	objTab5.style.display = "none";
	var obj = document.getElementById(tabKind);
	obj.style.display = "block";

	/*
	// 세부통계구분
	var detailStatsKind = document.listForm.detailStatsKind.value;
	var v_detailStatsKind = document.getElementById("DTSTKIND");
	for(var k = 0; k < v_detailStatsKind.options.length; k++) {
		if (detailStatsKind == v_detailStatsKind.options[k].value) {
			v_detailStatsKind.selectedIndex = k;
		}
	}
	*/
}
/* ********************************************************
 * 탭 변경 + 검색
 ******************************************************** */
function fnChangeTab(tab) {
	document.listForm.tabKind.value = tab;
	fnSearch();
}

function getNextWeek(v,t){
	var str=new Array();
	var b=v.split("-");
	var c=new Date(b[0],b[1]-1,b[2]);
	var d=c.valueOf()+1000*60*60*24*t;
	var e=new Date(d);

	str[str.length]=e.getYear();
	str[str.length]=e.getMonth()+1;
	str[str.length]=e.getDate();
	return str.join("");
}
</script>
</head>

<body onLoad="javascript:fnInitAll();">
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<h1 class="invisible">게시물통계</h1>
	<form name="listForm" action="<c:url value='/sts/bst/selectBbsStats.do'/>" method="post">
	    <input type="hidden" name="pdKind" value='<c:out value="${statsInfo.pdKind}"/>'/>
	    <input type="hidden" name="statsKind" value='<c:out value="${statsInfo.statsKind}"/>'/>
	    <input type="hidden" name="detailStatsKind" value=""/>
	    <input type="hidden" name="tabKind" value='<c:out value="${statsInfo.tabKind}"/>'/>
		<table width="700" cellpadding="8" class="table-search" border="0">
		  <tr>
		    <td width="700"class="title_left"><h2 class="title_left">
		    <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;게시물 통계 검색</h2>
		    </td>
		  </tr>
		  <tr>
		    <td>
		    <table width="700" cellpadding="8" class="table-register" border="0">
		      <tr>
		        <td width="250"><label for="fDate">기간</label></td>
		        <td width="100"><label for="PD">기간구분</label></td>
		        <td width="300"><label for="STKIND">통계구분</label></td>
		        <td width="50"></td>
		      </tr>
		      <tr>
				<td width="200">
				  <input type="hidden" name="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" />
                  <input type="hidden" name="fromDate" value="${statsInfo.fromDate}" size="10"/>
                  <input type="hidden" name="toDate" value="${statsInfo.toDate}" size="10"/>
                  <input type="text" name="fDate" value="" size="10" tabindex="1" title="시작일자(새창)" id="fDate"/>
                  <a href="#noscript" onclick="fn_egov_NormalCalendar(document.listForm, document.listForm.fromDate, document.listForm.fDate); return false;" style="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" alt="달력창팝업버튼이미지"></a>
                  <input type="text" name="tDate" value="" size="10" tabindex="2" title="종료일자(새창)" id="tDate" />
                  <a href="#noscript" onclick="fn_egov_NormalCalendar(document.listForm, document.listForm.toDate, document.listForm.tDate); return false;" style="selector-dummy:expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" alt="달력창팝업버튼이미지"></a>
				</td>
				<td width="100">
				  <select id="PD" name="PD" class="select" onChange="javascript:fnChangePdKind();" tabindex="3" title="기간구분" >
				    <option selected value=''>선택</option>
				    <option value='Y'>연도별</option>
				    <option value='M'>월별</option>
				    <option value='D'>일별</option>
			      </select>
				</td>
				<td width="300">
				  <select id="STKIND" name="STKIND" class="select" onChange="javascript:fnChangeStsKind();" tabindex="4" title="통계구분" >
				    <option selected value=''>선택하세요</option>
				    <option value='COM004'>게시판유형별</option>
				    <option value='COM005'>게시판템플릿별</option>
				    <option value='COM009'>게시판속성별</option>
			      </select>
			      <select id="DTSTKIND" name="DTSTKIND" class="select" onChange="javascript:fnChangeDetailKind()" tabindex="5" title="통계구분2">
				    <option selected value=''>전체</option>
			      </select>
			      <!-- 아래 3개 콤보는 DTSTKIND 콤보로 세부통계구분 데이터 교체를 위한 콤보임 -->
			      <select id="COM004" name="COM004" class="select" style="display:none; width:150px;" title="">
				    <c:forEach var="result" items="${COM004}" varStatus="status">
					<option value='<c:out value="${result.code}"/>'><c:out value="${result.codeNm}"/></option>
					</c:forEach>
			      </select>
			      <select id="COM005" name="COM005" class="select" style="display:none; width:150px;" title="" >
				    <c:forEach var="result" items="${COM005}" varStatus="status">
					<option value='<c:out value="${result.code}"/>'><c:out value="${result.codeNm}"/></option>
					</c:forEach>
			      </select>
			      <select id="COM009" name="COM009" class="select" style="display:none; width:150px;" title="" >
				    <c:forEach var="result" items="${COM009}" varStatus="status">
					<option value='<c:out value="${result.code}"/>'><c:out value="${result.codeNm}"/></option>
					</c:forEach>
			      </select>
				</td>
				<td width="100">
				  <table border="0" cellspacing="0" cellpadding="0">
			        <tr>
				      <td><span class="button"><input type="submit" value="검색" onclick="fnSearch(); return false;"></span></td>
				      <td>&nbsp;&nbsp;</td>
				      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif' />" width="8" height="20" alt="버튼이미지"></td>
				      <td style="background-image:URL(<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>);" class="text_left" nowrap><a href="#noscript" onclick="fnInitAll(); return false;">초기화</a>
				      </td>
				      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif' />" width="8" height="20" alt=""></td>
			        </tr>
			      </table>
			    </td>
			  </tr>
		    </table>
		    </td>
		  </tr>
		</table>

		<!-- 생성글수, 총조회수, 평균조회수, 최고/최소조회수, 최고게시자 탭 -->
		<table border="0" cellspacing="0" cellpadding="0" summary="기간, 기간구분, 통계구분을 입력하여 MOPAS게시물통계를 조회한다.">
		<CAPTION style="display: none;">게시물 통계 검색</CAPTION>
	        <tr>
		      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif' />" width="8" height="20" alt="버튼이미지"></td>
		      <td style="background-image:URL(<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>);" class="text_left" nowrap><a href="#noscript" onclick="fnChangeTab('tab1'); return false;">생성글수</a></td>
		      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif' />" width="8" height="20" alt=""></td>
		      <td>&nbsp;&nbsp;</td>
		      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif' />" width="8" height="20" alt="버튼이미지"></td>
		      <td style="background-image:URL(<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>);" class="text_left" nowrap><a href="#noscript" onclick="fnChangeTab('tab2'); return false;">총조회수</a></td>
		      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif' />" width="8" height="20" alt=""></td>
		      <td>&nbsp;&nbsp;</td>
		      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif' />" width="8" height="20" alt="버튼이미지"></td>
		      <td style="background-image:URL(<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>);" class="text_left" nowrap><a href="#noscript" onclick="fnChangeTab('tab3'); return false;">평균조회수</a></td>
		      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif' />" width="8" height="20" alt=""></td>
		      <td>&nbsp;&nbsp;</td>
		      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif' />" width="8" height="20" alt="버튼이미지"></td>
		      <td style="background-image:URL(<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>);" class="text_left" nowrap><a href="#noscript" onclick="fnChangeTab('tab4'); return false;">최고/최소조회수</a></td>
		      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif' />" width="8" height="20" alt=""></td>
		      <td>&nbsp;&nbsp;</td>
		      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif' />" width="8" height="20" alt="버튼이미지"></td>
		      <td style="background-image:URL(<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>);" class="text_left" nowrap><a href="#noscript" onclick="fnChangeTab('tab5'); return false;">최고게시자</a></td>
		      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif' />" width="8" height="20" alt=""></td>
		      <td>&nbsp;&nbsp;</td>
	        </tr>
	    </table>
		<br/>
	    <!-- 생성글수 탭 -->
		<div id="tab1" style="display:none;">
		<table width="700" cellpadding="8" class="table-search" border="0">
		  <tr>
		    <td width="40%"class="title_left"><h2 class="title_left">
		    <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;생성글수 통계 결과</h2>
		    </td>
		  </tr>
		  <tr>
		    <td class="title_left">그래프 (단위, 개)
		      <!-- 막대그래프 시작 -->
		      <table width="100%" cellpadding="8" class="table-search" border="0">
		        <c:forEach items="${bbsStatsList}" var="resultInfo" varStatus="status">
			      <tr>
			        <td width="10%" height="10" class="lt_text3" nowrap>${resultInfo.statsDate}</td>
			        <td width="90%" height="10">
					  <img src="<c:url value='/images/egovframework/com/cmm/left_bg.gif' />" width="<c:out value='${resultInfo.statsCo * statsInfo.maxUnit}' />" height="10" align="left" alt="">&nbsp;&nbsp;${resultInfo.statsCo}&nbsp;개
					</td>
			      </tr>
			    </c:forEach>
		        <c:if test="${fn:length(bbsStatsList) == 0}">
			    <tr><td></td></tr>
			    </c:if>
		      </table>
		      <!-- 막대그래프 끝 -->
		    </td>
		  </tr>
		  <tr>
		    <td class="title_left">텍스트 (단위, 개)
		      <!-- 테이블표 시작 -->
		      <table width="100%" cellpadding="8" class="table-search" border="0">
		        <c:forEach items="${bbsStatsList}" var="resultInfo" varStatus="status">
		        <tr>
		          <td>${resultInfo.statsDate} &nbsp;&nbsp;&nbsp;${resultInfo.statsCo}&nbsp;개</td>
		        </tr>
		        </c:forEach>
		        <c:if test="${fn:length(bbsStatsList) == 0}">
			    <tr><td></td></tr>
			    </c:if>
		      </table>
		      <!-- 테이블표 끝 -->
		    </td>
		  </tr>
		</table>
		</div>
		<!-- 총조회수 탭 -->
		<div id="tab2" style="display:none;">
		<table width="700" cellpadding="8" class="table-search" border="0">
		  <tr>
		    <td width="40%"class="title_left">
		    <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;총조회수 통계 결과
		    </td>
		  </tr>
		  <tr>
		    <td class="title_left">그래프 (단위, 회)
		      <!-- 막대그래프 시작 -->
		      <table width="100%" cellpadding="8" class="table-search" border="0">
		        <c:forEach items="${bbsStatsList}" var="resultInfo" varStatus="status">
			      <tr>
			        <td width="10%" height="10" class="lt_text3" nowrap>${resultInfo.statsDate}</td>
			        <td width="90%" height="10">
					  <img src="<c:url value='/images/egovframework/com/cmm/left_bg.gif' />" width="<c:out value='${resultInfo.statsCo * statsInfo.maxUnit}' />" height="10" align="left" alt="">&nbsp;&nbsp;${resultInfo.statsCo}&nbsp;회
					</td>
			      </tr>
			    </c:forEach>
		        <c:if test="${fn:length(bbsStatsList) == 0}">
			    <tr><td></td></tr>
			    </c:if>
		      </table>
		      <!-- 막대그래프 끝 -->
		    </td>
		  </tr>
		  <tr>
		    <td class="title_left">텍스트 (단위, 회)
		      <!-- 테이블표 시작 -->
		      <table width="100%" cellpadding="8" class="table-search" border="0">
		        <c:forEach items="${bbsStatsList}" var="resultInfo" varStatus="status">
		        <tr>
		          <td>${resultInfo.statsDate} &nbsp;&nbsp;&nbsp;${resultInfo.statsCo}&nbsp;회</td>
		        </tr>
		        </c:forEach>
		        <c:if test="${fn:length(bbsStatsList) == 0}">
			    <tr><td></td></tr>
			    </c:if>
		      </table>
		      <!-- 테이블표 끝 -->
		    </td>
		  </tr>
		</table>
		</div>
		<!-- 평균조회수 탭 -->
		<div id="tab3" style="display:none;">
		<table width="700" cellpadding="8" class="table-search" border="0">
		  <tr>
		    <td width="40%"class="title_left">
		    <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;평균조회수 통계 결과
		    </td>
		  </tr>
		  <tr>
		    <td class="title_left">그래프 (단위, 회)
		      <!-- 막대그래프 시작 -->
		      <table width="100%" cellpadding="8" class="table-search" border="0">
		        <c:forEach items="${bbsStatsList}" var="resultInfo" varStatus="status">
			      <tr>
			        <td width="10%" height="10" class="lt_text3" nowrap>${resultInfo.statsDate}</td>
			        <td width="90%" height="10">
					  <img src="<c:url value='/images/egovframework/com/cmm/left_bg.gif' />" width="<c:out value='${resultInfo.statsCo * statsInfo.maxUnit}' />" height="10" align="left" alt="">&nbsp;&nbsp;${resultInfo.statsCo}&nbsp;회
					</td>
			      </tr>
			    </c:forEach>
			    <c:if test="${fn:length(bbsStatsList) == 0}">
			    <tr><td></td></tr>
			    </c:if>
		      </table>
		      <!-- 막대그래프 끝 -->
		    </td>
		  </tr>
		  <tr>
		    <td class="title_left">텍스트 (단위, 회)
		      <!-- 테이블표 시작 -->
		      <table width="100%" cellpadding="8" class="table-search" border="0">
		        <c:forEach items="${bbsStatsList}" var="resultInfo" varStatus="status">
		        <tr>
		          <td>${resultInfo.statsDate} &nbsp;&nbsp;&nbsp;${resultInfo.statsCo}&nbsp;회</td>
		        </tr>
		        </c:forEach>
		        <c:if test="${fn:length(bbsStatsList) == 0}">
			    <tr><td></td></tr>
			    </c:if>
		      </table>
		      <!-- 테이블표 끝 -->
		    </td>
		  </tr>
		</table>
		</div>
		<!-- 최고/최소조회수 탭 -->
		<div id="tab4" style="display:none;">
		<table width="700" cellpadding="8" class="table-search" border="0">
		  <tr>
		    <td width="40%"class="title_left">
		    <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;최고/최소조회수 통계 결과
		    </td>
		  </tr>
		  <tr>
		    <td class="title_left">최고 조회 게시물 정보
		      <table width="700" cellpadding="0" class="table-line" border="0">
		        <thead>
		          <tr>
      			    <th width="10%" height="10" class="lt_text3" nowrap>게시일자</th>
		            <th width="10%" height="10" class="lt_text3" nowrap>게시번호</th>
		            <th width="40%" height="10" class="lt_text3" nowrap>제목</th>
		            <th width="10%" height="10" class="lt_text3" nowrap>조회수</th>
		          </tr>
		        </thead>
		        <tbody>
		        <c:forEach items="${bbsMaxStatsList}" var="resultInfo" varStatus="status">
			    <tr>
			      <td class="lt_text3" nowrap>${resultInfo.statsDate}</td>
			      <td class="lt_text3" nowrap>${resultInfo.mxmmInqireBbsId}</td>
			      <td class="lt_text6" nowrap>${resultInfo.mxmmInqireBbsNm}</td>
			      <td class="lt_text3" nowrap>${resultInfo.maxStatsCo}</td>
			    </tr>
			    </c:forEach>
			    <%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
				<c:if test="${fn:length(bbsMaxStatsList) == 0}">
					<tr>
					<td class="lt_text3" colspan="4">
						<spring:message code="common.nodata.msg" />
					</td>
					</tr>
				</c:if>
			    </tbody>
		      </table>
		    </td>
		  </tr>
		  <tr>
		    <td class="title_left">최소 조회 게시물 정보
		      <table width="700" cellpadding="0" class="table-line" border="0">
		        <thead>
		          <tr>
      			    <th width="10%" height="10" class="lt_text3" nowrap>게시일자</th>
		            <th width="10%" height="10" class="lt_text3" nowrap>게시번호</th>
		            <th width="40%" height="10" class="lt_text3" nowrap>제목</th>
		            <th width="10%" height="10" class="lt_text3" nowrap>조회수</th>
		          </tr>
		        </thead>
		        <tbody>
		        <c:forEach items="${bbsMinStatsList}" var="resultInfo" varStatus="status">
			    <tr>
			      <td class="lt_text3" nowrap>${resultInfo.statsDate}</td>
			      <td class="lt_text3" nowrap>${resultInfo.mummInqireBbsId}</td>
			      <td class="lt_text6" nowrap>${resultInfo.mummInqireBbsNm}</td>
			      <td class="lt_text3" nowrap>${resultInfo.minStatsCo}</td>
			    </tr>
			    </c:forEach>
			    <%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
					<c:if test="${fn:length(bbsMinStatsList) == 0}">
					<tr>
					<td class="lt_text3" colspan="4">
						<spring:message code="common.nodata.msg" />
					</td>
					</tr>
					</c:if>
			    </tbody>
		      </table>
		    </td>
		  </tr>
		</table>
		</div>
		<!-- 최고게시자 탭 -->
		<div id="tab5" style="display:none;">
		<table width="700" cellpadding="8" class="table-search" border="0">
		  <tr>
		    <td width="40%"class="title_left">
		    <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;최고게시자 통계 결과
		    </td>
		  </tr>
		  <tr>
		    <td class="title_left">최고 게시자 정보
		      <table width="700" cellpadding="0" class="table-line" border="0">
		        <thead>
		          <tr>
      			    <th width="10%" height="10" class="lt_text3" nowrap>게시자ID</th>
		            <th width="10%" height="10" class="lt_text3" nowrap>게시건수</th>
		            <th width="10%" height="10" class="lt_text3" nowrap>집계일자</th>
		          </tr>
		        </thead>
		        <tbody>
		        <c:forEach items="${bbsMaxNtcrList}" var="resultInfo" varStatus="status">
			    <tr>
			      <td class="lt_text3" nowrap>${resultInfo.topNtcepersonId}</td>
			      <td class="lt_text3" nowrap>${resultInfo.topNtcepersonCo}</td>
			      <td class="lt_text3" nowrap>${resultInfo.statsDate}</td>
			    </tr>
			    </c:forEach>
			    <%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
					<c:if test="${fn:length(bbsMaxNtcrList) == 0}">
					<tr>
					<td class="lt_text3" colspan="3">
						<spring:message code="common.nodata.msg" />
					</td>
					</tr>
					</c:if>
			    </tbody>
		      </table>
		    </td>
		  </tr>
		</table>
		</div>
	</form>
</body>
</html>
