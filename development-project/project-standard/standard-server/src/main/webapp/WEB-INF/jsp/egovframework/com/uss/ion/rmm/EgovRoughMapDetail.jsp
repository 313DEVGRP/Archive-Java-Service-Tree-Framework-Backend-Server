<%
 /**
  * @Class Name : EgovRoughMapInfoDetail.jsp
  * @Description : EgovRoughMapInfoDetail 화면
  * @Modification Information
  * @
  * @  수정일   	수정자		수정내용
  * @ ----------	------		---------------------------
  * @ 2014.08.28	옥찬우		최초 생성
  *
  *  @author 유지보수팀 
  *  @since 2014.08.28
  *  @version 1.0
  *  @see
  */
%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>약도 조회</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />">
<script type="text/javascript" src="http://apis.daum.net/maps/maps3.js?apikey=발급받은 Daum Maps API KEY를 넣으시면 됩니다."></script>
<script type="text/javaScript" language="javascript">
	
	/* ********************************************************
	 * 초기화
	 ******************************************************** */
	function fn_egov_init_roughmapregist() {
		fn_createMap();
	}

	/* ********************************************************
	 * 맵 생성(successCallback)
	 ******************************************************** */
	function fn_createMap() {

		var latitude = document.roughMap.la.value;
		var longitude = document.roughMap.lo.value;
		var markerLatitude = document.roughMap.markerLa.value;
		var markerLongitude = document.roughMap.markerLo.value;
		var infoWindowContent = document.roughMap.infoWindow.value;
		var zoomLevel = document.roughMap.zoomLevel.value;

		var latLng = new daum.maps.LatLng(latitude, longitude);
		var markerLatLng = new daum.maps.LatLng(markerLatitude, markerLongitude);

		var myOptions = {
			level : zoomLevel,
			center : latLng,
			mapTypeId : daum.maps.MapTypeId.ROADMAP,
			draggable : false
		};

		var map = new daum.maps.Map(document.getElementById("mapCanvas"), myOptions);

		var Marker = new daum.maps.Marker({
			position : markerLatLng
		});

		Marker.setMap(map);

		var infowindow = new daum.maps.InfoWindow({
			content : infoWindowContent
		});
		
		infowindow.open(map, Marker);
		
	}
	
	/* ********************************************************
	 * 다음 길찾기로 연결
	 ******************************************************** */
	function fn_egov_find_roughmap(){
		window.open(
			'http://map.daum.net/link/to/' + 
			document.roughMap.infoWindow.value + ',' + 
			document.roughMap.markerLa.value + ',' + 
			document.roughMap.markerLo.value
		);
	}
	
	/* ********************************************************
	 * 다음 지도에서 크게 보기
	 ******************************************************** */
	function fn_egov_magnify_roughmap(){
		window.open(
			'http://map.daum.net/link/map/' + 
			document.roughMap.infoWindow.value + ',' + 
			document.roughMap.markerLa.value + ',' + 
			document.roughMap.markerLo.value
		);
	}
	

	/* ********************************************************
	 * 목록 으로 가기
	 ******************************************************** */
	function fn_egov_inqire_roughmaplist() {
		document.roughMap.action = "<c:url value='/com/uss/ion/rmm/selectRoughMapList.do'/>";
		document.roughMap.submit();
	}
	
	/* ********************************************************
	 * 수정처리화면
	 ******************************************************** */
	function fn_egov_updt_roughmap(roughMapId){
		document.roughMap.action = "<c:url value='/com/uss/ion/rmm/updateRoughMapView.do'/>";
		document.roughMap.submit();
	}

	/* ********************************************************
	 * 삭제처리화면
	 ******************************************************** */
	function fn_egov_delete_roughmap(roughMapId){

		if	(confirm("<spring:message code="common.delete.msg" />"))	{

			// Delete하기 위한 키값(wordId)을 셋팅
			document.roughMap.roughMapId.value = roughMapId;
			document.roughMap.action = "<c:url value='/com/uss/ion/rmm/deleteRoughMap.do'/>";
			document.roughMap.submit();
		}
	}
</script>

</head>
<body onLoad="fn_egov_init_roughmapregist();">
	<div id="content" style="width: 712px">

		<!-- 상단 타이틀  영역 -->
		<table width="100%" cellpadding="8" class="table-search" border="0">
			<tr>
				<td width="100%" class="title_left">
					<h1> <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="left" alt="제목아이콘이미지">&nbsp;약도 조회</h1>
				</td>
			</tr>
		</table>

		<!-- 줄간격조정  -->
		<table width="100%" cellspacing="0" cellpadding="0" border="0">
			<tr>
				<td height="3px"></td>
			</tr>
		</table>

		<!-- 등록 폼 영역  -->
		<form id="roughMap" name="roughMap" method="post">
			<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="FAQ에 대한 정보를 등록합니다.">
				<caption>약도 등록</caption>
				<tr>
					<th scope="row" width="20%" height="23" class="required_text" nowrap>
						<label for="roughMapSj">약도제목</label>
					</th>
					<td width="80%" nowrap>
						<c:out value="${roughMap.roughMapSj}"/>
					</td>
				</tr>
				<tr>
					<th scope="row" height="23" class="required_text">
						<label for="roughMapAddress">약도주소</label>
					</th>
					<td>
						<c:out value="${roughMap.roughMapAddress}"/>
					</td>
				</tr>
				<tr>
					<th scope="row" height="23" class="required_text">
						<label for="infoWindow">약도표시</label>
					</th>
					<td>
						<c:out value="${roughMap.infoWindow}"/>
					</td>
				</tr>
				<tr>
					<th scope="row" height="400" class="required_text">
						<label for="roughMapAddress">약도입력</label>
					</th>
					<td>
						<div id="mapCanvas" style="width: 600px; height: 400px;"></div>
					</td>
				</tr>
			</table>
			<input name="roughMapId" id="roughMapId" type="hidden" value="<c:out value='${roughMap.roughMapId}'/>">
			<input name="roughMapSj" id="roughMapSj" type="hidden" value="<c:out value='${roughMap.roughMapSj}' />" />
			<input name="la" id="a" type="hidden" value="<c:out value='${roughMap.la}' />" />
			<input name="lo" id="lo" type="hidden" value="<c:out value='${roughMap.lo}' />" />
			<input name="markerLa" id="markerLa" type="hidden" value="<c:out value='${roughMap.markerLa}' />" />
			<input name="markerLo" id="markerLo" type="hidden" value="<c:out value='${roughMap.markerLo}' />" />
			<input name="infoWindow" id="infoWindow" type="hidden" value="<c:out value='${roughMap.infoWindow}' />" />
			<input name="zoomLevel" id="zoomLevel" type="hidden" value="<c:out value='${roughMap.zoomLevel}' />" />
		</form>

		<!-- 줄간격조정  -->
		<table width="100%" cellspacing="0" cellpadding="0" border="0">
			<tr>
				<td height="5px"></td>
			</tr>
		</table>

		<!-- 목록/저장버튼  -->
		<div align="center">
		<table border="0" cellspacing="0" cellpadding="0" align="center">
			<tr>
				<td>
					<span class="button">
						<input type="submit" value="길찾기" onclick="fn_egov_find_roughmap(); return false;">
					</span>
				</td>
  				<td>&nbsp;&nbsp;</td>
				<td>
					<span class="button">
						<input type="submit" value="크게보기" onclick="fn_egov_magnify_roughmap(); return false;">
					</span>
				</td>
  				<td>&nbsp;&nbsp;</td>
				<td>
					<span class="button">
						<input type="submit" value="<spring:message code="button.update" />" onclick="fn_egov_updt_roughmap('<c:out value="${roughMap.roughMapId}"/>'); return false;">
					</span>
				</td>
  				<td>&nbsp;&nbsp;</td>
  				<td>
  					<span class="button">
  						<a href="<c:url value='/com/uss/ion/rmm/deleteRoughMap.do'/>?roughMapId=<c:out value='${roughMap.roughMapId}'/>" onclick="fn_egov_delete_roughmap('<c:out value="${roughMap.roughMapId}"/>'); return false;">
  						<spring:message code="button.delete" /></a>
  					</span>
  				</td>
  				<td>&nbsp;&nbsp;</td>
				<td>
					<span class="button">
						<a href="<c:url value='/com/uss/ion/rmm/selectRoughMapList.do'/>" onclick="fn_egov_inqire_roughmaplist(); return false;"><spring:message code="button.list" /></a>
					</span>
				</td>
				<td>&nbsp;&nbsp;</td>
			</tr>
		</table>
		</div>
	</div>
</body>
</html>