<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         trimDirectiveWhitespaces="true" autoFlush="true" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ page session="false" %>

<%@ taglib tagdir="/WEB-INF/tags" prefix="customTags" %>
<div class="modal fade rival-war-login" id="loginView">
    <div id="signIn" class="modal-dialog login-box">
        <div class="modal-content">
            <div class="modal-header">
                <img src="./partials/common/img/signIn/sing-in-header.jpg" alt="1. 소셜 로그인">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i>
                </button>
            </div>
            <div class="modal-body login-box-body">
                <p class="login-box-msg">
                    라이벌워는 개인정보 보호법을 준수합니다.
                </p>
                <div class="social-auth-links text-center">
                    <!--
                    <a href="#" class="btn btn-block btn-social btn-twitter">
                      <img src="./partials/common/img/signIn/sign-in-twitter.png" alt="트위터"/>
                      Twitter Login
                    </a>
                    -->
                    <!--
                    <a href="#" class="btn btn-block btn-social btn-facebook" ng-click="facebookLogin()">
                        <img src="./partials/common/img/signIn/sign-in-facebook.png" alt="페이스북"/>
                        Facebook Login
                    </a>
                    -->
                    <c:url var="post_url" value="/signin/facebook"/>
                    <form:form action="${post_url}" method="POST" target="_top">
                        <button type="submit" class="btn btn-block btn-social btn-facebook"><img
                                src="./partials/common/img/signIn/sign-in-facebook.png" alt="페이스북"/>
                            Facebook Login
                        </button>
                        <input type="hidden" name="scope" value="public_profile,email"/>
                    </form:form>
                    <!--
                    <a href="#" class="btn btn-block btn-social btn-google">
                      <img src="./partials/common/img/signIn/sign-in-google.png" alt="구글"/>
                      Google Login
                    </a>

                    <a href="#" class="btn btn-block btn-social btn-naver">
                      <img src="./partials/common/img/signIn/sign-in-naver.png" alt="네이버"/>
                      Naver Login
                    </a>
                    <a href="#" class="btn btn-block btn-social btn-kakao">
                      <img src="./partials/common/img/signIn/sign-in-kakao.png" alt="카카오"/>
                      Kakao Login
                    </a>
                    -->
                </div>
                <p class="login-box-msg">
                    Copyright&copy; 2010-2017 313 DEV GRP.
                </p>
                <!-- /.social-auth-links -->
                <!-- 로그인 닫기 -->
                <!--<button type="button" class="btn btn-sm" data-widget="remove"><i class="fa fa-times"></i></button>-->
                <!--  <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button> -->
            </div>
        </div>
    </div>
</div>