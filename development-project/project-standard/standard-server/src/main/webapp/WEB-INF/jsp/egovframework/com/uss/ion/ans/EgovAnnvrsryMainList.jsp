<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%

/**
 * @Class Name : EgovAnnvrsryMainList.java
 * @Description : EgovAnnvrsryMainList jsp
 * @Modification Information
 * @
 * @  수정일                    수정자                수정내용
 * @ ---------     --------    ---------------------------
 * @ 2010.06.29    이      용                최초 생성
 *
 *  @author 이      용
 *  @since 2010.06.29
 *  @version 1.0
 *  @see
 *  
 *  Copyright (C) 2009 by MOPAS  All right reserved.
 */
 
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>기념일 목록 메인리스트</title>

<script type="text/javaScript" language="javascript" defer="defer">
<!--
/*설명 : 기념일 안내문 조회 */
function fncSelectAnnvrsryGdcc(annId) {
	document.gdccForm.annId.value = annId;
    document.gdccForm.action = "<c:url value='/uss/ion/ans/selectAnnvrsryGdcc.do'/>";
    document.gdccForm.submit();   
}
-->
</script>
<style type="text/css"> 
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
	body {margin-left:0; margin-right:0; margin-top:0; margin-bottom:0;}
</style>
</head>
<body>
<form name="gdccForm" method="post" action="<c:url value='/uss/ion/ans/selectAnnvrsryGdcc.do'/>">
<input type="hidden" name="annId"       value=""/>
<table width="200" cellpadding="0" class="table-line" border="0" summary="기념일에 대한 목록을 제공한다.(마이페이지용)">	
 <tbody>
	 <c:forEach var="annvrsryGdcc" items="${annvrsryGdccList}" varStatus="status">
	  <tr>
	    <td class="lt_text6" width="100">
		    <div class="divDotText" style="width:100px; border:solid 0px;">
		            <span class="link"><input type="text" value="<c:out value="${annvrsryGdcc.annvrsryNm}"/>" onclick="fncSelectAnnvrsryGdcc('<c:out value="${annvrsryGdcc.annId}"/>'); return false;" style="text-align : left;"></span>
		    </div>
		</td>
  		<td class="lt_text6" width="100"><c:out value="${annvrsryGdcc.annvrsryDe}"/><c:if test="${!empty annvrsryGdcc.cldrSe }">(<c:if test='${annvrsryGdcc.cldrSe == "1"}'>양</c:if><c:if test='${annvrsryGdcc.cldrSe == "2"}'>음</c:if>)</c:if>	</td>
	 </tr>
	</c:forEach>		 
 </tbody>  	
</table>		
</form>
</body>
</html>