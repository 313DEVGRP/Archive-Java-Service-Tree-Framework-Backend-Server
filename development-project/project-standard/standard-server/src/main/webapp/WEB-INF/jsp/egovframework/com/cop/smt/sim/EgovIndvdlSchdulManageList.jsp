<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
  Class Name : EgovIndvdlSchdulManageList.jsp
  Description : 일정관리 월별/주간별/일별 조회
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2008.03.09    장동한          최초 생성

    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.09

--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ImgUrl" value="/images/egovframework/com/cmm/"/>
<c:set var="CssUrl" value="/css/egovframework/com/"/>

<html lang="ko">
<head>
<title>일정관리</title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>


<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='${CssUrl}com.css'/>">
<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 등록 처리 함수
 ******************************************************** */
function fnTabMenuSelect(objArr){


	var FLength = document.getElementsByName("tabMenu").length;


	for(var i=0; i < FLength; i++){
		if( i ==  objArr){
			document.getElementsByName("tabMenu")[i].bgColor = '#BBBBBB';
		}else{
			document.getElementsByName("tabMenu")[i].bgColor = '#DDDDDD';
		}
	}

	//경로 이동
	if(objArr == 0)
		document.getElementById('SchdulView').src="<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageMonthList.do' />";

	if(objArr == 1)
		document.getElementById('SchdulView').src="<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageWeekList.do' />";

	if(objArr == 2)
		document.getElementById('SchdulView').src="<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageDailyList.do' />";


}

/* ********************************************************
* 등록 처리 함수
******************************************************** */
function fnInit(){
	fnTabMenuSelect(0);
}


/* ********************************************************
* IFRAME AUTO HEIGHT
******************************************************** */
function do_resize() {
 resizeFrame("iframe_main",1);
}

function resizeFrame(ifr_id,re){
//가로길이는 유동적인 경우가 드물기 때문에 주석처리!
 var ifr= document.getElementById(ifr_id) ;
 var innerBody = ifr.contentWindow.document.body;
 var innerHeight = innerBody.scrollHeight + (innerBody.offsetHeight - innerBody.clientHeight);
 //var innerWidth = document.body.scrollWidth + (document.body.offsetWidth - document.body.clientWidth);

 if (ifr.style.height != innerHeight) //주석제거시 다음 구문으로 교체 -> if (ifr.style.height != innerHeight || ifr.style.width != innerWidth)
 {
  ifr.style.height = innerHeight;
  //ifr.style.width = innerWidth;
 }

 if(!re) {
  try{
   	innerBody.attachEvent('onclick',parent.do_resize);
   	innerBody.attachEvent('onkeyup',parent.do_resize);
   //글작성 상황에서 클릭없이 타이핑하면서 창이 늘어나는 상황이면 윗줄 주석제거
  } catch(e) {
   innerBody.addEventListener("click", parent.do_resize, false);
   innerBody.addEventListener("keyup", parent.do_resize, false);
   //글작성 상황에서 클릭없이 타이핑하면서 창이 늘어나는 상황이면 윗줄 주석제거
  }
 }
}

</script>
</head>
<body onLoad="fnInit()">
<DIV id="content" style="width:712px">
<table width="100%" cellpadding="1" class="table-search" border="0">
 <tr>
  <td class="title_left">
  	<h1>
  		<img src="<c:url value="${ImgUrl}" />icon/tit_icon.gif" width="16" height="16" hspace="3" align="middle"  alt="제목아이콘이미지">&nbsp;일정관리 목록
  	</h1>
  </td>
  <tr>
  	<td height="10"></td>
  </tr>
</table>
<table border="0" cellspacing="0" cellpadding="0" summary="월별일정보기, 주간별일정보기, 일별일정보기 입니다.">
<tr>
  <td height="20" width="100" bgcolor="#DDDDDD" style="cursor:hand;cursor:pointer;" align="center" id="tabMenu0" onClick="fnTabMenuSelect(0);"><b>월별일정보기</b></td>
  <td height="20" width="1" bgcolor="#FFFFFF"></td>
  <td height="20" width="100"  bgcolor="#DDDDDD" style="cursor:hand;cursor:pointer;" align="center" id="tabMenu1" onClick="fnTabMenuSelect(1);"><b>주간별일정보기</b></td>
  <td height="20" width="1" bgcolor="#FFFFFF" ></td>
  <td height="20" width="100" style="cursor:hand;cursor:pointer;" bgcolor="#DDDDDD" align="center" id="tabMenu2" onClick="fnTabMenuSelect(2);"><b>일별일정보기</b></td>
  <td height="20" width="1" bgcolor="#FFFFFF"> </td>
</tr>
</table>
<table border="0" cellspacing="0" cellpadding="0" width="100%">
<tr>
  <td height="3" bgcolor="#DDDDDD"></td>
</tr>
</table>
<iframe id="SchdulView" width="100%" height="700" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" title="일정관리">
</iframe>
<form name="IndvdlSchdulManageVO" id="IndvdlSchdulManageVO" action="?" method="post">
<input type="hidden" name="schdulId" id="schdulId" value="" />
<input type="hidden" name="schdulBgnde" id="schdulBgnde" value="" />
<input type="hidden" name="schdulEndde" id="schdulEndde" value="" />
<div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div>
</form>


</DIV>
</body>
</html>

