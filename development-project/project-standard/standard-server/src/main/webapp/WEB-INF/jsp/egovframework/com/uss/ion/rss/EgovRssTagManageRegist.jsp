<%--
  Class Name : EgovRssTagManageRegist.jsp
  Description : RSS태그관리 등록
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2010.08.05    장동한          최초 생성
 
    author   : 공통서비스 개발팀 장동한
    since    : 2010.08.05
    
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="ImgUrl" value="/images/egovframework/com/cmm/"/>
<c:set var="CssUrl" value="/css/egovframework/com/"/>
<c:set var="JsUrl" value="/js/egovframework/com/uss/ion/rss/"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>RSS태그관리-등록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css">
<link type="text/css" rel="stylesheet" href="${CssUrl}button.css">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<script type="text/javascript" src="${JsUrl}jquery.js"></script>
<validator:javascript formName="rssManage" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
	document.twitterInfo.pageIndex.value = pageNo;
	document.twitterInfo.action = "<c:url value='/uss/rss/rss/listRssTagManage.do'/>";
   	document.twitterInfo.submit();
}

/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_detail_RssTagManage(unityLinkId){
}
/* ********************************************************
* 상세회면 처리 함수
******************************************************** */
function fn_egov_ColumnSetting_RssTagManage(column){

	if( document.getElementById("tableColumn").selectedIndex > -1){

		var sColumnNm = $("#tableColumn option:selected").val();
		//해당컬럼 검색 똑같은거 입력 안되게 감리요청
		var regTest = new RegExp("#"+sColumnNm+"#");
		if( regTest.test(document.getElementById(column).value) ){
			alert(sColumnNm + " 컬럼명이 중복 되었습니다!");
			return;
		}else{
			document.getElementById(column).value = document.getElementById(column).value + "#"+$("#tableColumn option:selected").val()+"#";
		}
	}
}
/* ********************************************************
* 선택한 테이블 컬럼 가져오기
******************************************************** */
function fn_egov_tableColumn_RssTagManage(){

	if( document.getElementById("trgetSvcTable").selectedIndex == 0){
		 $("#tableColumn").html("");
		return;
	}
	
	var tableName = $("#trgetSvcTable option:selected").val();

	   //success:callbackFunction
	$.ajax({
		   type:"GET",
		   url:"/uss/ion/rss/listRssTagManageTableColumnList.do?tableName="+tableName,
		   dataType:"json",
		   success:function(data){

			   $("#tableColumn").html("");
			   
				for(var index=0 ; index < data.length ; index++) {
					//alert(data[index].text);
					$("#tableColumn").get(0).options[index] = new Option(data[index].text, data[index].value);
				}

		   }, error: function(data, status) { alert( status); }
		  });


	//본문 데이터 삭제
	document.getElementById('bdtTitle').value='';
	document.getElementById('bdtLink').value='';
	document.getElementById('bdtDescription').value='';
	document.getElementById('bdtTag').value='';

}
function fn_egov_tableColumn_RssTagManageIFrame(){
	var tableName = $("#trgetSvcTable option:selected").val();
	document.getElementById("iframeTableColumnView").src = "/uss/ion/rss/listRssTagManageTableColumnView.do?tableName=" + tableName;	
}

/* ********************************************************
 * 초기화 함수
 ******************************************************** */
function fn_egov_init_RssTagManage(){
	
	//대상서비스목록갯수  초기화
	if( document.getElementById("trgetSvcListCo").value == "" || document.getElementById("trgetSvcListCo").value == "0"){
		document.getElementById("trgetSvcListCo").value = "20";
	}
	
}
/* ********************************************************
* 저장
******************************************************** */
function fn_egov_save_RssTagManage(){
	var vFrom = document.rssManage;
	
	if(confirm("<spring:message code="common.save.msg" />")){

		vFrom.action = "/uss/ion/rss/registRssTagManage.do";
		
		if(!validateRssManage(vFrom)){ 			
			return;
		}else{
			vFrom.submit();
		} 
	}
}
</script>
<style type="text/css">
.txaIpt80 {
width : 80px;
}

#divVerify {
font-size : 12px;
color : red;
}
.txaIpt90 {
width : 87%;
}
.txaIpt99 {
width : 97%;
margin:0px 0px 0px 2px;
}

</style>
</head>
<body onLoad="fn_egov_init_RssTagManage();">
<DIV id="content" style="width:712px">
<!-- noscript 태그  -->
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<!-- 등록폼 시작  -->
<form:form commandName="rssManage" name="rssManage" action="" method="post" enctype="multipart/form-data">
	<%-- 상산 타이틀 --%>
<div class="title_left" style="width:100%;margin:0 0 0 0;">
	<h1><img src="<c:out value="${ImgUrl}"/>icon/tit_icon.gif" width="16" height="16" hspace="3" style="vertical-align:middle; display:inline-block;" alt=" ">&nbsp;RSS태그관리 등록</h1>
</div>

	<!--  줄간격조정  -->
<div style="width:100%;border:solid 0px #000000;height:3px"></div>

	<!--  등록  폼 영역-대상서비스/서비스TABLE/헤더 Tag 정보  -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="RSS태그관리  입력폼 을 제공한다.">
<caption>RSS태그관리  입력폼 을 제공한다</caption>
<tr> 
	<th scope="row" width="20%" height="23" class="required_text"><label for="trgetSvcNm">대상서비스명</label><img src="${ImgUrl}icon/required.gif" alt="필수입력" title="필수입력" width="15" height="15"></th>
	<td width="80%">
		<form:input path="trgetSvcNm" size="73" title="대성서비스명" cssClass="txaIpt" maxlength="255"/>
		<div><form:errors path="trgetSvcNm" cssClass="error"/></div>
	</td>
</tr>
<tr> 
	<th scope="row" width="20%" height="23" class="required_text"><label for="trgetSvcTable">대상테이블명</label><img src="${ImgUrl}icon/required.gif" alt="필수입력" title="필수입력" width="15" height="15"></th>
	<td width="80%">
        <form:select path="trgetSvcTable" cssClass="txaIpt" onchange="fn_egov_tableColumn_RssTagManage();">
            <form:option value="" label="선택"/>
            <form:options items="${trgetSvcTableList}" itemValue="code" itemLabel="code"/>
        </form:select>
		<div><form:errors path="trgetSvcTable" cssClass="error"/></div>
	</td>
</tr>
<tr> 
	<th scope="row" width="20%" height="23" class="required_text"><label for="trgetSvcListCo">대상서비스목록갯수</label><img src="${ImgUrl}icon/required.gif" alt="필수입력" title="필수입력" width="15" height="15"></th>
	<td width="80%">
		<form:input path="trgetSvcListCo" size="73" title="대상서비스목록갯수" cssClass="txaIpt" maxlength="5"/>
		<div><form:errors path="trgetSvcListCo" cssClass="error"/></div>
	</td>
</tr>
<tr> 
	<th scope="row" width="20%" height="23" class="required_text"><label for="hderTitle">헤더TITLE</label><img src="${ImgUrl}icon/required.gif" alt="필수입력" title="필수입력" width="15" height="15"></th>
	<td width="80%">
		<form:input path="hderTitle" size="73" title="헤더TITLE" cssClass="txaIpt" maxlength="255"/>
		<div><form:errors path="hderTitle" cssClass="error"/></div>
	</td>
</tr>
<tr> 
	<th scope="row" width="20%" height="23" class="required_text"><label for="hderLink">헤더LINK</label><img src="${ImgUrl}icon/required.gif" alt="필수입력" title="필수입력" width="15" height="15"></th>
	<td width="80%">
		<form:input path="hderLink" size="73" title="헤더LINK" cssClass="txaIpt" maxlength="255"/>
		<div><form:errors path="hderLink" cssClass="error"/></div>
	</td>
</tr>
<tr> 
	<th scope="row" width="20%" height="23" class="required_text"><label for="hderDescription">헤더DSCRIPTION</label><img src="${ImgUrl}icon/required.gif" alt="필수입력" title="필수입력" width="15" height="15"></th>
	<td width="80%">
		<form:textarea path="hderDescription" title="헤더DSCRIPTION" rows="3" cols="20" cssClass="txaClass"/>
		<div><form:errors path="hderDescription" cssClass="error"/></div>
	</td>
</tr>
<tr> 
	<th scope="row" width="20%" height="23" class="required_text">
		<DIV style="margin:0px 15px 0px 0px"><label for="hderTag">헤더TAG</label></DIV>
	</th>
	<td width="80%">
		<form:input path="hderTag" size="73" title="헤더TAG" cssClass="txaIpt" maxlength="255"/>
		<div><form:errors path="hderTag" cssClass="error"/></div>
	</td>
</tr>
<tr> 
	<th scope="row" width="20%" height="23" class="required_text">
		<DIV style="margin:0px 15px 0px 0px"><label for="hderTag">헤더ETC</label></DIV>
	</th>
	<td width="80%">
		<form:textarea path="hderEtc" title="헤더ETC" rows="3" cols="20" cssClass="txaClass"/>
		<div><form:errors path="hderEtc" cssClass="error"/></div>
	</td>
</tr>
</table>
<!--  줄간격조정  -->
<div style="width:100%;border:solid 0px #000000;height:3px"></div>

<!-- 등록  폼 영역-본문 Tag 정보 입력폼/컬럼선택  -->
<table width="700px" style="table-layout:fixed;" border="0" cellpadding="0" cellspacing="1" summary="컬럼 목록/본문RSS입력을  제공한다.">
<caption>컬럼 목록/본문RSS입력을  제공한다</caption>
<tr> 
	<!-- 컬럼선택 -->
	<th scope="col" width="200px">
	<table border="1" cellspacing="0" cellpadding="0" width="98%" align="center" class="table-register" style="table-layout:fixed;" summary="컬럼 목록  제공한다.">
	<caption>컬럼 목록  제공한다</caption>
	<tr>
		<th><center>컬럼</center></th>
	</tr>
	<tr>
		<td height="100px">
		<select name="tableColumn" id="tableColumn" size="7" title="컬럼선택" style="width:99%;height:100px;">
		<option value=""></option>
		</select>
		</td>
	</tr>
	</table>
	</th>
	<!-- 본문입력폼 -->
	<td width="512px">

	<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="본문 Tag 정보 입력 제공한다.">
	<caption>본문 Tag 정보 입력 제공한다</caption>
	<tr> 
		<th scope="row" width="30%" height="23" class="required_text"><label for="bdtTitle">본문TITLE</label><img src="${ImgUrl}icon/required.gif" alt="필수입력" title="필수입력" width="15" height="15"></th>
		<td width="80%">
		<a href="#LINK" onClick="fn_egov_ColumnSetting_RssTagManage('bdtTitle')"><img src="${ImgUrl}icon/action_add.gif" width="13px" height="14px" style="vertical-align:middle; display:inline-block;margin:0px 0px 0px 2px; " alt="컬럼명추가" title="컬럼명추가"></a>
		<form:input path="bdtTitle" size="73" title="본문TITLE" cssClass="txaIpt90" maxlength="255"/>
		<a href="#LINK" onClick="document.getElementById('bdtTitle').value='';"><img src="${ImgUrl}icon/action_delete.gif" width="13px" height="14px" style="vertical-align:middle; display:inline-block;margin:0px 2px 0px 0px; " alt="컬럼명삭제" title="컬럼명삭제"></a>
		<div><form:errors path="bdtTitle" cssClass="error"/></div>
		</td>
	</tr>
	<tr> 
		<th scope="row" height="23" class="required_text"><label for="bdtLink">본문LINK</label><img src="${ImgUrl}icon/required.gif" alt="필수입력" title="필수입력" width="15" height="15"></th>
		<td>
		<a href="#LINK" onClick="fn_egov_ColumnSetting_RssTagManage('bdtLink')"><img src="${ImgUrl}icon/action_add.gif" width="13px" height="14px" style="vertical-align:middle; display:inline-block;margin:0px 0px 0px 2px; " alt="컬럼명추가" title="컬럼명추가"></a>	
		<form:input path="bdtLink" size="73" title="본문LINKE" cssClass="txaIpt90" maxlength="255"/>
		<a href="#LINK" onClick="document.getElementById('bdtLink').value='';"><img src="${ImgUrl}icon/action_delete.gif" width="13px" height="14px" style="vertical-align:middle; display:inline-block;margin:0px 2px 0px 0px; " alt="컬럼명삭제" title="컬럼명삭제"></a>
		<div><form:errors path="bdtLink" cssClass="error"/></div>
		</td>
	</tr>
	<tr> 
		<th scope="row" height="23" class="required_text"><label for="bdtDescription">본문DESCRIPTION</label><img src="${ImgUrl}icon/required.gif" alt="필수입력" title="필수입력" width="15" height="15"></th>
		<td>
		<a href="#LINK" onClick="fn_egov_ColumnSetting_RssTagManage('bdtDescription')"><img src="${ImgUrl}icon/action_add.gif" width="13px" height="14px" style="vertical-align:middle; display:inline-block;margin:0px 0px 0px 2px; " alt="컬럼명추가" title="컬럼명추가"></a>
		<form:input path="bdtDescription" size="73" title="본문DESCRIPTION" cssClass="txaIpt90" maxlength="255"/>
		<a href="#LINK" onClick="document.getElementById('bdtDescription').value='';"><img src="${ImgUrl}icon/action_delete.gif" width="13px" height="14px" style="vertical-align:middle; display:inline-block;margin:0px 2px 0px 0px; " alt="컬럼명삭제" title="컬럼명삭제"></a>
		<div><form:errors path="bdtDescription" cssClass="error"/></div>
		</td>
	</tr>
	<tr> 
		<th scope="row" height="23" class="required_text">
			<DIV style="margin:0px 15px 0px 0px"><label for="bdtTag">본문TAG</label></DIV>
		</th>
		<td>
		<a href="#LINK" onClick="fn_egov_ColumnSetting_RssTagManage('bdtTag')"><img src="${ImgUrl}icon/action_add.gif" width="13px" height="14px" style="vertical-align:middle; display:inline-block;margin:0px 0px 0px 2px; " alt="컬럼명추가" title="컬럼명추가"></a>
		<form:input path="bdtTag" size="73" title="본문TAG" cssClass="txaIpt90" maxlength="255"/>
		<a href="#LINK" onClick="document.getElementById('bdtTag').value='';"><img src="${ImgUrl}icon/action_delete.gif" width="13px" height="14px" style="vertical-align:middle; display:inline-block;margin:0px 2px 0px 0px; " alt="컬럼명삭제" title="컬럼명삭제"></a>
		<div><form:errors path="bdtTag" cssClass="error"/></div>
		</td>
	</tr>
	<tr> 
		<th scope="row" height="23" class="required_text">
			<DIV style="margin:0px 15px 0px 0px"><label for="bdtEtc">본문ETC</label></DIV>
		</th>
		<td>
		<form:textarea path="bdtEtc" title="본문ETC" rows="3" cols="20" cssClass="txaIpt99"/>
		<div><form:errors path="bdtEtc" cssClass="error"/></div>
		</td>
	</tr>
	</table>

	</td>
</tr>
</table>

<!--  줄간격조정  -->
<div style="width:100%;border:solid 0px #000000;height:3px"></div>

<center>
<!--  목록/저장버튼  -->

<table border="0" cellspacing="0" cellpadding="0" align="center" summary="목록/저장버튼을 제공한다.">
<caption>목록/저장버튼을 제공한다</caption>
<tr> 
  <td><img src="${ImgUrl}btn/bu2_left.gif"  width="8" height="20" alt="버튼이미지"></td>
  <td class="btnBackground" nowrap><input type="submit" value="<spring:message code="button.save" />" onclick="fn_egov_save_RssTagManage(); return false;" class="btnNew" style="height:20px;width:26px;" > 
  </td>
  <td><img src="${ImgUrl}btn/bu2_right.gif"  width="8" height="20" alt="버튼이미지"></td>
  <th scope="col">&nbsp;</th>
  <td><img src="${ImgUrl}btn/bu2_left.gif"  width="8" height="20" alt="버튼이미지"></td>
  <td class="btnBackground" nowrap><a href="/uss/ion/rss/listRssTagManage.do"><spring:message code="button.list" /></a> 
  </td>
  <td><img src="${ImgUrl}btn/bu2_right.gif"  width="8" height="20" alt="버튼이미지"></td>      
</tr>
</table>
</center>
<input name="cmd" type="hidden" value="<c:out value='save'/>"/>
</form:form>
</DIV>

</body>
</html>