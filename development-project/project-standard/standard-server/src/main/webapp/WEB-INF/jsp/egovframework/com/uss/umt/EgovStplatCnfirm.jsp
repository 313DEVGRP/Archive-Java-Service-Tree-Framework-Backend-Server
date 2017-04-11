<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<%
 /**
  * @Class Name : EgovStplatCnfirm.jsp
  * @Description : 약관확인 JSP
  * @Modification Information
  * @
  * @  수정일         수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.03.31    조재영          최초 생성
  *
  *  @author 공통서비스 개발팀 조재영
  *  @since 2009.03.31
  *  @version 1.0
  *  @see
  *  
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
<head>
<title>약관확인</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base target="_self">
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />" type="text/css" >
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />" type="text/css" >
<script type="text/javaScript" language="javascript" defer="defer">
<!--
function fnAgree(){
	var checkField = document.stplatForm.checkField;
    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i < checkField.length; i++) {
                if(checkField[i].checked) {
                }else{
                    alert("약관에 동의하지 않으면 회원으로 가입할 수 없습니다.");
                    checkField[i].focus();
                    return;
                }
            }
        } else {
            if(checkField.checked) {
            }else{
            	alert("약관에 동의하지 않으면 회원으로 가입할 수 없습니다.");
                checkField[i].focus();
                return;
            }
        }
    }
    
    //실명인증 기본페이지는 주민번호 실명확인으로 한다.
    //패키지 변경 document.stplatForm.action = "<c:url value='/uss/umt/EgovRlnmCnfirm.do'/>";
    document.stplatForm.action = "<c:url value='/uss/umt/EgovMberInsertView.do'/>";
    document.stplatForm.submit();
}

function fnDisAgree(){
	alert("약관에 동의하지 않으면 회원가입을 하실수 없습니다.");
	return;
}
-->
</script>
</head>
<body>
        <!-- content start -->
        <form:form name="stplatForm" action="<c:url value='/sec/rnc/EgovRlnmCnfirm.do'/>" method="post" >
        <input type="hidden" name="sbscrbTy" value="${sbscrbTy}"/>
        <!-- 실명인증의 기본옵션은 주민번호 실명확인임 : 주민번호 실명인증 으로 가기위한 초기화값 -->
        <input type="hidden" name="ihidnum" value=""/>
        <input type="hidden" name="realname" value=""/>
        <!-- 실명인증후 다음단계에 대한 셋팅정보 -->
        <input type="hidden" name ="nextUrlName" value="button.subscribe"/>
        <input type="hidden" name ="nextUrl" value=
        <c:if test="${sbscrbTy == 'USR01'}">"/uss/umt/EgovMberSbscrbView.do"</c:if>
        <c:if test="${sbscrbTy == 'USR02'}">"/uss/umt/EgovEntrprsMberSbscrbView.do"</c:if>
        <c:if test="${empty sbscrbTy}">""</c:if>
        />
        <table width="100%" cellpadding="8" class="table-search" border="0">
            <tr>
                <td width="100%" class="title_left"><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" alt="" />&nbsp;약관확인</td>
            </tr>
        </table>
        <c:forEach var="result" items="${stplatList}" varStatus="status">
        <table class="table-line">
	        <tr><th>약관내용</th></tr>
            
            <tr>
                <td><label for="useStplatCn">
                <textarea id="useStplatCn" cols="120" rows="15"><c:out value="${result.useStplatCn}" escapeXml="false" /></textarea>
                </label>
                </td>
            </tr>
            <tr>
                <td><label for="checkField">
                    <input name="checkField" type="checkbox" title="약관내용" >약관내용에 동의합니다.
                    <input name="checkuseStplatCn" type="hidden" value="<c:out value='${result.useStplatId}'/>">
                    </label>
                </td>
            </tr>
        </table>
        <table class="table-line">
            <tr><th>정보동의내용</th></tr>
            <tr>
                <td><label for="infoProvdAgeCn">
                <textarea id="infoProvdAgeCn" cols="120" rows="15"><c:out value="${result.infoProvdAgeCn}" escapeXml="false" /></textarea>
                </label>
                <!-- <c:out value="${fn:replace(result.infoProvdAgeCn , crlf , '<br/>')}" escapeXml="false" /> -->
                </td>
            </tr>
            <tr>
                <td><label for="checkField">
                    <input name="checkField" title="정보동의내용"  type="checkbox">정보이용내용에 동의합니다.
                    <input name="checkinfoProvdAgeCn" type="hidden" value="<c:out value='${result.useStplatId}'/>">
                    </label>
                </td>
            </tr>
        </table>    
        </c:forEach>
        <table width="717">
        <tr>
        <td>
	        <table border="0"  cellspacing="0" cellpadding="0" align="center">
	            <tr>
	                <!-- 동의 -->
                    <td><span class="button"><input type="submit" value="<spring:message code="button.agree" />" onclick="fnAgree(); return false;" /></span>&nbsp;</td>
                    <!-- 비동의 -->
                    <td><span class="button"><a href="#LINK" onclick="fnDisAgree(); return false;"><spring:message code="button.disagree" /></a></span>&nbsp;</td>
	            </tr>
	        </table>
	    </td>
	    </tr>
	    </table>
        </form:form>
        <!-- content end -->
</body>
</html>
