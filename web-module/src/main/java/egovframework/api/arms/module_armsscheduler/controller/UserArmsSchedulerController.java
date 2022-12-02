/*
 * @author Dongmin.lee
 * @since 2022-12-02
 * @version 22.12.02
 * @see <pre>
 *  Copyright (C) 2007 by 313 DEV GRP, Inc - All Rights Reserved
 *  Unauthorized copying of this file, via any medium is strictly prohibited
 *  Proprietary and confidential
 *  Written by 313 developer group <313@313.co.kr>, December 2010
 * </pre>
 */
package egovframework.api.arms.module_armsscheduler.controller;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.PostConstruct;

import egovframework.com.ext.jstree.springHibernate.core.controller.SHVAbstractController;

import egovframework.api.arms.module_armsscheduler.model.ArmsSchedulerDTO;
import egovframework.api.arms.module_armsscheduler.service.ArmsScheduler;

@Slf4j
@Controller
@RequestMapping(value = {"/auth-user/api/arms/armsScheduler"})
public class UserArmsSchedulerController extends SHVAbstractController<ArmsScheduler, ArmsSchedulerDTO> {

    @Autowired
    @Qualifier("armsScheduler")
    private ArmsScheduler armsScheduler;

    @PostConstruct
    public void initialize() {
        setJsTreeHibernateService(armsScheduler);
    }

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

}
