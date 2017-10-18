package egovframework.api.rivalWar.specHashTag.controller;

import egovframework.api.rivalWar.directChat.service.DirectChatService;
import egovframework.api.rivalWar.specHashTag.service.SpecHashTagService;
import egovframework.com.ext.jstree.support.mvc.GenericAbstractController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2017-10-14.
 */
@Controller
@RequestMapping(value = {"/api/rivalWar/ROLE_USER/specHashTag"})
public class UserSpecHashTagController extends GenericAbstractController {

    @Autowired
    private SpecHashTagService specHashTagService;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());
}
