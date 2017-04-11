<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : EgovScrinStats.jsp
  * @Description : 화면통계 조회 화면
  * @Modification Information
  * @
  * @  수정일       수정자          수정내용
  * @ -------      --------    ---------------------------
  * @ 2009.03.27    박지욱          최초 생성
  * @ 2011.07.17    이기하          패키지 분리(sts -> sts.sst)
  *
  *  @author 공통서비스 개발팀 박지욱
  *  @since 2009.03.27
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
<title>MOPAS 화면통계 조회</title>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />"></script>
<script type="text/javascript">
var imgpath = "<c:url value='/images/egovframework/com/cmm/utl/'/>";
</script>
<script type="text/javascript" language="javascript1.2" src="<c:url value='/js/egovframework/com/sts/sst/treemenu.js' />" ></script>
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 기간구분 변경
 ******************************************************** */
function fnChangePdKind(){
	var v_pdKind = document.getElementById("PD");
	document.listForm.pdKind.value = v_pdKind.options[v_pdKind.selectedIndex].value;
}
/*********************************************************
 * 조회 처리
 *********************************************************/
function fnSearch(){
	var fromDate = document.listForm.fromDate.value;
	var toDate = document.listForm.toDate.value;
	var pdKind = document.listForm.pdKind.value;

	if (fromDate == "") {
		alert("기간 시작일자를 입력하세요");
		return;
	} else if (toDate == "") {
		alert("기간 종료일자를 입력하세요");
		return;
	} else if (pdKind == "") {
		alert("기간 구분을 선택하세요");
		return;
	}

	document.listForm.action = "<c:url value='/sts/sst/selectScrinStats.do'/>";
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
<h1 class="invisible">화면통계</h1>
	<form name="listForm" action="<c:url value='/sts/sst/selectScrinStats.do'/>" method="post">
	    <input type="hidden" name="pdKind" value='<c:out value="${statsInfo.pdKind}"/>'/>
	    <input type="hidden" name="statsKind" value='<c:out value="${statsInfo.statsKind}"/>'/>
	    <input type="hidden" name="detailStatsKind" value=""/>
	    <input type="hidden" name="req_RetrunPath" value="/sym/mpm/EgovMenuList">
		<table width="700" cellpadding="8" class="table-search" border="0">
		  <tr>
		    <td width="700"class="title_left"><h2 class="title_left">
		    <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;화면 통계 검색</h2>
		    </td>
		  </tr>
		  <tr>
		    <td>
		    <table width="700" cellpadding="8" class="table-register" border="0" summary="기간, 기간구분을 선택하여 화면 통계를 검색한다.">
		    <CAPTION style="display: none;">화면 통계 검색</CAPTION>
		      <tr>
		        <td width="250"><label for="fDate">기간</label></td>
		        <td width="100"><label for="PD">기간구분</label></td>
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
				  <select id="PD" name="PD" class="select" onChange="javascript:fnChangePdKind();" tabindex="3" title="기간구분">
				    <option selected value=''>구분</option>
				    <option value='Y'>연도별</option>
				    <option value='M'>월별</option>
				    <option value='D'>일별</option>
			      </select>
				</td>
				<td width="100">
				  <table border="0" cellspacing="0" cellpadding="0">
			        <tr>
				      <td><span class="button"><input type="submit" value="초기화" onclick="fnInitAll(); return false;"></span></td>
			        </tr>
			      </table>
			    </td>
			  </tr>
		    </table>
		    </td>
		  </tr>
		</table>
		<table width="700" cellpadding="8" class="table-search" border="0">
		  <tr>
		    <td width="400"class="title_left"><h2 class="title_left">
		    <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;화면 통계 결과</h2>
		    </td>
		    <td width="300"class="title_left"><h2 class="title_left">
		    <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;공통서비스 메뉴</h2>
		    </td>
		  </tr>
		</table>

		<table width="700" cellpadding="8" class="table-search" border="0">
		  <tr>
		    <td width="400" valign="top" class="title_left">
		      <table width="400">
		        <tr>
		      	  <td class="title_left">그래프 (단위, 횟수)
				      <!-- 막대그래프 시작 -->
				      <table width="400" cellpadding="8" class="table-search" border="0">
				        <c:forEach items="${scrinStats}" var="resultInfo" varStatus="status">
					      <tr>
					        <td width="50" height="10" class="lt_text3" nowrap>${resultInfo.statsDate}</td>
					        <td width="350" height="10">
							  <img src="<c:url value='/images/egovframework/com/cmm/left_bg.gif' />" width="<c:out value='${resultInfo.statsCo * statsInfo.maxUnit}' />" height="10" align="left" alt="">&nbsp;&nbsp;${resultInfo.statsCo}&nbsp;회
							</td>
					      </tr>
					    </c:forEach>
					    <c:if test="${fn:length(scrinStatsList) == 0}">
			    		<tr><td></td></tr>
			    		</c:if>
				      </table>
				      <!-- 막대그래프 끝 -->
		      	  </td>
		        </tr>
		        <tr>
		          <td class="title_left">텍스트 (단위, 횟수)
				      <!-- 테이블표 시작 -->
				      <table width="400" cellpadding="8" class="table-search" border="0" summary="테이블표">
				        <c:forEach items="${scrinStats}" var="resultInfo" varStatus="status">
				        <tr>
				          <td>${resultInfo.statsDate} &nbsp;&nbsp;&nbsp;${resultInfo.statsCo}&nbsp;회</td>
				        </tr>
				        </c:forEach>
					    <c:if test="${fn:length(scrinStatsList) == 0}">
			    		<tr><td></td></tr>
			    		</c:if>
				      </table>
				      <!-- 테이블표 끝 -->
		      	  </td>
		        </tr>
		      </table>
		    </td>
		    <td width="300" valign="top">
		        <!-- 메뉴트리 시작 -->
			    <table width="300" cellpadding="8" class="table-search" border="0" summary="메뉴트리">
			      <tr>
				    <td class="title_left" valign="top">
				        <c:forEach var="result" items="${list_menulist}" varStatus="status" >
						<input type="hidden" name="tmp_menuNm" value="<c:out value='${result.menuNo}|${result.upperMenuId}|${result.menuNm}|${result.progrmFileNm}|${result.menuNo}|${result.menuOrdr}|${result.menuNm}|${result.upperMenuId}|${result.menuDc}|${result.relateImagePath}|${result.relateImageNm}|${result.progrmFileNm}|'/>">
						</c:forEach>

						<div class="tree" style="position:absolute; top:220px">
						<script type="text/javaScript">
					    var chk_Object = true;
					    var chk_browse = "";
						if (eval(document.listForm.req_RetrunPath)=="[object]") chk_browse = "IE";
						if (eval(document.listForm.req_RetrunPath)=="[object NodeList]") chk_browse = "Fox";
						if (eval(document.listForm.req_RetrunPath)=="[object Collection]") chk_browse = "safai";

						var Tree = new Array;
						if(chk_browse=="IE"&&eval(document.listForm.tmp_menuNm)!="[object]"){
						   alert("메뉴 목록 데이타가 존재하지 않습니다.");
						   chk_Object = false;
						}
						if(chk_browse=="Fox"&&eval(document.listForm.tmp_menuNm)!="[object NodeList]"){
						   alert("메뉴 목록 데이타가 존재하지 않습니다.");
						   chk_Object = false;
						}
						if(chk_browse=="safai"&&eval(document.listForm.tmp_menuNm)!="[object Collection]"){
							   alert("메뉴 목록 데이타가 존재하지 않습니다.");
							   chk_Object = false;
						}
						if( chk_Object ){
							for (var j = 0; j < document.listForm.tmp_menuNm.length; j++) {
								Tree[j] = document.listForm.tmp_menuNm[j].value;
						    }
							createTree(Tree, false);
			            }else{
			                alert("메뉴가 존재하지 않습니다. 메뉴 등록 후 사용하세요.");
			            }
						</script>
						</div>
				    </td>
				  </tr>
			    </table>
			    <!-- 메뉴트리 끝 -->
		    </td>
		  </tr>
		</table>
	</form>
</body>
</html>
