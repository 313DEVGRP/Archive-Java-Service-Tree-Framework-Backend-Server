package egovframework.api.arms.module_pdservicejira;

import com.atlassian.jira.rest.client.api.GetCreateIssueMetadataOptions;
import com.atlassian.jira.rest.client.api.JiraRestClient;
import com.atlassian.jira.rest.client.api.domain.*;
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
import java.util.Iterator;

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
    public void getSingle_JiraProject() throws URISyntaxException {
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
        String name = "a-RMS 제품(서비스) 버전";
        String description = "a-RMS Desc";
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
        logger.info("serverInfo = " + serverInfo.getBaseUri());
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

    public void getSingle_IssueType() {

    }

    //이슈 타입은 7 버전 이상에서만 지원.
    //@Test

    //a-RMS :: Jira 에 이슈를 생성한다. ( 요구사항 타입 )
    public void set_RequirementIssue_aRMS() {

    }

    //a-RMS :: 등록된 요구사항 이슈를 수집 할 수 있다.
    //a-RMS :: 주기적으로 요구사항을 확인하여, Jira 에 이슈를 생성한다. ( 요구사항 타입 )( 릴레이션, Sub-TASK 포함 )
    public void get_RequirementIssue_aRMS() {

    }

    //a-RMS :: 이후 스케쥴러를 동작해서 요구사항 이슈를 수집하여 ELK 에 적재한다.
    public void store_ReqIssue_ToELK_ByaRMS() {

    }
}
