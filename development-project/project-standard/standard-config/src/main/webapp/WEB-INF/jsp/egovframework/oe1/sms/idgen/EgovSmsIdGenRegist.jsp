<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%
  /**
  * @Class Name : EgovSmsIdGenRegist.jsp
  * @Description : Id Gen 추가 등록 화면
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
<title>ID Gen Config Regist</title>


</head>
<body>

<script type="text/javaScript" language="javascript" defer="defer">
//<!--

var tableIdGen = new Array(<c:out value='${tableIdGen}' escapeXml='false'/>);
var seqIdGen = new Array(<c:out value='${seqIdGen}' escapeXml='false'/>);
var uuIdGen = new Array(<c:out value='${uuIdGen}' escapeXml='false'/>);
var stretegy = new Array(<c:out value='${stretegy}' escapeXml='false'/>);

var tableIdGenSize = tableIdGen.length;
var seqIdGenSize = seqIdGen.length;
var uuIdGenSize = uuIdGen.length;
var stretegySize = stretegy.length;

var rowLength =0;


function fn_egov_goList(){
	$('#contents').load("<c:url value='/ole/sms/selectIdGenServiceBeanList.sms'/>");
}
function fn_egov_save(){

	if(checkValue()){
		var options = { 
			   	   success     : responseCtl,   
			       url         : "<c:url value='/ole/sms/insertNewIdGenServiceBean.sms'/>",
			       type        : "post", /* get, post */
			       dataType    : "html" /* xml, html, script, json */
			}; 
		jQuery("#beanVO").ajaxSubmit( options );
	}
	
}

function fn_egov_delete(){
	var options = { 
		   	   success     : responseCtl,
		       url         : "<c:url value='/ole/sms/deleteIdGenServiceBean.sms'/>",
		       type        : "post", /* get, post */
		       dataType    : "html" /* xml, html, script, json */
		}; 
	jQuery("#beanVO").ajaxSubmit( options );
}


function fn_egov_preview(){

	if(checkBeforePreviw()){
		frm = document.beanVO;
		
	    window.open("","POP_COMAS","resizable=1,width=800,height=500,scrollbars=yes");
	    frm.method="post";
	    frm.action="<c:url value='/ole/sms/previewIdGenServiceBean.sms'/>";
	    frm.target="POP_COMAS";
	    frm.submit();
	}	
}

function responseCtl(html, status){

	if(html.indexOf("EgovSmsIdGenRegist.jsp") > 0){
		alert("동일한이름의 빈이 이미 존재하여 추가 할 수 없습니다.");
		
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

	var beanNm = trim(document.beanVO.beanNm.value);
	var beanClassNm = trim(document.beanVO.beanClassNm.value);
	var destroyMethodNm = trim(document.beanVO.destroyMethodNm.value);
	var deleteGbnCount;


	if(!checkBeanSpChar(beanNm)){
		return false;
	}

	if(!checkBeanSpChar(destroyMethodNm)){
		return false;
	}
	
	if(!checkKoreanLang(beanNm)){
		return false;
	}

	if(!checkKoreanLang(destroyMethodNm)){
		return false;
	}
	
	if(lastRow == 3){
		deleteGbnCount = 0;
	}else if(lastRow > 3){
		deleteGbnCount = document.beanVO.deleteGbn.length;
	}

	if(beanNm == ''){
		alert('빈 명은 필수 입력사항 입니다.');
		return false;
	}

	if(beanClassNm == ''){
		alert('빈 클래스명은 필수 입력사항 입니다.');
		return false;
	}
	
	if(lastRow > 4){

		for(var i=0 ; i< deleteGbnCount ;i++){
			var propertyNm = trim(document.beanVO.propertyNm[i].value);
			var propertyValue = trim(document.beanVO.propertyValue[i].value);
			var propertyRef = trim(document.beanVO.propertyRef[i].value);

			if(propertyNm == ''){
				alert('프로퍼티 명은 필수 입력사항 입니다.');
				return false;
			}

			if(!checkPropertyNm(propertyNm, i)){
				return false;
			}
			
			if(propertyValue == '' && propertyRef == ''){
				alert('각 프로퍼티는 프로퍼티 값 및 레퍼런스 중\n하나는 반드시 입력하여야 합니다.');
				return false;
			}
			if(!checkKoreanLang(propertyValue) || !checkKoreanLang(propertyRef)){
				return false;
			}

			if(!checkSpChar(propertyValue) || !checkSpChar(propertyRef)){
				return false;
			}

			if(propertyValue  != '' && propertyRef != ''){
				alert('각 프로퍼티는 프로퍼티 값 및 레퍼런스 둘 중\n하나만 입력할 수 있습니다.');
				return false;
			}
				
			
		}
	}else if(lastRow == 3){
		
		alert('프로퍼티를 추가하시기 바랍니다.');
		return false;
		
	}else{
		var propertyNm = trim(document.beanVO.propertyNm.value);
		var propertyValue = trim(document.beanVO.propertyValue.value);
		var propertyRef = trim(document.beanVO.propertyRef.value);

		if(propertyNm == ''){
			alert('프로퍼티 명은 필수 입력사항 입니다.');
			return false;
		}

		if(!checkPropertyNm(propertyNm, 0)){
			return false;
		}

		if(propertyValue  == '' && propertyRef == ''){
			alert('각 프로퍼티는 프로퍼티 값 및 레퍼런스 중\n하나는 반드시 입력하여야 합니다.');
			return false;
		}

		if(!checkKoreanLang(propertyValue) || !checkKoreanLang(propertyRef)){
			return false;
		}

		if(!checkSpChar(propertyValue) || !checkSpChar(propertyRef)){
			return false;
		}

		if(propertyValue  != '' && propertyRef != ''){
			alert('각 프로퍼티는 프로퍼티 값 및 레퍼런스 둘 중\n하나만 입력할 수 있습니다.');
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

  // 1 cell
  var cell1 = row.insertCell(0);
  var el = document.createElement('input');
  el.type = 'checkbox';
  el.name = 'deleteGbn';
  el.id = 'deleteGbn';
  el.size = 10;
   
  cell1.appendChild(el);
  
  // 1 cell
  var cell2 = row.insertCell(1);
  var textNode = document.createTextNode('프로퍼티');
  cell2.style.size="10%";
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
  var el = document.createElement('select');
  el.name = 'propertyNm';
  el.id = 'propertyNm';
  el.style.width ='190px';

  var chClassNm = document.beanVO.beanClassNm.value;
  if(chClassNm == "egovframework.rte.fdl.idgnr.impl.EgovTableIdGnrService"){
	  for (var i = 0; i < tableIdGenSize; i++) {  
		  var newOption = document.createElement("OPTION");
		  newOption.text=tableIdGen[i];
		  newOption.value=tableIdGen[i];                    
		  el.options[i] = new Option(newOption.text,newOption.value);  		                         
		} 
	    el.length = i;
			
  }else if(chClassNm == "egovframework.rte.fdl.idgnr.impl.EgovSequenceIdGnrService"){
	  for (var i = 0; i < seqIdGenSize; i++) {  
		  var newOption = document.createElement("OPTION");
		  newOption.text=seqIdGen[i];
		  newOption.value=seqIdGen[i];                    
		  el.options[i] = new Option(newOption.text,newOption.value);  		                         
		} 
	    el.length = i;
  }else if(chClassNm == "egovframework.rte.fdl.idgnr.impl.EgovUUIdGnrService"){
	  for (var i = 0; i < uuIdGenSize; i++) {  
		  var newOption = document.createElement("OPTION");
		  newOption.text=uuIdGen[i];
		  newOption.value=uuIdGen[i];                    
		  el.options[i] = new Option(newOption.text,newOption.value);  		                         
		} 
	    el.length = i;
  }else if(chClassNm == "egovframework.rte.fdl.idgnr.impl.strategy.EgovIdGnrStrategyImpl"){
	  for (var i = 0; i < stretegySize; i++) {  
		  var newOption = document.createElement("OPTION");
		  newOption.text=stretegy[i];
		  newOption.value=stretegy[i];                    
		  el.options[i] = new Option(newOption.text,newOption.value);  		                         
		} 
	    el.length = i;
  }
  /*
  el.type = 'text';
  el.name = 'propertyNm';
  el.id = 'propertyNm';
  el.size = 20;
  el.setAttribute("class","inputPropNm");
  */
  
  cell4.appendChild(el);

  //3 cell
  var cell5 = row.insertCell(4);
  var textNode = document.createTextNode('value');
  cell5.style.width="20px";
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
  var el = document.createElement('input');
  el.type = 'text';
  el.name = 'propertyValue';
  el.id = 'propertyValue';
  el.style.width="97%";
  el.style.hight = "14px";
  el.style.border="1px solid #d5d5d5";
  el.style.fontSize = "11px";
  
  cell6.appendChild(el);

  //5 cell
  var cell7 = row.insertCell(6);
  var textNode = document.createTextNode('ref');

  cell7.style.width="20px";
  cell7.style.backgroundColor="#F7F7F7";
  cell7.style.textAlign="center";
  cell7.style.fontWeight="bold";
  cell7.style.color="#000000";
  cell7.style.fontSize="11px";
  cell7.style.borderCollapse="collapse";
  cell7.style.paddingBottom="0px";
  cell7.style.paddingLeft="0px";
  cell7.appendChild(textNode);

  //6 cell
  var cell8 = row.insertCell(7);
  var el = document.createElement('input');
  el.type = 'text';
  el.name = 'propertyRef';
  el.id = 'propertyRef';
  el.style.width="97%";
  el.style.hight = "14px";
  el.style.border="1px solid #d5d5d5";
  el.style.fontSize = "11px";
  
  cell8.appendChild(el);
  
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

function changeClass(){

	var objTable = document.getElementById("tbl");
	var lastRow = objTable.rows.length-1;
	if(lastRow >2){
		var answer = confirm("클래스 변경시 현재 프로퍼티 설정이 삭제 됩니다.\n계속 진행하시겠습니까?")
		
		if(answer){
	
			
			for(var i=lastRow;i >2 ; i--){
					objTable.deleteRow(i);
					rowLength--;
			}
			
		}else{
			return false;
		}
	}
}

function checkPropertyNm(properValue, index){

	var tbl = document.getElementById('tbl');
	var lastRow = tbl.rows.length;
	var deleteGbnCount;
	
	if(lastRow == 3){
		deleteGbnCount = 0;
	}else if(lastRow > 3){
		deleteGbnCount = document.beanVO.deleteGbn.length;
	}
	
	if(lastRow > 4){		
		for(var i=0 ; i< deleteGbnCount ;i++){
			var propertyNm = trim(document.beanVO.propertyNm[i].value);
			
			if(i != index){		
				if(properValue == propertyNm){
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
	
	var beanNm = trim(document.beanVO.beanNm.value);

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
//-->
</script>
<div id="wrap">
		<!-- content 시작 -->
		<div id="content">
<form:form commandName="beanVO" id="beanVO" name="beanVO">
	<input type="hidden" name="htmlString" value="<c:out value='${htmlString}'/>" />
	<div id="h2_topnav"><h2><strong>ID Gen 설정관리 등록</strong></h2></div>
		  	<div id="datail_table">
				<table id="tbl" summary="Bean정보, BeanID, Class명, destroy-method,프로퍼티" class="">
				<caption>ID Gen Config Regist Info</caption>
                  <tr>
                    <th rowspan="3" colspan="2" scope="row" width="15%">bean정보</th>
                    <th colspan="2" width="20%" scope="row">beanID</th>
                    <td colspan="4">
                    	<label for="beanNm">
                    	<form:input path="beanNm"  size="30" maxlength="100" cssClass="inputlarge" /></label>
                    </td>
                  </tr>
                  <tr>
                    <th colspan="2" width="20%" scope="row">class명</th>
                    <td colspan="4">
                    	<label for="beanClassNm">
                    	<form:select path="beanClassNm" cssClass="select" onchange="changeClass();">
								<form:option value="egovframework.rte.fdl.idgnr.impl.EgovTableIdGnrService" label="egovframework.rte.fdl.idgnr.impl.EgovTableIdGnrService" />
								<form:option value="egovframework.rte.fdl.idgnr.impl.EgovSequenceIdGnrService" label="egovframework.rte.fdl.idgnr.impl.EgovSequenceIdGnrService" />
								<form:option value="egovframework.rte.fdl.idgnr.impl.EgovUUIdGnrService" label="egovframework.rte.fdl.idgnr.impl.EgovUUIdGnrService" />
								<form:option value="egovframework.rte.fdl.idgnr.impl.strategy.EgovIdGnrStrategyImpl" label="egovframework.rte.fdl.idgnr.impl.strategy.EgovIdGnrStrategyImpl" />
						</form:select></label>			                    
                    </td>
                  </tr>
                  <tr>
                    <th colspan="2" width="20%" scope="row"><label for="destroyMethodNm">destory-method</label></th>
                    <td colspan="4">
                    	<form:input path="destroyMethodNm" size="30" maxlength="100" cssClass="inputlarge" /></td>
                  </tr>
                  	<!-- tr>
                  		<td width="3%"><label for="deleteGbn"><input type="checkbox" id="deleteGbn" name="deleteGbn"/></label></td>
	                    <th scope="row" width="10%">프로퍼티정보</th>
	                    <th width="5%">name</th>	                    
	                    <td width="15%"><label for="propertyNm">
	                    	<form:select path="propertyNm" multiple="false">
	                    		<form:options items="${table_list}" itemValue="codeId" itemLabel="codeNm" />
							</form:select></label></td>
	                    <th width="5%">value</th>
	                    <td width="15%"><label for="propertyValue"><input name="propertyValue" id="propertyValue" size="10" maxlength="30" class="inputsmall" /></label></td>
	                    <th width="5%">ref</th>
	                    <td width="15%"><label for="propertyRef"><input name="propertyRef" id="propertyRef" size="10" maxlength="30" class="inputsmall" /></label></td>
                  	</tr -->
                </table>                	
			</div>
			<div id="btn_style01">
				<a href="/#" onclick="javascript:fn_egov_addRowToTable();return false;"><span>프로퍼티 추가</span></a>
				<a href="/#" onclick="javascript:fn_egov_deleteRowToTable();return false;"><span>프로퍼티 삭제</span></a>
				<a href="/#" onclick="javascript:fn_egov_preview();return false;"><span>미리 보기</span></a>
				<a href="/#" onclick="javascript:fn_egov_save();return false;"><span>저장</span></a>
				<a href="/#" onclick="javascript:fn_egov_goList();return false;"><span>목록</span></a>
			</div>
<input type="hidden" name="serviceNm" value="idGen" />
</form:form>
</div>
</div>
</body>
</html>

