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

import egovframework.api.arms.module_armsmaker.model.ArmsInstallDB_SqlMaaperDTO;
import egovframework.api.arms.module_armsmaker.service.ArmsInstallDB;
import egovframework.api.arms.module_pdservice.model.PdServiceDTO;
import egovframework.com.ext.jstree.springHibernate.core.service.JsTreeHibernateServiceImpl;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Comparator;
import java.util.List;
import java.util.NoSuchElementException;

@Service("pdService")
public class PdServiceImpl extends JsTreeHibernateServiceImpl implements PdService{

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    private static final Long ROOT_NODE_ID = new Long(2);
    private static final String NODE_TYPE = new String("default");
    private static final String REQ_PREFIX_TABLENAME_BY_PDSERVICE = new String("T_ARMS_REQADD_");
    private static final String REQ_PREFIX_TABLENAME_BY_PDSERVICE_STATUS = new String("T_ARMS_REQSTATUS_");

    @Resource(name = "reqAddTemplateInstallDB")
    ArmsInstallDB reqAddTemplateInstallDB;

    @Resource(name = "reqStatusTemplateInstallDB")
    ArmsInstallDB reqStatusTemplateInstallDB;

    @Override
    public List<PdServiceDTO> getNodesWithoutRoot(PdServiceDTO pdServiceDTO) throws Exception {
        pdServiceDTO.setOrder(Order.asc("c_id"));
        Criterion criterion = Restrictions.not(
                // replace "id" below with property name, depending on what you're filtering against
                Restrictions.in("c_id", new Object[] {1L, 2L})
        );
        pdServiceDTO.getCriterions().add(criterion);
        List<PdServiceDTO> list = this.getChildNode(pdServiceDTO);
        for (PdServiceDTO dto: list) {
            dto.setC_contents("force empty");
        }
        return list;
    }

    @Override
    public void setDynamicReqAddDB(PdServiceDTO addedNode) throws Exception {
        ArmsInstallDB_SqlMaaperDTO armsInstallDB_sqlMaaperDTO = new ArmsInstallDB_SqlMaaperDTO();
        armsInstallDB_sqlMaaperDTO.setC_title(REQ_PREFIX_TABLENAME_BY_PDSERVICE + addedNode.getC_id().toString());
        armsInstallDB_sqlMaaperDTO.setSqlMapSelector("arms-reqadd-template");

        reqAddTemplateInstallDB.sqlMapExecute(armsInstallDB_sqlMaaperDTO);
    }

    @Override
    public void setDynamicReqStatusDB(PdServiceDTO addedNode) throws Exception {
        ArmsInstallDB_SqlMaaperDTO armsInstall_statusDB_sqlMaaperDTO = new ArmsInstallDB_SqlMaaperDTO();
        armsInstall_statusDB_sqlMaaperDTO.setC_title(REQ_PREFIX_TABLENAME_BY_PDSERVICE_STATUS + addedNode.getC_id().toString());
        armsInstall_statusDB_sqlMaaperDTO.setSqlMapSelector("arms-reqstatus-template");

        reqStatusTemplateInstallDB.sqlMapExecute(armsInstall_statusDB_sqlMaaperDTO);
    }

    @Override
    public PdServiceDTO addNodeToEndPosition(PdServiceDTO pdServiceDTO) throws Exception {
        //루트 노드를 기준으로 리스트를 검색
        PdServiceDTO paramPdServiceDTO = new PdServiceDTO();
        paramPdServiceDTO.setWhere("c_parentid", ROOT_NODE_ID);
        List<PdServiceDTO> list = this.getChildNode(paramPdServiceDTO);

        //검색된 노드중 maxPosition을 찾는다.
        PdServiceDTO maxPositionPdServiceDTO = list
                .stream()
                .max(Comparator.comparing(PdServiceDTO::getC_position))
                .orElseThrow(NoSuchElementException::new);

        //노드 값 셋팅
        pdServiceDTO.setRef(ROOT_NODE_ID);
        pdServiceDTO.setC_position(maxPositionPdServiceDTO.getC_position() + 1);
        pdServiceDTO.setC_type(NODE_TYPE);

        return this.addNode(pdServiceDTO);
    }
}