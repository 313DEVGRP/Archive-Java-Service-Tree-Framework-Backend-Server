package egovframework.com.utl.fcc.service;

import java.io.Serializable;

@SuppressWarnings("serial")
public class EgovFormBasedFileVo implements Serializable {
    /** 파일명 */
    private String fileName = "";
    /** ContextType */
    private String contentType = "";
    /** 하위 디렉토리 지정 */
    private String serverSubPath = "";
    /** 물리적 파일명 */
    private String physicalName = "";
    /** 파일 사이즈 */
    private long size = 0L;
    
    public String getFileName() {
        return fileName;
    }
    public void setFileName(String fileName) {
        this.fileName = fileName;
    }
    public String getContentType() {
        return contentType;
    }
    public void setContentType(String contentType) {
        this.contentType = contentType;
    }
    public String getServerSubPath() {
        return serverSubPath;
    }
    public void setServerSubPath(String serverSubPath) {
        this.serverSubPath = serverSubPath;
    }
    public String getPhysicalName() {
        return physicalName;
    }
    public void setPhysicalName(String physicalName) {
        this.physicalName = physicalName;
    }
    public long getSize() {
        return size;
    }
    public void setSize(long size) {
        this.size = size;
    }
}
