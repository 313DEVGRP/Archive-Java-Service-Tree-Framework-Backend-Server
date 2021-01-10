package egovframework.api.arms.dashboardlist.service;

import egovframework.api.arms.dashboardlist.batch.DashboardListConst;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.ext.jstree.springHibernate.core.service.JsTreeHibernateServiceImpl;
import org.apache.http.client.HttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.Base64;

/**
 * Created by Administrator on 2021-01-10.
 */
@Service("DashboardListService")
public class DashboardListServiceImpl extends JsTreeHibernateServiceImpl implements DashboardListService {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());


    @Override
    public Integer updateDashboardToGrafana() throws Exception {

        HttpComponentsClientHttpRequestFactory factory = new HttpComponentsClientHttpRequestFactory();
        factory.setReadTimeout(5000); // 읽기시간초과, ms
        factory.setConnectTimeout(3000); // 연결시간초과, ms
        HttpClient httpClient = HttpClientBuilder.create()
                .setMaxConnTotal(100) // connection pool 적용
                .setMaxConnPerRoute(5) // connection pool 적용
                .build();
        factory.setHttpClient(httpClient); // 동기실행에 사용될 HttpClient 세팅

        RestTemplate restTemplate = new RestTemplate(factory);

        HttpHeaders headers = createHttpHeaders("admin","qwe123");
        headers.setContentType(MediaType.APPLICATION_JSON);

        String postdata = DashboardListConst.DASHBOARD_TEMPLATE;

        HttpEntity<String> request = new HttpEntity<String>(postdata, headers);

        String influxdbUrl = EgovProperties.getProperty("allinone.monitoring.influxdb.url");
        String influxdbBaseUrl = influxdbUrl + "/api/dashboards/db";
        String returnResultStr = restTemplate.postForObject( influxdbBaseUrl, request, String.class);


        return null;
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
