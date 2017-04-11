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
package egovframework.com.ext.jfile.security.service;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

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
 *
 * </pre>
 */
public interface CipherService {
	
	/**
	 * byte[] 타입의 데이타를 암호화 한다.
	 * @param data 데이타.
	 * @return byte[] 암호화 된 데이타.
	 * @throws NoSuchAlgorithmException 암호화 알고리즘을 찾을 수 없을때 예외 처리
	 * @throws InvalidKeyException 규칙에 맞지 않은 key 일때 예외 처리
	 * @throws NoSuchPaddingException 패딩 정보를 찾을 수 없을때 예외 처리
	 * @throws IOException 입/출력 예외 처리
	 * @throws InvalidKeySpecException 규칙에 맞지 않은 keySpec 일때 예외 처리
	 * @throws IllegalBlockSizeException 규칙에 맞지 않은 블럭사이즈 일때 예외 처리
	 * @throws BadPaddingException 잘못된 패딩 일때 예외처리
	 * @throws InvalidAlgorithmParameterException 유효하지 않은 알고리즘 파라미터 일때 예외처리
	 */
	public byte[] encrypt(byte[] data) throws NoSuchAlgorithmException,
			InvalidKeyException, NoSuchPaddingException, IOException,
			InvalidKeySpecException, IllegalBlockSizeException,
			BadPaddingException, InvalidAlgorithmParameterException;

	/**
	 * byte[] 타입의 데이타를 복호화 한다.
	 * @param data 데이타. 
	 * @return byte[] 암호화 된 데이타.
	 * @throws NoSuchAlgorithmException 암호화 알고리즘을 찾을 수 없을때 예외 처리
	 * @throws InvalidKeyException 규칙에 맞지 않은 key 일때 예외 처리
	 * @throws NoSuchPaddingException 패딩 정보를 찾을 수 없을때 예외 처리
	 * @throws IOException 입/출력 예외 처리
	 * @throws InvalidKeySpecException 규칙에 맞지 않은 keySpec 일때 예외 처리
	 * @throws IllegalBlockSizeException 규칙에 맞지 않은 블럭사이즈 일때 예외 처리
	 * @throws BadPaddingException 잘못된 패딩 일때 예외처리
	 * @throws InvalidAlgorithmParameterException 유효하지 않은 알고리즘 파라미터 일때 예외처리
	 */
	public byte[] decrypt(byte[] data) throws InvalidKeyException,
			NoSuchAlgorithmException, InvalidKeySpecException,
			NoSuchPaddingException, IllegalBlockSizeException,
			BadPaddingException, IOException,
			InvalidAlgorithmParameterException;

	/**
	 * 입력스트림을 전달 받아 암호화 하여 출력스트림으로 반환한다.
	 * @param in 입력스트림
	 * @param out 출력스트림
	 * @throws NoSuchAlgorithmException 암호화 알고리즘을 찾을 수 없을때 예외 처리
	 * @throws InvalidKeyException 규칙에 맞지 않은 key 일때 예외 처리
	 * @throws NoSuchPaddingException 패딩 정보를 찾을 수 없을때 예외 처리
	 * @throws IOException 입/출력 예외 처리
	 * @throws BadPaddingException 잘못된 패딩 일때 예외처리
	 * @throws InvalidKeySpecException 규칙에 맞지 않은 keySpec 일때 예외 처리
	 * @throws InvalidAlgorithmParameterException 유효하지 않은 알고리즘 파라미터 일때 예외처리
	 */
	public void encrypt(InputStream in, OutputStream out)
			throws NoSuchAlgorithmException, InvalidKeyException,
			NoSuchPaddingException, IOException, BadPaddingException,
			InvalidKeySpecException, InvalidAlgorithmParameterException;

	/**
	 * 입력스트림을 전달 받아 복호화 하여 출력스트림으로 반환한다.
	 * @param in 입력스트림
	 * @param out 출력스트림
	 * @throws NoSuchAlgorithmException 암호화 알고리즘을 찾을 수 없을때 예외 처리
	 * @throws InvalidKeyException 규칙에 맞지 않은 key 일때 예외 처리
	 * @throws IOException 입/출력 예외 처리
	 * @throws IllegalBlockSizeException 규칙에 맞지 않은 블럭사이즈 일때 예외 처리
	 * @throws NoSuchPaddingException 패딩 정보를 찾을 수 없을때 예외 처리
	 * @throws BadPaddingException 잘못된 패딩 일때 예외처리
	 * @throws InvalidKeySpecException 규칙에 맞지 않은 keySpec 일때 예외 처리
	 * @throws InvalidAlgorithmParameterException 유효하지 않은 알고리즘 파라미터 일때 예외처리
	 */
	public void decrypt(InputStream in, OutputStream out)
			throws NoSuchAlgorithmException, InvalidKeyException, IOException,
			IllegalBlockSizeException, NoSuchPaddingException,
			BadPaddingException, InvalidKeySpecException,
			InvalidAlgorithmParameterException;

	/**
	 * 암호화된 파일을 복호화 한 후 ZIP 으로 압축하여 반환한다. 
	 * @param in 입력스트림
	 * @param out 출력스트림
	 * @throws NoSuchAlgorithmException 암호화 알고리즘을 찾을 수 없을때 예외 처리
	 * @throws InvalidKeyException 규칙에 맞지 않은 key 일때 예외 처리
	 * @throws IOException 입/출력 예외 처리
	 * @throws IllegalBlockSizeException 규칙에 맞지 않은 블럭사이즈 일때 예외 처리
	 * @throws NoSuchPaddingException 패딩 정보를 찾을 수 없을때 예외 처리
	 * @throws BadPaddingException 잘못된 패딩 일때 예외처리
	 * @throws InvalidKeySpecException 규칙에 맞지 않은 keySpec 일때 예외 처리
	 * @throws InvalidAlgorithmParameterException 유효하지 않은 알고리즘 파라미터 일때 예외처리
	 */
	public void decryptForZipFile(InputStream in, OutputStream out)
			throws NoSuchAlgorithmException, InvalidKeyException, IOException,
			IllegalBlockSizeException, NoSuchPaddingException,
			BadPaddingException, InvalidKeySpecException,
			InvalidAlgorithmParameterException;
}
