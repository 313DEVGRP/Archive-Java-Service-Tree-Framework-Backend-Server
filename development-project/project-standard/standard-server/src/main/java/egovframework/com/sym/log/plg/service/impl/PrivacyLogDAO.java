package egovframework.com.sym.log.plg.service.impl;

import java.util.List;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.sym.log.plg.service.PrivacyLog;

import org.springframework.stereotype.Repository;

@Repository("privacyLogDAO")
public class PrivacyLogDAO extends EgovComAbstractDAO {

	public void insertPrivacyLog(PrivacyLog privacyLog) {
		insert("PrivacyLogDAO.insertPrivacyLog", privacyLog);
	}

	@SuppressWarnings("unchecked")
	public List<PrivacyLog> selectPrivacyLogList(PrivacyLog privacyLog) {
		return (List<PrivacyLog>) list("PrivacyLogDAO.selectPrivacyLogList", privacyLog);
	}
	
	public int selectPrivacyLogListCount(PrivacyLog privacyLog) {
		return (Integer)select("PrivacyLogDAO.selectPrivacyLogListCount", privacyLog);
	}

	public PrivacyLog selectPrivacyLog(PrivacyLog privacyLog) {
		return (PrivacyLog) select("PrivacyLogDAO.selectPrivacyLog", privacyLog);
	}

}
