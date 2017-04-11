<%--
  Class Name : EgovQustnrTmplatManageRegist.jsp
  Description : 설문템플릿 등록 페이지
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2008.03.09    장동한          최초 생성

    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.09

--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="ImgUrl" value="${pageContext.request.contextPath}/images/egovframework/com/cmm/"/>
<c:set var="CssUrl" value="${pageContext.request.contextPath}/css/egovframework/com/"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>설문템플릿 등록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css">
<link type="text/css" rel="stylesheet" href="${CssUrl}button.css">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="qustnrTmplatManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">


/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_QustnrTmplatManage(){

}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_QustnrTmplatManage(){
	location.href = "<c:url value='/uss/olp/qtm/EgovQustnrTmplatManageList.do' />";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_save_QustnrTmplatManage(form){
	if(confirm("<spring:message code="common.save.msg" />")){
		if(!validateQustnrTmplatManageVO(form)){
			return;
		}else{

			if(form.qestnrTmplatImage.value == ""){
			 	alert("템플릿유형 이미지를 선택해주세요!");
				form.focus();
				return;
			}

			form.submit();
		}
	}
}
/* ********************************************************
 * 선택이미지 미리보기
 ******************************************************** */
function fnImgChange(obj){

	if(obj.value != "") {
		if(obj.value.search(/(gif)/)!=-1 || obj.value.search(/(jpg)/)!=-1 || obj.value.search(/(bmp)/)!=-1 || obj.value.search(/(GIF)/)!=-1 || obj.value.search(/(JPG)/)!=-1 ){
			document.getElementById("DIV_IMG_VIEW").style.display = "";

			// IE8 일때 가상경로 확인
			if (obj.value.indexOf("\\fakepath\\") < 0) {
				document.getElementById("IMG_VIEW").src = obj.value;
				}
			// IE8 일때 가상경로 변경
			else {
		 		 obj.select();
				 document.getElementById("IMG_VIEW").src = document.selection.createRange().text.toString();
			alert(document.getElementById("IMG_VIEW").src);
				 obj.blur();
		    	 }
		}else{
		   alert('GIF/JPG 형식의 이미지만 업로드 가능합니다!');
		   obj.select();
		   document.execCommand('Delete');
		   obj.focus();
		   return;
	 	}

	}{return;}

}
</script>
</head>
<body onLoad="fn_egov_init_QustnrTmplatManage();">
<DIV id="content" style="width:712px">
<!-- 자바스크립트 경고 태그  -->
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<!-- 상단타이틀 -->
<form:form commandName="qustnrTmplatManageVO"  name="qustnrTmplatManageVO" action="${pageContext.request.contextPath}/uss/olp/qtm/EgovQustnrTmplatManageRegistActor.do" method="post" enctype="multipart/form-data">
<!-- 상단 타이틀  영역 -->
<div class="title_left" style="width:100%;margin:0 0 0 0;">
	<h1><img src="<c:out value="${ImgUrl}" />icon/tit_icon.gif" width="16" height="16" hspace="3" style="vertical-align:middle; display:inline-block;" alt="제목아이콘이미지">&nbsp;설문템플릿 등록</h1>
</div>

<!-- 줄간격조정  -->
<div style="width:100%;border:solid 0px #000000;height:3px"></div>

<!-- 등록  폼 영역  -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="등록 을 제공한다.">
<caption>등록 을 제공한다</caption>
  <tr>
    <th scope="row" height="23" class="required_text"><label for="qestnrTmplatTy">템플릿유형<img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목" width="15" height="15"></label></th>
    <td>
     <form:input path="qestnrTmplatTy" size="70" cssClass="txaIpt" maxlength="100" title="템플릿유형 입력" />
      <div><form:errors path="qestnrTmplatTy"/></div>
    </td>
  </tr>

  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap >템플릿유형&nbsp;&nbsp;&nbsp;<br>이미지<img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목" width="15" height="15"></th>
    <td width="80%" nowrap>
    	<table cellspacing="0" cellpadding="0" border="0" summary="템플릿 이미지를 제공한다.">
    	<caption>템플릿 이미지를 제공한다</caption>
    	<tr>
    	<th><input type="file" id="qestnrTmplatImage" name="qestnrTmplatImage" onChange="fnImgChange(this)" title="템플릿유형이미지 선택"></th>
    	<td>
	     	<div id="DIV_IMG_VIEW" style="display:none;">
	     	<img src="" name="IMG_VIEW" id="IMG_VIEW" align="middle" alt="이미지미리보기" title="이미지미리보기">
	     	<!-- onLoad="if(this.width>65){this.width=65}" -->
	     	</div>
	     </td>
	     </tr>
	     <tr>
	     	<td colspan="2"><font color="red">가로:65px 세로:50px 포멧:GIF/JPG 형식으로로 업로드 해주세요</font></td>
	     </tr>
	     </table>
    </td>
  </tr>

  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap><label for="qestnrTmplatCn">템플릿설명</label><img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목" width="15" height="15"></th>
    <td width="80%" nowrap>
    	<form:textarea path="qestnrTmplatCn" rows="8" cols="75" cssClass="txaClass" title="템플릿설명 입력"/>
    	<div><form:errors path="qestnrTmplatCn"/></div>
    </td>
  </tr>
  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap><label for="qestnrTmplatCours">템플릿파일(경로)</label><img src="${ImgUrl}icon/required.gif" alt="필수항목" title="필수항목" width="15" height="15"></th>
    <td width="80%" nowrap>
      <form:input path="qestnrTmplatCours" size="73" cssClass="txaIpt" maxlength="100" title="템플릿경록 입력"/>
      <div><form:errors path="qestnrTmplatCours"/></div>
    </td>
  </tr>
</table>

<!-- 줄간격조정  -->
<div style="width:100%;border:solid 0px #000000;height:3px"></div>

<!-- 목록/저장버튼  -->
<center>
<table border="0" cellspacing="0" cellpadding="0" align="center" summary="목록/저장 버튼을 제공한다.">
<caption>목록/저장 버튼을 제공한다</caption>
<tr>
	<td><img src="<c:out value="${ImgUrl}" />btn/bu2_left.gif" width="8" height="20" alt="버튼이미지"></td>
	<td class="btnBackground" nowrap><a href="<c:url value='/uss/olp/qtm/EgovQustnrTmplatManageList.do' />">목록</a></td>
	<td><img src="<c:out value="${ImgUrl}" />btn/bu2_right.gif" width="8" height="20" alt="버튼이미지"></td>
	<th scope="col">&nbsp;</th>
	<td>
		<span class="button"><input type="submit" value="저장" onclick="fn_egov_save_QustnrTmplatManage(document.forms[0]); return false;"></span>
	</td>
</tr>
</table>
</center>
<input name="cmd" type="hidden" value="<c:out value='save'/>">
</form:form>
</DIV>

</body>
</html>
