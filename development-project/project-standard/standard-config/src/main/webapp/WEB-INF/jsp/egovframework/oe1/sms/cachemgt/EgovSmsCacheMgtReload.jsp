<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%
  /**
  * @Class Name : EgovSmsCacheMgtReload.jsp
  * @Description : 캐시 리로딩 템플릿 생성
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
<title>Cache Mgt(Reload template)</title>


</head>
<body>
<script type="text/javaScript" language="javascript" defer="defer">
//<!--

function fn_egov_preview(){

	if(fn_egov_checkValue()){
		frm = document.mgtVO;
		
	    window.open("","Code_template","resizable=1,width=800,height=500,scrollbars=yes");
	    frm.method="post";
	    frm.action="<c:url value='/ole/sms/reloadCacheMgt.sms'/>";
	    frm.target="Code_template";
	    frm.submit();
	}else{
		alert("템플릿 생성을 위한 입력항목이 누락되었습니다.");
		return;
	}
	
	
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
  var textNode = document.createTextNode('Element');
  cell1.appendChild(textNode);

//1 cell
  var cell2 = row.insertCell(1);
  var textNode = document.createTextNode('Key');
  cell2.appendChild(textNode);
  
  // 2 cell
  var cell3 = row.insertCell(2);
  var el = document.createElement('input');
  el.type = 'text';
  el.name = 'cacheKey';
  el.id = 'cacheKey';
  el.style.height = '14px';
  el.setAttribute('class','inputsmall');
  el.size = 20;
  
  cell3.appendChild(el);

  //3 cell
  var cell4 = row.insertCell(3);
  var textNode = document.createTextNode('Value');
  cell4.appendChild(textNode);

  //4 cell
  var cell5 = row.insertCell(4);
  var el = document.createElement('input');
  el.type = 'text';
  el.name = 'cacheValue';
  el.id = 'cacheValue';
  el.style.fontSize = "11px";
  el.style.height = '14px';
  el.setAttribute('class','inputsmall');
  el.size = 20;
  cell5.appendChild(el);

  
}


function fn_egov_deleteRowToTable()
{
  var tbl = document.getElementById('tbl');
  var lastRow = tbl.rows.length;
  if (lastRow > 2) tbl.deleteRow(lastRow - 1);
}

function fn_egov_checkValue(){

    var arrObj = $("#mgtVO input");

    var boolRetrun = true;
    
    for ( var ii = 0 ; ii < arrObj.length ; ++ii ) {
        if(trim(arrObj[ii].value) == ''){
        	boolRetrun = false;			
        }else{
        	boolRetrun = true;			
        }
    }
    
	return boolRetrun;
}



//-->
</script>
<div id="wrap" >
<div id="content">
<form:form commandName="mgtVO" id="mgtVO" name="mgtVO">
	<div id="h2_topnav"><h2><strong>캐시 관리 - 캐시 리로드 Template</strong></h2></div>
		  	<div id="datail_table">
				<table id="tbl" summary="Bean Id, Cache Name" class="">
				<caption>Cache Management - Reload Template</caption>
				  <tr>
                    <th scope="row" width="20%">Bean Id</th>
                    <td>
                    	<label for="beanId">
                    	<form:input path="beanId"  size="30" maxlength="100" cssClass="inputlarge"/></label>
                    </td>
                  </tr>
                  <tr>
                    <th scope="row" width="20%">Cache Name</th>
                    <td>
                    	<label for="cacheNm">
                    	<form:input path="cacheNm"  size="30" maxlength="100" cssClass="inputlarge"/></label>
                    </td>
                  </tr>
                  
                </table>                	
			</div>
			<div id="btn_style01">
				<a title="코드템플릿 생성(새창)" href="/#" onclick="javascript:fn_egov_preview();return false;"><span>코드템플릿 생성</span></a>
			</div>
</form:form>
</div>
</div>
</body>
</html>

