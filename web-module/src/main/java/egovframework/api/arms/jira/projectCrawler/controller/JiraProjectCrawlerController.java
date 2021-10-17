package egovframework.api.arms.jira.projectCrawler.controller;

import com.atlassian.jira.rest.client.api.JiraRestClient;
import com.atlassian.jira.rest.client.api.domain.BasicProject;
import com.atlassian.jira.rest.client.api.domain.Issue;
import com.atlassian.jira.rest.client.internal.async.AsynchronousJiraRestClientFactory;
import egovframework.com.ext.jstree.support.mvc.GenericAbstractController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.net.URI;

@Controller
@RequestMapping(value = {"/jira/projectCrawler"})
public class JiraProjectCrawlerController extends GenericAbstractController {


    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @ResponseBody
    @RequestMapping(value = "/getProjectList.do", method = RequestMethod.GET)
    public ModelAndView getProjectList() throws Exception {


        final AsynchronousJiraRestClientFactory factory = new AsynchronousJiraRestClientFactory();
        final URI jiraServerUri = new URI("http://313.co.kr/jira");
        final JiraRestClient restClient = factory.createWithBasicHttpAuthentication(jiraServerUri, "admin", "flexjava");
        final Issue issue = restClient.getIssueClient().getIssue("TST-7").claim();
        logger.debug(issue.toString());

        Iterable<BasicProject> test = restClient.getProjectClient().getAllProjects().claim();
        getTransitionByName(test, "name");

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result");

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
