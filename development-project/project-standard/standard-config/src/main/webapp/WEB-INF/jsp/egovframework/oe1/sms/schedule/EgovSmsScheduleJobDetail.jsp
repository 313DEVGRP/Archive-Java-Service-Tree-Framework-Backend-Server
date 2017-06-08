<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%
  /**
  * @Class Name : EgovSmsScheduleJobDetail.jsp
  * @Description : 스케줄 설정 상세 화면(Job Detail)
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
<title>Schedule Config Detail</title>


</head>
<body>
<script type="text/javaScript" language="javascript" defer="defer">
//<!--

var JobDetailBean = new Array(<c:out value='${JobDetailBean}' escapeXml='false'/>);
var simpleTrigger = new Array(<c:out value='${simpleTrigger}' escapeXml='false'/>);
var cronTrigger = new Array(<c:out value='${cronTrigger}' escapeXml='false'/>);
var method = new Array(<c:out value='${method}' escapeXml='false'/>);
var factory = new Array(<c:out value='${factory}' escapeXml='false'/>);

var rowLength =0;


function fn_egov_goList(){
	$('#contents').load("<c:url value='/ole/sms/selectScheduleServiceList.sms'/>");	
}


function fn_egov_save(){

	if(checkValue()){
		var options = { 
			   	   success     : responseCtl,
			       url         : "<c:url value='/ole/sms/updateScheduleService.sms'/>",
			       type        : "post", /* get, post */
			       dataType    : "html" /* xml, html, script, json */
			}; 
		jQuery("#beanVO").ajaxSubmit( options );
	}
	
}


function fn_egov_delete(){
	var options = { 
		   	   success     : responseDeleteCtl,
		       url         : "<c:url value='/ole/sms/deleteScheduleService.sms'/>",
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
	    frm.action="<c:url value='/ole/sms/previewDetailScheduleService.sms'/>";
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


function fn_egov_addRowToTable()
{
	var tbl = document.getElementById('tbl');
	  var lastRow = tbl.rows.length;
	  // if there's no header row in the table, then iteration = lastRow + 1
	  var iteration = lastRow;
	  var row = tbl.insertRow(lastRow);

	  var classNm = fn_egov_getSelect();

	  if(classNm == "org.springframework.scheduling.quartz.JobDetailBean"){
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
		  cell2.style.width="30px";
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
		  cell3.style.size="10%";
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

		  el.id = 'propertyNm';
		  el.name = 'propertyNm';
		  el.style.width="170px";
		  el.style.fontSize = "12px";
		  el.onchange = function(e){fn_modify_column(e);};
		  
		  for (var i = 0; i < JobDetailBean.length; i++) {  
			  var newOption = document.createElement("OPTION");
			  newOption.text=JobDetailBean[i];
			  newOption.value=JobDetailBean[i];                    
			  el.options[i] = new Option(newOption.text,newOption.value);  		                         
			} 
		    el.length = i;
		  cell4.appendChild(el);
		  
		  /*
		  var cell4 = row.insertCell(3);
		  var el = document.createElement('input');
		  el.type = 'text';
		  el.name = 'propertyNm';
		  el.id = 'propertyNm';
		  el.setAttribute('class','inputsmall');
		  el.size = 26;
		  */
		  cell4.appendChild(el);

		///3 cell
			  var cell5 = row.insertCell(4);
			  var textNode = document.createTextNode('value');

			  cell5.style.size="10%";
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
			  el.style.border="1px solid #d5d5d5";
			  el.style.width = "97%";
			  el.style.fontSize = "11px";
			  el.style.hight = "14px";
			  
			  cell6.appendChild(el);

			  //5 cell
			  var cell7 = row.insertCell(6);
			  var textNode = document.createTextNode('ref');
			  cell7.style.size="10%";
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
			  el.style.border="1px solid #d5d5d5";
			  el.style.width = "97%";
			  el.style.fontSize = "11px";
			  el.style.hight = "14px";


			  /*
			  var e2 = document.createElement('input');
			  e2.type = 'hidden';
			  e2.name = 'propskeyNm';
			  e2.id = 'propskeyNm';

			  var e3 = document.createElement('input');
			  e3.type = 'hidden';
			  e3.name = 'propsKeyValue';
			  e3.id = 'propsKeyValue';

			  var e4 = document.createElement('input');
			  e4.type = 'hidden';
			  e4.name = 'refBeanNm';
			  e4.id = 'refBeanNm';
			  */
			  cell8.appendChild(el);
			  /*
			  cell8.appendChild(e2);
			  cell8.appendChild(e3);
			  cell8.appendChild(e4);
		  */
		  rowLength++;
	   }

	  fn_adjust_column();
}

function fn_modify_column(e){

	var objTable = document.getElementById("tbl");
	var lastRow = objTable.rows.length-1;
	var rtnCnt =0;
	var eventVal;
	
	var evt = e || window.event;
	var eventVal = evt.target || evt.srcElement;

	var classNm = fn_egov_getSelect();

	for(var i=lastRow;i>2;i--){
		var selectedIndex = document.getElementsByTagName("TR")[i].cells[3].firstChild.selectedIndex;		
		var selectedNm = document.getElementsByTagName("TR")[i].cells[3].firstChild.options[selectedIndex].value;

		if(eventVal == document.getElementsByTagName("TR")[i].cells[3].firstChild){
			  if(selectedNm == 'quartzProperties'){
			  
				  var tbl = document.getElementById('tbl');
				  
				  
				  var row = tbl.insertRow(i+1);
	
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
				  cell2.style.width="30px";
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
				  cell3.style.size="10%";
				  cell3.style.backgroundColor="#F7F7F7";
				  cell3.style.textAlign="center";
				  cell3.style.fontWeight="bold";
				  cell3.style.color="#000000";
				  cell3.style.fontSize="11px";
				  cell3.style.borderCollapse="collapse";
				  cell3.style.paddingBottom="0px";
				  cell3.style.paddingLeft="0px";
				  cell3.appendChild(textNode);
	
	
				  var cell4 = row.insertCell(3);
				  var el = document.createElement('select');
	
				  el.id = 'quartzPropertyNm';
				  el.name = 'quartzPropertyNm';
				  el.style.width="170px";
				  el.style.fontSize = "12px";
				  el.onchange = function(e){fn_modify_column(e);};
				  
				  var index;
				  for (var j = 0; j < factory.length; j++) {  
					  var newOption = document.createElement("OPTION");
					  newOption.text=factory[j];
					  newOption.value=factory[j];   
					  if(newOption.value == selectedNm ){
						  index = j;
					  }
					  el.options[j] = new Option(newOption.text,newOption.value);  	
					                           
					} 
					
				    el.length = j;
	
	
					el.options[index].selected = 'selected';
	
				  cell4.appendChild(el);
	
				  /*
				  // 2 cell
				  var cell4 = row.insertCell(3);
				  var el = document.createElement('input');
				  el.type = 'text';
				  el.name = 'propertyNm';
				  el.id = 'propertyNm';
				  el.setAttribute('class','inputsmall');
				  el.size = 26;
				  
				  cell4.appendChild(el);
		          */
				  //3 cell
				  var cell5 = row.insertCell(4);
				  var textNode = document.createTextNode('key');
	
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
				  el.name = 'quartzPropKey';
				  el.id = 'quartzPropKey';
				  el.style.border="1px solid #d5d5d5";
				  el.style.width = "97%";
				  el.style.fontSize = "11px";
				  el.style.hight = "14px";
				  
				  cell6.appendChild(el);
	
				  //5 cell
				  var cell7 = row.insertCell(6);
				  var textNode = document.createTextNode('value');
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
				  el.name = 'quartzPropValue';
				  el.id = 'quartzPropValue';
				  el.style.border="1px solid #d5d5d5";
				  el.style.width = "97%";
				  el.style.fontSize = "11px";
				  el.style.hight = "14px";
				  				  
				  cell8.appendChild(el);
				  
				  cell8.setAttribute('colSpan', 3);
				  //cell8.colspan="3";
				  //rowLength++;
	
				//var row = ;
				 tbl.deleteRow(i);
				 //rowLength--;
			  }else if(selectedNm == 'triggers'){
			  
				  var tbl = document.getElementById('tbl');
				  
				  
				  var row = tbl.insertRow(i+1);
	
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
				  cell2.style.width="30px";
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
				  cell3.style.size="10%";
				  cell3.style.backgroundColor="#F7F7F7";
				  cell3.style.textAlign="center";
				  cell3.style.fontWeight="bold";
				  cell3.style.color="#000000";
				  cell3.style.fontSize="11px";
				  cell3.style.borderCollapse="collapse";
				  cell3.style.paddingBottom="0px";
				  cell3.style.paddingLeft="0px";
				  cell3.appendChild(textNode);
	
	
				  var cell4 = row.insertCell(3);
				  var el = document.createElement('select');
	
				  el.id = 'triggerPropertyNm';
				  el.name = 'triggerPropertyNm';
				  el.style.width="170px";
				  el.style.fontSize = "12px";
				  el.onchange = function(e){fn_modify_column(e);};
				  
				  var index;
				  for (var j = 0; j < factory.length; j++) {  
					  var newOption = document.createElement("OPTION");
					  newOption.text=factory[j];
					  newOption.value=factory[j];   
					  if(newOption.value == selectedNm ){
						  index = j;
					  }
					  el.options[j] = new Option(newOption.text,newOption.value);  	
					                           
					} 
					
				    el.length = j;
	
	
					el.options[index].selected = 'selected';
	
				  cell4.appendChild(el);
	
				  /*
				  // 2 cell
				  var cell4 = row.insertCell(3);
				  var el = document.createElement('input');
				  el.type = 'text';
				  el.name = 'propertyNm';
				  el.id = 'propertyNm';
				  el.setAttribute('class','inputsmall');
				  el.size = 26;
				  
				  cell4.appendChild(el);
		          */
				  //3 cell
				  var cell5 = row.insertCell(4);
				  var textNode = document.createTextNode('bean ref');
	
				  cell5.style.size="10%";
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
				  el.name = 'triggerPropRef';
				  el.id = 'triggerPropRef';
				  el.style.border="1px solid #d5d5d5";
				  el.style.width = "97%";
				  el.style.fontSize = "11px";
				  el.style.hight = "14px";
				  
				  cell6.appendChild(el);
	
				  
				  
				  cell6.setAttribute('colSpan', 5);
				  //cell8.colspan="3";
				  //rowLength++;
	
				//var row = ;
				 tbl.deleteRow(i);
				 //rowLength--;
			  }else if(selectedNm == 'jobDataAsMap'){

				  var tbl = document.getElementById('tbl');
				  var row = tbl.insertRow(i+1);
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
				  cell2.style.width="30px";
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
				  cell3.style.size="10%";
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

				  el.id = 'dataAsMapPropertyNm';
				  el.name = 'dataAsMapPropertyNm';
				  el.style.width="170px";
				  el.style.fontSize = "12px";
				  el.onchange = function(e){fn_modify_column(e);};
				  
				  var index;
				  for (var k = 0; k < JobDetailBean.length; k++) {  
					  var newOption = document.createElement("OPTION");
					  newOption.text=JobDetailBean[k];
					  newOption.value=JobDetailBean[k];  

					  if(newOption.value == selectedNm ){
						  index = k;
					  }
					                    
					  el.options[k] = new Option(newOption.text,newOption.value);  		                         
					} 
				    el.length = k;
				  cell4.appendChild(el);

				  el.options[index].selected = 'selected';

				  /*
				  var cell4 = row.insertCell(3);
				  var el = document.createElement('input');
				  el.type = 'text';
				  el.name = 'propertyNm';
				  el.id = 'propertyNm';
				  el.setAttribute('class','inputsmall');
				  el.size = 26;
				  
				  cell4.appendChild(el);
				  */
				  var cell5 = row.insertCell(4);
				  var textNode = document.createTextNode('key');

				  cell5.style.width="13px";
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
				  el.name = 'dataAsMapKeyNm';
				  el.id = 'dataAsMapKeyNm';
				  el.style.border="1px solid #d5d5d5";
				  el.style.width = "97%";
				  el.style.fontSize = "11px";
				  el.style.hight = "14px";
				  
				  cell6.appendChild(el);
				  
				  //3 cell
				  var cell7 = row.insertCell(6);
				  var textNode = document.createTextNode('value');

				  cell7.style.width="13px";
				  cell7.style.backgroundColor="#F7F7F7";
				  cell7.style.textAlign="center";
				  cell7.style.fontWeight="bold";
				  cell7.style.color="#000000";
				  cell7.style.fontSize="11px";
				  cell7.style.borderCollapse="collapse";
				  cell7.style.paddingBottom="0px";
				  cell7.style.paddingLeft="0px";
				  cell7.appendChild(textNode);

				  //4 cell
				  var cell8 = row.insertCell(7);
				  var el = document.createElement('input');
				  el.type = 'text';
				  el.name = 'dataAsMapKeyValue';
				  el.id = 'dataAsMapKeyValue';
				  el.style.border="1px solid #d5d5d5";
				  el.style.width = "97%";
				  el.style.fontSize = "11px";
				  el.style.hight = "14px";
				  
				  cell8.appendChild(el);

				  //5 cell
				  var cell9 = row.insertCell(8);
				  var textNode = document.createTextNode('value\n-ref');
				  cell9.style.width="13px";
				  cell9.style.backgroundColor="#F7F7F7";
				  cell9.style.textAlign="center";
				  cell9.style.fontWeight="bold";
				  cell9.style.color="#000000";
				  cell9.style.fontSize="11px";
				  cell9.style.borderCollapse="collapse";
				  cell9.style.paddingBottom="0px";
				  cell9.style.paddingLeft="0px";
				  cell9.appendChild(textNode);

				  //6 cell
				  var cell10 = row.insertCell(9);
				  var el = document.createElement('input');
				  el.type = 'text';
				  el.name = 'dataAsMapRef';
				  el.id = 'dataAsMapRef';
				  el.style.border="1px solid #d5d5d5";
				  el.style.width = "97%";
				  el.style.fontSize = "11px";
				  el.style.hight = "14px";
					/*
				//3 cell
				  var cell5 = row.insertCell(4);
				  var textNode = document.createTextNode('key');

				  cell5.style.size="10%";
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
				  el.name = 'dataAsMapKeyNm';
				  el.id = 'dataAsMapKeyNm';
				  el.style.border="1px solid #d5d5d5";
				  el.style.width = "97%";
				  
				  cell6.appendChild(el);
				  
				  //3 cell
				  var cell7 = row.insertCell(6);
				  var textNode = document.createTextNode('value');

				  cell7.style.size="10%";
				  cell7.style.backgroundColor="#F7F7F7";
				  cell7.style.textAlign="center";
				  cell7.style.fontWeight="bold";
				  cell7.style.color="#000000";
				  cell7.style.fontSize="11px";
				  cell7.style.borderCollapse="collapse";
				  cell7.style.paddingBottom="0px";
				  cell7.style.paddingLeft="0px";
				  cell7.appendChild(textNode);

				  //4 cell
				  var cell8 = row.insertCell(7);
				  var el = document.createElement('input');
				  el.type = 'text';
				  el.name = 'dataAsMapKeyValue';
				  el.id = 'dataAsMapKeyValue';
				  el.style.border="1px solid #d5d5d5";
				  el.style.width = "97%";
				  
				  cell8.appendChild(el);
				  */
				  /*
				  var e3 = document.createElement('input');
				  e3.type = 'hidden';
				  e3.name = 'refBeanNm';
				  e3.id = 'refBeanNm';


				  var e4 = document.createElement('input');
				  e4.type = 'hidden';
				  e4.name = 'propertyRef';
				  e4.id = 'propertyRef';
				  */
				  cell10.appendChild(el);
				  /*
				  cell10.appendChild(e3);
				  cell10.appendChild(e4);
*/
				  tbl.deleteRow(i);
			  }else if(selectedNm == 'jobDataMap'){
				  var tbl = document.getElementById('tbl');
				  var row = tbl.insertRow(i+1);
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
				  cell2.style.width="30px";
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
				  cell3.style.size="10%";
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

				  el.id = 'dataMapPropertyNm';
				  el.name = 'dataMapPropertyNm';
				  el.style.width="170px";
				  el.style.fontSize = "12px";
				  el.onchange = function(e){fn_modify_column(e);};
				  
				  var index;
				  for (var k = 0; k < JobDetailBean.length; k++) {  
					  var newOption = document.createElement("OPTION");
					  newOption.text=JobDetailBean[k];
					  newOption.value=JobDetailBean[k];  

					  if(newOption.value == selectedNm ){
						  index = k;
					  }
					                    
					  el.options[k] = new Option(newOption.text,newOption.value);  		                         
					} 
				    el.length = k;
				  cell4.appendChild(el);

				  el.options[index].selected = 'selected';
				  
				  /*
				  var cell4 = row.insertCell(3);
				  var el = document.createElement('input');
				  el.type = 'text';
				  el.name = 'propertyNm';
				  el.id = 'propertyNm';
				  el.setAttribute('class','inputsmall');
				  el.size = 26;
				  */
				  cell4.appendChild(el);

				//3 cell
				
				var cell5 = row.insertCell(4);
				  var textNode = document.createTextNode('key');

				  cell5.style.width="13px";
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
				  el.name = 'dataMapKeyNm';
				  el.id = 'dataMapKeyNm';
				  el.style.border="1px solid #d5d5d5";
				  el.style.width = "97%";
				  el.style.fontSize = "11px";
				  el.style.hight = "14px";
				  
				  cell6.appendChild(el);
				  
				  //3 cell
				  var cell7 = row.insertCell(6);
				  var textNode = document.createTextNode('value');

				  cell7.style.width="13px";
				  cell7.style.backgroundColor="#F7F7F7";
				  cell7.style.textAlign="center";
				  cell7.style.fontWeight="bold";
				  cell7.style.color="#000000";
				  cell7.style.fontSize="11px";
				  cell7.style.borderCollapse="collapse";
				  cell7.style.paddingBottom="0px";
				  cell7.style.paddingLeft="0px";
				  cell7.appendChild(textNode);

				  //4 cell
				  var cell8 = row.insertCell(7);
				  var el = document.createElement('input');
				  el.type = 'text';
				  el.name = 'dataMapKeyValue';
				  el.id = 'dataMapKeyValue';
				  el.style.border="1px solid #d5d5d5";
				  el.style.width = "97%";
				  el.style.fontSize = "11px";
				  el.style.hight = "14px";
				  
				  cell8.appendChild(el);

				  //5 cell
				  var cell9 = row.insertCell(8);
				  var textNode = document.createTextNode('value\n-ref');
				  cell9.style.width="13px";
				  cell9.style.backgroundColor="#F7F7F7";
				  cell9.style.textAlign="center";
				  cell9.style.fontWeight="bold";
				  cell9.style.color="#000000";
				  cell9.style.fontSize="11px";
				  cell9.style.borderCollapse="collapse";
				  cell9.style.paddingBottom="0px";
				  cell9.style.paddingLeft="0px";
				  cell9.appendChild(textNode);

				  //6 cell
				  var cell10 = row.insertCell(9);
				  var el = document.createElement('input');
				  el.type = 'text';
				  el.name = 'dataMapRef';
				  el.id = 'dataMapRef';
				  el.style.border="1px solid #d5d5d5";
				  el.style.width = "97%";
				  el.style.fontSize = "11px";
				  el.style.hight = "14px";


				  /*
				  var cell5 = row.insertCell(4);
				  var textNode = document.createTextNode('key');

				  cell5.style.size="10%";
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
				  el.name = 'dataMapKeyNm';
				  el.id = 'dataMapKeyNm';
				  el.style.border="1px solid #d5d5d5";
				  el.style.width = "97%";
				  
				  cell6.appendChild(el);
				  
				  //3 cell
				  var cell7 = row.insertCell(6);
				  var textNode = document.createTextNode('value');

				  cell7.style.size="10%";
				  cell7.style.backgroundColor="#F7F7F7";
				  cell7.style.textAlign="center";
				  cell7.style.fontWeight="bold";
				  cell7.style.color="#000000";
				  cell7.style.fontSize="11px";
				  cell7.style.borderCollapse="collapse";
				  cell7.style.paddingBottom="0px";
				  cell7.style.paddingLeft="0px";
				  cell7.appendChild(textNode);

				  //4 cell
				  var cell8 = row.insertCell(7);
				  var el = document.createElement('input');
				  el.type = 'text';
				  el.name = 'dataMapKeyValue';
				  el.id = 'dataMapKeyValue';
				  el.style.border="1px solid #d5d5d5";
				  el.style.width = "97%";
				  
				  cell8.appendChild(el);
*/
/*
				  var e3 = document.createElement('input');
				  e3.type = 'hidden';
				  e3.name = 'refBeanNm';
				  e3.id = 'refBeanNm';

				  var e4 = document.createElement('input');
				  e4.type = 'hidden';
				  e4.name = 'propertyRef';
				  e4.id = 'propertyRef'
				  */
				  cell10.appendChild(el);
				  /*
				  cell10.appendChild(e3);
				  cell10.appendChild(e4);
*/
				  tbl.deleteRow(i);
			  }else{


				  var tbl = document.getElementById('tbl');
				  
				  
				  var row = tbl.insertRow(i+1);
				  var classNm = fn_egov_getSelect();
				  
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
				  cell2.style.width="30px";
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
				  cell3.style.size="10%";
				  cell3.style.backgroundColor="#F7F7F7";
				  cell3.style.textAlign="center";
				  cell3.style.fontWeight="bold";
				  cell3.style.color="#000000";
				  cell3.style.fontSize="11px";
				  cell3.style.borderCollapse="collapse";
				  cell3.style.paddingBottom="0px";
				  cell3.style.paddingLeft="0px";
				  cell3.appendChild(textNode);
	
	
				  var cell4 = row.insertCell(3);
				  var el = document.createElement('select');
	
				  el.id = 'propertyNm';
				  el.name = 'propertyNm';
				  el.style.width ="170px";
				  el.style.fontSize = "12px";
				  el.onchange = function(e){fn_modify_column(e);};
				  
				  var index;
/*
				  if(classNm == "org.springframework.scheduling.quartz.SimpleTriggerBean"){
					  for (var j = 0; j < simpleTrigger.length; j++) {  
						  var newOption = document.createElement("OPTION");
						  newOption.text=simpleTrigger[j];
						  newOption.value=simpleTrigger[j];                    
						  el.options[j] = new Option(newOption.text,newOption.value);  		                         
						} 
					    el.length = j;
							
				  }else if(classNm == "org.springframework.scheduling.quartz.CronTriggerBean"){
					  for (var k = 0; k < cronTrigger.length; k++) {  
						  var newOption = document.createElement("OPTION");
						  newOption.text=cronTrigger[k];
						  newOption.value=cronTrigger[k];                    
						  el.options[k] = new Option(newOption.text,newOption.value);  		                         
						} 
					    el.length = k;
				  }else if(classNm == "org.springframework.scheduling.quartz.MethodInvokingJobDetailFactoryBean"){
					  for (var l = 0; l < method.length; l++) {  
						  var newOption = document.createElement("OPTION");
						  newOption.text=method[l];
						  newOption.value=method[l];                    
						  el.options[l] = new Option(newOption.text,newOption.value);  		                         
						} 
					    el.length = l;
				  }else if(classNm == "org.springframework.scheduling.quartz.SchedulerFactoryBean"){
					  for (var n = 0; n < factory.length; n++) {  
						  var newOption = document.createElement("OPTION");
						  newOption.text=factory[n];
						  newOption.value=factory[n];                    
						  el.options[n] = new Option(newOption.text,newOption.value);  		                         
						} 
					    el.length = n;
				  }else 
*/
				   if(classNm == "org.springframework.scheduling.quartz.JobDetailBean"){
					  var index;
					  for (var k = 0; k < JobDetailBean.length; k++) {  
						  var newOption = document.createElement("OPTION");
						  newOption.text=JobDetailBean[k];
						  newOption.value=JobDetailBean[k];  

						  if(newOption.value == selectedNm ){
							  index = k;
						  }
						                    
						  el.options[k] = new Option(newOption.text,newOption.value);  		                         
						} 
					    el.length = k;

					  el.options[index].selected = 'selected';
				  }
				  
				  cell4.appendChild(el);
	
				  /*
				  // 2 cell
				  var cell4 = row.insertCell(3);
				  var el = document.createElement('input');
				  el.type = 'text';
				  el.name = 'propertyNm';
				  el.id = 'propertyNm';
				  el.setAttribute('class','inputsmall');
				  el.size = 26;
				  
				  cell4.appendChild(el);
		          */
				  //3 cell
				  var cell5 = row.insertCell(4);
				  var textNode = document.createTextNode('value');
	
				  cell5.style.size="10%";
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
				  el.style.border="1px solid #d5d5d5";
				  el.style.width = "97%";
				  el.style.fontSize = "11px";
				  el.style.hight = "14px";
				  
				  cell6.appendChild(el);
	
				  //5 cell
				  var cell7 = row.insertCell(6);
				  var textNode = document.createTextNode('ref');
				  cell7.style.size="10%";
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
				  el.style.border="1px solid #d5d5d5";
				  el.style.width = "97%";
				  el.style.fontSize = "11px";
				  el.style.hight = "14px";
				  				  
				  cell8.appendChild(el);
				  
				  cell8.setAttribute('colSpan', 3);
				  //cell8.colspan="3";
				  //rowLength++;
	
				//var row = ;
				 tbl.deleteRow(i);
				 //rowLength--;
			  }
		}
	}

	fn_adjust_column();
}

function fn_adjust_column(){
	var objTable = document.getElementById("tbl");
	var lastRow = objTable.rows.length-1;
	var classNm = fn_egov_getSelect();
	
	var rtnCnt =0;

	for(var i=lastRow;i>2;i--){
				
		var selectedIndex = document.getElementsByTagName("TR")[i].cells[3].firstChild.selectedIndex;		
		var selectedNm = document.getElementsByTagName("TR")[i].cells[3].firstChild.options[selectedIndex].value;

		if(classNm == "org.springframework.scheduling.quartz.SimpleTriggerBean"){
			  
		  }else if(classNm == "org.springframework.scheduling.quartz.CronTriggerBean"){
			 
		  }else if(classNm == "org.springframework.scheduling.quartz.MethodInvokingJobDetailFactoryBean"){
			 
		  }else if(classNm == "org.springframework.scheduling.quartz.SchedulerFactoryBean"){
			  	if(selectedNm == 'quartzProperties'){
					//document.getElementsByTagName("TR")[i].cells[7].colSpan="5";
				}else if(selectedNm == 'triggers'){
					document.getElementsByTagName("TR")[i].cells[5].colSpan="2";
				}else{
				
				}
		  }else if(classNm == "org.springframework.scheduling.quartz.JobDetailBean"){
			  	if(selectedNm == 'jobDataAsMap'){
				}else if(selectedNm == 'jobDataMap'){
				}else{
					document.getElementsByTagName("TR")[i].cells[7].colSpan="3";
				}
		  }
	}

}

function fn_egov_change(){
	//var selectedValue = $("#beanClassNm > option:selected").val();

	var objTable = document.getElementById("tbl");
	var lastRow = objTable.rows.length-1;
	
	for(var i=lastRow;i >2 ; i--){
			objTable.deleteRow(i);
			rowLength--;
	}	
}

function fn_egov_getSelect(){
	//var selectedValue = $("#beanClassNm > option:selected").val();

	var selectedValue = document.beanVO.beanClassNm.value;
	
	return selectedValue;
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
			/*
			for(var i=lastRow;i >0 ; i--){
				if(document.getElementsByTagName("TR")[i].cells[0].firstChild.checked){
					var condition = document.getElementsByTagName("TR")[i].cells[3].firstChild.value;
					if(condition != "quartzProperties" || condition != "triggers"){
						for(var k=lastRow;k >2 ; k--){							
							if(document.getElementsByTagName("TR")[k].cells[3].firstChild.value == condition){
								objTable.deleteRow(k);
							}
						}
						break;
					}else{
						objTable.deleteRow(i);
					}
				}	
			}
			*/
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


function checkValue(){

	var tbl = document.getElementById('tbl');
	var lastRow = tbl.rows.length;
	
	var beanNm = trim(document.beanVO.beanNm.value);
	var beanClassNm = trim(document.beanVO.beanClassNm.value);
	var destroyMethodNm = trim(document.beanVO.destroyMethodNm.value);

	var etcProCnt = 0;
	var jobDataAsMapCnt = 0;
	var jobDataMapCnt = 0;
	
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
	
	if(!checkKoreanLang(beanNm)){
		return false;
	}
	if(!checkKoreanLang(destroyMethodNm)){
		return false;
	}

	
	if(lastRow == 3){
		propertyCnt = 0;
	}else if(lastRow > 3){
		
		if(document.beanVO.propertyNm != null){

			if(checkSelectNumber("propertyNm") > 1){
				propertyCnt = document.beanVO.propertyNm.length;
			}else if(checkSelectNumber("propertyNm")  == 1){
				propertyCnt = 1;
			}else if(checkSelectNumber("propertyNm")  == 0){
				propertyCnt = 0;
			}
			
		}

		if(document.beanVO.dataMapPropertyNm != null){

			if(checkSelectNumber("dataMapPropertyNm") > 1){
				jobDataMapCnt = document.beanVO.dataMapPropertyNm.length;
			}else if(checkSelectNumber("dataMapPropertyNm")  == 1){
				jobDataMapCnt = 1;
			}else if(checkSelectNumber("dataMapPropertyNm")  == 0){
				jobDataMapCnt = 0;
			}
			
		}

		if(document.beanVO.dataAsMapPropertyNm != null){

			if(checkSelectNumber("dataAsMapPropertyNm") > 1){
				jobDataAsMapCnt = document.beanVO.dataAsMapPropertyNm.length;
			}else if(checkSelectNumber("dataAsMapPropertyNm")  == 1){
				jobDataAsMapCnt = 1;
			}else if(checkSelectNumber("dataAsMapPropertyNm")  == 0){
				jobDataAsMapCnt = 0;
			}
			
		}
		
	}
	
	if(lastRow > 4){		
		for(var i=0 ; i< propertyCnt ;i++){
			var propertyNm = trim(document.beanVO.propertyNm[i].value);

			if(propertyNm != 'jobDataAsMap' && propertyNm != 'jobDataMap'){
				etcProCnt = etcProCnt + 1;
			}
	    }

		if(jobDataAsMapCnt > 0){
			if(jobDataAsMapCnt == 1){
				var propK = trim(document.beanVO.dataAsMapKeyNm.value);
				var propV = trim(document.beanVO.dataAsMapKeyValue.value);
				var propR = trim(document.beanVO.dataAsMapRef.value);


				if(propK == ''){
					alert('jobDataAsMap의 프로퍼티 키는  반드시 입력하여야 합니다.');
					return false;
				}
				
				if(propV == '' && propR == ''){
					alert('각 프로퍼티는 프로퍼티 값 및 레퍼런스 중\n하나는 반드시 입력하여야 합니다.');
					return false;
				}

				if(!checkKoreanLang(propK) || !checkKoreanLang(propV) || !checkKoreanLang(propR)){
					return false;
				}

				if(!checkSpChar(propK) || !checkSpChar(propV) || !checkSpChar(propR)){
					return false;
				}

				if(propV  != '' && propR != ''){
					alert('각 프로퍼티는 프로퍼티 값 및 레퍼런스 둘 중\n하나만 입력할 수 있습니다.');
					return false;
				}
				
			}else{

				for(var j=0 ; j< jobDataAsMapCnt ;j++){
					var propK = trim(document.beanVO.dataAsMapKeyNm[j].value);
					var propV = trim(document.beanVO.dataAsMapKeyValue[j].value);
					var propR = trim(document.beanVO.dataAsMapRef[j].value);

					if(propK == ''){
						alert('jobDataAsMap의 프로퍼티 키는  반드시 입력하여야 합니다.');
						return false;
					}
					
					if(propV == '' && propR == ''){
						alert('각 프로퍼티는 프로퍼티 값 및 레퍼런스 중\n하나는 반드시 입력하여야 합니다.');
						return false;
					}

					if(!checkKoreanLang(propK) || !checkKoreanLang(propV) || !checkKoreanLang(propR)){
						return false;
					}

					if(!checkSpChar(propK) || !checkSpChar(propV) || !checkSpChar(propR)){
						return false;
					}

					if(propV  != '' && propR != ''){
						alert('각 프로퍼티는 프로퍼티 값 및 레퍼런스 둘 중\n하나만 입력할 수 있습니다.');
						return false;
					}
				}
			}
		}

		if(jobDataMapCnt > 0){
			if(jobDataMapCnt == 1){
				var propK = trim(document.beanVO.dataMapKeyNm.value);
				var propV = trim(document.beanVO.dataMapKeyValue.value);
				var propR = trim(document.beanVO.dataMapRef.value);

				if(propK == ''){
					alert('jobDataMap의 프로퍼티 키는  반드시 입력하여야 합니다.');
					return false;
				}
				
				if(propV == '' && propR == ''){
					alert('각 프로퍼티는 프로퍼티 값 및 레퍼런스 중\n하나는 반드시 입력하여야 합니다.');
					return false;
				}

				if(!checkKoreanLang(propV) || !checkKoreanLang(propR)){
					return false;
				}

				if(!checkSpChar(propV) || !checkSpChar(propR)){
					return false;
				}

				if(propV  != '' && propR != ''){
					alert('각 프로퍼티는 프로퍼티 값 및 레퍼런스 둘 중\n하나만 입력할 수 있습니다.');
					return false;
				}
				
			}else{

				for(var j=0 ; j< jobDataMapCnt ;j++){
					var propK = trim(document.beanVO.dataMapKeyNm[j].value);
					var propV = trim(document.beanVO.dataMapKeyValue[j].value);
					var propR = trim(document.beanVO.dataMapRef[j].value);

					if(propK == ''){
						alert('jobDataMap의 프로퍼티 키는  반드시 입력하여야 합니다.');
						return false;
					}
					
					if(propV == '' && propR == ''){
						alert('각 프로퍼티는 프로퍼티 값 및 레퍼런스 중\n하나는 반드시 입력하여야 합니다.');
						return false;
					}

					if(!checkKoreanLang(propV) || !checkKoreanLang(propR)){
						return false;
					}

					if(!checkSpChar(propV) || !checkSpChar(propR)){
						return false;
					}

					if(propV  != '' && propR != ''){
						alert('각 프로퍼티는 프로퍼티 값 및 레퍼런스 둘 중\n하나만 입력할 수 있습니다.');
						return false;
					}
				}
			}
		}
					
		if(etcProCnt > 0){
			if(etcProCnt == 1){
				var propV = trim(document.beanVO.propertyValue.value);
				var propR = trim(document.beanVO.propertyRef.value);


				if(propV == '' && propR == ''){
					alert('각 프로퍼티는 프로퍼티 값 및 레퍼런스 중\n하나는 반드시 입력하여야 합니다.');
					return false;
				}

				if(!checkKoreanLang(propV) || !checkKoreanLang(propR)){
					return false;
				}

				if(!checkSpChar(propV) || !checkSpChar(propR)){
					return false;
				}

				if(propV  != '' && propR != ''){
					alert('각 프로퍼티는 프로퍼티 값 및 레퍼런스 둘 중\n하나만 입력할 수 있습니다.');
					return false;
				}
				
			}else{

				for(var j=0 ; j< etcProCnt ;j++){
					var propV = trim(document.beanVO.propertyValue[j].value);
					var propR = trim(document.beanVO.propertyRef[j].value);

					if(propV == '' && propR == ''){
						alert('각 프로퍼티는 프로퍼티 값 및 레퍼런스 중\n하나는 반드시 입력하여야 합니다.');
						return false;
					}

					if(!checkKoreanLang(propV) || !checkKoreanLang(propR)){
						return false;
					}

					if(!checkSpChar(propV) || !checkSpChar(propR)){
						return false;
					}

					if(propV  != '' && propR != ''){
						alert('각 프로퍼티는 프로퍼티 값 및 레퍼런스 둘 중\n하나만 입력할 수 있습니다.');
						return false;
					}
				}
			}
		}	

		if(!checkSameProp()){
			return false;
		}
		
	}else if(lastRow == 3){
		
		alert('프로퍼티를 추가하시기 바랍니다.');
		return false;
		
	}else{

		var propertyCntTmp = 0;
		var jobDataAsMapCntTmp = 0;
		var jobDataMapCntTmp = 0;

		if(document.beanVO.propertyNm != null){
			propertyCntTmp = checkSelectNumber("propertyNm");
		}

		
		if(document.beanVO.dataAsMapPropertyNm != null){
			jobDataAsMapCntTmp = checkSelectNumber("dataAsMapPropertyNm");
		}

		if(document.beanVO.dataMapPropertyNm != null){
			jobDataMapCntTmp = checkSelectNumber("dataMapPropertyNm");
		}
		
		if(propertyCntTmp == 1){
			var propertyValue = trim(document.beanVO.propertyValue.value);
			var propertyRef = trim(document.beanVO.propertyRef.value);

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

		
		if(jobDataAsMapCntTmp == 1){
			var propK = trim(document.beanVO.dataAsMapKeyNm.value);
			var propV = trim(document.beanVO.dataAsMapKeyValue.value);
			var propR = trim(document.beanVO.dataAsMapRef.value);


			if(propK == ''){
				alert('jobDataAsMap의 프로퍼티 키는  반드시 입력하여야 합니다.');
				return false;
			}
			
			if(propV == '' && propR == ''){
				alert('각 프로퍼티는 프로퍼티 값 및 레퍼런스 중\n하나는 반드시 입력하여야 합니다.');
				return false;
			}

			if(!checkKoreanLang(propK) || !checkKoreanLang(propV) || !checkKoreanLang(propR)){
				return false;
			}

			if(!checkSpChar(propK) || !checkSpChar(propV) || !checkSpChar(propR)){
				return false;
			}

			if(propV  != '' && propR != ''){
				alert('각 프로퍼티는 프로퍼티 값 및 레퍼런스 둘 중\n하나만 입력할 수 있습니다.');
				return false;
			}
		}

		if(jobDataMapCntTmp == 1){
			var propK = trim(document.beanVO.dataMapKeyNm.value);
			var propV = trim(document.beanVO.dataMapKeyValue.value);
			var propR = trim(document.beanVO.dataMapRef.value);

			if(propK == ''){
				alert('jobDataMap의 프로퍼티 키는  반드시 입력하여야 합니다.');
				return false;
			}
			
			if(propV == '' && propR == ''){
				alert('각 프로퍼티는 프로퍼티 값 및 레퍼런스 중\n하나는 반드시 입력하여야 합니다.');
				return false;
			}

			if(!checkKoreanLang(propV) || !checkKoreanLang(propR)){
				return false;
			}

			if(!checkSpChar(propV) || !checkSpChar(propR)){
				return false;
			}

			if(propV  != '' && propR != ''){
				alert('각 프로퍼티는 프로퍼티 값 및 레퍼런스 둘 중\n하나만 입력할 수 있습니다.');
				return false;
			}
		}
		

		if(!checkSameProp()){
			return false;
		}
	}

	return true;
}

function checkSameProp(){
	
	var tbl = document.getElementById('tbl');
	var lastRow = tbl.rows.length;
	
	var propFirst;
	var propertyCnt;
	var cnt =0;
	
	
	if(lastRow > 4){


		if(document.beanVO.propertyNm != null){

			if(checkSelectNumber("propertyNm") > 1){
				propertyCnt = document.beanVO.propertyNm.length;
			}
			
		}


		if(propertyCnt > 1){

			for(var i=0 ; i< propertyCnt ;i++){//프로퍼티 중 첫번째 프로퍼티 이름을 가져온다음
	
				var propertyNm = trim(document.beanVO.propertyNm[i].value);

				for(var j=i+1 ; j< propertyCnt ;j++){//첫번째 프로퍼티와 중복되는 값이 있는지 확인 한다.

					var propertyNmComp = trim(document.beanVO.propertyNm[j].value);
					
					if(propertyNmComp == propertyNm){
						cnt = cnt+1;
					}	
			    }

				 if(cnt >= 1){
						alert("quartzProperties 와 triggers 를 제외한 다른 프로퍼티는 \n중복하여 설정할 수 없습니다.");
						return false;
				}
		    }
		}
	    
	}

	return true;

}

function checkSelectNumber(selectName){
	var selLen = 0;
	var selObj = document.beanVO.getElementsByTagName("select");

	for(var i=0; i<selObj.length; i++){
		if(selObj[i].name == selectName ){
			selLen++;
		}
	}

	if(selLen == 1){
		return 1;
	}else if(selLen < 1){
		return 0;
	}else{
		return selLen;
	}
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
<input type="hidden" name="beanNm" id="beanNm" value="<c:out value='${beanVO.beanNm}'/>" />
<input type="hidden" name="beanClassNm" id="beanClassNm" value="<c:out value='${beanVO.beanClassNm}'/>" />
	<div id="h2_topnav"><h2><strong>스케줄 설정관리 상세</strong></h2></div>
		  	<div id="datail_table">
				<table id="tbl" summary="beanID,class명,destory-method,프로퍼티" class="">
				<caption>Schedule Service Config Detail</caption>
                  <tr>
                    <th colspan="2" rowspan="3" scope="row">bean정보</th>
                    <th scope="row" colspan="2">beanID</th>
                    <td colspan="6">
                    	<c:out value='${beanVO.beanNm}'/>
                    </td>
                  </tr>
                  <tr>
                    <th scope="row" colspan="2">class명</th>
                    <td colspan="6">
                   		<c:out value='${beanVO.beanClassNm}'/>			                    
                    </td>
                  </tr>
                  <tr>
                    <th scope="row" colspan="2"><label for="destroyMethodNm">destory-method</label></th>
                    <td colspan="6">
                    	
                    	<form:input path="destroyMethodNm" size="30" maxlength="100" cssClass="inputlarge" /></td>
                  </tr>
                   <c:forEach var="result" items="${bean_list}" varStatus="status" >	
                  	
	                    <c:choose> 
							<c:when test="${result.propertyNm == 'jobDataAsMap'}"> 
	                    	<c:forEach var="jobDataAsMaps" items="${result.jobDataAsMaps}" varStatus="status" >
		                    	<tr>
		                    	<td><input type="checkbox" name="deleteGbn" id="deleteGbn<c:out value='${status.count}' />" /></td>
		                    	<th scope="row"><label for="deleteGbn<c:out value='${status.count}' />" >프로퍼티</label></th>
		                    	<th scope="row"><label for="dataAsMapPropertyNm<c:out value='${status.count}' />">name</label></th>	
		                    	<td><select name="dataAsMapPropertyNm" id="dataAsMapPropertyNm<c:out value='${status.count}' />" onchange="fn_modify_column(event);" class="selectSmall2"> 
				                    	<c:forEach var="result_list" items="${list_vo}" varStatus="status">
											<option value='<c:out value="${result_list.codeId}"/>' <c:if test="${result_list.codeId == result.propertyNm}">selected="selected"</c:if> ><c:out value="${result_list.codeNm}"/></option>
										</c:forEach>	
									</select></td>
		                    	<th scope="row"><label for="dataAsMapKeyNm">key</label></th>
			                    <td><input name="dataAsMapKeyNm" id="dataAsMapKeyNm"  value='<c:out value="${jobDataAsMaps.dataAsMapKeyNm}"/>' size="10" maxlength="30" class="inputsmalfact1" style="width:170px;" /></td>
			                    <th scope="row"><label for="dataAsMapKeyValue">value</label></th>
			                    <td><input name="dataAsMapKeyValue" id="dataAsMapKeyValue" value='<c:out value="${jobDataAsMaps.dataAsMapKeyValue}"/>' size="10" maxlength="30" class="inputsmalfact1" style="width:70px;" /></td>
			                    <th scope="row"><label for="dataAsMapRef">value<br/>-ref</label></th>
			                    <td><input name="dataAsMapRef" id="dataAsMapRef" value='<c:out value="${jobDataAsMaps.dataAsMapRef}"/>' size="10" maxlength="30" class="inputsmalfact1"  style="width:70px;" /></td>
			                    </tr>
		                    </c:forEach>
	                     	</c:when>
	                     	<c:when test="${result.propertyNm == 'jobDataMap'}"> 
		                    <c:forEach var="jobDataMaps" items="${result.jobDataMaps}" varStatus="status" >
			                    	<tr>
			                    	<td><input type="checkbox" name="deleteGbn" id="deleteGbn<c:out value='${status.count}' />" /></td>
			                    	<th scope="row"><label for="deleteGbn">프로퍼티</label></th>
			                    	<th scope="row"><label for="dataMapPropertyNm<c:out value='${status.count}' />">name</label></th>	
			                    	<td><select name="dataMapPropertyNm" id="dataMapPropertyNm<c:out value='${status.count}' />" onchange="fn_modify_column(event);" class="selectSmall2"> 
					                    	<c:forEach var="result_list" items="${list_vo}" varStatus="status">
												<option value='<c:out value="${result_list.codeId}"/>' <c:if test="${result_list.codeId == result.propertyNm}">selected="selected"</c:if> ><c:out value="${result_list.codeNm}"/></option>
											</c:forEach>	
										</select></td>	
			                    	<th scope="row"><label for="dataMapKeyNm">key</label></th>
				                    <td><input name="dataMapKeyNm" id="dataMapKeyNm"  value='<c:out value="${jobDataMaps.dataMapKeyNm}"/>' size="10" maxlength="30" class="inputsmalfact1" style="width:150px;" /></td>
				                    <th scope="row"><label for="dataMapKeyValue">value</label></th>
				                    <td><input name="dataMapKeyValue" id="dataMapKeyValue" value='<c:out value="${jobDataMaps.dataMapKeyValue}"/>' size="10" maxlength="30" class="inputsmalfact1" style="width:97%;" /></td>
				                    <th scope="row"><label for="dataMapRef">value<br/>-ref</label></th>
			                        <td ><input name="dataMapRef" id="dataMapRef" value='<c:out value="${jobDataMaps.dataMapRef}"/>' size="10" maxlength="30" class="inputsmalfact1" style="width:97%;" /></td>
			                   		</tr>
			                 </c:forEach>
	                    	</c:when>
	                    	<c:otherwise>
			                    	<tr>
			                    	<td><input type="checkbox" name="deleteGbn" id="deleteGbn<c:out value='${status.count}' />" /></td>
			                    	<th scope="row"><label for="deleteGbn<c:out value='${status.count}' />" >프로퍼티</label></th>
			                    	<th scope="row"><label for="propertyNm<c:out value='${status.count}' />">name</label></th>	                    
				                    <td ><select name="propertyNm" id="propertyNm<c:out value='${status.count}' />" onchange="fn_modify_column(event);" class="selectSmall2"> 
					                    	<c:forEach var="result_list" items="${list_vo}" varStatus="status">
												<option value='<c:out value="${result_list.codeId}"/>' <c:if test="${result_list.codeId == result.propertyNm}">selected="selected"</c:if> ><c:out value="${result_list.codeNm}"/></option>
											</c:forEach>	
										</select></td>
				                    <th scope="row"><label for="propertyValue">value</label></th>
				                    <td ><input name="propertyValue" id="propertyValue" value='<c:out value="${result.propertyValue}"/>' size="10" maxlength="30" class="inputsmalfact1" style="width:150px;" /></td>
				                    <th scope="row"><label for="propertyRef">ref</label></th>
				                    <td colspan="3"><input name="propertyRef" id="propertyRef" value='<c:out value="${result.propertyRef}"/>' size="10" maxlength="30" class="inputsmalfact2"  style="width:190px;" /></td>

				                    </tr>
	                    	</c:otherwise>
	                    </c:choose>	                    
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
<input type="hidden" name="serviceNm" value="schedule" />
</form:form>
</div>
</div>
</body>
</html>

