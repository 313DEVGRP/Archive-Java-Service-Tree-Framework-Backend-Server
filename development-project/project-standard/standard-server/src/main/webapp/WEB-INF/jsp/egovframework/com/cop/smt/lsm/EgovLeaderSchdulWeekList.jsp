<%--
/**
 * @Class Name  : EgovLeaderSchdulWeekList.java
 * @Description : EgovLeaderSchdulWeekList jsp
 * @Modification Information
 * @
 * @  수정일                    수정자                수정내용
 * @ ---------     --------    ---------------------------
 * @ 2010.07.01    장철호     최초 생성
 *
 *  @author 장철호
 *  @since 2010.07.01
 *  @version 1.0
 *  @see
 *  
 *  Copyright (C) 2010 by MOPAS  All right reserved.
 */
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="egovframework.com.cop.smt.lsm.service.LeaderSchdulVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%!
    public String DateTypeIntForString(int iInput){
		String sOutput = "";
		if(Integer.toString(iInput).length() == 1){
			sOutput = "0" + Integer.toString(iInput);
		}else{
			sOutput = Integer.toString(iInput);
		}
		
       return sOutput;
    }
%>

<%
Calendar calNow = Calendar.getInstance();
Calendar calBefore = Calendar.getInstance();
Calendar calNext = Calendar.getInstance();

String sImgUrl = "/images/egovframework/com/cop/smt/lsm/";
String sCssUrl = "/css/egovframework/com/cop/smt/lsm/";

int iNowYear = (Integer)request.getAttribute("year");
int iNowMonth = (Integer)request.getAttribute("month");
int iNowWeek = (Integer)request.getAttribute("week");

List listWeekGrop = (List)request.getAttribute("listWeekGrop");

for(int i=0; i < listWeekGrop.size(); i++){
	
	//out.println(listWeekGrop.get(i));
	//out.println("<br>");
}

ArrayList listWeek = new ArrayList();
listWeek = (ArrayList)listWeekGrop.get(iNowWeek);

//요일설정
String arrDateTitle[] = new String[7];

arrDateTitle[0] = "일요일";
arrDateTitle[1] = "월요일";
arrDateTitle[2] = "화요일";
arrDateTitle[3] = "수요일";
arrDateTitle[4] = "목요일";
arrDateTitle[5] = "금요일";
arrDateTitle[6] = "토요일";

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="egovframework.com.utl.fcc.service.EgovDateUtil"%><html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/cop/smt/lsm/body.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">

<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/showModalDialog.js'/>" ></script>

<script type="text/javaScript" language="javascript">

	var gOpener = parent.document.all? parent.document.leaderSchdulVO : parent.document.getElementById("leaderSchdulVO") ;
	/* ********************************************************
	* 간부일정 등록
	******************************************************** */
	function fn_egov_regist_LeaderSchdul(sDate){
	
		gOpener.schdulBgnDe.value = sDate;
		gOpener.schdulEndDe.value = sDate;
		gOpener.year.value = "<%=iNowYear%>";
		gOpener.month.value = "<%=iNowMonth%>";
		gOpener.week.value = "<%=iNowWeek%>";
		gOpener.searchMode.value = "WEEK";
		gOpener.action = '/cop/smt/lsm/mng/addLeaderSchdul.do' />';
		gOpener.submit();
	}


	/* ********************************************************
	* 간부일정 상세보기
	******************************************************** */
	function fn_egov_detail_LeaderSchdul(schdulId, schdulDe){

		gOpener.schdulId.value = schdulId;
		gOpener.schdulDe.value = schdulDe;
		gOpener.year.value = "<%=iNowYear%>";
		gOpener.month.value = "<%=iNowMonth%>";
		gOpener.week.value = "<%=iNowWeek%>";
		gOpener.searchMode.value = "WEEK";
		gOpener.action = '<c:url value="/cop/smt/lsm/usr/selectLeaderSchdul.do"/>';
		gOpener.submit();
	}

	/* ********************************************************
	* 아이디  팝업창열기
	* fn_egov_schdulCharger_LeaderSchdule
	* param 타이틀, ID 폼명, 사원번호 폼명, 사원명 폼명, 부서명 폼명
	******************************************************** */
	function fn_egov_schdulCharger_LeaderSchdule(strTitle, frmUniqId, frmEmplNo, frmEmplyrNm, frmOrgnztNm){
		var arrParam = new Array(6);
		arrParam[0] = window;
		arrParam[1] = strTitle;
		arrParam[2] = frmUniqId;
		arrParam[3] = frmEmplNo;
		arrParam[4] = frmEmplyrNm;
		arrParam[5] = frmOrgnztNm;

	 	window.showModalDialog("<c:url value='/cop/smt/lsm/selectEmplyrListPopup.do' />", arrParam,"dialogWidth=800px;dialogHeight=500px;resizable=yes;center=yes");
	}

	
	var ifr= parent.document.all? parent.document.all.SchdulView : parent.document.getElementById("SchdulView") ;

	function do_resize() {
		resizeFrame(1);
	}

	//가로길이는 유동적인 경우가 드물기 때문에 주석처리!
	function resizeFrame(re) {

		if(ifr){

			var innerHeight = document.body.scrollHeight + (document.body.offsetHeight - document.body.clientHeight);
				
			if(ifr.style.height != innerHeight) //주석제거시 다음 구문으로 교체 -> if (ifr.style.height != innerHeight || ifr.style.width != innerWidth)
			{ifr.style.height = innerHeight;}

			/*
			if(!re) {
				try{ document.body.attachEvent('onclick',do_resize);
				}catch(e){document.body.addEventListener("click", do_resize, false);}
			}
			*/
		}
	}

	function press(event) {
		if (event.keyCode==13) {
			fnEgovSchdulSelect();
		}
	}
	
	function fnEgovSchdulSe(setValue) {

		location.href="<c:url value='/cop/smt/lsm/usr/selectLeaderSchdulWeekList.do' />?year=<%=iNowYear%>&month=<%=iNowMonth%>&week=<%=iNowWeek%>&searchCondition=SCHDUL_SE&searchKeyword=" + setValue;
	}

	function fnEgovSchdulSelect() {

		var newLocation = "<c:url value='/cop/smt/lsm/usr/selectLeaderSchdulWeekList.do' />?year=<%=iNowYear%>&month=<%=iNowMonth%>&week=<%=iNowWeek%>&searchCondition=LEADER_ID&searchKeyword=" + document.leaderSchdulVO.schdulSe.options[document.leaderSchdulVO.schdulSe.selectedIndex].value + "&searchKeywordEx=" + document.leaderSchdulVO.leaderName.value;

		document.leaderSchdulVO.action = newLocation;
		document.leaderSchdulVO.submit();
	}
	
	window.onload = function(){
		do_resize();
	}
</script>
<title>주별 간부일정 조회</title>
</head>
<body> 
<form name="leaderSchdulVO" id="leaderSchdulVO" action="<c:url value='/cop/smt/lsm/usr/selectLeaderSchdulWeekList.do' />?year=<%=iNowYear%>&month=<%=iNowMonth%>&week=<%=iNowWeek%>&searchCondition=SCHDUL_SE" method="post">
<div id="content" style="width:712px;">
<!-- 날짜 네비게이션  -->
<table width="100%" border="0" cellspacing="1" cellpadding="1" id="KOO" bgcolor="#F3F9D7" style="border:1px solid #CED99C" summary="이표는 간부일정의 일정구분, 간부 조회조건과 날짜 네비게이션을 제공합니다.">	
<caption>주별간부일정목록 조회조건</caption>
<tr>
<td height="60">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="10">
		</td>
	</tr>
	<tr>
		<td width="10px"></td>
    <td>
        <label for="schdulSe">일정구분 : </label>
     	<select name="schdulSe" class="select" id="schdulSe" title="일정구분선택">
  		   <option selected value=''>-- 선택 --</option>
			<c:forEach var="result" items="${schdulSe}" varStatus="status">
				<option value='${result.code}' <c:if test="${searchKeyword == result.code}">selected</c:if>>${result.codeNm}</option>
			</c:forEach>			   			     		    		   
  		</select>    
  		
		</td>
		<td width="0px">
		</td>
		
		<td width="150px">
			<label for="schdulSe">간부명 : </label>
			<input type="text" name="leaderName" id="leaderName" size="10" maxlength="10" title="간부명" value="${searchKeywordEx}" onkeypress="press(event);" >
		</td>
		<td>
			<span class="button"><input type="submit" value="조회" onclick="fnEgovSchdulSelect(); return false;"></span>
		</td>
		<td>
			
			<table>
			<tr>
			<td width="110" align="center">
			<a href="<c:url value='/cop/smt/lsm/usr/selectLeaderSchdulWeekList.do' />?year=<%=iNowYear-1%>&amp;month=<%=iNowMonth%>&amp;week=<%=iNowWeek%>" target="_self">
			<img src="<c:url value='/images/egovframework/com/cmm/icon/icoPrev.gif' />" style="margin-right:4px;border:0px;" alt="이전년도">
			</a>
			<font size='3'><b><%=iNowYear%>년</b></font>
			<a href="<c:url value='/cop/smt/lsm/usr/selectLeaderSchdulWeekList.do' />?year=<%=iNowYear+1%>&amp;month=<%=iNowMonth%>&amp;week=<%=iNowWeek%>" target="_self">
			<img src="<c:url value='/images/egovframework/com/cmm/icon/icoNxt.gif' />" style="margin-left:4px;border:0px;" alt="다음년도">
			</a>
			</td>
			<td width="100" align="center">
			<%if(iNowMonth > 0 ){ %>
			<a href="<c:url value='/cop/smt/lsm/usr/selectLeaderSchdulWeekList.do' />?year=<%=iNowYear%>&amp;month=<%=iNowMonth-1%>&amp;week=<%=iNowWeek%>" target="_self">
			<img src="<c:url value='/images/egovframework/com/cmm/icon/icoPrev.gif' />" style="margin-right:4px;border:0px;" alt="이전월">
			</a>
			<%}%>
			<font size='3'><b><%=iNowMonth+1%>월</b></font> 
			<%if(iNowMonth < 11 ){ %>
			<a href="<c:url value='/cop/smt/lsm/usr/selectLeaderSchdulWeekList.do' />?year=<%=iNowYear%>&amp;month=<%=iNowMonth+1%>&amp;week=<%=iNowWeek%>" target="_self">
			<img src="<c:url value='/images/egovframework/com/cmm/icon/icoNxt.gif' />" style="margin-left:4px;border:0px;" alt="다음월">
			</a> 
			<%}%>
			</td>
			<td width="80" align="center">
			<%if(iNowWeek > 0 ){ %>
			<a href="<c:url value='/cop/smt/lsm/usr/selectLeaderSchdulWeekList.do' />?year=<%=iNowYear%>&amp;month=<%=iNowMonth%>&amp;week=<%=iNowWeek-1%>" target="_self">
			<img src="<c:url value='/images/egovframework/com/cmm/icon/icoPrev.gif' />" style="margin-right:4px;border:0px;" alt="이전주">
			</a>
			<%}%>
			<font size='3'><b><%=iNowWeek+1%>주</b></font>
			<%if(iNowWeek < listWeekGrop.size()-1 ){ %>
			<a href="<c:url value='/cop/smt/lsm/usr/selectLeaderSchdulWeekList.do' />?year=<%=iNowYear%>&amp;month=<%=iNowMonth%>&amp;week=<%=iNowWeek+1%>" target="_self">
			<img src="<c:url value='/images/egovframework/com/cmm/icon/icoNxt.gif' />" style="margin-left:4px;border:0px;" alt="다음주">
			</a> 
			<%}%>
			</td>			
			</tr>
			
			</table>
			
		</td>
	</tr>
	</table>
</td>
</tr>
</table>
<!-- //날짜 네비게이션  -->
<br>
<table width="100%"  border="0" cellpadding="1" cellspacing="1" bgcolor="#828486" summary="이 표는 주별 간부일정 목록을 제공하며, 날짜, 시간, 일정명, 간부 정보로 구성되어 있습니다.">	
<caption>주별간부일정목록</caption>
<tr>
   	<th scope="col" width="180px" bgcolor="#E0E0E0" align="center" height="35px">날짜</th>
	<th scope="col" width="120px" bgcolor="#E0E0E0" align="center">시간</th>
	<th scope="col" bgcolor="#E0E0E0" align="center">일정명</th>
	<th scope="col" width="80px" bgcolor="#E0E0E0" align="center">간부</th>
</tr>
<%
List<LeaderSchdulVO> listResult = (List<LeaderSchdulVO>)request.getAttribute("resultList");
LeaderSchdulVO leaderSchdulVO = new LeaderSchdulVO();

for(int i=0; i < listWeek.size(); i++){
	
	String sTmpDate = (String)listWeek.get(i);
	int iUseDate = Integer.parseInt(sTmpDate);

%>
  <tr>
    <td bgcolor="#F5F5F5" align="center" valign="middle" height="50px">
		    <a href="<c:url value='/cop/smt/lsm/mng/addLeaderSchdul.do' />?schdulBgnDe=<%=iUseDate%>&amp;schdulEndDe=<%=iUseDate%>&amp;searchMode=WEEK&amp;year=<%=iNowYear%>&amp;month=<%=iNowMonth%>&amp;week=<%=iNowWeek%>" target="_parent" onClick="JavaScript:fn_egov_regist_LeaderSchdul('<%=iUseDate%>');">
		    <%=sTmpDate.substring(0,4)%>년 <%=sTmpDate.substring(4,6)%>월 <%=sTmpDate.substring(6,8)%>일  <%=arrDateTitle[i] %>
		    </a>
    </td>
    <td bgcolor="#FFFFFF"  valign="middle" align="center" style="padding-left:2px;">
    <%
    if(listResult != null){ 
    	
	for(int j=0;j < listResult.size(); j++){
		leaderSchdulVO = (LeaderSchdulVO)listResult.get(j);
		
		int iSchdulDate = Integer.parseInt(((String)leaderSchdulVO.getSchdulDe()).substring(0, 8));
		
		if(iUseDate == iSchdulDate){
			out.print("<table><tr><td nowrap><div class='divDotText' style='width:120px;border:solid 0px;'><a href=\"" + request.getContextPath() + "/cop/smt/lsm/usr/selectLeaderSchdul.do?schdulId=" + (String)leaderSchdulVO.getSchdulId() +  "&amp;schdulDe=" + iUseDate + "&amp;searchMode=WEEK&amp;year=" + iNowYear + "&amp;month=" + iNowMonth + "&amp;week=" + iNowWeek + "\" target=\"_parent\" onClick=\"JavaScript:fn_egov_detail_LeaderSchdul('" + (String)leaderSchdulVO.getSchdulId() + "', '" + iUseDate + "')\">");
			out.print( ((String)leaderSchdulVO.getSchdulBgnDe()).substring(8,10) +"시");
			out.print( ((String)leaderSchdulVO.getSchdulBgnDe()).substring(10,12) +"분 ~ ");
			out.print( ((String)leaderSchdulVO.getSchdulEndDe()).substring(8,10) +"시");
			out.print( ((String)leaderSchdulVO.getSchdulEndDe()).substring(10,12) +"분 ");
			out.println("</a></div></td></tr></table>");
		}
	}
	}
    %>
    </td>
    <td bgcolor="#FFFFFF"  valign="middle" style="padding-left:2px;">
    <%
    if(listResult != null){ 
    	
	for(int j=0;j < listResult.size(); j++){
		leaderSchdulVO = (LeaderSchdulVO)listResult.get(j);
		
		int iSchdulDate = Integer.parseInt(((String)leaderSchdulVO.getSchdulDe()).substring(0, 8));
		
		String sSchdulBgnDate = (String)leaderSchdulVO.getSchdulBgnDe().substring(0, 8);
		String sSchdulEndDate = (String)leaderSchdulVO.getSchdulEndDe().substring(0, 8);
		
		if(iUseDate == iSchdulDate && !sSchdulBgnDate.equals(sSchdulEndDate)){
			out.print("<table><tr><td nowrap><div class='divDotText' style='width:350px;border:solid 0px;'><a href=\"" + request.getContextPath() + "/cop/smt/lsm/usr/selectLeaderSchdul.do?schdulId=" + (String)leaderSchdulVO.getSchdulId() +  "&amp;schdulDe=" + iUseDate + "&amp;searchMode=WEEK&amp;year=" + iNowYear + "&amp;month=" + iNowMonth + "&amp;week=" + iNowWeek + "\" target=\"_parent\" onClick=\"JavaScript:fn_egov_detail_LeaderSchdul('" + (String)leaderSchdulVO.getSchdulId() + "', '" + iUseDate + "')\">");
			out.print("[");
			out.print(EgovDateUtil.formatDate(sSchdulBgnDate, "-"));
			out.print(" ~ ");
			out.print(EgovDateUtil.formatDate(sSchdulEndDate, "-"));
			out.print("]");
			out.println("</a></div></td></tr></table>");
		}
	}
	}
    %>
    <%
    if(listResult != null){ 
    	
	for(int j=0;j < listResult.size(); j++){
		leaderSchdulVO = (LeaderSchdulVO)listResult.get(j);
		
		int iSchdulDate = Integer.parseInt(((String)leaderSchdulVO.getSchdulDe()).substring(0, 8));
		
		if(iUseDate == iSchdulDate){
			out.print("<table><tr><td nowrap><div class='divDotText' style='width:350px;border:solid 0px;'><a href=\"" + request.getContextPath() + "/cop/smt/lsm/usr/selectLeaderSchdul.do?schdulId=" + (String)leaderSchdulVO.getSchdulId() +  "&amp;schdulDe=" + iUseDate + "&amp;searchMode=WEEK&amp;year=" + iNowYear + "&amp;month=" + iNowMonth + "&amp;week=" + iNowWeek + "\" target=\"_parent\" onClick=\"JavaScript:fn_egov_detail_LeaderSchdul('" + (String)leaderSchdulVO.getSchdulId() + "', '" + iUseDate + "')\">");
			out.print((String)leaderSchdulVO.getSchdulNm());
			out.println("</a></div></td></tr></table>");
		}
	}
	}
    %>
    </td>
    <td bgcolor="#FFFFFF"  valign="middle" align="center" style="padding-left:2px;">
	<%
    if(listResult != null){ 
    	
	for(int j=0;j < listResult.size(); j++){
		leaderSchdulVO = (LeaderSchdulVO)listResult.get(j);
		
		int iSchdulDate = Integer.parseInt(((String)leaderSchdulVO.getSchdulDe()).substring(0, 8));
		
		if(iUseDate == iSchdulDate){
			out.print("<table><tr><td nowrap><div class='divDotText' style='width:60px;border:solid 0px;'><a href=\"" + request.getContextPath() + "/cop/smt/lsm/usr/selectLeaderSchdul.do?schdulId=" + (String)leaderSchdulVO.getSchdulId() +  "&amp;schdulDe=" + iUseDate + "&amp;searchMode=WEEK&amp;year=" + iNowYear + "&amp;month=" + iNowMonth + "&amp;week=" + iNowWeek + "\" target=\"_parent\" onClick=\"JavaScript:fn_egov_detail_LeaderSchdul('" + (String)leaderSchdulVO.getSchdulId() + "', '" + iUseDate + "')\">");
			out.print((String)leaderSchdulVO.getLeaderName());
			out.println("</a></div></td></tr></table>");
		}
	}
	}
    %>
    </td>
  </tr>
  <%
  } 
  %>
</table>
</div>
<input type="submit" value="" style="border : 0px solid;height : 0px;width : 0px;display:none;">
</form>
</body>
</html>
