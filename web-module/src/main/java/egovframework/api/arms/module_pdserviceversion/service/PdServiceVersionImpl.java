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
import egovframework.com.ext.jstree.springHibernate.core.dao.JsTreeHibernateDao;
import egovframework.com.ext.jstree.springHibernate.core.service.JsTreeHibernateServiceImpl;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;
import org.hibernate.criterion.Order;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;
import org.unitils.util.ReflectionUtils;

import javax.annotation.Resource;
import java.lang.reflect.Field;
import java.util.List;

@Service("pdServiceVersion")
public class PdServiceVersionImpl extends JsTreeHibernateServiceImpl implements PdServiceVersion{

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

}