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

import org.springframework.stereotype.Service;

/**
 * 캐시 관리를 위한 service 클래스
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
@Service("cacheMgtService")
public class EgovOe1SmsCacheMgtService {

    /**
     * 캐시 입력 등록 템플릿 생성
     * @param EgovOe1SmsCacheMgtVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    public String insertCacheMgtRegist(EgovOe1SmsCacheMgtVO mgtVo) {

        String cacheNm = mgtVo.getCacheNm();
        String beanId = mgtVo.getBeanId();

        StringBuffer codebf = new StringBuffer();
        codebf.append("@Resouce(name=\"");
        codebf.append(beanId + "\")" + "</br>");
        codebf.append("Ehcache gCache;" + "</br></br>");
        codebf.append("Ehcache cache = gCache.getCacheManager().getCache(\"");
        codebf.append(cacheNm + "\");" + "</br></br>");

        if (mgtVo.getCacheKey() != null && mgtVo.getCacheKey().length > 0) {
            for (int i = 0; i < mgtVo.getCacheKey().length; i++) {
                codebf.append("cache.put(new Element(\""
                    + mgtVo.getCacheKey()[i] + "\"" + ",\""
                    + mgtVo.getCacheValue()[i] + "\"));</br>");
            }
        }

        return codebf.toString();
    }

    /**
     * 캐시 삭제 템플릿 생성
     * @param EgovOe1SmsCacheMgtVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    public String deleteCacheMgt(EgovOe1SmsCacheMgtVO mgtVo) {

        String cacheNm = mgtVo.getCacheNm();
        String beanId = mgtVo.getBeanId();
        Boolean removeAllGbn = mgtVo.getRemoveAllGbn();

        StringBuffer codebf = new StringBuffer();
        codebf.append("@Resouce(name=\"");
        codebf.append(beanId + "\")" + "</br>");
        codebf.append("Ehcache gCache;" + "</br></br>");
        codebf.append("Ehcache cache = gCache.getCacheManager().getCache(\"");
        codebf.append(cacheNm + "\");" + "</br></br>");

        if (removeAllGbn) {
            codebf.append("cache.removeAll();</br>");
        } else {
            if (mgtVo.getCacheKey() != null && mgtVo.getCacheKey().length > 0) {
                for (int i = 0; i < mgtVo.getCacheKey().length; i++) {

                    codebf.append("cache.remove(\"" + mgtVo.getCacheKey()[i]
                        + "\"" + ");</br>");
                }
            }
        }

        return codebf.toString();
    }

    /**
     * 캐시 조회 템플릿 생성
     * @param EgovOe1SmsCacheMgtVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    public String selectCacheMgt(EgovOe1SmsCacheMgtVO mgtVo) {

        String cacheNm = mgtVo.getCacheNm();
        String beanId = mgtVo.getBeanId();

        StringBuffer codebf = new StringBuffer();
        codebf.append("@Resouce(name=\"");
        codebf.append(beanId + "\")" + "</br>");
        codebf.append("Ehcache gCache;" + "</br></br>");
        codebf.append("Ehcache cache = gCache.getCacheManager().getCache(\"");
        codebf.append(cacheNm + "\");" + "</br></br>");

        if (mgtVo.getCacheKey() != null && mgtVo.getCacheKey().length > 0) {
            for (int i = 0; i < mgtVo.getCacheKey().length; i++) {
                codebf.append("Element value" + i + " = cache.get(\""
                    + mgtVo.getCacheKey()[i] + "\"" + ");</br>");
            }
        }

        return codebf.toString();
    }

    /**
     * 캐시 리로드 템플릿 생성
     * @param EgovOe1SmsCacheMgtVO
     *        , ModelMap
     * @return String
     * @exception Exception
     */
    public String reloadCacheMgt(EgovOe1SmsCacheMgtVO mgtVo) {

        String cacheNm = mgtVo.getCacheNm();
        String beanId = mgtVo.getBeanId();

        StringBuffer codebf = new StringBuffer();
        codebf.append("@Resouce(name=\"");
        codebf.append(beanId + "\")" + "</br>");
        codebf.append("Ehcache gCache;" + "</br></br>");
        codebf.append("Ehcache cache = gCache.getCacheManager().getCache(\"");
        codebf.append(cacheNm + "\");" + "</br></br>");

        codebf.append("cache.flush();</br>");

        return codebf.toString();
    }
}
