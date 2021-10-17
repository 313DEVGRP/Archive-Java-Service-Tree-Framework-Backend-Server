package egovframework.api.arms;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.annotation.ClassPathScanningCandidateComponentProvider;
import org.springframework.core.type.filter.AnnotationTypeFilter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * <pre>
 *    ******************************************************************************
 *    (C) 2013 - 2019 by 313 DEV GRP, Inc - All Rights Reserved
 *    Unauthorized copying of this file, via any medium is strictly prohibited
 *    Written by 313 developer group ( 313@313.co.kr ) , December 2013
 *    ******************************************************************************
 *
 *    메인 인덱스 컨트롤러이며, IncludeInfo 커스텀 어노테이션을 Controller 어노테이션을 기반으로 수집하여 json으로 제공한다.
 * </pre>
 *
 * @author 313 DEV GRP
 */
@Controller
public class EgovComIndexController implements ApplicationContextAware, InitializingBean {

    private ApplicationContext applicationContext;

    private static final Logger LOGGER = LoggerFactory.getLogger(EgovComIndexController.class);

    private static Map<String, String> includeInfoAnnotaion = Collections.emptyMap();

    public void afterPropertiesSet() throws Exception {}

    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext = applicationContext;
        findAnnotatedClasses("egovframework");
        LOGGER.info("EgovComIndexController setApplicationContext method has called!");
    }

    @ResponseBody
    @RequestMapping(value = "/index.do")
    public ModelAndView index(ModelMap model, HttpServletRequest request) throws Exception {

        ModelAndView modelview = new ModelAndView();
        modelview.setViewName("index");
        return modelview;
    }

    private ModelAndView getIndexModelAndView() {
        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", includeInfoAnnotaion);
        return modelAndView;
    }

    public void findAnnotatedClasses(String scanPackage) {
        ClassPathScanningCandidateComponentProvider provider = createComponentScanner();
        for (BeanDefinition beanDef : provider.findCandidateComponents(scanPackage)) {
            printMetadata(beanDef);
        }
    }

    private ClassPathScanningCandidateComponentProvider createComponentScanner() {
        // Don't pull default filters (@Component, etc.):
        ClassPathScanningCandidateComponentProvider provider
                = new ClassPathScanningCandidateComponentProvider(false);
        provider.addIncludeFilter(new AnnotationTypeFilter(Controller.class));
        return provider;
    }

    private void printMetadata(BeanDefinition beanDef) {
        try {
            Class<?> cl = Class.forName(beanDef.getBeanClassName());
            Method[] methods = cl.getMethods();
            System.out.println("metthod length ="+methods.length );
            for(Method method : methods){
                    includeInfoAnnotaion.put(beanDef.getBeanClassName(), method.getName());
            }

        } catch (Exception e) {
            System.err.println("Got exception: " + e.getMessage());
        }
    }
}