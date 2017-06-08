<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : index.jsp
  * @Description : 설정관리툴 메인화면
  * @Modification Information
  * 
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2010.05.25            최초 생성
  *
  * author 운영환경1  개발팀
  * since 2009.05.25
  *  
  * Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>EgovFrame 운영환경 설정관리 툴</title>
<link href="<c:url value='/css/egovframework/oe1/sms/common.css'/>" rel="stylesheet" type="text/css" >
<jsp:include
	page="/WEB-INF/jsp/egovframework/oe1/sms/com/jquery/jquery-include.jsp" ></jsp:include>
<script type="text/javaScript" language="javascript" defer="defer">
//<!--

$(function() {
	$("#accordion").accordion({
		collapsible: true
	});		
$("#accordion").addClass("append").css("border","1px solid #dadada").css("font-family","굴림");	
$(".table_style tr").mouseover(function() {$(this).addClass("over");}).mouseout(function() {$(this).removeClass("over");});
$("div.linkdiv").click(function(){ 
	//var topurl=$(this).attr("href");
	
	if($(this).attr("url")==1){
		$('#contents').load("<c:url value='/ole/sms/selectIdGenServiceBeanList.sms'/>");
	} else if($(this).attr("url")==2){
		$('#contents').load("<c:url value='/ole/sms/selectPropertyList.sms'/>");				
	} else if($(this).attr("url")==3){
		$('#contents').load("<c:url value='/ole/sms/selectCacheBeanList.sms'/>");		
	} else if($(this).attr("url")==4){
		$('#contents').load("<c:url value='/ole/sms/selectEhCacheList.sms'/>");	
	}else if($(this).attr("url")==5){
		$('#contents').load("<c:url value='/ole/sms/selectScheduleServiceList.sms'/>");	
	}else if($(this).attr("url")==6){
		$('#contents').load("<c:url value='/ole/sms/selectScheduleHistList.sms'/>");	
	}else if($(this).attr("url")==7){
		$('#contents').load("<c:url value='/ole/sms/insertCacheMgtRegistView.sms'/>");	
	}else if($(this).attr("url")==8){
		$('#contents').load("<c:url value='/ole/sms/removeCacheMgtView.sms'/>");	
	}else if($(this).attr("url")==9){
		$('#contents').load("<c:url value='/ole/sms/selectCacheMgtView.sms'/>");	
	}else if($(this).attr("url")==10){
		$('#contents').load("<c:url value='/ole/sms/reloadCacheMgtView.sms'/>");	
	}else if($(this).attr("url")==11){
		$('#contents').load("<c:url value='/ole/sms/selectSchedulingList.sms'/>");	
	}else if($(this).attr("url")==12){
		$('#contents').load("<c:url value='/ole/sms/selectDsServiceBeanList.sms'/>");	
	}
	
		
//$('#content').load('include01.html');
	//window.location = $(this).attr("url"); 
	}); 
});

//png투명처리
function setPng24(obj)
{
obj.width = obj.height = 1;
obj.className = obj.className.replace(/\bpng24\b/i,'');
obj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+ obj.src +"',sizingMethod='image');"
obj.src = '';
return '';
}	


//-->
</script>
</head>

<body>
<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>	
<div id="wrap">
	<!-- header 시작 -->
	<div id="header">
		<div id="logoarea">
		<h1><a href="/egovoe1_sms"><img src="<c:url value='/images/egovframework/oe1/sms/h1_egovlogo.png'/>" alt="운영환경 설정 관리툴 로고" class="png24" /></a></h1>
	  </div>
	</div>
	<!-- //header 끝 -->	
	<div id="container">
		<div id="leftmenu">
			<!-- jquery메뉴 시작 -->	
			<form name="menuform" />
			<input type="hidden" name="serviceNm" />	 		
			<ul id="accordion">
			   <li>
			       <div class="linkdiv" url="1"><a href="#" tabindex="1">ID Gen 설정관리</a></div>
			   </li>
			    <li>
			       <div class="linkdiv" url="2"><a href="#" tabindex="2">프로퍼티 설정관리</a></div>
			   </li>
			   <li>
			       <div class="linkdiv" url="12"><a href="#" tabindex="3">데이터소스 설정관리</a></div>
			   </li>
			   <li>
			       <div><a href="#" tabindex="4">스케줄 설정 관리</a></div>
			       <div>
			       	<ul class="remove_lst">
			       		<li><div class="linkdiv" url="5"><a href="#">- 스케줄 설정</a></div></li>
			       		<li><div class="linkdiv" url="11"><a href="#">- 스케줄 JOB 현황</a></div></li>
			       		<li><div class="linkdiv" url="6"><a href="#">- 스케줄 이력 조회</a></div></li>
			       	</ul>	
 		       	 </div>
			   </li>		   			
			   <li>
			       <div class="linkdiv" ><a href="#" tabindex="5">캐시 설정관리</a></div>
			       <div>
			       	<ul class="remove_lst">
			       		<li><div class="linkdiv" url="3"><a href="#">- 캐시 설정</a></div></li>
			       		<li><div class="linkdiv" url="4"><a href="#">- EnCache 설정</a></div></li>
			       	</ul>	
 		       	 </div>
			   </li>
			   
			   <li>
			       <div><a href="#" tabindex="6">캐시 관리(템플릿)</a></div>
			       <div>
			       	<ul class="remove_lst">
			       		<li><div class="linkdiv" url="7"><a href="#">- 캐시 등록</a></div></li>
			       		<li><div class="linkdiv" url="8"><a href="#">- 캐시 삭제</a></div></li>
			       		<li><div class="linkdiv" url="9"><a href="#">- 캐시 조회</a></div></li>
			       		<li><div class="linkdiv" url="10"><a href="#">- 캐시 리로딩</a></div></li>			       		
			       	</ul>	
 		       	 </div>
			   </li>	
			   	   			   
			</ul>			   					
			<!-- //jquery메뉴 끝 -->	
			</form>	 			
		</div>
		<!-- content 시작 -->
		<div id="contents" >
		<div style="position:relative;left:140px;top:70px">
			<img src="<c:url value='/images/egovframework/oe1/sms/main_img01.jpg'/>" alt="메인로고 화면" />
			</div>
		</div>
	
	<!-- //content 끝 -->	
	<!-- footer시작 -->
	<div id="footer">
		<div id="mopaslogo"><img src="<c:url value='/images/egovframework/oe1/sms/img_mopaslogo.gif'/>" alt="행정안전부 로고" /></div>
		<div id="address"><img src="<c:url value='/images/egovframework/oe1/sms/img_mopas_address.gif'/>" alt="(우)110-751 서울특별시 종로구 세종로55 정부중앙청사. COPYRIGHT(C)2010 MINISTRY OF REPUBLIC ADMINISTRATION AND SECURITY. ALL RIGHT RESERVED" /></div>
	</div>
	<!-- //footer끝 -->
</div>
<!-- //전체 레이어 끝 -->
</div>
</body>
</html>