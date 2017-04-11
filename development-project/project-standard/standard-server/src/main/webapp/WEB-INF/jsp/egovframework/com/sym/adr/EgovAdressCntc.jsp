<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
 /**
  * @Class Name : EgovAdressCntc.jsp
  * @Description : 도로명주소연계 화면
  * @Modification Information
  * @
  * @  수정일         수정자                 수정내용
  * @ ----------    ------------    ---------------------------
  * @ 2014.10.21    표준프레임워크          최초 생성
  *
  *  @author 표준프레임워크
  *  @since 2014.10.21
  *  @version 3.5
  *  @see
  *
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet"  type="text/css">
<script type="text/JavaScript" src="/js/egovframework/com/cmm/jquery-1.4.2.min.js"></script>
<script type="text/javaScript" language="javascript">

function getAddr(){
	$.ajax({
		 //url :"http://10.182.60.22/addrlink/addrLinkApiJsonp.do"  //행정망
		 url :"http://www.juso.go.kr/addrlink/addrLinkApiJsonp.do"  //인터넷망
		,type:"post"
		,data:$("#form").serialize()
		,dataType:"jsonp"
		,crossDomain:true
		,success:function(xmlStr){
			if(navigator.appName.indexOf("Microsoft") > -1){
				var xmlData = new ActiveXObject("Microsoft.XMLDOM");
				xmlData.loadXML(xmlStr.returnXml)
			}else{
				var xmlData = xmlStr.returnXml;
			}
			$("#list").html("");
			var errCode = $(xmlData).find("errorCode").text();
			var errDesc = $(xmlData).find("errorMessage").text();
			if(errCode != "0"){
				alert(errCode+"="+errDesc);
			}else{
				if(xmlStr != null){
					makeList(xmlData);
				}
			}
		}
	    ,error: function(xhr,status, error){
	    	alert("에러발생");
	    }
	});
}

function getAddrLoc(){
	$.ajax({
		 url :"/sym/adr/getAdressCntcApi.do"
		,type:"post"
		,data:$("#form").serialize()
		,dataType:"xml"
		,success:function(xmlStr){
			$("#list").html("");
			var errCode = $(xmlStr).find("errorCode").text();
			var errDesc = $(xmlStr).find("errorMessage").text();
			if(errCode != "0"){
				alert(errCode+"="+errDesc);
			}else{
				if(xmlStr != null){
					makeList(xmlStr);
				}
			}
		}
	    ,error: function(xhr,status, error){
	    	alert("에러발생");
	    }
	});
}

function makeList(xmlStr){
	var htmlStr = "";
	//alert($(xmlStr).find("juso").size());
	htmlStr += "<table width=700 cellpadding=8 class=table-line>";
	htmlStr += "<thead>";
	htmlStr += "<tr>";
	htmlStr += "<th class=title nowrap>도로명주소</th>";
	htmlStr += "<th class=title nowrap>도로명주소(1)</th>";
	htmlStr += "<th class=title nowrap>도로명주소(2)</th>";
	htmlStr += "<th class=title nowrap>지번주소</th>";
	htmlStr += "<th class=title nowrap>영문주소</th>";
	htmlStr += "<th class=title nowrap>우편번호</th>";
	htmlStr += "</tr>";
	htmlStr += "</thead>";
	$(xmlStr).find("juso").each(function(){
		htmlStr += "<tr>";
		htmlStr += "<td>"+$(this).find('roadAddr').text()      +"</td>";
		htmlStr += "<td>"+$(this).find('roadAddrPart1').text()      +"</td>";
		htmlStr += "<td>"+$(this).find('roadAddrPart2').text()      +"</td>";
		htmlStr += "<td>"+$(this).find('jibunAddr').text()     +"</td>";
		htmlStr += "<td>"+$(this).find('engAddr').text()     +"</td>";
		htmlStr += "<td>"+$(this).find('zipNo').text()      +"</td>";
		
		htmlStr += "</tr>";
	});
	htmlStr += "</table>";
	$("#list").html(htmlStr);
}

function getAddrTest(){
	$.ajax({
	     //url :"http://10.182.60.22/addrlink/addrLinkApiJsonpTest.do"  //행정망
		 url :"http://www.juso.go.kr/addrlink/addrLinkApiJsonpTest.do"  //인터넷망
		,type:"post"
		,data:$("#form").serialize()
		,dataType:"jsonp"
		,crossDomain:true
		,success:function(xmlStr){
			if(navigator.appName.indexOf("Microsoft") > -1){  //ie경우에만 
				var xmlData = new ActiveXObject("Microsoft.XMLDOM");
				xmlData.loadXML(xmlStr.returnXml)
			}else{
				var xmlData = xmlStr.returnXml;
			}
			$("#list").html("");
			var errCode = $(xmlData).find("errorCode").text();
			var errDesc = $(xmlData).find("errorMessage").text();
			if(errCode != "0"){
				alert(errCode+"="+errDesc);
			}else{
				if(xmlStr != null){
					makeList(xmlData);
				}
			}
		}
	    ,error: function(xhr,status, error){
	    	alert("에러발생");
	    }
	});
}

function getAddrLocTest(){
	$.ajax({
		 url :"/sym/adr/getAdressCntcTestApi.do"
		,type:"post"
		,data:$("#form").serialize()
		,dataType:"xml"
		,success:function(xmlStr){
			$("#list").html("");
			var errCode = $(xmlStr).find("errorCode").text();
			var errDesc = $(xmlStr).find("errorMessage").text();
			if(errCode != "0"){
				alert(errCode+"="+errDesc);
			}else{
				if(xmlStr != null){
					makeList(xmlStr);
				}
			}
		}
	    ,error: function(xhr,status, error){
	    	alert("에러발생");
	    }
	});
}
</script>
<title>주소 정보 연계</title>
</head>
<body>
<form name="form" id="form" method="post">
 <table width="700" cellpadding="8" class="table-search" border="0">
   <tr>
	  <td class="title_left">
	   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지">&nbsp;주소 정보 연계</td>   
   </tr>
   <tr>
     <th>현재 페이지</th>
     <td><input type="text" name="currentPage" value="1"/></td>
     <th>페이지 사이즈</th>
     <td><input type="text" name="countPerPage" value="10"/></td>
   </tr>
   <tr>
     <th>검색어</th>
     <td><input type="text" name="keyword" value="정보화진흥원"/></td>
     <th>승인키</th>
     <td><input type="text" name="confmKey" id="confmKey" style="width:250px;" value="주소정보연계 Open API 호출을 위한 승인키 (서버 IP별로 신청해야 하는 값)"/></td>
   </tr>
 </table>
 <table width="700" cellpadding="8" class="table-search" border="0">   
   <tr>
     <td>
       <span class="button"><input type="button" onClick="getAddrLoc();" value="주소가져오기_Controller"/></span>
     </td>
     <td>
       <span class="button"><input type="button" onClick="getAddr();" value="주소가져오기_JSON"/></span>
     </td>
     <td>
       <span class="button"><input type="button" onClick="getAddrLocTest();" value="주소가져오기(테스트)_Controller"/></span>
     </td>
     <td>
       <span class="button"><input type="button" onClick="getAddrTest();" value="주소가져오기(테스트)_JSON"/></span>
     </td>
   </tr>   
 </table>
 <div id="list"></div>
</form>
</body>
</html>