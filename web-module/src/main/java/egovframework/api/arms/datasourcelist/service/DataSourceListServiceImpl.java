package egovframework.api.arms.datasourcelist.service;

import egovframework.api.arms.datasourcelist.batch.DataSourceListConst;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.ext.jstree.springHibernate.core.service.JsTreeHibernateServiceImpl;
import org.apache.http.client.HttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.*;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.Base64;

/**
 * Created by Administrator on 2021-01-09.
 */
@Service("DataSourceListService")
public class DataSourceListServiceImpl extends JsTreeHibernateServiceImpl implements DataSourceListService {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Override
    public Integer updateDatasourceListToGrafana() throws Exception {

        // 그라파나 셋팅
        // 데이터 소스 select
        // 있으면 pass, 없으면 데이터소스 입력
        // 프로퍼티에서 데이터소스 리스트 로드
        // 검색 후 없으면 const 에서 로드하여 입력
        String influxdbUrl = EgovProperties.getProperty("allinone.monitoring.influxdb.url");
        String theUrl = influxdbUrl + "/api/datasources/name/";

        HttpHeaders headers = createHttpHeaders("admin","qwe123");
        HttpEntity<String> entity = new HttpEntity<String>("parameters", headers);

        RestTemplate restTemplate = new RestTemplate();

        String datasourceList = EgovProperties.getProperty("allinone.monitoring.influxdb.datasource");
        String[] datasourceArray = datasourceList.split(",");

        Integer returnCount = 0;
        for (int i = 0; i < datasourceArray.length; i++) {
            String datasourceUrl = theUrl + datasourceArray[i];
            logger.info(datasourceUrl);
            try {
                ResponseEntity<String> response = restTemplate.exchange(datasourceUrl, HttpMethod.GET, entity, String.class);
                logger.info(response.getStatusCode() + ":" + response.getBody().toString());
            }
            catch (Exception ek) {
                returnCount++;
                logger.info("not found : "+ datasourceArray[i]);

                HttpComponentsClientHttpRequestFactory factory = new HttpComponentsClientHttpRequestFactory();
                factory.setReadTimeout(5000); // 읽기시간초과, ms
                factory.setConnectTimeout(3000); // 연결시간초과, ms
                HttpClient httpClient = HttpClientBuilder.create()
                        .setMaxConnTotal(100) // connection pool 적용
                        .setMaxConnPerRoute(5) // connection pool 적용
                        .build();
                factory.setHttpClient(httpClient); // 동기실행에 사용될 HttpClient 세팅

                RestTemplate addRestTemplate = new RestTemplate(factory);

                HttpHeaders addheaders = createHttpHeaders("admin","qwe123");
                addheaders.setContentType(MediaType.APPLICATION_JSON);

                String postdata = DataSourceListConst.getDatasourceJson(datasourceArray[i]);

                HttpEntity<String> request = new HttpEntity<String>(postdata, addheaders);

                String influxdbBaseUrl = influxdbUrl + "/api/datasources";
                String returnResultStr = addRestTemplate.postForObject( influxdbBaseUrl, request, String.class);

                logger.info(returnResultStr);
            }
        }
        return returnCount;
    }

    private HttpHeaders createHttpHeaders(String user, String password)
    {
        String notEncoded = user + ":" + password;
        String encodedAuth = Base64.getEncoder().encodeToString(notEncoded.getBytes());
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.add("Authorization", "Basic " + encodedAuth);
        return headers;
    }

}
