package egovframework.api.arms.module_armsscheduler.component;

import com.atlassian.jira.rest.client.api.JiraRestClient;
import com.atlassian.jira.rest.client.api.domain.BasicProject;
import com.atlassian.jira.rest.client.api.domain.Project;
import egovframework.api.arms.module_pdservicejira.model.PdServiceJiraDTO;
import egovframework.api.arms.module_pdservicejira.service.PdServiceJira;
import egovframework.com.ext.jstree.support.util.StringUtils;
import org.hibernate.criterion.Order;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ArmsScheduler_JiraProject {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    @Qualifier("pdServiceJira")
    private PdServiceJira pdServiceJira;

    @Scheduled(initialDelay = 10 * 60 * 1000, fixedDelay = 5 * 60 * 100) //10m 딜레이, 5m 단위
    public void set_jiraProject_toPdServiceJira() throws Exception {
        final JiraRestClient restClient = ArmsScheduler.getJiraRestClient();
        Iterable<BasicProject> allProject = restClient.getProjectClient().getAllProjects().claim();

        PdServiceJiraDTO pdServiceJiraDTOList = new PdServiceJiraDTO();
        pdServiceJiraDTOList.setOrder(Order.asc("c_id"));
        List<PdServiceJiraDTO> list = pdServiceJira.getChildNode(pdServiceJiraDTOList);

        for (BasicProject project: allProject) {
            logger.info("project -> " + project.getName());
            logger.info("project -> " + project.getKey());
            logger.info("project -> " + project.getSelf());

            boolean anyMatch = list.stream().anyMatch(dto ->
                    StringUtils.equals(dto.getC_jira_link(), project.getSelf().toString())
            );

            if(anyMatch){
                logger.info("already registerd jira project = " + project.getSelf().toString());
            }else{

                String jira_Project_KEY = project.getKey();
                Project projectDetail = restClient.getProjectClient().getProject(jira_Project_KEY).claim();

                PdServiceJiraDTO pdServiceJiraDTO = new PdServiceJiraDTO();
                pdServiceJiraDTO.setC_title(projectDetail.getName());
                pdServiceJiraDTO.setC_jira_id(projectDetail.getLead().getName());
                pdServiceJiraDTO.setC_jira_key(projectDetail.getKey());
                pdServiceJiraDTO.setC_jira_name(projectDetail.getName());
                pdServiceJiraDTO.setC_jira_link(projectDetail.getSelf().toString());
                pdServiceJiraDTO.setC_contents(projectDetail.getDescription());
                pdServiceJiraDTO.setC_jira_avatar_16(projectDetail.getComponents().toString());
                pdServiceJiraDTO.setC_jira_avatar_24(projectDetail.getIssueTypes().toString());
                pdServiceJiraDTO.setC_jira_avatar_32(projectDetail.getProjectRoles().toString());
                pdServiceJiraDTO.setC_jira_avatar_48(projectDetail.getVersions().toString());
                pdServiceJiraDTO.setRef(2L);
                pdServiceJiraDTO.setC_type("default");

                pdServiceJira.addNode(pdServiceJiraDTO);
            }
        }
    }

}
