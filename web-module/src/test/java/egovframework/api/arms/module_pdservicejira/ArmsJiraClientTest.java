package egovframework.api.arms.module_pdservicejira;

import com.atlassian.jira.rest.client.api.JiraRestClient;
import com.atlassian.jira.rest.client.api.domain.*;
import com.atlassian.jira.rest.client.api.domain.input.IssueInput;
import com.atlassian.jira.rest.client.api.domain.input.IssueInputBuilder;
import com.atlassian.jira.rest.client.api.domain.input.VersionInput;
import com.atlassian.jira.rest.client.internal.async.AsynchronousJiraRestClientFactory;
import com.atlassian.util.concurrent.Promise;
import org.joda.time.DateTime;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.sql.Timestamp;
import java.util.Collections;

public class ArmsJiraClientTest {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    public JiraRestClient getJiraRestClient() throws URISyntaxException {
        final AsynchronousJiraRestClientFactory factory = new AsynchronousJiraRestClientFactory();
        URI jiraServerUri = new URI("http://www.313.co.kr/jira");
        return factory.createWithBasicHttpAuthentication(jiraServerUri, "admin", "flexjava");
    }

    @Test
    public void jiraTest() throws URISyntaxException, IOException {
        final JiraRestClient restClient = getJiraRestClient();
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


    //a-RMS :: Jira Project 를 로드하여 a-RMS에 적재 할 수 있어야 한다.
    @Test
    public void getAll_JiraProject() throws URISyntaxException {
        final JiraRestClient restClient = getJiraRestClient();
        Promise<Iterable<BasicProject>> promise = restClient.getProjectClient().getAllProjects();
        Iterable<BasicProject> allProject = promise.claim();
        for (BasicProject project: allProject) {
            logger.info("project -> " + project.getName());
            logger.info("project -> " + project.getKey());
            logger.info("project -> " + project.getSelf());
        }

    }

    @Test
    public void get_JiraProject() throws URISyntaxException {
        final JiraRestClient restClient = getJiraRestClient();
        String jira_Project_KEY = "SP";
        Promise<Project> promise = restClient.getProjectClient().getProject(jira_Project_KEY);
        Project project = promise.claim();
        logger.info("getSingle_JiraProject => " + project.getDescription());
        logger.info("getSingle_JiraProject => " + project.getKey());
        logger.info("getSingle_JiraProject => " + project.getName());

        logger.info("getSingle_JiraProject => " + project.getComponents());
        logger.info("getSingle_JiraProject => " + project.getIssueTypes());
        logger.info("getSingle_JiraProject => " + project.getLead());

        logger.info("getSingle_JiraProject => " + project.getProjectRoles());
        logger.info("getSingle_JiraProject => " + project.getUri());
        logger.info("getSingle_JiraProject => " + project.getVersions());
    }

    //a-RMS :: 해당하는 Jira Project 에 "aRMS-제품(서비스)-Version" 이 존재하는지 확인한다.
    //a-RMS :: 없으면 생성한다.
    @Test
    public void set_JiraVersion_ToProject() throws URISyntaxException {
        final JiraRestClient restClient = getJiraRestClient();
        String projectKey = "JSTFFW";
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        String name = "a-RMS_제품(서비스)_버전" + timestamp.toString();
        String description = "a-RMS 요구사항 관리 버전";
        DateTime releaseDate = new DateTime("2022-12-31");
        boolean isArchived = false;
        boolean isReleased = false;
        VersionInput createVersionTest = new VersionInput(projectKey, name, description, releaseDate, isArchived, isReleased);
        Promise<Version> test = restClient.getVersionRestClient().createVersion(createVersionTest);
        Version version = test.claim();
        logger.info("version getName = " + version.getName());
        logger.info("version getDescription = " + version.getDescription());
        logger.info("version getId = " + version.getId());
        logger.info("version getReleaseDate = " + version.getReleaseDate());
        logger.info("version getSelf = " + version.getSelf());
    }

    //a-RMS :: 해당 Jira Project 에 요구사항 이슈 타입을 쓸 수 있는 버전인지 확인한다.
    @Test
    public void get_Jira_InstalledVersion() throws URISyntaxException {
        final JiraRestClient restClient = getJiraRestClient();
        ServerInfo serverInfo = restClient.getMetadataClient().getServerInfo().claim();
        logger.info("serverInfo = " + serverInfo.getScmInfo());
        logger.info("serverInfo = " + serverInfo.getServerTitle());
        logger.info("serverInfo = " + serverInfo.getVersion());
        logger.info("serverInfo = " + serverInfo.getBaseUri());
        logger.info("serverInfo = " + serverInfo.getBuildDate());
        logger.info("serverInfo = " + serverInfo.getBuildNumber());
    }

    //a-RMS :: 7 이상의 버전이면, 요구사항 이슈 타입이 없으면 생성해 준다.
    //a-RMS :: 5,6 버전이면, 알림 창을 띄워서 admin 이 요구사항 이슈 타입을 생성하도록 유도
    //@Test
    public void set_Requirement_IssueType() throws URISyntaxException {
        // 추후 개발
    }

    @Test
    public void getAll_IssueType() throws URISyntaxException {
        final JiraRestClient restClient = getJiraRestClient();
        Promise<Iterable<IssueType>> promise = restClient.getMetadataClient().getIssueTypes();
        Iterable<IssueType> issueTypes = promise.claim();
        for (IssueType issueType: issueTypes) {
            logger.info("issueType => " + issueType.getId());
            logger.info("issueType => " + issueType.getName());
            logger.info("issueType => " + issueType.getSelf());
            logger.info("issueType => " + issueType.getDescription());
            logger.info("issueType => " + issueType.getIconUri());
        }
    }

    @Test
    public void get_IssueType() throws URISyntaxException {
        final JiraRestClient restClient = getJiraRestClient();
        Promise<IssueType> promise = restClient.getMetadataClient().getIssueType(new URI("http://www.313.co.kr/jira/rest/api/latest/issuetype/10"));
        IssueType issueType = promise.claim();
        logger.info("issueType => " + issueType.getId());
        logger.info("issueType => " + issueType.getName());
        logger.info("issueType => " + issueType.getSelf());
        logger.info("issueType => " + issueType.getDescription());
        logger.info("issueType => " + issueType.getIconUri());
    }

    //a-RMS :: 우선순위를 조정 할 수 있다. ( 높음, 중간, 낮음 )
    @Test
    public void getAll_Priority() throws URISyntaxException {
        final JiraRestClient restClient = getJiraRestClient();
        Promise<Iterable<Priority>> promise = restClient.getMetadataClient().getPriorities();
        Iterable<Priority> prioritys = promise.claim();
        for ( Priority priority : prioritys ){
            logger.info("priority = " + priority.getDescription());
            logger.info("priority = " + priority.getStatusColor());
            logger.info("priority = " + priority.getName());
            logger.info("priority = " + priority.getId());
            logger.info("priority = " + priority.getSelf());
        }
    }

    @Test
    public void get_Priority() throws URISyntaxException {
        final JiraRestClient restClient = getJiraRestClient();
        Promise<Priority> promise = restClient.getMetadataClient().getPriority(new URI("http://www.313.co.kr/jira/rest/api/2/priority/6"));
        Priority priority = promise.claim();
        logger.info("priority = " + priority.getDescription());
        logger.info("priority = " + priority.getStatusColor());
        logger.info("priority = " + priority.getName());
        logger.info("priority = " + priority.getId());
        logger.info("priority = " + priority.getSelf());
    }

    //이슈 타입은 7 버전 이상에서만 지원.
    //@Test

    //a-RMS :: Jira 에 이슈를 생성한다. ( 요구사항 타입 )
    @Test
    public void set_RequirementIssue_aRMS() throws URISyntaxException {

        final JiraRestClient restClient = getJiraRestClient();

        String jira_Project_KEY = "JSTFFW";
        Promise<Project> projectPromise = restClient.getProjectClient().getProject(jira_Project_KEY);
        Project project = projectPromise.claim();

        Promise<IssueType> issueTypePromise = restClient.getMetadataClient().getIssueType(new URI("http://www.313.co.kr/jira/rest/api/latest/issuetype/10"));
        IssueType issueType = issueTypePromise.claim();

        Promise<Version> versionPromise = restClient.getVersionRestClient().getVersion(new URI("http://www.313.co.kr/jira/rest/api/latest/version/12303"));
        Version version = versionPromise.claim();

        String summary = "요구사항 테스트";
        IssueInputBuilder issueInputBuilder = new IssueInputBuilder(project, issueType, summary);
        issueInputBuilder.setFixVersions(Collections.singleton(version));
        issueInputBuilder.setPriorityId(6L);
        DateTime dueDate = new DateTime("2022-12-30");
        issueInputBuilder.setDueDate(dueDate);
        issueInputBuilder.setFieldValue(IssueFieldId.LABELS_FIELD.id, Collections.singleton(new String("a-RMS_요구사항_라벨")));
        issueInputBuilder.setDescription(
            "a-RMS 에서 제공하는 요구사항 이슈 타입입니다.\n" +
            "자동으로 관리되므로 이슈를 강제로 삭제하지 마세요\n"+
            "아래 링크에서 요구사항을 확인 할 수 있습니다.\n" +
            "=========================================\n" +
            "http://www.a-rms.net/auth-user/req/313\n" +
            "=========================================\n" +
            "본 이슈 하위로 Sub-Task를 만들어서 개발을 하시거나\n"+
            "관련한 이슈를 연결 하세요");
        IssueInput issueInput = issueInputBuilder.build();

        Promise<BasicIssue> promise = restClient.getIssueClient().createIssue(issueInput);
        BasicIssue issue = promise.claim();
        logger.info("issue = " + issue.getKey());
        logger.info("issue = " + issue.getId());
        logger.info("issue = " + issue.getSelf());
    }

    //a-RMS :: 등록된 요구사항 이슈를 수집 할 수 있다.
    //a-RMS :: 주기적으로 요구사항을 확인하여, Jira 에 이슈를 생성한다. ( 요구사항 타입 )( 릴레이션, Sub-TASK 포함 )
    @Test
    public void get_RequirementIssue_aRMS() throws URISyntaxException {

        //http://www.313.co.kr/jira/rest/api/latest/issue/18005
        final JiraRestClient restClient = getJiraRestClient();
        Issue issue = restClient.getIssueClient().getIssue("JSTFFW-9").claim();
        logger.info("issue = " + issue.getSubtasks());
        logger.info("issue = " + issue.getIssueLinks());
    }

    //a-RMS :: 이후 스케쥴러를 동작해서 요구사항 이슈를 수집하여 ELK 에 적재한다.
    public void store_ReqIssue_ToELK_ByaRMS() {
        //차후 개발
    }
}
