package egovframework.com.cmm;

import egovframework.rte.fdl.cmmn.exception.handler.ExceptionHandler;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class EgovComExcepHndlr implements ExceptionHandler {

	private static final Logger LOGGER = LoggerFactory.getLogger(EgovComExcepHndlr.class);

    /*
    @Resource(name = "otherSSLMailSender")
    private SimpleSSLMail mailSender;
     */
    /**
     * 발생된 Exception을 처리한다.
     */
    public void occur(Exception ex, String packageName) {
    	//log.debug(" EgovServiceExceptionHandler run...............");
    	
    	/*
		try {
			mailSender. send(ex, packageName);
			log.debug(" sending a alert mail  is completed ");		
		} catch (Exception e) {
			LOGGER.error(packageName, ex);
		}
		*/
		
    	LOGGER.error(packageName, ex);
	}
}
