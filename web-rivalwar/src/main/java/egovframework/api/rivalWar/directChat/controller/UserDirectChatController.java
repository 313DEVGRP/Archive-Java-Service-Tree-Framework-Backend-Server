package egovframework.api.rivalWar.directChat.controller;

import egovframework.api.rivalWar.directChat.service.DirectChatService;
import egovframework.api.rivalWar.directChat.vo.DirectChatDTO;
import egovframework.api.rivalWar.menu.service.MenuService;
import egovframework.api.rivalWar.menu.vo.MenuDTO;
import egovframework.com.ext.jstree.springiBatis.core.validation.group.AddNode;
import egovframework.com.ext.jstree.support.mvc.GenericAbstractController;
import egovframework.com.ext.jstree.support.util.DateUtils;
import egovframework.com.ext.jstree.support.util.ParameterParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping(value = {"/api/rivalWar/ROLE_USER/directChat"})
public class UserDirectChatController extends GenericAbstractController {

    @Autowired
    private DirectChatService directChatService;

    @Autowired
    private MenuService menuService;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @ResponseBody
    @RequestMapping(value = "/addNode.do")
    public ModelAndView addNode(@Validated(value = AddNode.class) DirectChatDTO jsTreeHibernateDTO, BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {

        if (bindingResult.hasErrors()){
            throw new RuntimeException();
        }

        //user 권한 체크할 필요없음. 필터 처리되 있음.
        jsTreeHibernateDTO.setUserId(getUser());
        jsTreeHibernateDTO.setLikeCount(new Long(0));
        jsTreeHibernateDTO.setHateCount(new Long(0));
        jsTreeHibernateDTO.setReportYN("N");
        jsTreeHibernateDTO.setHiddenYN("N");
        jsTreeHibernateDTO.setUserLevel(new Long(0));
        jsTreeHibernateDTO.setWriteTime(DateUtils.getCurrentDay().toString());

        ParameterParser parser = new ParameterParser(request);

        //menu setting
        MenuDTO searchMenuDTO = new MenuDTO();
        if(null == parser.get("menuCId")){
            Long menuCId = new Long(3);
            searchMenuDTO.setWhere("c_parentid", menuCId);
            List<MenuDTO> list = menuService.getChildNode(searchMenuDTO);
            MenuDTO recentMenuNode = list.get(0);
            jsTreeHibernateDTO.setMenuDTO(recentMenuNode);
        }else{
            searchMenuDTO.setC_id(parser.getLong("menuCId"));
            MenuDTO targetMenuNode = menuService.getNode(searchMenuDTO);
            jsTreeHibernateDTO.setMenuDTO(targetMenuNode);
        }

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", directChatService.addNode(jsTreeHibernateDTO));

        return modelAndView;
    }

    private String getUser() {
        String userName = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails) {
            userName = ((UserDetails) principal).getUsername();
        } else {
            userName = principal.toString();
        }
        return userName;
    }

}
