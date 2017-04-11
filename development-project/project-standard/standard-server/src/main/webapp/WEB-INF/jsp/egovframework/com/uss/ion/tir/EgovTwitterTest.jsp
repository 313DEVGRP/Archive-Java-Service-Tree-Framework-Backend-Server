<%--
  Class Name : EgovTwitterRecptn.jsp
  Description : 트위터 수신(목록) 페이지
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2010.07.07    장동한          최초 생성
 
    author   : 공통서비스 개발팀 장동한
    since    : 2010.07.07
   
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="twitter4j.*"%>
<%@ page import="twitter4j.http.*"%>
<%@ page import="egovframework.com.cmm.util.EgovBasicLogger" %>
<%
String sCONSUMER_KEY = "jZolrlAWY2wgseQjukGw";
String sCONSUMER_SECRET = "y2alndDN9R3VDU9wmEabmnhfacwVDqfVIrWYwMeFGSw";

Twitter twitter = new Twitter();
twitter.setOAuthConsumer(sCONSUMER_KEY, sCONSUMER_SECRET);
RequestToken requestToken = null;
try {
	requestToken = twitter.getOAuthRequestToken();
	out.println("<p><a href='http://twitter.com/oauth/authorize?oauth_token="
	+ requestToken.getToken() + "' target='_blank' title='새 창으로 이동' >인증하러가기 </a>");
	// 해당키 임시 저장
	session.setAttribute("rtoken",requestToken.getToken());
	session.setAttribute("rstoken",requestToken.getTokenSecret());
} catch(TwitterException e) {
	EgovBasicLogger.debug("Twitter connection error", e);
}
out.println("<br>");
if (requestToken != null) {	// 보안점검 후속조치
	out.println("rtoken>"+requestToken.getToken());
}
out.println("<br>");
if (requestToken != null) {	// 보안점검 후속조치
	out.println("rstoken>"+requestToken.getTokenSecret());
}
out.println("<br>");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>트위터(Twitter)-수신</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css">
<link type="text/css" rel="stylesheet" href="${CssUrl}button.css">
<script type="text/javaScript" language="javascript">
</script>
</head>
<body>
<DIV id="content" style="width:712px">
<!-- noscript 테그 -->
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

TEST

</body>
</html>
