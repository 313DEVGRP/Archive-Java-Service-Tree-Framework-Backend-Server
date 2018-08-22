package egovframework.com.jstree.springDWR.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;

import egovframework.com.ext.jstree.springDWR.domain.User;
import egovframework.com.ext.jstree.springDWR.util.Global;
import org.directwebremoting.Browser;
import org.directwebremoting.ScriptSessions;
import org.directwebremoting.WebContextFactory;
import org.directwebremoting.annotations.RemoteProxy;
import org.directwebremoting.spring.SpringCreator;
import org.springframework.stereotype.Service;

@RemoteProxy(creator = SpringCreator.class, name = "Chat")
@Service
public class Chat {

	public Chat() {
		Global.chat = this;
	}

	public String sendMessage(final String message) {
		final String username;
		try {
			username = (String) WebContextFactory.get().getScriptSession()
					.getAttribute(Global.USERNAME);
		} catch (Exception e) {
			return Global.ERROR;
		}

		if (null == username) {
			return Global.ERROR;
		}

		final String time = time();
		Browser.withAllSessions(new Runnable() {
			@Override
			public void run() {
				ScriptSessions.addFunctionCall("addMessage", username, time, message);
			}
		});

		return Global.SUCCESS;
	}

	public static Set<User> getOnlineSet() {
		return Global.onlineSet;
	}

	public void updateOnlineList() {
		Browser.withCurrentPage(new Runnable() {
			@Override
			public void run() {
				ScriptSessions.addFunctionCall("updateOnlineList", Global.onlineSet);
			}
		});
	}

	public String login(final String username) {
		if (Global.onlineSet.contains(new User(username)) || "".equals(username)) {
			return Global.ERROR;
		} else {
			Global.onlineSet.add(new User(username, time()));
			updateOnlineList();
			WebContextFactory.get().getScriptSession().setAttribute(Global.USERNAME, username);
			return Global.SUCCESS;
		}
	}

	public String logout(final String username) {
		if (!Global.onlineSet.contains(new User(username))) {
			return Global.ERROR;
		} else {
			Global.onlineSet.remove(new User(username));
			updateOnlineList();
			WebContextFactory.get().getScriptSession().invalidate();
			return Global.SUCCESS;
		}
	}

	private String time() {
		return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
	}

}
