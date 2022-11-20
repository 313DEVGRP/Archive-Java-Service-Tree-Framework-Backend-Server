/*
 * @author Dongmin.lee
 * @since 2022-11-09
 * @version 22.11.09
 * @see <pre>
 *  Copyright (C) 2007 by 313 DEV GRP, Inc - All Rights Reserved
 *  Unauthorized copying of this file, via any medium is strictly prohibited
 *  Proprietary and confidential
 *  Written by 313 developer group <313@313.co.kr>, December 2010
 * </pre>
 */
package egovframework.api.arms.module_reqadd.service;

import egovframework.com.ext.jstree.springHibernate.core.service.JsTreeHibernateService;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;

import javax.servlet.http.HttpServletRequest;

public interface ReqAdd extends JsTreeHibernateService {

    public <T extends JsTreeHibernateSearchDTO> T addNodeToSwitchTable(T jsTreeHibernateDTO, T refNode) throws Exception;

    public <T extends JsTreeHibernateSearchDTO> T moveNodeToSwitchTable(T jsTreeHibernateDTO, T refNode , HttpServletRequest request) throws Exception;

}