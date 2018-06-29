package egovframework.api.rivalWar.compareItem.controller;

import egovframework.api.rivalWar.compareItem.service.CompareItemService;
import egovframework.com.ext.jstree.support.mvc.GenericAbstractController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = {"/api/rivalWar/ROLE_USER/compareItem"})
public class UserCompareItemController extends GenericAbstractController {

    @Autowired
    private CompareItemService compareItemService;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());
}
