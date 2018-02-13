package egovframework.com.utl.slm;

import java.util.Enumeration;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;

public class EgovMultiLoginPreventor {
	
	public static ConcurrentHashMap<String, HttpSession> loginUsers = new ConcurrentHashMap<String, HttpSession>();

	/**
	 * 사용자의 로그인 아이디로 생성된 세션이 있는지를 확인한다
	 * */
	public static boolean findByLoginId(String loginId) {
		return loginUsers.containsKey(loginId);
	}

	/**
	 * 사용자의 로그인 아이디로 이미 존재하는 세션을 무효화한다
	 * */
	public static void invalidateByLoginId(String loginId) {
		Enumeration<String> e = loginUsers.keys();
		while (e.hasMoreElements()) {
			String key = (String) e.nextElement();
			if (key.equals(loginId)) {
				loginUsers.get(key).invalidate();
			}
		}
	}
}
