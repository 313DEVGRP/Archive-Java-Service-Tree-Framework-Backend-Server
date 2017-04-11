<%
 /**
  * @Class Name : EgovRoughMapInfoRegist.jsp
  * @Description : EgovRoughMapInfoRegist 화면
  * @Modification Information
  * @
  * @  수정일   	수정자		수정내용
  * @ ----------	------		---------------------------
  * @ 2014.08.28	옥찬우		최초 생성
  * @ 2015.04.13    전여철      주소검색 추가
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
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html>
<html>
<head>
<title>약도 등록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="roughMapVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript" src="http://apis.daum.net/maps/maps3.js?apikey=발급받은 Daum Maps API KEY를 넣으시면 됩니다."></script>
<script type="text/javaScript" language="javascript">
	
	/* ********************************************************
	 * 초기화
	 ******************************************************** */
	var map;   //map
	var Marker;//marker
	var apikey="발급받은 Daum Maps API KEY를 넣으시면 됩니다.";
	 
	function fn_egov_init_roughmapregist() {
		// 첫 입력란에 포커스..
		document.roughMap.roughMapSj.focus();
		fn_getcurrentposition();
	}

	/* ********************************************************
	 * 맵 초기화(위치정보 취득)
	 ******************************************************** */
	function fn_getcurrentposition() {
		if (!navigator.geolocation) {
			alert("This browser doesn't support geolocation");
		} else {
			// 현재 위치정보 취득
			navigator.geolocation.getCurrentPosition(
				fn_createMap,
				fn_errorMap,
				{
					maximumAge : 0,
					timeout : 30000,
					enableHighAccuracy : true
				}
			);
		}
	}

	/* ********************************************************
	 * 맵 생성(successCallback)
	 ******************************************************** */
	function fn_createMap(position) {
		
		var zoomLevel = 4;
		document.getElementById("zoomLevel").value = zoomLevel;

		document.getElementById("la").value = position.coords.latitude;
		document.getElementById("lo").value = position.coords.longitude;
		document.getElementById("markerLa").value = position.coords.latitude;
		document.getElementById("markerLo").value = position.coords.longitude;
		var latLng = new daum.maps.LatLng(position.coords.latitude, position.coords.longitude);

		var myOptions = {
			level : zoomLevel,
			center : latLng,
			mapTypeId : daum.maps.MapTypeId.ROADMAP
		};

		map = new daum.maps.Map(document.getElementById("mapCanvas"), myOptions);
		map.addControl(new daum.maps.ZoomControl());
		
		Marker = new daum.maps.Marker({
			position : latLng
		});
		Marker.setMap(map);

		daum.maps.event.addListener(map, "zoom_changed", function() {
			document.getElementById("zoomLevel").value = map.getLevel();
		});
		
 		daum.maps.event.addListener(map, "bounds_changed", function() {
			var centerLatLng = map.getCenter();
			
			var bounds = map.getBounds();
			var northWestLatLng = bounds.getNorthEast();
			var northWestLat = bounds.getNorthEast().getLat();
			var northWestLng = bounds.getNorthEast().getLng();
			var southWestLatLng = bounds.getSouthWest();
			var southWestLat = bounds.getSouthWest().getLat();
			var southWestLng = bounds.getSouthWest().getLng();
			
			var currentCenterLat =  (northWestLat + southWestLat)/2;
			var currentCenterLng =  (northWestLng + southWestLng)/2;
			
			var currentCenterLatLng = new daum.maps.LatLng(currentCenterLat, currentCenterLng);
			document.getElementById("la").value = currentCenterLatLng.getLat();
			document.getElementById("lo").value = currentCenterLatLng.getLng();
		});

		daum.maps.event.addListener(map, "click", function(MouseEvent) {
			var markerLatLng = MouseEvent.latLng;

			Marker.setPosition(markerLatLng);
			
			new daum.maps.Marker(
					{
						position : new daum.maps.LatLng(markerLatLng.getLat(), markerLatLng.getLng())
					});

			Marker.setMap(map);

			document.getElementById("markerLa").value = markerLatLng.getLat();
			document.getElementById("markerLo").value = markerLatLng.getLng();
			
			fn_coord2addr(markerLatLng.getLat(), markerLatLng.getLng());

		});
	}
	
	/* ********************************************************
	 * 맵생성 에러처리(errorCallback)
	 ******************************************************** */
	function fn_errorMap(error) {
		alert("에러발생, 에러코드: " + error.code + "\n" + " 메시지: " + error.message, "Error", "a");
	}

	/* ********************************************************
	 * 약도주소로 검색
	 ******************************************************** */
    function fn_Address_Search() {
        var query = document.getElementById("roughMapAddress").value;
        
        if(query == null || query.length <= 0){
        	alert("약도주소가 없습니다.");
            return;
        }
        fn_getPoint(query);
    }

	/* ********************************************************
	 * 주소→좌표 변환 api 사용
	 ******************************************************** */
    function fn_getPoint(query) {
        var oScript = document.createElement("script");
        oScript.type = "text/javascript";
        oScript.charset = "utf-8";
        oScript.src = "http://apis.daum.net/local/geo/addr2coord?apikey="+apikey+"&output=json&callback=fn_pongSearch&q=" + encodeURI(query);
        document.getElementsByTagName("head")[0].appendChild(oScript);
    }
	
	/* ********************************************************
	 * 좌표 변환 후 해당 좌표로 콜백
	 ******************************************************** */
    function fn_pongSearch(data) {
		
        if (data == null || data.channel.item.length <= 0) {
        	alert("<spring:message code="common.nodata.msg" />");
            return;
        } else {
            if (Marker != '') {
            	Marker.setMap(null);
            }

    		var latLng = new daum.maps.LatLng(data.channel.item[0].lat, data.channel.item[0].lng);
    		
    		map.panTo(latLng);
    		
    		Marker = new daum.maps.Marker({
                position:  latLng
            });
    		
            Marker.setMap(map);

    		document.getElementById("la").value = data.channel.item[0].lat;
    		document.getElementById("lo").value = data.channel.item[0].lng;
    		document.getElementById("markerLa").value = data.channel.item[0].lat;
    		document.getElementById("markerLo").value = data.channel.item[0].lng;
        }
    }

	/* ********************************************************
	 * 좌표→주소 변환 api 사용
	 ******************************************************** */
    function fn_coord2addr(lat, lng) {
        var oScript = document.createElement("script");
        oScript.type = "text/javascript";
        oScript.charset = "utf-8";
        oScript.src = "https://apis.daum.net/local/geo/coord2addr?apikey="+apikey+"&latitude="+ lat +"&longitude="+ lng +"&output=json&callback=fn_pongAddr";
        document.getElementsByTagName("head")[0].appendChild(oScript);
    }
	
	/* ********************************************************
	 * 주소 변환 후 약도주소 입력창에 입력 콜백
	 ******************************************************** */
    function fn_pongAddr(data) {
       	document.getElementById("roughMapAddress").value = data.fullName;
    }
	
	
	/* ********************************************************
	 * 저장처리화면
	 ******************************************************** */
	function fn_egov_regist_roughmap(form) {
		if (!validateRoughMapVO(form)) {
			return;
		} else {
			document.roughMap.action = "<c:url value='/com/uss/ion/rmm/insertRoughMap.do'/>";
			document.roughMap.submit();
		}
	}

	/* ********************************************************
	 * 목록 으로 가기
	 ******************************************************** */
	function fn_egov_inqire_roughmaplist() {
		document.roughMap.action = "<c:url value='/com/uss/ion/rmm/selectRoughMapList.do'/>";
		document.roughMap.submit();
	}
</script>

</head>
<body onLoad="fn_egov_init_roughmapregist();">
	<div id="content" style="width: 712px">

		<!-- 상단 타이틀  영역 -->
		<table width="100%" cellpadding="8" class="table-search" border="0">
			<tr>
				<td width="100%" class="title_left">
					<h1> <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="left" alt="제목아이콘이미지">&nbsp;약도 등록</h1>
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
		<form:form commandName="roughMap" name="roughMap" method="post">
			<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="FAQ에 대한 정보를 등록합니다.">
				<caption>약도 등록</caption>
				<tr>
					<th scope="row" width="20%" height="23" class="required_text" nowrap>
						<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수항목">
						<label for="roughMapSj">약도제목</label>
					</th>
					<td width="80%" nowrap>
						<form:input name="roughMapSj" id="roughMapSj" path="roughMapSj" type="text" size="90" maxlength="75" title="약도제목" />
						<div><form:errors path="roughMapSj"/></div>
					</td>
				</tr>
				<tr>
					<th scope="row" height="23" class="required_text">
						<label for="roughMapAddress">약도주소</label>
					</th>
					<td>
						<input name="roughMapAddress" id="roughMapAddress" type="text" value="" size="90" maxlength="100" title="약도주소" />
						<span class="button"><input type="submit" value="<spring:message code="button.search" />" onclick="fn_Address_Search(); return false;"></span>						
					</td>
				</tr>
				<tr>
					<th scope="row" height="23" class="required_text">
						<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수항목">
						<label for="infoWindow">약도표시</label>
					</th>
					<td>
						<form:input id="infoWindow" path="infoWindow" type="text" size="90" maxlength="75" title="약도주소"/>
						<div><form:errors path="infoWindow"/></div>
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
			<input name="la" id="la" type="hidden" />
			<input name="lo" id="lo" type="hidden" />
			<input name="markerLa" id="markerLa" type="hidden" />
			<input name="markerLo" id="markerLo" type="hidden" />
			<input name="zoomLevel" id="zoomLevel" type="hidden" />
		</form:form>

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
					<span class="button"><input type="submit" value="<spring:message code="button.save" />"	onclick="fn_egov_regist_roughmap(document.forms[0]); return false;"></span>
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