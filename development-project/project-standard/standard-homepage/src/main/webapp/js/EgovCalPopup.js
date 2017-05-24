/****************************************************************
 * 
 * 파일명 : EgovCalPopup.js
 * 설  명 : 전자정부 공통서비스 달력 팝업 JavaScript
 * 
 *    수정일      수정자     Version        Function 명
 * ------------    ---------   -------------  ----------------------------
 * 2009.03.30    이중호       1.0             최초생성
 * 
 * 
 */
function fn_egov_NormalCalendar(frm, sDate, vDate) {
	var retVal;

	var url = frm.cal_url.value;
	var varParam = new Object();
	varParam.sDate = sDate.value;		

	// IE
	//var openParam = "dialogWidth:252px;dialogHeight:175px;scroll:no;status:no;center:yes;resizable:yes;";
	// FIREFOX
	var openParam = "";
	var sAppName = navigator.appName ;

	if( sAppName.indexOf("Netscape") > -1){
		openParam = "dialogWidth:275px;dialogHeight:200px;scroll:no;status:no;center:yes;resizable:yes;";
	}else if(sAppName.indexOf("Microsoft") > -1){
		openParam = "dialogWidth:275px;dialogHeight:200px;scroll:no;status:no;center:yes;resizable:yes;";
	}else{
		openParam = "dialogWidth:275px;dialogHeight:200px;scroll:no;status:no;center:yes;resizable:yes;";
	}
	
	retVal = window.showModalDialog(url, varParam, openParam);

	if(retVal) {
		if(fn_egov_NormalCalendar.arguments.length == 2){
			sDate.value = retVal.vDate;
		}else{
			sDate.value = retVal.sDate; 
			vDate.value = retVal.vDate; 
		}
	}
}
