package egovframework.com.ext.jstree.support.util;

import org.apache.commons.lang3.time.DateFormatUtils;
import org.apache.http.client.HttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.junit.BeforeClass;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.*;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.web.client.RestTemplate;

import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class Java8LambdaTest {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    static List<Java8Lambda> persons;

    @BeforeClass
    public static void setUpBeforeClass() throws Exception {
        persons =
                Arrays.asList(
                        new Java8Lambda("Max", 18),
                        new Java8Lambda("Peter", 23),
                        new Java8Lambda("Pamela", 23),
                        new Java8Lambda("David", 12));
    }

    @Test
    public void functionalJavaTest1() {
        System.out.println("=== RunnableTest ===");
        // Anonymous Runnable
        Runnable r1 = new Runnable() {
            @Override
            public void run() {
                System.out.println("Hello world one!");
            }
        };

        // Lambda Runnable
        Runnable r2 = () -> System.out.println("Hello world two!");

        // Run em!
        r1.run();
        r2.run();
    }

    @Test
    public void functionalJavaOutLine() {
        List<String> myList =
                Arrays.asList("a1", "a2", "b1", "c2", "c1");

        myList
                .stream()
                .filter(s -> s.startsWith("c"))
                .map(String::toUpperCase)
                .sorted()
                .forEach(System.out::println);
    }

    @Test
    public void functionalJavaStreamTest(){
        Arrays.asList("a1", "a2", "a3")
                .stream()
                .findFirst()
                .ifPresent(System.out::println);
    }

    @Test
    public void fuctionalJavaStreamNoneCollectionTest(){
        Stream.of("a1", "a2", "a3")
                .findFirst()
                .ifPresent(System.out::println);
    }

    @Test
    public void functionalJavaIntStreamTest(){
        IntStream.range(1, 4)
                .forEach(System.out::println);
    }

    @Test
    public void functionalJavaPridicateTest(){
        Arrays.stream(new int[] {1, 2, 3})
                .map(n -> 2 * n + 1)
                .average()
                .ifPresent(System.out::println);
    }

    @Test
    public void functionalJavaConvertStreamTest(){
        Stream.of("a1", "a2", "a3")
                .map(s -> s.substring(1))
                .mapToInt(Integer::parseInt)
                .max()
                .ifPresent(System.out::println);
    }

    @Test
    public void functionalJavaConvertObjTest(){
        IntStream.range(1, 4)
                .mapToObj(i -> "a" + i)
                .forEach(System.out::println);
    }

    @Test
    public void functionalJavaConvertInteractiveTest(){
        Stream.of(1.0, 2.0, 3.0)
                .mapToInt(Double::intValue)
                .mapToObj(i -> "a" + i)
                .forEach(System.out::println);
    }

    @Test
    public void functionalJavaFilterTest(){
        Stream.of("d2", "a2", "b1", "b3", "c")
                .filter(s -> { System.out.println("filter: " + s); return true; })
                .forEach(s -> System.out.println("forEach: " + s));
    }

    @Test
    public void functionalJavaMapTest(){
        Stream.of("d2", "a2", "b1", "b3", "c")
                .map(s -> { System.out.println("map: " + s); return s.toUpperCase(); })
                .anyMatch(s -> { System.out.println("anyMatch: " + s); return s.startsWith("A"); });
    }

    @Test
    public void functionalJavaMapFilterMixTest(){
        Stream.of("d2", "a2", "b1", "b3", "c")
                .map(s -> { System.out.println("map: " + s); return s.toUpperCase(); })
                .filter(s -> { System.out.println("filter: " + s); return s.startsWith("A"); })
                .forEach(s -> System.out.println("forEach: " + s));
    }

    @Test
    public void functionalJavaMapFilterOrderTest(){
        Stream.of("d2", "a2", "b1", "b3", "c")
                .filter(s -> { System.out.println("filter: " + s); return s.startsWith("a"); })
                .map(s -> { System.out.println("map: " + s); return s.toUpperCase(); })
                .forEach(s -> System.out.println("forEach: " + s));
    }

    @Test
    public void functionalJavaMapFilterSortMixTest(){
        Stream.of("d2", "a2", "b1", "b3", "c")
                .sorted((s1, s2) -> { System.out.printf("sort: %s; %s\n", s1, s2); return s1.compareTo(s2); })
                .filter(s -> { System.out.println("filter: " + s); return s.startsWith("a"); })
                .map(s -> { System.out.println("map: " + s); return s.toUpperCase(); })
                .forEach(s -> System.out.println("forEach: " + s));
    }

    @Test
    public void functionalJavaMapFilterSortPerformanceTest(){
        Stream.of("d2", "a2", "b1", "b3", "c")
                .filter(s -> {
                    System.out.println("filter: " + s);
                    return s.startsWith("a");
                })
                .sorted((s1, s2) -> {
                    System.out.printf("sort: %s; %s\n", s1, s2);
                    return s1.compareTo(s2);
                })
                .map(s -> {
                    System.out.println("map: " + s);
                    return s.toUpperCase();
                })
                .forEach(s -> System.out.println("forEach: " + s));
    }

    @Test
    public void functionalJavaCollectTest(){
        List<Java8Lambda> filtered =
                persons
                        .stream()
                        .filter(p -> p.name.startsWith("P"))
                        .collect(Collectors.toList());

        System.out.println(filtered);
    }


    @Test
    public void getJsonObjectFromInfluxDBTest() throws ParseException {
        String orgStr = "{\n" +
                "  \"results\": [\n" +
                "    {\n" +
                "      \"statement_id\": 0,\n" +
                "      \"series\": [\n" +
                "        {\n" +
                "          \"name\": \"counter\",\n" +
                "          \"columns\": [\n" +
                "            \"key\",\n" +
                "            \"value\"\n" +
                "          ],\n" +
                "          \"values\": [\n" +
                "            [\n" +
                "              \"obj\",\n" +
                "              \"/16679af642a5/testwww313cokr\"\n" +
                "            ],\n" +
                "            [\n" +
                "              \"obj\",\n" +
                "              \"/5d6951d245a1/testwww313cokr\"\n" +
                "            ],\n" +
                "            [\n" +
                "              \"obj\",\n" +
                "              \"/6d6ea7e0b0f9/testwww313cokr\"\n" +
                "            ],\n" +
                "            [\n" +
                "              \"obj\",\n" +
                "              \"/9eb75e7e6e3e/www313cokr\"\n" +
                "            ],\n" +
                "            [\n" +
                "              \"obj\",\n" +
                "              \"/DELLR710-SERVER/dockerTomcat\"\n" +
                "            ],\n" +
                "            [\n" +
                "              \"obj\",\n" +
                "              \"/a6bc99072812/www313cokr\"\n" +
                "            ],\n" +
                "            [\n" +
                "              \"obj\",\n" +
                "              \"/cf91e7a17560/testwww313cokr\"\n" +
                "            ],\n" +
                "            [\n" +
                "              \"obj\",\n" +
                "              \"/ef7ac7c4c30b/www313cokr\"\n" +
                "            ],\n" +
                "            [\n" +
                "              \"obj\",\n" +
                "              \"/ff3377c71608/www313cokr\"\n" +
                "            ],\n" +
                "            [\n" +
                "              \"obj\",\n" +
                "              \"/jstree-backend-5b5746d7cc-9npd2/www313cokr\"\n" +
                "            ],\n" +
                "            [\n" +
                "              \"obj\",\n" +
                "              \"/jstree-backend-5bdb8776bb-5lklt/www313cokr\"\n" +
                "            ],\n" +
                "            [\n" +
                "              \"obj\",\n" +
                "              \"/jstree-backend-5bdb8776bb-kqjmg/www313cokr\"\n" +
                "            ],\n" +
                "            [\n" +
                "              \"obj\",\n" +
                "              \"/jstree-backend-5c6c68b8ff-m6rrp/www313cokr\"\n" +
                "            ],\n" +
                "            [\n" +
                "              \"obj\",\n" +
                "              \"/jstree-backend-654b68476c-jrtpg/www313cokr\"\n" +
                "            ]\n" +
                "          ]\n" +
                "        }\n" +
                "      ]\n" +
                "    }\n" +
                "  ]\n" +
                "}";
        JSONParser jsonParser = new JSONParser();
        Object jsonObj = jsonParser.parse( orgStr );
        JSONObject resultJsonObj = (JSONObject) jsonObj;

        JSONArray resultArrJsonObj = (JSONArray) jsonParser.parse( resultJsonObj.get("results").toString() );
        JSONObject filteredresultArrJsonObj = (JSONObject) resultArrJsonObj.get(0);

        JSONArray seriesJsonObj = (JSONArray) jsonParser.parse( filteredresultArrJsonObj.get("series").toString() );
        JSONObject filteredSeriesJsonObj = (JSONObject) seriesJsonObj.get(0);

        JSONArray hostStrJsonObjs = (JSONArray) jsonParser.parse( filteredSeriesJsonObj.get("values").toString() );

        for (int i = 0; i < hostStrJsonObjs.size(); i++) {
            JSONArray hostStrArr = (JSONArray) hostStrJsonObjs.get(i);
            logger.info(hostStrArr.get(1).toString());
        }

    }

    //@Test
    public void getJsonObjectFromInfluxDBapiTest() throws ParseException {

        String theUrl = "http://192.168.25.46:3000/api/datasources/1";
        RestTemplate restTemplate = new RestTemplate();
        try {
            HttpHeaders headers = createHttpHeaders("admin","qwe123");
            HttpEntity<String> entity = new HttpEntity<String>("parameters", headers);
            ResponseEntity<String> response = restTemplate.exchange(theUrl, HttpMethod.GET, entity, String.class);
            System.out.println("Result - status ("+ response.getStatusCode() + ") has body: " + response.hasBody());

            logger.info(response.getBody().toString());
        }
        catch (Exception eek) {
            System.out.println("** Exception: "+ eek.getMessage());
        }

    }

    @Test
    public void getDatasourceByNameTest() throws ParseException {

        String theUrl = "http://192.168.25.46:3000/api/datasources/name/InfluxDB - Scouter";
        RestTemplate restTemplate = new RestTemplate();
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

        }
        catch (Exception eek) {
            System.out.println("** Exception: "+ eek.getMessage());
        }

    }

    //@Test
    public void putJsonObjectFromInfluxDBapiTest() throws ParseException {

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

        String postdata =   "{\n" +
                "  \"name\":\"test_datasource\",\n" +
                "  \"type\":\"influxdb\",\n" +
                "  \"url\":\"http://influxdb:8086313\",\n" +
                "  \"access\":\"proxy\",\n" +
                "  \"basicAuth\":false\n" +
                "}";

        HttpEntity<String> request = new HttpEntity<String>(postdata, headers);

        String influxdbBaseUrl = "http://192.168.25.46:3000/api/datasources";
        String returnResultStr = restTemplate.postForObject( influxdbBaseUrl, request, String.class);

        logger.info(returnResultStr);

    }

    //@Test
    public void getDashboardDataTest() throws ParseException {
        String theUrl = "http://192.168.25.46:3000/api/search?query=org";
        RestTemplate restTemplate = new RestTemplate();
        try {
            HttpHeaders headers = createHttpHeaders("admin","qwe123");
            HttpEntity<String> entity = new HttpEntity<String>("parameters", headers);
            ResponseEntity<String> response = restTemplate.exchange(theUrl, HttpMethod.GET, entity, String.class);
            System.out.println("Result - status ("+ response.getStatusCode() + ") has body: " + response.hasBody());

            logger.info(response.getBody().toString());

            JSONParser jsonParser = new JSONParser();
            Object jsonObj = jsonParser.parse( response.getBody().toString() );
            JSONArray hostStrJsonObjs = (JSONArray) jsonObj;

            for (int i = 0; i < hostStrJsonObjs.size(); i++) {
                JSONObject hostStrJsonObj = (JSONObject) hostStrJsonObjs.get(i);
                logger.info(hostStrJsonObj.get("uid").toString());

                ///api/dashboards/uid/cIBgcSjkk
                String dashboardUrl = "http://192.168.25.46:3000/api/dashboards/uid/" + hostStrJsonObj.get("uid").toString();
                ResponseEntity<String> dashboardResponse = restTemplate.exchange(dashboardUrl, HttpMethod.GET, entity, String.class);
                logger.info(dashboardResponse.getBody().toString());
            }

        }
        catch (Exception eek) {
            System.out.println("** Exception: "+ eek.getMessage());
        }
    }


    @Test
    public void containStringTest() throws ParseException {
        String mainStr = "/a6bc99072812/www313cokr";
        String searchStr = "a6bc99072812";

        if(StringUtils.contains(mainStr, searchStr)){
            logger.info("true");
        }else{
            logger.info("false");
        }

        Date today = new Date();
        String dateFormat = DateFormatUtils.format(today, "yyyy-MM-dd");
        System.out.println("yyyy-MM-dd HH:mm:ss = " + dateFormat);
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
