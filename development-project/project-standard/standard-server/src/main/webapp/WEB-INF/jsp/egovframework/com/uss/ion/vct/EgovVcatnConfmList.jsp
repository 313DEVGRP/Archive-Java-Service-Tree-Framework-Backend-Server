<%
/**
 * @Class Name : EgovVcatnConfmList.java
 * @Description : EgovVcatnConfmList jsp
 * @Modification Information
 * @
 * @  수정일                    수정자                수정내용
 * @ ---------     --------    ---------------------------
 * @ 2010.07.20    이      용                최초 생성
 *
 *  @author 이      용
 *  @since 2010.08.05
 *  @version 1.0
 *  @see
 *  
 *  Copyright (C) 2009 by MOPAS  All right reserved.
 */
%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="egovframework.com.utl.fcc.service.EgovDateUtil" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>휴가승인 목록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<script type="text/javaScript" language="javascript">
<!--
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
 /*설명 : 휴가승인 목록 페이지 조회 */
 function linkPage(pageNo){
	var varForm				 = document.all["listForm"];
	varForm.searchCondition.value = "1";
	varForm.pageIndex.value = pageNo;
	varForm.action = "<c:url value='/uss/ion/vct/EgovVcatnConfmList.do'/>";
	varForm.submit();
 }

/* ********************************************************
 * 조회 처리 
 ******************************************************** */
 /*설명 : 목록 조회 */
 function fncSelectVcatnConfmList(pageNo){
	 var varForm				 = document.all["listForm"];

	 if(varForm.searchMonth.value !=""){
		 if(varForm.searchYear.value ==""){
			 alert("전체년도에 월만 조회할 수 없습니다. 년도는 선택해주세요");
			 return;
		 } 
	 }
	 
	 varForm.pageIndex.value = pageNo;
	 varForm.action = "<c:url value='/uss/ion/vct/EgovVcatnConfmList.do'/>";
	 varForm.submit();
 }

/* ********************************************************
 * 승인처리회면 호출함수
 ******************************************************** */
function fncVcatnManageDetail(applcntId,vcatnSe,bgnde,endde,infrmlSanctnId){
	var varForm				 = document.all["listForm"];
	varForm.applcntId.value  = applcntId;
	varForm.vcatnSe.value    = vcatnSe;
	varForm.bgnde.value      = bgnde.replace("-","");
	varForm.endde.value      = endde.replace("-","");
	varForm.infrmlSanctnId.value = infrmlSanctnId;
	varForm.action           = "<c:url value='/uss/ion/vct/EgovVcatnConfm.do'/>";
	varForm.submit();
}

-->
</script>
</head>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<div id="border" style="width:730px">
<table border="0">
  <tr>
    <td width="700">
<!-- ********** 여기서 부터 본문 내용 *************** -->
	
	<form name="listForm" action="<c:url value='/uss/ion/vct/EgovVcatnConfmList.do'/>" method="post">
	<input type="hidden" name="searchCondition">
	<input type="hidden" name="applcntId">
	<input type="hidden" name="vcatnSe">
	<input type="hidden" name="bgnde">
	<input type="hidden" name="endde">
    <input type="hidden" name="infrmlSanctnId">
	<input type="hidden" name="pageIndex" value="<c:if test="${empty vcatnManageVO.pageIndex }">1</c:if><c:if test="${!empty vcatnManageVO.pageIndex }"><c:out value='${vcatnManageVO.pageIndex}'/></c:if>">
	
	<table width="700" cellpadding="8" class="table-search" border="0">
	 <tr>
	  <td width="40%"class="title_left">
	   <h1><img src="/images/egovframework/com/cmm/icon/tit_icon.gif" width="16" height="16" hspace="3" style="vertical-align: middle" alt="">&nbsp;휴가승인관리 목록</h1></td>
	  <th>
	  </th>
  <td width="50%">&nbsp;</td>
  <th width="10%" align="right">
	       <table border="0" cellspacing="0" cellpadding="0">
	        <tr> 
	          <td>&nbsp;&nbsp;</td>
	          <td><span class="button"><input type="submit" value="<spring:message code="button.inquire" />" onclick="fncSelectVcatnConfmList('1'); return false;"></span></td>
	        </tr>
	       </table>
	  </th>  
	 </tr>
	</table>
	<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register"  summary="휴가승인관리 검색조건" >
	<caption>휴가승인관리 검색조건</caption>
	  <tr>
	    <th width="20%" height="23" class="required_text" scope="row"><label for="searchConfmAt">진행구분</label><img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>          
	    <td width="30%" >
	        <select name="searchConfmAt" title="진행구분">
		       	<option value="" <c:if test="${vcatnManageVO.searchConfmAt eq '' }">selected</c:if>>전체</option>
		       	<option value="A" <c:if test="${vcatnManageVO.searchConfmAt eq 'A' }">selected</c:if>>신청</option>
		       	<option value="C" <c:if test="${vcatnManageVO.searchConfmAt eq 'C' }">selected</c:if>>승인</option>
		       	<option value="R" <c:if test="${vcatnManageVO.searchConfmAt eq 'R' }">selected</c:if>>반려</option>
	      	</select>
	    </td>

	    <th width="20%" height="23" class="required_text" scope="row"><label for="searchYear">휴가일자</label><img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>          
	    <td width="30%">
	    
	    	<select name="searchYear" title="년도">
	    	<option value="" <c:if test="${vcatnManageVO.searchYear eq '' }">selected</c:if>>전체</option>
            <c:forEach items="${yearList}" var="result" varStatus="status">
	       	   <option value="<c:out value="${result }"/>"  <c:if test="${vcatnManageVO.searchYear eq result}">selected</c:if>><c:out value="${result }"/></option>
            </c:forEach>
            </select>년
	        <select name="searchMonth" title="월">
		       	<option value="" <c:if test="${vcatnManageVO.searchMonth eq '' }">selected</c:if>>전체</option>
		       	<option value="01" <c:if test="${vcatnManageVO.searchMonth eq '01' }">selected</c:if>>01</option>
		       	<option value="02" <c:if test="${vcatnManageVO.searchMonth eq '02' }">selected</c:if>>02</option>
		       	<option value="03" <c:if test="${vcatnManageVO.searchMonth eq '03' }">selected</c:if>>03</option>
		       	<option value="04" <c:if test="${vcatnManageVO.searchMonth eq '04' }">selected</c:if>>04</option>
		       	<option value="05" <c:if test="${vcatnManageVO.searchMonth eq '05' }">selected</c:if>>05</option>
		       	<option value="06" <c:if test="${vcatnManageVO.searchMonth eq '06' }">selected</c:if>>06</option>
		       	<option value="07" <c:if test="${vcatnManageVO.searchMonth eq '07' }">selected</c:if>>07</option>
		       	<option value="08" <c:if test="${vcatnManageVO.searchMonth eq '08' }">selected</c:if>>08</option>
		       	<option value="09" <c:if test="${vcatnManageVO.searchMonth eq '09' }">selected</c:if>>09</option>
		       	<option value="10" <c:if test="${vcatnManageVO.searchMonth eq '10' }">selected</c:if>>10</option>
		       	<option value="11" <c:if test="${vcatnManageVO.searchMonth eq '11' }">selected</c:if>>11</option>
		       	<option value="12" <c:if test="${vcatnManageVO.searchMonth eq '12' }">selected</c:if>>12</option>
	      	</select>월
	    </td>
	  </tr> 
	  <tr>
	    <th width="20%" height="23" class="required_text" scope="row"><label for="searchNm">신청자</label><img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>          
	    <td width="80%" colspan="3">
	    	<input name="searchNm" type="text" size="20" value="${vcatnManageVO.searchNm}"  maxlength="100" title="신청자"> 
	    </td>
	  </tr> 
	</table>
	</form>
	
	<table width="700" cellspacing="0" cellpadding="0" border="0">
	<tr>
		<td height="3px"></td>
	</tr>
	</table>
	
	<table width="700" cellpadding="0" class="table-line" border="0" summary="휴가승인관리 목록으로 순번 휴가구분 신청자 소속 시작일 종료일 진행구분 승인처리로 구성" >
     <caption>휴가승인관리 목록</caption>
	<thead>
	<tr>  
		<th class="title" width="5%"  scope="col">순번</th>
		<th class="title" width="10%" scope="col">휴가구분</th>
		<th class="title" width="12%" scope="col">신청자</th>
		<th class="title" width="18%" scope="col">소속</th>
		<th class="title" width="15%" scope="col">시작일</th>
		<th class="title" width="15%" scope="col">종료일</th>
		<th class="title" width="10%" scope="col">진행구분</th>
		<th class="title" width="15%" scope="col">승인처리</th>
	</tr>
	</thead>     
	<tbody>
	<c:forEach items="${vcatnManageList}" var="resultInfo" varStatus="status">
	<tr>
		<td class="lt_text3"><c:out value="${(vcatnManageVO.pageIndex - 1) * vcatnManageVO.pageSize + status.count}"/></td>
		<td class="lt_text3"><c:out value="${resultInfo.vcatnSeNm  }"/></td>
		<td class="lt_text3"><c:out value="${resultInfo.applcntNm  }"/></td>
		<td class="lt_text3"><c:out value="${resultInfo.orgnztNm   }"/></td>
		<td class="lt_text3"><c:out value="${resultInfo.bgnde      }"/></td>
		<td class="lt_text3"><c:out value="${resultInfo.endde      }"/></td>
		<td class="lt_text3">
          <c:if test="${resultInfo.confmAt eq 'A'}">신청</c:if>
          <c:if test="${resultInfo.confmAt eq 'C'}">승인</c:if>
          <c:if test="${resultInfo.confmAt eq 'R'}">반려</c:if>
		</td>
		<td class="lt_text3">
        <form name="item" method="post" action="<c:url value='/uss/ion/vct/EgovVcatnConfm.do'/>">
        	<input type="hidden" name="applcntId" value="<c:out value="${resultInfo.applcntId  }"/>">
        	<input type="hidden" name="vcatnSe"   value="<c:out value="${resultInfo.vcatnSe    }"/>">
        	<input type="hidden" name="bgnde"     value="<c:out value="${resultInfo.bgnde      }"/>">
        	<input type="hidden" name="endde"     value="<c:out value="${resultInfo.endde      }"/>">
        	<input type="hidden" name="infrmlSanctnId" value="<c:out value="${resultInfo.infrmlSanctnId  }"/>">
            <span class="button"><input type="submit" 
                  value="<c:if test="${resultInfo.confmAt eq 'A'}">승인처리 </c:if><c:if test="${resultInfo.confmAt ne 'A'}">상세보기 </c:if>"
                  onclick="fncVcatnManageDetail('<c:out value="${resultInfo.applcntId}"/>','<c:out value="${resultInfo.vcatnSe}"/>','<c:out value="${resultInfo.bgnde}"/>','<c:out value="${resultInfo.endde}"/>','<c:out value="${resultInfo.infrmlSanctnId  }"/>'); return false;"></span>
        </form>
		</td>
	</tr>    
	</c:forEach>
	
	<c:if test="${fn:length(vcatnManageList) == 0}">
		<tr> 
			<td class="lt_text3" colspan="8">
				<spring:message code="common.nodata.msg" />
			</td>
		</tr>   	          				 			   
	</c:if>
	</tbody>  
	</table>
	
	<table width="700" cellspacing="0" cellpadding="0" border="0">
	<tr>
		<td height="3px"></td>
	</tr>
	</table>
	
	
	<c:if test="${!empty vcatnManageVO.pageIndex }">
	<div align="center">
	    <div>
	        <ui:pagination paginationInfo="${paginationInfo}"
	                       type="image"
	                       jsFunction="linkPage" />
	    </div>
	</div>
	</c:if>
<!-- ********** 여기까지 내용 *************** -->
   </td>
 </tr>
</table>
</div>
</body>
</html>
