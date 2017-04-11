/*
 * eGovFrame JFile
 * Copyright The eGovFrame Open Community (http://open.egovframe.go.kr)).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * 
 * @author 정호열 커미터(표준프레임워크 오픈커뮤니티 리더)
 */
package egovframework.com.ext.jfile.view;

import java.io.PrintWriter;
import java.util.Map;

import egovframework.com.ext.jfile.org.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.AbstractView;

/**
 *  클래스
 * @author 정호열
 * @since 2010.10.17
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일        수정자       수정내용
 *  -------       --------    ---------------------------
 *   2010.10.17   정호열       최초 생성
 *   2013.12.19	표준프레임워크	공통컴포넌트 추가 적용 (패키지 변경)
 * </pre>
 */
public class JSonView extends AbstractView {
	
	/** JSonView 명 */
	public static final String NAME = "jsonView";
	
	/** 컨텐트 타입을 UTF-8"으로 설정한다. */
	public JSonView(){
		this.setContentType("text/plain; charset=UTF-8");
	}
	
	/**
	 * JSON 형태로 데이타를 랜더링 하여 출력한다.
	 */
	@Override
	protected void renderMergedOutputModel(@SuppressWarnings("rawtypes") Map model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType(this.getContentType());
		
		JSONObject jsonObject = (JSONObject)model.get(JsonConstants.JSON_OBJECT_KEY);
		if(jsonObject == null) 
			jsonObject = new JSONObject(model);
		
		jsonObject.put(JsonConstants.JSON_RESULT_MESSAGE_TARGET, model.get(JsonConstants.JSON_RESULT_MESSAGE_TARGET) != null ?
			model.get(JsonConstants.JSON_RESULT_MESSAGE_TARGET) : JsonConstants.JSON_RESULT_MESSAGE_STATUS
		);
		jsonObject.put(JsonConstants.JSON_RESULT_CODE, model.get(JsonConstants.JSON_RESULT_CODE) != null ?
			model.get(JsonConstants.JSON_RESULT_CODE) : JsonConstants.JSON_SUCCESS_CODE 
		);
		PrintWriter printWriter = response.getWriter();
		try{	
			printWriter.write(jsonObject.toString());
			printWriter.flush();
		}finally{if(printWriter != null){printWriter.close();}}
	}

	public static class JsonConstants {
		/** 애플리케이션에서 JsonObject 형태로 주고 받을 결과 코드 key 명 */
	    public static final String JSON_RESULT_CODE    = "JsonResultCode";
	   
	    /** 애플리케이션에서 JsonObject 형태로 주고 받을 결과 메세지 key 명 */
	    public static final String JSON_RESULT_MESSAGE = "JsonResultMessage";
	    
	    /** 애플리케이션에서 정상및 오류일 경우 Alert || Popup || Status일지 구분코드 Key 명 */
	    public static final String JSON_RESULT_MESSAGE_TARGET = "JsonResultMessageTarget";
	    
	    /** 애플리케이션에서 JsonObject 결과를 alert 창으로 보여 줄 것임을 명시 */
	    public static final String JSON_RESULT_MESSAGE_ALERT = "alert";
	    
	    /** 애플리케이션에서 JsonObject 결과를 팝업창으로 보여 줄 것임을 명시 */
		public static final String JSON_RESULT_MESSAGE_POPUP = "popup";
		
		/** 애플리케이션에서 JsonObject 결과를 상태창으로 보여 줄 것임을 명시 */
		public static final String JSON_RESULT_MESSAGE_STATUS = "status";
		
		/** 애플리케이션에서 JsonObject 형태로 주고 받을 성공 메세지 명 */
		public static final String JSON_SUCCESS_CODE   = "success";
		
		/** 애플리케이션에서 JsonObject 형태로 주고 받을 실패 메세지 명 */
		public static final String JSON_FAILURE_CODE   = "failure";
		
		/** jsonObject 키 명 */
		public static final String JSON_OBJECT_KEY = "jsonObject";
	}
}
