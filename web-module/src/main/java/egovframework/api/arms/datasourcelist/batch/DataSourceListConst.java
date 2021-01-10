package egovframework.api.arms.datasourcelist.batch;

import egovframework.com.ext.jstree.support.util.StringUtils;

/**
 * Created by Administrator on 2021-01-09.
 */
public class DataSourceListConst {

    public static final String DATASOURCE_INFLUX_SCOUTER = "{\n" +
            "  \"name\": \"InfluxDB - Scouter\",\n" +
            "  \"type\": \"influxdb\",\n" +
            "  \"typeLogoUrl\": \"\",\n" +
            "  \"access\": \"proxy\",\n" +
            "  \"url\": \"http://influxdb:8086\",\n" +
            "  \"password\": \"\",\n" +
            "  \"user\": \"\",\n" +
            "  \"database\": \"scouterCounter\",\n" +
            "  \"basicAuth\": false,\n" +
            "  \"basicAuthUser\": \"\",\n" +
            "  \"basicAuthPassword\": \"\",\n" +
            "  \"withCredentials\": false,\n" +
            "  \"isDefault\": true,\n" +
            "  \"jsonData\": {},\n" +
            "  \"secureJsonFields\": {},\n" +
            "  \"readOnly\": false\n" +
            "}";

    public static final String DATASOURCE_ELK_APM = "{\n" +
            "  \"name\": \"Elasticsearch - APM\",\n" +
            "  \"type\": \"elasticsearch\",\n" +
            "  \"typeLogoUrl\": \"\",\n" +
            "  \"access\": \"proxy\",\n" +
            "  \"url\": \"http://es-coordinating:9200\",\n" +
            "  \"password\": \"\",\n" +
            "  \"user\": \"\",\n" +
            "  \"database\": \"apm-*\",\n" +
            "  \"basicAuth\": false,\n" +
            "  \"basicAuthUser\": \"\",\n" +
            "  \"basicAuthPassword\": \"\",\n" +
            "  \"withCredentials\": false,\n" +
            "  \"isDefault\": false,\n" +
            "  \"jsonData\": {\n" +
            "    \"esVersion\": 70,\n" +
            "    \"logLevelField\": \"\",\n" +
            "    \"logMessageField\": \"\",\n" +
            "    \"maxConcurrentShardRequests\": 5,\n" +
            "    \"timeField\": \"@timestamp\"\n" +
            "  },\n" +
            "  \"secureJsonFields\": {\n" +
            "    \"basicAuthPassword\": true\n" +
            "  },\n" +
            "  \"readOnly\": false\n" +
            "}";

    public static final String DATASOURCE_ELK_FILEBEAT = "{\n" +
            "  \"name\": \"Elasticsearch - Filebeat\",\n" +
            "  \"type\": \"elasticsearch\",\n" +
            "  \"typeLogoUrl\": \"\",\n" +
            "  \"access\": \"proxy\",\n" +
            "  \"url\": \"http://es-coordinating:9200\",\n" +
            "  \"password\": \"\",\n" +
            "  \"user\": \"\",\n" +
            "  \"database\": \"filebeat-*\",\n" +
            "  \"basicAuth\": false,\n" +
            "  \"basicAuthUser\": \"\",\n" +
            "  \"basicAuthPassword\": \"\",\n" +
            "  \"withCredentials\": false,\n" +
            "  \"isDefault\": false,\n" +
            "  \"jsonData\": {\n" +
            "    \"esVersion\": 70,\n" +
            "    \"logLevelField\": \"\",\n" +
            "    \"logMessageField\": \"\",\n" +
            "    \"maxConcurrentShardRequests\": 5,\n" +
            "    \"timeField\": \"@timestamp\"\n" +
            "  },\n" +
            "  \"secureJsonFields\": {},\n" +
            "  \"readOnly\": false\n" +
            "}";

    public static final String DATASOURCE_ELK_HEARTBEAT = "{\n" +
            "  \"name\": \"Elasticsearch - Heartbeat\",\n" +
            "  \"type\": \"elasticsearch\",\n" +
            "  \"typeLogoUrl\": \"\",\n" +
            "  \"access\": \"proxy\",\n" +
            "  \"url\": \"http://es-coordinating:9200\",\n" +
            "  \"password\": \"\",\n" +
            "  \"user\": \"\",\n" +
            "  \"database\": \"heartbeat-*\",\n" +
            "  \"basicAuth\": false,\n" +
            "  \"basicAuthUser\": \"\",\n" +
            "  \"basicAuthPassword\": \"\",\n" +
            "  \"withCredentials\": false,\n" +
            "  \"isDefault\": false,\n" +
            "  \"jsonData\": {\n" +
            "    \"esVersion\": 70,\n" +
            "    \"logLevelField\": \"\",\n" +
            "    \"logMessageField\": \"\",\n" +
            "    \"maxConcurrentShardRequests\": 5,\n" +
            "    \"timeField\": \"@timestamp\"\n" +
            "  },\n" +
            "  \"secureJsonFields\": {},\n" +
            "  \"readOnly\": false\n" +
            "}";

    public static final String DATASOURCE_ELK_METRICBEAT = "{\n" +
            "  \"name\": \"Elasticsearch - Metricbeat\",\n" +
            "  \"type\": \"elasticsearch\",\n" +
            "  \"typeLogoUrl\": \"\",\n" +
            "  \"access\": \"proxy\",\n" +
            "  \"url\": \"http://es-coordinating:9200\",\n" +
            "  \"password\": \"\",\n" +
            "  \"user\": \"\",\n" +
            "  \"database\": \"metricbeat-*\",\n" +
            "  \"basicAuth\": false,\n" +
            "  \"basicAuthUser\": \"\",\n" +
            "  \"basicAuthPassword\": \"\",\n" +
            "  \"withCredentials\": false,\n" +
            "  \"isDefault\": false,\n" +
            "  \"jsonData\": {\n" +
            "    \"esVersion\": 70,\n" +
            "    \"logLevelField\": \"\",\n" +
            "    \"logMessageField\": \"\",\n" +
            "    \"maxConcurrentShardRequests\": 5,\n" +
            "    \"timeField\": \"@timestamp\"\n" +
            "  },\n" +
            "  \"secureJsonFields\": {},\n" +
            "  \"readOnly\": false\n" +
            "}";

    public static final String DATASOURCE_ELK_PACKETBEAT = "{\n" +
            "  \"name\": \"Elasticsearch - Packetbeat\",\n" +
            "  \"type\": \"elasticsearch\",\n" +
            "  \"typeLogoUrl\": \"\",\n" +
            "  \"access\": \"proxy\",\n" +
            "  \"url\": \"http://es-coordinating:9200\",\n" +
            "  \"password\": \"\",\n" +
            "  \"user\": \"\",\n" +
            "  \"database\": \"packetbeat-*\",\n" +
            "  \"basicAuth\": false,\n" +
            "  \"basicAuthUser\": \"\",\n" +
            "  \"basicAuthPassword\": \"\",\n" +
            "  \"withCredentials\": false,\n" +
            "  \"isDefault\": false,\n" +
            "  \"jsonData\": {\n" +
            "    \"esVersion\": 70,\n" +
            "    \"logLevelField\": \"\",\n" +
            "    \"logMessageField\": \"\",\n" +
            "    \"maxConcurrentShardRequests\": 5,\n" +
            "    \"timeField\": \"@timestamp\"\n" +
            "  },\n" +
            "  \"secureJsonFields\": {},\n" +
            "  \"readOnly\": false\n" +
            "}";

    public static final String DATASOURCE_ELK_TOPBEAT = "{\n" +
            "  \"name\": \"Elasticsearch - Topbeat\",\n" +
            "  \"type\": \"elasticsearch\",\n" +
            "  \"typeLogoUrl\": \"\",\n" +
            "  \"access\": \"proxy\",\n" +
            "  \"url\": \"http://es-coordinating:9200\",\n" +
            "  \"password\": \"\",\n" +
            "  \"user\": \"\",\n" +
            "  \"database\": \"topbeat-*\",\n" +
            "  \"basicAuth\": false,\n" +
            "  \"basicAuthUser\": \"\",\n" +
            "  \"basicAuthPassword\": \"\",\n" +
            "  \"withCredentials\": false,\n" +
            "  \"isDefault\": false,\n" +
            "  \"jsonData\": {\n" +
            "    \"esVersion\": 70,\n" +
            "    \"logLevelField\": \"\",\n" +
            "    \"logMessageField\": \"\",\n" +
            "    \"maxConcurrentShardRequests\": 5,\n" +
            "    \"timeField\": \"@timestamp\"\n" +
            "  },\n" +
            "  \"secureJsonFields\": {},\n" +
            "  \"readOnly\": false\n" +
            "}";

    //Elasticsearch - Packetbeat,Elasticsearch - Topbeat
    public static String getDatasourceJson(String param) {
        if(StringUtils.equals(param, "InfluxDB - Scouter")){
            return DATASOURCE_INFLUX_SCOUTER;
        }else if(StringUtils.equals(param, "Elasticsearch - APM")){
            return DATASOURCE_ELK_APM;
        }else if(StringUtils.equals(param, "Elasticsearch - Filebeat")){
            return DATASOURCE_ELK_FILEBEAT;
        }else if(StringUtils.equals(param, "Elasticsearch - Heartbeat")){
            return DATASOURCE_ELK_HEARTBEAT;
        }else if(StringUtils.equals(param, "Elasticsearch - Metricbeat")){
            return DATASOURCE_ELK_METRICBEAT;
        }else if(StringUtils.equals(param, "Elasticsearch - Packetbeat")){
            return DATASOURCE_ELK_PACKETBEAT;
        }else if(StringUtils.equals(param, "Elasticsearch - Topbeat")){
            return DATASOURCE_ELK_TOPBEAT;
        }else{
            return "not found";
        }
    }
}
