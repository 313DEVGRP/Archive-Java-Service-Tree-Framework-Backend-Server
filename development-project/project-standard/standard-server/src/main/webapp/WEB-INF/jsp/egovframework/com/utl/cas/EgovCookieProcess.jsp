<%--
  Class Name : ComUtlFccCookieRegist.jsp
  Description : 쿠키생성, 등록, 사용, 폐기하는 기능 제공
  Modification Information
 
      수정일                  수정자                   수정내용
  -------    --------    ---------------------------
 2009.02.01    박정규                 최초 생성
 
    author   : 박정규
    since    : 2009.02.10
   
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" session="false" %>
<%@page import="egovframework.com.utl.cas.service.EgovSessionCookieUtil"  %>
<%@page import="java.util.*"  %>
<%!
    String safeGetParameter (HttpServletRequest request, String name){
        String value = request.getParameter(name);
        if (value == null) {
            value = "";
        }
        return value;
    }
%>

 <link href="/css/egovframework/com/cmm/utl/com.css" rel="stylesheet" type="text/css">

<%
// 준비화면, 실행결과 출력화면의 구분
String execFlag = safeGetParameter(request,"execFlag");
if(execFlag==null || execFlag.equals("")) {
	execFlag="READY";
}

%>
<%
if(execFlag.equals("READY")){
	// 실행을 위한 화면 준비
	System.out.println("READY"); 
%>

<!-- 준비화면  시작-->
<form name="fm108_1" action ="/EgovPageLink.do" method=post>
<input type = "hidden" name="execFlag" value="REQ-COM-108_1">
<input type = "hidden" name="cmdStr" value="REQ-COM-108">
<input type = "hidden" name="link" value="cmm/utl/EgovCookieProcess">
<table border="1">
	<tr>
		<td>
		기능설명:
		</td>
		<td>
		    쿠키생성 &nbsp;&nbsp;&nbsp;<br>
		</td>
		<td>
		    쿠키명:<input type = "text" name="cookieNm"  size=10 title="쿠키명">
		</td>
		<td>
		    쿠키값:<input type = "text" name="cookieVal"  size=10 title="쿠키값">
		</td>
		<td> 
			<input type = "button" method="post"  value="실행!" onclick="fm108_1.submit()">
		</td>				
	</tr>
</table>
</form>
<!--  준비화면 끝 -->

<!-- 준비화면  시작-->
<form name="fm108_2" action ="/EgovPageLink.do" method=post>
<input type = "hidden" name="execFlag" value="REQ-COM-108_2">
<input type = "hidden" name="cmdStr" value="REQ-COM-108">
<input type = "hidden" name="link" value="cmm/utl/EgovCookieProcess">
<table border="1">
	<tr>
		<td>
		기능설명:
		</td>
		<td>
		    쿠키값 얻기 <br>
		</td>
		<td>
		    쿠키명:<input type = "text" name="cookieNm"  size=10 title="쿠키명">
		</td>
		<td>
		</td>
		<td> 
			<input type = "button" method="post"  value="실행!" onclick="fm108_2.submit()">
		</td>				
	</tr> 	 
</table>
</form>
<!--  준비화면 끝 -->

<!-- 준비화면  시작-->
<form name="fm108_3" action ="/EgovPageLink.do" method=post>
<input type = "hidden" name="execFlag" value="REQ-COM-108_3">
<input type = "hidden" name="cmdStr" value="REQ-COM-108">
<input type = "hidden" name="link" value="cmm/utl/EgovCookieProcess">
<table border="1">
	<tr>
		<td>
		기능설명:
		</td>
		<td>
		    쿠키삭제 &nbsp;&nbsp;&nbsp;<br>
		</td>
		<td>
		    쿠키명:<input type = "text" name="cookieNm"  size=10 title="쿠키명">
		</td>
		<td> 
			<input type = "button" method="post"  value="실행!" onclick="fm108_3.submit()">
		</td>				
	</tr>
</table>
</form>
<!--  준비화면 끝 -->


<%	
}else if(execFlag.equals("REQ-COM-108_1")){
%>

<%
//실행결과 출력화면인 경우 결과정보 확인 - util 형태로 바로 확인

String cookieNm = safeGetParameter(request,"cookieNm");
String cookieVal = safeGetParameter(request,"cookieVal");

EgovSessionCookieUtil.setCookie(response, cookieNm, cookieVal);

%>

<!-- 결과화면 시작 -->
<form name="fm108_1" action ="/EgovPageLink.do" method=post>
<input type = "hidden" name="execFlag" value="READY">
<input type = "hidden" name="cmdStr" 	value="REQ-COM-108">
<input type = "hidden" name="link" value="cmm/utl/EgovCookieProcess">
<table border="1">
   	<tr>
   		<td>쿠키생성 : 
   		</td>
   		<td>쿠키명: <%=cookieNm%> &nbsp;&nbsp;
   		</td>
   		<td>쿠키값: <%=cookieVal%> &nbsp;&nbsp;
   		</td>
   	</tr>
</table> 
<br>
<input type = "button" method="post"  value="화면으로 돌아가기" onclick="fm108_1.submit()">
</form>
<!--  결과화면 끝 -->


<%	
}else if(execFlag.equals("REQ-COM-108_2")){
%>

<%
//실행결과 출력화면인 경우 결과정보 확인 - util 형태로 바로 확인

String cookieNm = safeGetParameter(request,"cookieNm");

String	resultStr = EgovSessionCookieUtil.getCookie(request, cookieNm);
%>

<!-- 결과화면 시작 -->
<form name="fm108_2" action ="/EgovPageLink.do" method=post>
<input type = "hidden" name="execFlag" value="READY">
<input type = "hidden" name="cmdStr" 	value="REQ-COM-108">
<input type = "hidden" name="link" value="cmm/utl/EgovCookieProcess">
<table border="1">
   	<tr>
   		<td>쿠키생성, 등록, 사용, 폐기하는 기능 제공 : 
   		</td>
   		<td>쿠키명: <%=cookieNm%> &nbsp;&nbsp;
   		</td>
   		<td>쿠키값: <%=resultStr%> &nbsp;&nbsp;
   		</td>
   	</tr>
</table> 
<br>
<input type = "button" method="post"  value="화면으로 돌아가기" onclick="fm108_2.submit()">
</form>
<!--  결과화면 끝 -->


<%	
}else if(execFlag.equals("REQ-COM-108_3")){
%>

<%
//실행결과 출력화면인 경우 결과정보 확인 - util 형태로 바로 확인

String cookieNm = safeGetParameter(request,"cookieNm");

// 쿠키값 세팅
EgovSessionCookieUtil.setCookie(response, cookieNm);

%>

<!-- 결과화면 시작 -->
<form name="fm108_3" action ="/EgovPageLink.do" method=post>
<input type = "hidden" name="execFlag" value="READY">
<input type = "hidden" name="cmdStr" 	value="REQ-COM-108">
<input type = "hidden" name="link" value="cmm/utl/EgovCookieProcess">
<table border="1">
   	<tr>
   		<td>쿠키삭제&nbsp;&nbsp;&nbsp;&nbsp; : 
   		</td>
   		<td>쿠키명: <%=cookieNm%> &nbsp;&nbsp;
   		</td>
   		<td>쿠키값: 
   		</td>
   	</tr>
</table> 
<br>
<input type = "button" method="post"  value="화면으로 돌아가기" onclick="fm108_3.submit()">
</form>
<!--  결과화면 끝 -->

<%
}
%>

