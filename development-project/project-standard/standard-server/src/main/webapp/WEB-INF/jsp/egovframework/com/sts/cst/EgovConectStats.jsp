<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : EgovConectStats.jsp
  * @Description : 접속통계 조회 화면
  * @Modification Information
  * @
  * @  수정일         수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.03.23    박지욱          최초 생성
  * @ 2011.07.17    이기하          패키지 분리(sts -> sts.cst)
  *
  *  @author 공통서비스 개발팀 박지욱
  *  @since 2009.03.23
  *  @version 1.0
  *  @see
  *
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<title>MOPAS 접속통계 조회</title>
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
	var v_statsKind = document.getElementById("STKIND");
	document.listForm.statsKind.value = v_statsKind.options[v_statsKind.selectedIndex].value;
}

/* ********************************************************
 * 개인별 검색어 변경
 ******************************************************** */
function fnChangePerson(){
	document.listForm.detailStatsKind.value = document.listForm.person.value;
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

	document.listForm.action = "<c:url value='/sts/cst/selectConectStats.do'/>";
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
<h1 class="invisible">접속통계</h1>
	<form name="listForm" action="<c:url value='/sts/cst/selectConectStats.do'/>" method="post">
	    <input type="hidden" name="pdKind" value='<c:out value="${statsInfo.pdKind}"/>'/>
	    <input type="hidden" name="statsKind" value='<c:out value="${statsInfo.statsKind}"/>'/>
	    <input type="hidden" name="detailStatsKind" value=""/>
		<table width="660" cellpadding="8" class="table-search" border="0">
		  <tr>
		    <td width="660"class="title_left"><h2 class="title_left">
		    <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;접속 통계 검색</h2>
		    </td>
		  </tr>
		  <tr>
		    <td>
		    <table width="660" cellpadding="8" class="table-register" border="0">
		      <tr>
		        <td width="270"><label for="fDate">기간</label></td>
		        <td width="100"><label for="PD">기간구분</label></td>
		        <td width="280"><label for="STKIND">통계구분</label></td>
		        <td width="10"></td>
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
				  <select id="PD" name="PD" class="select" onChange="javascript:fnChangePdKind();" tabindex="3" title="기간구분">
				    <option selected value=''>구분</option>
				    <option value='Y'>연도별</option>
				    <option value='M'>월별</option>
				    <option value='D'>일별</option>
			      </select>
				</td>
				<td width="280">
				  <select id="STKIND" name="STKIND" class="select" onChange="javascript:fnChangeStsKind();" tabindex="4" title="통계구분">
				    <option selected value=''>구분</option>
				    <option value='SERVICE'>서비스별</option>
				    <option value='PRSONAL'>개인별</option>
			      </select>
			      <input name="person" type="text" size="15" value="" onChange="fnChangePerson();" tabindex="5" title="" id="person">
				</td>
				<td width="100">
				  <table border="0" cellspacing="0" cellpadding="0">
			        <tr>
				      <td><span class="button"><input type="submit" value="검색" onclick="fnSearch(); return false;"></span></td>
				      <td>&nbsp;&nbsp;</td>
				      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif' />" width="8" height="20" alt="버튼이미지"></td>
				      <td style="background-image:URL(<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>);" class="text_left" nowrap>
				      <a href="#noscript" onclick="fnInitAll(); return false;">초기화</a>
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

		<!-- 서비스별 결과 -->
		<c:if test='${statsInfo.statsKind == "SERVICE" }'>
		<table width="660" cellpadding="8" class="table-search" border="0" summary="기간, 기간구분, 통계구분을 입력하여 MOPAS 접속통계를 조회한다.">
		<CAPTION style="display: none;">접속 통계 검색</CAPTION>
		  <tr>
		    <td class="title_left">서비스별 접속 통계
		      <table width="660" class="table-line" border="0">
		        <thead>
		          <tr>
      			    <th scope="col" width="70" height="10" class="lt_text3" nowrap>일자</th>
		            <th scope="col" width="320" height="10" class="lt_text3" nowrap>메소드명</th>
		            <th scope="col" width="45" height="10" class="lt_text3" nowrap>생성</th>
		            <th scope="col" width="45" height="10" class="lt_text3" nowrap>수정</th>
		            <th scope="col" width="45" height="10" class="lt_text3" nowrap>조회</th>
		            <th scope="col" width="45" height="10" class="lt_text3" nowrap>삭제</th>
		            <th scope="col" width="45" height="10" class="lt_text3" nowrap>출력</th>
		            <th scope="col" width="45" height="10" class="lt_text3" nowrap>에러</th>
		          </tr>
		        </thead>

        		<%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
				<c:if test="${fn:length(conectStats) == 0}">
				<tr>
				<td class="lt_text3" colspan="9">
					<spring:message code="common.nodata.msg" />
				</td>
				</tr>
				</c:if>

		        <tbody>
		        <c:forEach items="${conectStats}" var="resultInfo" varStatus="status">
			    <tr>
			      <td class="lt_text3" nowrap>${resultInfo.statsDate}</td>
			      <td class="lt_text6" nowrap>&nbsp;${resultInfo.conectMethod}</td>
			      <td class="lt_text3" nowrap>${resultInfo.creatCo}</td>
			      <td class="lt_text3" nowrap>${resultInfo.updtCo}</td>
			      <td class="lt_text3" nowrap>${resultInfo.inqireCo}</td>
			      <td class="lt_text3" nowrap>${resultInfo.deleteCo}</td>
			      <td class="lt_text3" nowrap>${resultInfo.outptCo}</td>
			      <td class="lt_text3" nowrap>${resultInfo.errorCo}</td>
			    </tr>
			    </c:forEach>
			    </tbody>
		      </table>
		    </td>
		  </tr>
		</table>
		</c:if>

		<!-- 개인별 결과 -->
		<c:if test='${statsInfo.statsKind == "PRSONAL" }'>
		<table width="660" cellpadding="8" class="table-search" border="0">
		  <tr>
		    <td width="660"class="title_left">
		    <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;접속 통계 결과
		    </td>
		  </tr>
		  <tr>
		    <td class="title_left">그래프 (단위, 횟수)
		      <!-- 막대그래프 시작 -->
		      <table width="660" cellpadding="8" class="table-search" border="0">
		        <c:forEach items="${conectStats}" var="resultInfo" varStatus="status">
			      <tr>
			        <td width="100" height="10" class="lt_text3" nowrap>${resultInfo.statsDate}</td>
			        <td width="560" height="10">
					  <img src="<c:url value='/images/egovframework/com/cmm/left_bg.gif' />" width="<c:out value='${resultInfo.statsCo * statsInfo.maxUnit}' />" height="10" align="left" alt="">&nbsp;&nbsp;${resultInfo.statsCo}&nbsp;회
					</td>
			      </tr>
			    </c:forEach>
		      </table>
		      <!-- 막대그래프 끝 -->
		    </td>
		  </tr>
		  <tr>
		    <td class="title_left">텍스트 (단위, 횟수)
		      <!-- 테이블표 시작 -->
		      <table width="660" cellpadding="8" class="table-search" border="0">
		        <c:forEach items="${conectStats}" var="resultInfo" varStatus="status">
		        <tr>
		          <td>${resultInfo.statsDate} &nbsp;&nbsp;&nbsp;${resultInfo.statsCo}&nbsp;회</td>
		        </tr>
		        </c:forEach>
		      </table>
		      <!-- 테이블표 끝 -->
		    </td>
		  </tr>
		</table>
		</c:if>



	</form>
</body>
</html>
