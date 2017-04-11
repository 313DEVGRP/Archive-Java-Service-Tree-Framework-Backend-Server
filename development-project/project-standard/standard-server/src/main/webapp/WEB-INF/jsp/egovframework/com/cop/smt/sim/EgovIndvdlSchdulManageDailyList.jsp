<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap"%>
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

String sImgUrl = "/images/egovframework/com/cmm/";
String sCssUrl = "/css/egovframework/com/cmm/";

int iNowYear = (Integer)request.getAttribute("year");
int iNowMonth = (Integer)request.getAttribute("month");
int iNowDay = (Integer)request.getAttribute("day");


java.util.Calendar cal = java.util.Calendar.getInstance();
//년도/월 셋팅
cal.set(iNowYear, iNowMonth, 1);

int iEndDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
%>

<html lang="ko">
<HEAD>
	<TITLE>일정관리</TITLE>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" >
	<script type="text/javaScript" language="javascript">

	var gOpener = parent.document.all? parent.document.IndvdlSchdulManageVO : parent.document.getElementById("IndvdlSchdulManageVO") ;
	/* ********************************************************
	* 주관 부서 팝업창열기
	******************************************************** */
	function fn_egov_regist_DeptSchdulManage(sDate){

		gOpener.schdulBgnde.value = sDate;
		gOpener.schdulEndde.value = sDate;
		gOpener.action = "<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageRegist.do' />";
		gOpener.submit();
	}


	/* ********************************************************
	* 주관 부서 팝업창열기
	******************************************************** */
	function fn_egov_detail_DeptSchdulManage(schdulId){

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

		location.href="<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageDailyList.do' />?year=<%=iNowYear%>&month=<%=iNowMonth%>&day=<%=iNowDay%>&searchCondition=SCHDUL_SE&searchKeyword=" + setValue;
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
<form name="deptSchdulManageVO" id="deptSchdulManageVO" action="" method="post">
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
			<a href="<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageDailyList.do' />?year=<%=iNowYear-1%>&amp;month=<%=iNowMonth%>&amp;day=<%=iNowDay%>">
			<img src="<c:url value='/images/egovframework/com/cmm/icon/icoPrev.gif' />" align="middle" style="margin-right:4px;border:0px;" alt="이전으로가기아이콘표시">
			</a>
			<%=iNowYear%>년
			<a href="<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageDailyList.do' />?year=<%=iNowYear+1%>&amp;month=<%=iNowMonth%>&amp;day=<%=iNowDay%>">
			<img src="<c:url value='/images/egovframework/com/cmm/icon/icoNxt.gif' />" align="middle" style="margin-left:4px;border:0px;" alt="다음으로가기아이콘표시">
			</a>
			</td>
			<td width="80" align="center">
			<%if(iNowMonth > 0 ){ %>
			<a href="<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageDailyList.do' />?year=<%=iNowYear%>&amp;month=<%=iNowMonth-1%>&amp;day=<%=iNowDay%>">
			<img src="<c:url value='/images/egovframework/com/cmm/icon/icoPrev.gif' />" align="middle" style="margin-right:4px;border:0px;" alt="이전으로가기아이콘표시">
			</a>
			<%}%>
			<%=iNowMonth+1%>월
			<%if(iNowMonth < 11 ){ %>
			<a href="<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageDailyList.do' />?year=<%=iNowYear%>&amp;month=<%=iNowMonth+1%>&amp;day=<%=iNowDay%>">
			<img src="<c:url value='/images/egovframework/com/cmm/icon/icoNxt.gif' />" align="middle" style="margin-left:4px;border:0px;" alt="다음으로가기아이콘표시">
			</a>
			<%}%>
			</td>
			<td width="80" align="center">
			<%if(iNowDay > 1 ){ %>
			<a href="<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageDailyList.do' />?year=<%=iNowYear%>&amp;month=<%=iNowMonth%>&amp;day=<%=iNowDay-1%>">
			<img src="<c:url value='/images/egovframework/com/cmm/icon/icoPrev.gif' />" align="middle" style="margin-right:4px;border:0px;" alt="이전으로가기아이콘표시">
			</a>
			<%}%>
			<%=iNowDay%>일
			<%if(iNowDay < iEndDay ){ %>
			<a href="<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageDailyList.do' />?year=<%=iNowYear%>&amp;month=<%=iNowMonth%>&amp;day=<%=iNowDay+1%>">
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

<table width="100%"  border="0" cellpadding="1" cellspacing="1" bgcolor="#828486" style="font-size:8px;font-weight: bold;">
 <tr>
		<td width="120px" bgcolor="E0E0E0" align="center" height="30px" style="font-size:12px;font-weight: bold;">시간</td>
		<td bgcolor="#E0E0E0" align="center" style="font-size:12px;font-weight: bold;">제목</td>
		<td width="100px" bgcolor="#E0E0E0" align="center" style="font-size:12px;font-weight: bold;">담당자</td>
</tr>
<%

List listResult = (List)request.getAttribute("resultList");
EgovMap egovMap = new EgovMap();
if(listResult != null){
	for(int i=0;i < listResult.size(); i++){
	egovMap = (EgovMap)listResult.get(i);
%>
  <tr>
    <td bgcolor="#FFFFFF"  valign="middle" align="center" style="padding-left:2px;font-size:11px;" height="20px">
    <%
    //out.print("<a href=\"JavaScript:fn_egov_detail_DeptSchdulManage('" + (String)egovMap.get("schdulId") + "')\">");
    //out.print("<a href=\"<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageDetail.do' />?schdulId=" + (String)egovMap.get("schdulId") + "\" target=\"_top\">");
    %>
	<a href="<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageDetail.do' />?schdulId=<%=(String)egovMap.get("schdulId")%>" target="_parent">
	<%
	out.print( ((String)egovMap.get("schdulBgnde")).substring(8,10) +"시");
	out.print( ((String)egovMap.get("schdulBgnde")).substring(10,12) +"분~");
	out.print( ((String)egovMap.get("schdulEndde")).substring(8,10) +"시");
	out.print( ((String)egovMap.get("schdulEndde")).substring(10,12) +"분 ");
	out.println("</a>");
    %>
    </td>
    <td bgcolor="#FFFFFF"  valign="middle" style="padding-left:2px;font-size:11px;">
	<%
	//out.print("<a href=\"JavaScript:fn_egov_detail_DeptSchdulManage('" + (String)egovMap.get("schdulId") + "')\">");
    //out.print("<a href=\"JavaScript:fn_egov_detail_DeptSchdulManage('" + (String)egovMap.get("schdulId") + "')\">");
    %>
	<a href="<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageDetail.do' />?schdulId=<%=(String)egovMap.get("schdulId")%>" target="_parent">
	<%=(String)egovMap.get("schdulNm")%>
	</a>

    <td bgcolor="#FFFFFF"  valign="middle" align="center" style="padding-left:2px;font-size:11px;">
    	<%=(String)egovMap.get("schdulChargerName")%>
    </td>
  </tr>
 <%
	}
}
%>
</table>

</DIV>
</form>
</BODY>
</HTML>
