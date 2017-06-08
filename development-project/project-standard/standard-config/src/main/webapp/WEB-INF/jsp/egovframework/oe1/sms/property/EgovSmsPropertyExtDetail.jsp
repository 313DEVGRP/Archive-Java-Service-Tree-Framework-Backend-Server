<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%
  /**
  * @Class Name : EgovSmsPropertyExtDetail.jsp
  * @Description : 프로퍼티 설정 상세 화면(external)
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
<title>Property Config Detail</title>


</head>
<body>

<script type="text/javaScript" language="javascript" defer="defer">
//<!--

function fn_egov_goList(){
	$('#contents').load("<c:url value='/ole/sms/selectPropertyList.sms'/>");	
}

function fn_egov_save(){

	if(checkValue()){
		var options = { 
			   	   success     : responseCtl,
			       url         : "<c:url value='/ole/sms/updatePropertyService.sms'/>",
			       type        : "post", /* get, post */
			       dataType    : "html" /* xml, html, script, json */
			}; 
		jQuery("#propertyVO").ajaxSubmit( options );
	}
	
}


function fn_egov_delete(){
	var options = { 
		   	   success     : responseDeleteCtl,
		       url         : "<c:url value='/ole/sms/deletePropertyServiceBean.sms'/>",
		       type        : "post", /* get, post */
		       dataType    : "html" /* xml, html, script, json */
		}; 
	if(confirm("현재 조회된 빈 설정을 삭제 합니다.\n진행하시겠습니까?")){
   		jQuery("#propertyVO").ajaxSubmit( options );
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
	 if(status ='success'){
			 alert('저장 되었습니다.');		
	 }	 
	 $('#contents').html(html);

}

function responseDeleteCtl(html, status){
	 if(status ='success'){
			 alert('삭제 되었습니다.');		
	 }	 
	 $('#content').html(html);

}

function checkValue(){

	var tbl = document.getElementById('tbl');
	var lastRow = tbl.rows.length;
	
	var beanNm = trim(document.propertyVO.beanNm.value);
	var beanClassNm = trim(document.propertyVO.beanClassNm.value);
	var destroyMethodNm = trim(document.propertyVO.destroyMethodNm.value);

	var propEntryValueCount = 0;
	
	if(lastRow == 4){
		propEntryValueCount = 0;
	}else if(lastRow > 4){
		propEntryValueCount = document.propertyVO.propEntryValue.length;
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
	
	if(propEntryValueCount > 1){
		for(var i=0 ; i< propEntryValueCount ;i++){
			var propertyNm = trim(document.propertyVO.propertyNm.value);
			var propEntryValue = trim(document.propertyVO.propEntryValue[i].value);
			
			if(propEntryValue == ''){
				alert('프로퍼티의 값은 \n필수 입력 사항 입니다.');
				return false;
			}

			if(!checkSpChar(propEntryValue)){
				return false;
			}

			if(!checkKoreanLang(propEntryValue)){
				return false;
			}
		}
	}else if(propEntryValueCount == 0){
	
		alert('프로퍼티의 Entry값은 \n필수 입력 사항 입니다.');
		return false;
		
	}else{
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


  //1 cell
  var cell1 = row.insertCell(0);
  var el = document.createElement('input');
  el.type = 'checkbox';
  el.name = 'deleteGbn';
  el.id = 'deleteGbn';
  el.size = 10;
  
  cell1.appendChild(el);
  /*
  // 1 cell
  var cell2 = row.insertCell(1);
  var textNode = document.createTextNode('Entry');
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
  var el = document.createElement('input');
  el.type = 'text';
  el.name = 'propEntryKey';
  el.id = 'propEntryKey';
  el.style.width = "97%";
  el.style.hight = "14px";
  el.style.border="1px solid #d5d5d5";
  el.style.fontSize = "11px";
  
  cell4.appendChild(el);
*/
  //3 cell
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
  var el = document.createElement('input');
  el.type = 'text';
  el.name = 'propEntryValue';
  el.id = 'propEntryValue';
  el.style.width = "97%";	
  el.style.border="1px solid #d5d5d5";
  el.style.fontSize = "11px";
  el.style.hight = "14px";  
  
  cell6.appendChild(el);

  cell6.setAttribute('colSpan', 6);
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

//-->
</script>

<div id="wrap">
		<!-- content 시작 -->
		<div id="content">
<form:form commandName="propertyVO" id="propertyVO" name="propertyVO">
<input type="hidden" name="beanNm" id="beanNm" value="<c:out value='${propertyVO.beanNm}'/>" />
<input type="hidden" name="beanClassNm" id="beanClassNm" value="<c:out value='${propertyVO.beanClassNm}'/>" />
<input type="hidden" name="destroyMethodNm" id="destroyMethodNm" value="<c:out value='${propertyVO.destroyMethodNm}'/>" />
<input type="hidden" name="propertyNm" id="propertyNm" value="<c:out value='${propertyVO.propertyNm}'/>" />
	<div id="h2_topnav"><h2><strong>프로퍼티 설정관리 상세</strong></h2></div>
		  	<div id="datail_table">
				<table id="tbl" summary="Bean정보, BeanID, Class명, destroy-method,프로퍼티명, Entry" class="">
				<caption>Property Config Detail Info(external Property)</caption>
                  <tr>
                    <th rowspan="3" colspan="2" scope="row" width="15%">bean정보</th>
                    <th scope="row" colspan="2" width="15%">beanID</th>
                    <td colspan="4" width="20%">
                    	<c:out value='${propertyVO.beanNm}'/>
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
                    	<c:out value='${propertyVO.destroyMethodNm}'/></td>
                  </tr>
                  <tr>
                    <th scope="row" width="20%" colspan="2"><label for="propertyNm">Property Name</label></th>
                    <td colspan="6">
                    	<c:out value='${propertyVO.propertyNm}'/>
                    </td>
                  </tr>
                  <c:forEach var="result" items="${entry_list}" varStatus="status" >	
                  	<tr>
                  		<td width="2%"><input type="checkbox" name="deleteGbn" id="deleteGbn<c:out value='${status.count}' />" /></td>
	                    <th scope="row" width="6%"><label for="propEntryValue">value</label></th>
	                    <td width="60%" colspan="6" ><input name="propEntryValue" value='<c:out value="${result.propEntryValue}"/>' size="20" maxlength="100" class="inputsmall" /></td>
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
<input type="hidden" name="serviceNm" value="property" />
</form:form>
</div>
</div>
</body>
</html>

