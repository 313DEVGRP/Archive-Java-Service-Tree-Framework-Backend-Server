<%--
  Class Name : EgovTwitterTrnsmit.jsp
  Description : 쪽지 관리(보내기) 페이지
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2010.07.13    장동한          최초 생성

    author   : 공통서비스 개발팀 장동한
    since    : 2010.07.13

--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%--  자마스크립트 메세지 출력 --%>
${reusltScript}
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>쪽지 관리(보내기)</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>" ></script>
<validator:javascript formName="noteManage" staticJavascript="false" xhtml="true" cdata="false" />
<script type="text/javaScript" language="javascript">
	//웹에디터설정
	_editor_area = "noteCn";
	_editor_url = "<c:url value='/html/egovframework/com/cmm/utl/htmlarea3.0/'/>";
	
	/* ********************************************************
	* 저장
	******************************************************** */
	function fn_egov_save_NoteManage(){
		var vFrom = document.noteManage;
		//수신자 처리
		fn_egov_empList_NoteManage();
		if(confirm("<spring:message code="common.save.msg" />")){
			vFrom.action = "<c:url value='/uss/ion/ntm/registEgovNoteManageActor.do'/>";
			if(!validateNoteManage(vFrom)){
				return;
			}else{
				vFrom.submit();
			}
		}
	}
	
	/* ********************************************************
	* 초기화
	******************************************************** */
	function fn_egov_init_NoteManage(){
		//수신구분 초기화
		document.getElementsByName("recptnSe")[0].checked = true;
		//초기 recptnEmp 삭제 0
	   	document.getElementById("recptnEmp").options[0].selected = true;
		fn_egov_delete_NoteManage(0);
	
		<c:if test="${cmd eq 'reply'}">
			//답변 수신자 처리
			var option = document.createElement("option");
			option.appendChild(document.createTextNode("수신:${noteManageMap.trnsmiterNm}(${noteManageMap.trnsmiterId})"));
			option.setAttribute("value", "${noteManageMap.trnsmiterOrgId}");
			option.recptnSe = "1";
			document.getElementById("recptnEmp").appendChild(option);
		</c:if>
	}

	/* ********************************************************
	* 팝업창에서 수진자 목록에서 값받기
	******************************************************** */
	function fn_egov_recptnEmpOption_NoteManage(sText,sValue,sRecptnSe){
		//수신자가 중복 될때 빠져 나가기
		if(fn_egov_recptnEmpSearch_NoteManage(sValue)){
			return;
		};
		var option = document.createElement("option");
		option.appendChild(document.createTextNode(sText));
		option.setAttribute("value", sValue);
		option.recptnSe = sRecptnSe;
		document.getElementById("recptnEmp").appendChild(option);
	}
	
	/* ********************************************************
	* 수신자 목록 / 참조목록
	******************************************************** */
	function fn_egov_empList_NoteManage(){
		var sbName = "recptnEmp";
		var FValue = document.getElementById(sbName).length;
		var sEmpList = "";
		var sRecptnSeList = "";
		var a = document.getElementById(sbName).options[0].value;
		for(var i=0; i < FValue; i++){
			if(document.getElementById(sbName).options[i].value != ""){
				sEmpList = sEmpList + document.getElementById(sbName).options[i].value + ",";
				sRecptnSeList = sRecptnSeList + document.getElementById(sbName).options[i].recptnSe + ",";
			}
			if(document.getElementById(sbName).value != ""){
				sEmpList = sEmpList + document.getElementById(sbName).value;
			}
		}
		sEmpList = sEmpList.substring(0,sEmpList.length-1);
		sRecptnSeList = sRecptnSeList.substring(0,sRecptnSeList.length-1);
		document.getElementById("recptnEmpList").value = sEmpList;
		document.getElementById("recptnSeList").value = sRecptnSeList;
	}
	
	/* ********************************************************
	* 수신자 삭제
	******************************************************** */
	function fn_egov_delete_NoteManage(nChk){
		var sbName = "recptnEmp";
		var FValue = document.getElementById(sbName).length;
		var DValue = 0;
		//삭제시 삭제 갯수 체크
		if(nChk){
			if(FValue == 0 || document.getElementById(sbName).selectedIndex == -1){
				alert("삭제 가능한 수신자  목록이 없습니다!");
				document.getElementById(sbName).focus();
				return;
			}
		}
		for(var i=FValue-1; i >= 0; i--){
			if(document.getElementById(sbName).options[i].selected == true){
				DValue++;
				document.getElementById(sbName).options[i] = null;
			}
		}
		document.getElementById(sbName).length = FValue-DValue;
	}

	/* ********************************************************
	* 수신자 찾기
	******************************************************** */
	function fn_egov_recptnEmpSearch_NoteManage(sSearchName){
		var sbName = "recptnEmp";
		var FValue = document.getElementById(sbName).length;
		var DValue = 0;
		for(var i=0; i < FValue; i++)
		{
			if(document.getElementById(sbName).options[i].value == sSearchName){
				return true;
			}
		}
		return false;
	}
	
	/* ********************************************************
	* 수신차 찾기 팝업
	******************************************************** */
	/* function fn_egov_recptnEmp_NoteManage(){
		var arrParam = new Array(1);
		arrParam[0] = self;
		window.showModalDialog("<c:url value='/uss/ion/ntm/listEgovNoteEmpList.do'/>", arrParam,"dialogWidth=800px;dialogHeight=500px;resizable=yes;center=yes");
	} */
	
	/* ********************************************************
	* 팝업창  오픈
	******************************************************** */
	function fn_egov_popupOpen_PopupManage(url,name,width,height){
		var left = (screen.width-684)/2;
		var top = (screen.height-500)/3;
		var openWindows = window.open(url,name,"width="+width+",height="+height+",top="+top+",left="+left+",toolbar=no,status=no,location=no,scrollbars=yes,menubar=no,resizable=yes");
		if (window.focus) {openWindows.focus()}
	}
	
	/* ********************************************************
	* 수신자 목록 이동
	******************************************************** */
	/* 메뉴 끝으로 이동 */
	function fnMenuMoveEnd(oMenu) {
	    var cnt = oMenu.length-1;
	    var i=0;
	
	    for (i=oMenu.length-1; i>=0; i--) {
	        if (Menulist_isSelected(oMenu, i)) {
	            if (i==oMenu.length-1) return;
	            var idx = i;
	
	            for (j=idx;j<cnt;j++) {
	                Menulist_downMenu(oMenu, idx);
	                idx = idx + 1;
	            }
	            cnt = cnt - 1;
	        }
	    }
	}
	/* 메뉴 맨 위로 이동 */
	function fnMenuMoveStart(oMenu) {
	    var i=0;
	    var len = oMenu.length;
	    var cnt = 0;
	    for (i=0; i<oMenu.length; i++) {
	    if (Menulist_isSelected(oMenu, i)) {
	        if (i==0) return;
	        var idx = i;
	
	        for (j=idx;j>cnt;j--) {
	            Menulist_upMenu(oMenu, idx);
	            idx = idx - 1;
	        }
	        cnt = cnt + 1;
	        }
	    }
	}
	/* 메뉴 위로 이동 */
	function fnMenuMoveUp(oMenu) {
	    var i=0;
	    for (i=0; i<oMenu.length; i++) {
	        if (Menulist_isSelected(oMenu, i)) {
	            if (i==0) return;
	            Menulist_upMenu(oMenu, i);
	        }
	    }
	}
	
	/* 메뉴 아래로 이동 */
	function fnMenuMoveDown(oMenu) {
	    var i=0;
	    for (i=oMenu.length-1; i>=0; i--) {
	        if (Menulist_isSelected(oMenu, i)) {
	            if (i==oMenu.length-1) return;
	            Menulist_downMenu(oMenu, i);
	        }
	    }
	}
	function Menulist_downMenu(oMenu, index) {
	    if (index < 0) return;
	    if (index == oMenu.length-1) {
	        return; // 더 이상 아래로 이동할 수 없을때
	    }
	    Menulist_moveMenu(oMenu, index, 1);
	}
	
	function Menulist_upMenu(oMenu, index) {
	    if (index < 0) return;
	    if (index == 0) {
	        return; // 더 이상 위로 이동할 수 없을때
	    }
	    Menulist_downMenu(oMenu, index-1);
	}
	
	function Menulist_isSelected(oMenu, idx) {
	    return (oMenu.options[idx].selected==true);
	}
	
	function Menulist_moveMenu(oMenu, index, distance) {
	    var tmpOption = new Option(oMenu.options[index].text, oMenu.options[index].value, false, oMenu.options[index].selected);
		tmpOption.recptnSe = oMenu.options[index].recptnSe;
	    for (var i=index; i<index+distance; i++) {
	        oMenu.options[i].text = oMenu.options[i+1].text;
	        oMenu.options[i].value = oMenu.options[i+1].value;
	        oMenu.options[i].recptnSe = oMenu.options[i+1].recptnSe;
	        oMenu.options[i].selected = oMenu.options[i+1].selected;
	    }
	    oMenu.options[index+distance] = tmpOption;
	}
</script>
<script type="text/javascript" src="<c:url value='/html/egovframework/com/cmm/utl/htmlarea3.0/htmlarea.js'/>"></script>
<style type="text/css">
.txaIpt80 {
width : 80px;
}

#divVerify {
font-size : 12px;
color : red;
}
.txaClass2 {width:550px; height:350px;}
.noStyle {background:ButtonFace; BORDER-TOP:0px; BORDER-bottom:0px; BORDER-left:0px; BORDER-right:0px;}
.noStyle th{background:ButtonFace; padding-left:0px;padding-right:0px}
.noStyle td{background:ButtonFace; padding-left:0px;padding-right:0px}
</style>
</head>
<body onLoad="fn_egov_init_NoteManage();">
<DIV id="content" style="width:712px">
<!-- noscript 태그  -->
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<!-- 등록폼 시작  -->
<form:form commandName="noteManage" name="noteManage" action="<c:url value='/uss/ion/ntm/registEgovNoteManageActor.do'/>" method="post" enctype="multipart/form-data" >
<%-- 상산 타이틀 --%>
<div class="title_left" style="width:100%;margin:0 0 0 0;">
<h1><img src="<c:out value="${}"/>icon/tit_icon.gif" width="16" height="16" hspace="3" style="vertical-align:middle; display:inline-block;" alt=" ">&nbsp;쪽지 관리(보내기)</h1>
</div>

<!--  줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0" summary="줄간격을 조정한다">
<caption>줄간격을 조정한다</caption>
<tr>
	<th scope="col" height="3px" style="background-color:#FFFFFF;"> </th>
</tr>
</table>

<!--  등록  폼 영역  -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="쪽지관리  입력을 제공한다.">
<caption>쪽지관리  입력을 제공한다</caption>
<tr>
	<th scope="row" width="20%" height="23" class="required_text"><label for="noteSj">제목</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수입력" title="필수입력" width="15" height="15"></th>
	<td width="80%">
		<form:input path="noteSj" title="제목" size="73" cssClass="txaIpt" maxlength="255"/>
		<div><form:errors path="noteSj" cssClass="error"/></div>
	</td>
</tr>
<tr>
	<th scope="row" width="20%" height="23" class="required_text"><label id="IdTwitterPw">수신자</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수입력" title="필수입력" width="15" height="15"></th>
	<td width="80%">
   <!--  수신자  목록/찾기 영역  -->
	<div style="float:left;padding:0px 10px 0px 0px;border:solid 0px #000000;">
		<table border="0" cellpadding="0" cellspacing="0" summary="수신자 입력을  제공한다.">
		<caption> </caption>
		<tr>
			<td>
			<select name="recptnEmp" title="수신자목록" id="recptnEmp" size="7" style="width:230px;height:80px;" multiple>
			<option value=''></option>
			</select>
			</td>
		</tr>
		<tr>
			<td><div><form:errors path="recptnEmpList" cssClass="error"/></div></td>
		</tr>
		<tr>
			<td>
			<center>
			<table border="0" cellspacing="0" cellpadding="0" align="center" summary="수신자  삭제/위로/아래로 버튼을 제공한다.">
			<caption>수신자  삭제/위로/아래로 버튼을 제공한다</caption>
			<tr>
			     <th scope="col" style="padding:0 0 0 0;"><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>"  width="8" height="20" alt="버튼이미지"></th>
			     <td class="btnBackground"><a href="#LINK" onClick="fn_egov_delete_NoteManage(1);">삭제</a></td>
			     <td style="padding:0 0 0 0;"><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
			     <td style="padding:0 0 0 0;background-color:#f7f7f7;">&nbsp;</td>

			     <td style="padding:0 0 0 0;"><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>"  width="8" height="20" alt="버튼이미지"></td>
			     <td class="btnBackground"><a href="#LINK"  onClick="fnMenuMoveUp(document.getElementById('recptnEmp'))">&nbsp;▲&nbsp;</a></td>
			     <td style="padding:0 0 0 0;"><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
			     <td style="padding:0 0 0 0;;background-color:#f7f7f7">&nbsp;</td>

			     <td style="padding:0 0 0 0;"><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>"  width="8" height="20" alt="버튼이미지"></td>
			     <td class="btnBackground"><a href="#LINK"  onClick="fnMenuMoveDown(document.getElementById('recptnEmp'))">&nbsp;▼&nbsp;</a></td>
			     <td style="padding:0 0 0 0;"><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
			</tr>
			</table>
			</center>
			</td>
		</tr>
		</table>
   </div>
   <div style="float:left;height:20px;padding:80px 10px 0px 0px;border:solid 0px #000000;">
	<form:radiobutton path="recptnSe" value="1"/>수신
	<form:radiobutton path="recptnSe" value="2"/>참조
	<form:errors path="recptnSe" cssClass="error"/>
   </div>
   <div style="float:left;height:20px;padding:80px 10px 0px 0px;border:solid 0px #000000;">
	<a href="<c:url value='/uss/ion/ntm/listEgovNoteEmpListPopup.do'/>" target="_blank" title="수신자/참조자 선택  팝업 새창으로" onclick="fn_egov_popupOpen_PopupManage(<c:url value='/uss/ion/ntm/listEgovNoteEmpListPopup.do'/>,'empPopup',760,400);return false"><img src="<c:url value='/images/egovframework/com/cmm/icon/search2.gif'/>" alt="수신자찾기버튼" title="수신자찾기버튼"></a>
   </div>

	</td>
</tr>

<tr>
	<th scope="row" width="20%" height="23" class="required_text"><label id="IdNoteCn">쪽지 내용</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" alt="필수입력" title="필수입력" width="15" height="15"></th>
	<td width="80%">
		<form:textarea path="noteCn" title="쪽지내용" rows="75" cols="14" cssClass="txaClass2"/>
		<form:errors path="noteCn" cssClass="error"/>

	</td>
</tr>
</table>
<!-- 수신자목록리스트 -->
<input type="hidden" name="recptnEmpList" id="recptnEmpList" value="">
<!-- 수신자구분리스트 -->
<input type="hidden" name="recptnSeList" id="recptnSeList" value="">

<!--  줄간격조정  -->
<div style="width:100%;border:solid 0px #000000;height:3px"></div>

<center>
<!--  보내기 버튼  -->


<table border="0" cellspacing="0" cellpadding="0" align="center" summary="보내기 버튼을 제공한다.">
<caption>보내기 버튼을 제공한다</caption>
<tr>
  <th scope="col"><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>"  width="8" height="20" alt="버튼이미지"></th>
  <td class="btnBackground" nowrap><input type="submit" value="보내기" onclick="fn_egov_save_NoteManage(); return false;" class="btnNew" style="height:20px;width:40px;"></td>
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>"  width="8" height="20" alt="버튼이미지"></td>
</tr>
</table>
</center>
</form:form>
</DIV>

</body>
</html>