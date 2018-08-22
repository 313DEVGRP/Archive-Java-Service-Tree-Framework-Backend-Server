package egovframework.com.jstree.springDWR.util;

import egovframework.com.ext.jstree.springDWR.util.*;
import org.directwebremoting.event.ScriptSessionEvent;
import org.directwebremoting.event.ScriptSessionListener;
import org.directwebremoting.impl.DefaultScriptSessionManager;

public class ScriptSessionManager extends DefaultScriptSessionManager {

	public ScriptSessionManager() {
		super();
		addScriptSessionListener(new ScriptSessionListener() {

			@Override
			public void sessionDestroyed(ScriptSessionEvent ev) {
				egovframework.com.ext.jstree.springDWR.util.Global.chat.logout((String) ev.getSession().getAttribute(egovframework.com.ext.jstree.springDWR.util.Global.USERNAME));
			}

			@Override
			public void sessionCreated(ScriptSessionEvent ev) {
				System.out.println("springDWR Chat Session Create :" + ev.getSession().getAttribute(egovframework.com.ext.jstree.springDWR.util.Global.USERNAME));
			}
		});
	}

}
