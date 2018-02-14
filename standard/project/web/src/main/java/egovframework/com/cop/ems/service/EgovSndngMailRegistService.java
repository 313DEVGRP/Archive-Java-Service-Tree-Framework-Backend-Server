package egovframework.com.cop.ems.service;

public interface EgovSndngMailRegistService {

	boolean insertSndngMail(SndngMailVO vo) throws Exception;

	public boolean trnsmitXmlData(SndngMailVO vo) throws Exception;

	public boolean recptnXmlData(String xml) throws Exception;
}
