<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%

/**
 * @Class Name : EgovBannerMainList.java
 * @Description : EgovBannerMainList jsp
 * @Modification Information
 * @
 * @  수정일                    수정자                수정내용
 * @ ---------     --------    ---------------------------
 * @ 2009.02.01    lee.m.j     최초 생성
 *
 *  @author lee.m.j
 *  @since 2009.03.21
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
<title>메인화면 배너 목록조회</title>
<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
<script type="text/javaScript" language="javascript" defer="defer">
<!--
function fncSelectBanner(bannerId) {
    document.items.bannerId.value = bannerId;
    document.items.action = "<c:url value='/uss/ion/bnr/getBanner.do'/>";
    document.items.submit();     
}
-->
</script>

</head>
<body>
<form name="items" method="post" action="<c:url value='/uss/ion/bnr/getBanner.do'/>">
<div id="all" style="margin:0 auto;width:200px;">
<table width="200" cellpadding="8" class="table-line" summary="메인화면에서 배너에 대한 목록을 제공한다.">
 <caption>메인화면 배너 목록조회</caption>
 <tbody>
 <c:forEach var="banner" items="${bannerList}" varStatus="status">
  <tr>
    <td class="lt_text6" nowrap>
            <span class="link">
                <input type="submit" name="bannerNm" id="bannerNm" value="<c:out value="${banner.bannerNm}"/>" onclick="fncSelectBanner('<c:out value="${banner.bannerId}"/>');return false;"/>
            </span>
    </td>
  </tr>
 </c:forEach>
 </tbody> 
</table>
</div>
<input type="hidden" name="bannerId" value="">
<input type="hidden" name="pageIndex" value="1">
<input type="hidden" name="searchCondition" value="1">
<input type="hidden" name="searchKeyword" value="">
</form>
</body>
</html>
