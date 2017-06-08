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

import egovframework.oe1.sms.com.service.EgovOe1SmsComDefaultVO;

/**
 * Eh 캐시 설정 관리를 위한 VO 클래스
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
public class EgovOe1SmsEhCacheVO extends EgovOe1SmsComDefaultVO {
    private String ehCacheNm; // EH 캐시 명
    private String defaultCache; // 디폴트 캐시
    private String diskStorePath; // 디스크 저장 위치
    private int ehCacheCount; // EH 캐시 값
    private String serviceNm; // 서비스 명

    private String diskExpiryThreadIntervalSeconds; // 어트리뷰트
                                                    // diskExpiryThreadIntervalSeconds
    private String diskSpoolBufferSizeMB; // 어트리뷰트
                                          // diskSpoolBufferSizeMB
    private String diskPersistent; // 어트리뷰트
                                   // diskPersistent
    private String diskAccessStripes; // 어트리뷰트
                                      // diskAccessStripes
    private String eternal; // 어트리뷰트 eternal
    private String maxElementsInMemory; // 어트리뷰트
                                        // maxElementsInMemory
    private String memoryStoreEvictionPolicy; // 어트리뷰트
                                              // memoryStoreEvictionPolicy
    private String overflowToDisk; // 어트리뷰트
                                   // overflowToDisk
    private String timeToIdleSeconds; // 어트리뷰트
                                      // timeToIdleSeconds
    private String timeToLiveSeconds; // 어트리뷰트
                                      // timeToLiveSeconds
    private String maxElementsOnDisk; // 어트리뷰트
                                      // maxElementsOnDisk
    private String statistics; // 어트리뷰트 statistics
    private String copyOnRead; // 어트리뷰트 copyOnRead
    private String copyOnWrite; // 어트리뷰트 copyOnWrite
    private String logging; // 어트리뷰트 logging

    private String[] attributeValue; // EH 캐시 명 배열
    private String[] attributeNm; // EH 캐시 값 배열

    /**
     * 디포트 캐시 명 Getter 메소드
     * @return String
     */
    public String getDefaultCache() {
        return defaultCache;
    }

    /**
     * 디포트 캐시 명 setter 메소드
     * @return void
     */
    public void setDefaultCache(String defaultCache) {
        this.defaultCache = defaultCache;
    }

    /**
     * 어트리뷰트 diskExpiryThreadIntervalSeconds Getter 메소드
     * @return String
     */
    public String getDiskExpiryThreadIntervalSeconds() {
        return diskExpiryThreadIntervalSeconds;
    }

    /**
     * 어트리뷰트 diskExpiryThreadIntervalSeconds setter 메소드
     * @return String
     */
    public void setDiskExpiryThreadIntervalSeconds(
            String diskExpiryThreadIntervalSeconds) {
        this.diskExpiryThreadIntervalSeconds = diskExpiryThreadIntervalSeconds;
    }

    /**
     * 어트리뷰트 diskSpoolBufferSizeMB Getter 메소드
     * @return String
     */
    public String getDiskSpoolBufferSizeMB() {
        return diskSpoolBufferSizeMB;
    }

    /**
     * 어트리뷰트 diskSpoolBufferSizeMB setter 메소드
     * @return String
     */
    public void setDiskSpoolBufferSizeMB(String diskSpoolBufferSizeMB) {
        this.diskSpoolBufferSizeMB = diskSpoolBufferSizeMB;
    }

    /**
     * 어트리뷰트 diskPersistent Getter 메소드
     * @return String
     */
    public String getDiskPersistent() {
        return diskPersistent;
    }

    /**
     * 어트리뷰트 diskPersistent setter 메소드
     * @return void
     */
    public void setDiskPersistent(String diskPersistent) {
        this.diskPersistent = diskPersistent;
    }

    /**
     * 어트리뷰트 diskAccessStripes Getter 메소드
     * @return String
     */
    public String getDiskAccessStripes() {
        return diskAccessStripes;
    }

    /**
     * 어트리뷰트 diskAccessStripes setter 메소드
     * @return void
     */
    public void setDiskAccessStripes(String diskAccessStripes) {
        this.diskAccessStripes = diskAccessStripes;
    }

    /**
     * 어트리뷰트 eternal Getter 메소드
     * @return String
     */
    public String getEternal() {
        return eternal;
    }

    /**
     * 어트리뷰트 eternal setter 메소드
     * @return void
     */
    public void setEternal(String eternal) {
        this.eternal = eternal;
    }

    /**
     * 어트리뷰트 maxElementsInMemory Getter 메소드
     * @return String
     */
    public String getMaxElementsInMemory() {
        return maxElementsInMemory;
    }

    /**
     * 어트리뷰트 maxElementsInMemory setter 메소드
     * @return void
     */
    public void setMaxElementsInMemory(String maxElementsInMemory) {
        this.maxElementsInMemory = maxElementsInMemory;
    }

    /**
     * 어트리뷰트 memoryStoreEvictionPolicy Getter 메소드
     * @return String
     */
    public String getMemoryStoreEvictionPolicy() {
        return memoryStoreEvictionPolicy;
    }

    /**
     * 어트리뷰트 memoryStoreEvictionPolicy setter 메소드
     * @return void
     */
    public void setMemoryStoreEvictionPolicy(String memoryStoreEvictionPolicy) {
        this.memoryStoreEvictionPolicy = memoryStoreEvictionPolicy;
    }

    /**
     * 어트리뷰트 overflowToDisk Getter 메소드
     * @return String
     */
    public String getOverflowToDisk() {
        return overflowToDisk;
    }

    /**
     * 어트리뷰트 overflowToDisk setter 메소드
     * @return void
     */
    public void setOverflowToDisk(String overflowToDisk) {
        this.overflowToDisk = overflowToDisk;
    }

    /**
     * 어트리뷰트 timeToIdleSeconds Getter 메소드
     * @return String
     */
    public String getTimeToIdleSeconds() {
        return timeToIdleSeconds;
    }

    /**
     * 어트리뷰트 timeToIdleSeconds setter 메소드
     * @return void
     */
    public void setTimeToIdleSeconds(String timeToIdleSeconds) {
        this.timeToIdleSeconds = timeToIdleSeconds;
    }

    /**
     * 어트리뷰트 timeToLiveSeconds Getter 메소드
     * @return String
     */
    public String getTimeToLiveSeconds() {
        return timeToLiveSeconds;
    }

    /**
     * 어트리뷰트 timeToLiveSeconds setter 메소드
     * @return void
     */
    public void setTimeToLiveSeconds(String timeToLiveSeconds) {
        this.timeToLiveSeconds = timeToLiveSeconds;
    }

    /**
     * 어트리뷰트 maxElementsOnDisk Getter 메소드
     * @return String
     */
    public String getMaxElementsOnDisk() {
        return maxElementsOnDisk;
    }

    /**
     * 어트리뷰트 maxElementsOnDisk setter 메소드
     * @return String
     */
    public void setMaxElementsOnDisk(String maxElementsOnDisk) {
        this.maxElementsOnDisk = maxElementsOnDisk;
    }

    /**
     * 어트리뷰트 statistics Getter 메소드
     * @return String
     */
    public String getStatistics() {
        return statistics;
    }

    /**
     * 어트리뷰트 statistics setter 메소드
     * @return String
     */
    public void setStatistics(String statistics) {
        this.statistics = statistics;
    }

    /**
     * 어트리뷰트 copyOnRead Getter 메소드
     * @return String
     */
    public String getCopyOnRead() {
        return copyOnRead;
    }

    /**
     * 어트리뷰트 copyOnRead setter 메소드
     * @return void
     */
    public void setCopyOnRead(String copyOnRead) {
        this.copyOnRead = copyOnRead;
    }

    /**
     * 어트리뷰트 copyOnWrite Getter 메소드
     * @return String
     */
    public String getCopyOnWrite() {
        return copyOnWrite;
    }

    /**
     * 어트리뷰트 copyOnWrite setter 메소드
     * @return void
     */
    public void setCopyOnWrite(String copyOnWrite) {
        this.copyOnWrite = copyOnWrite;
    }

    /**
     * 어트리뷰트 logging Getter 메소드
     * @return String
     */
    public String getLogging() {
        return logging;
    }

    /**
     * 어트리뷰트 logging setter 메소드
     * @return void
     */
    public void setLogging(String logging) {
        this.logging = logging;
    }

    /**
     * 어트리뷰트 값 Getter 메소드
     * @return String[]
     */
    public String[] getAttributeValue() {
        return attributeValue;
    }

    /**
     * 어트리뷰트 값 setter 메소드
     * @return void
     */
    public void setAttributeValue(String[] attributeValue) {
        this.attributeValue = attributeValue;
    }

    /**
     * 어트리뷰트 명 Getter 메소드
     * @return String[]
     */
    public String[] getAttributeNm() {
        return attributeNm;
    }

    /**
     * 어트리뷰트 명 setter 메소드
     * @return void
     */
    public void setAttributeNm(String[] attributeNm) {
        this.attributeNm = attributeNm;
    }

    /**
     * EH 캐시 명 Getter 메소드
     * @return String
     */
    public String getEhCacheNm() {
        return ehCacheNm;
    }

    /**
     * EH 캐시 명 setter 메소드
     * @return void
     */
    public void setEhCacheNm(String ehCacheNm) {
        this.ehCacheNm = ehCacheNm;
    }

    /**
     * 디스크 저장 위치 Getter 메소드
     * @return String
     */
    public String getDiskStorePath() {
        return diskStorePath;
    }

    /**
     * 디스크 저장 위치 setter 메소드
     * @return void
     */
    public void setDiskStorePath(String diskStorePath) {
        this.diskStorePath = diskStorePath;
    }

    /**
     * EH 캐시 갯수 Getter 메소드
     * @return int
     */
    public int getEhCacheCount() {
        return ehCacheCount;
    }

    /**
     * EH 캐시 갯수 setter 메소드
     * @return void
     */
    public void setEhCacheCount(int ehCacheCount) {
        this.ehCacheCount = ehCacheCount;
    }

    /**
     * 서비스 명 Getter 메소드
     * @return String
     */
    public String getServiceNm() {
        return serviceNm;
    }

    /**
     * 서비스 명 setter 메소드
     * @return void
     */
    public void setServiceNm(String serviceNm) {
        this.serviceNm = serviceNm;
    }

}
