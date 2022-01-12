package egovframework.api.arms.pdServiceJira.controller;

import egovframework.api.arms.pdService.model.PdServiceDTO;
import egovframework.api.arms.pdServiceJira.model.PdServiceJiraDTO;
import egovframework.api.arms.pdServiceJira.service.PdServiceJira;
import egovframework.com.ext.jstree.springHibernate.core.controller.SHVAbstractController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.PostConstruct;
import java.util.Comparator;
import java.util.List;
import java.util.NoSuchElementException;

@Controller
@RequestMapping(value = {"/auth-user/api/arms/pdServiceJira"})
public class UserPdServiceJiraController extends SHVAbstractController<PdServiceJira, PdServiceJiraDTO> {

    @Autowired
    @Qualifier("PdServiceJira")
    private PdServiceJira pdServiceJira;

    @PostConstruct
    public void initialize() {
        setJsTreeHibernateService(pdServiceJira);
    }

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @ResponseBody
    @RequestMapping(value = "/getTestConnectionJira.do", method = RequestMethod.POST)
    public ModelAndView addEndNodeByRoot(PdServiceJiraDTO pdServiceJiraDTO,
                                         BindingResult bindingResult) throws Exception {
        if (bindingResult.hasErrors())
            throw new RuntimeException();



        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", "");

        return modelAndView;
    }
}
