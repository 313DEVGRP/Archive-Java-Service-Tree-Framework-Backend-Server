<%
/**
 * @Class Name : EgovInfrmlSanctnRegist.java
 * @Description : EgovInfrmlSanctnRegist.jsp
 * @Modification Information
 * @
 * @  수정일                    수정자                수정내용
 * @ ---------     --------    ---------------------------
 * @ 2010.08.31    장철호                최초 생성
 *
 *  @author 장철호
 *  @since 2010.08.31
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
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<script type="text/javascript" src="<c:url value="/js/egovframework/com/uss/ion/ism/EgovInfrmlSanction.js"/>"></script>
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="80%" class="title_left">
   <h1><img src="/images/egovframework/com/cmm/icon/tit_icon.gif" width="9" height="9" hspace="3" style="vertical-align: middle" alt="">&nbsp;결재권자</h1></td>
   <!-- <input type="hidden" name="ism_url" id="ism_url" value="<c:url value='/uss/ion/ism/selectSanctnerListPopup.do'/>" /> -->
   <td><span class="button"><a href="/uss/ion/ism/selectSanctnerListPopup.do" target="_blank"  title="새 창으로 이동"  onClick="fn_egov_sanctner('승인권자', 'sanctnerId', '', 'sanctnDtNm', 'orgnztNm', '/uss/ion/ism/selectSanctnerListPopup.do');return false;">결재자지정</a></span></td>
 </tr>
</table>

<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register">
  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="sanctnDtNm">승인권자명</label><img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수항목"  width="15" height="15"></th>
    <td width="30%" nowrap colspan="3">
       <input name="sanctnDtNm" id="sanctnDtNm" value="${infSanctnDtNm}" type="text" size="20" title="승인권자명" readOnly>
       <form:hidden  path="sanctnerId" id="sanctnerId"/>
       <form:errors  path="sanctnerId"/>
    </td>
    <th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="orgnztNm">소속</label><img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>
    <td width="30%" nowrap colspan="3">
       <input name="orgnztNm" id="orgnztNm" value="${infOrgnztNm}" type="text" size="30" title="소속" readOnly>
    </td>
  </tr>
</table>
