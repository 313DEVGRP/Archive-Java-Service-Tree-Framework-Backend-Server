package egovframework.api.rivalWar.compareItem.controller;

import egovframework.api.rivalWar.compareItem.service.CompareItemService;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.ext.jstree.support.mvc.GenericAbstractController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2017-10-08.
 */
@Controller
@RequestMapping(value = {"/api/rivalWar/compareItem"})
public class AnonymousCompareItemController extends GenericAbstractController {

    @Autowired
    private CompareItemService compareItemService;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @IncludedInfo(name = "RivalWar Admin CompareItem", listUrl = "/api/rivalWar/compareItem/getJsTreeView.do", order = 7005, gid = 7313)
    @RequestMapping("/getJsTreeView.do")
    public String getRivalWarCompareSpecJstreeView() {
        return "egovframework/api/rivalWar/compareItem/JsTreeView";
    }
}
