/*
 * @author Dongmin.lee
 * @since 2022-06-17
 * @version 22.06.17
 * @see <pre>
 *  Copyright (C) 2007 by 313 DEV GRP, Inc - All Rights Reserved
 *  Unauthorized copying of this file, via any medium is strictly prohibited
 *  Proprietary and confidential
 *  Written by 313 developer group <313@313.co.kr>, December 2010
 * </pre>
 */
package egovframework.api.arms.module_pdversion.controller;

import egovframework.api.arms.devicelist.service.DeviceListService;
import egovframework.api.arms.module_pdservice.model.PdServiceDTO;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import java.util.Comparator;
import java.util.List;
import java.util.NoSuchElementException;

import egovframework.com.ext.jstree.springHibernate.core.controller.SHVAbstractController;

import egovframework.api.arms.module_pdversion.model.PdVersionDTO;
import egovframework.api.arms.module_pdversion.service.PdVersion;

@Slf4j
@Controller
@RequestMapping(value = {"/auth-user/api/arms/pdversion"})
public class UserPdVersionController extends SHVAbstractController<PdVersion, PdVersionDTO> {

    @Autowired
    @Qualifier("pdVersion")
    private PdVersion pdVersion;

    @PostConstruct
    public void initialize() {
        setJsTreeHibernateService(pdVersion);
    }

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @RequestMapping(value="/getVersion.do",method= RequestMethod.GET)
    public ModelAndView getNode(PdVersionDTO pdVersionDTO, ModelMap model,
                                HttpServletRequest request) throws Exception {

        List<PdVersionDTO> pdVersionDTOS = pdVersion.getVersion(pdVersionDTO);
        logger.info("DeviceList update Count = " + pdVersionDTOS.size());

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", pdVersionDTOS);
        return modelAndView;
    }

    @RequestMapping(value="/updateVersionNode.do", method=RequestMethod.POST)
    public ModelAndView updateVersionNode(PdVersionDTO pdVersionDTO,
                                             BindingResult bindingResult) throws Exception {
        if (bindingResult.hasErrors())
            throw new RuntimeException();


        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", pdVersion.updateVersionNode(pdVersionDTO));

        return modelAndView;
    }

}
