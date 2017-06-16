package egovframework.com.cmm.util;

import java.io.Closeable;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Wrapper;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Utility class  to support to close resources
 * @author Vincent Han
 * @since 2014.09.18
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일        수정자       수정내용
 *  -------       --------    ---------------------------
 *   2014.09.18	표준프레임워크센터	최초 생성
 *   2017.03.07 	조성원 	시큐어코딩(ES)-부적절한 예외 처리[CWE-253, CWE-440, CWE-754]
 *
 * </pre>
 */
public class EgovResourceCloseHelper {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(EgovResourceCloseHelper.class);
	
	/**
	 * Resource close 처리. 
	 * @param resources
	 */
	public static void close(Closeable  ... resources) {
		for (Closeable resource : resources) {
			if (resource != null) {
				try {
					resource.close();
				//} catch (Exception ignore) {
					//EgovBasicLogger.ignore("Occurred Exception to close resource is ingored!!");
				//}
				//2017.03.07 	조성원 	시큐어코딩(ES)-부적절한 예외 처리[CWE-253, CWE-440, CWE-754]
				} catch (IOException ignore) {
					LOGGER.error("[IOException] : Connection Close");
				} catch (Exception ignore) {
					LOGGER.error("["+ ignore.getClass() +"] Connection Close : " + ignore.getMessage());
				}
			}
		}
	}
	
	/**
	 * JDBC 관련 resource 객체 close 처리
	 * @param objects
	 */
	public static void closeDBObjects(Wrapper ... objects) {
		for (Object object : objects) {
			if (object != null) {
				if (object instanceof ResultSet) {
					try {
						((ResultSet)object).close();
					//} catch (SQLException ignore) {
						//EgovBasicLogger.ignore("Occurred Exception to close resource is ingored!!");
					//} catch (Exception ignore) {
						//EgovBasicLogger.ignore("Occurred Exception to close resource is ingored!!");
					//}
					//2017.03.07 	조성원 	시큐어코딩(ES)-부적절한 예외 처리[CWE-253, CWE-440, CWE-754]
					} catch (SQLException ignore) {
						LOGGER.error("[SQLException] : Connection Close");
					} catch (Exception ignore) {
						LOGGER.error("["+ ignore.getClass() +"] Connection Close : " + ignore.getMessage());
					}
				} else if (object instanceof Statement) {
					try {
						((Statement)object).close();
					//} catch (SQLException ignore) {
						//EgovBasicLogger.ignore("Occurred Exception to close resource is ingored!!");
					//} catch (Exception ignore) {
						//EgovBasicLogger.ignore("Occurred Exception to close resource is ingored!!");
					//}
					//2017.03.07 	조성원 	시큐어코딩(ES)-부적절한 예외 처리[CWE-253, CWE-440, CWE-754]
					} catch (SQLException ignore) {
						LOGGER.error("[SQLException] : Connection Close");
					} catch (Exception ignore) {
						LOGGER.error("["+ ignore.getClass() +"] Connection Close : " + ignore.getMessage());
					}
				} else if (object instanceof Connection) {
					try {
						((Connection)object).close();
					//} catch (SQLException ignore) {
						//EgovBasicLogger.ignore("Occurred Exception to close resource is ingored!!");
					//} catch (Exception ignore) {
						//EgovBasicLogger.ignore("Occurred Exception to close resource is ingored!!");
					//}
					//2017.03.07 	조성원 	시큐어코딩(ES)-부적절한 예외 처리[CWE-253, CWE-440, CWE-754]
					} catch (SQLException ignore) {
						LOGGER.error("[SQLException] : Connection Close");
					} catch (Exception ignore) {
						LOGGER.error("["+ ignore.getClass() +"] Connection Close : " + ignore.getMessage());
					}
				} else {
					throw new IllegalArgumentException("Wrapper type is not found : " + object.toString());
				}
			}
		}
	}
	
	/**
	 * Socket 관련 resource 객체 close 처리
	 * @param objects
	 */
	public static void closeSocketObjects(Socket socket, ServerSocket server) {
		if (socket != null) {
			try {
				socket.shutdownOutput();
			//} catch (IOException ignore) {
				//EgovBasicLogger.ignore("Occurred Exception to close resource is ingored!!");
			//} catch (Exception ignore) {
				//EgovBasicLogger.ignore("Occurred Exception to close resource is ingored!!");
			//}
			//2017.03.07 	조성원 	시큐어코딩(ES)-부적절한 예외 처리[CWE-253, CWE-440, CWE-754]
			} catch (IOException ignore) {
				LOGGER.error("[IOException] : Connection Close");
			} catch (Exception ignore) {
				LOGGER.error("["+ ignore.getClass() +"] Connection Close : " + ignore.getMessage());
			}
			
			try {
				socket.close();
			//} catch (IOException ignore) {
				//EgovBasicLogger.ignore("Occurred Exception to close resource is ingored!!");
			//} catch (Exception ignore) {
				//EgovBasicLogger.ignore("Occurred Exception to close resource is ingored!!");
			//}
			//2017.03.07 	조성원 	시큐어코딩(ES)-부적절한 예외 처리[CWE-253, CWE-440, CWE-754]
			} catch (IOException ignore) {
				LOGGER.error("[IOException] : Connection Close");
			} catch (Exception ignore) {
				LOGGER.error("["+ ignore.getClass() +"] Connection Close : " + ignore.getMessage());
			}
		}
		
		if (server != null) {
			try {
				server.close();
			//} catch (IOException ignore) {
				//EgovBasicLogger.ignore("Occurred Exception to close resource is ingored!!");
			//} catch (Exception ignore) {
				//EgovBasicLogger.ignore("Occurred Exception to close resource is ingored!!");
			//}
			//2017.03.07 	조성원 	시큐어코딩(ES)-부적절한 예외 처리[CWE-253, CWE-440, CWE-754]
			} catch (IOException ignore) {
				LOGGER.error("[IOException] : Connection Close");
			} catch (Exception ignore) {
				LOGGER.error("["+ ignore.getClass() +"] Connection Close : " + ignore.getMessage());
			}
		}
	}
	
	/**
	 *  Socket 관련 resource 객체 close 처리
	 *  
	 * @param sockets
	 */
	public static void closeSockets(Socket ... sockets) {
		for (Socket socket : sockets) {
			if (socket != null) {
				try {
					socket.shutdownOutput();
				//} catch (IOException ignore) {
					//EgovBasicLogger.ignore("Occurred Exception to close resource is ingored!!");
				//} catch (Exception ignore) {
					//EgovBasicLogger.ignore("Occurred Exception to close resource is ingored!!");
				//}
				//2017.03.07 	조성원 	시큐어코딩(ES)-부적절한 예외 처리[CWE-253, CWE-440, CWE-754]
				} catch (IOException ignore) {
					LOGGER.error("[IOException] : Connection Close");
				} catch (Exception ignore) {
					LOGGER.error("["+ ignore.getClass() +"] Connection Close : " + ignore.getMessage());
				}
				
				try {
					socket.close();
				//} catch (IOException ignore) {
					//EgovBasicLogger.ignore("Occurred Exception to close resource is ingored!!");
				//} catch (Exception ignore) {
					//EgovBasicLogger.ignore("Occurred Exception to close resource is ingored!!");
				//}
				//2017.03.07 	조성원 	시큐어코딩(ES)-부적절한 예외 처리[CWE-253, CWE-440, CWE-754]
				} catch (IOException ignore) {
					LOGGER.error("[IOException] : Connection Close");
				} catch (Exception ignore) {
					LOGGER.error("["+ ignore.getClass() +"] Connection Close : " + ignore.getMessage());
				}
			}
		}
	}
}