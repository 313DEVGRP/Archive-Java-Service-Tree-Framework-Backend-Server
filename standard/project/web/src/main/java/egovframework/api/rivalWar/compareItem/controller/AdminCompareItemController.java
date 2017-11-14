package egovframework.api.rivalWar.compareItem.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import egovframework.api.rivalWar.compareItem.service.CompareItemService;
import egovframework.api.rivalWar.compareItem.vo.CompareItemDTO;
import egovframework.com.ext.jstree.springiBatis.core.util.Util_TitleChecker;
import egovframework.com.ext.jstree.springiBatis.core.validation.group.*;
import egovframework.com.ext.jstree.support.mvc.GenericAbstractController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Administrator on 2017-10-08.
 */
@Controller
@RequestMapping(value = {"/api/rivalWar/ROLE_ADMIN/compareItem"})
public class AdminCompareItemController extends GenericAbstractController {

    @Autowired
    private CompareItemService compareItemService;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

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
    public ModelAndView addNode(@Validated(value = AddNode.class) CompareItemDTO jsTreeHibernateDTO,
                                BindingResult bindingResult, ModelMap model) throws Exception {
        if (bindingResult.hasErrors())
            throw new RuntimeException();

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", compareItemService.addNode(jsTreeHibernateDTO));
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
    public ModelAndView removeNode(@Validated(value = RemoveNode.class) CompareItemDTO jsTreeHibernateDTO,
                                   BindingResult bindingResult, ModelMap model) throws Exception {
        if (bindingResult.hasErrors())
            throw new RuntimeException();

        jsTreeHibernateDTO.setStatus(compareItemService.removeNode(jsTreeHibernateDTO));
        setJsonDefaultSetting(jsTreeHibernateDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", jsTreeHibernateDTO);
        return modelAndView;
    }

    private void setJsonDefaultSetting(CompareItemDTO jsTreeHibernateDTO) {
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
    public ModelAndView alterNode(@Validated(value = AlterNode.class) CompareItemDTO jsTreeHibernateDTO,
                                  BindingResult bindingResult, ModelMap model) throws Exception {
        if (bindingResult.hasErrors()){
            throw new RuntimeException();
        }

        jsTreeHibernateDTO.setC_title(Util_TitleChecker.StringReplace(jsTreeHibernateDTO.getC_title()));

        jsTreeHibernateDTO.setStatus(compareItemService.alterNode(jsTreeHibernateDTO));
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
     * @return
     * @throws JsonProcessingException
     */
    @ResponseBody
    @RequestMapping(value = "/alterNodeType.do", method = RequestMethod.POST)
    public ModelAndView alterNodeType(@Validated(value = AlterNodeType.class) CompareItemDTO jsTreeHibernateDTO,
                                      BindingResult bindingResult, ModelMap model) throws Exception {
        if (bindingResult.hasErrors())
            throw new RuntimeException();

        compareItemService.alterNodeType(jsTreeHibernateDTO);
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
    public ModelAndView moveNode(@Validated(value = MoveNode.class) CompareItemDTO jsTreeHibernateDTO,
                                 BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
        if (bindingResult.hasErrors()) {
            throw new RuntimeException();
        }
        compareItemService.moveNode(jsTreeHibernateDTO, request);
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
        modelAndView.addObject("result", "true");
        return modelAndView;
    }
}
