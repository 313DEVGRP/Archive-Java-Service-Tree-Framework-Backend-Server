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
<%@ page import="twitter4j.util.*"%>
<%@ page import="twitter4j.api.*"%>
<%@ page import="egovframework.com.cmm.util.EgovBasicLogger"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator"%>
<c:set var="ImgUrl" value="/images/egovframework/com/cmm/" />
<c:set var="CssUrl" value="/css/egovframework/com/" />
<%
	//조회 모드 세션에서 가져오기
	String sCmd = session.getAttribute("sTWITTER_SE") == null ? "" : (String) session.getAttribute("sTWITTER_SE");

	String sCONSUMER_KEY = session.getAttribute("sCONSUMER_KEY").toString().trim();
	String sCONSUMER_SECRET = session.getAttribute("sCONSUMER_SECRET").toString().trim();

	Twitter twitter = new Twitter();
	twitter.setOAuthConsumer(sCONSUMER_KEY, sCONSUMER_SECRET);
	String oauthToken = request.getParameter("oauth_token");
	String rtoken = session.getAttribute("rtoken").toString().trim();
	String rstoken = session.getAttribute("rstoken").toString().trim();
	AccessToken accessToken = null;
	if (rtoken.equals(oauthToken)) {
		try {
			accessToken = twitter.getOAuthAccessToken(oauthToken,rstoken);
		} catch (TwitterException te) {
			EgovBasicLogger.debug("Twitter Access Token getting error", te);
		}
	}

	twitter.setOAuthAccessToken(accessToken);
	//해당키 저장
	if (accessToken != null) {
		session.setAttribute("atoken", accessToken.getToken());
		session.setAttribute("astoken", accessToken.getTokenSecret());
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>트위터(Twitter)-인증</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<script type="text/ja
<%if (sCmd.equals("RECPTN")) {%>
opener.location.href = '/uss/ion/tir/listTwitterRecptn.do';
<%} else {%>
opener.location.href = '/uss/ion/tir/registTwitterTrnsmit.do';
<%}%>
window.close();
</script>
</head>
<body>
</body>
</html>
