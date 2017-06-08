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
package egovframework.oe1.sms.cachemgt.service;

public class EgovOe1SmsCacheMgtVO {
    private String beanId; // 빈 아이디
    private String cacheNm; // 캐시 명
    private String[] cacheKey; // 캐시 키
    private String[] cacheValue; // 캐시 값
    private boolean removeAllGbn; // 모두 삭제 구분자

    /**
     * 모두 삭제 구분자 Getter 메소드
     * @return String
     */
    public boolean getRemoveAllGbn() {
        return removeAllGbn;
    }

    /**
     * 모두 삭제 구분자 setter 메소드
     * @return void
     */
    public void setRemoveAllGbn(boolean removeAllGbn) {
        this.removeAllGbn = removeAllGbn;
    }

    /**
     * 빈아이디 Getter 메소드
     * @return String
     */
    public String getBeanId() {
        return beanId;
    }

    /**
     * 빈아이디 setter 메소드
     * @return void
     */
    public void setBeanId(String beanId) {
        this.beanId = beanId;
    }

    /**
     * 캐시 명 Getter 메소드
     * @return String
     */
    public String getCacheNm() {
        return cacheNm;
    }

    /**
     * 캐시 명 setter 메소드
     * @return void
     */
    public void setCacheNm(String cacheNm) {
        this.cacheNm = cacheNm;
    }

    /**
     * 캐시 키 Getter 메소드
     * @return String[]
     */
    public String[] getCacheKey() {
        return cacheKey;
    }

    /**
     * 캐시 키 구분자 setter 메소드
     * @return void
     */
    public void setCacheKey(String[] cacheKey) {
        this.cacheKey = cacheKey;
    }

    /**
     * 캐시 값 Getter 메소드
     * @return String[]
     */
    public String[] getCacheValue() {
        return cacheValue;
    }

    /**
     * 캐시 값 setter 메소드
     * @return void
     */
    public void setCacheValue(String[] cacheValue) {
        this.cacheValue = cacheValue;
    }

}
