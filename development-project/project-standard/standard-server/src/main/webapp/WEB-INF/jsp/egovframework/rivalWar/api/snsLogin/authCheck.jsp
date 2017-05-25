<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         trimDirectiveWhitespaces="true" autoFlush="true" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
    {
        id:${loginVO.id},
        name:${loginVO.name},
        userSe:${loginVO.userSe},
        orgnztId:${loginVO.orgnztId},
        orgnztNm:${loginVO.orgnztNm},
        snsResult:"<%=(String) request.getSession().getAttribute("resultString")%>",
        snsId:<%=(String) request.getSession().getAttribute("id")%>
    }