<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ include
	file="/WEB-INF/jsp/egovframework/oe1/sms/com/jquery/taglibs.jsp"%>

<link type="text/css" rel="stylesheet" href="<c:url value='/themes/ui-lightness/jquery.ui.all.css'/>" >

<script type="text/javascript" src="<c:url value='/js/egovframework/oe1/sms/jquery-1.4.2.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/oe1/sms/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/oe1/sms/jquery.ui.core.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/oe1/sms/jquery.ui.widget.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/oe1/sms/jquery.ui.accordion.js'/>"></script>



<script type="text/javascript">
function checkSpChar(value){
	var RegExpSp = /[~!\[\]!@^{}#$^&=+|;"<,>']/;

	if(RegExpSp.test(value)){
		alert("아래 특수문자만 입력 가능 합니다.\n/ * : . - _");
		return false;
	}


	return true;
}

function checkSpOracleChar(value){
	var RegExpSp = /[~!\[\]!^{}#$^&+|;"<,>']/;

	if(RegExpSp.test(value)){
		alert("아래 특수문자만 입력 가능 합니다.\n/ * : . - _ @ =");
		return false;
	}

	return true;
}
function checkBeanSpChar(value){
	var RegExpSp = /[~!\[\]@^{}#$^&=+|./:*;?"<,>']/;

	if(RegExpSp.test(value)){
		alert("BeanID 및 Destroy Method는 특수문자를 입력할 수 없습니다.");
		return false;
	}


	return true;
}

function checkKoreanLang(value){
	var RegExpHG = /[ㄱ-ㅎ가-힣]+/;

	if(RegExpHG.test(value)){
		alert("한글을 입력하실 수 없습니다.");
		return false;
	}
	return true;
}

function trim(str) {
	return str.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
}


</script>