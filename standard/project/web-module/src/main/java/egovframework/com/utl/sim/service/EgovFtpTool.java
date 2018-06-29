package egovframework.com.utl.sim.service;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;

import egovframework.com.cmm.util.EgovBasicLogger;
import egovframework.com.cmm.util.EgovResourceCloseHelper;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;

public class EgovFtpTool {

	// ASC-II 전송 모드
	public static final int ASCII_MODE = FTP.ASCII_FILE_TYPE;

	// 이진 전송 모드
	public static final int BINARY_MODE = FTP.BINARY_FILE_TYPE;
	public static final String FTP_CHARACTER_ENCODING = "UTF-8";

	// 파일구분자
	static final char FILE_SEPARATOR = File.separatorChar;

	// Log
	//protected static final Log log = LogFactory.getLog(EgovFtpTool.class);

	public static boolean getFile(String ftp_ip, int ftp_port, String ftp_id, String ftp_pw, String remote) throws Exception {

		return getFile(ftp_ip, ftp_port, ftp_id, ftp_pw, ASCII_MODE, remote, null);
	}

	public static boolean getFile(String ftp_ip, int ftp_port, String ftp_id, String ftp_pw, int ftp_mode, String remote) throws Exception {

		return getFile(ftp_ip, ftp_port, ftp_id, ftp_pw, ftp_mode, remote, null);
	}

	public static boolean getFile(String ftp_ip, int ftp_port, String ftp_id, String ftp_pw, int ftp_mode, String remote, String local) throws Exception {

		// 수신결과
		boolean result = false;

		FTPClient ftpClient = null;
		FileOutputStream out = null;
		try {

			// 1. 연결시작
			ftpClient = new FTPClient();
			if (!connect(ftpClient, ftp_ip, ftp_port, ftp_id, ftp_pw, ftp_mode))
				return false;

			// 2. FTP 서버의 작업할 디렉토리로 이동
			String[] ser_path = splitPathAndName(remote, "/");
			String path = ser_path[0];
			String name = ser_path[1];
			if (!ftpClient.changeWorkingDirectory(path))
				return false;

			// 3. 파일 수신 준비
			String loc = "";
			if (local == null || "".equals(local)) {
				loc = path + FILE_SEPARATOR + name;
			} else {
				loc = local;
			}
			loc = loc.replace('\\', FILE_SEPARATOR).replace('/', FILE_SEPARATOR);
			loc = EgovFileTool.createNewFile(loc);
			File tarFile = new File(loc);
			out = new FileOutputStream(tarFile);

			// 4. 파일 수신 수행
			result = ftpClient.retrieveFile(name, out);

		} finally {
			try {
				disconnect(ftpClient);
			} catch (Exception ignore) {
				EgovBasicLogger.ignore("FTP disconnect error", ignore);
			}
			EgovResourceCloseHelper.close(out);
		}

		return result;
	}

	public static byte[] getFileAsByte(String ftp_ip, int ftp_port, String ftp_id, String ftp_pw, int ftp_mode, String remote, String local) throws Exception {

		// 수신결과
		byte[] outByte = null;
		boolean result = false;

		FTPClient ftpClient = null;
		ByteArrayOutputStream out = null;

		try {

			// 1. 연결시작
			ftpClient = new FTPClient();
			result = connect(ftpClient, ftp_ip, ftp_port, ftp_id, ftp_pw, ftp_mode);
			if (!result) {
				return outByte;
			}

			// 2. FTP 서버의 작업할 디렉토리로 이동
			String[] ser_path = splitPathAndName(remote, "/");
			String path = ser_path[0];
			String name = ser_path[1];
			result = ftpClient.changeWorkingDirectory(path);
			if (!result) {
				return outByte;
			}

			// 3. 파일 수신 수행
			out = new ByteArrayOutputStream();
			
			result = ftpClient.retrieveFile(name, out);
			if (!result) {
				return outByte;
			}

			// 4. byte[] 결과
			if (out != null) {
				outByte = out.toByteArray();
			}

		} finally {
			try {
				disconnect(ftpClient);
			} catch (Exception ignore) {
				EgovBasicLogger.ignore("FTP disconnection error", ignore);
			}
			EgovResourceCloseHelper.close(out);
		}
		return outByte;
	}

	public static boolean sendFile(String ftp_ip, int ftp_port, String ftp_id, String ftp_pw, String local) throws Exception {

		return sendFile(ftp_ip, ftp_port, ftp_id, ftp_pw, ASCII_MODE, local, null);
	}

	public static boolean sendFile(String ftp_ip, int ftp_port, String ftp_id, String ftp_pw, int ftp_mode, String local) throws Exception {

		return sendFile(ftp_ip, ftp_port, ftp_id, ftp_pw, ftp_mode, local, null);
	}

	public static boolean sendFile(String ftp_ip, int ftp_port, String ftp_id, String ftp_pw, int ftp_mode, String local, String remote) throws Exception {

		// 송신결과
		boolean result = false;

		FTPClient ftpClient = null;
		FileInputStream in = null;
		try {

			// 1. 송신 파일 확인
			String loc = local.replace('\\', FILE_SEPARATOR).replace('/', FILE_SEPARATOR);
			File srcFile = new File(loc);
			if (!srcFile.exists()) {
				//log.debug("+++ File Not Found To Transport..");
				return false;
			}

			// 2. 연결시작
			ftpClient = new FTPClient();
			if (!connect(ftpClient, ftp_ip, ftp_port, ftp_id, ftp_pw, ftp_mode))
				return false;

			// 3. 파일 송신 준비
			String[] ser_path = splitPathAndName(remote, "/");
			String path = ser_path[0];
			String name = ser_path[1];
			changeRemoteDrctry(ftpClient, path);

			// 4. 파일 송신 수행
			in = new FileInputStream(srcFile);
			result = ftpClient.storeFile(name, in);

		} finally {
			try {
				disconnect(ftpClient);
			} catch (Exception ignore) {
				EgovBasicLogger.ignore("FTP disconnection error", ignore);
			}
			EgovResourceCloseHelper.close(in);
		}
		return result;
	}

	public static boolean sendFile(String ftp_ip, int ftp_port, String ftp_id, String ftp_pw, int ftp_mode, InputStream data, String remote) throws Exception {

		// 송신결과
		boolean result = false;

		FTPClient ftpClient = null;
		FileInputStream in = null;
		try {

			// 1. 송신 파일 확인
			if (data == null) {
				//log.debug("+++ Data Not Found To Transport..");
				return false;
			}

			// 2. 연결시작
			ftpClient = new FTPClient();
			if (!connect(ftpClient, ftp_ip, ftp_port, ftp_id, ftp_pw, ftp_mode))
				return false;

			// 3. 파일 송신 준비
			String[] ser_path = splitPathAndName(remote, "/");
			String path = ser_path[0];
			String name = ser_path[1];
			changeRemoteDrctry(ftpClient, path);

			// 4. 파일 송신 수행
			result = ftpClient.storeFile(name, data);

		} finally {
			try {
				disconnect(ftpClient);
			} catch (Exception ignore) {
				EgovBasicLogger.ignore("FTP disconnection error", ignore);
			}
			EgovResourceCloseHelper.close(in);
		}
		return result;
	}

	public static boolean connect(FTPClient ftpClient, String ftp_ip, int ftp_port, String ftp_id, String ftp_pw, int ftp_mode) throws Exception {

		boolean result = false;

		//ftpClient.setControlEncoding("UTF-8");

		ftpClient.connect(ftp_ip, ftp_port);
		int reply = ftpClient.getReplyCode();

		if (!FTPReply.isPositiveCompletion(reply)) {
			return false;
		}

		result = ftpClient.login(ftp_id, ftp_pw);
		if (!result) {
			return false;
		}

		ftpClient.enterLocalPassiveMode();
		ftpClient.setFileType(ftp_mode);

		return result;
	}

	public static void disconnect(FTPClient ftpClient) throws Exception {
		if (ftpClient != null && ftpClient.isConnected()) {
			ftpClient.disconnect();
		}
	}

	public static boolean changeRemoteDrctry(FTPClient ftpClient, String remote_drctry) throws Exception {

		boolean result = false;

		if (ftpClient.changeWorkingDirectory(remote_drctry)) {
			result = true;
		} else {
			// 디렉토리가 없는 경우, 디렉토리를 만든다.
			String[] arr = remote_drctry.split("" + FILE_SEPARATOR);
			for (int i = 0; i < arr.length; i++) {
				ftpClient.makeDirectory(arr[i]);
				if (!ftpClient.changeWorkingDirectory(arr[i])) {
					return false;
				}
			}
			result = true;
		}

		return result;
	}

	public static String[] splitPathAndName(String path, String fileSep) {

		String[] split = new String[2];
		if (path == null || "".equals(path)) {
			split[0] = "";
			split[1] = "";
		} else {
			int lastIndex = path.lastIndexOf(fileSep);
			if (lastIndex >= 0) {
				split[0] = path.substring(0, lastIndex);
				split[1] = path.substring(lastIndex + 1);
			} else {
				split[0] = "";
				split[1] = path;
			}
		}
		return split;
	}
}