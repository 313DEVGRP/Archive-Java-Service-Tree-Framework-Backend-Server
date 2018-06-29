package egovframework.api.rivalWar.userSelectedItem.controller;

import egovframework.api.rivalWar.specHashTag.service.SpecHashTagService;
import egovframework.com.ext.jstree.support.mvc.GenericAbstractController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = {"/api/rivalWar/ROLE_USER/userSelectedItem"})
public class UserSelectedItemController extends GenericAbstractController {

    @Autowired
    private SpecHashTagService specHashTagService;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());
}
