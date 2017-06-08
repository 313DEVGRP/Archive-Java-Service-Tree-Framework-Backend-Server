<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%
  /**
  * @Class Name : EgovSmsPropertyRegist.jsp
  * @Description : 프로퍼티 설정 추가 등록 화면
  * @Modification Information
  * 
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2010.05.25            최초 생성
  *
  * author 운영환경1  개발팀
  * since 2010.05.25
  *  
  * Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Property Config Regist</title>


</head>
<body onload="init();">

<script type="text/javaScript" language="javascript" defer="defer">
//<!--

var rowLength =0;

function fn_egov_goList(){
	$('#contents').load("<c:url value='/ole/sms/selectPropertyList.sms'/>");	
}

function fn_egov_save(){

	if(checkValue()){
		var options = { 
			   	   success     : responseCtl,
			       url         : "<c:url value='/ole/sms/insertNewPropertyBean.sms'/>",
			       type        : "post", /* get, post */
			       dataType    : "html" /* xml, html, script, json */
			}; 
		jQuery("#propertyVO").ajaxSubmit( options );
	}

}


function fn_egov_init(){

    var arrObj = $("#propertyVO input");
    for ( var ii = 0 ; ii < arrObj.length ; ++ii ) {
        arrObj[ii].value = "";
    }
    
    arrObj = $("#propertyVO select");
    for ( var ii = 0 ; ii < arrObj.length ; ++ii ) {
        arrObj[ii].options[0].selected = true;
    }

}


function fn_egov_preview(){

	if(checkBeforePreviw()){
		frm = document.propertyVO;
		
	    window.open("","POP_COMAS","resizable=1,width=800,height=500,scrollbars=yes");
	    frm.method="post";
	    frm.action="<c:url value='/ole/sms/previewPropertyService.sms'/>";
	    frm.target="POP_COMAS";
	    frm.submit();
	}
	
}

function responseCtl(html, status){	
		/*
		 * DIV 를 엎어 쓰게 되어 있어 model 에 들어있는 에러 메시지를 못불러옴
		 * 주석의 파일 명을 기준으로 해서 오류가 없을 경우 Detail 페이지로 돌아가므로
		 * 파일명으로 파싱하여 처리
		 */
		if(html.indexOf("EgovSmsPropertyRegist.jsp") > 0){
			alert("동일한 프로퍼티가 이미 존재하여 추가 할 수 없습니다.");
			
		}else{
			if(status ='success'){
				alert('저장 되었습니다.');					
		 	}
		}
		$('#contents').html(html);	
}

function checkValue(){

	var tbl = document.getElementById('tbl');
	var lastRow = tbl.rows.length;
	
	var beanNm = trim(document.propertyVO.beanNm.value);
	var beanClassNm = trim(document.propertyVO.beanClassNm.value);
	var destroyMethodNm = trim(document.propertyVO.destroyMethodNm.value);

	var propEntryKeyCount = 0;
	var propEntryValueCount = 0;
	var properNm = fn_egov_getSelect();
	
	if(lastRow == 4){
		propEntryKeyCount = 0;
		propEntryValueCount = 0;
	}else if(lastRow == 5){
		if(properNm == 'properties'){
			propEntryKeyCount = 1;
		}else if(properNm == 'extFileName'){
			propEntryValueCount = 1;
		}
	}else if(lastRow > 5){
		if(properNm == 'properties'){
			propEntryKeyCount = document.propertyVO.propEntryKey.length;
		}else if(properNm == 'extFileName'){
			propEntryValueCount = document.propertyVO.propEntryValue.length;
		}
	}

   if(beanNm == ''){
		alert('빈 명은 필수 입력사항 입니다.');
		return false;
	}

	if(beanClassNm == ''){
		alert('빈 클래스명은 필수 입력사항 입니다.');
		return false;
	}

	if(!checkBeanSpChar(beanNm)){
		return false;
	}

	if(!checkBeanSpChar(destroyMethodNm)){
		return false;
	}
	
	if(properNm == 'properties'){	
		if(propEntryKeyCount > 1){
			for(var i=0 ; i< propEntryKeyCount ;i++){
				var propertyNm = trim(document.propertyVO.propertyNm.value);
				var propEntryKey = trim(document.propertyVO.propEntryKey[i].value);
				var propEntryValue = trim(document.propertyVO.propEntryValue[i].value);
	
	
				if(propEntryKey == ''){
					alert('프로퍼티의 Entry명은 \n필수 입력 사항 입니다.');
					return false;
				}
	
				if(propEntryValue == ''){
					alert('프로퍼티의 Entry값은 \n필수 입력 사항 입니다.');
					return false;
				}
	
				if(!checkPropertyNm(propEntryKey, i)){
					return false;
				}
				
				if(!checkSpChar(propEntryKey)){
					return false;
				}
	
				if(!checkSpChar(propEntryValue)){
					return false;
				}
				
				if(!checkKoreanLang(propEntryKey)){
					return false;
				}
	
				if(!checkKoreanLang(propEntryValue)){
					return false;
				}
			}
		}else if(propEntryKeyCount == 1){
			var propertyNm = trim(document.propertyVO.propertyNm.value);
			var propEntryKey = trim(document.propertyVO.propEntryKey.value);
			var propEntryValue = trim(document.propertyVO.propEntryValue.value);
	
			if(propEntryKey == ''){
				alert('프로퍼티의 Entry명은 \n필수 입력 사항 입니다.');
				return false;
			}
	
			if(propEntryValue == ''){
				alert('프로퍼티의 Entry값은 \n필수 입력 사항 입니다.');
				return false;
			}
	
			if(!checkPropertyNm(propEntryKey, 1)){
				return false;
			}
	
			if(!checkSpChar(propEntryKey)){
				return false;
			}
	
			if(!checkSpChar(propEntryValue)){
				return false;
			}
			
			if(!checkKoreanLang(propEntryKey)){
				return false;
			}
	
			if(!checkKoreanLang(propEntryValue)){
				return false;
			}
		}else{
			alert("프로퍼티를 추가 하시기 바랍니다.");
			return false;
		}
	}else if(properNm == 'extFileName'){
		if(propEntryValueCount > 1){
			for(var i=0 ; i< propEntryKeyCount ;i++){
				var propertyNm = trim(document.propertyVO.propertyNm.value);
				var propEntryValue = trim(document.propertyVO.propEntryValue[i].value);
		
				if(propEntryValue == ''){
					alert('프로퍼티의 Entry값은 \n필수 입력 사항 입니다.');
					return false;
				}
	
				if(!checkSpChar(propEntryValue)){
					return false;
				}
				
				if(!checkKoreanLang(propEntryValue)){
					return false;
				}
			}
		}else if(propEntryValueCount == 1){
			var propertyNm = trim(document.propertyVO.propertyNm.value);
			var propEntryValue = trim(document.propertyVO.propEntryValue.value);
	
			if(propEntryValue == ''){
				alert('프로퍼티의 Entry값은 \n필수 입력 사항 입니다.');
				return false;
			}
	
			if(!checkSpChar(propEntryValue)){
				return false;
			}
			
			if(!checkKoreanLang(propEntryValue)){
				return false;
			}
		}else{
			alert("프로퍼티를 추가 하시기 바랍니다.");
			return false;
		}
	}

	return true;
}

function fn_egov_addRowToTable()
{
	  var tbl = document.getElementById('tbl');
	  var lastRow = tbl.rows.length;
	  // if there's no header row in the table, then iteration = lastRow + 1
	  var iteration = lastRow;
	  var row = tbl.insertRow(lastRow);
	  var properNm = fn_egov_getSelect();

	  if(properNm == 'properties'){	
		 
		  //1 cell
		  var cell1 = row.insertCell(0);
		  var el = document.createElement('input');
		  el.type = 'checkbox';
		  el.name = 'deleteGbn';
		  el.id = 'deleteGbn';
		  el.size = 10;
		  cell1.style.width="5px";
		  
		  cell1.appendChild(el);
		  
		  // 1 cell
		  var cell2 = row.insertCell(1);
		  var textNode = document.createTextNode('프로퍼티');
		  cell2.style.width="12%";
		  cell2.style.backgroundColor="#F7F7F7";
		  cell2.style.textAlign="center";
		  cell2.style.fontWeight="bold";
		  cell2.style.color="#000000";
		  cell2.style.fontSize="11px";
		  cell2.style.borderCollapse="collapse";
		  cell2.style.paddingBottom="0px";
		  cell2.style.paddingLeft="0px";
		  cell2.appendChild(textNode);
		
		//1 cell
		  var cell3 = row.insertCell(2);
		  var textNode = document.createTextNode('name');
		  cell3.style.width="4%";
		  cell3.style.backgroundColor="#F7F7F7";
		  cell3.style.textAlign="center";
		  cell3.style.fontWeight="bold";
		  cell3.style.color="#000000";
		  cell3.style.fontSize="11px";
		  cell3.style.borderCollapse="collapse";
		  cell3.style.paddingBottom="0px";
		  cell3.style.paddingLeft="0px";
		  cell3.appendChild(textNode);
		  
		  // 2 cell
		  var cell4 = row.insertCell(3);
		  var e2 = document.createElement('input');
		  e2.type = 'text';
		  e2.name = 'propEntryKey';
		  e2.id = 'propEntryKey';
		  e2.style.border="1px solid #d5d5d5";
		  e2.style.width = "97%";
		  e2.style.hight = "14px";
		  e2.style.fontSize = "11px";
		
		  cell4.appendChild(e2);
		
		  //3 cell
		  var cell5 = row.insertCell(4);
		  var textNode = document.createTextNode('value');

		  cell5.style.width="4%";
		  cell5.style.backgroundColor="#F7F7F7";
		  cell5.style.textAlign="center";
		  cell5.style.fontWeight="bold";
		  cell5.style.color="#000000";
		  cell5.style.fontSize="11px";
		  cell5.style.borderCollapse="collapse";
		  cell5.style.paddingBottom="0px";
		  cell5.style.paddingLeft="0px";
		  cell5.appendChild(textNode);
		
		  //4 cell
		  var cell6 = row.insertCell(5);
		  var e3 = document.createElement('input');
		  e3.type = 'text';
		  e3.name = 'propEntryValue';
		  e3.id = 'propEntryValue';
		  e3.style.width = "97%";
		  e3.style.hight = "14px";	  
		  e3.style.border="1px solid #d5d5d5";
		  e3.style.fontSize = "11px";
		  cell6.appendChild(e3);

		  cell6.setAttribute('colSpan', 3);
		  
	}else if(properNm == 'extFileName'){
		  //1 cell
		  var cell1 = row.insertCell(0);
		  var el = document.createElement('input');
		  cell1.style.width="5px";
		  
		  el.type = 'checkbox';
		  el.name = 'deleteGbn';
		  el.id = 'deleteGbn';
		  el.size = 10;
		  cell1.appendChild(el);
		  
		  var cell5 = row.insertCell(1);
		  var textNode = document.createTextNode('value');

		  cell5.style.width="12%";
		  cell5.style.backgroundColor="#F7F7F7";
		  cell5.style.textAlign="center";
		  cell5.style.fontWeight="bold";
		  cell5.style.color="#000000";
		  cell5.style.fontSize="11px";
		  cell5.style.borderCollapse="collapse";
		  cell5.style.paddingBottom="0px";
		  cell5.style.paddingLeft="0px";
		  cell5.appendChild(textNode);
		
		  //4 cell
		  var cell6 = row.insertCell(2);
		  var e3 = document.createElement('input');
		  e3.type = 'text';
		  e3.name = 'propEntryValue';
		  e3.id = 'propEntryValue';
		  e3.style.width = "97%";	
		  e3.style.hight = "14px";  
		  e3.style.border="1px solid #d5d5d5";
		  e3.style.fontSize = "11px";
		  cell6.appendChild(e3);

		  cell6.setAttribute('colSpan', 6);
	  }
}

function fn_egov_deleteRowToTable()
{

	var objTable = document.getElementById("tbl");
	var lastRow = objTable.rows.length-1;
	var chkCnt = fn_egov_checkCount();

	if(chkCnt > 0){
		if(confirm("선택한 프로퍼티를 삭제하시겠습니까?")){
			for(var i=lastRow;i >0 ; i--){
				if(document.getElementsByTagName("TR")[i].cells[0].firstChild.checked){
					objTable.deleteRow(i);
				}	
			}
		}
	}else {
		alert("삭제할 프로퍼티를 선택하십시오.");
		return;
	}
}

function fn_egov_checkCount(){
	var objTable = document.getElementById("tbl");
	var lastRow = objTable.rows.length-1;
	var rtnCnt =0;

	for(var i=lastRow;i>0;i--){
		if(document.getElementsByTagName("TR")[i].cells[0].firstChild.checked)rtnCnt++;
	}

	return rtnCnt;
}


function checkPropertyNm(properValue, index){

	var tbl = document.getElementById('tbl');
	var lastRow = tbl.rows.length;
	var deleteGbnCount;
	
	if(lastRow == 3){
		deleteGbnCount = 0;
	}else if(lastRow > 3){
		deleteGbnCount = document.propertyVO.deleteGbn.length;
	}
	
	if(lastRow > 4){		
		for(var i=0 ; i< deleteGbnCount ;i++){
			var propEntyNm = trim(document.propertyVO.propEntryKey[i].value);
			
			if(i != index){		
				if(properValue == propEntyNm){
					alert("동일한 프로퍼티명은 입력할 수 없습니다.");
					return false;
				}
			}			
		}
	}

	return true;
	
}

function checkBeforePreviw(){

	var tbl = document.getElementById('tbl');
	var lastRow = tbl.rows.length;
	
	var beanNm = trim(document.propertyVO.beanNm.value);

	if(beanNm == ""){
		alert("미리보기를 위해 Bean ID를 입력하십시오.");
		return false;
	}

	if(lastRow == 3){		
		alert('프로퍼티를 추가하시기 바랍니다.');
		return false;
	}
	
	return true;
}

function fn_egov_getSelect(){
	var selectedValue = $("#propertyNm > option:selected").val();

	return selectedValue;
}

function fn_egov_change(){
	var objTable = document.getElementById("tbl");
	var lastRow = objTable.rows.length-1;

	if(lastRow >3){
		var answer = confirm("프로퍼티 명 변경시 현재 프로퍼티 설정이 삭제 됩니다.\n계속 진행하시겠습니까?")
		
		if(answer){			
			for(var i=lastRow;i >3 ; i--){
					objTable.deleteRow(i);
					rowLength--;
			}
			
		}else{
			return false;
		}
	}
}

//-->
</script>
<div id="wrap">
		<!-- content 시작 -->
		<div id="content">
<form:form commandName="propertyVO" id="propertyVO" name="propertyVO">
<input type="hidden" name="beanClassNm" id="beanClassNm" value="<c:out value='${propertyVO.beanClassNm}'/>" />
	<div id="h2_topnav"><h2><strong>프로퍼티 설정관리 등록</strong></h2></div>
		  	<div id="datail_table">
				<table id="tbl" summary="Bean정보, BeanID, Class명, destroy-method, property Name" class="">
				<caption>Property Config New Regist Info</caption>
                  <tr>
                    <th rowspan="3" colspan="2" scope="row" width="15%">bean정보</th>
                    <th scope="row" colspan="2" width="15%"><label for="beanNm">beanID</label></th>
                    <td colspan="4" width="20%">
                    	<c:choose>
                    		<c:when test="${not empty propertyVO.beanNm}">
                    			<c:out value='${propertyVO.beanNm}'/>
                    			<input type="hidden" name="beanNm" id="beanNm" value="<c:out value='${propertyVO.beanNm}'/>" />
	  						</c:when>
                    		<c:otherwise>
                    			<form:input path="beanNm"  size="30" maxlength="100" cssClass="inputlarge" />	
                    		</c:otherwise>  	
                    	</c:choose>
                    </td>
                  </tr>
                  <tr>
                    <th scope="row" colspan="2" width="15%">class명</th>
                    <td colspan="4">
						<c:out value='${propertyVO.beanClassNm}'/>			                    
                    </td>
                  </tr>
                  <tr>
                    <th scope="row" colspan="2" width="15%">destory-method</th>
                    <td colspan="4">
                    	<label for="destroyMethodNm"><form:input path="destroyMethodNm" size="30" maxlength="100" cssClass="inputlarge" /></label></td>
                  </tr>
                  <tr>
                    <th scope="row" width="20%" colspan="2"><label for="propertyNm">Property Name</label></th>
                    <td colspan="6">                    	
                       <form:select path="propertyNm" cssClass="selectSmall" onchange="javascript:fn_egov_change();" >
								<form:option value="properties" label="properties" />
								<form:option value="extFileName" label="extFileName" />
						</form:select>
					</td>
                  </tr>
                </table>                	
			</div>
			<div id="btn_style01">
				<a title="프로퍼티 추가" href="/#" onclick="javascript:fn_egov_addRowToTable();return false;"><span>프로퍼티 추가</span></a>
				<a title="프로퍼티 삭제" href="/#" onclick="javascript:fn_egov_deleteRowToTable();return false;"><span>프로퍼티 삭제</span></a>
				<a title="미리 보기" href="/#" onclick="javascript:fn_egov_preview();return false;"><span>미리 보기</span></a>
				<a title="저장" href="/#" onclick="javascript:fn_egov_save();return false;"><span>저장</span></a>
				<a title="목록" href="/#" onclick="javascript:fn_egov_goList();return false;"><span>목록</span></a>
			</div>
<input type="hidden" name="serviceNm" value="property" />
</form:form>
</div>
</div>
</body>
</html>

