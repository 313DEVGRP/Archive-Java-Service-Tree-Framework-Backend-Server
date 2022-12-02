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
import com.atlassian.jira.rest.client.api.domain.Project;
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

    public static JiraRestClient getJiraRestClient() throws URISyntaxException, IOException {

        final AsynchronousJiraRestClientFactory factory = new AsynchronousJiraRestClientFactory();

        PropertiesReader propertiesReader = new PropertiesReader("egovframework/egovProps/globals.properties");
        String jiraUrl = propertiesReader.getProperty("arms.jira.baseurl");
        String jiraID = propertiesReader.getProperty("arms.jira.id");
        String jiraPass = propertiesReader.getProperty("arms.jira.pass");

        return factory.createWithBasicHttpAuthentication(new URI(jiraUrl), jiraID, jiraPass);

    }

    @Scheduled(initialDelay = 10 * 60 * 1000, fixedDelay = 10 * 60 * 100) //10m 딜레이, 5m 단위
    public void set_jiraServerInfo_toStatic() {
        System.out.println(
                "Fixed delay task - " + System.currentTimeMillis() / 1000);
    }

    public void set_jiraIssueType_toStatic() {
        System.out.println(
                "Fixed delay task - " + System.currentTimeMillis() / 1000);
    }

    public void set_ReqAdd_toJiraReqIssue() {
        System.out.println(
                "Fixed delay task - " + System.currentTimeMillis() / 1000);
    }


}