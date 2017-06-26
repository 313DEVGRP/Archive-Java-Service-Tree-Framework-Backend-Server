<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="org.springframework.security.core.userdetails.UserDetails" %>
<%@ page import="org.springframework.security.core.userdetails.UserDetailsService" %>

<%@ page isErrorPage="true"%>
<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ page import="egovframework.rte.fdl.string.EgovStringUtil" %>
<%@ page import="java.lang.String" %>
<%
    boolean authenticateFail = false;
    if(request.getAttribute("authenticateFail")!=null && !request.getAttribute("authenticateFail").toString().equals("")){
        authenticateFail = true;
    }

    boolean authFail = false;
    if(request.getAttribute("authFail")!=null && !request.getAttribute("authFail").toString().equals("")){
        authFail = true;
    }

    String target = EgovStringUtil.null2void((String)request.getAttribute("target"));
    target = target.equals("") ? "_top" : target;
%>
<html lang="ko">
<head>
<title>Access is denied</title>
<link rel="stylesheet" href="<c:url value='/css/admin.css'/>" type="text/css">
</head>
<script language="javascript">
function fncGoAfterErrorPage(){
    if('<%=authenticateFail%>' == 'true' ){
        document.dummyForm.target="_top";
        document.dummyForm.action = "<c:url value='/empaftererrorpage.do'/>";
        document.dummyForm.submit();
    }else if('<%=authFail%>' == 'true'){
        document.dummyForm.target="<%=target%>";
        document.dummyForm.action = "<c:url value='/empaftererrorpage.do'/>";
        document.dummyForm.submit();
    }else{
        //document.location.href = "<c:url value='/empaftererrorpage.do'/>";
        history.back(-2);
    }
}
</script>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center" valign="top"><br />
    <br />
    <br />
    <table width="600" border="0" cellpadding="0" cellspacing="0" background="er_images/blue_bg.jpg' />">
      <tr>
        <td align="center"><table width="100%" border="0" cellspacing="9" cellpadding="0">
          <tr>
            <td bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left"><img src="<c:url value='/images/egovframework/com/cmm/er_logo.jpg' />" width="379" height="57" alt="에러로고이미지"/></td>
              </tr>
              <tr>
                <td><br />
                  <br /></td>
              </tr>

              <tr>
                <td align="center"><table width="520" border="0" cellspacing="2" cellpadding="2">
                  <tr>
                    <td width="74" rowspan="2" align="center"><img src="<c:url value='/images/egovframework/com/cmm/danger.jpg'/>" alt="경고이미지" width="74" height="74" /></td>
                    <td width="399" align="left" class="lt_text2">
                    ${SPRING_SECURITY_403_EXCEPTION}
                    <br>
                    <%
                    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
                    Object principal = auth.getPrincipal();
                    if (principal instanceof UserDetails) {
                        String username = ((UserDetails) principal).getUsername();
                        String password = ((UserDetails) principal).getPassword();
                        out.println("Account : " + username.toString() + "<br>");
                    }
                    %>
                    </td>
                  </tr>
                  <tr>
                    <td align="left" valign="top" class="lt_text5">${exception.message}</td>
                  </tr>
                </table>
                  <table width="500" border="0" cellspacing="2" cellpadding="2">
                                  </table></td>
              </tr>
              <tr>
                <td><br />
                  <br /></td>
              </tr>
              <tr>
                <td align="center"><a href="javascript:fncGoAfterErrorPage();"><img src="<c:url value='/images/egovframework/com/cmm/go_history.jpg' />" width="90" height="29" border="0" alt="바로가기 버튼이미지"/></a></td>
              </tr>
            </table>
              <br /></td>
          </tr>
        </table></td>
      </tr>
    </table>
    </td>
  </tr>
</table>
</body>
</html>
