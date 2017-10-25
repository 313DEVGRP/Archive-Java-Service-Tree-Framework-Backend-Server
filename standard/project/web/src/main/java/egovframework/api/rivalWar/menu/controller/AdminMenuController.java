package egovframework.api.rivalWar.menu.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import egovframework.api.rivalWar.directChat.service.DirectChatService;
import egovframework.api.rivalWar.directChat.vo.DirectChatDTO;
import egovframework.api.rivalWar.menu.service.MenuService;
import egovframework.api.rivalWar.menu.vo.MenuDTO;
import egovframework.com.ext.jstree.springiBatis.core.util.Util_TitleChecker;
import egovframework.com.ext.jstree.springiBatis.core.validation.group.*;
import egovframework.com.ext.jstree.support.mvc.GenericAbstractController;
import egovframework.com.ext.jstree.support.security.database.model.Role;
import egovframework.com.ext.jstree.support.util.DateUtils;
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
import java.util.HashSet;

@Controller
@RequestMapping(value = {"/api/rivalWar/ROLE_ADMIN/menu"})
public class AdminMenuController extends GenericAbstractController {

    @Autowired
    private MenuService menuService;

    @Autowired
    private DirectChatService directChatService;

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
    public ModelAndView addNode(@Validated(value = AddNode.class) MenuDTO jsTreeHibernateDTO,
                                BindingResult bindingResult, ModelMap model) throws Exception {
        if (bindingResult.hasErrors())
            throw new RuntimeException();

        //신규 메뉴가 추가됬다.
        DirectChatDTO searchNode = new DirectChatDTO();
        Long rootNodeCID =new Long(2);
        searchNode.setC_id(rootNodeCID); // 2번 노드 밑으로 붙일 것이다.
        DirectChatDTO rootDirectChatDTO = directChatService.getNode(searchNode);
        //DirectChat의 2번 노드 밑에 첫번째 채팅을 입력한다.
        Long childCount = rootDirectChatDTO.getC_right() - rootDirectChatDTO.getC_left() - 1;
        if(childCount < 1){
            throw new RuntimeException("jsTree is index broken");
        }else{
            Long nodeSize = new Long(2);
            childCount = childCount / nodeSize;
        }

        DirectChatDTO insertFirstDirectChatNode = new DirectChatDTO();
        logger.error("----------------" + childCount +"," + rootNodeCID);
        insertFirstDirectChatNode.setC_position(childCount);
        //insertFirstDirectChatNode.setC_parentid(rootNodeCID);
        insertFirstDirectChatNode.setRef(rootNodeCID);
        insertFirstDirectChatNode.setC_title("first directchat contents" + DateUtils.getCurrentDay());
        insertFirstDirectChatNode.setC_type("default");
        DirectChatDTO insertedDTO = directChatService.addNode(insertFirstDirectChatNode);

        final HashSet<DirectChatDTO> directChatDTOs = new HashSet<DirectChatDTO>();
        directChatDTOs.add(insertedDTO);
        jsTreeHibernateDTO.setDirectChatDTOs(directChatDTOs);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", menuService.addNode(jsTreeHibernateDTO));

        //후처리.

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
    public ModelAndView removeNode(@Validated(value = RemoveNode.class) MenuDTO jsTreeHibernateDTO,
                                   BindingResult bindingResult, ModelMap model) throws Exception {
        if (bindingResult.hasErrors())
            throw new RuntimeException();

        jsTreeHibernateDTO.setStatus(menuService.removeNode(jsTreeHibernateDTO));
        setJsonDefaultSetting(jsTreeHibernateDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", jsTreeHibernateDTO);
        return modelAndView;
    }

    private void setJsonDefaultSetting(MenuDTO jsTreeHibernateDTO) {
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
    public ModelAndView alterNode(@Validated(value = AlterNode.class) MenuDTO jsTreeHibernateDTO,
                                  BindingResult bindingResult, ModelMap model) throws Exception {
        if (bindingResult.hasErrors()){
            throw new RuntimeException();
        }

        jsTreeHibernateDTO.setC_title(Util_TitleChecker.StringReplace(jsTreeHibernateDTO.getC_title()));

        jsTreeHibernateDTO.setStatus(menuService.alterNode(jsTreeHibernateDTO));
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
    public ModelAndView alterNodeType(@Validated(value = AlterNodeType.class) MenuDTO jsTreeHibernateDTO,
                                      BindingResult bindingResult, ModelMap model) throws Exception {
        if (bindingResult.hasErrors())
            throw new RuntimeException();

        menuService.alterNodeType(jsTreeHibernateDTO);
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
    public ModelAndView moveNode(@Validated(value = MoveNode.class) MenuDTO jsTreeHibernateDTO,
                                 BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
        if (bindingResult.hasErrors())
            throw new RuntimeException();

        menuService.moveNode(jsTreeHibernateDTO, request);
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
