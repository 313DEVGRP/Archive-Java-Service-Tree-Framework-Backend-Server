package egovframework.com.utl.sys.pxy.service;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;

import egovframework.com.cmm.util.EgovResourceCloseHelper;

public class ProxyCommand {

	Socket clientSocket;
	DataInputStream disReader;
	DataOutputStream dosWriter;

	String strReceive = null;
	String strLog = null;

	private String proxyIp;
	private int proxyPort;

	public ProxyCommand(String proxyIp, int proxyPort) {
		setProxyIp(proxyIp);
		setProxyPort(proxyPort);
	}

	public void runCommand(String msg) {
		try {
			clientSocket = new Socket(proxyIp, proxyPort);

			disReader = new DataInputStream(clientSocket.getInputStream());
			dosWriter = new DataOutputStream(clientSocket.getOutputStream());

			dosWriter.writeUTF(msg);
			dosWriter.flush();
		} catch (IOException e) {
			throw new RuntimeException(e);
		} finally {
			CloseSocket();
		}
	}

	private void CloseSocket() {
		EgovResourceCloseHelper.close(disReader, dosWriter);
		EgovResourceCloseHelper.closeSockets(clientSocket);
	}

	/**
	 * @return the proxyIp
	 */
	public String getProxyIp() {
		return proxyIp;
	}

	/**
	 * @param proxyIp the proxyIp to set
	 */
	public void setProxyIp(String proxyIp) {
		this.proxyIp = proxyIp;
	}

	/**
	 * @return the proxyPort
	 */
	public int getProxyPort() {
		return proxyPort;
	}

	/**
	 * @param proxyPort the proxyPort to set
	 */
	public void setProxyPort(int proxyPort) {
		this.proxyPort = proxyPort;
	}
}
