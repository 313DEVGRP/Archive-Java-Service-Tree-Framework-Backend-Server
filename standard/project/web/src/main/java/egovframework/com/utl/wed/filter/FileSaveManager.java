package egovframework.com.utl.wed.filter;

import org.apache.commons.fileupload.FileItem;

public interface FileSaveManager {
    /**
     *
     * @param fileItem
     * @param imageBaseDir 기본 이미지 저장 디렉토리. 이 디렉토리 아래로 모든 파일을 넣어도 되고, 폴더를 구분하여 넣어도 된다. 이 파라미터에는 마지막 디렉토리 구분자는 포함되지 않는다.
     * @param imageDomain 이미지 태그에 들어갈 기본이 되는 URL. 
     * 		"http://image.my.com" 과 같은 도메인이 들어갈 수도 있고, "/ckimage" 같은 상대 경로가 들어갈 수도 있다.
     *         이 파라미터는 생략해도 된다.
     * @return 이미지 파일을 액세스 할 수 있는 URL 을 반환한다. 반환된 URL 은 ckeditor 에게 전달되어 즉시 사용자 브라우져에 이미지가 나타나게 된다.
     */
    String saveFile(FileItem fileItem, String imageBaseDir, String imageDomain);
}

