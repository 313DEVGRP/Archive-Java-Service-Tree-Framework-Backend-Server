/*
 * @author Dongmin.lee
 * @since 2022-11-20
 * @version 22.11.20
 * @see <pre>
 *  Copyright (C) 2007 by 313 DEV GRP, Inc - All Rights Reserved
 *  Unauthorized copying of this file, via any medium is strictly prohibited
 *  Proprietary and confidential
 *  Written by 313 developer group <313@313.co.kr>, December 2010
 * </pre>
 */
package egovframework.api.arms.module_pdserviceversion.service;

import egovframework.api.arms.module_pdserviceversion.model.PdServiceVersionDTO;
import egovframework.com.ext.jstree.springHibernate.core.service.JsTreeHibernateService;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;

import java.util.List;

public interface PdServiceVersion extends JsTreeHibernateService {

    public <T extends JsTreeHibernateSearchDTO> List<T> getVersion(T jsTreeHibernateDTO) throws Exception;
    public <T extends PdServiceVersionDTO> int updateVersionNode(T jsTreeHibernateDTO) throws Exception;

}