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

import egovframework.com.ext.jstree.springHibernate.core.dao.JsTreeHibernateDao;
import egovframework.com.ext.jstree.springHibernate.core.service.JsTreeHibernateServiceImpl;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;
import org.apache.commons.collections15.CollectionUtils;
import org.apache.commons.collections15.Transformer;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Collection;
import java.util.List;

@Service("reqAdd")
public class ReqAddImpl extends JsTreeHibernateServiceImpl implements ReqAdd{

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @SuppressWarnings("rawtypes")
    @Resource(name = "jsTreeHibernateDao")
    private JsTreeHibernateDao jsTreeHibernateDao;

    @Override
    @Transactional(rollbackFor = { Exception.class }, propagation = Propagation.REQUIRED)
    public <T extends JsTreeHibernateSearchDTO> T addNodeToSwitchTable(T jsTreeHibernateDTO, T refNode) throws Exception {
        jsTreeHibernateDao.setClazz(jsTreeHibernateDTO.getClass());
        if (jsTreeHibernateDTO.getRef() < 0) {
            throw new RuntimeException("ref is minus");
        } else {
            //T nodeByRef = (T) jsTreeHibernateDao.getUnique(jsTreeHibernateDTO.getRef());

            if ("default".equals(refNode.getC_type())) {
                throw new RuntimeException("nodeByRef is default Type");
            }

            refNode.setWhere("c_parentid", refNode.getC_id());
            final long lastPosiotionOfNodeByRef = jsTreeHibernateDao.getCount(refNode);

            jsTreeHibernateDTO.setC_position(lastPosiotionOfNodeByRef);

            long rightPointFromNodeByRef = refNode.getC_right();
            rightPointFromNodeByRef = Math.max(rightPointFromNodeByRef, 1);

            long spaceOfTargetNode = 2;

            super.stretchLeftRightForMyselfFromJstree(spaceOfTargetNode, rightPointFromNodeByRef,
                    jsTreeHibernateDTO.getCopy(), null, jsTreeHibernateDTO);

            long targetNodeLevel = jsTreeHibernateDTO.getRef() == 0 ? 0 : refNode.getC_level() + 1;

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

    @Override
    @Transactional(rollbackFor = { Exception.class }, propagation = Propagation.REQUIRED)
    public <T extends JsTreeHibernateSearchDTO> T moveNodeToSwitchTable(T jsTreeHibernateDTO, T refNode, HttpServletRequest request) throws Exception {
        jsTreeHibernateDao.setClazz(jsTreeHibernateDTO.getClass());

        logger.debug("***********************MoveNode***********************");
        logger.debug("-----------------------getNode 완료-----------------------");

        T nodeById = getNode(jsTreeHibernateDTO);
        if (nodeById == null) {
            throw new RuntimeException("nodeById is null");
        }
        Long nodeByIdLeft = nodeById.getC_left();

        logger.debug("-----------------------getChildNodeByLeftRight 완료-----------------------");
        DetachedCriteria getChildNodeByLeftRightCriteria = DetachedCriteria.forClass(jsTreeHibernateDTO.getClass());
        Criterion whereChildNodeByLeftRight = Restrictions.ge("c_left", nodeById.getC_left());
        getChildNodeByLeftRightCriteria.add(whereChildNodeByLeftRight);
        getChildNodeByLeftRightCriteria.add(Restrictions.and(Restrictions.le("c_right", nodeById.getC_right())));
        getChildNodeByLeftRightCriteria.addOrder(Order.asc("c_left"));
        List<T> childNodesFromNodeById = jsTreeHibernateDao.getListWithoutPaging(getChildNodeByLeftRightCriteria);

        logger.debug("-----------------------nodeByRef 완료-----------------------");
        //T nodeByRef = (T) jsTreeHibernateDao.getUnique(jsTreeHibernateDTO.getRef());
        long rightPointFromNodeByRef = refNode.getC_right();

        logger.debug("-----------------------childNodesFromNodeByRef 완료-----------------------");
        DetachedCriteria getNodeByRefCriteria = DetachedCriteria.forClass(jsTreeHibernateDTO.getClass());
        Criterion whereNodeByRef = Restrictions.eq("c_parentid", refNode.getC_id());
        getNodeByRefCriteria.add(whereNodeByRef);
        List<T> childNodesFromNodeByRef = (List<T>) jsTreeHibernateDao.getListWithoutPaging(getNodeByRefCriteria);

        T t_ComprehensiveTree = newInstance(jsTreeHibernateDTO);

        long spaceOfTargetNode = 2;
        Collection<Long> c_idsByChildNodeFromNodeById = null;

        logger.debug("-----------------------c_idsByChildNodeFromNodeById 완료-----------------------");
        c_idsByChildNodeFromNodeById = CollectionUtils.collect(childNodesFromNodeById, new Transformer<T, Long>() {
            @Override
            public Long transform(T childNodePerNodeById) {
                return childNodePerNodeById.getC_id();
            }
        });

        if (c_idsByChildNodeFromNodeById.contains(jsTreeHibernateDTO.getRef())) {
            throw new RuntimeException("myself contains already refTargetNode");
        }

        spaceOfTargetNode = nodeById.getC_right() - nodeById.getC_left() + 1;

        if (!jsTreeHibernateDTO.isCopied()) {
            logger.debug("-----------------------cutMyself 완료-----------------------");
            this.cutMyself(nodeById, spaceOfTargetNode, c_idsByChildNodeFromNodeById);
        }

        logger.debug("-----------------------calculatePostion 완료-----------------------");
        this.calculatePostion(jsTreeHibernateDTO, nodeById, childNodesFromNodeByRef, request);

        if (rightPointFromNodeByRef < 1) {
            rightPointFromNodeByRef = 1;
        }

        if (!jsTreeHibernateDTO.isCopied()) {
            logger.debug("-----------------------stretchPositionForMyselfFromJstree 완료-----------------------");
            this.stretchPositionForMyselfFromJstree(c_idsByChildNodeFromNodeById, jsTreeHibernateDTO);

            int selfPosition = (nodeById.getC_parentid() == jsTreeHibernateDTO.getRef() && jsTreeHibernateDTO
                    .getC_position() > nodeById.getC_position()) ? 1 : 0;

            for (T child : childNodesFromNodeByRef) {
                if (child.getC_position() - selfPosition == jsTreeHibernateDTO.getC_position()) {
                    rightPointFromNodeByRef = child.getC_left();
                    break;
                }
            }

            if (nodeById.getC_left() < rightPointFromNodeByRef) {
                rightPointFromNodeByRef -= spaceOfTargetNode;
            }
        }

        logger.debug("-----------------------stretchLeftRightForMyselfFromJstree 완료-----------------------");
        this.stretchLeftRightForMyselfFromJstree(spaceOfTargetNode, rightPointFromNodeByRef,
                jsTreeHibernateDTO.getCopy(), c_idsByChildNodeFromNodeById, jsTreeHibernateDTO);

        if (logger.isDebugEnabled()) {
            logger.debug(">>>>>>>>>>>>>>>>>>>>" + rightPointFromNodeByRef);
        }

        long targetNodeLevel = nodeById.getC_level() - (refNode.getC_level() + 1);
        long comparePoint = nodeByIdLeft - rightPointFromNodeByRef;

        if (logger.isDebugEnabled()) {
            logger.debug(">>>>>>>>>>>>>>>>>>>>" + comparePoint);
        }

        if (jsTreeHibernateDTO.isCopied()) {
            logger.debug("-----------------------pasteMyselfFromJstree 완료-----------------------");
            long insertSeqResult = this
                    .pasteMyselfFromJstree(jsTreeHibernateDTO.getRef(), comparePoint, spaceOfTargetNode,
                            targetNodeLevel, c_idsByChildNodeFromNodeById, rightPointFromNodeByRef, nodeById);
            t_ComprehensiveTree.setId(insertSeqResult);
            logger.debug("-----------------------fixPositionParentIdOfCopyNodes-----------------------");
            this.fixPositionParentIdOfCopyNodes(insertSeqResult, jsTreeHibernateDTO.getC_position(), jsTreeHibernateDTO);
        } else {
            logger.debug("-----------------------enterMyselfFromJstree 완료-----------------------");
            this.enterMyselfFromJstree(jsTreeHibernateDTO.getRef(), jsTreeHibernateDTO.getC_position(),
                    jsTreeHibernateDTO.getC_id(), comparePoint, targetNodeLevel, c_idsByChildNodeFromNodeById,
                    jsTreeHibernateDTO);
            enterMyselfFixLeftRight(comparePoint, targetNodeLevel, c_idsByChildNodeFromNodeById, jsTreeHibernateDTO);
        }
        return t_ComprehensiveTree;
    }
}