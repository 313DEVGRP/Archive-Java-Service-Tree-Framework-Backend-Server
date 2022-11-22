/*
 * @author Dongmin.lee
 * @since 2022-11-04
 * @version 22.11.04
 * @see <pre>
 *  Copyright (C) 2007 by 313 DEV GRP, Inc - All Rights Reserved
 *  Unauthorized copying of this file, via any medium is strictly prohibited
 *  Proprietary and confidential
 *  Written by 313 developer group <313@313.co.kr>, December 2010
 * </pre>
 */
package egovframework.api.arms.module_filerepository.service;

import egovframework.com.ext.jstree.springHibernate.core.dao.JsTreeHibernateDao;
import egovframework.com.ext.jstree.springHibernate.core.service.JsTreeHibernateServiceImpl;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service("fileRepository")
public class FileRepositoryImpl extends JsTreeHibernateServiceImpl implements FileRepository{

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @SuppressWarnings("rawtypes")
    @Resource(name = "jsTreeHibernateDao")
    private JsTreeHibernateDao jsTreeHibernateDao;

    @SuppressWarnings("unchecked")
    @Override
    @Transactional(rollbackFor = { Exception.class }, isolation = Isolation.SERIALIZABLE, propagation = Propagation.REQUIRED)
    public <T extends JsTreeHibernateSearchDTO> T addNodeWithRef(T jsTreeHibernateDTO) throws Exception {

        jsTreeHibernateDao.setClazz(jsTreeHibernateDTO.getClass());
        if (jsTreeHibernateDTO.getRef() < 0) {
            throw new RuntimeException("ref is minus");
        } else {
            T nodeByRef = (T) jsTreeHibernateDao.getUnique(jsTreeHibernateDTO.getRef());

            if ("default".equals(nodeByRef.getC_type())) {
                throw new RuntimeException("nodeByRef is default Type");
            }

            nodeByRef.setWhere("c_parentid", nodeByRef.getC_id());
            final long lastPosiotionOfNodeByRef = jsTreeHibernateDao.getCount(nodeByRef);

            jsTreeHibernateDTO.setC_position(lastPosiotionOfNodeByRef);

            long rightPointFromNodeByRef = nodeByRef.getC_right();
            rightPointFromNodeByRef = Math.max(rightPointFromNodeByRef, 1);

            long spaceOfTargetNode = 2;

            this.stretchLeftRightForMyselfFromJstree(spaceOfTargetNode, rightPointFromNodeByRef,
                    jsTreeHibernateDTO.getCopy(), null, jsTreeHibernateDTO);

            long targetNodeLevel = jsTreeHibernateDTO.getRef() == 0 ? 0 : nodeByRef.getC_level() + 1;

            jsTreeHibernateDTO.setC_parentid(jsTreeHibernateDTO.getRef());
            jsTreeHibernateDTO.setC_left(rightPointFromNodeByRef);
            jsTreeHibernateDTO.setC_right(rightPointFromNodeByRef + 1);
            jsTreeHibernateDTO.setC_level(targetNodeLevel);

            long insertSeqResult = (long) jsTreeHibernateDao.insert(jsTreeHibernateDTO);
            if (insertSeqResult > 0) {
                final long SUCCESS = 1;
                jsTreeHibernateDTO.setStatus(SUCCESS);
                jsTreeHibernateDTO.setId(insertSeqResult);
            } else {
                throw new RuntimeException("심각한 오류 발생 - 삽입 노드");
            }
        }
        return jsTreeHibernateDTO;
    }

}