<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
<%@ page import="egovframework.com.uss.ion.bnt.service.BndtManageVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%

/**
 * @Class Name : EgovMtgPlaceManageList.java
 * @Description : EgovMtgPlaceManageList jsp
 * @Modification Information
 * @
 * @  수정일                    수정자                수정내용
 * @ ---------     --------    ---------------------------
 * @ 2010.06.29    이      용                최초 생성
 *
 *  @author 이      용
 *  @since 2010.06.29
 *  @version 1.0
 *  @see
 *
 *  Copyright (C) 2009 by MOPAS  All right reserved.
 */

 java.util.Calendar cal = java.util.Calendar.getInstance();
 String sImgUrl = "/images/egovframework/com/cmm/";
 String sCssUrl = "/css/egovframework/com/";

 String strYear  = request.getParameter("year");
 String strMonth = request.getParameter("month");
 
 int year  = cal.get(java.util.Calendar.YEAR);
 int month = cal.get(java.util.Calendar.MONTH);
 int date  = cal.get(java.util.Calendar.DATE);

 if(strYear != null && strMonth != null)
 {
   year  = Integer.parseInt(strYear);
   month = Integer.parseInt(strMonth);
 }else{

 }
  
 //년도/월 셋팅
 cal.set(year, month, 1);

 int startDay = cal.getMinimum(java.util.Calendar.DATE);
 int endDay   = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
 int start    = cal.get(java.util.Calendar.DAY_OF_WEEK);
 int newLine  = 0;



%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>당직  목록</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css'    />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<script type="text/javaScript" language="javascript" defer="defer">
<!--
	/*설명 : 당직  목록 조회 */
	function fncSelectBndtManageList(){
	    document.location.href = "/uss/ion/bnt/EgovBndtManageList.do?year=<%=year%>&amp;month=<%=month%>";
	    //document.listForm.submit();
	}

	/*설명 : 당직 상세조회 */
	function fncSelectBndtManage(bndtDe,bndtId) {
	    document.listForm.bndtId.value = bndtId;
	    document.listForm.bndtDe.value = bndtDe;
	    document.listForm.action = "<c:url value='/uss/ion/bnt/EgovBndtManageDetail.do'/>";
	    document.listForm.submit();
	}
	/*설명 : 당직 신규등록 화면 호출 */
	function fncInsertBndtManage(bndtDe) {
	    document.listForm.bndtDe.value = bndtDe;
	    document.listForm.action = "<c:url value='/uss/ion/bnt/EgovBndtManageRegist.do'/>";
	    document.listForm.submit();
	}


	/*설명 : 당직일지 등록 /상세 화면 호출 */
	function fncSelectBndtDiary(bndtDe,bndtId, cmd) {
	    document.listForm.cmd.value = cmd;
		document.listForm.bndtId.value = bndtId;
	    document.listForm.bndtDe.value = bndtDe;
	    document.listForm.action = "<c:url value='/uss/ion/bnt/selectBndtDiary.do'/>";
	    document.listForm.submit();
	}

	/*설명 : 당직 엑셀등록 PopUp 화면 호출	 */
	function fncBndtManageBnde() {

		var varForm	   = document.all["listForm"];
		var openParam  = "left=10, top=0, width=750, height=500, scrollbars=1";
		var myWin      = window.open("about:blank","winName",openParam);
		varForm.method = "post";
		varForm.action = "<c:url value='/uss/ion/bnt/EgovBndtManageListPop.do'/>";
		varForm.target = "winName";
		varForm.submit();
		/*
		var arrParam = new Array(6);
		arrParam[0] = window;
		arrParam[1] = '당직 대상자';
	 	window.showModalDialog("/uss/ion/bnt/EgovBndtManageListPop.do", arrParam,"dialogWidth=750px;dialogHeight=500px;resizable=yes;center=yes");
        */


		}


-->
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
</head>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<div id="border" style="width:730px">
<table border="0">
  <tr>
    <td width="700">
<!-- ********** 여기서 부터 본문 내용 *************** -->



<form name="listForm" id="listForm" action="#LINK" method="post">
<div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div>
<input type="hidden" name="cmd" >
<input type="hidden" name="bndtDe" value ="<c:out value='${bndtManageVO.bndtDe}'/>">
<input type="hidden" name="bndtId" value ="<c:out value='${bndtManageVO.bndtId  }'/>"/>


<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="30%"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;당직관리 목록</h1></td>
  <td width="60%">&nbsp;</td>
  <th width="10%" align="right">
  </th>
 </tr>
</table>


<DIV id="content" style="width:712px;">
<!-- 날짜 네비게이션  -->
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
		<td width="200px" align="right"><font size='3'><b>당직년월</b></font></td>
		<td>
			<table>
			<tr>
			<td width="20" align="center">&nbsp;</td>
			<td width="100" align="center">
			<a href="#LINK" onClick="location.href='/uss/ion/bnt/EgovBndtManageList.do?year=<%=year-1%>&amp;month=<%=month%>'"><img src="<%=sImgUrl %>icon/icoPrev.gif" alt="연도 이전" style="margin-right:4px;border:0px;"></a>
			<font size='3'><b><%=year%>년</b></font>
			<a href="#LINK" onClick="location.href='/uss/ion/bnt/EgovBndtManageList.do?year=<%=year+1%>&amp;month=<%=month%>'"><img src="<%=sImgUrl %>icon/icoNxt.gif"  alt="연도 이후" style="margin-left:4px;border:0px;"></a>
			</td>
			<td width="100" align="center">
			<%if(month > 0 ){ %>
			<a href="#LINK" onClick="location.href='/uss/ion/bnt/EgovBndtManageList.do?year=<%=year%>&amp;month=<%=month-1%>'"><img src="<%=sImgUrl %>icon/icoPrev.gif" alt="월 이전" style="margin-right:4px;border:0px;"></a>
			<%}%>
			<font size='3'><b><%=month+1%>월</b></font>
			<%if(month < 11 ){ %>
			<a href="#LINK" onClick="location.href='/uss/ion/bnt/EgovBndtManageList.do?year=<%=year%>&amp;month=<%=month+1%>'"><img src="<%=sImgUrl %>icon/icoNxt.gif"  alt="월 이후" style="margin-left:4px;border:0px;"></a>
			<%}%>
			</td>
			</tr>
			</table>
		</td>
		<td width="200">
		<span class="button"><a href="/uss/ion/bnt/EgovBndtManageListPop.do" target="_blank" title="새 창으로 이동" onclick="fncBndtManageBnde(); return false;">당직엑셀등록</a></span>
		</td>
	</tr>
	</table>

</td>
</tr>
</table>
<br>
<table border="0" cellspacing="1" cellpadding="1" bgcolor="#FFFFFF" summary="당직 목록" >
<caption>당직 목록</caption>
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
List<BndtManageVO> listResult = (List)request.getAttribute("bndtManageList");
//List listResult = (List)request.getAttribute("bndtManageList");
//EgovMap egovMap = new EgovMap();
int iBndtDe    = 0;
int iBndtCnt   = 0;
int iDiaryCnt  = 0;
//처음 빈공란 표시
for(int index = 1; index < start ; index++ )
{
  out.println("<TD >&nbsp;</TD>");
  newLine++;
}

for(int index = 1; index <= endDay; index++)
{
	iBndtCnt   = 0;
	String color = "";

	if(newLine == 0){			color = "RED";
	}else if(newLine == 6){ 	color = "#529dbc";
	}else{						color = "BLACK"; };

	String sUseDate = Integer.toString(year);

	sUseDate += Integer.toString(month+1).length() == 1 ? "0" + Integer.toString(month+1) : Integer.toString(month+1);
	sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index) : Integer.toString(index);
	int iUseDate = Integer.parseInt(sUseDate);

	out.println("<TD valign='top' align='left' height='92px' bgcolor='#EFEFEF' nowrap>");
	out.println("<font color='"+color+"'><b>"+index+"</b></font>");
	out.println("<BR>");
	/*
	out.println(iUseDate);
	out.println("<BR>");
	*/
	if(listResult != null ){
		for(int i=0;i < listResult.size(); i++){
			BndtManageVO egovMap = listResult.get(i);
			iBndtDe = Integer.parseInt(((String)egovMap.getBndtDe()).substring(0, 8));
			if(iUseDate ==  iBndtDe){
				out.print("<table><tr><td nowrap><div class='divDotText' style='width:92px;border:solid 0px;'>당직자:<a href='#LINK' onclick=\"fncSelectBndtManage('" + (String)egovMap.getBndtDe() + "','"+ (String)egovMap.getBndtId() +"')\">");
				out.print((String)egovMap.getBndtTemp1());
				out.println("</a></div></td></tr><tr><td>&nbsp;</td></tr>");
/*
				out.print("<table><tr><td nowrap><div class='divDotText' style='width:92px;border:solid 0px;'>당직자:");
				out.print("<form id='selectForm' name='selectForm' action='/uss/bnt/ans/EgovBndtManageRegist.do' method='post'>");
				out.print("<input type='hidden' name='bndtDe'       value='" + (String)egovMap.getBndtDe() + "'>");
				out.print("<input type='hidden' name='bndtId'       value='"+ (String)egovMap.getBndtId() +"'>");
				out.print("<span class='button'><input type='submit' value='"+(String)egovMap.getBndtTemp1()+"' onclick='fncSelectAnnvrsryManage(); return false;'></span></form>");
				out.println("</div></td></tr><tr><td>&nbsp;</td></tr>");*/
				iDiaryCnt = Integer.parseInt((String)egovMap.getBndtTemp2());


				/*설명 : 당직 신규등록 화면 호출
				function fncInsertBndtManage(bndtDe) {
				    document.listForm.bndtDe.value = bndtDe;
				    document.listForm.action = "<c:url value='/uss/ion/bnt/EgovBndtManageRegist.do'/>";
				    document.listForm.submit();
				}
				*/

				/*설명 : 당직일지 등록 /상세 화면 호출
				function fncSelectBndtDiary(bndtDe,bndtId, cmd) {
				    document.listForm.cmd.value = cmd;
					document.listForm.bndtId.value = bndtId;
				    document.listForm.bndtDe.value = bndtDe;
				    document.listForm.action = "<c:url value='/uss/ion/bnt/selectBndtDiary.do'/>";
				    document.listForm.submit();
				}

				*/


				if(iDiaryCnt > 0 ){
					out.print("<tr><td nowrap><div class='divDotText' style='width:92px;border:solid 0px;'><a href='#LINK' onclick=\"fncSelectBndtDiary('" + (String)egovMap.getBndtDe() + "','"+ (String)egovMap.getBndtId() +"','detail')\">");
					out.print("작성완료");
					out.println("</a></div></td></tr>");
				}else{
					out.print("<tr><td nowrap><div class='divDotText' style='width:92px;border:solid 0px;'>일지:");
					out.print("<span class='button'><a href='#LINK' onclick=\"fncSelectBndtDiary('" + sUseDate + "','"+ (String)egovMap.getBndtId() +"','insert')\">등록</a></span>");
					out.println("</div></td></tr>");
				}
				out.println("</table>");
				iBndtCnt++;
			}
		}
	}
	if(	iBndtCnt == 0){
		out.print("<table><tr><td nowrap>당직자:");
		out.print("<span class='button'><a href='#LINK' onclick=\"fncInsertBndtManage('" +sUseDate+ "')\">등록</a></span>");
		out.println("</td></tr><tr><td>&nbsp;</td></tr>");
		out.print("<tr><td nowrap><div class='divDotText' style='width:92px;border:solid 0px;'>");
		out.print("일지: 미등록");
		out.println("</div></td></tr></table>");
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
</tr>

</tbody>
</table>
</DIV>
</form>

</td>
</tr>
</table>
</div>

</BODY>
</HTML>
