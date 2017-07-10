<%@ tag language="java" pageEncoding="UTF-8" isELIgnored="false" body-content="scriptless" description="NAS 연동 CSS 출력 태그" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<%@ attribute name="theRestOfFileName" %>

<c:choose>
	<c:when test="${pageContext.request.serverName=='localhost'}">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/egovframework/com/ext/jstree${theRestOfFileName}" media="screen"/>
	</c:when>
	<c:otherwise>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/egovframework/com/ext/jstree${theRestOfFileName}" media="screen"/>
	</c:otherwise>
</c:choose>