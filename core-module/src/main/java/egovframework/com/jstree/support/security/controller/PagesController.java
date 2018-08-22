package egovframework.com.jstree.support.security.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class PagesController {

    @RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
        ModelAndView model = new ModelAndView();
        model.addObject("title", "Login Page");
        model.setViewName("egovframework/com/ext/jstree/support/security/login");
        return model;
    }

    @RequestMapping(value = {"/userpage"}, method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView userPage() {

        ModelAndView model = new ModelAndView();
        model.addObject("title", "Spring security social login Hello World");
        model.addObject("user", getUser());
        model.setViewName("egovframework/com/ext/jstree/support/security/user");
        return model;
    }

    @RequestMapping(value = {"/accessdenied"}, method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView accessDeniedPage() {
        ModelAndView model = new ModelAndView();
        model.addObject("message", "Either username or password is incorrect.");
        model.setViewName("egovframework/com/ext/jstree/support/security/accessdenied");
        return model;
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
