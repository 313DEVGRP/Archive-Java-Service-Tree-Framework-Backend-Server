/*
 * @author Dongmin.lee
 * @since 2022-11-20
 * @version 22.11.20
 * @see <pre>
 *  Copyright (C) 2007 by 313 DEV GRP, Inc - All Rights Reserved
 *  Unauthorized copying of this file, via any medium is strictly prohibited
 *  Proprietary and confidential
 *  Written by 313 developer group <313@313.co.kr>, December 2010
 * </pre>
 */
package egovframework.api.arms.module_pdserviceversion.controller;

import egovframework.api.arms.module_pdserviceversion.model.PdServiceVersionDTO;
import egovframework.api.arms.module_pdserviceversion.service.PdServiceVersion;
import egovframework.com.ext.jstree.springHibernate.core.controller.SHVAbstractController;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Slf4j
@Controller
@RequestMapping(value = {"/auth-user/api/arms/pdServiceVersion"})
public class UserPdServiceVersionController extends SHVAbstractController<PdServiceVersion, PdServiceVersionDTO> {

    @Autowired
    @Qualifier("pdServiceVersion")
    private PdServiceVersion pdServiceVersion;

    @PostConstruct
    public void initialize() {
        setJsTreeHibernateService(pdServiceVersion);
    }

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @RequestMapping(value="/getVersion.do",method= RequestMethod.GET)
    public ModelAndView getVersion(PdServiceVersionDTO pdServiceVersionDTO, ModelMap model,
                                HttpServletRequest request) throws Exception {

        List<PdServiceVersionDTO> pdServiceVersionDTOS = pdServiceVersion.getVersion(pdServiceVersionDTO);
        logger.info("UserPdServiceVersionController ::  getVersion :: pdServiceVersionDTOS = " + pdServiceVersionDTOS.size());

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", pdServiceVersionDTOS);
        return modelAndView;
    }

    @RequestMapping(value="/updateVersionNode.do", method=RequestMethod.POST)
    public ModelAndView updateVersionNode(PdServiceVersionDTO pdServiceVersionDTO,
                                          BindingResult bindingResult) throws Exception {
        if (bindingResult.hasErrors())
            throw new RuntimeException();


        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", pdServiceVersion.updateVersionNode(pdServiceVersionDTO));

        return modelAndView;
    }

}
