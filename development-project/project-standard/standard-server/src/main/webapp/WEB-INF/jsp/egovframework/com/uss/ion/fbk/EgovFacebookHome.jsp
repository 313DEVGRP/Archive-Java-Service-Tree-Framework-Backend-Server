<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         trimDirectiveWhitespaces="true" autoFlush="true" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page session="false" %>
<%

    /**
     * @Class Name : EgovFacebookHome.jsp
     * @Description : EgovFacebookHome.jsp
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
    <link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
    <title>Facebook 기능목록</title>
    <script type="text/javaScript" language="javascript">

        function checkLogin(userSe) {
            // 일반회원
            if (userSe == "GNR") {
                document.loginForm.rdoSlctUsr[0].checked = true;
                document.loginForm.rdoSlctUsr[1].checked = false;
                document.loginForm.rdoSlctUsr[2].checked = false;
                document.loginForm.userSe.value = "GNR";
                // 기업회원
            } else if (userSe == "ENT") {
                document.loginForm.rdoSlctUsr[0].checked = false;
                document.loginForm.rdoSlctUsr[1].checked = true;
                document.loginForm.rdoSlctUsr[2].checked = false;
                document.loginForm.userSe.value = "ENT";
                // 업무사용자
            } else if (userSe == "USR") {
                document.loginForm.rdoSlctUsr[0].checked = false;
                document.loginForm.rdoSlctUsr[1].checked = false;
                document.loginForm.rdoSlctUsr[2].checked = true;
                document.loginForm.userSe.value = "USR";
            }
        }

        function actionLogin() {

            if (document.loginForm.id.value == "") {
                alert("아이디를 입력하세요");
            } else if (document.loginForm.password.value == "") {
                alert("비밀번호를 입력하세요");
            } else {
                document.loginForm.action = "<c:url value='/uat/uia/actionLogin.do'/>";
                //document.loginForm.j_username.value = document.loginForm.userSe.value + document.loginForm.username.value;
                //document.loginForm.action="<c:url value='/j_spring_security_check'/>";
                document.loginForm.submit();
            }
        }

        function setCookie(name, value, expires) {
            document.cookie = name + "=" + escape(value) + "; path=/; expires=" + expires.toGMTString();
        }

        function getCookie(Name) {
            var search = Name + "=";
            if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면
                offset = document.cookie.indexOf(search);
                if (offset != -1) { // 쿠키가 존재하면
                    offset += search.length;
                    // set index of beginning of value
                    end = document.cookie.indexOf(";", offset);
                    // 쿠키 값의 마지막 위치 인덱스 번호 설정
                    if (end == -1)
                        end = document.cookie.length;
                    return unescape(document.cookie.substring(offset, end));
                }
            }
            return "";
        }

        function saveid(form) {
            var expdate = new Date();
            // 기본적으로 30일동안 기억하게 함. 일수를 조절하려면 * 30에서 숫자를 조절하면 됨
            if (form.checkId.checked)
                expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30); // 30일
            else
                expdate.setTime(expdate.getTime() - 1); // 쿠키 삭제조건
            setCookie("saveid", form.id.value, expdate);
        }

        function getid(form) {
            form.checkId.checked = ((form.id.value = getCookie("saveid")) != "");
            document.getElementById('id').value = <%=(String) request.getSession().getAttribute("id")%>;
        }

        function fnInit() {
            /* if (document.getElementById('loginForm').message.value != null) {
             var message = document.getElementById('loginForm').message.value;
             } */
            /* if (
            ${message} != "") {
             alert(
            ${message});
             } */

            getid(document.loginForm);
            // 포커스
            //document.loginForm.rdoSlctUsr.focus();
        }

    </script>
</head>
<body onLoad="fnInit();">
<div id="border" style="width:730px">
    <ul>
        <li><span class="button"><a href="<c:url value="/uss/ion/fbk/feed.do" />">Feed</a></span></li>
        <li><span class="button"><a href="<c:url value="/uss/ion/fbk/albums.do" />">Albums</a></span></li>
        <li><span class="button"><a href="<c:url value="/uss/ion/fbk/profile.do" />">Profile</a></span></li>
        <li><span class="button"><a href="<c:url value="/uss/ion/fbk/facebookSignout.do" />">Sign Out</a></span></li>
        <li>resultString = <%=(String) request.getSession().getAttribute("resultString")%></li>
        <li>id = <%=(String) request.getSession().getAttribute("id")%></li>
    </ul>
</div>
<div>
    <!--일반로그인 테이블 시작-->
    <form:form name="loginForm" action ="<c:url value='/uat/uia/actionLogin.do'/>" method="post">
        <div style="visibility:hidden;display:none;">
            <input name="iptSubmit1" type="submit" value="전송" title="전송">
        </div>
        <input type="hidden" id="message" name="message" value="<c:out value='${message}'/>">
        <table width="303" border="0" cellspacing="8" cellpadding="0">
            <tr>
                <td width="40%"class="title_left"><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif'/>" width="16" height="16" hspace="3" align="middle" alt="login">&nbsp;일반로그인</td>
            </tr>
            <tr>
                <td width="303" height="210" valign="top" style="background:url(<c:url value='/images/egovframework/com/uat/uia/login_bg01.gif' />) no-repeat;">
                    <table width="303" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                            <td height="70">&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <table border="0" cellpadding="0" cellspacing="0" style="width:250px;margin-left:20px; background-repeat:no-repeat;">
                                    <tr>
                                        <td width="30"></td>
                                        <td  nowrap><input name="rdoSlctUsr" type="radio" value="radio" checked onClick="checkLogin('GNR');" style="border:0;background:#ffffff;" tabindex="1">일반</td>
                                    </tr>
                                    <tr>
                                        <td height="1">&nbsp;</td>
                                    </tr>
                                </table>
                                <table border="0" cellpadding="0" cellspacing="0" style="width:250px;margin-left:20px;">
                                    <tr>
                                        <td>
                                            <table width="250" border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td class="required_text" nowrap><label for="id">아이디&nbsp;&nbsp;</label></td>
                                                    <td><input type="text" name="id" id="id" style="height: 16px; width: 85px; border: 1px solid #CCCCCC; margin: 0px; padding: 0px; ime-mode: disabled;" tabindex="4" maxlength="20"/></td>
                                                    <td/>
                                                </tr>
                                                <tr>
                                                    <td class="required_text" nowrap><label for="password">비밀번호&nbsp;&nbsp;</label></td>
                                                    <td><input type="password" name="password" id="password" style="height: 16px; width: 85px; border: 1px solid #CCCCCC; margin: 0px; padding: 0px; ime-mode: disabled;" maxlength="12" tabindex="5" onKeyDown="javascript:if (event.keyCode == 13) { actionLogin(); }"/></td>
                                                    <td class="title"><label for="checkId"><input type="checkbox" name="checkId" class="check2" onClick="javascript:saveid(document.loginForm);" id="checkId" tabindex="6"/>ID저장</label></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="10">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td><span class="button"><a href="#LINK" onClick="actionLogin()" tabindex="7">로그인</a></span></td>
                                                    <td>&nbsp;</td>
                                                    <td><span class="button"><a href="#LINK" onClick="goRegiUsr();" tabindex="8">회원가입</a></span></td>
                                                    <td>&nbsp;</td>
                                                    <td><span class="button"><a href="#LINK" onClick="goFindId();" tabindex="9">아이디/비밀번호찾기</a></span></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="3"></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td><span class="button"><a href="#LINK" onClick="Login(document.GpkiLoginForm);" tabindex="10">인증서로그인</a></span></td>
                                                    <td>&nbsp;</td>
                                                    <td><span class="button"><a href="#LINK" onClick="goGpkiIssu();" tabindex="11">인증서안내</a></span></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td height="2">&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <input name="userSe" type="hidden" value="GNR"/>
        <input name="j_username" type="hidden"/>
    </form:form>
    <!--일반로그인 테이블 끝-->

</div>
</body>
</html>