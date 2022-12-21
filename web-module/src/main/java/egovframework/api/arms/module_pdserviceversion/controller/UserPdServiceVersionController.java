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
import egovframework.api.arms.util.StringUtility;
import egovframework.com.ext.jstree.springHibernate.core.controller.SHVAbstractController;
import egovframework.com.ext.jstree.support.util.ParameterParser;
import egovframework.com.ext.jstree.support.util.StringUtils;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
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
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;


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

        pdServiceVersionDTO.setOrder(Order.asc("c_left"));
        pdServiceVersionDTO.setWhere("c_pdservice_link", pdServiceVersionDTO.getC_id().toString());
        List<PdServiceVersionDTO> pdServiceVersionDTOS = pdServiceVersion.getChildNode(pdServiceVersionDTO);
        logger.info("UserPdServiceVersionController ::  getVersion :: pdServiceVersionDTOS = " + pdServiceVersionDTOS.size());

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", pdServiceVersionDTOS);
        return modelAndView;
    }

    public String[] jsonStringifyConvert(String versionInfo) {
        versionInfo = StringUtils.remove(versionInfo, "\"");
        versionInfo = StringUtils.remove(versionInfo, "]");
        versionInfo = StringUtils.remove(versionInfo, "[");
        return StringUtils.split(versionInfo, ",");
    }

    @RequestMapping(value="/getVersions.do",method= RequestMethod.GET)
    public ModelAndView getVersions(PdServiceVersionDTO pdServiceVersionDTO, ModelMap model,
                                   HttpServletRequest request) throws Exception {

        ParameterParser parser = new ParameterParser(request);
        String parse_c_ids = parser.get("c_ids");
        String[] convert_c_ids = jsonStringifyConvert(parse_c_ids);
        List<Long> longList = new ArrayList<>();
        for (String c_id : convert_c_ids ) {
            longList.add(StringUtility.toLong(c_id));
        }

        PdServiceVersionDTO versionDTO = new PdServiceVersionDTO();
        Criterion criterion = Restrictions.in("c_id", longList);

        versionDTO.getCriterions().add(criterion);

        List<PdServiceVersionDTO> pdServiceVersionDTOS = pdServiceVersion.getChildNode(versionDTO);
        logger.info("UserPdServiceVersionController ::  getVersions :: pdServiceVersionDTOS = " + pdServiceVersionDTOS.size());

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
        modelAndView.addObject("result", pdServiceVersion.updateNode(pdServiceVersionDTO));

        return modelAndView;
    }

}
