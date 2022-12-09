/*
 * @author Dongmin.lee
 * @since 2022-12-03
 * @version 22.12.03
 * @see <pre>
 *  Copyright (C) 2007 by 313 DEV GRP, Inc - All Rights Reserved
 *  Unauthorized copying of this file, via any medium is strictly prohibited
 *  Proprietary and confidential
 *  Written by 313 developer group <313@313.co.kr>, December 2010
 * </pre>
 */
package egovframework.api.arms.module_reqstatus.service;

import egovframework.com.ext.jstree.springHibernate.core.service.JsTreeHibernateService;

import java.util.List;

public interface ReqStatus extends JsTreeHibernateService {

    public void putJiraIssue(String reqStatusTableName) throws Exception;
    public void updateJiraIssueCrawl(String reqStatusTableName) throws Exception;

    public List<Long> disableJiraIssue(String reqStatusTableName) throws Exception;

}