/*
 * @author Dongmin.lee
 * @since 2022-11-08
 * @version 22.11.08
 * @see <pre>
 *  Copyright (C) 2007 by 313 DEV GRP, Inc - All Rights Reserved
 *  Unauthorized copying of this file, via any medium is strictly prohibited
 *  Proprietary and confidential
 *  Written by 313 developer group <313@313.co.kr>, December 2010
 * </pre>
 */
package egovframework.api.arms.module_pdserviceconnect.controller;

import egovframework.api.arms.module_pdserviceconnect.model.PdServiceConnectDTO;
import egovframework.api.arms.module_pdserviceconnect.service.PdServiceConnect;
import egovframework.api.arms.util.PropertiesReader;
import egovframework.com.ext.jstree.springHibernate.core.controller.SHVAbstractController;
import egovframework.com.ext.jstree.springHibernate.core.util.Util_TitleChecker;
import egovframework.com.ext.jstree.springHibernate.core.validation.group.AddNode;
import egovframework.com.ext.jstree.springHibernate.core.validation.group.UpdateNode;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Slf4j
@Controller
@RequestMapping(value = {"/auth-user/api/arms/pdServiceConnect"})
public class UserPdServiceConnectController extends SHVAbstractController<PdServiceConnect, PdServiceConnectDTO> {

    @Autowired
    @Qualifier("pdServiceConnect")
    private PdServiceConnect pdServiceConnect;

    @PostConstruct
    public void initialize() {
        setJsTreeHibernateService(pdServiceConnect);
    }

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @ResponseBody
    @RequestMapping(value = "/getExistNode.do", method = RequestMethod.GET)
    public ModelAndView getExistNode(PdServiceConnectDTO pdServiceConnectDTO,
                                         BindingResult bindingResult) throws Exception {
        if (bindingResult.hasErrors())
            throw new RuntimeException();

        //루트 노드를 기준으로 리스트를 검색
        PdServiceConnectDTO serviceConnectDTO = new PdServiceConnectDTO();
        serviceConnectDTO.setWhere("c_pdservice_id", pdServiceConnectDTO.getC_pdservice_id());
        serviceConnectDTO.setWhere("c_pdservice_version_id", pdServiceConnectDTO.getC_pdservice_version_id());
        List<PdServiceConnectDTO> list = pdServiceConnect.getChildNode(serviceConnectDTO);

        for ( PdServiceConnectDTO dto : list){
            String replaceTxt = dto.getC_pdservice_jira_ids().replaceAll("\\[","").replaceAll("\\]","");
            replaceTxt = replaceTxt.replaceAll("\"","");
            dto.setC_pdservice_jira_ids(replaceTxt);
        }

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", list);

        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(
            value = {"/addNode.do"},
            method = {RequestMethod.POST}
    )
    public ModelAndView addNode(@Validated({AddNode.class}) PdServiceConnectDTO jsTreeHibernateSearchDTO,
                                BindingResult bindingResult, ModelMap model) throws Exception {
        if (bindingResult.hasErrors()) {
            throw new RuntimeException();
        } else {
            jsTreeHibernateSearchDTO.setC_title(Util_TitleChecker.StringReplace(jsTreeHibernateSearchDTO.getC_title()));

            PdServiceConnectDTO returnVO = pdServiceConnect.addNode(jsTreeHibernateSearchDTO);

            PropertiesReader propertiesReader = new PropertiesReader("egovframework/egovProps/globals.properties");
            String armsUrl = "http://127.0.0.1:13131";
            String targetUrl = "/callback/api/arms/armsScheduler/forceExec/set_PdServiceVersion_toJiraProjectVersion.do";

            RestTemplate restTemplate = new RestTemplate();
            ResponseEntity<String> response = restTemplate.getForEntity(armsUrl + targetUrl, String.class);
            logger.info("response = " + response);

            ModelAndView modelAndView = new ModelAndView("jsonView");
            modelAndView.addObject("result", returnVO);
            return modelAndView;
        }
    }

    @ResponseBody
    @RequestMapping(value = "/updateNode.do")
    public ModelAndView updateNode(@Validated(value = UpdateNode.class) PdServiceConnectDTO jsTreeHibernateSearchDTO,
                                   BindingResult bindingResult, HttpServletRequest request, ModelMap model) throws Exception {

        if (bindingResult.hasErrors()) {
            throw new RuntimeException();
        }

        pdServiceConnect.updateNode(jsTreeHibernateSearchDTO);

        PropertiesReader propertiesReader = new PropertiesReader("egovframework/egovProps/globals.properties");
        String armsUrl = "http://127.0.0.1:13131";
        String targetUrl = "/callback/api/arms/armsScheduler/forceExec/set_PdServiceVersion_toJiraProjectVersion.do";

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> response = restTemplate.getForEntity(armsUrl + targetUrl, String.class);
        logger.info("response = " + response);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", "UserPdServiceConnectController :: updateNode");
        return modelAndView;
    }


}
