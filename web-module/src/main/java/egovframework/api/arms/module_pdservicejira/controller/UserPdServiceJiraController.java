/*
 * @author Dongmin.lee
 * @since 2022-11-08
 * @version 22.11.08
 * @see <pre>
 *  Copyright (C) 2007 by 313 DEV GRP, Inc - All Rights Reserved
 *  Unauthorized copying of this file, via any medium is strictly prohibited
 *  Proprietary and confidential
 *  Written by 313 developer group <313@313.co.kr>, December 2010
 * </pre>
 */
package egovframework.api.arms.module_pdservicejira.controller;

import com.atlassian.jira.rest.client.api.JiraRestClient;
import com.atlassian.jira.rest.client.api.domain.BasicProject;
import com.atlassian.jira.rest.client.api.domain.Issue;
import com.atlassian.jira.rest.client.internal.async.AsynchronousJiraRestClientFactory;
import egovframework.api.arms.module_pdservicejira.model.PdServiceJiraDTO;
import egovframework.api.arms.module_pdservicejira.service.PdServiceJira;
import egovframework.com.ext.jstree.springHibernate.core.controller.SHVAbstractController;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.PostConstruct;
import java.net.URI;

@Slf4j
@Controller
@RequestMapping(value = {"/auth-user/api/arms/pdServiceJira"})
public class UserPdServiceJiraController extends SHVAbstractController<PdServiceJira, PdServiceJiraDTO> {

    @Autowired
    @Qualifier("pdServiceJira")
    private PdServiceJira pdServiceJira;

    @PostConstruct
    public void initialize() {
        setJsTreeHibernateService(pdServiceJira);
    }

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @ResponseBody
    @RequestMapping(value = "/getProjectList.do", method = RequestMethod.GET)
    public ModelAndView getProjectList() throws Exception {


//        JiraRestClientFactory factory = new AsynchronousJiraRestClientFactory();
//        URI uri = new URI("http://www.313.co.kr/jira");
//        JiraRestClient jiraRestClient = factory.createWithBasicHttpAuthentication(uri, "admin", "flexjava");
//
//        Promise<Iterable<IssueType>> promise = jiraRestClient.getMetadataClient().getIssueTypes();
//        Iterable<IssueType> issueTypes = promise.claim();
//        for (IssueType it : issueTypes) {
//            System.out.println("Type ID = " + it.getId() + ", Name = " + it.getName());
//        }
        final AsynchronousJiraRestClientFactory factory = new AsynchronousJiraRestClientFactory();
        final URI jiraServerUri = new URI("http://www.313.co.kr/jira");
        final JiraRestClient restClient = factory.createWithBasicHttpAuthentication(jiraServerUri, "admin", "flexjava");
        final Issue issue = restClient.getIssueClient().getIssue("SP-689").claim();
        logger.debug(issue.toString());

        Iterable<BasicProject> test = restClient.getProjectClient().getAllProjects().claim();
        getTransitionByName(test, "name");

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", test);

        return modelAndView;
    }

    private BasicProject getTransitionByName(Iterable<BasicProject> transitions, String transitionName) {
        for (BasicProject transition : transitions) {
            logger.debug(transition.toString());
            if (transition.getName().equals(transitionName)) {
                return transition;
            }
        }
        return null;
    }

}
