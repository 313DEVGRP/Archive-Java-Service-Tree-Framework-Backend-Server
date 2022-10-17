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

import egovframework.api.arms.module_pdservice.model.PdServiceDTO;
import egovframework.api.arms.module_pdversion.model.PdVersionDTO;
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

import javax.annotation.Resource;
import java.lang.reflect.Field;
import java.util.List;

@Service("pdVersion")
public class PdVersionImpl extends JsTreeHibernateServiceImpl implements PdVersion{

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @SuppressWarnings("rawtypes")
    @Resource(name = "jsTreeHibernateDao")
    private JsTreeHibernateDao jsTreeHibernateDao;

    @Override
    public <T extends JsTreeHibernateSearchDTO> List<T> getVersion(T jsTreeHibernateDTO) throws Exception {
        jsTreeHibernateDao.setClazz(jsTreeHibernateDTO.getClass());
        jsTreeHibernateDTO.setOrder(Order.asc("c_left"));
        jsTreeHibernateDTO.setWhere("c_pdservice_link", jsTreeHibernateDTO.getC_id().toString());
        List<T> list = jsTreeHibernateDao.getList(jsTreeHibernateDTO);
        return list;
    }


    @SuppressWarnings("unchecked")
    @Transactional(rollbackFor = { Exception.class }, propagation = Propagation.REQUIRED)
    public <T extends PdVersionDTO> int updateVersionNode(T jsTreeHibernateDTO) throws Exception {

        jsTreeHibernateDao.setClazz(jsTreeHibernateDTO.getClass());
        T alterTargetNode = (T) jsTreeHibernateDao.getUnique(jsTreeHibernateDTO.getC_id());

        for (Field field : jsTreeHibernateDTO.getClass().getDeclaredFields()) {

            field.setAccessible(true);

            Object value = field.get(jsTreeHibernateDTO);

            if (!ObjectUtils.isEmpty(value)) {
                field.setAccessible(true);
                field.set(alterTargetNode, value);
            }

        }
        jsTreeHibernateDao.update(alterTargetNode);


        return 1;

    }
}