/**
 * 
 * @param form (Form id or jQuery form obj)
 * @param url
 * @param target
 * @param type
 * @param returnType
 * @param data (String or object)
 * @param contentType / String default : application/x-www-form-urlencoded; charset=UTF-8
 * @param jsonpCallback / String default : 'callback'
 * @param processData / boolean default : true
 * @param crossDomain /boolean default : false
 * @returns XMLHttpRequest
 */
function callAjax(form, url, target, type, returnType, data, contentType, jsonpCallback, processData, crossDomain, async) {
    /*
     * jquery로 ajax 사용시 No transport 라는 에러가 발생하는 경우 아래의 문장을 추가하면 해결가능. 
     * (보통 localhost 로 테스트 시 크로스 도메인 문제로 발생하는 오류)
     * 
     * $.support.cors = true;
     * 
     * */
    $.support.cors = true;
    
    var queryString = null;
    
    if (form) {
        var $form = (typeof form === 'string') ? $('#' + form) : form;
        
        queryString = $form.serialize();
        
        // 체크박스 미체크 시에도 파라미터 값을 넘기도록 설정
        var checkboxes = $('input[type="checkbox"]', $form).filter(function() {
            
            return $(this).prop('checked') === false;
        });
        
        $.each(checkboxes, function(i, checkbox) {
            
            queryString += '&' + $(checkbox).attr('name') + '=0';
        });
    }
    else if (data) {
        if (typeof data === 'string') {
            queryString = data;
        }
        else if (typeof data === 'object') {
            queryString = JSON.stringify(data);
        }
    }
    
    /**
     * jQuery.ajax( url [, settings] ) / XMLHttpRequest : 반환값으로 XMLHttpRequest 객체를 반환.
     * 
     * url : 요청을 보낼 URL 문자열
     * settings : key/value 쌍으로 구성된 Ajax 요청 설정값.
     * 모든 값들은 생략이 가능한 옵션값 임.
     * 기본적인 설정값을 $.ajaxSetup() 에 정의 가능.
     */
    var result = $.ajax({
        /*
         * accepts / 데이터 타입에 의존적 : content 타입을 헤더에 포함하여 서버에 보내면 응답 시 같은 타입으로 리턴. (예 : "application/json")
         * contents(added 1.5) : 문자열과 정규표현식이 쌍으로 이루어진 맵 데이터.  jQuery는 응답 데이터를 이 맵 데이터를 기준으로 파싱.
         * context / Object : 
         *                       This object will be made the context of all Ajax-related callbacks. By default, 
         *                       the context is an object that represents the ajax settings used in the call
         *                       ($.ajaxSettings merged with the settings passed to $.ajax). For 
         *                       example, specifying a DOM element as the context will make that the
         *                       context for the complete callback of a request, like so: 
         * $.ajax({
             url: "test.html",
                context: document.body
            }).done(function() {
                $( this ).addClass( "done" );
            });
         * converters(added 1.5) / Object : 데이터 타입을 변환 (Default: {"* text": window.String, "text html": true, "text json": jQuery.parseJSON, "text xml": jQuery.parseXML})
         * dataFilter(data, type) / function : 응답 원시 데이터를 핸들링. 정제된 데이터를 반활해야 할 필요가 있을 때 사용.
         * headers(added 1.5) / Object : 요청 시 추가로 보낼 헤더 정보. key/value 쌍으로 구성. 이 세팅값은 beforeSend 함수가 호출되기 전에 처리되야 함. beforeSend 함수 내에서 value 값을 재조정 가능.
         * isLocal(added 1.5.1) / boolean : (default: depends on current location protocol)
         *                                     Allow the current environment to be recognized as "local," (e.g. the filesystem),
         *                                     even if jQuery does not recognize it as such by default. The
         *                                     following protocols are currently recognized as local: file, *-extension,
         *                                     and widget. If the isLocal setting needs modification, it is recommended
         *                                     to do so once in the $.ajaxSetup() method. (version added: 1.5.1) 
         * mimeType(added 1.5.1) / String : XHR의 마임 타입을 설정.
         * username / String : HTTP 엑세스 시 username 을 설정.
         * password / String : HTTP 엑세스 시 paasword 를 설정.
         * scriptCharset / String : 요청 dataType 이 "jsonp" 나 "script" 이고 type 이 "GET" 인 경우 강제로 charset 설정.
         * traditional / boolean : 이 세팅값을 true로 하면 전통적인 스타일의 파라미터 직렬화를 사용할 수 있음. (?)
         * xhr / function : XMLHttpRequest 객체 반환 (default : IE 에서는 ActiveXObject 이고 다른 브라우저는 XMLHttpRequest)
         * xhrFields(added 1.5.1) / Object : 기본 XHR 객체의 키-값의 맵 데이터 반환
         *  
         *  ========================= 사용여부에 따른 구분 =========================
         *  
         * url / String : 요청이 전송되는 URL 이 포함된 문자열.
         * type : Http 요청방식. (get/post)
         * data : 서버에 전송할 데이터, key/value 형식의 객체. GET 요청 형태의 query 스트링으로 변환되어 보내짐. value가 배열이라면, jQuery는 같은 key로 여러 value를 직렬화 구성
         * dataType / String : Http 요청후 return 하는 데이터의 Type. 
         * (
         *         xml : xml 문서,
         *         html : plain text 로 이루어진 html 문서,
         *         script : JavaScript를 실행하고 평문 텍스트를 반환. 쿼리 스트링에 "_=[TIMESTAMP]" 를 추가하면 캐싱을 방지할 수 있음. 이런 방식은 cache 옵션을 true로 바꾸는 역할을 함,
         *         json : JSON을 JavaScript 객체형태로 반환,
         *         jsonp : JSONP 를 사용하여 JSON 블럭을 로드. 쿼리 스트링에 "_=[TIMESTAMP]" 를 추가하면 캐싱을 방지할 수 있음. 이런 방식은 cache 옵션을 true로 바꾸는 역할을 함 ,
         *         text : plain text,
         *         multiple / 공백 구분 값(space-separated values) : jQuery 1.5 부터 dataType을 변환 가능. text 를 XML 로 변화하고 싶으면, "text xml" 로 설정.
         * )
         * jsonp / String : jsonp 요청에 사용한 콜백 함수명을 오버라이드. url에 포함된 쿼리 스트링의 부분인 'callback=?' 문자열 중 'callback' 을 대신하여 사용.
         *                     jQuery 1.5 부터는 jsonp 옵션을 false 로 세팅하여 URL에 "?callback" 이 추가되는 것을 방지하거나 "=?" 을 변조되는 시도를 방지할 수 있음.
         *                     이러한 경우 명시적으로 jsonpCallback 세팅값을 이용하여야 함. 예를 들어, { jsonp: false, jsonpCallback: "callbackName" } 와 같이 사용.
         * jsonpCallback / String, function : JSONP 요청 시 콜백 함수명을 지정. 지정하지 않으면 jQuery에서 임의적으로 부여. 
         * timeout : Http 요청에 대한 제한시간. (단위 : ms)
         * global / boolean : 전역 Ajax 이벤트 핸들러 활성 여부. 이 값을 false로 하면 ajaxStart 나 ajaxStop 같은 전역 핸들러의 실행을 막을 수 있음. (default : true)
         * contentType / String : Http 요청시 content-type 헤더. (default 는 'application/x-www-form-urlencoded')
         *                           서버로 데이터를 보낼 때는 언제나 UTF-8 charset를 사용. 따라서 서버 사이드 프로그램 시 그에 맞게 디코딩을 하여 사용해야 함.
         * async / boolean : 요청시 비동기 여부. (default : true)
         *                      크로스도메인(2개의 도메인 사이의 정보교환)과 dataType: "jsonp" 인 경우는 동기방식이 지원되지 않음.
         * cache / boolean : 브라우저에 의해 요청되는 페이지 캐시 여부. (dafault 는 true 이나 dataType 이 script 인 경우 false)
         *                      만일 이 값을 false로 하면, 브라우저의 캐쉬사용을 강제적으로 막음. 또한 false 세팅하면 URL 쿼리 스트링에 "_=[TIMESTAMP]" 값이 추가
         * beforeSend(jqXHR, settings) : 요청 전 콜백 함수로 jqXHR 객체 변경 가능함. false 반환 시 ajax 요청하지 않음. jQuery 1.5 버젼부터 요청의 type에 상관 없이 호출 가능함.
         * success(data, textStatus, jqXHR) / function, array(added 1.5): Http 요청 성공시 이벤트 핸들러.
         * error(jqXHR, textStatus, errorThrown) / function : Http 요청 실패시 이벤트 핸들러.
         *                                                       jqXHR 는 발생한 에러 타입과 추가적인 예외 사항을 포함.
         *                                                       textStatus 는 "timeout", "error", "abort", "parsererror" 와 같은 상황을 포함.
         *                                                       errorThrown 은 HTTP 에러가 담겨 있는데, "Not Found" 나 "Internal Server Error." 같은 것.
         *                                                       cross-domain 스크립트나 JSONP 요청에 대해서는 사용 불가.
         * complete(jqXHR, textStatus) / function : Http 요청 완료시 이벤트 핸들러, success 나 error 가 호출된 후에 호출됨.
         *                                          jqXHR 객체와 요청에 대한 상태값("success", "notmodified", "error", "timeout", "abort", "parsererror")으로 구성
         * beforeSend(jqXHR, settings) / function : Http 요청 전에 발생하는 이벤트 핸들러, 반환값을 false 로 설정하면 요청 취소 가능. 
         * statusCode(added 1.5) / Object : 요청에 대한 응답 시 전달된 HTTP 상태 코드와 실행될 함수로 이루어진 집합.
         * processData / boolean : 기본적으로 전송데이터는 어떤 타입이건 전송시 queryString 형태로 변환되고 dataType 은 default 값으로 고정됨. 특정 dataType 그대로 전송을 원한다면 false 로 설정. (default : true) 
         * ifModified / boolean : 마지막 request 이후 response가 변경되었을 경우에만 request가 성공하도록 허용하는 값.
         *                           마지막 수정 정보를 헤더에서 체크하는 것. (default : false, 언제나 request 에 대한 응답을 체크)
         * crossDomain(added 1.5) / boolean : 같은 도메인 내의 요청일 경우 true, 크로스 도메인 간의 데이터 교환이라면(JSONP와 같은), 이 세팅값을 true로 해야 함. (default 는 false) 
         * */
        url : url,
        type : type,
        data : queryString,
        dataType : returnType,
        jsonp : false,
        jsonpCallback : 'undefined' === typeof jsonpCallback || null == jsonpCallback ? "callback" : jsonpCallback,
        timeout : 7313,
        global : true,
        contentType : 'undefined' === typeof contentType || null == contentType ? 'application/x-www-form-urlencoded; charset=UTF-8' : contentType,
        async : 'undefined' === typeof async || null == async ? true : async,
        cache : false,
        beforeSend: function(jqXHR) {
          jqXHR.setRequestHeader('customHeader', 'ajax');
        },
        statusCode: {
            0 : function() {
                
                notificationAlert("No transport");
            
            },
            302 : function() {
                
                notificationAlert("Page moved");
            
            },
            403 : function() {
                
                notificationAlert("Page forbbiden");
            
            },
            404 : function() {
                
                notificationAlert("Page not found");
            
            },
            500 : function() {
                
                notificationAlert("Internal server error");
            
            }
        },
        processData : 'undefined' === typeof processData || null == processData ? true : processData,
        ifModified : false,
        crossDomain : 'undefined' === typeof crossDomain || null == crossDomain ? false : crossDomain
    });
    
    result.done(function(responseText, textStatus, jqXHR) {
//        notificationAlert("success");
        
//        console.log('[done]');
//        console.log(responseText);
//        console.log(textStatus);
//        console.log(jqXHR);
        
        if ("text" == this.dataType.toLowerCase() || "html" == this.dataType.toLowerCase()) {

            if (typeof target === 'string') {
                
                $(target).html(responseText);
            }
            else if (typeof target === 'object') {
                
                var $style = target.$document.find('head style#style');
                
                var $mockDiv = $('<div />').html(responseText);
                
                $style.html( $style.html() + $mockDiv.find('style#style').html() );
                
                $(target.target).html( $mockDiv.find(target.selector) );
                
                eval( $mockDiv.find('script#script').text() );
            }
        }
    });
    
    result.fail(function(jqXHR, textStatus, errorThrown){
      
//      console.log('[fail]');
//      console.log(jqXHR);
//      console.log(textStatus);
//      console.log(errorThrown);
      
        var isDefinedError = false;
        
        for(var status in this.statusCode){
            
            if (jqXHR.status == Number(status)) {
                
                isDefinedError = true;
                break;
            }
        }
        
        if (isDefinedError) {
            
            this.statusCode;
        
        } else {
        
            notificationAlert("Unknown error (statusCode : " + jqXHR.status + ", statusText : " + textStatus + ")");
            
        }
    });

    result.always(function(responseText, textStatus, jqXHR) {
//        notificationAlert("complete");
      
//      console.log('[always]');
//      console.log(responseText);
//      console.log(textStatus);
//      console.log(jqXHR);

        if (responseText.result == false) {
            notificationAlert(responseText.message || '처리 도중 문제가 발생하였습니다. 관리자에게 문의해주세요.');
        } else {
            //notificationAlert('정상 처리되었습니다.');
        }
        
        if (jsonpCallback) {
            jsonpCallback(responseText);
        }
      
    });
    //dataType : xml , html , json , jsonp , script , text
        
    function notificationAlert(message) {
        /*
         *    [required]
         *    jNotify.jquery.css
         *    jNotify.jquery.js
         *  
        */
        jNotify(message, {
            /**
             * [options]
             * autoHide / Boolean            Default : true - jNotify closed after TimeShown ms or by clicking on it
             * clickOverlay / Boolean         Default : false - If false, disables closing jNotify by clicking on the background overlay.
             * MinWidth / Integer             Default : 200 - In pixel, the min-width css property of the boxes.
             * TimeShown / Integer             Default : 1500 - In ms, time of the boxes appearances.
             * ShowTimeEffect / Integer     Default : 200 - In ms, duration of the Show effect
             * HideTimeEffect / Integer     Default : 200 - In ms, duration of the Hide effect
             * LongTrip / Integer            Default : 15 - Length of the move effect ('top' and 'bottom' verticals positions only)
             * HorizontalPosition / String    Default : right - Horizontal position. Can be set to 'left', 'center', 'right'
             * VerticalPosition / String    Default : top - Vertical position. Can be set to 'top', 'center', 'bottom'.
             * ShowOverlay / Boolean        Default : true - If true, a background overlay appears behind the jNotify boxes
             * ColorOverlay / String        Default : #000 - Color of the overlay background (only Hex. color code)
             * OpacityOverlay / Integer        Default : 0.3 - Opacity CSS property of the overlay background. From 0 to 1 max.
             */
            autoHide : true, // added in v2.0
            TimeShown : 1000,
            HorizontalPosition : 'center',
            VerticalPosition : 'top'
        //    onCompleted : function(){ // added in v2.0
        //    alert('jNofity is completed !');
        // }
        });
    }
    
    return result;
}