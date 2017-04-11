<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
java.util.Calendar cal = java.util.Calendar.getInstance();
String sImgUrl = "/images/egovframework/com/cop/smt/sim/";
String sCssUrl = "/css/egovframework/com/cop/smt/sim/";

String strYear = request.getParameter("year");
String strMonth = request.getParameter("month");

int year = cal.get(java.util.Calendar.YEAR);
int month = cal.get(java.util.Calendar.MONTH);
int date = cal.get(java.util.Calendar.DATE);

if(strYear != null)
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
<html lang="ko">
<HEAD>
	<TITLE>월간일정관리</TITLE>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">



	<script type="text/javaScript" language="javascript">

	var gOpener = parent.document.all? parent.document.IndvdlSchdulManageVO : parent.document.getElementById("IndvdlSchdulManageVO") ;
	/* ********************************************************
	* 주관 부서 팝업창열기
	******************************************************** */
	function fn_egov_regist_IndvdlSchdulManage(sDate){

		gOpener.schdulBgnde.value = sDate;
		gOpener.schdulEndde.value = sDate;
		gOpener.action = "<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageRegist.do' />";
		gOpener.submit();
	}


	/* ********************************************************
	* 주관 부서 팝업창열기
	******************************************************** */
	function fn_egov_detail_IndvdlSchdulManage(schdulId){

		gOpener.schdulId.value = schdulId;
		gOpener.action = "<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageDetail.do' />";
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

	function fnEgovSchdulSe(setValue) {

		location.href="<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageMonthList.do' />?year=<%=year%>&month=<%=month%>&searchCondition=SCHDUL_SE&searchKeyword=" + setValue;

	}
	window.onload = function(){
		do_resize();
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


		.divDotText {
		overflow:hidden;
		text-overflow:ellipsis;
		}

A:link { font-size:9pt; font-family:"돋움";color:#000000; text-decoration:none; }
A:visited { font-size:9pt; font-family:"돋움";color:#000000; text-decoration:none; }
A:active { font-size:9pt; font-family:"돋움";color:red; text-decoration:none; }
A:hover { font-size:9pt; font-family:"돋움";color:red;text-decoration:none;}


	</style>
</HEAD>
<BODY>
<form name="IndvdlSchdulManageVO" id="IndvdlSchdulManageVO" action="" method="post">
<DIV id="content" style="width:712px;">
<!--날짜 네비게이션  -->
<table width="100%" border="0" cellspacing="1" cellpadding="1" id="KOO" bgcolor="#F3F9D7" style="border:1px solid #CED99C">
<tr>
<td height="60">

	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="10">
		</td>
	</tr>
	<tr>
		<td width="10px"></td>
		<td width="200px">
    <td>
     	<select name="schdulSe" class="select" id="schdulSe" onChange="fnEgovSchdulSe(document.forms[0].schdulSe.options[document.forms[0].schdulSe.selectedIndex].value);" title="일정구분선택">
  		   <option selected value=''>-- 선택 --</option>
			<c:forEach var="result" items="${schdulSe}" varStatus="status">
				<option value='${result.code}' <c:if test="${searchKeyword == result.code}">selected</c:if>>${result.codeNm}</option>
			</c:forEach>
  		</select>

		</td>
		<td width="0px">
		</td>
		<td>
			<table>
			<tr>
			<td width="80" align="center">
			<a href="<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageMonthList.do' />?year=<%=year-1%>&amp;month=<%=month%>" target="_self">
				<img src="<c:url value='/images/egovframework/com/cmm/icon/icoPrev.gif' />" align="middle" style="margin-right:4px;border:0px;" alt="이전으로가기아이콘표시">
			</a>
			<%=year%>년
			<a href="<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageMonthList.do' />?year=<%=year+1%>&amp;month=<%=month%>" target="_self">
				<img src="<c:url value='/images/egovframework/com/cmm/icon/icoNxt.gif' />" align="middle" style="margin-left:4px;border:0px;" alt="다음으로가기아이콘표시">
			</a>
			</td>
			<td width="80" align="center">
			<%if(month > 0 ){ %>
			<a href="<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageMonthList.do' />?year=<%=year%>&amp;month=<%=month-1%>" target="_self">
				<img src="<c:url value='/images/egovframework/com/cmm/icon/icoPrev.gif' />" align="middle" style="margin-right:4px;border:0px;" alt="이전으로가기아이콘표시">
			</a>
			<%}%>
			<%=month+1%>월
			<%if(month < 11 ){ %>
			<a href="<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageMonthList.do' />?year=<%=year%>&amp;month=<%=month+1%>" target="_self">
				<img src="<c:url value='/images/egovframework/com/cmm/icon/icoNxt.gif' />" align="middle" style="margin-left:4px;border:0px;" alt="다음으로가기아이콘표시">
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
<br>
<table border="0" cellspacing="1" cellpadding="1" bgcolor="#FFFFFF">
<THEAD>
<TR bgcolor="#CECECE">
	<TD width='100px'>
	<DIV align="center"><font color="red">일</font></DIV>
	</TD>
	<TD width='100px'>
	<DIV align="center">월</DIV>
	</TD>
	<TD width='100px'>
	<DIV align="center">화</DIV>
	</TD>
	<TD width='100px'>
	<DIV align="center">수</DIV>
	</TD>
	<TD width='100px'>
	<DIV align="center">목</DIV>
	</TD>
	<TD width='100px'>
	<DIV align="center">금</DIV>
	</TD>
	<TD width='100px'>
	<DIV align="center"><font color="#529dbc">토</font></DIV>
	</TD>
</TR>
</THEAD>
<TBODY>
<TR>
<%

List listResult = (List)request.getAttribute("resultList");
EgovMap egovMap = new EgovMap();
//처음 빈공란 표시
for(int index = 1; index < start ; index++ )
{
  out.println("<TD >&nbsp;</TD>");
  newLine++;
}

for(int index = 1; index <= endDay; index++)
{
	String color = "";

	if(newLine == 0){			color = "RED";
	}else if(newLine == 6){ 	color = "#529dbc";
	}else{						color = "BLACK"; };

	String sUseDate = Integer.toString(year);

	sUseDate += Integer.toString(month+1).length() == 1 ? "0" + Integer.toString(month+1) : Integer.toString(month+1);
	sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index) : Integer.toString(index);

	int iUseDate = Integer.parseInt(sUseDate);

	out.println("<TD valign='top' align='left' height='92px' bgcolor='#EFEFEF' nowrap>");

	//out.println("<font color='"+color+"'><a href=\"JavaScript:fn_egov_regist_IndvdlSchdulManage('"+iUseDate+"');\">"+index+"</font></a>");
	//out.println("<font color='"+color+"'><a href=\"<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageRegist.do' />?schdulBgnde="+iUseDate+"&schdulEndde="+iUseDate+"\" target=\"_top\">"+index+"</font></a>");
	%>
	<font color='<%=color%>'><a href="<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageRegist.do' />?schdulBgnde=<%=iUseDate %>&amp;schdulEndde=<%=iUseDate%>" target="_parent">
		<%=index %></a>
	</font>

	<%
	out.println("<BR>");
	/*
	out.println(iUseDate);
	out.println("<BR>");
	*/

	if(listResult != null){

		for(int i=0;i < listResult.size(); i++){
			egovMap = (EgovMap)listResult.get(i);

			int iBeginDate = Integer.parseInt(((String)egovMap.get("schdulBgnde")).substring(0, 8));
			int iBeginEnd = Integer.parseInt(((String)egovMap.get("schdulEndde")).substring(0, 8));

			//if(iBeginDate >= iUseDate && iUseDate <= iBeginEnd){
			if(iUseDate >= iBeginDate && iUseDate <= iBeginEnd){
				//out.print("<table><tr><td nowrap><div class='divDotText' style='width:92px;border:solid 0px;'>");


				//out.print("<a href=\"JavaScript:fn_egov_detail_IndvdlSchdulManage('" + (String)egovMap.get("schdulId") + "')\">"); 원래있던 주석
				// 여기부터는 HTML로 바꾸면서 막은 주석
				//out.println("<a href=\"<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageDetail.do' />?schdulId="+(String)egovMap.get("schdulId")+"\" target=\"_top\">");
				//out.print((String)egovMap.get("schdulNm"));
				//out.println("</a></div></td></tr></table>");
				%>
				<table>
					<tr>
						<td nowrap>
							<div class='divDotText' style='width:92px;border:solid 0px;'>
								<a href="<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageDetail.do' />?schdulId=<%=(String)egovMap.get("schdulId")%>" target="_parent">
									<%=(String)egovMap.get("schdulNm") %>
								</a>
							</div>
						</td>
					</tr>
				</table>
				<%
				/*
				out.println(iBeginDate);
				out.println("<BR>");
				out.println(iBeginEnd);
				*/
			}


		}
	}

	out.println("</TD>");
	newLine++;

	if(newLine == 7)
	{
	  out.println("</TR>");
	  if(index <= endDay)
	  {
	    out.println("<TR>");
	  }
	  newLine=0;
	}
}
//마지막 공란 LOOP
while(newLine > 0 && newLine < 7)
{
  out.println("<TD>&nbsp;</TD>");
  newLine++;
}
%>
</TR>

</TBODY>
</TABLE>
</DIV>
</form>
</BODY>
</HTML>
