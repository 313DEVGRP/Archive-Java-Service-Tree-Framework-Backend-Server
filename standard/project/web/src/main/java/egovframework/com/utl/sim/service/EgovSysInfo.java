package egovframework.com.utl.sim.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.service.Globals;
import egovframework.com.cmm.util.EgovResourceCloseHelper;

public class EgovSysInfo {

	// 파일구분자
	static final char FILE_SEPARATOR = File.separatorChar;

	// 최대 문자길이
	static final int MAX_STR_LEN = 1024;

	// Log
	//protected static final Log log = LogFactory.getLog(EgovSysInfo.class);

	public static Vector<Map<String, String>> getPrductList() throws Exception {

		String strlist = EgovProperties.getProperty(Globals.SERVER_CONF_PATH, "SERVER_LIST");
		String[] list = strlist.split("\\$");

		Vector<Map<String, String>> serverList = new Vector<Map<String, String>>();

		for (int i = 0; i < list.length; i++) {
			Map<String, String> map = new HashMap<String, String>();
			
			map.put("name", list[i]);
			map.put("version", getPrductVersion(list[i]));
			map.put("port", getPrductPort(list[i]));
			map.put("status", getPrductStatus(getPrductPort(list[i])));
			
			serverList.add(map);
		}

		return serverList;
	}

	public static String getPrductVersion(String server) throws Exception {

		String version = EgovProperties.getProperty(Globals.SERVER_CONF_PATH, server.toUpperCase() + ".VERSION");
		
		return version;
	}

	public static String getPrductPort(String server) throws Exception {

		String port = EgovProperties.getProperty(Globals.SERVER_CONF_PATH, server.toUpperCase() + ".PORT");
		
		return port;
	}

	public static String getPrductStatus(String port) throws Exception {

		String status = "CLOSE";
		Process p = null;
		
		BufferedReader b_out = null;
		try {
			String cmdStr = EgovProperties.getPathProperty(Globals.SERVER_CONF_PATH, "SHELL." + Globals.OS_TYPE + ".getPrductStatus");
			String[] command = { cmdStr.replace('\\', FILE_SEPARATOR).replace('/', FILE_SEPARATOR), port };
			p = Runtime.getRuntime().exec(command);
			//p.waitFor();

			//boolean result = false;
			b_out = new BufferedReader(new InputStreamReader(p.getInputStream()));
			if ("UNIX".equals(Globals.OS_TYPE)) {
				while (true) {
					String str = b_out.readLine();
					if (str == null)
						break;
					if (str != null && !"".equals(str) && Integer.parseInt(str) > 0 && str.length() <= MAX_STR_LEN) {
						status = "LISTENING";
					}
				}
			} else if ("WINDOWS".equals(Globals.OS_TYPE)) {
				while (true) {
					String str = b_out.readLine();
					if (str == null)
						break;
					if (str != null && !"".equals(str) && str.indexOf(port) != -1 && str.indexOf("LISTENING") != -1 && str.length() <= MAX_STR_LEN) {
						status = "LISTENING";
					}
				}
			}
		} finally {
			EgovResourceCloseHelper.close(b_out);
			
			if (p != null) {
				p.destroy();
			}
		}

		return status;
	}

	public static String getHostName() throws Exception {

		// 호스트명 결과
		String hostName = "";
		Process p = null;
		
		BufferedReader b_out = null;
		try {
			String[] command = { "hostname" };
			p = Runtime.getRuntime().exec(command);
			//p.waitFor();

			//boolean result = false;
			b_out = new BufferedReader(new InputStreamReader(p.getInputStream()));
			while (true) {
				String str = b_out.readLine();
				if (str == null)
					break;
				if (str != null && !"".equals(str) && str.length() <= MAX_STR_LEN) {
					hostName = str;
				}
			}
		} finally {
			EgovResourceCloseHelper.close(b_out);
			
			if (p != null) {
				p.destroy();
			}
		}

		return hostName;
	}

	public static String getOSName() throws Exception {

		// OS 이름
		String osname = "";
		Process p = null;
		BufferedReader b_out = null;
		
		try {
			String cmdStr = EgovProperties.getPathProperty(Globals.SERVER_CONF_PATH, "SHELL." + Globals.OS_TYPE + ".getOSInfo");
			String[] command = { cmdStr.replace('\\', FILE_SEPARATOR).replace('/', FILE_SEPARATOR), "NAME" };
			p = Runtime.getRuntime().exec(command);
			//p.waitFor();

			//boolean result = false;
			b_out = new BufferedReader(new InputStreamReader(p.getInputStream()));

			if ("UNIX".equals(Globals.OS_TYPE)) {
				while (true) {
					String str = b_out.readLine();
					if (str == null)
						break;
					if (str != null && !"".equals(str) && str.length() <= MAX_STR_LEN) {
						osname = str;
					}
				}
			} else if ("WINDOWS".equals(Globals.OS_TYPE)) {
				while (true) {
					String str = b_out.readLine();
					if (str == null)
						break;
					if (str != null && !"".equals(str) && str.indexOf("OS 이름:") != -1 && str.length() <= MAX_STR_LEN) {
						osname = str.replaceAll("OS 이름:", "");
					}
				}
			}
		} finally {
			EgovResourceCloseHelper.close(b_out);
			
			if (p != null) {
				p.destroy();
			}
		}

		return osname;
	}

	public static String getOSVersion() throws Exception {

		// OS 버전
		String osversion = "";
		Process p = null;
		BufferedReader b_out = null;
		try {
			String cmdStr = EgovProperties.getPathProperty(Globals.SERVER_CONF_PATH, "SHELL." + Globals.OS_TYPE + ".getOSInfo");
			String[] command = { cmdStr.replace('\\', FILE_SEPARATOR).replace('/', FILE_SEPARATOR), "VERSION" };
			p = Runtime.getRuntime().exec(command);
			//p.waitFor();

			//boolean result = false;
			b_out = new BufferedReader(new InputStreamReader(p.getInputStream()));

			if ("UNIX".equals(Globals.OS_TYPE)) {
				while (true) {
					String str = b_out.readLine();
					if (str == null)
						break;
					if (str != null && !"".equals(str) && str.length() <= MAX_STR_LEN) {
						osversion = str;
					}
				}
			} else if ("WINDOWS".equals(Globals.OS_TYPE)) {
				while (true) {
					String str = b_out.readLine();
					if (str == null)
						break;
					if (str != null && !"".equals(str) && str.indexOf("OS 버전:") != -1 && str.length() <= MAX_STR_LEN) {
						osversion = str.replaceAll("OS 버전:", "");
					}
				}
			}
		} finally {
			EgovResourceCloseHelper.close(b_out);
			
			if (p != null) {
				p.destroy();
			}
		}

		return osversion;
	}

	public static String getOSPrductor() throws Exception {

		// OS 제조사
		String osprductor = "";
		Process p = null;
		BufferedReader b_out = null;
		try {
			String cmdStr = EgovProperties.getPathProperty(Globals.SERVER_CONF_PATH, "SHELL." + Globals.OS_TYPE + ".getOSInfo");
			String[] command = { cmdStr.replace('\\', FILE_SEPARATOR).replace('/', FILE_SEPARATOR), "PRDUCTOR" };
			p = Runtime.getRuntime().exec(command);
			//p.waitFor();

			//boolean result = false;
			b_out = new BufferedReader(new InputStreamReader(p.getInputStream()));

			if ("UNIX".equals(Globals.OS_TYPE)) {
				while (true) {
					String str = b_out.readLine();
					if (str == null)
						break;
					if (str != null && !"".equals(str) && str.length() <= MAX_STR_LEN) {
						osprductor = str;
					}
				}
			} else if ("WINDOWS".equals(Globals.OS_TYPE)) {
				while (true) {
					String str = b_out.readLine();
					if (str == null)
						break;
					if (str != null && !"".equals(str) && str.indexOf("OS 제조업체:") != -1 && str.length() <= MAX_STR_LEN) {
						osprductor = str.replaceAll("OS 제조업체:", "");
					}
				}
			}
		} finally {
			EgovResourceCloseHelper.close(b_out);
			
			if (p != null) {
				p.destroy();
			}
		}

		return osprductor;
	}

	public static String getProcessorID() throws Exception {

		// 프로세서ID
		String processor = "";
		Process p = null;
		BufferedReader b_out = null;
		
		try {
			String cmdStr = EgovProperties.getPathProperty(Globals.SERVER_CONF_PATH, "SHELL." + Globals.OS_TYPE + ".getOSInfo");
			String[] command = { cmdStr.replace('\\', FILE_SEPARATOR).replace('/', FILE_SEPARATOR), "PROCESSOR" };
			p = Runtime.getRuntime().exec(command);
			//p.waitFor();

			//boolean result = false;
			b_out = new BufferedReader(new InputStreamReader(p.getInputStream()));

			if ("UNIX".equals(Globals.OS_TYPE)) {
				while (true) {
					String str = b_out.readLine();
					if (str == null)
						break;
					if (str != null && !"".equals(str) && str.length() <= MAX_STR_LEN) {
						processor = str;
					}
				}
			} else if ("WINDOWS".equals(Globals.OS_TYPE)) {
				while (true) {
					String str = b_out.readLine();
					if (str == null)
						break;
					if (str != null && !"".equals(str) && str.indexOf("프로세서:") != -1 && str.length() <= MAX_STR_LEN) {
						processor = str.replaceAll("\\[01\\]:", "");
					}
				}
			}
		} finally {
			EgovResourceCloseHelper.close(b_out);
			
			if (p != null) {
				p.destroy();
			}
		}

		return processor;
	}

	public static List<String> getDiskName() throws Exception {

		// 디스크명
		List<String> list = new ArrayList<String>();

		Process p = null;
		BufferedReader b_out = null;
		
		try {
			String cmdStr = EgovProperties.getPathProperty(Globals.SERVER_CONF_PATH, "SHELL." + Globals.OS_TYPE + ".getDiskInfo");
			String[] command = { cmdStr.replace('\\', FILE_SEPARATOR).replace('/', FILE_SEPARATOR), "NAME" };
			p = Runtime.getRuntime().exec(command);
			//p.waitFor();

			//boolean result = false;
			b_out = new BufferedReader(new InputStreamReader(p.getInputStream()));

			if ("UNIX".equals(Globals.OS_TYPE)) {
				while (true) {
					String str = b_out.readLine();
					if (str == null)
						break;
					if (str != null && !"".equals(str) && str.length() <= MAX_STR_LEN) {
						list.add(str);
					}
				}
			}
		} finally {
			EgovResourceCloseHelper.close(b_out);
			
			if (p != null) {
				p.destroy();
			}
		}

		return list;
	}

	public static float getDiskFullCpcty(String disk) throws Exception {

		// 디스크 전체용량
		float cpcty = 0;

		Process p = null;
		BufferedReader b_out = null;
		try {
			String cmdStr = EgovProperties.getPathProperty(Globals.SERVER_CONF_PATH, "SHELL." + Globals.OS_TYPE + ".getDiskInfo");
			String[] command = { cmdStr.replace('\\', FILE_SEPARATOR).replace('/', FILE_SEPARATOR), "FULL", disk };
			p = Runtime.getRuntime().exec(command);
			//p.waitFor();

			//boolean result = false;
			b_out = new BufferedReader(new InputStreamReader(p.getInputStream()));

			if ("UNIX".equals(Globals.OS_TYPE)) {
				while (true) {
					String str = b_out.readLine();
					if (str == null)
						break;
					if (str != null && !"".equals(str) && str.length() <= MAX_STR_LEN) {
						cpcty = Float.parseFloat(str);
					}
				}
			}
		} finally {
			EgovResourceCloseHelper.close(b_out);
			
			if (p != null) {
				p.destroy();
			}
		}

		return cpcty;
	}

	public static float getDiskUsedCpcty(String disk) throws Exception {

		// 디스크 사용중 용량
		float cpcty = 0;

		Process p = null;
		BufferedReader b_out = null;
		try {
			String cmdStr = EgovProperties.getPathProperty(Globals.SERVER_CONF_PATH, "SHELL." + Globals.OS_TYPE + ".getDiskInfo");
			String[] command = { cmdStr.replace('\\', FILE_SEPARATOR).replace('/', FILE_SEPARATOR), "USED", disk };
			p = Runtime.getRuntime().exec(command);
			//p.waitFor();

			//boolean result = false;
			b_out = new BufferedReader(new InputStreamReader(p.getInputStream()));

			if ("UNIX".equals(Globals.OS_TYPE)) {
				while (true) {
					String str = b_out.readLine();
					if (str == null)
						break;
					if (str != null && !"".equals(str) && str.length() <= MAX_STR_LEN) {
						cpcty = Float.parseFloat(str);
					}
				}
			}
		} finally {
			EgovResourceCloseHelper.close(b_out);
			
			if (p != null) {
				p.destroy();
			}
		}

		return cpcty;
	}

	public static float getDiskFreeCpcty(String disk) throws Exception {

		// 디스크 유효 용량
		float cpcty = 0;

		Process p = null;
		BufferedReader b_out = null;
		
		try {
			String cmdStr = EgovProperties.getPathProperty(Globals.SERVER_CONF_PATH, "SHELL." + Globals.OS_TYPE + ".getDiskInfo");
			String[] command = { cmdStr.replace('\\', FILE_SEPARATOR).replace('/', FILE_SEPARATOR), "FREE", disk };
			p = Runtime.getRuntime().exec(command);
			//p.waitFor();

			//boolean result = false;
			b_out = new BufferedReader(new InputStreamReader(p.getInputStream()));

			if ("UNIX".equals(Globals.OS_TYPE)) {
				while (true) {
					String str = b_out.readLine();
					if (str == null)
						break;
					if (str != null && !"".equals(str) && str.length() <= MAX_STR_LEN) {
						cpcty = Float.parseFloat(str);
					}
				}
			}
		} finally {
			EgovResourceCloseHelper.close(b_out);
			
			if (p != null) {
				p.destroy();
			}
		}

		return cpcty;
	}

	public static float getMoryFullCpcty() throws Exception {

		// 메모리 전체 용량
		float cpcty = 0;
		cpcty = getMoryUsedCpcty() + getMoryFreeCpcty();
		return cpcty;

		/*
		// 메모리 전체 용량
		float cpcty = 0;

		Process p = null;
		try
		{
			String cmdStr = EgovProperties.getPathProperty(Globals.SERVER_CONF_PATH, "SHELL."+Globals.OS_TYPE+".getMoryInfo");
		    String[] command = {cmdStr.replace('\\', FILE_SEPARATOR).replace('/', FILE_SEPARATOR),
		    					"FULL"};
		    p = Runtime.getRuntime().exec(command);
		    //p.waitFor();

		    boolean result = false;
		    BufferedReader b_out = new BufferedReader(new InputStreamReader(p.getInputStream()));

		    if ("UNIX".equals(Globals.OS_TYPE)) {
		    	while (true){
		    		String str = b_out.readLine();
		    		if (str == null) break;
		    	    if (str != null && !"".equals(str) && str.length() <= MAX_STR_LEN) {
		    	    	str = str.replaceAll("mem=", "").replaceAll(" ", "").replaceAll("MB", "").replaceAll(",", "");
		    	    	cpcty = Float.parseFloat(str);
		    	    	result = true;
		    	    }
		        }
		    } else if ("WINDOWS".equals(Globals.OS_TYPE)) {
		    	// 메모리 전체용량 = 사용중 용량 + 유효 용량
				cpcty = getMoryUsedCpcty() + getMoryFreeCpcty();
		    }

		    b_out.close();

		}catch(Exception ex){
		    ex.printStackTrace();
		}finally{
			if (p != null) p.destroy();
		}

		return cpcty;
		*/
	}

	public static float getMoryUsedCpcty() throws Exception {

		// 메모리 사용중 용량
		float cpcty = 0;

		Process p = null;
		BufferedReader b_out = null;
		try {
			String cmdStr = EgovProperties.getPathProperty(Globals.SERVER_CONF_PATH, "SHELL." + Globals.OS_TYPE + ".getMoryInfo");
			String[] command = { cmdStr.replace('\\', FILE_SEPARATOR).replace('/', FILE_SEPARATOR), "USED" };
			p = Runtime.getRuntime().exec(command);
			//p.waitFor();

			//boolean result = false;
			b_out = new BufferedReader(new InputStreamReader(p.getInputStream()));

			if ("UNIX".equals(Globals.OS_TYPE)) {
				while (true) {
					String str = b_out.readLine();
					if (str == null)
						break;
					if (str != null && !"".equals(str) && str.length() <= MAX_STR_LEN) {
						cpcty = Float.parseFloat(str);
						//result = true;
					}
				}
			} else if ("WINDOWS".equals(Globals.OS_TYPE)) {
				long fullcpcty = 0;
				long usedcpcty = 0;
				while (true) {
					String str = b_out.readLine();
					if (str == null)
						break;
					if (str != null && !"".equals(str) && str.indexOf("총 실제 메모리:") != -1 && str.length() <= MAX_STR_LEN) {
						str = str.replaceAll("총 실제 메모리:", "").replaceAll(" ", "").replaceAll("MB", "").replaceAll(",", "");
						fullcpcty = Long.parseLong(str);
					}
					if (str != null && !"".equals(str) && str.indexOf("사용 가능한 실제 메모리:") != -1) {
						str = str.replaceAll("사용 가능한 실제 메모리:", "").replaceAll(" ", "").replaceAll("MB", "").replaceAll(",", "");
						usedcpcty = Long.parseLong(str);
					}
				}
				cpcty = fullcpcty - usedcpcty;
			}
		} finally {
			EgovResourceCloseHelper.close(b_out);
			
			if (p != null) {
				p.destroy();
			}
		}

		return cpcty;
	}

	public static float getMoryFreeCpcty() throws Exception {

		// 메모리 유효 용량
		float cpcty = 0;

		Process p = null;
		BufferedReader b_out = null;
		try {
			String cmdStr = EgovProperties.getPathProperty(Globals.SERVER_CONF_PATH, "SHELL." + Globals.OS_TYPE + ".getMoryInfo");
			String[] command = { cmdStr.replace('\\', FILE_SEPARATOR).replace('/', FILE_SEPARATOR), "FREE" };
			p = Runtime.getRuntime().exec(command);
			//p.waitFor();

			 b_out = new BufferedReader(new InputStreamReader(p.getInputStream()));

			if ("UNIX".equals(Globals.OS_TYPE)) {
				while (true) {
					String str = b_out.readLine();
					if (str == null)
						break;
					if (str != null && !"".equals(str) && str.length() <= MAX_STR_LEN) {
						cpcty = Float.parseFloat(str);
					}
				}
			} else if ("WINDOWS".equals(Globals.OS_TYPE)) {
				while (true) {
					String str = b_out.readLine();
					if (str == null)
						break;
					if (str != null && !"".equals(str) && str.indexOf("사용 가능한 실제 메모리:") != -1 && str.length() <= MAX_STR_LEN) {
						str = str.replaceAll("사용 가능한 실제 메모리:", "").replaceAll(" ", "").replaceAll("MB", "").replaceAll(",", "");
						cpcty = Long.parseLong(str);
					}
				}
			}
		} finally {
			EgovResourceCloseHelper.close(b_out);
			
			if (p != null) {
				p.destroy();
			}
		}

		return cpcty;
	}

	public static boolean checkMoryCpcty(long memory) throws Exception {

		// 가용여부
		boolean result = false;

		if (memory <= 0) {
			//log.debug("+++ Memory Capacity is Not Valid..");
			return false;
		}

		if (memory < getMoryFreeCpcty()) {
			result = true;
		}

		return result;
	}

	public static List<String> getDiskAttribute() {

		List<String> result = new ArrayList<String>();
		String[] command = { "" }; // 인자 없음
		try {
			result = executeProgram("getDiskAttrb", command);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

		return result;
	}

	public static List<String> getDiskCapacity() {

		List<String> result = new ArrayList<String>();
		String[] command = { "" }; // 인자 없음
		try {
			result = executeProgram("getDiskCpcty", command);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

		return result;
	}

	public static List<String> getExistDisk(String diskName) {

		List<String> result = new ArrayList<String>();
		String[] command = { "", diskName }; // 인자 없음
		try {
			result = executeProgram("getDiskExst", command);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

		return result;
	}

	public static List<String> executeProgram(String propertyKeyword, String[] command) throws Exception {

		List<String> resultTxtList = new ArrayList<String>();
		
		BufferedReader b_err = null;
		BufferedReader b_out = null;
		try {
			Process p = null;
			String cmdStr = EgovProperties.getPathProperty(Globals.SHELL_FILE_PATH, "SHELL." + Globals.OS_TYPE + "." + propertyKeyword);
			command[0] = cmdStr;
			p = Runtime.getRuntime().exec(command);
			p.waitFor();
			//프로세스 에러시 종료
			if (p.exitValue() != 0) {
				b_err = new BufferedReader(new InputStreamReader(p.getErrorStream()));
				while (b_err.ready()) {
					//String line = b_err.readLine();
					//if (line.length() <= MAX_STR_LEN) log.debug("ERR\n" + line);
				}
			} else {	//프로세스 실행 성공시 결과 확인
				String tmpLine = "";
				b_out = new BufferedReader(new InputStreamReader(p.getInputStream()));
				while (b_out.ready()) {
					// 결과문자가 있으면 생성자가 있다는 의미
					tmpLine = b_out.readLine();
					//2017.03.03 	조성원 	시큐어코딩(ES)-Null Pointer 역참조[CWE-476]
					if(tmpLine != null){
						if (tmpLine.length() <= MAX_STR_LEN) {
							resultTxtList.add(tmpLine);
						}
					}
				}
			}
		} finally {
			EgovResourceCloseHelper.close(b_err, b_out);
		}

		return resultTxtList;
	}

	public static List<String[]> getProcessId() {

		List<String[]> processes = new ArrayList<String[]>();
		String[] command = { "", "-all" }; // 인자 없음
		try {
			String line;
			String separator = null;

			Process p = null;

			if ("WINDOWS".equals(Globals.OS_TYPE)) {
				p = Runtime.getRuntime().exec("tasklist.exe /fo csv /nh");
				separator = "\",\"";
				
				if (p == null) {
					throw new RuntimeException("Can't execute process...");
				}
				BufferedReader input = new BufferedReader(new InputStreamReader(p.getInputStream()));
				if (input != null) {
					while ((line = input.readLine()) != null) {
						if (!line.trim().equals("") && line.length() <= MAX_STR_LEN) {

							line = line.substring(1, line.length() - 1);
							String[] operator = line.split(separator);

							processes.add(operator);
						}
					}

					input.close();
				}
				
			} else if ("UNIX".equals(Globals.OS_TYPE)) {
				/*
				String tmp = "ps -eo \"%p %G %U %c %a\"|awk -F\" \" '{print $1,$2,$3,$4,$5}'";
				log.debug(tmp);
				command [0] = tmp;
				p = Runtime.getRuntime().exec(tmp);
				separator = " ";
				*/
				separator = " ";
				List<String>  resultList = executeProgram("getProcInfo", command);
				
				for (String result : resultList) {
					String[] operator = result.split(separator);

					processes.add(operator);
				}

			}


		} catch (Exception err) {
			throw new RuntimeException(err);
		}

		return processes;
	}

	public static List<String[]> getProcessId(String processName) {
		//log.debug("getProcessId_start");
		List<String[]> processes = new ArrayList<String[]>();
		String[] command = { "", "" }; // 인자 없음
		//String tmp = "";
		BufferedReader input = null;
		try {
			String line;
			String separator = null;

			Process p = null;

			if (Globals.OS_TYPE == null) {
				throw new RuntimeException("Globals.OS_TYPE property value is needed!!!");
			}

			//log.debug("Globals.OS_TYPE:"+Globals.OS_TYPE);
			if ("WINDOWS".equals(Globals.OS_TYPE)) {
				p = Runtime.getRuntime().exec("tasklist /fo csv /nh /fi \"imagename eq " + processName + "*\"");
				separator = "\",\"";
				
				if (p == null) { // 2012.11 KISA 보안조치
					throw new RuntimeException("Can't execute process...");
				}
				input = new BufferedReader(new InputStreamReader(p.getInputStream()));
				if (input != null) {
					while ((line = input.readLine()) != null) {
						//log.debug("LINE__"+line);
						if (line.length() <= MAX_STR_LEN) {

							line = line.substring(1, line.length() - 1);
							String[] operator = line.split(separator);

							processes.add(operator);
						}
					}

					input.close();
				}
				
			} else if ("UNIX".equals(Globals.OS_TYPE)) {
				//tmp = "ps -eo \"%p %G %U %c %a\"|awk -F\" \" '{print $1,$2,$3,$4,$5}'|grep "+processName;
				//command [0] = tmp;
				//p = Runtime.getRuntime().exec(tmp);
				command[1] = processName;

				separator = " ";
				
				List<String>  resultList = executeProgram("getProcInfo", command);
				
				for (String result : resultList) {
					String[] operator = result.split(separator);

					processes.add(operator);
				}	
			}

		} catch (Exception err) {
			throw new RuntimeException(err);
		}

		return processes;
	}
}
