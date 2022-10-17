/*
 * @author Dongmin.lee
 * @since 2022-06-17
 * @version 22.06.17
 * @see <pre>
 *  Copyright (C) 2007 by 313 DEV GRP, Inc - All Rights Reserved
 *  Unauthorized copying of this file, via any medium is strictly prohibited
 *  Proprietary and confidential
 *  Written by 313 developer group <313@313.co.kr>, December 2010
 * </pre>
 */
package egovframework.api.arms.module_pdversion.service;

import egovframework.api.arms.module_pdversion.model.PdVersionDTO;
import egovframework.com.ext.jstree.springHibernate.core.service.JsTreeHibernateService;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;

import java.util.List;

public interface PdVersion extends JsTreeHibernateService {

    public <T extends JsTreeHibernateSearchDTO> List<T> getVersion(T jsTreeHibernateDTO) throws Exception;
    public <T extends PdVersionDTO> int updateVersionNode(T jsTreeHibernateDTO) throws Exception;

}