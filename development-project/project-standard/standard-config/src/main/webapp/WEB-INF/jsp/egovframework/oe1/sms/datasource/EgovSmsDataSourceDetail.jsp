<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%
  /**
  * @Class Name : EgovSmsDataSourceDetail.jsp
  * @Description : DataSource 설정 상세 화면
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
<title>DataSource Config Detail</title>


</head>
<body>
<script type="text/javaScript" language="javascript" defer="defer">
//<!--

var jdbcDS = new Array(<c:out value='${jdbcDs}' escapeXml='false'/>);
var dbcpDS = new Array(<c:out value='${dbcpDs}' escapeXml='false'/>);
var c3DS = new Array(<c:out value='${c3Ds}' escapeXml='false'/>);
var jndiDS = new Array(<c:out value='${jndiDs}' escapeXml='false'/>);

var jdbcDSSize = jdbcDS.length;
var dbcpDSSize = dbcpDS.length;
var c3DSSize = c3DS.length;
var jndiDSSize = jndiDS.length;


function fn_egov_goList(){
	$('#contents').load("<c:url value='/ole/sms/selectDsServiceBeanList.sms'/>");	
}
function fn_egov_save(){

	if(checkValue()){
		var options = { 
			   	   success     : responseCtl,   
			       url         : "<c:url value='/ole/sms/updateDsServiceBean.sms'/>",
			       type        : "post", /* get, post */
			       dataType    : "html" /* xml, html, script, json */
			}; 
		jQuery("#beanVO").ajaxSubmit( options );
	}
	
}


function fn_egov_delete(){
	var options = { 
		   	   success     : responseDeleteCtl,
		       url         : "<c:url value='/ole/sms/deleteDsServiceBean.sms'/>",
		       type        : "post", /* get, post */
		       dataType    : "html" /* xml, html, script, json */
		}; 
	if(confirm("현재 조회된 빈 설정을 삭제 합니다.\n진행하시겠습니까?")){
   		jQuery("#beanVO").ajaxSubmit( options );
   	}
}


function fn_egov_preview(){

	if(checkBeforePreviw()){
		frm = document.beanVO;
	
	    window.open("","POP_COMAS","resizable=1,width=800,height=500,scrollbars=yes");
	    frm.method="post";
	    frm.action="<c:url value='/ole/sms/previewDsServiceBean.sms'/>";
	    frm.target="POP_COMAS";
	    frm.submit();
	}
	
}

function responseCtl(html, status){
	 if(status ='success'){
			 alert('저장 되었습니다.');		
	 }	 
	 $('#contents').html(html);

}

function responseDeleteCtl(html, status){
	 if(status ='success'){
			 alert('삭제 되었습니다.');		
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

	if(!checkSpChar(destroyMethodNm)){
		return false;
	}

	if(!checkKoreanLang(destroyMethodNm)){
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
				alert('프로퍼티 값 및 레퍼런스 중 하나는 반드시 입력하여야 합니다.');
				return false;
			}

			if(!checkKoreanLang(propertyValue) || !checkKoreanLang(propertyRef)){
				return false;
			}

			if(!checkSpOracleChar(propertyValue) || !checkSpOracleChar(propertyRef)){
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

		if(!checkPropertyNm(propertyNm, 1)){
			return false;
		}
		
		if(propertyValue  == '' && propertyRef == ''){
			alert('프로퍼티 값 및 레퍼런스 중 하나는 반드시 입력하여야 합니다.');
			return false;
		}

		if(!checkKoreanLang(propertyValue) || !checkKoreanLang(propertyRef)){
			return false;
		}

		if(!checkSpOracleChar(propertyValue) || !checkSpOracleChar(propertyRef)){
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
  el.style.width = "190px";

  var chClassNm = document.beanVO.beanClassNm.value;
  
  if(chClassNm == "org.springframework.jdbc.datasource.DriverManagerDataSource"){
	  for (var i = 0; i < jdbcDSSize; i++) {  
		  var newOption = document.createElement("OPTION");
		  newOption.text=jdbcDS[i];
		  newOption.value=jdbcDS[i];                    
		  el.options[i] = new Option(newOption.text,newOption.value);  		                         
		} 
	    el.length = i;
			
  }else if(chClassNm == "org.apache.commons.dbcp.BasicDataSource"){

	  for (var i = 0; i < dbcpDSSize; i++) {  
		  var newOption = document.createElement("OPTION");
		  newOption.text=dbcpDS[i];
		  newOption.value=dbcpDS[i];                    
		  el.options[i] = new Option(newOption.text,newOption.value);  		                         
		} 
	    el.length = i;
  }else if(chClassNm == "com.mchange.v2.c3p0.ComboPooledDataSource"){
	  for (var i = 0; i < c3DSSize; i++) {  
		  var newOption = document.createElement("OPTION");
		  newOption.text=c3DS[i];
		  newOption.value=c3DS[i];                    
		  el.options[i] = new Option(newOption.text,newOption.value);  		                         
		} 
	    el.length = i;
  }else if(chClassNm == "org.springframework.jndi.JndiObjectFactoryBean"){
	  for (var i = 0; i < jndiDSSize; i++) {  
		  var newOption = document.createElement("OPTION");
		  newOption.text=jndiDS[i];
		  newOption.value=jndiDS[i];                    
		  el.options[i] = new Option(newOption.text,newOption.value);  		                         
		} 
	    el.length = i;
  }
  
  /*
  var el = document.createElement('input');
  el.type = 'text';
  el.name = 'propertyNm';
  el.id = 'propertyNm';
  el.size = 20;
  el.setAttribute("class","inputsmall");
  */
  cell4.appendChild(el);

  //3 cell
  var cell5 = row.insertCell(4);
  var textNode = document.createTextNode('value');

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
  el.style.width = "97%";
  el.style.hight = "14px";
  el.style.border="1px solid #d5d5d5";
  el.style.fontSize = "11px";
  
  cell6.appendChild(el);

  //5 cell
  var cell7 = row.insertCell(6);
  var textNode = document.createTextNode('ref');

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
  el.style.width = "97%";
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
<input type="hidden" name="beanNm" id="beanNm"  value="<c:out value='${beanVO.beanNm}'/>" />
<input type="hidden" name="beanClassNm" id="beanClassNm"  value="<c:out value='${beanVO.beanClassNm}'/>" />
	<div id="h2_topnav"><h2><strong>DataSource 설정관리 상세</strong></h2></div>
		  	<div id="datail_table">
				<table id="tbl" summary="bean정보, beanID, class명, destory-method, 프로퍼티" class="">
				<caption>DataSource Config Detail Info</caption>
                  <tr>
                    <th rowspan="3" colspan="2" scope="row" width="15%">bean정보</th>
                    <th scope="row" colspan="2" width="20%">beanID</th>
                    <td colspan="4">
                    	<c:out value='${beanVO.beanNm}'/>
                    </td>
                  </tr>
                  <tr>
                    <th scope="row" colspan="2" width="20%">class명</th>
                    <td colspan="4">
                    	<c:out value='${beanVO.beanClassNm}'/>			                    
                    </td>
                  </tr>
                  <tr>
                    <th scope="row" colspan="2" width="20%">destory-method</th>
                    <td colspan="4">
                    	<label for="destroyMethodNm">
                    	<form:input path="destroyMethodNm" size="30" maxlength="100" cssClass="inputlarge" /></label></td>
                  </tr>
                  <c:forEach var="result" items="${bean_list}" varStatus="status" >	
                  	<tr>
                  		<td width="3%"><input type="checkbox" name="deleteGbn" /></td>
	                    <th scope="row" width="10%"><label for="deleteGbn">프로퍼티</label></th>
	                    <th scope="row" width="5%"><label for="propertyNm">name</label></th>	                    
	                    <td width="15%">
	                    	<select name="propertyNm" class="inputsmalGen"> 
		                    	<c:forEach var="result_list" items="${list_vo}" varStatus="status">
									<option value='<c:out value="${result_list.codeId}"/>' <c:if test="${result_list.codeId == result.propertyNm}">selected="selected"</c:if> ><c:out value="${result_list.codeNm}"/></option>
								</c:forEach>	
							</select></td>
	                    <th scope="row" width="5%"><label for="propertyValue">value</label></th>
	                    <td width="15%"><input name="propertyValue" value='<c:out value="${result.propertyValue}"/>' size="10" maxlength="30" class="inputsmall" /></td>
	                    <th scope="row" width="5%"><label for="propertyRef">ref</label></th>
	                    <td width="15%"><input name="propertyRef" value='<c:out value="${result.propertyRef}"/>' size="10" maxlength="30" class="inputsmall" /></td>
                  	</tr>
                  </c:forEach>
                </table>                	
			</div>
			<div id="btn_style01">
				<a title="프로퍼티 추가" href="/#" onclick="javascript:fn_egov_addRowToTable();return false;"><span>프로퍼티 추가</span></a>
				<a title="프로퍼티 삭제" href="/#" onclick="javascript:fn_egov_deleteRowToTable();return false;"><span>프로퍼티 삭제</span></a>
				<a title="미리 보기(새창)" href="/#" onclick="javascript:fn_egov_preview();return false;"><span>미리 보기</span></a>
				<a title="저장" href="/#" onclick="javascript:fn_egov_save();return false;"><span>저장</span></a>
				<a title="삭제" href="/#" onclick="javascript:fn_egov_delete();return false;"><span>삭제</span></a>
				<a title="목록" href="/#" onclick="javascript:fn_egov_goList();return false;"><span>목록</span></a>
			</div>
<input type="hidden" name="serviceNm" value="dataSource" />
</form:form>
</div>
</div>
</body>
</html>

