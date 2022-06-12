package egovframework.api.arms.pdVersionService.controller;

import egovframework.api.arms.pdService.model.PdServiceDTO;
import egovframework.api.arms.pdService.service.PdService;
import egovframework.api.arms.pdVersionService.model.PdVersionServiceVO;
import egovframework.api.arms.pdVersionService.service.PdVersionService;
import egovframework.com.ext.jstree.springHibernate.core.controller.SHVAbstractController;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.PostConstruct;

@Slf4j
@Controller
@RequestMapping(value = {"/auth-user/api/arms/pdVersionService"})
public class UserPdVersionServiceController extends SHVAbstractController<PdVersionService, PdVersionServiceVO> {

    @Autowired
    @Qualifier("pdVersionService")
    private PdVersionService pdVersionService;

    @PostConstruct
    public void initialize() {
        setJsTreeHibernateService(pdVersionService);
    }

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

}
