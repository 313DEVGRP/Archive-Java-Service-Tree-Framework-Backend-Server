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
package egovframework.oe1.sms.cache.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.jdom.Attribute;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.Namespace;
import org.springframework.stereotype.Service;

import egovframework.oe1.sms.com.file.EgovOe1SmsConfigWriter;
import egovframework.oe1.sms.com.service.EgovOe1SmsComBeanVO;

/**
 * 캐시 설정관리를 위한 서비스 클래스
 * @author 운영환경개발팀
 * @since 2010.06.29
 * @version 1.0
 * @see <pre>
 * &lt;&lt; 개정이력(Modification Information) &gt;&gt;
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2010.06.29   운영환경개발팀          최초 생성
 * 
 * </pre>
 */

@Service("cacheService")
public class EgovOe1SmsCacheService {

    /** EgovOleSmsConfigWriter */
    @Resource(name = "configWriter")
    private EgovOe1SmsConfigWriter configWriter;

    Logger log = Logger.getLogger(this.getClass());

    /**
     * Ehcache 빈 설정 목록 조회
     * @param EgovOe1SmsEhCacheVO
     *        , Document
     * @return List
     * @exception Exception
     */
    public List selectEhCacheList(EgovOe1SmsEhCacheVO ehCacheVO, Document jdoc)
            throws Exception {

        Namespace schemaNamespace = null;
        List<EgovOe1SmsEhCacheVO> list = new ArrayList<EgovOe1SmsEhCacheVO>();

        if (jdoc != null) {
            Element ehCache_root = jdoc.getRootElement();
            Element ehCache_diskStore = ehCache_root.getChild("diskStore");
            List ehCache_element = ehCache_root.getChildren("cache");

            ehCacheVO.setDiskStorePath(ehCache_diskStore
                .getAttributeValue("path"));

            String searchKeyword = ehCacheVO.getSearchKeyword();
            String ehCacheNm = "";

            for (int i = 0; i < ehCache_element.size(); i++) {
                EgovOe1SmsEhCacheVO eVo = new EgovOe1SmsEhCacheVO();

                Element cache = (Element) ehCache_element.get(i);
                ehCacheNm = cache.getAttributeValue("name");

                eVo.setEhCacheNm(ehCacheNm);

                if (!searchKeyword.equals("")) {

                    if (ehCacheNm.trim().contains(searchKeyword.trim())) {

                        eVo.setEhCacheNm(ehCacheNm);
                        eVo.setEhCacheCount(i + 1);

                        list.add(eVo);

                    }

                } else { // 검색조건 없을때,

                    eVo.setEhCacheNm(ehCacheNm);
                    eVo.setEhCacheCount(i + 1);

                    list.add(eVo);
                }
            }
        }

        return list;
    }

    /**
     * Ehcache 빈 설정 상세조회 조회
     * @param EgovOe1SmsEhCacheVO
     *        , Document, Namespace
     * @return EgovOe1SmsEhCacheVO
     * @exception Exception
     */
    public EgovOe1SmsEhCacheVO selectEhCache(EgovOe1SmsEhCacheVO ehCacheVO,
            Document jdoc, Namespace schemaNamespace) throws Exception {
        EgovOe1SmsEhCacheVO bVo = new EgovOe1SmsEhCacheVO();

        // schemaNamespace =
        // Namespace.getNamespace("xsd","http://www.springframework.org/schema/beans");

        Element ehCache_root = jdoc.getRootElement();
        Element ehCache_diskStore = ehCache_root.getChild("diskStore");
        bVo.setDiskStorePath(ehCache_diskStore.getAttributeValue("path"));

        List ehCache_element = ehCache_root.getChildren("cache");

        String searchCacheNm = ehCacheVO.getEhCacheNm();

        log.debug(searchCacheNm);

        String diskExpiryThreadIntervalSeconds;
        String diskSpoolBufferSizeMB;
        String diskPersistent;
        String diskAccessStripes;
        String eternal;
        String maxElementsInMemory;
        String memoryStoreEvictionPolicy;
        String overflowToDisk;
        String timeToIdleSeconds;
        String timeToLiveSeconds;
        String maxElementsOnDisk;
        String statistics;
        String copyOnRead;
        String copyOnWrite;
        String logging;

        for (int i = 0; i < ehCache_element.size(); i++) {

            Element ehCache = (Element) ehCache_element.get(i);

            String ehCacheNm = ehCache.getAttributeValue("name");

            diskExpiryThreadIntervalSeconds =
                ehCache.getAttributeValue("diskExpiryThreadIntervalSeconds");
            diskSpoolBufferSizeMB =
                ehCache.getAttributeValue("diskSpoolBufferSizeMB");
            diskPersistent = ehCache.getAttributeValue("diskPersistent");
            diskAccessStripes = ehCache.getAttributeValue("diskAccessStripes");
            eternal = ehCache.getAttributeValue("eternal");
            maxElementsInMemory =
                ehCache.getAttributeValue("maxElementsInMemory");
            memoryStoreEvictionPolicy =
                ehCache.getAttributeValue("memoryStoreEvictionPolicy");
            overflowToDisk = ehCache.getAttributeValue("overflowToDisk");
            timeToIdleSeconds = ehCache.getAttributeValue("timeToIdleSeconds");
            timeToLiveSeconds = ehCache.getAttributeValue("timeToLiveSeconds");
            maxElementsOnDisk = ehCache.getAttributeValue("maxElementsOnDisk");
            statistics = ehCache.getAttributeValue("statistics");
            copyOnRead = ehCache.getAttributeValue("copyOnRead");
            copyOnWrite = ehCache.getAttributeValue("copyOnWrite");
            logging = ehCache.getAttributeValue("logging");

            if (searchCacheNm.trim().equals(ehCacheNm.trim())) {
                diskExpiryThreadIntervalSeconds =
                    (diskExpiryThreadIntervalSeconds != null)
                        ? diskExpiryThreadIntervalSeconds : "";
                diskSpoolBufferSizeMB =
                    (diskSpoolBufferSizeMB != null)
                        ? diskSpoolBufferSizeMB : "";
                diskPersistent = (diskPersistent != null) ? diskPersistent : "";
                diskAccessStripes =
                    (diskAccessStripes != null) ? diskAccessStripes : "";
                eternal = (eternal != null) ? eternal : "";
                maxElementsInMemory =
                    (maxElementsInMemory != null) ? maxElementsInMemory : "";
                memoryStoreEvictionPolicy =
                    (memoryStoreEvictionPolicy != null)
                        ? memoryStoreEvictionPolicy : "";
                overflowToDisk = (overflowToDisk != null) ? overflowToDisk : "";
                timeToIdleSeconds =
                    (timeToIdleSeconds != null) ? timeToIdleSeconds : "";
                timeToLiveSeconds =
                    (timeToLiveSeconds != null) ? timeToLiveSeconds : "";
                maxElementsOnDisk =
                    (maxElementsOnDisk != null) ? maxElementsOnDisk : "";
                statistics = (statistics != null) ? statistics : "";
                copyOnRead = (copyOnRead != null) ? copyOnRead : "";
                copyOnWrite = (copyOnWrite != null) ? copyOnWrite : "";
                logging = (logging != null) ? logging : "";

                bVo.setEhCacheNm(searchCacheNm);
                bVo
                    .setDiskExpiryThreadIntervalSeconds(diskExpiryThreadIntervalSeconds);
                bVo.setDiskSpoolBufferSizeMB(diskSpoolBufferSizeMB);
                bVo.setDiskPersistent(diskPersistent);
                bVo.setDiskAccessStripes(diskAccessStripes);
                bVo.setEternal(eternal);
                bVo.setMaxElementsInMemory(maxElementsInMemory);
                bVo.setMemoryStoreEvictionPolicy(memoryStoreEvictionPolicy);
                bVo.setOverflowToDisk(overflowToDisk);
                bVo.setTimeToIdleSeconds(timeToIdleSeconds);
                bVo.setTimeToLiveSeconds(timeToLiveSeconds);
                bVo.setMaxElementsOnDisk(maxElementsOnDisk);
                bVo.setStatistics(statistics);
                bVo.setCopyOnRead(copyOnRead);
                bVo.setCopyOnWrite(copyOnWrite);
                bVo.setLogging(logging);

                break;
            }

        }
        return bVo;
    }

    /**
     * Ehcache 빈 설정 수정
     * @param EgovOe1SmsEhCacheVO
     *        , Document, Namespace
     * @return void
     * @exception Exception
     */
    public void updateEhCacheService(EgovOe1SmsEhCacheVO ehCacheVO,
            Document jdoc, Namespace schemaNamespace) throws Exception {

        Namespace.getNamespace("",
            "http://www.springframework.org/schema/beans");

        Element ehCache_root = jdoc.getRootElement();
        Element ehCache_diskStore = ehCache_root.getChild("diskStore");

        List ehCache_element = ehCache_root.getChildren("cache");

        String uptdiskStore = ehCacheVO.getDiskStorePath();
        String uptEhCacheNm = ehCacheVO.getEhCacheNm();
        String uptDiskExpiry = ehCacheVO.getDiskExpiryThreadIntervalSeconds();
        String uptDiskSpoolBuffer = ehCacheVO.getDiskSpoolBufferSizeMB();
        String uptDiskPersistent = ehCacheVO.getDiskPersistent();
        String uptDiskAccess = ehCacheVO.getDiskAccessStripes();
        String uptEternal = ehCacheVO.getEternal();
        String uptMaxElementsInM = ehCacheVO.getMaxElementsInMemory();
        String uptMemoryStore = ehCacheVO.getMemoryStoreEvictionPolicy();
        String uptOverflowToD = ehCacheVO.getOverflowToDisk();
        String uptTimeToIdleS = ehCacheVO.getTimeToIdleSeconds();
        String uptTimeToLiveS = ehCacheVO.getTimeToLiveSeconds();
        String uptMaxElements = ehCacheVO.getMaxElementsOnDisk();
        String uptStatistics = ehCacheVO.getStatistics();
        String uptCopyOnR = ehCacheVO.getCopyOnRead();
        String uptCopyOnW = ehCacheVO.getCopyOnWrite();
        String uptLogging = ehCacheVO.getLogging();

        ehCache_diskStore.setAttribute("path", uptdiskStore);

        for (int i = 0; i < ehCache_element.size(); i++) {

            Element cache = (Element) ehCache_element.get(i);
            String id = cache.getAttributeValue("name");

            if (id.trim().equals(uptEhCacheNm.trim())) {
                if (!"".equals(uptDiskExpiry) && uptDiskExpiry != null) {
                    cache.setAttribute("diskExpiryThreadIntervalSeconds",
                        uptDiskExpiry);
                }
                if (!"".equals(uptDiskSpoolBuffer)
                    && uptDiskSpoolBuffer != null) {
                    cache.setAttribute("diskSpoolBufferSizeMB",
                        uptDiskSpoolBuffer);
                }
                if (!"".equals(uptDiskPersistent) && uptDiskPersistent != null) {
                    cache.setAttribute("diskPersistent", uptDiskPersistent);
                }
                if (!"".equals(uptDiskAccess) && uptDiskAccess != null) {
                    cache.setAttribute("diskAccessStripes", uptDiskAccess);
                }
                if (!"".equals(uptEternal) && uptEternal != null) {
                    cache.setAttribute("eternal", uptEternal);
                }
                if (!"".equals(uptMaxElementsInM) && uptMaxElementsInM != null) {
                    cache
                        .setAttribute("maxElementsInMemory", uptMaxElementsInM);
                }
                if (!"".equals(uptMemoryStore) && uptMemoryStore != null) {
                    cache.setAttribute("memoryStoreEvictionPolicy",
                        uptMemoryStore);
                }
                if (!"".equals(uptOverflowToD) && uptOverflowToD != null) {
                    cache.setAttribute("overflowToDisk", uptOverflowToD);
                }
                if (!"".equals(uptTimeToIdleS) && uptTimeToIdleS != null) {
                    cache.setAttribute("timeToIdleSeconds", uptTimeToIdleS);
                }
                if (!"".equals(uptTimeToLiveS) && uptTimeToLiveS != null) {
                    cache.setAttribute("timeToLiveSeconds", uptTimeToLiveS);
                }
                if (!"".equals(uptMaxElements) && uptMaxElements != null) {
                    cache.setAttribute("maxElementsOnDisk", uptMaxElements);
                }
                if (!"".equals(uptStatistics) && uptStatistics != null) {
                    cache.setAttribute("statistics", uptStatistics);
                }
                if (!"".equals(uptCopyOnR) && uptCopyOnR != null) {
                    cache.setAttribute("copyOnRead", uptCopyOnR);
                }
                if (!"".equals(uptCopyOnW) && uptCopyOnW != null) {
                    cache.setAttribute("copyOnWrite", uptCopyOnW);
                }
                if (!"".equals(uptLogging) && uptLogging != null) {
                    cache.setAttribute("logging", uptLogging);
                }
            }
        }

        configWriter.writeConfigXml(jdoc, ehCacheVO.getServiceNm());
    }

    /**
     * Ehcache 설정 미리보기
     * @param EgovOe1SmsEhCacheVO
     *        , Document, Namespace
     * @return String
     * @exception Exception
     */
    public String previewEhCacheService(EgovOe1SmsEhCacheVO ehCacheVO,
            Document jdoc, Namespace schemaNamespace) throws Exception {

        // Change JDOM Tree cronExpression value
        Element ehCache_root = jdoc.getRootElement();
        Element ehCache_diskStore = ehCache_root.getChild("diskStore");

        List ehCache_element = ehCache_root.getChildren("cache");

        String uptdiskStore = ehCacheVO.getDiskStorePath();
        String uptEhCacheNm = ehCacheVO.getEhCacheNm();
        String uptDiskExpiry = ehCacheVO.getDiskExpiryThreadIntervalSeconds();
        String uptDiskSpoolBuffer = ehCacheVO.getDiskSpoolBufferSizeMB();
        String uptDiskPersistent = ehCacheVO.getDiskPersistent();
        String uptDiskAccess = ehCacheVO.getDiskAccessStripes();
        String uptEternal = ehCacheVO.getEternal();
        String uptMaxElementsInM = ehCacheVO.getMaxElementsInMemory();
        String uptMemoryStore = ehCacheVO.getMemoryStoreEvictionPolicy();
        String uptOverflowToD = ehCacheVO.getOverflowToDisk();
        String uptTimeToIdleS = ehCacheVO.getTimeToIdleSeconds();
        String uptTimeToLiveS = ehCacheVO.getTimeToLiveSeconds();
        String uptMaxElements = ehCacheVO.getMaxElementsOnDisk();
        String uptStatistics = ehCacheVO.getStatistics();
        String uptCopyOnR = ehCacheVO.getCopyOnRead();
        String uptCopyOnW = ehCacheVO.getCopyOnWrite();
        String uptLogging = ehCacheVO.getLogging();

        // ehCache_diskStore.setAttribute("path",
        // uptdiskStore);

        for (int i = 0; i < ehCache_element.size(); i++) {

            Element cache = (Element) ehCache_element.get(i);
            String id = cache.getAttributeValue("name");

            if (id.trim().equals(uptEhCacheNm.trim())) {
                if (!"".equals(uptDiskExpiry) && uptDiskExpiry != null) {
                    cache.setAttribute("diskExpiryThreadIntervalSeconds",
                        uptDiskExpiry);
                }
                if (!"".equals(uptDiskSpoolBuffer)
                    && uptDiskSpoolBuffer != null) {
                    cache.setAttribute("diskSpoolBufferSizeMB",
                        uptDiskSpoolBuffer);
                }
                if (!"".equals(uptDiskPersistent) && uptDiskPersistent != null) {
                    cache.setAttribute("diskPersistent", uptDiskPersistent);
                }
                if (!"".equals(uptDiskAccess) && uptDiskAccess != null) {
                    cache.setAttribute("diskAccessStripes", uptDiskAccess);
                }
                if (!"".equals(uptEternal) && uptEternal != null) {
                    cache.setAttribute("eternal", uptEternal);
                }
                if (!"".equals(uptMaxElementsInM) && uptMaxElementsInM != null) {
                    cache
                        .setAttribute("maxElementsInMemory", uptMaxElementsInM);
                }
                if (!"".equals(uptMemoryStore) && uptMemoryStore != null) {
                    cache.setAttribute("memoryStoreEvictionPolicy",
                        uptMemoryStore);
                }
                if (!"".equals(uptOverflowToD) && uptOverflowToD != null) {
                    cache.setAttribute("overflowToDisk", uptOverflowToD);
                }
                if (!"".equals(uptTimeToIdleS) && uptTimeToIdleS != null) {
                    cache.setAttribute("timeToIdleSeconds", uptTimeToIdleS);
                }
                if (!"".equals(uptTimeToLiveS) && uptTimeToLiveS != null) {
                    cache.setAttribute("timeToLiveSeconds", uptTimeToLiveS);
                }
                if (!"".equals(uptMaxElements) && uptMaxElements != null) {
                    cache.setAttribute("maxElementsOnDisk", uptMaxElements);
                }
                if (!"".equals(uptStatistics) && uptStatistics != null) {
                    cache.setAttribute("statistics", uptStatistics);
                }
                if (!"".equals(uptCopyOnR) && uptCopyOnR != null) {
                    cache.setAttribute("copyOnRead", uptCopyOnR);
                }
                if (!"".equals(uptCopyOnW) && uptCopyOnW != null) {
                    cache.setAttribute("copyOnWrite", uptCopyOnW);
                }
                if (!"".equals(uptLogging) && uptLogging != null) {
                    cache.setAttribute("logging", uptLogging);
                }
            }
        }

        return configWriter.previewConfigXml(jdoc);
    }

    /**
     * Ehcache 설정 미리보기
     * @param EgovOe1SmsEhCacheVO
     *        , Document, Namespace
     * @return String
     * @exception Exception
     */
    public String previewNewEhCacheService(EgovOe1SmsEhCacheVO ehCacheVO)
            throws Exception {

        Document jdoc = null;

        String insertdiskStore = ehCacheVO.getDiskStorePath();
        String insertEhCacheNm = ehCacheVO.getEhCacheNm();
        String insertDiskExpiry =
            ehCacheVO.getDiskExpiryThreadIntervalSeconds();
        String insertDiskSpoolBuffer = ehCacheVO.getDiskSpoolBufferSizeMB();
        String insertDiskPersistent = ehCacheVO.getDiskPersistent();
        String insertDiskAccess = ehCacheVO.getDiskAccessStripes();
        String insertEternal = ehCacheVO.getEternal();
        String insertMaxElementsInM = ehCacheVO.getMaxElementsInMemory();
        String insertMemoryStore = ehCacheVO.getMemoryStoreEvictionPolicy();
        String insertOverflowToD = ehCacheVO.getOverflowToDisk();
        String insertTimeToIdleS = ehCacheVO.getTimeToIdleSeconds();
        String insertTimeToLiveS = ehCacheVO.getTimeToLiveSeconds();
        String insertMaxElements = ehCacheVO.getMaxElementsOnDisk();
        String insertStatistics = ehCacheVO.getStatistics();
        String insertCopyOnR = ehCacheVO.getCopyOnRead();
        String insertCopyOnW = ehCacheVO.getCopyOnWrite();
        String insertLogging = ehCacheVO.getLogging();

        Element rootElement = new Element("ehcache");
        jdoc = new Document(rootElement);

        Element diskElement = new Element("diskStore");
        diskElement.setAttribute("path", insertdiskStore);
        rootElement.addContent(diskElement);

        Element cacheElement = new Element("cache");
        if (!"".equals(insertEhCacheNm) && insertEhCacheNm != null) {
            cacheElement.setAttribute("name", insertEhCacheNm);
        }
        if (!"".equals(insertDiskExpiry) && insertDiskExpiry != null) {
            cacheElement.setAttribute("diskExpiryThreadIntervalSeconds",
                insertDiskExpiry);
        }
        if (!"".equals(insertDiskSpoolBuffer) && insertDiskSpoolBuffer != null) {
            cacheElement.setAttribute("diskSpoolBufferSizeMB",
                insertDiskSpoolBuffer);
        }
        if (!"".equals(insertDiskPersistent) && insertDiskPersistent != null) {
            cacheElement.setAttribute("diskPersistent", insertDiskPersistent);
        }
        if (!"".equals(insertDiskAccess) && insertDiskAccess != null) {
            cacheElement.setAttribute("diskAccessStripes", insertDiskAccess);
        }
        if (!"".equals(insertEternal) && insertEternal != null) {
            cacheElement.setAttribute("eternal", insertEternal);
        }
        if (!"".equals(insertMaxElementsInM) && insertMaxElementsInM != null) {
            cacheElement.setAttribute("maxElementsInMemory",
                insertMaxElementsInM);
        }
        if (!"".equals(insertMemoryStore) && insertMemoryStore != null) {
            cacheElement.setAttribute("memoryStoreEvictionPolicy",
                insertMemoryStore);
        }
        if (!"".equals(insertOverflowToD) && insertOverflowToD != null) {
            cacheElement.setAttribute("overflowToDisk", insertOverflowToD);
        }
        if (!"".equals(insertTimeToIdleS) && insertTimeToIdleS != null) {
            cacheElement.setAttribute("timeToIdleSeconds", insertTimeToIdleS);
        }
        if (!"".equals(insertTimeToLiveS) && insertTimeToLiveS != null) {
            cacheElement.setAttribute("timeToLiveSeconds", insertTimeToLiveS);
        }
        if (!"".equals(insertMaxElements) && insertMaxElements != null) {
            cacheElement.setAttribute("maxElementsOnDisk", insertMaxElements);
        }
        if (!"".equals(insertStatistics) && insertStatistics != null) {
            cacheElement.setAttribute("statistics", insertStatistics);
        }
        if (!"".equals(insertCopyOnR) && insertCopyOnR != null) {
            cacheElement.setAttribute("copyOnRead", insertCopyOnR);
        }
        if (!"".equals(insertCopyOnW) && insertCopyOnW != null) {
            cacheElement.setAttribute("copyOnWrite", insertCopyOnW);
        }
        if (!"".equals(insertLogging) && insertLogging != null) {
            cacheElement.setAttribute("logging", insertLogging);
        }
        rootElement.addContent(cacheElement);

        return configWriter.previewConfigXml(jdoc);
    }

    /**
     * Ehcache 설정 삭제
     * @param EgovOe1SmsEhCacheVO
     *        , Document, Namespace
     * @return void
     * @exception Exception
     */
    public void deleteEhCacheService(EgovOe1SmsEhCacheVO ehCacheVO,
            Document jdoc, Namespace schemaNamespace) throws Exception {

        // Change JDOM Tree cronExpression value
        Element ehCache_root = jdoc.getRootElement();
        Element ehCache_diskStore = ehCache_root.getChild("diskStore");

        List ehCache_element = ehCache_root.getChildren("cache");

        String delEhCacheNm = ehCacheVO.getEhCacheNm();

        for (int i = 0; i < ehCache_element.size(); i++) {
            Element a = (Element) ehCache_element.get(i);

            if (a.getAttributeValue("name").trim().equals(delEhCacheNm.trim())) {
                ehCache_element.remove(a);
                break;
            }
        }

        configWriter.writeConfigXml(jdoc, ehCacheVO.getServiceNm());

    }

    /**
     * 캐시 설정 삭제
     * @param EgovOe1SmsCacheVO
     *        , Document, Namespace
     * @return void
     * @exception Exception
     */
    public void deleteCacheService(EgovOe1SmsCacheVO beanVO, Document jdoc,
            Namespace schemaNamespace) throws Exception {

        // Change JDOM Tree cronExpression value
        Element beans_root = jdoc.getRootElement();
        List beans_element = beans_root.getChildren("bean", schemaNamespace);

        String delBeanNm = beanVO.getBeanNm();

        for (int i = 0; i < beans_element.size(); i++) {
            Element a = (Element) beans_element.get(i);

            if (a.getAttributeValue("id").trim().equals(delBeanNm.trim())) {
                beans_element.remove(a);
                break;
            }
        }

        configWriter.writeConfigXml(jdoc, beanVO.getServiceNm());

    }

    /**
     * 캐시 설정 목로조회
     * @param EgovOe1SmsCacheVO
     *        , Document, Namespace
     * @return List
     * @exception Exception
     */
    public List selectCacheListBean(EgovOe1SmsCacheVO beanVO, Document jdoc)
            throws Exception {
        List<EgovOe1SmsCacheVO> list = new ArrayList<EgovOe1SmsCacheVO>();

        Namespace schemaNamespace = null;
        if (jdoc != null) {
            schemaNamespace =
                Namespace.getNamespace("xsd",
                    "http://www.springframework.org/schema/beans");

            // Change JDOM Tree cronExpression value
            Element beans_root = jdoc.getRootElement();
            List beans_element =
                beans_root.getChildren("bean", schemaNamespace);

            String searchCondition = beanVO.getSearchCondition(); // 0:class명
                                                                  // ,
            // 1:BeanID
            String searchKeyword = beanVO.getSearchKeyword();

            for (int i = 0; i < beans_element.size(); i++) {
                EgovOe1SmsCacheVO bVo = new EgovOe1SmsCacheVO();

                Element bean = (Element) beans_element.get(i);
                String id = bean.getAttributeValue("id");
                String classNm = bean.getAttributeValue("class");

                if (!"".equals(searchKeyword)) {

                    if (searchCondition.equals("0")) { // 0:class명
                        if (classNm.trim().contains(searchKeyword.trim())) {

                            bVo.setBeanNm(id);
                            bVo.setBeanClassNm(classNm);
                            bVo.setBeanCount(i + 1);

                            list.add(bVo);

                        } else if (classNm.trim().equals(searchKeyword.trim())) { // 0:class명
                            // like
                            // 검색
                            bVo.setBeanNm(id);
                            bVo.setBeanClassNm(classNm);
                            bVo.setBeanCount(i + 1);

                            list.add(bVo);
                        }
                    } else if (searchCondition.equals("1")) {
                        if (id.trim().contains(searchKeyword.trim())) {
                            bVo.setBeanNm(id);
                            bVo.setBeanClassNm(classNm);
                            bVo.setBeanCount(i + 1);

                            list.add(bVo);

                        } else if (id.trim().equals(searchKeyword.trim())) { // 1:BeanID
                            // like
                            // 검색
                            bVo.setBeanNm(id);
                            bVo.setBeanClassNm(classNm);
                            bVo.setBeanCount(i + 1);

                            list.add(bVo);
                        }
                    }

                } else { // 검색조건 없을때,

                    bVo.setBeanNm(id);
                    bVo.setBeanClassNm(classNm);
                    bVo.setBeanCount(i + 1);

                    list.add(bVo);
                }
            }

            return list;
        } else {
            return list;
        }
    }

    /**
     * 캐시 설정 상세 조회
     * @param EgovOe1SmsCacheVO
     *        , Document, Namespace
     * @return EgovOe1SmsCacheVO
     * @exception Exception
     */
    public EgovOe1SmsCacheVO selectCacheServiceBean(EgovOe1SmsCacheVO beanVO,
            Document jdoc) throws Exception {

        Namespace schemaNamespace = null;

        schemaNamespace =
            Namespace.getNamespace("xsd",
                "http://www.springframework.org/schema/beans");

        // Change JDOM Tree cronExpression value
        Element beans_root = jdoc.getRootElement();
        List beans_element = beans_root.getChildren("bean", schemaNamespace);

        List<EgovOe1SmsComBeanVO> list = new ArrayList<EgovOe1SmsComBeanVO>();

        String searchBeanNm = beanVO.getBeanNm();
        EgovOe1SmsCacheVO bVo = new EgovOe1SmsCacheVO();

        for (int i = 0; i < beans_element.size(); i++) {

            Element bean = (Element) beans_element.get(i);
            String id = bean.getAttributeValue("id");
            String classNm = bean.getAttributeValue("class");

            if (!"".equals(searchBeanNm)) {

                if (id.trim().equals(searchBeanNm.trim())) {
                    bVo.setBeanNm(id);
                    bVo.setBeanClassNm(classNm);

                    List propertys =
                        bean.getChildren("property", schemaNamespace);

                    for (int p = 0; p < propertys.size(); p++) {

                        Element property = (Element) propertys.get(p);

                        String propName = property.getAttributeValue("name");

                        bVo.setPropertyNm(propName);
                        List subBeans =
                            property.getChildren("bean", schemaNamespace);

                        for (int j = 0; j < subBeans.size(); j++) {
                            Element subBean = (Element) subBeans.get(j);

                            String subBeanClassNm =
                                subBean.getAttributeValue("class");

                            bVo.setSubBeanClassNm(subBeanClassNm);

                            List subProperties =
                                subBean
                                    .getChildren("property", schemaNamespace);
                            for (int h = 0; h < subProperties.size(); h++) {
                                Element subProperty =
                                    (Element) subProperties.get(h);

                                String subPropName =
                                    subProperty.getAttributeValue("name");
                                String subPropValue =
                                    subProperty.getAttributeValue("value");

                                bVo.setSubPropertyNm(subPropName);
                                bVo.setSubPropertyValue(subPropValue);
                            }
                        }

                    }
                    break;
                }

            }
        }
        return bVo;
    }

    /**
     * 캐시 설정 미리보기(상세)
     * @param EgovOe1SmsCacheVO
     *        , Document, Namespace
     * @return String
     * @exception Exception
     */
    public String previewCacheService(EgovOe1SmsCacheVO beanVO, Document jdoc)
            throws Exception {

        Namespace schemaNamespace = null;
        schemaNamespace =
            Namespace.getNamespace("xsd",
                "http://www.springframework.org/schema/beans");

        // Change JDOM Tree cronExpression value
        Element beans_root = jdoc.getRootElement();
        List beans_element = beans_root.getChildren("bean", schemaNamespace);

        List<EgovOe1SmsComBeanVO> list = new ArrayList<EgovOe1SmsComBeanVO>();

        String searchBeanNm = beanVO.getBeanNm();
        String updateSubPropertyValue = beanVO.getSubPropertyValue();

        for (int i = 0; i < beans_element.size(); i++) {

            Element bean = (Element) beans_element.get(i);
            String id = bean.getAttributeValue("id");
            String classNm = bean.getAttributeValue("class");

            if (!"".equals(searchBeanNm)) {

                if (id.trim().equals(searchBeanNm.trim())) {
                    List propertys =
                        bean.getChildren("property", schemaNamespace);

                    for (int p = 0; p < propertys.size(); p++) {

                        Element property = (Element) propertys.get(p);

                        String propName = property.getAttributeValue("name");
                        List subBeans =
                            property.getChildren("bean", schemaNamespace);

                        for (int j = 0; j < subBeans.size(); j++) {
                            Element subBean = (Element) subBeans.get(j);

                            String subBeanClassNm =
                                subBean.getAttributeValue("class");

                            List subProperties =
                                subBean
                                    .getChildren("property", schemaNamespace);
                            for (int h = 0; h < subProperties.size(); h++) {
                                Element subProperty =
                                    (Element) subProperties.get(h);

                                Attribute value =
                                    subProperty.getAttribute("value");
                                value.setValue(updateSubPropertyValue);

                            }
                        }

                    }
                    break;
                }

            }
        }

        return configWriter.previewConfigXml(jdoc);
    }

    /**
     * 캐시 설정 미리보기(상세)
     * @param EgovOe1SmsCacheVO
     *        , Document, Namespace
     * @return String
     * @exception Exception
     */
    public String previewNewCacheService(EgovOe1SmsCacheVO beanVO)
            throws Exception {

        Document jdoc = null;
        Namespace schemaNamespace = null;
        schemaNamespace =
            Namespace.getNamespace("",
                "http://www.springframework.org/schema/beans");

        Element rootElement = new Element("beans", schemaNamespace);
        jdoc = new Document(rootElement);

        String insertBeanNm = beanVO.getBeanNm();
        String insertBeanClassNm = beanVO.getBeanClassNm();
        String insertPropertyNm = beanVO.getPropertyNm();
        String insertSubBeanClassNm = beanVO.getSubBeanClassNm();
        String insertSubPropertyNm = beanVO.getSubPropertyNm();
        String insertSubPropertyValue = beanVO.getSubPropertyValue();

        Element beanElement =
            new Element("bean", Namespace.getNamespace("",
                "http://www.springframework.org/schema/beans"));

        beanElement.setAttribute("id", insertBeanNm);
        beanElement.setAttribute("class", insertBeanClassNm);

        rootElement.addContent(beanElement);
        rootElement.addNamespaceDeclaration(Namespace.getNamespace("xsi",
            "http://www.w3.org/2001/XMLSchema-instance"));
        rootElement
            .addNamespaceDeclaration(Namespace
                .getNamespace(
                    "schemaLocation",
                    "http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-2.5.xsd"));
        Element propElement =
            new Element("property", Namespace.getNamespace("",
                "http://www.springframework.org/schema/beans"));
        propElement.setAttribute("name", insertPropertyNm);
        beanElement.addContent(propElement);

        Element subBeanElement =
            new Element("bean", Namespace.getNamespace("",
                "http://www.springframework.org/schema/beans"));
        subBeanElement.setAttribute("class", insertSubBeanClassNm);
        propElement.addContent(subBeanElement);

        Element subPropElement =
            new Element("property", Namespace.getNamespace("",
                "http://www.springframework.org/schema/beans"));
        subPropElement.setAttribute("name", insertSubPropertyNm);
        subPropElement.setAttribute("value", insertSubPropertyValue);
        subBeanElement.addContent(subPropElement);

        return configWriter.previewConfigXml(jdoc);
    }

    /**
     * 캐시 설정 수정
     * @param EgovOe1SmsCacheVO
     *        , Document, Namespace
     * @return void
     * @exception Exception
     */
    public void updateCacheService(EgovOe1SmsCacheVO beanVO, Document jdoc)
            throws Exception {

        Namespace schemaNamespace = null;
        schemaNamespace =
            Namespace.getNamespace("xsd",
                "http://www.springframework.org/schema/beans");

        // Change JDOM Tree cronExpression value
        Element beans_root = jdoc.getRootElement();
        List beans_element = beans_root.getChildren("bean", schemaNamespace);

        String updateBeanNm = beanVO.getBeanNm();
        String updateSubPropertyValue = beanVO.getSubPropertyValue();

        for (int i = 0; i < beans_element.size(); i++) {

            Element bean = (Element) beans_element.get(i);
            String id = bean.getAttributeValue("id");

            if (!"".equals(updateBeanNm)) {

                if (id.trim().equals(updateBeanNm.trim())) {
                    List propertys =
                        bean.getChildren("property", schemaNamespace);

                    for (int p = 0; p < propertys.size(); p++) {
                        Element property = (Element) propertys.get(p);
                        List subBeans =
                            property.getChildren("bean", schemaNamespace);

                        for (int j = 0; j < subBeans.size(); j++) {
                            Element subBean = (Element) subBeans.get(j);
                            List subProperties =
                                subBean
                                    .getChildren("property", schemaNamespace);

                            for (int h = 0; h < subProperties.size(); h++) {
                                Element subProperty =
                                    (Element) subProperties.get(h);

                                Attribute value =
                                    subProperty.getAttribute("value");
                                value.setValue(updateSubPropertyValue);

                            }
                        }

                    }
                    break;
                }

            }
        }

        configWriter.writeConfigXml(jdoc, beanVO.getServiceNm());
    }

    /**
     * 신규 캐시 빈 설정 등록
     * @param EgovOe1SmsCacheVO
     *        , Document, Namespace
     * @return void
     * @exception Exception
     */
    public void insertNewCacheBean(EgovOe1SmsCacheVO beanVO) throws Exception {

        Document jdoc = null;
        Namespace schemaNamespace = null;
        schemaNamespace =
            Namespace.getNamespace("",
                "http://www.springframework.org/schema/beans");

        Element rootElement = new Element("beans", schemaNamespace);
        jdoc = new Document(rootElement);

        String insertBeanNm = beanVO.getBeanNm();
        String insertBeanClassNm = beanVO.getBeanClassNm();
        String insertPropertyNm = beanVO.getPropertyNm();
        String insertSubBeanClassNm = beanVO.getSubBeanClassNm();
        String insertSubPropertyNm = beanVO.getSubPropertyNm();
        String insertSubPropertyValue = beanVO.getSubPropertyValue();

        Element beanElement =
            new Element("bean", Namespace.getNamespace("",
                "http://www.springframework.org/schema/beans"));

        beanElement.setAttribute("id", insertBeanNm);
        beanElement.setAttribute("class", insertBeanClassNm);

        rootElement.addContent(beanElement);
        rootElement.addNamespaceDeclaration(Namespace.getNamespace("xsi",
            "http://www.w3.org/2001/XMLSchema-instance"));
        rootElement
            .addNamespaceDeclaration(Namespace
                .getNamespace(
                    "schemaLocation",
                    "http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-2.5.xsd"));
        Element propElement =
            new Element("property", Namespace.getNamespace("",
                "http://www.springframework.org/schema/beans"));
        propElement.setAttribute("name", insertPropertyNm);
        beanElement.addContent(propElement);

        Element subBeanElement =
            new Element("bean", Namespace.getNamespace("",
                "http://www.springframework.org/schema/beans"));
        subBeanElement.setAttribute("class", insertSubBeanClassNm);
        propElement.addContent(subBeanElement);

        Element subPropElement =
            new Element("property", Namespace.getNamespace("",
                "http://www.springframework.org/schema/beans"));
        subPropElement.setAttribute("name", insertSubPropertyNm);
        subPropElement.setAttribute("value", insertSubPropertyValue);
        subBeanElement.addContent(subPropElement);

        configWriter.writeConfigXml(jdoc, beanVO.getServiceNm());
    }

    /**
     * 신규 EhCache 서비스 등록
     * @param EgovOe1SmsEhCacheVO
     * @return void
     * @exception Exception
     */
    public void saveNewEhCacheServices(EgovOe1SmsEhCacheVO ehCacheVO)
            throws Exception {

        Document jdoc = null;

        String insertdiskStore = ehCacheVO.getDiskStorePath();
        String insertEhCacheNm = ehCacheVO.getEhCacheNm();
        String insertDiskExpiry =
            ehCacheVO.getDiskExpiryThreadIntervalSeconds();
        String insertDiskSpoolBuffer = ehCacheVO.getDiskSpoolBufferSizeMB();
        String insertDiskPersistent = ehCacheVO.getDiskPersistent();
        String insertDiskAccess = ehCacheVO.getDiskAccessStripes();
        String insertEternal = ehCacheVO.getEternal();
        String insertMaxElementsInM = ehCacheVO.getMaxElementsInMemory();
        String insertMemoryStore = ehCacheVO.getMemoryStoreEvictionPolicy();
        String insertOverflowToD = ehCacheVO.getOverflowToDisk();
        String insertTimeToIdleS = ehCacheVO.getTimeToIdleSeconds();
        String insertTimeToLiveS = ehCacheVO.getTimeToLiveSeconds();
        String insertMaxElements = ehCacheVO.getMaxElementsOnDisk();
        String insertStatistics = ehCacheVO.getStatistics();
        String insertCopyOnR = ehCacheVO.getCopyOnRead();
        String insertCopyOnW = ehCacheVO.getCopyOnWrite();
        String insertLogging = ehCacheVO.getLogging();

        Element rootElement = new Element("ehcache");
        jdoc = new Document(rootElement);

        Element diskElement = new Element("diskStore");
        diskElement.setAttribute("path", insertdiskStore);
        rootElement.addContent(diskElement);

        Element cacheElement = new Element("cache");
        if (!"".equals(insertEhCacheNm) && insertEhCacheNm != null) {
            cacheElement.setAttribute("name", insertEhCacheNm);
        }
        if (!"".equals(insertDiskExpiry) && insertDiskExpiry != null) {
            cacheElement.setAttribute("diskExpiryThreadIntervalSeconds",
                insertDiskExpiry);
        }
        if (!"".equals(insertDiskSpoolBuffer) && insertDiskSpoolBuffer != null) {
            cacheElement.setAttribute("diskSpoolBufferSizeMB",
                insertDiskSpoolBuffer);
        }
        if (!"".equals(insertDiskPersistent) && insertDiskPersistent != null) {
            cacheElement.setAttribute("diskPersistent", insertDiskPersistent);
        }
        if (!"".equals(insertDiskAccess) && insertDiskAccess != null) {
            cacheElement.setAttribute("diskAccessStripes", insertDiskAccess);
        }
        if (!"".equals(insertEternal) && insertEternal != null) {
            cacheElement.setAttribute("eternal", insertEternal);
        }
        if (!"".equals(insertMaxElementsInM) && insertMaxElementsInM != null) {
            cacheElement.setAttribute("maxElementsInMemory",
                insertMaxElementsInM);
        }
        if (!"".equals(insertMemoryStore) && insertMemoryStore != null) {
            cacheElement.setAttribute("memoryStoreEvictionPolicy",
                insertMemoryStore);
        }
        if (!"".equals(insertOverflowToD) && insertOverflowToD != null) {
            cacheElement.setAttribute("overflowToDisk", insertOverflowToD);
        }
        if (!"".equals(insertTimeToIdleS) && insertTimeToIdleS != null) {
            cacheElement.setAttribute("timeToIdleSeconds", insertTimeToIdleS);
        }
        if (!"".equals(insertTimeToLiveS) && insertTimeToLiveS != null) {
            cacheElement.setAttribute("timeToLiveSeconds", insertTimeToLiveS);
        }
        if (!"".equals(insertMaxElements) && insertMaxElements != null) {
            cacheElement.setAttribute("maxElementsOnDisk", insertMaxElements);
        }
        if (!"".equals(insertStatistics) && insertStatistics != null) {
            cacheElement.setAttribute("statistics", insertStatistics);
        }
        if (!"".equals(insertCopyOnR) && insertCopyOnR != null) {
            cacheElement.setAttribute("copyOnRead", insertCopyOnR);
        }
        if (!"".equals(insertCopyOnW) && insertCopyOnW != null) {
            cacheElement.setAttribute("copyOnWrite", insertCopyOnW);
        }
        if (!"".equals(insertLogging) && insertLogging != null) {
            cacheElement.setAttribute("logging", insertLogging);
        }
        rootElement.addContent(cacheElement);

        configWriter.writeConfigXml(jdoc, ehCacheVO.getServiceNm());
    }

    /**
     * 신규 EhCache 등록
     * @param EgovOe1SmsEhCacheVO
     *        ,Document,Namespace
     * @return void
     * @exception Exception
     */
    public int saveNewEhCache(EgovOe1SmsEhCacheVO ehCacheVO, Document jdoc,
            Namespace schemaNamespace) throws Exception {
        
        Element cache_root = jdoc.getRootElement();
        List cache_element = cache_root.getChildren("cache", schemaNamespace);
        String insertEhCacheNm = ehCacheVO.getEhCacheNm();
        
        // String insertEhCacheDisk =
        // ehCacheVO.getDiskStorePath();
        for (int J = 0; J < cache_element.size(); J++) {

            Element checkBean = (Element) cache_element.get(J);
            String checkId = checkBean.getAttributeValue("name");
            
            if(checkId != null && insertEhCacheNm != null){
                if (checkId.trim().equals(insertEhCacheNm.trim())) {
                    return 1;
                }
            }
        }
        
        String insertDiskExpiry =
            ehCacheVO.getDiskExpiryThreadIntervalSeconds();
        String insertDiskSpoolBuffer = ehCacheVO.getDiskSpoolBufferSizeMB();
        String insertDiskPersistent = ehCacheVO.getDiskPersistent();
        String insertDiskAccess = ehCacheVO.getDiskAccessStripes();
        String insertEternal = ehCacheVO.getEternal();
        String insertMaxElementsInM = ehCacheVO.getMaxElementsInMemory();
        String insertMemoryStore = ehCacheVO.getMemoryStoreEvictionPolicy();
        String insertOverflowToD = ehCacheVO.getOverflowToDisk();
        String insertTimeToIdleS = ehCacheVO.getTimeToIdleSeconds();
        String insertTimeToLiveS = ehCacheVO.getTimeToLiveSeconds();
        String insertMaxElements = ehCacheVO.getMaxElementsOnDisk();
        String insertStatistics = ehCacheVO.getStatistics();
        String insertCopyOnR = ehCacheVO.getCopyOnRead();
        String insertCopyOnW = ehCacheVO.getCopyOnWrite();
        String insertLogging = ehCacheVO.getLogging();

        

        Element cacheElement = new Element("cache");

        if (!"".equals(insertEhCacheNm) && insertEhCacheNm != null) {
            cacheElement.setAttribute("name", insertEhCacheNm);
        }
        if (!"".equals(insertDiskExpiry) && insertDiskExpiry != null) {
            cacheElement.setAttribute("diskExpiryThreadIntervalSeconds",
                insertDiskExpiry);
        }
        if (!"".equals(insertDiskSpoolBuffer) && insertDiskSpoolBuffer != null) {
            cacheElement.setAttribute("diskSpoolBufferSizeMB",
                insertDiskSpoolBuffer);
        }
        if (!"".equals(insertDiskPersistent) && insertDiskPersistent != null) {
            cacheElement.setAttribute("diskPersistent", insertDiskPersistent);
        }
        if (!"".equals(insertDiskAccess) && insertDiskAccess != null) {
            cacheElement.setAttribute("diskAccessStripes", insertDiskAccess);
        }
        if (!"".equals(insertEternal) && insertEternal != null) {
            cacheElement.setAttribute("eternal", insertEternal);
        }
        if (!"".equals(insertMaxElementsInM) && insertMaxElementsInM != null) {
            cacheElement.setAttribute("maxElementsInMemory",
                insertMaxElementsInM);
        }
        if (!"".equals(insertMemoryStore) && insertMemoryStore != null) {
            cacheElement.setAttribute("memoryStoreEvictionPolicy",
                insertMemoryStore);
        }
        if (!"".equals(insertOverflowToD) && insertOverflowToD != null) {
            cacheElement.setAttribute("overflowToDisk", insertOverflowToD);
        }
        if (!"".equals(insertTimeToIdleS) && insertTimeToIdleS != null) {
            cacheElement.setAttribute("timeToIdleSeconds", insertTimeToIdleS);
        }
        if (!"".equals(insertTimeToLiveS) && insertTimeToLiveS != null) {
            cacheElement.setAttribute("timeToLiveSeconds", insertTimeToLiveS);
        }
        if (!"".equals(insertMaxElements) && insertMaxElements != null) {
            cacheElement.setAttribute("maxElementsOnDisk", insertMaxElements);
        }
        if (!"".equals(insertStatistics) && insertStatistics != null) {
            cacheElement.setAttribute("statistics", insertStatistics);
        }
        if (!"".equals(insertCopyOnR) && insertCopyOnR != null) {
            cacheElement.setAttribute("copyOnRead", insertCopyOnR);
        }
        if (!"".equals(insertCopyOnW) && insertCopyOnW != null) {
            cacheElement.setAttribute("copyOnWrite", insertCopyOnW);
        }
        if (!"".equals(insertLogging) && insertLogging != null) {
            cacheElement.setAttribute("logging", insertLogging);
        }
        cache_root.addContent(cacheElement);

        configWriter.writeConfigXml(jdoc, ehCacheVO.getServiceNm());
        return 0;
    }

}
