package egovframework.com.ext.jstree.springHibernate.core.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

import com.fasterxml.jackson.core.JsonProcessingException;
import com.google.common.collect.Maps;

import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.ext.jstree.springHibernate.core.service.JsTreeHibernateService;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateDTO;
import egovframework.com.ext.jstree.springHibernate.core.util.Util_TitleChecker;
import egovframework.com.ext.jstree.springHibernate.core.validation.group.AddNode;
import egovframework.com.ext.jstree.springHibernate.core.validation.group.AlterNode;
import egovframework.com.ext.jstree.springHibernate.core.validation.group.AlterNodeType;
import egovframework.com.ext.jstree.springHibernate.core.validation.group.MoveNode;
import egovframework.com.ext.jstree.springHibernate.core.validation.group.RemoveNode;
import egovframework.com.ext.jstree.support.mvc.GenericAbstractController;
import egovframework.com.ext.jstree.support.util.ParameterParser;

@Controller
@RequestMapping(value = {"/com/ext/jstree/springHibernate/core"})
public class JsTreeHibernateController extends GenericAbstractController {

    @Autowired
    private JsTreeHibernateService jsTreeHibernateService;

    /**
     * jstree Spring + myBatis 버전의 첫페이지를 요청한다.
     *
     * @return String jstreeSolutionSpringVersion 페이지를
     */
    @IncludedInfo(name = "Spring-Hibernate Ver.", listUrl = "/com/ext/jstree/springHibernate/core/getJsTreeView.do", order = 3360, gid = 313)
    @RequestMapping("/getJsTreeView.do")
    public String jsTreeSpringHibernate() {
        return "egovframework/com/ext/jstree/springHibernateVersion";
    }

    @RequestMapping("/csrf.do")
    public String jsTreeCSRFtoJson() {
        return "egovframework/com/ext/jstree/csrf";
    }

    /**
     * 자식노드를 요청한다.
     *
     * @param jsTreeHibernateDTO
     * @param model
     * @param request
     * @return String
     * @throws JsonProcessingException
     */
    @ResponseBody
    @RequestMapping(value = "/getChildNode.do", method = RequestMethod.GET)
    public ModelAndView getChildNode(JsTreeHibernateDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request)
            throws Exception {

        ParameterParser parser = new ParameterParser(request);

        if (parser.getInt("c_id") <= 0) {
            throw new RuntimeException();
        }

        jsTreeHibernateDTO.setWhere("c_parentid", new Long(parser.get("c_id")));
        List<JsTreeHibernateDTO> list = jsTreeHibernateService.getChildNode(jsTreeHibernateDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", list);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/getPaginatedChildNode.do", method = RequestMethod.GET)
    public ModelAndView getPaginatedChildNode(JsTreeHibernateDTO paginatedJsTreeHibernateDTO, ModelMap model,
                                              HttpServletRequest request) throws Exception {

        if (paginatedJsTreeHibernateDTO.getC_id() <= 0 || paginatedJsTreeHibernateDTO.getPageIndex() <= 0
                || paginatedJsTreeHibernateDTO.getPageUnit() <= 0 || paginatedJsTreeHibernateDTO.getPageSize() <= 0) {
            throw new RuntimeException();
        }
        paginatedJsTreeHibernateDTO.setWhere("c_parentid", paginatedJsTreeHibernateDTO.getC_id());
        List<JsTreeHibernateDTO> resultChildNodes = jsTreeHibernateService.getPaginatedChildNode(paginatedJsTreeHibernateDTO);
        paginatedJsTreeHibernateDTO.getPaginationInfo().setTotalRecordCount(resultChildNodes.size());

        ModelAndView modelAndView = new ModelAndView("jsonView");
        HashMap<String, Object> resultMap = Maps.newHashMap();
        resultMap.put("paginationInfo", paginatedJsTreeHibernateDTO.getPaginationInfo());
        resultMap.put("result", resultChildNodes);
        modelAndView.addObject("result", resultMap);
        return modelAndView;
    }

    /**
     * 노드를 검색한다.
     *
     * @param jsTreeHibernateDTO
     * @param model
     * @param request
     * @return
     * @throws JsonProcessingException
     */
    @ResponseBody
    @RequestMapping(value = "/searchNode.do", method = RequestMethod.GET)
    public ModelAndView searchNode(JsTreeHibernateDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request)
            throws Exception {

        ParameterParser parser = new ParameterParser(request);

        if (!StringUtils.hasText(request.getParameter("searchString"))) {
            throw new RuntimeException();
        }

        jsTreeHibernateDTO.setWhereLike("c_title", parser.get("parser"));
        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", jsTreeHibernateService.searchNode(jsTreeHibernateDTO));
        return modelAndView;
    }

    /**
     * 노드를 추가한다.
     *
     * @param jsTreeHibernateDTO
     * @param model
     * @param bindingResult
     * @return
     * @throws JsonProcessingException
     * @throws IllegalAccessException
     * @throws InstantiationException
     */
    @ResponseBody
    @RequestMapping(value = "/addNode.do", method = RequestMethod.POST)
    public ModelAndView addNode(@Validated(value = AddNode.class) JsTreeHibernateDTO jsTreeHibernateDTO,
                                BindingResult bindingResult, ModelMap model) throws Exception {
        if (bindingResult.hasErrors())
            throw new RuntimeException();

        jsTreeHibernateDTO.setC_title(Util_TitleChecker.StringReplace(jsTreeHibernateDTO.getC_title()));

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", jsTreeHibernateService.addNode(jsTreeHibernateDTO));
        return modelAndView;
    }

    /**
     * 노드를 삭제한다.
     *
     * @param jsTreeHibernateDTO
     * @param model
     * @param bindingResult
     * @return
     * @throws JsonProcessingException
     */
    @ResponseBody
    @RequestMapping(value = "/removeNode.do", method = RequestMethod.POST)
    public ModelAndView removeNode(@Validated(value = RemoveNode.class) JsTreeHibernateDTO jsTreeHibernateDTO,
                                   BindingResult bindingResult, ModelMap model) throws Exception {
        if (bindingResult.hasErrors())
            throw new RuntimeException();

        jsTreeHibernateDTO.setStatus(jsTreeHibernateService.removeNode(jsTreeHibernateDTO));
        setJsonDefaultSetting(jsTreeHibernateDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", jsTreeHibernateDTO);
        return modelAndView;
    }

    private void setJsonDefaultSetting(JsTreeHibernateDTO jsTreeHibernateDTO) {
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
     * @param jsTreeHibernateDTO
     * @param model
     * @param bindingResult
     * @return
     * @throws JsonProcessingException
     */
    @ResponseBody
    @RequestMapping(value = "/alterNode.do", method = RequestMethod.POST)
    public ModelAndView alterNode(@Validated(value = AlterNode.class) JsTreeHibernateDTO jsTreeHibernateDTO,
                                  BindingResult bindingResult, ModelMap model) throws Exception {
        if (bindingResult.hasErrors())
            throw new RuntimeException();

        jsTreeHibernateDTO.setC_title(Util_TitleChecker.StringReplace(jsTreeHibernateDTO.getC_title()));

        jsTreeHibernateDTO.setStatus(jsTreeHibernateService.alterNode(jsTreeHibernateDTO));
        setJsonDefaultSetting(jsTreeHibernateDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", jsTreeHibernateDTO);
        return modelAndView;
    }

    /**
     * 노드의 타입을 변경한다.
     *
     * @param jsTreeHibernateDTO
     * @param model
     * @param bindingResult
     * @return ModelAndView
     * @throws JsonProcessingException
     */
    @ResponseBody
    @RequestMapping(value = "/alterNodeType.do", method = RequestMethod.POST)
    public ModelAndView alterNodeType(@Validated(value = AlterNodeType.class) JsTreeHibernateDTO jsTreeHibernateDTO,
                                      BindingResult bindingResult, ModelMap model) throws Exception {
        if (bindingResult.hasErrors())
            throw new RuntimeException();

        jsTreeHibernateService.alterNodeType(jsTreeHibernateDTO);
        setJsonDefaultSetting(jsTreeHibernateDTO);
        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", jsTreeHibernateDTO);
        return modelAndView;
    }

    /**
     * 노드를 이동한다.
     *
     * @param jsTreeHibernateDTO
     * @param model
     * @param request
     * @return
     * @throws JsonProcessingException
     * @throws ReflectiveOperationException
     * @throws IllegalAccessException
     * @throws InstantiationException
     */
    @ResponseBody
    @RequestMapping(value = "/moveNode.do", method = RequestMethod.POST)
    public ModelAndView moveNode(@Validated(value = MoveNode.class) JsTreeHibernateDTO jsTreeHibernateDTO,
                                 BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
        if (bindingResult.hasErrors())
            throw new RuntimeException();

        jsTreeHibernateService.moveNode(jsTreeHibernateDTO, request);
        setJsonDefaultSetting(jsTreeHibernateDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", jsTreeHibernateDTO);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/analyzeNode.do", method = RequestMethod.GET)
    public ModelAndView getChildNode(ModelMap model) {
        model.addAttribute("analyzeResult", "");

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", "ture");
        return modelAndView;
    }

}
