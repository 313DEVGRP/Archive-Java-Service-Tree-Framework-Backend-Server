<%--
  Class Name : EgovIncFooter.jsp
  Description : 화면하단 Footer(include)
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 실행환경개발팀 JJY
    since    : 2011.08.31 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="footer_link"><img src="<c:url value='/'/>images/footer/img_plus.gif" alt="">
	<label for="goaction">관련사이트</label>
	<form name="action" method="post" action="http://www.mopas.go.kr/">
	<select id="goaction" name="goaction" onchange="this.form.action=this.options[this.selectedIndex].value;">
	<option value="http://www.mopas.go.kr/" >행정안전부</option>
	<option value="http://www.nia.or.kr/" >한국정보화진흥원</option>
	<option value=""></option>
	</select>
	<input type="submit" value="이동" >
	</form>
</div>
<div id="footer_copyright">
		<div class="mp_loc"><img src="<c:url value='/'/>images/footer/img_fmopas.gif" alt="행정안전부" /></div>
		<div class="nia_loc"><img src="<c:url value='/'/>images/footer/img_nia.gif" alt="행정안전부" /></div>
		<div class="line_loc"><img src="<c:url value='/'/>images/footer/img_line.gif" alt="행정안전부" /></div>
		<div class="text_loc">(우)110-751 서울특별시 종로구 세종로55 정부중앙청사.<br/>COPYRIGHT(C)2011 MINISTRY OF REPUBLIC ADMINISTRATION AND SECURITY. ALL RIGHT RESERVED.</div>
</div>