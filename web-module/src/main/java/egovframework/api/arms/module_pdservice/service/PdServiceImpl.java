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
package egovframework.api.arms.module_pdservice.service;

import egovframework.com.ext.jstree.springHibernate.core.service.JsTreeHibernateServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service("pdService")
public class PdServiceImpl extends JsTreeHibernateServiceImpl implements PdService{

    private final Logger logger = LoggerFactory.getLogger(this.getClass());


}