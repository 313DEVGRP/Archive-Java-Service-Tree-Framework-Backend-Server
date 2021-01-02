package egovframework.com.ext.jstree.support.util;

import egovframework.api.arms.devicelist.vo.DeviceListDTO;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.junit.BeforeClass;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
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
    public void getJsonObjectFromELKTest() throws ParseException {
        String orgStr = "{\n" +
                "    \"took\": 3590,\n" +
                "    \"timed_out\": false,\n" +
                "    \"_shards\": {\n" +
                "        \"total\": 13,\n" +
                "        \"successful\": 13,\n" +
                "        \"skipped\": 0,\n" +
                "        \"failed\": 0\n" +
                "    },\n" +
                "    \"hits\": {\n" +
                "        \"total\": {\n" +
                "            \"value\": 10000,\n" +
                "            \"relation\": \"gte\"\n" +
                "        },\n" +
                "        \"max_score\": null,\n" +
                "        \"hits\": []\n" +
                "    },\n" +
                "    \"aggregations\": {\n" +
                "        \"2\": {\n" +
                "            \"doc_count_error_upper_bound\": 0,\n" +
                "            \"sum_other_doc_count\": 16619,\n" +
                "            \"buckets\": [\n" +
                "                {\n" +
                "                    \"key\": \"jstree-backend-654b68476c-jrtpg\",\n" +
                "                    \"doc_count\": 593514\n" +
                "                },\n" +
                "                {\n" +
                "                    \"key\": \"jstree-backend-68ff5f655c-chckb\",\n" +
                "                    \"doc_count\": 354578\n" +
                "                },\n" +
                "                {\n" +
                "                    \"key\": \"5d6951d245a1\",\n" +
                "                    \"doc_count\": 336206\n" +
                "                },\n" +
                "                {\n" +
                "                    \"key\": \"jstree-backend-5b5746d7cc-9npd2\",\n" +
                "                    \"doc_count\": 109625\n" +
                "                },\n" +
                "                {\n" +
                "                    \"key\": \"1dc3be21a15d\",\n" +
                "                    \"doc_count\": 7436\n" +
                "                }\n" +
                "            ]\n" +
                "        }\n" +
                "    }\n" +
                "}";
        JSONParser jsonParser = new JSONParser();
        Object jsonObj = jsonParser.parse( orgStr );
        JSONObject resultJsonObj = (JSONObject) jsonObj;

        JSONObject filtedJsonObj = (JSONObject) jsonParser.parse( resultJsonObj.get("aggregations").toString() );
        JSONObject hostJsonObj = (JSONObject) jsonParser.parse( filtedJsonObj.get("2").toString() );
        JSONArray bucketJsonObjs = (JSONArray) jsonParser.parse( hostJsonObj.get("buckets").toString() );

        ArrayList<DeviceListDTO> deviceListDTOs = new ArrayList<DeviceListDTO>();
        for (Object bucketJsonObj: bucketJsonObjs) {
            JSONObject bucketJson = (JSONObject) bucketJsonObj;
            logger.info(bucketJson.get("key").toString());

            DeviceListDTO deviceListDTO = new DeviceListDTO();
            deviceListDTO.setC_monitor_device_hostname(bucketJson.get("key").toString());
            deviceListDTOs.add(deviceListDTO);
        }

        logger.info("list size = " + deviceListDTOs.size());

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
}
