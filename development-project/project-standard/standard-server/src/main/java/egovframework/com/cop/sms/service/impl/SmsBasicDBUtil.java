package egovframework.com.cop.sms.service.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.commons.dbcp.DataSourceConnectionFactory;
import org.apache.commons.dbcp.PoolableConnectionFactory;
import org.apache.commons.dbcp.PoolingDriver;
import org.apache.commons.pool.impl.GenericObjectPool;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 문자메시지를 위한 DB Util 클래스 (프레임워크 비종속 버전)
 * Apache commons의 DBCP를 활용한 예로 각 프로젝트에 맞게 수정 필요
 * (EX : DataSource 사용 등)
 *
 * @author 공통컴포넌트개발팀 한성곤
 * @since 2009.11.24
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.11.24  한성곤          최초 생성
 *
 * </pre>
 */
public class SmsBasicDBUtil {
	/** Driver load 여부 */
	private static boolean isDriverLoaded = false;

	/** Connection Pool Alias */
	private static final String JDBC_ALIAS = "default";
	/** JDBC Driver 명 */
	private static final String JDBC_DRIVER = "org.gjt.mm.mysql.Driver";
	/** JDBC 접속 URL */
	private static final String JDBC_URL = "jdbc:mysql://192.168.200.24:1621/com";
	/** JDBC 접속 사용자ID */
	private static final String JDBC_USER = "com";
	/** JDBC 접속 패스워드 */
	private static final String JDBC_PASSWORD = "com01";
	/** 한번에 pool에서 갖다 쓸 수 있는 최대 커넥션 개수 */
	private static final int MAX_ACTIVE = 20;
	/** 사용되지 않고 pool에 저정될 수 있는 최대 커넥션 개수 */
	private static final int MAX_IDLE = 5;
	/** 커넥션 timeout */
	private static final int MAX_WAIT = 20000;
	/** auto commit 여부 */
	private static final boolean DEFAULT_AUTOCOMMIT = true;
	/** read only 여부 */
	private static final boolean DEFAULT_READONLY = false;

	/** Logger */
	private static final Logger LOGGER = LoggerFactory.getLogger(SmsBasicDBUtil.class);

	/**
	 * Connection Pool 생성.
	 *
	 * @param alias
	 * @param bds
	 * @throws Exception
	 */
	protected static void createPools(String alias, BasicDataSource bds) {
		GenericObjectPool pool;

		pool = new GenericObjectPool(null);

		pool.setMaxActive(bds.getMaxActive());
		pool.setMaxIdle(bds.getMaxIdle());
		pool.setMaxWait(bds.getMaxWait());

		DataSourceConnectionFactory factory = new DataSourceConnectionFactory(bds);
		PoolableConnectionFactory poolable;

		poolable = new PoolableConnectionFactory(factory, pool, null, null, bds.getDefaultReadOnly(), bds.getDefaultAutoCommit());

		LOGGER.info("Pool : {}", poolable.getClass().getName());

		PoolingDriver poolingdriver = new PoolingDriver();
		poolingdriver.registerPool(alias, pool);

		//Class.forName("org.apache.commons.dbcp.PoolingDriver");
		//PoolingDriver driver = (PoolingDriver) DriverManager.getDriver("jdbc:apache:commons:dbcp:");
		//driver.registerPool(alias, pool);
	}

	protected static synchronized void loadDriver() {
		BasicDataSource bds = new BasicDataSource();

		bds.setDriverClassName(JDBC_DRIVER);
		bds.setUrl(JDBC_URL);
		bds.setUsername(JDBC_USER);
		bds.setPassword(JDBC_PASSWORD);
		bds.setMaxActive(MAX_ACTIVE);
		bds.setMaxIdle(MAX_IDLE);
		bds.setMaxWait(MAX_WAIT);
		bds.setDefaultAutoCommit(DEFAULT_AUTOCOMMIT);
		bds.setDefaultReadOnly(DEFAULT_READONLY);

		createPools(JDBC_ALIAS, bds);
		isDriverLoaded = true;
		LOGGER.info("Initialized pool : {}", JDBC_ALIAS);
	}

	public static Connection getConnection() throws Exception {
		if (!isDriverLoaded) {
			loadDriver();
		}

		Connection connection = DriverManager.getConnection("jdbc:apache:commons:dbcp:" + JDBC_ALIAS);
		return connection;
	}

	public static void close(ResultSet rs, Statement stmt, Connection conn) {
		if (rs != null)
			try {
				rs.close();
			} catch (Exception ignore) {
				LOGGER.debug("IGNORED: {}", ignore.getMessage());
			}
		if (stmt != null)
			try {
				stmt.close();
			} catch (Exception ignore) {
				LOGGER.debug("IGNORED: {}", ignore.getMessage());
			}
		if (conn != null)
			try {
				conn.close();
			} catch (Exception ignore) {
				LOGGER.debug("IGNORED: {}", ignore.getMessage());
			}
	}
}
