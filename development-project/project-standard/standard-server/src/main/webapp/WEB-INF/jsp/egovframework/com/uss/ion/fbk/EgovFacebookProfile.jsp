<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" autoFlush="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ page session="false" %>
<%

/**
 * @Class Name : EgovFacebookProfile.jsp
 * @Description : EgovFacebookProfile.jsp
 * @Modification Information
 * @
 * @  수정일             수정자              수정내용
 * @ ---------     -----------------    -------------------------
 * @ 2014.11.10    표준프레임워크센터        최초생성
 *
 *  @author 표준프레임워크센터
 *  @since 2014.11.10
 *  @version 1.0
 *  @see
 *
 *  Copyright (C) 2014 by MOGAHA  All right reserved.
 */

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Facebook 프로필 조회</title>
</head>
<body>
    <div id="border" style="width:730px">
        <h3>Your Facebook Profile</h3>
        <p>Hello, <c:out value="${profile.firstName}"/>!</p>
        <dl>
        	<dt>Facebook ID:</dt>
        	<dd><c:out value="${profile.id}"/></dd>
        	<dt>Name:</dt>
        	<dd><c:out value="${profile.name}"/></dd>
        	<dt>Email:</dt>
        	<dd><c:out value="${profile.email}"/></dd>
        </dl>
        <c:url var="post_url"  value="/uss/ion/fbk/facebookSignout.do" />
        <form:form id="disconnect" action="${post_url}" method="post">
        	<button type="submit">Disconnect from Facebook</button>	
        	<input type="hidden" name="_method" value="delete" />
        </form:form>
    </div>
</body>
</html>