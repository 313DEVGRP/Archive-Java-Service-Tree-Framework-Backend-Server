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
import egovframework.com.ext.jstree.springHibernate.core.service.JsTreeHibernateService;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;

import java.util.List;

public interface PdService extends JsTreeHibernateService {

    public List<PdServiceDTO> getNodesWithoutRoot(PdServiceDTO pdServiceDTO) throws Exception;

    public void setDynamicReqAddDB(PdServiceDTO addedPdServiceDTO) throws Exception;

    public void setDynamicReqStatusDB(PdServiceDTO addedPdServiceDTO) throws Exception;

    public PdServiceDTO addNodeToEndPosition(PdServiceDTO pdServiceDTO) throws Exception;

}