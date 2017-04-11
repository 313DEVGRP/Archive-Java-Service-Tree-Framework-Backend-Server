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
package egovframework.com.ext.jfile.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import egovframework.com.cmm.util.EgovBasicLogger;
import egovframework.com.ext.jfile.GlobalVariables;
import egovframework.com.ext.jfile.security.service.CipherService;
import egovframework.com.ext.jfile.service.JFile;

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
 *   2013.12.19	표준프레임워크	공통컴포넌트 추가 적용 (패키지 변경 및 jazzlib 사용 제외)
 *
 * </pre>
 */
public class ZipUtils {

	private static final byte[] buf = new byte[1024];

	public static void createZipJFile(JFile[] targetFiles, OutputStream os) throws Exception {

		ZipOutputStream zipOs = null;

		try {
			zipOs = new ZipOutputStream(os);

			if (targetFiles != null) {
				for (int i = 0; i < targetFiles.length; i++) {
					FileInputStream in = null;

					try {
						in = new FileInputStream(new File(targetFiles[i].getPath()));

						zipOs.putNextEntry(new ZipEntry(targetFiles[i].getOriginalFileName()));
						if ("true".equalsIgnoreCase(targetFiles[i].getUseSecurity())) {
							CipherService service = (CipherService) SpringUtils.getBean(GlobalVariables.CIPHER_SERVICE_BEAN_NAME);
							service.decryptForZipFile(in, zipOs);
						} else {
							int data;
							while ((data = in.read(buf)) > 0) {
								zipOs.write(buf, 0, data);
							}
						}
						zipOs.closeEntry();

					} finally {
						if (in != null) {
							try {
								in.close();
							} catch (IOException ignore) {
								EgovBasicLogger.ignore("IOExcepiton", ignore);
							}
						}
					}
				}
			}
		} finally {
			if (zipOs != null) {
				try {
					zipOs.close();
				} catch (IOException ignore) {
					EgovBasicLogger.ignore("IOExcepiton", ignore);
				}
			}
			if (os != null) {
				try {
					os.close();
				} catch (IOException ignore) {
					EgovBasicLogger.ignore("IOExcepiton", ignore);
				}
			}
		}
	}
}