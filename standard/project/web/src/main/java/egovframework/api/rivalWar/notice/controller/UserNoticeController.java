package egovframework.api.rivalWar.notice.controller;

import egovframework.api.rivalWar.compareItem.service.CompareItemService;
import egovframework.api.rivalWar.notice.service.NoticeService;
import egovframework.com.ext.jstree.support.mvc.GenericAbstractController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2017-11-06.
 */
@Controller
@RequestMapping(value = {"/api/rivalWar/ROLE_USER/notice"})
public class UserNoticeController extends GenericAbstractController {

    @Autowired
    private NoticeService noticeService;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());
}