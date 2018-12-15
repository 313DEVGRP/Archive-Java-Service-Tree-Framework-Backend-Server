package egovframework.com.cmm.service;

import java.util.List;
import java.util.Map;

public interface EgovFileMngService {

    public List<FileVO> selectFileInfs(FileVO fvo) throws Exception;

    public String insertFileInf(FileVO fvo) throws Exception;

    public String insertFileInfs(List<?> fvoList) throws Exception;

    public void updateFileInfs(List<?> fvoList) throws Exception;

    public void deleteFileInfs(List<?> fvoList) throws Exception;

    public void deleteFileInf(FileVO fvo) throws Exception;

    public FileVO selectFileInf(FileVO fvo) throws Exception;

    public int getMaxFileSN(FileVO fvo) throws Exception;

    public void deleteAllFileInf(FileVO fvo) throws Exception;

    public Map<String, Object> selectFileListByFileNm(FileVO fvo) throws Exception;

    public List<FileVO> selectImageFileList(FileVO vo) throws Exception;
}
