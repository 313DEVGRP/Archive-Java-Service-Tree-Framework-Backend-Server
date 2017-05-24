/****************************************************************
 * 
 * 파일명 : EgovZipPopup.js
 * 설  명 : 전자정부 공통서비스 달력 팝업 JavaScript
 * 
 *    수정일      수정자     Version        Function 명
 * ------------    ---------   -------------  ----------------------------
 * 2009.03.30    이중호       1.0             최초생성
 * 
 * 
 */

/**********************************************
 * 함수명 : fn_egov_ZipSearch
 * 설  명 : 우편번호찾기 팝업 호출 - form별로 이름이 다른 경우 사용
 * 인  자 : 사용할 Form 객체, 우편번호(123456), 우편번호(123-456), 주소 
 * 사용법 : fn_egov_ZipSearch(frm, sZip, vZip, sAddr)
 * 
 * 수정일        수정자      수정내용
 * ------        ------     -------------------
 * 2009.03.30    이중호      신규작업
 * 
 */
function fn_egov_ZipSearch(frm, sZip, vZip, sAddr) {
	var retVal;

	var url = frm.zip_url.value;
	//var url = "/ebt/sym/cmm/EgovCcmZipSearchPopup.do"; 
	var varParam = new Object();
	varParam.sZip = sZip.value;		

	// IE
	//var openParam = "dialogWidth:500px;dialogHeight:325px;scroll:no;status:no;center:yes;resizable:yes;";
	// FIREFOX
	var openParam = "dialogWidth:550px;dialogHeight:365px;scroll:no;status:no;center:yes;resizable:yes;";

	retVal = window.showModalDialog(url, varParam, openParam);

	if(retVal) {
		sZip.value  = retVal.sZip;
		vZip.value  = retVal.vZip;
		sAddr.value = retVal.sAddr;
	}
}
