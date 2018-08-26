package egovframework.com.cmm.exception;

import egovframework.rte.fdl.cmmn.exception.BaseException;


public class EgovXssException  extends BaseException {
    
	private static final long serialVersionUID = 1L;
	 
	public EgovXssException(String message, String messageKey) {
		this.messageKey = messageKey;
		this.messageParameters = null;
		this.message = message;
		this.wrappedException = null;
	}

}
