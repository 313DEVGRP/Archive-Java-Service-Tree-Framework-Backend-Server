package egovframework.com.jstree.support.util;


import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.util.WebUtils;

@Service
public class MessageSupport {
    @Autowired
    private MessageSource messageSource;
    
    public String getMessage(String code, Object[] args, String defaultMessage, Locale locale) {
        return messageSource.getMessage(code, args, defaultMessage, locale);
    }
    
    public String getMessage(String code, Object[] args, String defaultMessage, HttpServletRequest request) {
        Locale locale = (Locale) WebUtils.getSessionAttribute(request, SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
        return getMessage(code, args, defaultMessage, locale);
    }
    
    public String getMessage(String code, String defaultMessage, Locale locale) {
        return getMessage(code, null, defaultMessage, locale);
    }
    
    public String getMessage(String code, String defaultMessage, HttpServletRequest request) {
        Locale locale = (Locale) WebUtils.getSessionAttribute(request, SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
        return getMessage(code, null, defaultMessage, locale);
    }
    
    public MessageSource getMessageSource() {
        return this.messageSource;
    }
}
