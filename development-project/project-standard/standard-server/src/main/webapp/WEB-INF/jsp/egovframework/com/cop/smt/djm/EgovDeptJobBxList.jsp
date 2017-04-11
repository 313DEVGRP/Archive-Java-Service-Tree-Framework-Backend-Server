<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<% 
/**
 * @Class Name : EgovDeptJobBxList.jsp
 * @Description : 부서업무함 목록조회
 * @Modification Information
 * @
 * @  수정일      수정자            수정내용
 * @ -------        --------    ---------------------------
 * @ 2010.07.06   장철호          최초 생성
 *
 *  @author 공통컴포넌트개발팀 장철호
 *  @since 2010.07.06
 *  @version 1.0 
 *  @see
 *  
 */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function fn_egov_init_deptjobbx(){
		var resultNum = eval("<c:out value='${resultNum}'/>");
		var checkedDeptJobBxId = document.frm.checkedDeptJobBxId.value;

		if(checkedDeptJobBxId != "" && resultNum > 0){
	        for(var i=0; i < resultNum; i++) {
				var checkIdValue = document.deptJobBxCheck[i].check1.id;
		        var splitCheckIdValue = checkIdValue.split("::");
	            if(splitCheckIdValue[0] == checkedDeptJobBxId){
	                document.deptJobBxCheck[i].check1.checked = true;

					document.frm.deptJobBxId.value = checkedDeptJobBxId;
	        		document.frm.indictOrdr.value = splitCheckIdValue[1];
	        		document.frm.deptId.value = splitCheckIdValue[2];
	            }
	        }
		}

		if("<c:out value='${indictOrdrChanged}'/>" == "false"){
			alert("동일 부서명내에서 부서업무함명의 순서를 변경할 수 있습니다."); 
		}
	}
	
	function press(event) {
		if (event.keyCode==13) {
			fn_egov_select_deptjobbx('1');
		}
	}
	
	function fn_egov_select_deptjobbx(pageNo) {

		if(document.frm.searchWrd.value != ""){
			if(document.frm.searchCnd.value == ""){
				alert("조회조건을 선택하지 않으셨습니다");
				return;
			}
		}
		
		document.frm.pageIndex.value = pageNo; 
		document.frm.action = "<c:url value='/cop/smt/djm/selectDeptJobBxList.do'/>";
		document.frm.submit();	
	}
	
	function fn_egov_inqire_deptjobbx(deptJobBxId) {
		document.frm.deptJobBxId.value = deptJobBxId;
		document.frm.action = "<c:url value='/cop/smt/djm/modifyDeptJobBx.do'/>";
		document.frm.submit();	
	}

	function fn_egov_inqire_deptjobbx_ordr(ordrCnd) {
		var num = 0;
		
		for(var i=0; i < <c:out value='${resultNum}'/>; i++) {
            if(document.deptJobBxCheck[i].check1.checked){
                num ++;
            } 
        }

        if(num == 0){
        	alert("순서를 수정할 부서업무함을 선택하세요");
        	return;
        }
        
		document.frm.ordrCnd.value = ordrCnd;
		document.frm.action = "<c:url value='/cop/smt/djm/updateDeptJobBxOrdr.do'/>";
		document.frm.submit();	
	}

	function fn_egov_insert_deptjobbx(){	
		document.frm.action = "<c:url value='/cop/smt/djm/addDeptJobBx.do'/>";
		document.frm.submit();
	}

	function fCheck(num, deptJobBxId, indictOrdr, deptId) {		
		document.frm.deptJobBxId.value = deptJobBxId;
		document.frm.indictOrdr.value = indictOrdr;
		document.frm.deptId.value = deptId;

		var checkNum = eval(num);
	    var checkField = document.deptJobBxCheck[checkNum - 1].check1;

		if(checkField) {
               for(var i=0; i < <c:out value='${resultNum}'/>; i++) {
                   if(document.deptJobBxCheck[i].check1.checked){
                       if((checkNum - 1) != i){ 
                    	   document.deptJobBxCheck[i].check1.checked = false;
                       }
                   } 
               }
        } else {
            checkField.checked = true;
        }
	         
	}
</script>
<style type="text/css">
h1 {font-size:12px;}
</style>
<title>부서업무함관리 목록조회</title>
</head>
<body onLoad="fn_egov_init_deptjobbx()">

<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<div id="border" style="width:730px">

	<form name="frm" method="post" action="<c:url value='/cop/smt/djm/selectDeptJobBxList.do'/>">

	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
	<input type="hidden" name="deptJobBxId">
	<input type="hidden" name="ordrCnd">
	<input type="hidden" name="deptId">
	<input type="hidden" name="indictOrdr" value="0">
	<input type="hidden" name="checkedDeptJobBxId" value="<c:out value='${searchVO.deptJobBxId}'/>">
	
	<table width="90%" cellpadding="8" class="table-search" border="0">
	<tbody>
	 <tr>
	  <td width="38%" class="title_left">
	  <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" style="vertical-align: middle" alt="제목아이콘이미지">&nbsp;부서업무함관리 목록</h1></td>
		<td width="39%" >
			조회조건 : 
	   		<select name="searchCnd" class="select" title="조회조건 선택">
				<option value=''>--선택하세요--</option>
				<option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >부서명</option>
				<option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >부서업무함명</option>
		   </select>
		</td>
	  <td width="10%">
	    <input name="searchWrd" type="text" size="15" value='<c:out value="${searchVO.searchWrd}"/>' maxlength="35" onkeypress="press(event);" title="검색어 입력"> 
	  </td>
	  <th width="10%">
	   <table border="0" cellspacing="0" cellpadding="0">
	    <tr>
	      <td><span class="button"><input type="submit" value="조회" onclick="fn_egov_select_deptjobbx('1'); return false;"></span></td>
	      <td>&nbsp;&nbsp;</td>
	      <td><span class="button"><a href="<c:url value='/cop/smt/djm/addDeptJobBx.do'/>" onclick="fn_egov_insert_deptjobbx('1'); return false;"><spring:message code="button.create" /></a></span></td>
	    </tr>
	   </table>
	  </th>  
	 </tr>
	</tbody>
	</table>
	
	</form>
	<table width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<td width="90%">	
	<table width="100%" cellpadding="8" class="table-list" summary="이 표는 부서업무함 정보를 제공하며, 부서명, 부서업무함명, 최종수정자, 최종수정일  정보로 구성되어 있습니다.">
	<caption>부서업무함목록</caption> 
	 <thead>
	  <tr>
	    <th scope="col" class="title" width="10%" nowrap></th>
	    <th scope="col" class="title" width="10%" nowrap>번호</th>
	    <th scope="col" class="title" width="25%" nowrap>부서명</th>
	    <th scope="col" class="title" width="25%" nowrap>부서업무함명</th>
	    <th scope="col" class="title" width="15%" nowrap>최종수정자</th>
	    <th scope="col" class="title" width="15%" nowrap>최종수정일</th>
	  </tr>
	 </thead>    
	 <tbody>
		 <c:forEach var="result" items="${resultList}" varStatus="status">
		  <tr>
		    <td class="lt_text3" nowrap>  
		    <form name="deptJobBxCheck" method="post" action="<c:url value='/cop/smt/djm/selectDeptJobBxList.do'/>">
		    <input type="radio" name="check1" id="<c:out value="${result.deptJobBxId}"/>::<c:out value="${result.indictOrdr}"/>::<c:out value="${result.deptId}"/>" class="check2" onclick="fCheck('<c:out value="${status.count}"/>', '<c:out value="${result.deptJobBxId}"/>','<c:out value="${result.indictOrdr}"/>','<c:out value="${result.deptId}"/>')" title="선택">
		    <input type="submit" value="" style="border : 0px;height : 0px;color :#f7f7f7;display:none" >
		    </form>
		    </td>
		    <td class="lt_text3" nowrap><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>		    
		    <td class="lt_text3" nowrap><c:out value="${result.deptNm}"/></td>
		    <td class="lt_text3" nowrap>
		     <form name="deptJobBxVO" method="post" action="<c:url value='/cop/smt/djm/modifyDeptJobBx.do'/>">
		    	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
		    	<input name="searchCnd" type="hidden" value="<c:out value='${searchVO.searchCnd}'/>">
		    	<input name="searchWrd" type="hidden" value="<c:out value='${searchVO.searchWrd}'/>">
				<input type="hidden" name="deptJobBxId" value="<c:out value="${result.deptJobBxId}"/>">
				<span class="link"><input type="submit" value="<c:out value="${result.deptJobBxNm}"/>" onclick="javascript:fn_egov_inqire_deptjobbx('<c:out value="${result.deptJobBxId}"/>'); return false;" style="text-align : left;"></span>
			 </form>
			</td>
		    <td class="lt_text3" nowrap><c:out value="${result.lastUpdusrNm}"/></td>
		    <td class="lt_text3" nowrap><c:out value="${fn:substring(result.lastUpdusrPnttm, 0, 10)}"/></td>
		  </tr>
		 </c:forEach>	  
		 <c:if test="${fn:length(resultList) == 0}">
		  <tr>
		    <td class="lt_text3" nowrap colspan="6"><spring:message code="common.nodata.msg" /></td>  
		  </tr>		 
		 </c:if>
	 </tbody>
	</table>
	
	</td>
		<td width="10%" align="center" valign="middle">
			<table width="100%" cellpadding="0" summary="부서업무함의 순서를 수정합니다.">
			 <thead>
			  <tr>
			    <th scope="col"  width="10%" nowrap style="vertical-align: middle;height : 37px;"></th>
			  </tr>
			  </thead>
			  <tbody>
			  	<tr>
			  		<td >
			  		 		<a href = "#LINK" onclick="javascript:fn_egov_inqire_deptjobbx_ordr('up'); return false;"><font style="font-size: 15pt">▲</font></a>
			  		 		<br><br>
			  		 		<a href = "#LINK" onclick="javascript:fn_egov_inqire_deptjobbx_ordr('down'); return false;"><font style="font-size: 15pt">▼</font></a>
			  		</td>
			  	</tr>
			  </tbody>
			  </table>
		</td>
	</tr>
	</table>
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr> 
	    <td height="10"></td>
	  </tr>
	</table>
	<div align="center">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_deptjobbx" />
	</div>
</div>

</body>
</html>
