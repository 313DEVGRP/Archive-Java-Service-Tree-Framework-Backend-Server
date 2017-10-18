package egovframework.api.rivalWar.directChat.controller;

import egovframework.api.rivalWar.compareSpec.service.CompareSpecService;
import egovframework.api.rivalWar.directChat.service.DirectChatService;
import egovframework.com.ext.jstree.support.mvc.GenericAbstractController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2017-09-24.
 */
@Controller
@RequestMapping(value = {"/api/rivalWar/ROLE_USER/directChat"})
public class UserDirectChatController extends GenericAbstractController {

    @Autowired
    private DirectChatService directChatService;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());
}
