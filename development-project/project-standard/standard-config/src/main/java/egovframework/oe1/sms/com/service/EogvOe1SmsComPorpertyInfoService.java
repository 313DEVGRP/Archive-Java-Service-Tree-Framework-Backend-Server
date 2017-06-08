/*
 * Copyright 2010 MOPAS(Ministry of Public Administration and Security).
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
 */
package egovframework.oe1.sms.com.service;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

/**
 * 각 서비스의 구현 클래스의 프로퍼티를 JSP 에서 
 * select 방식으로 처리 할수 있도록 프로퍼티를 구현클래스 내부를 뒤져서
 * LIST 형식으로 변환해주는 클래스
 * 
 * @author 운영환경개발팀
 * @since 2010.06.29
 * @version 1.0
 * @see <pre>
 * &lt;&lt; 개정이력(Modification Information) &gt;&gt;
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2010.06.29   운영환경개발팀                최초 생성
 * 
 * </pre>
 */

@Service("porpertyInfoService")
public class EogvOe1SmsComPorpertyInfoService {

    /**
     * 구현클래스 내부의 프로퍼티 정보를 읽어서 리스트 형식으로 반환
     * @param String
     * @return List
     * @exception Exception
     */
    public List getPropertyInfo(String ClassName) throws Exception {

        Class<?> cls = Class.forName(ClassName);
        Object vo = cls.newInstance();

        Method[] m = cls.getMethods();
        String methodNm = "";

        List reultList = new ArrayList();

        for (int i = 0; i < m.length; i++) {
            methodNm = m[i].getName();
            if (methodNm.startsWith("set")) {
                reultList.add(lowerCaseFirstLetter(methodNm.substring(3)));
            }

        }

        return reultList;

    }

    
    /**
     * 구현클래스 내부의 프로퍼티 정보를 읽어서 VO에 담아 리스트 형식으로 반환
     * @param String
     * @return List
     * @exception Exception
     */
    public List getPropertyInfoVo(String className) throws Exception {

        Class<?> cls = Class.forName(className);
        Object vo = cls.newInstance();

        Method[] m = cls.getMethods();
        String methodNm = "";
        String methodKey = "";
        List resultList = new ArrayList();

        HashMap map = new HashMap();
        EgovOe1SmsComPropertyInfoVO pvo = null;

        for (int i = 0; i < m.length; i++) {
            methodNm = m[i].getName();
            pvo = new EgovOe1SmsComPropertyInfoVO();
            if (methodNm.startsWith("set")) {
                methodKey = lowerCaseFirstLetter(methodNm.substring(3));
                pvo.setCodeId(methodKey);
                pvo.setCodeNm(methodKey);

                resultList.add(pvo);
            }

        }

        return resultList;

    }

    
    /**
     * 메소드 명으로 프로퍼티 가져오기
     * @param String
     * @return String
     */
    private String lowerCaseFirstLetter(String str) {
        return str.substring(0, 1).toLowerCase() + str.substring(1);
    }
}
