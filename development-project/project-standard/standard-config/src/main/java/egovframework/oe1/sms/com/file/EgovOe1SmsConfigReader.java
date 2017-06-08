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
package egovframework.oe1.sms.com.file;

import java.io.File;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.jdom.Document;
import org.jdom.input.SAXBuilder;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * 설정 파일을 읽어서 Jdoc 생성하는 유틸 클래스
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

@Service("configReader")
public class EgovOe1SmsConfigReader {

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    Logger log = Logger.getLogger(this.getClass());

    /**
     * 설정파일 읽기
     * @param String
     * @return Document
     * @exception Exception
     */
    public Document readConfigFile(String serviceNm) throws Exception {
        Document jdoc = null;

        try {
            String xmlFileReadPath =
                propertiesService.getString("xmlfileReadPath");
            String xmlFileNm = "";

            if (serviceNm.trim().equals("idGen")) {
                xmlFileNm =
                    propertiesService.getString("idGenXmlfileNm").trim();
            } else if (serviceNm.trim().equals("cache")) {
                xmlFileNm =
                    propertiesService.getString("cacheXmlfileNm").trim();
            } else if (serviceNm.trim().equals("ehCache")) {
                xmlFileNm =
                    propertiesService.getString("ehCacheXmlfileNm").trim();
            } else if (serviceNm.trim().equals("schedule")) {
                xmlFileNm =
                    propertiesService.getString("scheduleXmlfileNm").trim();
            } else if (serviceNm.trim().equals("property")) {
                xmlFileNm =
                    propertiesService.getString("propertiesXmlfileNm").trim();
            } else if (serviceNm.trim().equals("dataSource")) {
                xmlFileNm =
                    propertiesService.getString("datasourceXmlfileNm").trim();
            } else {
                log.debug("제공하지 않는 기능입니다.");
            }

            File f = new File(xmlFileReadPath + xmlFileNm);

            if (f.isFile()) {
                SAXBuilder jbuilder = new SAXBuilder(false);
                jdoc = jbuilder.build(f);
            } else {
                jdoc = null;
            }

        } catch (Exception e1) {
            log.debug(e1.getMessage());
        }

        return jdoc;
    }
}
