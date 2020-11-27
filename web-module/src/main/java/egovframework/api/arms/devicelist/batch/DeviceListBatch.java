package egovframework.api.arms.devicelist.batch;

import egovframework.com.cmm.service.EgovProperties;
import org.apache.http.client.HttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

/**
 * Created by Administrator on 2020-11-22.
 */
@Component
public class DeviceListBatch {

    @Scheduled(fixedDelay=60000*5, initialDelay =10000)
    //@Scheduled(cron="0 0/5 * * * ?")
    public void getInfoFromELK() throws Exception {
        HttpComponentsClientHttpRequestFactory factory = new HttpComponentsClientHttpRequestFactory();
        factory.setReadTimeout(5000); // 읽기시간초과, ms
        factory.setConnectTimeout(3000); // 연결시간초과, ms
        HttpClient httpClient = HttpClientBuilder.create()
                .setMaxConnTotal(100) // connection pool 적용
                .setMaxConnPerRoute(5) // connection pool 적용
                .build();
        factory.setHttpClient(httpClient); // 동기실행에 사용될 HttpClient 세팅
        RestTemplate restTemplate = new RestTemplate(factory);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        String postdata =   "{\n" +
                            "  \"aggs\": {\n" +
                            "    \"2\": {\n" +
                            "      \"terms\": {\n" +
                            "        \"field\": \"host.name.keyword\",\n" +
                            "        \"order\": {\n" +
                            "          \"_count\": \"desc\"\n" +
                            "        },\n" +
                            "        \"missing\": \"__missing__\",\n" +
                            "        \"size\": 5\n" +
                            "      }\n" +
                            "    }\n" +
                            "  },\n" +
                            "  \"size\": 0,\n" +
                            "  \"_source\": {\n" +
                            "    \"excludes\": []\n" +
                            "  },\n" +
                            "  \"stored_fields\": [\n" +
                            "    \"*\"\n" +
                            "  ],\n" +
                            "  \"script_fields\": {},\n" +
                            "  \"docvalue_fields\": [\n" +
                            "    {\n" +
                            "      \"field\": \"@timestamp\",\n" +
                            "      \"format\": \"date_time\"\n" +
                            "    },\n" +
                            "    {\n" +
                            "      \"field\": \"system.process.cpu.start_time\",\n" +
                            "      \"format\": \"date_time\"\n" +
                            "    }\n" +
                            "  ],\n" +
                            "  \"query\": {\n" +
                            "    \"bool\": {\n" +
                            "      \"must\": [],\n" +
                            "      \"filter\": [\n" +
                            "        {\n" +
                            "          \"match_all\": {}\n" +
                            "        }\n" +
                            "      ],\n" +
                            "      \"should\": [],\n" +
                            "      \"must_not\": []\n" +
                            "    }\n" +
                            "  }\n" +
                            "}";

        HttpEntity<String> request = new HttpEntity<String>(postdata, headers);

        String allinoneBaseUrl = EgovProperties.getProperty("allinone.monitoring.baseurl");
        String allinoneMetricbeatPatternStr = EgovProperties.getProperty("allinone.monitoring.metricbeatindex");
        String returnResultStr = restTemplate.postForObject( allinoneBaseUrl + allinoneMetricbeatPatternStr + "/_search", request, String.class);

        JSONParser parser = new JSONParser();
        Object obj = parser.parse( returnResultStr );
        JSONObject resultJsonObj = (JSONObject) obj;

        System.out.println(resultJsonObj.toJSONString());
    }
}
