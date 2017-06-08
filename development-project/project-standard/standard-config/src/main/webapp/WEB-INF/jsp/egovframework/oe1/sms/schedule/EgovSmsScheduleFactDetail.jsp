<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%
  /**
  * @Class Name : EgovSmsScheduleFactDetail.jsp
  * @Description : 스케줄 설정 상세 화면(팩토리 클래스 의 경우 따로 구현함)
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
	 $('#content').html(html);

}

function responseDeleteCtl(html, status){
	 if(status ='success'){
			 alert('삭제 되었습니다.');		
	 }	 
	 $('#content').html(html);

}


function fn_egov_addRowToTable()
{
  var tbl = document.getElementById('tbl');
  var lastRow = tbl.rows.length;
  var iteration = lastRow;
  var row = tbl.insertRow(lastRow);

  var classNm = fn_egov_getSelect();

  if(classNm == "org.springframework.scheduling.quartz.SchedulerFactoryBean"){

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
	  cell2.style.size="12%";
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
	  el.style.width = "190px";
	  el.style.fontSize = "12px";
	  el.onchange = function(e){fn_modify_column(e);};

	  for (var i = 0; i < factory.length; i++) {  
		  var newOption = document.createElement("OPTION");
		  newOption.text=factory[i];
		  newOption.value=factory[i];                    
		  el.options[i] = new Option(newOption.text,newOption.value);  		                         
		} 
	    el.length = i;
	  cell4.appendChild(el);

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
	  rowLength++;
  }

  fn_adjust_column();
 
}

function fn_modify_column(e){

	var objTable = document.getElementById("tbl");
	var lastRow = objTable.rows.length-1;
	var rtnCnt =0;
	
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
				  el.style.width = "190px";
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
				  el.name = 'quartzPropValue';
				  el.id = 'quartzPropValue';
				  el.style.border="1px solid #d5d5d5";
				  el.style.width = "97%";
				  el.style.fontSize = "11px";
				  el.style.hight = "14px";  
				  				  
				  cell8.appendChild(el);
				  
				  //cell8.setAttribute('colSpan', 3);

				 tbl.deleteRow(i);

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
				  el.name = 'triggerPropertyNm';
				  el.style.width = "190px";
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
	
				  //3 cell
				  var cell5 = row.insertCell(4);
				  var textNode = document.createTextNode('ref');
	
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

				  var cell6 = row.insertCell(5);
				  var textNode = document.createTextNode('bean');
	
				  cell6.style.size="10%";
				  cell6.style.backgroundColor="#F7F7F7";
				  cell6.style.textAlign="center";
				  cell6.style.fontWeight="bold";
				  cell6.style.color="#000000";
				  cell6.style.fontSize="11px";
				  cell6.style.borderCollapse="collapse";
				  cell6.style.paddingBottom="0px";
				  cell6.style.paddingLeft="0px";
				  cell6.appendChild(textNode);
	
				  //4 cell
				  var cell7 = row.insertCell(6);
				  var el = document.createElement('input');
				  el.type = 'text';
				  el.name = 'triggerPropRef';
				  el.id = 'triggerPropRef';
				  el.style.border="1px solid #d5d5d5";
				  el.style.width = "97%";
				  el.style.fontSize = "11px";
				  el.style.hight = "14px";  
				  
				  
				  cell7.appendChild(el);
				  cell7.setAttribute('colSpan', 3);
				  
				  tbl.deleteRow(i);

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
				  el.style.width = "190px";
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
				  
				  cell4.appendChild(el);
	
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
				  el.style.fontSize = "11px";
				  el.style.hight = "14px";  
				  
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
				  el.style.fontSize = "11px";
				  el.style.hight = "14px";  
				  
				  cell8.appendChild(el);

				  //5 cell
				  var cell9 = row.insertCell(8);
				  var textNode = document.createTextNode('ref');
				  cell9.style.size="10%";
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

				  var e2 = document.createElement('input');
				  e2.type = 'hidden';
				  e2.name = 'propertyValue';
				  e2.id = 'propertyValue';
				  
				  var e3 = document.createElement('input');
				  e3.type = 'hidden';
				  e3.name = 'refBeanNm';
				  e3.id = 'refBeanNm';


				  var e4 = document.createElement('input');
				  e4.type = 'hidden';
				  e4.name = 'propertyRef';
				  e4.id = 'propertyRef';

				  var e5 = document.createElement('input');
				  e5.type = 'hidden';
				  e5.name = 'propertyNm';
				  e5.id = 'propertyNm';
				  
				  cell10.appendChild(el);

				  cell8.appendChild(e2);
				  cell8.appendChild(e3);
				  cell8.appendChild(e4);
				  cell8.appendChild(e5);

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
				  el.style.width = "190px";
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
				 
				  cell4.appendChild(el);

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
				  el.style.fontSize = "11px";
				  el.style.hight = "14px";  
				  
				  cell8.appendChild(el);

				  //5 cell
				  var cell9 = row.insertCell(8);
				  var textNode = document.createTextNode('ref');
				  cell9.style.size="10%";
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
				  var e2 = document.createElement('input');
				  e2.type = 'hidden';
				  e2.name = 'propertyValue';
				  e2.id = 'propertyValue';

				  var e3 = document.createElement('input');
				  e3.type = 'hidden';
				  e3.name = 'refBeanNm';
				  e3.id = 'refBeanNm';

				  var e4 = document.createElement('input');
				  e4.type = 'hidden';
				  e4.name = 'propertyRef';
				  e4.id = 'propertyRef';

				  var e5 = document.createElement('input');
				  e5.type = 'hidden';
				  e5.name = 'propertyNm';
				  e5.id = 'propertyNm';
				  */
				  cell10.appendChild(el);
/*
				  cell8.appendChild(e2);
				  cell8.appendChild(e3);
				  cell8.appendChild(e4);
				  cell8.appendChild(e5);
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
				  el.style.width = '190px';
				  el.style.fontSize = "12px";
				  el.onchange = function(e){fn_modify_column(e);};
				  
				  var index;

				  if(classNm == "org.springframework.scheduling.quartz.SimpleTriggerBean"){
					  for (var i = 0; i < simpleTrigger.length; i++) {  
						  var newOption = document.createElement("OPTION");
						  newOption.text=simpleTrigger[i];
						  newOption.value=simpleTrigger[i];                    
						  el.options[i] = new Option(newOption.text,newOption.value);  		                         
						} 
					    el.length = i;
							
				  }else if(classNm == "org.springframework.scheduling.quartz.CronTriggerBean"){
					  for (var i = 0; i < cronTrigger.length; i++) {  
						  var newOption = document.createElement("OPTION");
						  newOption.text=cronTrigger[i];
						  newOption.value=cronTrigger[i];                    
						  el.options[i] = new Option(newOption.text,newOption.value);  		                         
						} 
					    el.length = i;
				  }else if(classNm == "org.springframework.scheduling.quartz.MethodInvokingJobDetailFactoryBean"){
					  for (var i = 0; i < method.length; i++) {  
						  var newOption = document.createElement("OPTION");
						  newOption.text=method[i];
						  newOption.value=method[i];                    
						  el.options[i] = new Option(newOption.text,newOption.value);  		                         
						} 
					    el.length = i;
				  }
				  else if(classNm == "org.springframework.scheduling.quartz.SchedulerFactoryBean"){

					  var index;
					  for (var m = 0; m < factory.length; m++) {  
						  var newOption = document.createElement("OPTION");
						  newOption.text=factory[m];
						  newOption.value=factory[m];  

						  if(newOption.value == selectedNm ){
							  index = m;
						  }
						                    
						  el.options[m] = new Option(newOption.text,newOption.value);  		                         
						} 
					  el.length = m;
					  el.options[index].selected = 'selected';
					  
				  }else if(classNm == "org.springframework.scheduling.quartz.JobDetailBean"){

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
				  
				  //cell8.setAttribute('colSpan', 3);
				 
				 tbl.deleteRow(i);
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

				}else if(selectedNm == 'triggers'){
					//document.getElementsByTagName("TR")[i].cells[5].colSpan="2";
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

	var objTable = document.getElementById("tbl");
	var lastRow = objTable.rows.length-1;
	
	for(var i=lastRow;i >2 ; i--){
			objTable.deleteRow(i);
			rowLength--;
	}	
}

function fn_egov_getSelect(){

	var selectedValue = document.beanVO.beanClassNm.value;
	
	return selectedValue;
}


function fn_egov_deleteRowToTable()
{

	var objTable = document.getElementById("tbl");
	var lastRow = objTable.rows.length-1;
	var chkCnt = fn_egov_checkCount();

	if(chkCnt > 0){
		if(confirm("선택하신 프로퍼티를 삭제하시겠습니까?")){

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

	for(var i=lastRow;i>=0;i--){
		
		if(document.getElementsByTagName("TR")[i].cells[0].firstChild.checked){
			rtnCnt++;
		}
		
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
	var triggerCnt = 0;
	var quartzCnt = 0;
	var propertyCnt = 0;
	var quartz_n_cnt = 0;
	var trigger_n_cnt = 0;
	
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
		if(document.beanVO.quartzPropertyNm != null){

			if(checkSelectNumber("quartzPropertyNm") > 1){
				quartz_n_cnt = document.beanVO.quartzPropertyNm.length;
			}else if(checkSelectNumber("quartzPropertyNm")  == 1){
				quartz_n_cnt = 1;
			}else if(checkSelectNumber("quartzPropertyNm")  == 0){
				quartz_n_cnt = 0;
			}
		}

		if(document.beanVO.triggerPropertyNm != null){

			if(checkSelectNumber("triggerPropertyNm") > 1){
				trigger_n_cnt = document.beanVO.triggerPropertyNm.length;
			}else if(checkSelectNumber("triggerPropertyNm")  == 1){
				trigger_n_cnt = 1;
			}else if(checkSelectNumber("triggerPropertyNm")  == 0){
				trigger_n_cnt = 0;
			}
			
		}
	}
	if(lastRow > 4){		
		for(var i=0 ; i< propertyCnt ;i++){
			var propertyNm = trim(document.beanVO.propertyNm[i].value);

			if(propertyNm != 'quartzProperties' && propertyNm != 'triggers'){
				etcProCnt = etcProCnt + 1;
			}
	    }

		for(var j=0 ; j< quartz_n_cnt ;j++){
			quartzCnt = quartzCnt + 1;
		}

		for(var k=0 ; k< trigger_n_cnt ;k++){
			triggerCnt = triggerCnt + 1;
		}
				
		if(triggerCnt > 0){
			if(triggerCnt == 1){
				var triggerProp = trim(document.beanVO.triggerPropRef.value);

				if(triggerProp == ''){
					alert('triggers 프로퍼티의 ref bean 은 필수 입력 사항 입니다.');
					return false;
				}

				if(!checkKoreanLang(triggerProp)){
					return false;
				}

				if(!checkSpChar(triggerProp)){
					return false;
				}
				
			}else{
				for(var j=0 ; j< triggerCnt ;j++){
					var triggerProp = trim(document.beanVO.triggerPropRef[j].value);

					if(triggerProp == ''){
						alert('triggers 프로퍼티의 ref bean 은 필수 입력 사항 입니다.');
						return false;
					}

					if(!checkKoreanLang(triggerProp)){
						return false;
					}

					if(!checkSpChar(triggerProp)){
						return false;
					}
				}
			} 
		}

		if(quartzCnt > 0){
			if(quartzCnt == 1){
				var quartzPropK = trim(document.beanVO.quartzPropKey.value);
				var quartzPropV = trim(document.beanVO.quartzPropValue.value);

				if(quartzPropK == '' || quartzPropV == ''){
					alert('quartzProperties 의 Key, Value 는 필수 입력사항입니다.');
					return false;
				}

				if(!checkKoreanLang(quartzPropK)){
					return false;
				}

				if(!checkSpChar(quartzPropK)){
					return false;
				}

				if(!checkKoreanLang(quartzPropV)){
					return false;
				}

				if(!checkSpChar(quartzPropV)){
					return false;
				}
			}else{
				for(var j=0 ; j< quartzCnt ;j++){
					var quartzPropK = trim(document.beanVO.quartzPropKey[j].value);
					var quartzPropV = trim(document.beanVO.quartzPropValue[j].value);

					if(quartzPropK == '' || quartzPropV == ''){
						alert('quartzProperties 의 Key, Value 는 필수 입력사항입니다.');
						return false;
					}

					if(!checkKoreanLang(quartzPropK)){
						return false;
					}

					if(!checkSpChar(quartzPropK)){
						return false;
					}

					if(!checkKoreanLang(quartzPropV)){
						return false;
					}

					if(!checkSpChar(quartzPropV)){
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


		if(document.beanVO.propertyNm != null){
			propertyCnt = document.beanVO.propertyNm.length;
		}

		if(document.beanVO.quartzPropertyNm != null){
			quartz_n_cnt = document.beanVO.quartzPropertyNm.length;
		}

		if(document.beanVO.triggerPropertyNm != null){
			trigger_n_cnt = document.beanVO.triggerPropertyNm.length;
		}


		if(propertyCnt > 0){
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

		if(quartz_n_cnt > 0){
			var quartzPropKey = trim(document.beanVO.quartzPropKey.value);
			var quartzPropValue = trim(document.beanVO.quartzPropValue.value);

			if(quartzPropKey == '' && quartzPropValue == ''){
				alert('quartzProperties 의 Key, Value 는 필수 입력사항입니다.');
				return false;
			}

			if(!checkKoreanLang(quartzPropKey)){
				return false;
			}

			if(!checkSpChar(quartzPropKey)){
				return false;
			}

			if(!checkKoreanLang(quartzPropValue)){
				return false;
			}

			if(!checkSpChar(quartzPropValue)){
				return false;
			}
		}


		if(trigger_n_cnt > 0){
			var triggerPropRef = trim(document.beanVO.triggerPropRef.value);

			if(triggerPropRef == ''){
				alert('triggers 프로퍼티의 ref bean 은 필수 입력 사항 입니다.');
				return false;
			}

			if(!checkKoreanLang(triggerPropRef)){
				return false;
			}

			if(!checkSpChar(triggerPropRef)){
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
                    <th colspan="2" rowspan="3" scope="row" width="10%">bean정보</th>
                    <th scope="row" colspan="2" width="20%">beanID</th>
                    <td colspan="8">
                    	<c:out value='${beanVO.beanNm}'/>
                    </td>
                  </tr>
                  <tr>
                    <th scope="row" colspan="2" width="20%">class명</th>
                    <td colspan="8">
                   		<c:out value='${beanVO.beanClassNm}'/>			                    
                    </td>
                  </tr>
                  <tr>
                    <th scope="row" colspan="2" width="20%">destory-method</th>
                    <td colspan="8">
                    	<label for="destroyMethodNm">
                    	<form:input path="destroyMethodNm" size="30" maxlength="100" cssClass="inputlarge" /></label></td>
                  </tr>
                  <c:forEach var="result" items="${bean_list}" varStatus="count" >	
                  	
	                    <c:choose> 
							<c:when test="${result.propertyNm == 'quartzProperties'}"> 
	                    	<c:forEach var="quartzs" items="${result.quartzs}" varStatus="status" >
		                    	<tr>
		                    	<td width="3%"><input type="checkbox" name="deleteGbn"/></td>
		                    	<th scope="row" width="15%"><label for="deleteGbn<c:out value='${status.count}' />">프로퍼티</label></th>
		                    	<th scope="row" width="10%"><label for="triggerPropertyNm<c:out value='${status.count}' />">name</label></th>	
		                    	<td><select name="quartzPropertyNm" id="triggerPropertyNm<c:out value='${status.count}' />" class="selectSmall1" onchange="fn_modify_column(event);"> 
				                    	<c:forEach var="result_list" items="${list_vo}" varStatus="status">
											<option value='<c:out value="${result_list.codeId}"/>' <c:if test="${result_list.codeId == result.propertyNm}">selected="selected"</c:if> ><c:out value="${result_list.codeNm}"/></option>
										</c:forEach>	
									</select></td>
		                    	<th scope="row" width="10%"><label for="quartzPropKey">key</label></th>
			                    <td width="90" ><input name="quartzPropKey" id="quartzPropKey"  value='<c:out value="${quartzs.quartzPropKey}"/>' size="10" maxlength="30" class="inputsmalfact2" /></td>
			                    <th scope="row" width="10%"><label for="quartzPropValue">value</label></th>
			                    <td width="114"><input name="quartzPropValue" id="quartzPropValue" value='<c:out value="${quartzs.quartzPropValue}"/>' size="10" maxlength="30" class="inputsmalfact" /></td>
			                    </tr>
		                    </c:forEach>
	                     	</c:when>
	                     	<c:when test="${result.propertyNm == 'triggers'}"> 
		                    <c:forEach var="trigger" items="${result.triggers}" varStatus="status" >
			                    	<tr>
			                    	<td width="3%"><input type="checkbox" name="deleteGbn" id="deleteGbn<c:out value='${status.count}' />" /></td>
			                    	<th scope="row" width="15%"><label for="deleteGbn<c:out value='${status.count}' />">프로퍼티</label></th>
			                    	<th scope="row" width="10%"><label for="triggerPropertyNm<c:out value='${status.count}' />">name</label></th>	
			                    	<td><select name="triggerPropertyNm" id="triggerPropertyNm<c:out value='${status.count}' />" class="selectSmall1" onchange="fn_modify_column(event);"> 
					                    	<c:forEach var="result_list" items="${list_vo}" varStatus="status">
												<option value='<c:out value="${result_list.codeId}"/>' <c:if test="${result_list.codeId == result.propertyNm}">selected="selected"</c:if> ><c:out value="${result_list.codeNm}"/></option>
											</c:forEach>	
										</select></td>	
			                    	<th scope="row" width="10%" >ref</th>
				                    <th scope="row" width="10%" align="center" colspan="2"><label for="triggerPropRef">bean</label></th>
				                    <td width="114"><input name="triggerPropRef" value='<c:out value="${trigger.triggerPropRef}"/>' size="10" maxlength="30" class="inputsmalfact" /></td>
				                    </tr>
			                 </c:forEach>
	                    	</c:when>
	                    	<c:otherwise>
			                    	<tr>
			                    	<td width="3%"><input type="checkbox" name="deleteGbn" id="deleteGbn<c:out value='${status.count}' />"/></td>
			                    	<th scope="row" width="15%"><label for="deleteGbn<c:out value='${status.count}' />">프로퍼티</label></th>
			                    	<th scope="row" width="10%"><label for="propertyNm<c:out value='${status.count}' />">name</label></th>	                    
				                    <td width="15%"><select name="propertyNm"  id="propertyNm<c:out value='${status.count}' />" class="selectSmall1" onchange="fn_modify_column(event);"> 
					                    	<c:forEach var="result_list" items="${list_vo}" varStatus="status">
												<option value='<c:out value="${result_list.codeId}"/>' <c:if test="${result_list.codeId == result.propertyNm}">selected="selected"</c:if> ><c:out value="${result_list.codeNm}"/></option>
											</c:forEach>	
										</select></td>
				                    <th scope="row" width="10%"><label for="propertyValue">value</label></th>
				                    <td width="15%"><input name="propertyValue" value='<c:out value="${result.propertyValue}"/>' size="10" maxlength="30" class="inputsmall" /></td>
				                    <th scope="row" width="10%"><label for="propertyRef">ref</label></th>
				                    <td width="15%" colspan="2"><input name="propertyRef" value='<c:out value="${result.propertyRef}"/>' size="10" maxlength="30" class="inputsmall" /></td>
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

