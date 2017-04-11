<%--
/**
 * @Class Name  : EgovLeaderSchdulMonthList.java
 * @Description : EgovLeaderSchdulMonthList jsp
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

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="egovframework.com.cop.smt.lsm.service.LeaderSchdulVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
java.util.Calendar cal = java.util.Calendar.getInstance();
String sImgUrl = "/images/egovframework/com/cop/smt/lsm/";
String sCssUrl = "/css/egovframework/com/cop/smt/lsm/";

String strYear = request.getParameter("year");
String strMonth = request.getParameter("month");

int year = cal.get(java.util.Calendar.YEAR);
int month = cal.get(java.util.Calendar.MONTH);
int date = cal.get(java.util.Calendar.DATE);

if(strYear != null && !strYear.equals(""))
{
  year = Integer.parseInt(strYear);
  month = Integer.parseInt(strMonth);
}else{
	
}
//년도/월 셋팅
cal.set(year, month, 1);

int startDay = cal.getMinimum(java.util.Calendar.DATE);
int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
int newLine = 0;



%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/cop/smt/lsm/body.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javaScript" language="javascript">

	var gOpener = parent.document.all? parent.document.leaderSchdulVO : parent.document.getElementById("leaderSchdulVO") ;
	/* ********************************************************
	* 간부일정 등록
	******************************************************** */
	function fn_egov_regist_LeaderSchdul(sDate){
	
		gOpener.schdulBgnDe.value = sDate;
		gOpener.schdulEndDe.value = sDate;
		gOpener.year.value = "<%=year%>";
		gOpener.month.value = "<%=month%>";
		gOpener.searchMode.value = "MONTH";
		gOpener.action = '<c:url value="/cop/smt/lsm/mng/addLeaderSchdul.do"/>';
		gOpener.submit();
	}


	/* ********************************************************
	* 간부일정 상세보기
	******************************************************** */
	function fn_egov_detail_LeaderSchdul(schdulId, schdulDe){

		gOpener.schdulId.value = schdulId;
	//alert(gOpener.schdulId.value);
		gOpener.schdulDe.value = schdulDe;
	//alert(gOpener.schdulDe.value);
		gOpener.year.value = "<%=year%>";
		gOpener.month.value = "<%=month%>";
	//alert(year+month);
		gOpener.searchMode.value = "MONTH";
	//alert("1111");
		gOpener.action = "<c:url value='/cop/smt/lsm/usr/selectLeaderSchdul.do' />";
		gOpener.submit();
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

		location.href="<c:url value='/cop/smt/lsm/usr/selectLeaderSchdulMonthList.do' />?year=<%=year%>&month=<%=month%>&searchCondition=SCHDUL_SE&searchKeyword=" + setValue;

	}

	function fnEgovSchdulSelect() {

		var schdulSe = document.leaderSchdulVO.schdulSe.options[document.leaderSchdulVO.schdulSe.selectedIndex].value;
		var leaderName = document.leaderSchdulVO.leaderName.value;

		var newLocation = "<c:url value='/cop/smt/lsm/usr/selectLeaderSchdulMonthList.do' />?year=<%=year%>&month=<%=month%>&searchCondition=LEADER_ID&searchKeyword=";
		newLocation += schdulSe;
		newLocation += "&searchKeywordEx=";
		newLocation += leaderName;

		document.leaderSchdulVO.action = newLocation;
		document.leaderSchdulVO.submit();

	}
	
	window.onload = function(){
		do_resize();
	}
	
</script>
<title>월별 간부일정 조회</title>
</head>
<body> 
<form name="leaderSchdulVO" id="leaderSchdulVO" action="<c:url value='/cop/smt/lsm/usr/selectLeaderSchdulMonthList.do' />?year=<%=year%>&month=<%=month%>&searchCondition=LEADER_ID" method="post" target="_self">
<div id="content" style="width:712px;">
<!-- 날짜 네비게이션  -->
<table width="100%" border="0" cellspacing="1" cellpadding="1" id="KOO" bgcolor="#F3F9D7" style="border:1px solid #CED99C" summary="이표는 간부일정의 일정구분, 간부 조회조건과 날짜 네비게이션을 제공합니다.">	
<caption>월별간부일정목록 조회조건</caption>
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
		
		
		<td width="180px">
			<label for="leaderName">간부명 : </label>
			<input type="text" name="leaderName" id="leaderName" size="10" maxlength="10" title="간부명" value="<c:out value='${searchKeywordEx}'/>" onkeypress="press(event);" >
		</td>
		<td>
			<span class="button"><input type="submit" value="조회" onclick="fnEgovSchdulSelect(); return false;"></span>
		</td>
		<td width="0px">
		</td>
		<td>
			<table>
				<tr>
					<td width="110" align="center">
						<a href="<c:url value='/cop/smt/lsm/usr/selectLeaderSchdulMonthList.do'/>?year=<%=year-1%>&amp;month=<%=month%>" target="_self">
							<img src="<c:url value='/images/egovframework/com/cmm/icon/icoPrev.gif'/>" style="margin-right:4px;border:0px;" alt="이전년도" />
						</a>
						<font size="3"><b><%=year%>년</b></font>
						<a href="<c:url value='/cop/smt/lsm/usr/selectLeaderSchdulMonthList.do'/>?year=<%=year+1%>&amp;month=<%=month%>" target="_self">
							<img src="<c:url value='/images/egovframework/com/cmm/icon/icoNxt.gif'/>" style="margin-left:4px;border:0px;" alt="다음년도"/>
						</a>
					</td>
					<td width="100" align="center">
						<%if(month > 0 ){ %>
							<a href="<c:url value='/cop/smt/lsm/usr/selectLeaderSchdulMonthList.do'/>?year=<%=year%>&amp;month=<%=month-1%>" target="_self">
								<img src="<c:url value='/images/egovframework/com/cmm/icon/icoPrev.gif'/>" style="margin-right:4px;border:0px;" alt="이전월">
							</a>
						<%}%>
						<font size='3'><b><%=month+1%>월</b></font>
						<%if(month < 11 ){ %>
							<a href="<c:url value='/cop/smt/lsm/usr/selectLeaderSchdulMonthList.do'/>?year=<%=year%>&amp;month=<%=month+1%>" target="_self">
								<img src="<c:url value='/images/egovframework/com/cmm/icon/icoNxt.gif'/>" style="margin-left:4px;border:0px;" alt="다음월"></a>
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
<table border="0" cellspacing="1" cellpadding="1" bgcolor="#FFFFFF" summary="이 표는 월별 간부일정 목록을 제공하며, 해당일자의 일정명 정보를 제공합니다.">
<caption>월별간부일정목록</caption>
<thead>
<tr bgcolor="#CECECE">
	<th scope="col" width='100px'>
	<div align="center"><font color="red">일</font></div>
	</th>
	<th scope="col" width='100px'>
	<div align="center">월</div>
	</th>
	<th scope="col" width='100px'>
	<div align="center">화</div>
	</th>
	<th scope="col" width='100px'>
	<div align="center">수</div>
	</th>
	<th scope="col" width='100px'>
	<div align="center">목</div>
	</th>
	<th scope="col" width='100px'>
	<div align="center">금</div>
	</th>
	<th scope="col" width='100px'>
	<div align="center"><font color="#529dbc">토</font></div>
	</th>
</tr>
</thead>
<tbody>
<tr style='border:#000000'>
<%

List<LeaderSchdulVO> listResult = (List<LeaderSchdulVO>)request.getAttribute("resultList");
LeaderSchdulVO leaderSchdulVO = new LeaderSchdulVO();
//처음 빈공란 표시
for(int index = 1; index < start ; index++ )
{
  out.println("<td >&nbsp;</td>");
  newLine++;
}

for(int index = 1; index <= endDay; index++)
{
	String color = "";
	
	if(newLine == 0){			color = "red";
	}else if(newLine == 6){ 	color = "#529dbc";
	}else{						color = "black"; };
	
	String sUseDate = Integer.toString(year);
	
	sUseDate += Integer.toString(month+1).length() == 1 ? "0" + Integer.toString(month+1) : Integer.toString(month+1); 
	sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index) : Integer.toString(index);
	
	int iUseDate = Integer.parseInt(sUseDate);

	out.println("<td valign='top' align='left' height='92px' bgcolor='#EFEFEF' nowrap>");
	//out.println("<a href=\"<c:url value='/cop/smt/lsm/mng/addLeaderSchdul.do' />?schdulBgnDe='+iUseDate+'&amp;schdulEndDe='+iUseDate+'&amp;searchMode=MONTH&amp;year=' + year + '&amp;month=' + month + '\' target=\"_parent\" onClick=\"JavaScript:fn_egov_regist_LeaderSchdul('"+iUseDate+"');\"><font color='"+color+"' style=\"font-size: 9pt;font-weight : bold\">"+index+"</font></a>");
%>	
	<a href="<c:url value='/cop/smt/lsm/mng/addLeaderSchdul.do' />?schdulBgnDe=<%=iUseDate%>&amp;schdulEndDe=<%=iUseDate%>&amp;searchMode=MONTH&amp;year=<%=year%>&amp;month=<%=month%>" target="_parent" onClick="JavaScript:fn_egov_regist_LeaderSchdul('<%=iUseDate%>');"><font color="<%=color%>" style="font-size: 9pt;font-weight : bold"><%=index%></font></a>
<%	
	out.println("<br>");
	/*
	out.println(iUseDate);
	out.println("<BR>");
	*/ 
	
	if(listResult != null){

		for(int i=0;i < listResult.size(); i++){
			leaderSchdulVO = (LeaderSchdulVO)listResult.get(i);
			
			//2010.10.27 3차 보안 점검 조치 사항 반영
			String schdulId = (String)leaderSchdulVO.getSchdulId();
			if(schdulId != null){
				schdulId = schdulId.replaceAll("<","&lt;");
				schdulId = schdulId.replaceAll(">","&gt;");
			}else{
				schdulId = "";
			}
			
			int iSchdulDate = Integer.parseInt(((String)leaderSchdulVO.getSchdulDe()).substring(0, 8));
			
			//if(iBeginDate >= iUseDate && iUseDate <= iBeginEnd){
			if(iUseDate == iSchdulDate){
//				out.print("<table><tr><td nowrap><div class='divDotText' style='width:92px;border:solid 0px;'><a href=\"<c:url value="/cop/smt/lsm/usr/selectLeaderSchdul.do' />?schdulId=' + (String)leaderSchdulVO.getSchdulId() + '&amp;schdulDe=' + iUseDate + '&amp;searchMode=MONTH&amp;year=' + year + '&amp;month=' + month + '\" target=\"_parent\" onClick=\"JavaScript:fn_egov_detail_LeaderSchdul('" + (String)leaderSchdulVO.getSchdulId() + "', '" + iUseDate + "')\">");
				//out.print("[" + (String)leaderSchdulVO.getLeaderName() + "]");
//				out.print("<font style='font-weight : solid'>");
//				out.print((String)leaderSchdulVO.getSchdulNm());
//				out.print("</font>");
//				out.println("</a></div></td></tr></table>");
%>
				<table>
					<tr>
						<td nowrap>
							<div class='divDotText' style='width:92px;border:solid 0px;'>
								<a href="<c:url value='/cop/smt/lsm/usr/selectLeaderSchdul.do' />?schdulId=<%=schdulId%>&amp;schdulDe=<%=iUseDate%>&amp;searchMode=MONTH&amp;year=<%=year%>&amp;month=<%=month%>" target="_parent" onClick="JavaScript:fn_egov_detail_LeaderSchdul('<%=schdulId %>', '<%=iUseDate%>')">
									<font style="font-weight : solid"><%=(String)leaderSchdulVO.getSchdulNm()%></font>
								</a>
							</div>
						</td>
					</tr>
				</table>
<%
			}
	
	
		}
	}

	out.println("</td>");
	newLine++;
	
	if(newLine == 7)
	{
	  out.println("</tr>");
	  if(index <= endDay)
	  {
	    out.println("<tr style='border:#000000'>");
	  }
	  newLine=0;
	}
}
//마지막 공란 LOOP
while(newLine > 0 && newLine < 7)
{
  out.println("<td>&nbsp;</td>");
  newLine++;
}
%>
</tr> 
</tbody>
</table>
</div>
<input type="submit" value="" style="border : 0px solid;height : 0px;width : 0px;display:none;">
</form>
</body>
</html>
