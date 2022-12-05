/*
 * @author Dongmin.lee
 * @since 2022-12-01
 * @version 22.12.01
 * @see <pre>
 *  Copyright (C) 2007 by 313 DEV GRP, Inc - All Rights Reserved
 *  Unauthorized copying of this file, via any medium is strictly prohibited
 *  Proprietary and confidential
 *  Written by 313 developer group <313@313.co.kr>, December 2010
 * </pre>
 */
package egovframework.api.arms.module_armsscheduler.component;

import com.atlassian.jira.rest.client.api.JiraRestClient;
import com.atlassian.jira.rest.client.api.domain.BasicProject;
import com.atlassian.jira.rest.client.api.domain.IssueType;
import com.atlassian.jira.rest.client.api.domain.Project;
import com.atlassian.jira.rest.client.api.domain.ServerInfo;
import com.atlassian.jira.rest.client.internal.async.AsynchronousJiraRestClientFactory;
import com.atlassian.util.concurrent.Promise;
import egovframework.api.arms.module_pdservice.model.PdServiceDTO;
import egovframework.api.arms.module_pdservicejira.model.PdServiceJiraDTO;
import egovframework.api.arms.module_pdservicejira.service.PdServiceJira;
import egovframework.api.arms.util.PropertiesReader;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.ext.jstree.springHibernate.core.service.JsTreeHibernateServiceImpl;
import egovframework.com.ext.jstree.support.util.StringUtils;
import org.hibernate.criterion.Order;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;

@Component
public class ArmsSchedulerUtil {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    public static String serverInfo_Version;
    public static String serverInfo_BaseURI;

    public static String issueType_name;
    public static String issueType_desc;
    public static String issueType_link;
    public static String issueType_id;

    public static JiraRestClient getJiraRestClient() throws URISyntaxException, IOException {

        final AsynchronousJiraRestClientFactory factory = new AsynchronousJiraRestClientFactory();

        PropertiesReader propertiesReader = new PropertiesReader("egovframework/egovProps/globals.properties");
        String jiraUrl = propertiesReader.getProperty("arms.jira.baseurl");
        String jiraID = propertiesReader.getProperty("arms.jira.id");
        String jiraPass = propertiesReader.getProperty("arms.jira.pass");

        return factory.createWithBasicHttpAuthentication(new URI(jiraUrl), jiraID, jiraPass);

    }

    @Scheduled(initialDelay = 1 * 60 * 1000, fixedDelay = 3 * 60 * 100) //10m 딜레이, 5m 단위
    public void set_jiraServerInfo_toStatic() throws IOException, URISyntaxException {
        final JiraRestClient restClient = ArmsSchedulerUtil.getJiraRestClient();
        ServerInfo serverInfo = restClient.getMetadataClient().getServerInfo().claim();
        logger.info("===============[ Start 지라 서버 버전 정보 셋팅 ]===============");
        logger.info("serverInfo.getVersion() = " + serverInfo.getVersion());
        logger.info("serverInfo.getBaseUri() = " + serverInfo.getBaseUri());
        logger.info("===============[ End 지라 서버 버전 정보 셋팅 ]===============");
        ArmsSchedulerUtil.serverInfo_Version = serverInfo.getVersion();
        ArmsSchedulerUtil.serverInfo_BaseURI = serverInfo.getBaseUri().toString();
    }

    @Scheduled(initialDelay = 1 * 60 * 1000, fixedDelay = 3 * 60 * 100) //10m 딜레이, 5m 단위
    public void set_jiraIssueType_toStatic() throws IOException, URISyntaxException {
        final JiraRestClient restClient = ArmsSchedulerUtil.getJiraRestClient();
        Iterable<IssueType> issueTypes = restClient.getMetadataClient().getIssueTypes().claim();
        for ( IssueType issueType : issueTypes ) {
            if(StringUtils.equalsIgnoreCase(issueType.getName(), "Requirement")){
                ArmsSchedulerUtil.issueType_name = issueType.getName();
                ArmsSchedulerUtil.issueType_desc = issueType.getDescription();
                ArmsSchedulerUtil.issueType_link = issueType.getSelf().toString();
                ArmsSchedulerUtil.issueType_id = issueType.getId().toString();
            }
        }

        logger.info("===============[ Start 요구사항 이슈 타입 셋팅 ]===============");
        logger.info("ArmsSchedulerUtil.issueType_name = " + ArmsSchedulerUtil.issueType_name);
        logger.info("ArmsSchedulerUtil.issueType_desc = " + ArmsSchedulerUtil.issueType_desc);
        logger.info("ArmsSchedulerUtil.issueType_link = " + ArmsSchedulerUtil.issueType_link);
        logger.info("ArmsSchedulerUtil.issueType_id = " + ArmsSchedulerUtil.issueType_id);
        logger.info("===============[ End 요구사항 이슈 타입 셋팅 ]===============");
    }

    public void set_ReqAdd_toJiraReqIssue() {
        System.out.println(
                "Fixed delay task - " + System.currentTimeMillis() / 1000);
    }


}