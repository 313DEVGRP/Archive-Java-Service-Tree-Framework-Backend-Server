<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%
  /**
  * @Class Name : EgovSmsCacheMgtRegist.jsp
  * @Description : 캐시 등록 템플릿 생성
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
<title>Cache Mgt(Regist template)</title>


</head>
<body>

<script type="text/javaScript" language="javascript" defer="defer">
//<!--


function fn_egov_preview(){

	if(fn_egov_checkValue()){
		frm = document.mgtVO;
		
	    window.open("","Code_template","resizable=1,width=800,height=500,scrollbars=yes");
	    frm.method="post";
	    frm.action="<c:url value='/ole/sms/insertCacheMgtRegist.sms'/>";
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
  cell1.style.size="10%";
  cell1.style.backgroundColor="#F7F7F7";
  cell1.style.textAlign="center";
  cell1.style.fontWeight="bold";
  cell1.style.color="#000000";
  cell1.style.fontSize="11px";
  cell1.style.borderCollapse="collapse";
  cell1.style.paddingBottom="0px";
  cell1.style.paddingLeft="0px";
  cell1.appendChild(textNode);

//1 cell
  var cell2 = row.insertCell(1);
  var textNode = document.createTextNode('Key');
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
  
  // 2 cell
  var cell3 = row.insertCell(2);
  var el = document.createElement('input');
  el.type = 'text';
  el.name = 'cacheKey';
  el.id = 'cacheKey';
  el.style.border="1px solid #d5d5d5";
  el.style.width = '97%';
  el.style.fontSize = "11px"
  el.style.height = '14px';;
  cell3.appendChild(el);

  //3 cell
  var cell4 = row.insertCell(3);
  var textNode = document.createTextNode('Value');
  cell4.style.size="10%";
  cell4.style.backgroundColor="#F7F7F7";
  cell4.style.textAlign="center";
  cell4.style.fontWeight="bold";
  cell4.style.color="#000000";
  cell4.style.fontSize="11px";
  cell4.style.borderCollapse="collapse";
  cell4.style.paddingBottom="0px";
  cell4.style.paddingLeft="0px";
  cell4.appendChild(textNode);

  //4 cell
  var cell5 = row.insertCell(4);
  var el = document.createElement('input');
  el.type = 'text';
  el.name = 'cacheValue';
  el.id = 'cacheValue';
  el.style.border="1px solid #d5d5d5";
  el.style.width = '97%';
  el.style.fontSize = "11px";
  el.style.height = '14px';
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
	<div id="h2_topnav"><h2><strong>캐시 관리 - 캐시  등록 Template</strong></h2></div>
		  	<div id="datail_table">
				<table id="tbl" summary="Bean Id, Cache Name, Element" class="">
				<caption>Cache Management - Regist Template</caption>
				  <tr>
                    <th scope="row" width="30%">Bean Id</th>
                    <td colspan="4"><label for ="beanId">
                    	<form:input path="beanId"  size="30" maxlength="100" cssClass="inputlarge"/></label>
                    </td>
                  </tr>
                  <tr>
                    <th scope="row" width="30%">Cache Name</th>
                    <td colspan="4">
                    	<label for ="cacheNm">
                    	<form:input path="cacheNm"  size="30" maxlength="100" cssClass="inputlarge"/></label>
                    </td>
                  </tr>
                  <tr>
                    <th scope="row" width="30%">Element</th>
                    <th width="10%">Key</th>
                    <td>
                    	<label for ="cacheKey">
						<form:input path="cacheKey"  size="30" maxlength="100" cssClass="inputlarge"/></label>			                    
                    </td>
                    <th scope="row" width="10%">Value</th>
                    <td>
                    	<label for ="cacheValue">
						<form:input path="cacheValue"  size="30" maxlength="100" cssClass="inputlarge"/></label>			                    
                    </td>
                  </tr>
                  
                </table>                	
			</div>
			<div id="btn_style01">
				<a title="Element 추가" href="/#" onclick="javascript:fn_egov_addRowToTable();return false;"><span>Element 추가</span></a>
				<a title="Element 삭제" href="/#" onclick="javascript:fn_egov_deleteRowToTable();return false;"><span>Element 삭제</span></a>
				<a title="코드템플릿 생성(새창)" href="/#" onclick="javascript:fn_egov_preview();return false;"><span>코드템플릿 생성</span></a>
			</div>
</form:form>
</div>
</div>
</body>
</html>

