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
Calendar calNow = Calendar.getInstance();
Calendar calBefore = Calendar.getInstance();
Calendar calNext = Calendar.getInstance();

String sImgUrl = "/images/egovframework/com/cop/smt/sdm/";
String sCssUrl = "/css/egovframework/com/cop/smt/sdm/";

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
<html lang="ko">
<HEAD>
	<TITLE>주간 부서일정관리</TITLE>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<script type="text/javaScript" language="javascript">

	var gOpener = parent.document.all? parent.document.deptSchdulManageVO : parent.document.getElementById("deptSchdulManageVO") ;
	/* ********************************************************
	* 주관 부서 팝업창열기
	******************************************************** */
	function fn_egov_regist_DeptSchdulManage(sDate){

		gOpener.schdulBgnde.value = sDate;
		gOpener.schdulEndde.value = sDate;
		gOpener.action = "<c:url value='/cop/smt/sdm/EgovDeptSchdulManageRegist.do' />";
		gOpener.submit();
	}


	/* ********************************************************
	* 주관 부서 팝업창열기
	******************************************************** */
	function fn_egov_detail_DeptSchdulManage(schdulId){

		gOpener.schdulId.value = schdulId;
		gOpener.action = "<c:url value='/cop/smt/sdm/EgovDeptSchdulManageDetail.do' />";
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

		location.href="<c:url value='/cop/smt/sdm/EgovDeptSchdulManageWeekList.do' />?year=<%=iNowYear%>&month=<%=iNowMonth%>&week=<%=iNowWeek%>&searchCondition=SCHDUL_SE&searchKeyword=" + setValue;
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
			<a href="<c:url value='/cop/smt/sdm/EgovDeptSchdulManageWeekList.do' />?year=<%=iNowYear-1%>&amp;month=<%=iNowMonth%>&amp;week=<%=iNowWeek%>">
			<img src="<c:url value='/images/egovframework/com/cmm/icon/icoPrev.gif' />" align="middle" style="margin-right:4px;border:0px;" alt="이전으로가기아이콘표시">
			</a>
			<%=iNowYear%>년
			<a href="<c:url value='/cop/smt/sdm/EgovDeptSchdulManageWeekList.do' />?year=<%=iNowYear+1%>&amp;month=<%=iNowMonth%>&amp;week=<%=iNowWeek%>">
			<img src="<c:url value='/images/egovframework/com/cmm/icon/icoNxt.gif' />" align="middle" style="margin-left:4px;border:0px;" alt="다음으로가기아이콘표시">
			</a>
			</td>
			<td width="80" align="center">
			<%if(iNowMonth > 0 ){ %>
			<a href="<c:url value='/cop/smt/sdm/EgovDeptSchdulManageWeekList.do' />?year=<%=iNowYear%>&amp;month=<%=iNowMonth-1%>&amp;week=<%=iNowWeek%>">
			<img src="<c:url value='/images/egovframework/com/cmm/icon/icoPrev.gif' />" align="middle" style="margin-right:4px;border:0px;" alt="이전으로가기아이콘표시">
			</a>
			<%}%>
			<%=iNowMonth+1%>월
			<%if(iNowMonth < 11 ){ %>
			<a href="<c:url value='/cop/smt/sdm/EgovDeptSchdulManageWeekList.do' />?year=<%=iNowYear%>&amp;month=<%=iNowMonth+1%>&amp;week=<%=iNowWeek%>">
			<img src="<c:url value='/images/egovframework/com/cmm/icon/icoNxt.gif' />" align="middle" style="margin-left:4px;border:0px;" alt="다음으로가기아이콘표시">
			</a>
			<%}%>
			</td>
			<td width="80" align="center">
			<%if(iNowWeek > 0 ){ %>
			<a href="<c:url value='/cop/smt/sdm/EgovDeptSchdulManageWeekList.do' />?year=<%=iNowYear%>&amp;month=<%=iNowMonth%>&amp;week=<%=iNowWeek-1%>">
			<img src="<c:url value='/images/egovframework/com/cmm/icon/icoPrev.gif' />" align="middle" style="margin-right:4px;border:0px;" alt="이전으로가기아이콘표시">
			</a>
			<%}%>
			<%=iNowWeek+1%>주
			<%if(iNowWeek < listWeekGrop.size()-1 ){ %>
			<a href="<c:url value='/cop/smt/sdm/EgovDeptSchdulManageWeekList.do' />?year=<%=iNowYear%>&amp;month=<%=iNowMonth%>&amp;week=<%=iNowWeek+1%>">
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


<table width="100%"  border="0" cellpadding="1" cellspacing="1" bgcolor="#828486" >
 <tr>
   <td width="150px" bgcolor="#E0E0E0" align="center" height="30px">날짜</td>
		<td width="120px" bgcolor="E0E0E0" align="center">시간</td>
		<td bgcolor="#E0E0E0" align="center">제목</td>
		<td width="100px" bgcolor="#E0E0E0" align="center">담당자</td>
	</tr>
<%
List listResult = (List)request.getAttribute("resultList");
EgovMap egovMap = new EgovMap();

for(int i=0; i < listWeek.size(); i++){

	String sTmpDate = (String)listWeek.get(i);
	int iUseDate = Integer.parseInt(sTmpDate);

%>
  <tr>
    <td bgcolor="#F5F5F5" align="center" valign="middle" height="50px">
		    <%=sTmpDate.substring(0,4)%>년<%=sTmpDate.substring(4,6)%>월<%=sTmpDate.substring(6,8)%>일  <%=arrDateTitle[i] %>
    </td>
    <td bgcolor="#FFFFFF"  valign="middle" align="center" style="padding-left:2px;">
    <%
    if(listResult != null){

	for(int j=0;j < listResult.size(); j++){
		egovMap = (EgovMap)listResult.get(j);
		int iBeginDate = Integer.parseInt( ((String)egovMap.get("schdulBgnde")).substring(0, 8) );
		int iBeginEnd = Integer.parseInt( ((String)egovMap.get("schdulEndde")).substring(0, 8) );

		if(iUseDate >= iBeginDate && iUseDate <= iBeginEnd){
		out.print("<table><tr><td nowrap><div class='divDotText' style='width:120px;border:solid 0px;'><a href=\"JavaScript:fn_egov_detail_DeptSchdulManage('" + (String)egovMap.get("schdulId") + "')\">");
		out.print( ((String)egovMap.get("schdulBgnde")).substring(8,10) +"시");
		out.print( ((String)egovMap.get("schdulBgnde")).substring(10,12) +"분~");
		out.print( ((String)egovMap.get("schdulEndde")).substring(8,10) +"시");
		out.print( ((String)egovMap.get("schdulEndde")).substring(10,12) +"분 ");
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
		egovMap = (EgovMap)listResult.get(j);
		int iBeginDate = Integer.parseInt(((String)egovMap.get("schdulBgnde")).substring(0, 8));
		int iBeginEnd = Integer.parseInt(((String)egovMap.get("schdulEndde")).substring(0, 8));
		if(iUseDate >= iBeginDate && iUseDate <= iBeginEnd){
		out.print("<table><tr><td nowrap><div class='divDotText' style='width:350px;border:solid 0px;'><a href=\"JavaScript:fn_egov_detail_DeptSchdulManage('" + (String)egovMap.get("schdulId") + "')\">");
		out.print((String)egovMap.get("schdulNm"));
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
		egovMap = (EgovMap)listResult.get(j);
		int iBeginDate = Integer.parseInt(((String)egovMap.get("schdulBgnde")).substring(0, 8));
		int iBeginEnd = Integer.parseInt(((String)egovMap.get("schdulEndde")).substring(0, 8));
		if(iUseDate >= iBeginDate && iUseDate <= iBeginEnd){
		out.print("<table><tr><td nowrap><div>");
		out.print((String)egovMap.get("schdulChargerName"));
		out.println("</div></td></tr></table>");
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
</DIV>
</form>
</BODY>
</HTML>
