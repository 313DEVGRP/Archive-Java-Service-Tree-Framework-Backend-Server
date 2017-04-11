/*
 * eGovFrame JFile
 * Copyright The eGovFrame Open Community (http://open.egovframe.go.kr)).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * @author 정호열 커미터(표준프레임워크 오픈커뮤니티 리더)
 */
package egovframework.com.ext.jfile.sample;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import egovframework.com.cmm.util.EgovBasicLogger;
import egovframework.com.cmm.util.EgovResourceCloseHelper;
import egovframework.com.ext.jfile.service.FileUploadCompletedEventListener;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

/**
 *  클래스
 * @author 정호열
 * @since 2010.10.17
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일        수정자       수정내용
 *  -------       --------    ---------------------------
 *   2010.10.17   정호열       최초 생성
 *   2013.12.19	표준프레임워크	공통컴포넌트 추가 적용 (패키지 변경)
 * </pre>
 */
public class SampleFileUploadCluster implements FileUploadCompletedEventListener {

	private static final Logger LOGGER = LoggerFactory.getLogger(SampleFileUploadCluster.class);

	public void uploadCompleted(String fileId, String sourceRepositoryPath, String maskingFileName, String originalFileName) {
		LOGGER.debug("SampleUploadCluster.process called");
		FTPClient ftp = new FTPClient();
		OutputStream out = null;
		File file = new File(sourceRepositoryPath + "/" + maskingFileName);
		FileInputStream fin = null;
		BufferedInputStream bin = null;
		String storeFileName = null;
		String server = "서버접속IP"; //프로퍼티에 설정하고 읽어오게 한다. ex) 210.25.3.21
		try {
			ftp.connect(server);
			if (FTPReply.isPositiveCompletion(ftp.getReplyCode())) {
				ftp.setFileType(FTPClient.BINARY_FILE_TYPE);
				storeFileName = maskingFileName + originalFileName.substring(originalFileName.lastIndexOf("."), originalFileName.length());
				fin = new FileInputStream(file);
				bin = new BufferedInputStream(fin);
				ftp.login("testId", "testPassword" + server.substring(server.lastIndexOf(".") + 1, server.length()));
				LOGGER.debug(server + " connect success !!! ");
				ftp.changeWorkingDirectory("/testdir1/testsubdir2/testupload/");
				out = ftp.storeFileStream(storeFileName);
				FileCopyUtils.copy(fin, out);
				LOGGER.debug(" cluster success !!! ");
			} else {
				ftp.disconnect();
			}
		} catch (Exception e) {
			LOGGER.debug(e.getMessage());
		} finally {
			EgovResourceCloseHelper.close(out, bin);
			try {
				ftp.logout();
			} catch (IOException ignore) {
				EgovBasicLogger.ignore("FTP logout error", ignore);
			}
		}
	}
}