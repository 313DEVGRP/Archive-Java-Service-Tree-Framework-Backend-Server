package egovframework.com.utl.sim.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;

import egovframework.com.cmm.EgovWebUtil;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.service.Globals;
import egovframework.com.cmm.util.EgovResourceCloseHelper;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import noNamespace.SndngMailDocument;

import org.apache.xmlbeans.XmlOptions;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.Text;

public class EgovXMLDoc {

	// 파일구분자
	static final char FILE_SEPARATOR = File.separatorChar;

	// 최대 문자길이
	static final int MAX_STR_LEN = 1024;

	// Log
	//protected static final Log log = LogFactory.getLog(EgovXMLDoc.class);
	public static boolean creatSchemaToClass(String xml, String ja) throws Exception {

		boolean result = false;

		// 1. 스키마가 없으면 에러
		String file = xml.replace('\\', FILE_SEPARATOR).replace('/', FILE_SEPARATOR);
		File xmlFile = new File(file);
		if (!xmlFile.exists() || !xmlFile.isFile()) {
			//log.debug("+++ 지정된 위치에 스키마 파일이 없습니다.");
			return false;
		}

		// 2. 동일한 jar파일이 이미 존재하면 에러
		String jar = ja.replace('\\', FILE_SEPARATOR).replace('/', FILE_SEPARATOR);
		File jarFile = new File(jar);
		if (jarFile.exists()) {
			//log.debug("+++ 동일한 JAR 파일이 존재합니다.");
			return false;
		}

		// 3. scomp -src [소스생성위치] [xsd파일] : 입력받은 스키마를 컴파일하여 JAVA 소스파일로 생성
		Process p = null;
		BufferedReader b_err = null;
		String cmdStr = EgovProperties.getPathProperty(Globals.SHELL_FILE_PATH, "SHELL." + Globals.OS_TYPE + ".compileSchema");
		String[] command = { cmdStr.replace('\\', FILE_SEPARATOR).replace('/', FILE_SEPARATOR), jar, file };
		
		try {
			p = Runtime.getRuntime().exec(command);
			//프로세스가 처리될때까지 대기
			p.waitFor();
	
			//프로세스 에러시 종료
			if (p.exitValue() != 0) {
				b_err = new BufferedReader(new InputStreamReader(p.getErrorStream()));
				while (b_err.ready()) {
					//String line = b_err.readLine();
					//if (line.length() <= MAX_STR_LEN) log.debug("ERR\n" + line);
				}
				b_err.close();
			}
			//프로세스 실행 성공시 결과 확인
			else {
				result = true;
			}
		} finally {
			EgovResourceCloseHelper.close(b_err);
			
			if (p != null) {
				p.destroy();
			}
		}
		return result;
	}

	public static SndngMailDocument getXMLToClass(String file) throws Exception {

		File xmlFile = null;
		FileInputStream fis = null;
		SndngMailDocument mailDoc = null;
		try {
			String file1 = file.replace('\\', FILE_SEPARATOR).replace('/', FILE_SEPARATOR);
			xmlFile = new File(EgovWebUtil.filePathBlackList(file1));
			if (xmlFile.exists() && xmlFile.isFile()) {
				fis = new FileInputStream(xmlFile);
				mailDoc = SndngMailDocument.Factory.parse(xmlFile);

			}
		} finally {
			EgovResourceCloseHelper.close(fis);
		}

		return mailDoc;
	}

	public static boolean getClassToXML(SndngMailDocument mailDoc, String file) throws Exception {

		boolean result = false;

		FileOutputStream fos = null;

		try {

			String file1 = file.replace('\\', FILE_SEPARATOR).replace('/', FILE_SEPARATOR);
			file1 = EgovFileTool.createNewFile(file1);
			File xmlFile = new File(EgovWebUtil.filePathBlackList(file1));
			fos = new FileOutputStream(xmlFile);

			XmlOptions xmlOptions = new XmlOptions();
			xmlOptions.setSavePrettyPrint();
			xmlOptions.setSavePrettyPrintIndent(4);
			xmlOptions.setCharacterEncoding("UTF-8");
			String xmlStr = mailDoc.xmlText(xmlOptions);

			fos.write(xmlStr.getBytes("UTF-8"));
			result = true;

		} finally {
			EgovResourceCloseHelper.close(fos);
		}

		return result;
	}

	public static Document getXMLDocument(String xml) throws Exception {

		Document xmlDoc = null;

		String file = xml.replace('\\', FILE_SEPARATOR).replace('/', FILE_SEPARATOR);
		File srcFile = new File(file);
		FileInputStream fis = null;
		try {
			if (srcFile.exists() && srcFile.isFile()) {

				fis = new FileInputStream(srcFile);
				DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
				DocumentBuilder builder = null;
				factory.setValidating(true);
				builder = factory.newDocumentBuilder();
				xmlDoc = builder.parse(fis);
			}
		} finally {
			EgovResourceCloseHelper.close(fis);
		}

		return xmlDoc;
	}

	public static Element getRootElement(Document document) throws Exception {

		Element root = document.getDocumentElement();
		return root;
	}

	public static Element insertElement(Document document, Element rt, String id) throws Exception {

		Element child = null;
		Element root = null;
		
		if (rt == null) {
			root = getRootElement(document);
		} else {
			root = rt;
		}
		child = document.createElement(id);
		root.appendChild(child);
		
		return child;
	}

	public static Element insertElement(Document document, Element rt, String id, String text) throws Exception {

		Element echild = null;
		Text tchild = null;
		Element root = null;

		if (rt == null) {
			root = getRootElement(document);
		} else {
			root = rt;
		}
		echild = document.createElement(id);
		root.appendChild(echild);
		tchild = document.createTextNode(text);
		echild.appendChild(tchild);
		
		return echild;
	}

	public static Text insertText(Document document, Element rt, String text) throws Exception {

		Text tchild = null;
		Element root = null;

		if (rt == null) {
			root = getRootElement(document);
		} else {
			root = rt;
		}
		tchild = document.createTextNode(text);
		root.appendChild(tchild);
		
		return tchild;
	}

	public static Element getParentNode(Element current) throws Exception {

		Node parent = current.getParentNode();
		return (Element) parent;
	}

	public static boolean getXMLFile(Document document, String file) throws Exception {

		boolean retVal = false;

		String file1 = file.replace('\\', FILE_SEPARATOR).replace('/', FILE_SEPARATOR);
		File srcFile = new File(file1);
		if (srcFile.exists() && srcFile.isFile()) {

			Source source = new DOMSource(document);
			Result result = new StreamResult(srcFile);
			Transformer transformer = TransformerFactory.newInstance().newTransformer();
			transformer.setOutputProperty(OutputKeys.METHOD, "xml");
			transformer.setOutputProperty(OutputKeys.INDENT, "yes");
			transformer.transform(source, result);
		}

		return retVal;
	}
}
