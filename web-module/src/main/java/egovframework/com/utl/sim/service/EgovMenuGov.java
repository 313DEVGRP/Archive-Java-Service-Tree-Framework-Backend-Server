package egovframework.com.utl.sim.service;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.List;
import java.util.Vector;

import egovframework.com.cmm.util.EgovResourceCloseHelper;

public class EgovMenuGov {

	// 파일구분자
	static final char FILE_SEPARATOR = File.separatorChar;

	public static Vector<List<String>> parsFileByMenuChar(String parFile, String parChar, int parField) throws Exception {
		Vector<List<String>> list = null;
		String FileName = null;
		
		FileName = parFile.replace('\\', FILE_SEPARATOR).replace('/', FILE_SEPARATOR);
		File file = new File(FileName);

		// 파일이며, 존재하면 파싱 시작
		if (file.exists() && file.isFile()) {
			list = EgovFileTool.parsFileByChar(parFile, parChar, parField);
		} else {
			list = new Vector<List<String>>();
		}
		
		return list;
	}


	public static boolean setDataByDATFile(String parFile, String[] menuIDArray, String[] menuNameArray, String[] menuLevelArray, String[] menuURLArray) throws Exception {
		boolean success = false;
		String FileName = null;

		FileName = parFile.replace('\\', FILE_SEPARATOR).replace('/', FILE_SEPARATOR);
		File file = new File(FileName);
		BufferedWriter out = new BufferedWriter(new FileWriter(file));
		try {

			for (int i = 0; i < menuIDArray.length; i++) { //nodeId | parentNodeId | nodeName | nodeUrl
				out.write(menuIDArray[i] + "|" + menuLevelArray[i] + "|" + menuNameArray[i] + "|" + menuURLArray[i] + "|");
				out.newLine();
			}
			success = true;
		} finally {
			EgovResourceCloseHelper.close(out);
		}
		return success;
	}
}