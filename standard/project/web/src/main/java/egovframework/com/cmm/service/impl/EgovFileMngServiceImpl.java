package egovframework.com.cmm.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.FileVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("EgovFileMngService")
public class EgovFileMngServiceImpl extends EgovAbstractServiceImpl implements EgovFileMngService {

	@Resource(name = "FileManageDAO")
	private FileManageDAO fileMngDAO;

	public void deleteFileInfs(List<?> fvoList) throws Exception {
		fileMngDAO.deleteFileInfs(fvoList);
	}

	public String insertFileInf(FileVO fvo) throws Exception {
		String atchFileId = fvo.getAtchFileId();

		fileMngDAO.insertFileInf(fvo);

		return atchFileId;
	}

	public String insertFileInfs(List<?> fvoList) throws Exception {
		String atchFileId = "";

		if (fvoList.size() != 0) {
			atchFileId = fileMngDAO.insertFileInfs(fvoList);
		}
		if (atchFileId == "") {
			atchFileId = null;
		}
		return atchFileId;
	}

	public List<FileVO> selectFileInfs(FileVO fvo) throws Exception {
		return fileMngDAO.selectFileInfs(fvo);
	}

	public void updateFileInfs(List<?> fvoList) throws Exception {
		//Delete & Insert
		fileMngDAO.updateFileInfs(fvoList);
	}

	public void deleteFileInf(FileVO fvo) throws Exception {
		fileMngDAO.deleteFileInf(fvo);
	}

	public FileVO selectFileInf(FileVO fvo) throws Exception {
		return fileMngDAO.selectFileInf(fvo);
	}

	public int getMaxFileSN(FileVO fvo) throws Exception {
		return fileMngDAO.getMaxFileSN(fvo);
	}

	public void deleteAllFileInf(FileVO fvo) throws Exception {
		fileMngDAO.deleteAllFileInf(fvo);
	}

	public Map<String, Object> selectFileListByFileNm(FileVO fvo) throws Exception {
		List<FileVO> result = fileMngDAO.selectFileListByFileNm(fvo);
		int cnt = fileMngDAO.selectFileListCntByFileNm(fvo);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}

	public List<FileVO> selectImageFileList(FileVO vo) throws Exception {
		return fileMngDAO.selectImageFileList(vo);
	}
}
