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

import egovframework.api.arms.module_pdservice.model.PdServiceDTO;
import egovframework.com.ext.jstree.springHibernate.core.dao.JsTreeHibernateDao;
import egovframework.com.ext.jstree.springHibernate.core.service.JsTreeHibernateServiceImpl;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;

import javax.annotation.Resource;
import java.lang.reflect.Field;

@Service("pdService")
public class PdServiceImpl extends JsTreeHibernateServiceImpl implements PdService{

    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Resource(
            name = "jsTreeHibernateDao"
    )
    private JsTreeHibernateDao jsTreeHibernateDao;

    @SuppressWarnings("unchecked")
    @Transactional(rollbackFor = { Exception.class }, propagation = Propagation.REQUIRED)
    public <T extends PdServiceDTO> int updateContentsNode(T jsTreeHibernateDTO) throws Exception {

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