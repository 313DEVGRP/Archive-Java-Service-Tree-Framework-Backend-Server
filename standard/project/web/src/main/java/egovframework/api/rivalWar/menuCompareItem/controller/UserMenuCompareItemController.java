package egovframework.api.rivalWar.menuCompareItem.controller;

import egovframework.api.rivalWar.compareItem.service.CompareItemService;
import egovframework.api.rivalWar.menuCompareItem.service.MenuCompareItemService;
import egovframework.com.ext.jstree.support.mvc.GenericAbstractController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2017-10-23.
 */
@Controller
@RequestMapping(value = {"/api/rivalWar/ROLE_USER/menuCompareItem"})
public class UserMenuCompareItemController  extends GenericAbstractController {

    @Autowired
    private MenuCompareItemService menuCompareItemService;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());
}
