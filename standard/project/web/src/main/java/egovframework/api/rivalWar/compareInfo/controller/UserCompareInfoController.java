package egovframework.api.rivalWar.compareInfo.controller;

import egovframework.api.rivalWar.compareInfo.service.CompareInfoService;
import egovframework.com.ext.jstree.support.mvc.GenericAbstractController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2017-09-03.
 */
@Controller
@RequestMapping(value = {"/api/rivalWar/ROLE_USER/compareInfo"})
public class UserCompareInfoController  extends GenericAbstractController {

    @Autowired
    private CompareInfoService compareInfoService;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());
}
