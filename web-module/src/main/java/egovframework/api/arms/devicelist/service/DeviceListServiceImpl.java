package egovframework.api.arms.devicelist.service;

import egovframework.api.PropertiesReader;
import egovframework.api.arms.devicelist.vo.DeviceListDTO;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.ext.jstree.springHibernate.core.service.JsTreeHibernateServiceImpl;
import egovframework.com.ext.jstree.support.util.StringUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.apache.http.client.HttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.hibernate.criterion.Order;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.*;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2020-11-08.
 */
@Service("DeviceListService")
public class DeviceListServiceImpl extends JsTreeHibernateServiceImpl implements DeviceListService{

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    //database jstree method 를 활용하여 full list를 얻어온다. -> 디비에 등록된 host full list
    //elasticsearch api 를 활용해서 full list 를 얻어온다. -> ELK에 등록된 host full list
    //차집합을 통해 디비에 등록할 리스트를 추린다.
    //추려진 데이터를 jstree method api를 통해 업데이트 한다.


    @Override
    public List<DeviceListDTO> getAllDeviceListsFromJstree() throws Exception {

        DeviceListDTO jsTreeHibernateDTO = new DeviceListDTO();
        jsTreeHibernateDTO.setOrder(Order.asc("c_id"));
        List<DeviceListDTO> list = this.getChildNode(jsTreeHibernateDTO);
        return list;
    }

    @Override
    public List<DeviceListDTO> getDeviceListsFromELK() throws Exception {

        JSONArray jsonArrayInfoFromELK = this.getInfoFromELK();

        ArrayList<DeviceListDTO> deviceListDTOs = new ArrayList<DeviceListDTO>();
        for (Object bucketJsonObj: jsonArrayInfoFromELK) {
            JSONObject bucketJson = (JSONObject) bucketJsonObj;
            logger.info(bucketJson.get("key").toString());

            DeviceListDTO deviceListDTO = new DeviceListDTO();
            deviceListDTO.setC_title(bucketJson.get("key").toString());
            deviceListDTO.setC_monitor_device_hostname(bucketJson.get("key").toString());
            //포지션 잡아야 함
            deviceListDTOs.add(deviceListDTO);
        }

        return deviceListDTOs;
    }

    public List<DeviceListDTO> getDeviceListsFromInfluxDB() throws Exception {

        JSONArray jsonArrayInfoFromInfluxDB = this.getInfoFromInfluxDB();

        ArrayList<DeviceListDTO> deviceListDTOs = new ArrayList<DeviceListDTO>();
        for (Object bucketJsonObj: jsonArrayInfoFromInfluxDB) {
            String bucketJson = (String) bucketJsonObj;
            logger.info(bucketJson);

            DeviceListDTO deviceListDTO = new DeviceListDTO();
            deviceListDTO.setC_monitor_url_scouter(bucketJson);
            //포지션 잡아야 함
            deviceListDTOs.add(deviceListDTO);
        }

        return deviceListDTOs;
    }

    @Override
    public List<DeviceListDTO> getDeviceListDifference(List<DeviceListDTO> jstreeDeviceList, List<DeviceListDTO> elkDeviceLists) throws Exception {

        ArrayList<String> jstreeDeviceStringList = new ArrayList<String>();
        for (DeviceListDTO deviceListDTO: jstreeDeviceList) {
            logger.info("DB List from jstree = " + deviceListDTO.getC_monitor_device_hostname());
            jstreeDeviceStringList.add(deviceListDTO.getC_monitor_device_hostname());
        }

        ArrayList<String> differences = new ArrayList<String>();
        ArrayList<String> elkDeviceStringList = new ArrayList<String>();
        for (DeviceListDTO deviceListDTO : elkDeviceLists) {
            logger.info("ELK List from API = " + deviceListDTO.getC_monitor_device_hostname());
            elkDeviceStringList.add(deviceListDTO.getC_monitor_device_hostname());

            if ( jstreeDeviceStringList.contains(deviceListDTO.getC_monitor_device_hostname())){
                logger.info("contained check" + deviceListDTO.getC_monitor_device_hostname());
            }else {
                differences.add(deviceListDTO.getC_monitor_device_hostname());
            }
        }

        ArrayList<DeviceListDTO> targetList = new ArrayList<DeviceListDTO>();
        for (String insertTargetDeviceHost : differences) {
            logger.info("difference check =" + insertTargetDeviceHost);

            DeviceListDTO deviceListDTO = new DeviceListDTO();
            deviceListDTO.setC_title(insertTargetDeviceHost);
            deviceListDTO.setC_monitor_device_hostname(insertTargetDeviceHost);
            deviceListDTO.setC_monitor_url_apm(insertTargetDeviceHost);
            deviceListDTO.setC_monitor_url_filebeat(insertTargetDeviceHost);
            deviceListDTO.setC_monitor_url_heartbeat(insertTargetDeviceHost);
            deviceListDTO.setC_monitor_url_metricbeat(insertTargetDeviceHost);
            deviceListDTO.setC_monitor_url_packetbeat(insertTargetDeviceHost);
            deviceListDTO.setC_monitor_url_topbeat(insertTargetDeviceHost);
            deviceListDTO.setC_parentid(new Long(2));
            deviceListDTO.setRef(new Long(2));
            deviceListDTO.setC_type("default");

            targetList.add(deviceListDTO);
        }

        return targetList;
    }

    @Override
    @Transactional(rollbackFor = { Exception.class }, propagation = Propagation.REQUIRED)
    public Integer updateDeviceListToJstree() throws Exception {

        //1. 기존의 디비에서 getDeviceListsFromInfluxDB 를 대입해 업데이트 한다.
        //database jstree method 를 활용하여 full list를 얻어온다. -> 디비에 등록된 host full list
        List<DeviceListDTO> deviceListsFromJstree = getAllDeviceListsFromJstree();

        //elasticsearch api 를 활용해서 full list 를 얻어온다. -> ELK에 등록된 host full list
        List<DeviceListDTO> deviceListsFromELK = getDeviceListsFromELK();

        //차집합을 통해 디비에 등록할 리스트를 추린다.
        List<DeviceListDTO> differenceUpdateSet = getDeviceListDifference(deviceListsFromJstree, deviceListsFromELK);

        for (DeviceListDTO deviceListDTO: differenceUpdateSet) {
            this.addNode(deviceListDTO);
        }


        //influxdb api 를 활용해서 full list 를 얻어온다 -> InfluxDB에 등록된 host full list
        List<DeviceListDTO> deviceListsFromInfluxDB = getDeviceListsFromInfluxDB();

        for ( DeviceListDTO jstreeDeviceDTO : deviceListsFromJstree ) {

            String deviceHostStr = jstreeDeviceDTO.getC_monitor_device_hostname();

            for ( DeviceListDTO influxdbDeviceDTO : deviceListsFromInfluxDB ){
                String deviceScouterStr = influxdbDeviceDTO.getC_monitor_url_scouter();

                if(StringUtils.contains(deviceScouterStr, deviceHostStr)){
                    jstreeDeviceDTO.setC_monitor_url_scouter(deviceScouterStr);
                    jstreeDeviceDTO.setC_monitor_url_apm(deviceHostStr);
                    jstreeDeviceDTO.setC_monitor_url_filebeat(deviceHostStr);
                    jstreeDeviceDTO.setC_monitor_url_heartbeat(deviceHostStr);
                    jstreeDeviceDTO.setC_monitor_url_metricbeat(deviceHostStr);
                    jstreeDeviceDTO.setC_monitor_url_packetbeat(deviceHostStr);
                    jstreeDeviceDTO.setC_monitor_url_topbeat(deviceHostStr);
                    this.alterNode(jstreeDeviceDTO);
                }
            }

        }

        return differenceUpdateSet.size();
    }

    public JSONArray getInfoFromELK() throws Exception {
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

        Date today = new Date();
        String dateFormat = DateFormatUtils.format(today, "yyyy-MM-dd");
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
                "        },\n" +
                "        {\n" +
                "          \"range\": {\n" +
                "            \"@timestamp\": {\n" +
                "              \"format\": \"strict_date_optional_time\",\n" +
                "              \"gte\": \"" + dateFormat + "T00:00:00.000Z\",\n" +
                "              \"lte\": \"" + dateFormat + "T23:59:00.000Z\"\n" +
                "            }\n" +
                "          }\n" +
                "        }\n" +
                "      ],\n" +
                "      \"should\": [],\n" +
                "      \"must_not\": []\n" +
                "    }\n" +
                "  }\n" +
                "}";

        HttpEntity<String> request = new HttpEntity<String>(postdata, headers);

        PropertiesReader propertiesReader = new PropertiesReader("egovframework/egovProps/globals.properties");
        String allinoneBaseUrl = propertiesReader.getProperty("allinone.monitoring.baseurl");
        String allinoneMetricbeatPatternStr = propertiesReader.getProperty("allinone.monitoring.metricbeatindex");
        String returnResultStr = restTemplate.postForObject( allinoneBaseUrl + allinoneMetricbeatPatternStr + "/_search", request, String.class);

        JSONParser jsonParser = new JSONParser();
        Object jsonObj = jsonParser.parse( returnResultStr );
        JSONObject resultJsonObj = (JSONObject) jsonObj;

        JSONObject filtedJsonObj = (JSONObject) jsonParser.parse( resultJsonObj.get("aggregations").toString() );
        JSONObject hostJsonObj = (JSONObject) jsonParser.parse( filtedJsonObj.get("2").toString() );
        JSONArray bucketJsonObjs = (JSONArray) jsonParser.parse( hostJsonObj.get("buckets").toString() );

        logger.info(resultJsonObj.toJSONString());

        return bucketJsonObjs;
    }

    public JSONArray getInfoFromInfluxDB() throws Exception {
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

        HttpEntity<String> request = new HttpEntity<String>(headers);

        PropertiesReader propertiesReader = new PropertiesReader("egovframework/egovProps/globals.properties");
        String influxdbBaseUrl = propertiesReader.getProperty("allinone.monitoring.influx.url");
        String influxdbBasePath = propertiesReader.getProperty("allinone.monitoring.influx.path");
        String datasourceId = getDatasourceID();
        String influxdbBaseQuery = propertiesReader.getProperty("allinone.monitoring.influx.query");
        logger.info("====>" + influxdbBaseUrl+influxdbBasePath+datasourceId+influxdbBaseQuery);
        String fullUrl = influxdbBaseUrl+influxdbBasePath+datasourceId+influxdbBaseQuery;
        String returnResultStr = restTemplate.postForObject(fullUrl , request, String.class);

        JSONParser jsonParser = new JSONParser();
        Object jsonObj = jsonParser.parse( returnResultStr );
        JSONObject resultJsonObj = (JSONObject) jsonObj;

        JSONArray resultArrJsonObj = (JSONArray) jsonParser.parse( resultJsonObj.get("results").toString() );
        JSONObject filteredresultArrJsonObj = (JSONObject) resultArrJsonObj.get(0);

        JSONArray seriesJsonObj = (JSONArray) jsonParser.parse( filteredresultArrJsonObj.get("series").toString() );
        JSONObject filteredSeriesJsonObj = (JSONObject) seriesJsonObj.get(0);

        JSONArray hostStrJsonObjs = (JSONArray) jsonParser.parse( filteredSeriesJsonObj.get("values").toString() );

        JSONArray returnJsonArray = new JSONArray();
        for (int i = 0; i < hostStrJsonObjs.size(); i++) {
            JSONArray hostStrArr = (JSONArray) hostStrJsonObjs.get(i);
            logger.info(hostStrArr.get(1).toString());
            returnJsonArray.add(hostStrArr.get(1).toString());
        }

        return returnJsonArray;
    }

    public String getDatasourceID() throws IOException {

        PropertiesReader propertiesReader = new PropertiesReader("egovframework/egovProps/globals.properties");
        String influxdbBaseUrl = propertiesReader.getProperty("allinone.monitoring.influx.url");
        String theUrl = influxdbBaseUrl + "/api/datasources/name/InfluxDB - Scouter";
        RestTemplate restTemplate = new RestTemplate();
        String returnStr = "";
        try {
            HttpHeaders headers = createHttpHeaders("admin","qwe123");
            HttpEntity<String> entity = new HttpEntity<String>("parameters", headers);
            ResponseEntity<String> response = restTemplate.exchange(theUrl, HttpMethod.GET, entity, String.class);
            System.out.println("Result - status ("+ response.getStatusCode() + ") has body: " + response.hasBody());

            logger.info(response.getBody().toString());
            JSONParser jsonParser = new JSONParser();
            Object jsonObj = jsonParser.parse( response.getBody().toString() );
            JSONObject hostStrJsonObj = (JSONObject) jsonObj;
            logger.info(hostStrJsonObj.get("id").toString());

            returnStr = hostStrJsonObj.get("id").toString();
        }
        catch (Exception eek) {
            System.out.println("** Exception: "+ eek.getMessage());
        }

        return returnStr;
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
