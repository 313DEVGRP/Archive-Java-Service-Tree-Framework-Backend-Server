<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" autoFlush="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>HelloWorld page</title>
</head>
<body>
    ${title}<br/><br/>
    Dear ${user}, you are successfully logged into this application.
    <br/>
    <a href="<c:url value="/j_spring_security_logout" />">Logout</a>
</body>
</html>