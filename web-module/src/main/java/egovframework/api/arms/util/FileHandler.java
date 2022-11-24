package egovframework.api.arms.util;

import egovframework.api.arms.module_filerepository.model.FileRepositoryDTO;
import egovframework.api.arms.module_filerepository.service.FileRepository;
import egovframework.com.utl.fcc.service.EgovFileUploadUtil;
import egovframework.com.utl.fcc.service.EgovFormBasedFileVo;
import org.slf4j.Logger;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import sun.util.logging.PlatformLogger;

import java.util.HashMap;
import java.util.List;

public class FileHandler {

    public static HashMap<String, List<EgovFormBasedFileVo>> upload(MultipartHttpServletRequest multiRequest,
                                                                    long fileIdLink,
                                                                    String c_title,
                                                                    FileRepository fileRepository,
                                                                    Logger logger) throws Exception {

        logger.info("FileHandler :: upload :: fileIdLink -> " + fileIdLink + " , c_title -> " + c_title);

        // Spring multipartResolver 미사용 시 (commons-fileupload 활용)
        //List<EgovFormBasedFileVo> list = EgovFormBasedFileUtil.uploadFiles(request, uploadDir, maxFileSize);

        // Spring multipartResolver 사용시
        PropertiesReader propertiesReader = new PropertiesReader("egovframework/egovProps/globals.properties");
        String uploadDir = propertiesReader.getProperty("Globals.fileStorePath");
        long maxFileSize = new Long(313);
        List<EgovFormBasedFileVo> list = EgovFileUploadUtil.uploadFiles(multiRequest, uploadDir, maxFileSize);

        for (EgovFormBasedFileVo egovFormBasedFileVo : list) {

            FileRepositoryDTO fileRepositoryDTO = new FileRepositoryDTO();
            fileRepositoryDTO.setFileName(egovFormBasedFileVo.getFileName());
            fileRepositoryDTO.setContentType(egovFormBasedFileVo.getContentType());
            fileRepositoryDTO.setServerSubPath(egovFormBasedFileVo.getServerSubPath());
            fileRepositoryDTO.setPhysicalName(egovFormBasedFileVo.getPhysicalName());
            fileRepositoryDTO.setSize(egovFormBasedFileVo.getSize());
            fileRepositoryDTO.setName(egovFormBasedFileVo.getName());

            fileRepositoryDTO.setUrl(egovFormBasedFileVo.getUrl());
            //TODO: 썸네일 개발 필요
            fileRepositoryDTO.setThumbnailUrl(egovFormBasedFileVo.getThumbnailUrl());

            fileRepositoryDTO.setDelete_url(egovFormBasedFileVo.getDelete_url());
            fileRepositoryDTO.setDelete_type(egovFormBasedFileVo.getDelete_type());
            fileRepositoryDTO.setFileIdLink(fileIdLink);

            fileRepositoryDTO.setRef(new Long(2));
            fileRepositoryDTO.setC_title(c_title);
            fileRepositoryDTO.setC_type("default");

            FileRepositoryDTO returnFileRepositoryDTO = fileRepository.addNode(fileRepositoryDTO);
            //delete 파라미터인 id 값을 업데이트 치기 위해서.
            fileRepositoryDTO.setUrl("/auth-user/api/arms/fileRepository" + "/downloadFileByNode/" + returnFileRepositoryDTO.getId());
            fileRepositoryDTO.setThumbnailUrl("/auth-user/api/arms/fileRepository" + "/thumbnailUrlFileToNode/" + returnFileRepositoryDTO.getId());
            fileRepositoryDTO.setDelete_url("/auth-user/api/arms/fileRepository" + "/deleteFileByNode/" + returnFileRepositoryDTO.getId());

            fileRepository.updateNode(fileRepositoryDTO);

            egovFormBasedFileVo.setUrl("/auth-user/api/arms/fileRepository" + "/downloadFileByNode/" + returnFileRepositoryDTO.getId());
            egovFormBasedFileVo.setThumbnailUrl("/auth-user/api/arms/fileRepository" + "/thumbnailUrlFileToNode/" + returnFileRepositoryDTO.getId());
            egovFormBasedFileVo.setDelete_url("/auth-user/api/arms/fileRepository" + "/deleteFileByNode/" + returnFileRepositoryDTO.getId());

        }

        HashMap<String, List<EgovFormBasedFileVo>> map = new HashMap();
        map.put("files", list);
        return map;
    }
}
