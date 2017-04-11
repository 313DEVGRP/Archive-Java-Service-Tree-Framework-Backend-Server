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
import java.security.Key;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;

import egovframework.com.ext.jfile.security.JCrypto;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.CipherOutputStream;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import javax.crypto.spec.DESedeKeySpec;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;

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
 *   2013.12.19	표준프레임워크	공통컴포넌트 추가 적용 (패키지 변경 및 sun.misc 패키지 사용 제외)
 *
 * </pre>
 */
public class CipherServiceImpl implements CipherService {
	
	/**
	 * 암호화 정보객체
	 */
	private JCrypto jcrypto;

	/**
	 * 암호화 정보객체를 전달받는다..
	 * @param jcrypto 암호화 정보객체
	 */
	public void setJcrypto(JCrypto jcrypto) {
		this.jcrypto = jcrypto;
	}

	/**
	 * 암호화 객체를 얻는다.
	 * @return Cipher 암호화 객체.
	 * @throws NoSuchAlgorithmException 알고리즘을 찾을 수 없을때 예외 처리.
	 * @throws NoSuchPaddingException 패딩 정보를 찾을 수 없을때 예외 처리.
	 */
	private Cipher getCipherInstance() throws NoSuchAlgorithmException,
			NoSuchPaddingException {
		Cipher cipher = Cipher.getInstance(this.jcrypto.getAlgorithm());
		return cipher;
	}

	/**
	 * 암호화 키를 생성한다.
	 * @param keyAlgorithm 키 알고리즘.
	 * @param algorithm 알고리즘.
	 * @param keyData 키 데이타.
	 * @return Key 암호화 키.
	 * @throws NoSuchAlgorithmException 알고리즘 정보를 찾을 수 없을때 예외 처리.
	 * @throws InvalidKeyException 유효하지 않은 key 일때 예외 처리
	 * @throws InvalidKeySpecException 유효하지 않은 keySpec 일때 예외 처리
	 */
	private static Key generateKey(String keyAlgorithm, String algorithm,
			byte[] keyData) throws NoSuchAlgorithmException,
			InvalidKeyException, InvalidKeySpecException {
		if (keyAlgorithm == null || "".equals(keyAlgorithm))
			throw new NoSuchAlgorithmException("algorithm is nessary");
		String upper = keyAlgorithm.toUpperCase();
		if ("DES".equals(upper)) {
			KeySpec keySpec = new DESKeySpec(keyData);
			SecretKeyFactory secretKeyFactory = SecretKeyFactory.getInstance(keyAlgorithm);

			SecretKey secretKey = secretKeyFactory.generateSecret(keySpec);
			return secretKey;

		} else if (upper.indexOf("DESEDE") > -1
				|| upper.indexOf("TRIPLEDES") > -1) {
			KeySpec keySpec = new DESedeKeySpec(keyData);

			SecretKeyFactory secretKeyFactory = SecretKeyFactory.getInstance(keyAlgorithm);
			SecretKey secretKey = secretKeyFactory.generateSecret(keySpec);
			return secretKey;
		} else {
			SecretKeySpec keySpec = new SecretKeySpec(keyData, keyAlgorithm);
			return keySpec;
		}
	}

	public byte[] encrypt(byte[] data) throws NoSuchAlgorithmException,
			InvalidKeyException, NoSuchPaddingException, IOException,
			InvalidKeySpecException, IllegalBlockSizeException,
			BadPaddingException, InvalidAlgorithmParameterException {
		Cipher cipher = getCipherInstance();

		if (JCryptoHelper.isNecessaryIvBytes(this.jcrypto.getAlgorithm())) {
			IvParameterSpec ivParameterSpec = new IvParameterSpec(JCryptoHelper.DEFAULT_IV_BYTES);
			cipher.init(Cipher.ENCRYPT_MODE,generateKey(
					JCryptoHelper.getKeyAlgorithm(this.jcrypto.getAlgorithm()),this.jcrypto.getAlgorithm(), this.jcrypto.getKeyBytes()), ivParameterSpec);
		} else {
			cipher.init(Cipher.ENCRYPT_MODE,generateKey(
					JCryptoHelper.getKeyAlgorithm(this.jcrypto.getAlgorithm()),this.jcrypto.getAlgorithm(), this.jcrypto.getKeyBytes()));
		}
		if (jcrypto.isApplyBase64()) {
			//sun.misc.BASE64Encoder encoder = new sun.misc.BASE64Encoder();
			//return encoder.encode(cipher.doFinal(data)).getBytes();
			return Base64.encodeBase64(cipher.doFinal(data));
			
		} else {
			return cipher.doFinal(data);
		}
	}

	public byte[] decrypt(byte[] data) throws InvalidKeyException,
			NoSuchAlgorithmException, InvalidKeySpecException,
			NoSuchPaddingException, IllegalBlockSizeException,
			BadPaddingException, IOException,
			InvalidAlgorithmParameterException {
		Cipher cipher = getCipherInstance();
		if (JCryptoHelper.isNecessaryIvBytes(this.jcrypto.getAlgorithm())) {
			IvParameterSpec ivParameterSpec = new IvParameterSpec(JCryptoHelper.DEFAULT_IV_BYTES);
			cipher.init(
					Cipher.DECRYPT_MODE, 
					generateKey(JCryptoHelper.getKeyAlgorithm(this.jcrypto.getAlgorithm()),this.jcrypto.getAlgorithm(), this.jcrypto.getKeyBytes()), ivParameterSpec);
		} else {
			cipher.init(
					Cipher.DECRYPT_MODE,
					generateKey(JCryptoHelper.getKeyAlgorithm(this.jcrypto.getAlgorithm()),this.jcrypto.getAlgorithm(), this.jcrypto.getKeyBytes()));
		}

		byte[] bData = null;
		if (jcrypto.isApplyBase64()) {

			//byte[] temp = new sun.misc.BASE64Decoder().decodeBuffer(new String(	data));
			byte[] temp = Base64.decodeBase64(data);
			bData = temp;
		} else {
			bData = data;
		}

		return cipher.doFinal(bData);

	}

	public void decrypt(InputStream in, OutputStream out)
			throws NoSuchAlgorithmException, InvalidKeyException, IOException,
			IllegalBlockSizeException, NoSuchPaddingException,
			BadPaddingException, InvalidKeySpecException,
			InvalidAlgorithmParameterException {
		decrypt(in, out, true);
	}

	public void decryptForZipFile(InputStream in, OutputStream out)
			throws NoSuchAlgorithmException, InvalidKeyException, IOException,
			IllegalBlockSizeException, NoSuchPaddingException,
			BadPaddingException, InvalidKeySpecException,
			InvalidAlgorithmParameterException {
		decrypt(in, out, false);
	}

	public void encrypt(InputStream in, OutputStream out)
			throws NoSuchAlgorithmException, InvalidKeyException,
			NoSuchPaddingException, IOException, BadPaddingException,
			InvalidKeySpecException, InvalidAlgorithmParameterException {
		Cipher cipher = Cipher.getInstance(jcrypto.getAlgorithm());
		if (JCryptoHelper.isNecessaryIvBytes(this.jcrypto.getAlgorithm())) {
			IvParameterSpec ivParameterSpec = new IvParameterSpec(JCryptoHelper.DEFAULT_IV_BYTES);
			cipher.init(Cipher.ENCRYPT_MODE,
					generateKey(JCryptoHelper.getKeyAlgorithm(this.jcrypto.getAlgorithm()),this.jcrypto.getAlgorithm(), this.jcrypto.getKeyBytes()), ivParameterSpec);
		} else {
			cipher.init(Cipher.ENCRYPT_MODE,
					generateKey(JCryptoHelper.getKeyAlgorithm(this.jcrypto.getAlgorithm()),this.jcrypto.getAlgorithm(), this.jcrypto.getKeyBytes()));
		}

		CipherOutputStream cos = new CipherOutputStream(out, cipher);

		byte[] buffer = new byte[2048];
		int bytesRead;
		while ((bytesRead = in.read(buffer)) != -1) {
			cos.write(buffer, 0, bytesRead);
			cos.flush();
		}
		cos.close();

		java.util.Arrays.fill(buffer, (byte) 0);
	}
	
	/**
	 *  입력받은 스트림을 close 여부를 전달 받아 복호화 처리를 한다. 
	 * @param in 입력 스트림
	 * @param out 출력 스트림
	 * @param isStreamClose close 여부
	 * @throws NoSuchAlgorithmException 암호화 알고리즘을 찾을 수 없을때 예외 처리
	 * @throws InvalidKeyException 규칙에 맞지 않은 key 일때 예외 처리
	 * @throws IOException 입/출력 예외 처리
	 * @throws IllegalBlockSizeException 규칙에 맞지 않은 블럭사이즈 일때 예외 처리
	 * @throws NoSuchPaddingException 패딩 정보를 찾을 수 없을때 예외 처리
	 * @throws BadPaddingException 잘못된 패딩 일때 예외처리
	 * @throws InvalidKeySpecException 규칙에 맞지 않은 keySpec 일때 예외 처리
	 * @throws InvalidAlgorithmParameterException 유효하지 않은 알고리즘 파라미터 일때 예외처리
	 */
	private void decrypt(InputStream in, OutputStream out, boolean isStreamClose)
			throws NoSuchAlgorithmException, InvalidKeyException, IOException,
			IllegalBlockSizeException, NoSuchPaddingException,
			BadPaddingException, InvalidKeySpecException,
			InvalidAlgorithmParameterException {
		Cipher cipher = Cipher.getInstance(jcrypto.getAlgorithm());
		if (JCryptoHelper.isNecessaryIvBytes(this.jcrypto.getAlgorithm())) {
			IvParameterSpec ivParameterSpec = new IvParameterSpec(JCryptoHelper.DEFAULT_IV_BYTES);
			cipher.init(Cipher.DECRYPT_MODE,
					generateKey(JCryptoHelper.getKeyAlgorithm(this.jcrypto.getAlgorithm()),this.jcrypto.getAlgorithm(), this.jcrypto.getKeyBytes()), ivParameterSpec);
		} else {
			cipher.init(Cipher.DECRYPT_MODE,
					generateKey(JCryptoHelper.getKeyAlgorithm(this.jcrypto.getAlgorithm()),this.jcrypto.getAlgorithm(), this.jcrypto.getKeyBytes()));
		}

		byte[] buffer = new byte[2048];
		int bytesRead;
		while ((bytesRead = in.read(buffer)) != -1) {
			out.write(cipher.update(buffer, 0, bytesRead));
		}

		out.write(cipher.doFinal());
		out.flush();
		if(isStreamClose) {
			in.close();
			out.close();
		}
	}

	/**
	 * 암호화 Helper 클래스
	 *
	 */
	static class JCryptoHelper {
		
		/** 디폴트로 제공할 ivBytes 를 초기화 한다. */
		public static byte[] DEFAULT_IV_BYTES = { (byte) 5, (byte) 6, (byte) 7,
				(byte) 8, (byte) 9, (byte) 7, (byte) 1, (byte) 2 };

		/** 입력받은 알고리즘 중에 키 알고리즘에 해당하는 부분을 추출한다.*/
		public static String getKeyAlgorithm(String algorithm) {
			return algorithm.split("\\/")[0];
		}

		/** 운용방식에 따른 ivBytes 필요여부를 검사한다. */
		public static boolean isNecessaryIvBytes(String algorithm) {
			String[] algorithmArr = algorithm.split("\\/");

			if (algorithmArr.length == 1) {
				return false;
			} else if (algorithmArr.length == 2 || algorithmArr.length == 3) {
				if ("CBC".equalsIgnoreCase(algorithmArr[1])
						|| "OFB".equalsIgnoreCase(algorithmArr[1])
						|| "CFB".equalsIgnoreCase(algorithmArr[1])) {
					return true;
				} else {
					return false;
				}
			}
			return false;
		}
	}
}
