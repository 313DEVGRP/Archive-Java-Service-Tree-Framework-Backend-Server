package egovframework.api.rivalWar.directChat.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.google.common.collect.Maps;
import egovframework.api.rivalWar.directChat.service.DirectChatService;
import egovframework.api.rivalWar.directChat.vo.DirectChatDTO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.ext.jstree.springiBatis.core.util.Util_TitleChecker;
import egovframework.com.ext.jstree.springiBatis.core.validation.group.*;
import egovframework.com.ext.jstree.support.mvc.GenericAbstractController;
import egovframework.com.ext.jstree.support.util.ParameterParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping(value = {"/api/rivalWar/directChat"})
public class DirectChatController extends GenericAbstractController {

    @Autowired
    private DirectChatService directChatService;

    @IncludedInfo(name = "RivalWar Admin DirectChat", listUrl = "/api/rivalWar/directChat/admin/getJsTreeView.do", order = 7001, gid = 7313)
    @RequestMapping("/admin/getJsTreeView.do")
    public String jsTreeSpringHibernate() {
        return "egovframework/rivalWar/api/directChat/admin/JsTreeView";
    }

    /**
     * 자식노드를 요청한다.
     *
     * @param comprehensiveTree
     * @param model
     * @param request
     * @return String
     * @throws JsonProcessingException
     */
    @ResponseBody
    @RequestMapping(value = "/getChildDirectChat.do", method = RequestMethod.GET)
    public ModelAndView getChildDirectChat(DirectChatDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request)
            throws Exception {

        ParameterParser parser = new ParameterParser(request);

        if (parser.getInt("c_id") <= 0) {
            throw new RuntimeException();
        }

        jsTreeHibernateDTO.setWhere("c_parentid", new Long(parser.get("c_id")));
        List<DirectChatDTO> list = directChatService.getChildDirectChat(jsTreeHibernateDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", list);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/getPaginatedChildMenu.do", method = RequestMethod.GET)
    public ModelAndView getPaginatedChildMenu(DirectChatDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request)
            throws Exception {

        if (jsTreeHibernateDTO.getC_id() <= 0 || jsTreeHibernateDTO.getPageIndex() <= 0
                || jsTreeHibernateDTO.getPageUnit() <= 0 || jsTreeHibernateDTO.getPageSize() <= 0) {
            throw new RuntimeException();
        }

        jsTreeHibernateDTO.setWhere("c_parentid", jsTreeHibernateDTO.getC_id());
        List<DirectChatDTO> list = directChatService.getPaginatedChildDirectChat(jsTreeHibernateDTO);
        jsTreeHibernateDTO.getPaginationInfo().setTotalRecordCount(list.size());

        ModelAndView modelAndView = new ModelAndView("jsonView");
        HashMap<String, Object> resultMap = Maps.newHashMap();
        resultMap.put("paginationInfo", jsTreeHibernateDTO.getPaginationInfo());
        resultMap.put("result", list);
        modelAndView.addObject("result", resultMap);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/getDirectChat.do", method = RequestMethod.GET)
    public ModelAndView getDirectChat(DirectChatDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request)
            throws Exception {

        ParameterParser parser = new ParameterParser(request);

        if (parser.getInt("c_id") <= 0) {
            throw new RuntimeException();
        }

        DirectChatDTO directChatDTO = directChatService.getDirectChat(jsTreeHibernateDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", directChatDTO);
        return modelAndView;
    }

    /**
     * 노드를 검색한다.
     *
     * @param comprehensiveTree
     * @param model
     * @param request
     * @return
     * @throws JsonProcessingException
     */
    @ResponseBody
    @RequestMapping(value = "/searchDirectChat.do", method = RequestMethod.GET)
    public ModelAndView searchNode(DirectChatDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request)
            throws Exception {

        ParameterParser parser = new ParameterParser(request);

        if (!StringUtils.hasText(request.getParameter("searchString"))) {
            throw new RuntimeException();
        }

        jsTreeHibernateDTO.setWhereLike("c_title", parser.get("parser"));
        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", directChatService.searchDirectChat(jsTreeHibernateDTO));
        return modelAndView;
    }

    /**
     * 노드를 추가한다.
     *
     * @param comprehensiveTree
     * @param model
     * @param request
     * @return
     * @throws JsonProcessingException
     * @throws IllegalAccessException
     * @throws InstantiationException
     */
    @ResponseBody
    @RequestMapping(value = "/addDirectChat.do", method = RequestMethod.POST)
    public ModelAndView addDirectChat(@Validated(value = AddNode.class) DirectChatDTO jsTreeHibernateDTO,
                                      BindingResult bindingResult, ModelMap model) throws Exception {
        if (bindingResult.hasErrors())
            throw new RuntimeException();

        jsTreeHibernateDTO.setC_title(Util_TitleChecker.StringReplace(jsTreeHibernateDTO.getC_title()));

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", directChatService.addDirectChat(jsTreeHibernateDTO));
        return modelAndView;
    }

    /**
     * 노드를 삭제한다.
     *
     * @param comprehensiveTree
     * @param model
     * @param request
     * @return
     * @throws JsonProcessingException
     */
    @ResponseBody
    @RequestMapping(value = "/removeDirectChat.do", method = RequestMethod.POST)
    public ModelAndView removeNode(@Validated(value = RemoveNode.class) DirectChatDTO jsTreeHibernateDTO,
                                   BindingResult bindingResult, ModelMap model) throws Exception {
        if (bindingResult.hasErrors())
            throw new RuntimeException();

        jsTreeHibernateDTO.setStatus(directChatService.removeDirectChat(jsTreeHibernateDTO));
        setJsonDefaultSetting(jsTreeHibernateDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", jsTreeHibernateDTO);
        return modelAndView;
    }

    private void setJsonDefaultSetting(DirectChatDTO jsTreeHibernateDTO) {
        long defaultSettingValue = 0;
        jsTreeHibernateDTO.setC_parentid(defaultSettingValue);
        jsTreeHibernateDTO.setC_position(defaultSettingValue);
        jsTreeHibernateDTO.setC_left(defaultSettingValue);
        jsTreeHibernateDTO.setC_right(defaultSettingValue);
        jsTreeHibernateDTO.setC_level(defaultSettingValue);
        jsTreeHibernateDTO.setRef(defaultSettingValue);
    }

    /**
     * 노드를 변경한다.
     *
     * @param comprehensiveTree
     * @param model
     * @param request
     * @return
     * @throws JsonProcessingException
     */
    @ResponseBody
    @RequestMapping(value = "/alterDirectChat.do", method = RequestMethod.POST)
    public ModelAndView alterNode(@Validated(value = AlterNode.class) DirectChatDTO jsTreeHibernateDTO,
                                  BindingResult bindingResult, ModelMap model) throws Exception {
        if (bindingResult.hasErrors())
            throw new RuntimeException();

        jsTreeHibernateDTO.setC_title(Util_TitleChecker.StringReplace(jsTreeHibernateDTO.getC_title()));

        jsTreeHibernateDTO.setStatus(directChatService.alterDirectChat(jsTreeHibernateDTO));
        setJsonDefaultSetting(jsTreeHibernateDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", jsTreeHibernateDTO);
        return modelAndView;
    }

    /**
     * 노드의 타입을 변경한다.
     *
     * @param comprehensiveTree
     * @param model
     * @param request
     * @return
     * @throws JsonProcessingException
     */
    @ResponseBody
    @RequestMapping(value = "/alterNodeDirectChat.do", method = RequestMethod.POST)
    public ModelAndView alterNodeType(@Validated(value = AlterNodeType.class) DirectChatDTO jsTreeHibernateDTO,
                                      BindingResult bindingResult, ModelMap model) throws Exception {
        if (bindingResult.hasErrors())
            throw new RuntimeException();

        directChatService.alterDirectChatType(jsTreeHibernateDTO);
        setJsonDefaultSetting(jsTreeHibernateDTO);
        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", jsTreeHibernateDTO);
        return modelAndView;
    }

    /**
     * 노드를 이동한다.
     *
     * @param comprehensiveTree
     * @param model
     * @param request
     * @return
     * @throws JsonProcessingException
     * @throws ReflectiveOperationException
     * @throws IllegalAccessException
     * @throws InstantiationException
     */
    @ResponseBody
    @RequestMapping(value = "/moveDirectChat.do", method = RequestMethod.POST)
    public ModelAndView moveNode(@Validated(value = MoveNode.class) DirectChatDTO jsTreeHibernateDTO,
                                 BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
        if (bindingResult.hasErrors())
            throw new RuntimeException();

        directChatService.moveDirectChat(jsTreeHibernateDTO, request);
        setJsonDefaultSetting(jsTreeHibernateDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", jsTreeHibernateDTO);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/analyzeDirectChat.do", method = RequestMethod.GET)
    public ModelAndView getChildNode(ModelMap model) {
        model.addAttribute("analyzeResult", "");

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", "true");
        return modelAndView;
    }
}
