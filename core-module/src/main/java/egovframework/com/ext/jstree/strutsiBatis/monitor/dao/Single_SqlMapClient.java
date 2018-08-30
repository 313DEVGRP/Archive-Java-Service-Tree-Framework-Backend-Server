package egovframework.com.ext.jstree.strutsiBatis.monitor.dao;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class Single_SqlMapClient {
	private static SqlMapClient sqlMapper;

	public static SqlMapClient getSqlMapper() {
		if (sqlMapper == null) {
			Reader reader = null;
			try {
				reader = Resources.getResourceAsReader("sqlMapConfig.xml");
				sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);

			} catch (IOException e) {
				throw new RuntimeException(
						"Load SqlMapConfig.xml Error : " + e, e);
			} finally {
			}
		}
		return sqlMapper;
	}
}
