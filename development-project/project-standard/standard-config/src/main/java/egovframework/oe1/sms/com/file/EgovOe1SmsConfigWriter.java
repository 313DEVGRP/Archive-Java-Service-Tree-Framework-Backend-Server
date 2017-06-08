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

import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.jdom.Document;
import org.jdom.output.Format;
import org.jdom.output.XMLOutputter;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * 수정 및 생성된 설정 파일을 실제 파일로 쓰는 유틸 클래스
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

@Service("configWriter")
public class EgovOe1SmsConfigWriter {

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    /** EgovOe1SmsFileBackUp Service */
    @Resource(name = "configBackUp")
    protected EgovOe1SmsFileBackUp beackupService;

    Logger log = Logger.getLogger(this.getClass());

    /**
     * 설정파일 쓰기
     * @param Document
     *        , String
     * @return void
     * @exception Exception
     */
    public void writeConfigXml(Document jdoc, String ServiceNm)
            throws Exception {
        // From JDOM Tree To XML File
        Format format = Format.getPrettyFormat();
        // Format format = Format.getCompactFormat();
        format.setEncoding("UTF-8");
        XMLOutputter xmlOut = new XMLOutputter(format);
        FileWriter writer = null;
        
        log.debug("XML FILE VIEW START");
        log.debug(xmlOut.outputString(jdoc));
        log.debug("XML FILE VIEW END");

        String xmlFileStorePath =
            propertiesService.getString("xmlfileStorePath");
        String xmlFileBackupStorePath =
            propertiesService.getString("xmlFileBackupStorePath");
        String xmlFileNm = "";

        log.debug("ServiceNmServiceNm===>" + ServiceNm);

        if (ServiceNm.equals("idGen")) {
            xmlFileNm = propertiesService.getString("idGenXmlfileNm");
        } else if (ServiceNm.equals("cache")) {
            xmlFileNm = propertiesService.getString("cacheXmlfileNm");
        } else if (ServiceNm.equals("ehCache")) {
            xmlFileNm = propertiesService.getString("ehCacheXmlfileNm");
        } else if (ServiceNm.equals("schedule")) {
            xmlFileNm = propertiesService.getString("scheduleXmlfileNm");
        } else if (ServiceNm.equals("property")) {
            xmlFileNm = propertiesService.getString("propertiesXmlfileNm");
        } else if (ServiceNm.equals("dataSource")) {
            xmlFileNm = propertiesService.getString("datasourceXmlfileNm");
        } else {
            log.debug("제공하지 않는 기능입니다.");
        }

        try {

            beackupService.copy(xmlFileStorePath + xmlFileNm,
                xmlFileBackupStorePath + getTime() + "_" + xmlFileNm);
            writer = new FileWriter(xmlFileStorePath + xmlFileNm);
            xmlOut.output(jdoc, writer);
        } catch (IOException e) {
            log.debug(e.getMessage());
        }finally{
            writer.close();
        }
    }

    /**
     * 설정파일 미리보기
     * @param Document
     * @return String
     * @exception Exception
     */
    public String previewConfigXml(Document jdoc) {
        // From JDOM Tree To XML File
        Format format = Format.getPrettyFormat();
        format.setEncoding("UTF-8");
        XMLOutputter xmlOut = new XMLOutputter(format);

        log.debug("XML FILE PREVIEW START");
        log.debug(xmlOut.outputString(jdoc));
        log.debug("XML FILE PREVIEW END");

        return xmlOut.outputString(jdoc);

    }

    /**
     * 현재 시간 반환
     * @param
     * @return String
     * @exception Exception
     */
    private String getTime() {
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat dateFormat =
            new SimpleDateFormat("yyyyMMddHHmm", Locale.getDefault());
        return dateFormat.format(calendar.getTime());
    }

}
