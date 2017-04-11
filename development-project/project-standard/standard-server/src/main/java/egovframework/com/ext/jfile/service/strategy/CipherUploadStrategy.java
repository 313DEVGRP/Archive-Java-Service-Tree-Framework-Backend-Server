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
package egovframework.com.ext.jfile.service.strategy;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

import egovframework.com.cmm.util.EgovResourceCloseHelper;
import egovframework.com.ext.jfile.GlobalVariables;
import egovframework.com.ext.jfile.exception.JFileException;
import egovframework.com.ext.jfile.security.service.CipherService;
import egovframework.com.ext.jfile.utils.SpringUtils;

import javax.crypto.BadPaddingException;
import javax.crypto.NoSuchPaddingException;

public class CipherUploadStrategy implements UploadStrategy {

	public void handle(InputStream in, OutputStream out) {
		try {
			CipherService service = (CipherService) SpringUtils.getBean(GlobalVariables.CIPHER_SERVICE_BEAN_NAME);
			service.encrypt(in, out);
		} catch (InvalidKeyException e) {
			throw new JFileException(e);
		} catch (NoSuchAlgorithmException e) {
			throw new JFileException(e);
		} catch (NoSuchPaddingException e) {
			throw new JFileException(e);
		} catch (BadPaddingException e) {
			throw new JFileException(e);
		} catch (InvalidKeySpecException e) {
			throw new JFileException(e);
		} catch (InvalidAlgorithmParameterException e) {
			throw new JFileException(e);
		} catch (IOException e) {
			throw new JFileException(e);
		} finally {
			EgovResourceCloseHelper.close(in, out);
		}
	}
}