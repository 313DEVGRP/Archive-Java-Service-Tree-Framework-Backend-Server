package egovframework.com.utl.wed.filter;

import org.apache.commons.fileupload.FileItem;

public interface FileSaveManager {
    String saveFile(FileItem fileItem, String imageBaseDir, String imageDomain);
}

