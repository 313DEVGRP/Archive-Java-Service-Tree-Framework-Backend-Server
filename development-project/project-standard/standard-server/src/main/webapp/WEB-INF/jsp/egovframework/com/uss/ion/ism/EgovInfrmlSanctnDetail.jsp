<%
/**
 * @Class Name : EgovInfrmlSanctnDetail.java
 * @Description : EgovInfrmlSanctnDetail.jsp
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
   <td></td>
   <td></td>
 </tr>
</table>

<table width="700" border="0" cellpadding="0" cellspacing="1" class="table-register"  summary="이 표는  약식결재 정보를 제공하며, 승인권자명, 소속 등의 정보로 구성되어 있습니다 .">
 <caption>약식결재 상세보기</caption>
  <tr>
    <th scope="row" width="20%" height="23" class="required_text"  >승인권자명<img src="/images/egovframework/com/cmm/icon/required.gif" alt="필수입력표시"  width="15" height="15"></th>          
    <td width="30%" ><c:out value='${infrmlSanctnVO.sanctnerNm}'/></td>
    <th scope="row" width="20%" height="23" class="required_text"  >소속<img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>          
    <td width="30%" ><c:out value='${infrmlSanctnVO.sanctnerOrgnztNm}'/></td>
  </tr>
  <c:if test="${infrmlSanctnVO.confmAt ne 'A'}">
  <tr>
    <th scope="row" width="20%" height="23" class="required_text"  >승인여부<img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>          
    <td width="30%" > 
         <c:if test="${infrmlSanctnVO.confmAt eq 'A'}">신청중</c:if>
         <c:if test="${infrmlSanctnVO.confmAt eq 'C'}">승인</c:if>
         <c:if test="${infrmlSanctnVO.confmAt eq 'R'}">반려</c:if>
    </td>
    <th scope="row" width="20%" height="23" class="required_text"  >승인일자<img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>          
    <td width="30%" ><c:out value='${infrmlSanctnVO.sanctnDt}'/></td>
  </tr> 
  </c:if>
  <c:if test="${infrmlSanctnVO.confmAt eq 'C'}">
  <tr>
    <th scope="row" width="20%" height="23" class="required_text" >의견<img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>          
    <td width="30%" colspan="3"> 
		<c:out value='${infrmlSanctnVO.returnResn}'/>
    </td>
  </tr> 
  </c:if>
  <c:if test="${infrmlSanctnVO.confmAt eq 'R'}">
  <tr>
    <th scope="row" width="20%" height="23" class="required_text" >반려사유<img src="/images/egovframework/com/cmm/icon/no_required.gif" width="15" height="15" alt=""></th>          
    <td width="30%" colspan="3"> 
		<c:out value='${infrmlSanctnVO.returnResn}'/>
    </td>
  </tr> 
  </c:if>
</table>
