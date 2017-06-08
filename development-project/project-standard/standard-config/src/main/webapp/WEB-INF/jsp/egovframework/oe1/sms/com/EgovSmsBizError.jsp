<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>ERROR</title>
</head>

<body>
<!-- 에러페이지 ▼ -->
<div id="error_box">

	<img src="<c:url value='/images/egovframework/oe1/sms/error_logo.jpg'/>" alt="egovframe communication" />
  <div id="error_message_box">
   	<ul id="error_message">
   	  <li class="title_t">설정관리 수행 시 오류가 발생하였습니다.<br/>관리자에게 문의하세요.</li>
    </ul>
  </div>
    <div id="go_main"><a href="<c:url value="/index.jsp"/>"><img src="<c:url value='/images/egovframework/oe1/sms/go_main.gif'/>" alt="첫화면으로바로가기" /></a></div>
</div>

<!-- 에러페이지 ▲ -->


</body>
</html>
