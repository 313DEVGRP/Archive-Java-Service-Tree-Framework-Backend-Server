package egovframework.api.menu.controller;

import egovframework.api.menu.service.MenuService;
import egovframework.com.ext.jstree.support.mvc.GenericAbstractController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = {"/api/ROLE_USER/menu"})
public class UserMenuController extends GenericAbstractController {

    @Autowired
    private MenuService menuService;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

}
