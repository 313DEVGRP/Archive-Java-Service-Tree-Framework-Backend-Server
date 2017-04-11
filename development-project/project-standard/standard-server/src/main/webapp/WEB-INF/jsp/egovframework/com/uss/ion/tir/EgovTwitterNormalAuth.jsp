<%--
  Class Name : EgovTwitterNormalAuth.jsp
  Description : 트위터 Non-Authenticate 수신(목록)
  Modification Information

      수정일         수정자              수정내용
     ----------     --------    ---------------------------
     2010.11.08		장동한          최초 생성
     2012.02.17    	이기하          casting 오류사항 반영(156줄)

    author   : 공통서비스 개발팀 장동한
    since    : 2010.11.08

--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.List"%>

<%@ page import="twitter4j.*"%>
<%@ page import="twitter4j.Paging"%>
<%@ page import="twitter4j.Status"%>
<%@ page import="twitter4j.http.*"%>
<%@ page import="egovframework.com.cmm.EgovWebUtil" %>
<%@ page import="egovframework.com.cmm.util.EgovBasicLogger"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="ImgUrl" value="/images/egovframework/com/cmm/"/>
<c:set var="CssUrl" value="/css/egovframework/com/"/>
<%
	int nPageSize = request.getParameter("pageSize") == null ? 20 : Integer.parseInt((String) request.getParameter("pageSize"));
	String sTwitterId = request.getParameter("twitter_id") == null ? "egovframe" : (String) request.getParameter("twitter_id");

	sTwitterId = EgovWebUtil.clearXSSMinimum(sTwitterId);

	java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	try {
		//Twitter twitter = new TwitterFactory().getInstance();
		Twitter unauthenticatedTwitter = new TwitterFactory().getInstance();

		//트위터 페이징 객체
		Paging twitterPage = new Paging();
		//페이지 갯수 설정
		twitterPage.count(nPageSize);
		//인덱스 설정
		twitterPage.setPage(1);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>트위터(Twitter)-목록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css">
<link type="text/css" rel="stylesheet" href="${CssUrl}button.css">
<script type="text/javaScript" language="javascript">

/* ********************************************************
* 초기화
******************************************************** */

	function fn_egov_init_TwitterNormalAuth() {

	}

	function numchk() {
		var value = document.twitterInfo.pageSize.value;
		if (value == "") {
			alert("숫자를 입력해주세요!");
			document.twitterInfo.pageSize.value = "";
			document.twitterInfo.pageSize.focus();
			return false;
		} else if (isNaN(value)) {
			alert("숫자만 입력이 가능합니다");
			document.twitterInfo.pageSize.value = "";
			document.twitterInfo.pageSize.focus();
			return false;
		} else {
			return true;
		}
	}
</script>

<style type="text/css">
.txaIpt80 {
width : 99%;
}

#divVerify {
font-size : 12px;
color : red;
}
</style>
</head>
<body>
<DIV id="content" style="width:712px">
<!-- noscript 테그 -->
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<!-- LIST 출력 -->
<form id="twitterInfo" name="twitterInfo" action="/EgovPageLink.do?link=uss/ion/tir/EgovTwitterNormalAuth" method="post">
<table width="100%" cellpadding="1" border="0" summary="타이틀/검색 을 제공한다">
<caption>타이틀/검색 을 제공한다</caption>
<tr>
	<th scope="col" class="title_left">
		<h1><img src="<c:out value="${ImgUrl}"/>icon/tit_icon.gif" width="16" height="16" hspace="3" style="vertical-align:middle; display:inline-block;"  alt=" " title=" ">&nbsp;트위터 Non-Authenticate 수신(목록)</h1>
	</th>
	<td>
	<td width="130x"><label for="twitter_id">아이디:</label><input name="twitter_id" title="검색건수" type="text" size="3" value="<c:out value='<%=sTwitterId%>'/>" maxlength="255" style="width:80px;"></td>
	<td width="50px"><label for="pageSize"></label><input name="pageSize" title="검색건수" type="text" size="3" value="<c:out value='<%=nPageSize%>' />" maxlength="5" style="width:25px;IME-MODE: disabled">건</td>
	<td width="3px"></td>
	<td width="60px" align="center">
		<table border="0" cellspacing="0" cellpadding="0" align="center" summary="조회 버튼을 제공한다">
		<caption>조회 버튼을 제공한다</caption>
		<tr>
			<td><img src="${ImgUrl}btn/bu2_left.gif"  width="8" height="20" alt="버튼이미지"></td>
			<td class="btnBackground"><input type="submit" value="<spring:message code="button.inquire" />" onclick="if(numchk() == false){return false;}" class="btnNew" style="height:20px;width:26px;" ></td>
			<td><img src="<c:out value="${ImgUrl}"/>btn/bu2_right.gif" width="8" height="20" alt="버튼이미지"></td>
			<th scope="col">&nbsp;</th>
		</tr>
		</table>
	</td>
</tr>
</table>
</form>

<table width="100%" cellpadding="0" class="table-line" border="0" summary="트위터 목록 을 제공한다.">
<caption>트위터 목록 을 제공한다</caption>
<thead>
  <tr>
    <th scope="col" class="title" width="50px" nowrap>프로필<br>이미지</th>
    <th scope="col" class="title" nowrap>내용</th>
  </tr>
</thead>
<tbody>
<%
	List<Status> statuses = unauthenticatedTwitter.getUserTimeline(sTwitterId, twitterPage);

		if (statuses == null) {
%>
<tr>
	<td class="lt_text3" colspan="2">
		<spring:message code="common.nodata.msg" />
	</td>
</tr>
<%
	} else {
%>
<!-- 데이터를 화면에 출력해준다 -->
<%
	for (Status status : statuses) {
				String profileImageUrl = String.valueOf(status.getUser().getProfileImageURL()); // 2012.02.17 오류사항반영
				if (profileImageUrl != null) {
					profileImageUrl = profileImageUrl.replaceAll("<", "&lt;");
					profileImageUrl = profileImageUrl.replaceAll(">", "&gt;");
				} else {
					profileImageUrl = "";
				}
%>
<tr>
	<td class="lt_text3">
		<img src="<%=profileImageUrl%>" alt="<%=status.getUser().getName()%> 프로필이미지" width="48px" height="48px">
	</td>
	<td class="lt_text3L">
		<%=status.getUser().getName()%>(<%=status.getUser().getScreenName()%>)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=format.format(status.getCreatedAt())%><br>
		<c:out value="<%=status.getText()%>" /><br>
		<%
			if (status.getUser().getURL() != null) {
		%>
				<font color="#0080C0"><a href="<%=status.getUser().getURL()%>" target="_blank"  title="새 창으로 이동" ><%=status.getUser().getURL()%></a></font>
		<%
			}
		%>
	</td>
</tr>
	<%
		}
	%>
<%
	}
%>

</tbody>
</table>

</DIV>
</body>
</html>
<%
	} catch (TwitterException e) {
%>
<tr>
	<td class="lt_text3" colspan="2">
		<spring:message code="common.nodata.msg" />
	</td>
</tr>
</tbody>
</table>

</DIV>
</body>
</html>
<%
	} catch (Exception e) {
		EgovBasicLogger.debug("Twitter Auth error", e);
	} finally {
	}
%>