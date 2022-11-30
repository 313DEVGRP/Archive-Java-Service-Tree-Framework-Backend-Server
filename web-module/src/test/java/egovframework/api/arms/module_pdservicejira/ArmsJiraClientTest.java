package egovframework.api.arms.module_pdservicejira;

import com.atlassian.jira.rest.client.api.JiraRestClient;
import com.atlassian.jira.rest.client.api.domain.Issue;
import com.atlassian.jira.rest.client.api.domain.IssueType;
import com.atlassian.jira.rest.client.internal.async.AsynchronousJiraRestClientFactory;
import com.atlassian.util.concurrent.Promise;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.node.JsonNodeFactory;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.ObjectMapper;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;

public class ArmsJiraClientTest {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Test
    public void jiraTest() throws URISyntaxException, IOException {
        final AsynchronousJiraRestClientFactory factory = new AsynchronousJiraRestClientFactory();
        URI jiraServerUri = new URI("http://www.313.co.kr/jira");
        final JiraRestClient restClient = factory.createWithBasicHttpAuthentication(jiraServerUri, "admin", "####");
        try {

            Promise<Iterable<IssueType>> test = restClient.getMetadataClient().getIssueTypes();
            Iterable<IssueType> type = test.claim();
            for ( IssueType issue : type){
                System.out.println("Issue Name : " + issue.getName() + " , Issue ID : " + issue.getId());
            }

            final Issue issue = restClient.getIssueClient().getIssue("SP-689").claim();
            logger.info("issue=" + issue);
        }
        finally {
            // cleanup the restClient
            restClient.close();
        }
    }

    @Test
    public void create_IssueType() throws UnirestException {
        // The payload definition using the Jackson library

        JsonNodeFactory jnf = JsonNodeFactory.instance;
        ObjectNode payload = jnf.objectNode();
        {
            payload.put("name", "requirement");
            payload.put("description", "arms");
            payload.put("type", "standard");
            payload.put("atl_token", "BU13-CS25-DME9-DDDH|3a94d109d3f161e1c8741267e03261ad3a0e9263|lin");
        }

        // Connect Jackson ObjectMapper to Unirest

        Unirest.setObjectMapper(new ObjectMapper() {
            private com.fasterxml.jackson.databind.ObjectMapper jacksonObjectMapper
                    = new com.fasterxml.jackson.databind.ObjectMapper();

            public <T> T readValue(String value, Class<T> valueType) {
                try {
                    return jacksonObjectMapper.readValue(value, valueType);
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            }

            public String writeValue(Object value) {
                try {
                    logger.info("value =" + value);
                    logger.info("jacksonObjectMapper.writeValueAsString(value) = " + jacksonObjectMapper.writeValueAsString(value));
                    return jacksonObjectMapper.writeValueAsString(value);
                } catch (JsonProcessingException e) {
                    throw new RuntimeException(e);
                }
            }
        });

// This code sample uses the  'Unirest' library:
// http://unirest.io/java.html
        HttpResponse<JsonNode> response = Unirest
                .post("http://www.313.co.kr/jira/rest/api/2/issuetype")
                .basicAuth("admin", "####")
                .header("Accept", "application/json")
                .header("Content-Type", "application/json")
                .body(payload)
                .asJson();

        logger.info(response.toString());
        System.out.println(response.getBody());
    }

}
