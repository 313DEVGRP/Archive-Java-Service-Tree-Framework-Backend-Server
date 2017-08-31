package egovframework.api.rivalWar.aggregateResult.controller;

import egovframework.api.rivalWar.aggregateResult.service.AggregateResultService;
import egovframework.com.ext.jstree.support.mvc.GenericAbstractController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2017-08-29.
 */
@Controller
@RequestMapping(value = {"/api/rivalWar/ROLE_ADMIN/aggregateResult"})
public class AdminAggregateResultController extends GenericAbstractController {

    @Autowired
    private AggregateResultService aggregateResultService;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());
}
