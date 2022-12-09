/*
 * @author Dongmin.lee
 * @since 2022-12-03
 * @version 22.12.03
 * @see <pre>
 *  Copyright (C) 2007 by 313 DEV GRP, Inc - All Rights Reserved
 *  Unauthorized copying of this file, via any medium is strictly prohibited
 *  Proprietary and confidential
 *  Written by 313 developer group <313@313.co.kr>, December 2010
 * </pre>
 */
package egovframework.api.arms.module_reqstatus.service;

import com.atlassian.jira.rest.client.api.IssueRestClient;
import com.atlassian.jira.rest.client.api.JiraRestClient;
import com.atlassian.jira.rest.client.api.domain.*;
import com.atlassian.jira.rest.client.api.domain.input.*;
import com.atlassian.util.concurrent.Effect;
import com.atlassian.util.concurrent.Promise;
import egovframework.api.arms.module_armsscheduler.component.ArmsSchedulerUtil;
import egovframework.api.arms.module_pdserviceconnect.model.PdServiceConnectDTO;
import egovframework.api.arms.module_reqstatus.model.ReqStatusDTO;
import egovframework.api.arms.util.StringUtility;
import egovframework.com.ext.jstree.springHibernate.core.interceptor.SessionUtil;
import egovframework.com.ext.jstree.springHibernate.core.service.JsTreeHibernateServiceImpl;
import egovframework.com.ext.jstree.support.util.StringUtils;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.*;

@Service("reqStatus")
public class ReqStatusImpl extends JsTreeHibernateServiceImpl implements ReqStatus {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Override
    public void putJiraIssue(String reqStatusTableName) throws Exception {

        ReqStatusDTO searchStatusDTO = new ReqStatusDTO();
        searchStatusDTO.setOrder(Order.asc("c_id"));
        Criterion criterion = Restrictions.not(
                // replace "id" below with property name, depending on what you're filtering against
                Restrictions.in("c_id", new Object[]{1L, 2L})
        );
        searchStatusDTO.setWhere("c_title", "enable");
        searchStatusDTO.getCriterions().add(criterion);

        List<ReqStatusDTO> allList = this.getChildNode(searchStatusDTO);

        String reqaddTableName = StringUtility.replace(reqStatusTableName, "T_ARMS_REQSTATUS", "T_ARMS_REQADD");

        for (ReqStatusDTO statusDTO : allList) {
            logger.info("statusDTO = " + statusDTO.getC_id());
            logger.info("statusDTO = " + statusDTO.getC_req_name());

            String jiraIssueLink = statusDTO.getC_jira_req_issue_link();
            if (StringUtility.isEmpty(jiraIssueLink)) {
                //이슈가 없다는 뜻이니까.
                //이슈 등록
                final JiraRestClient restClient = ArmsSchedulerUtil.getJiraRestClient();

                Promise<Project> projectPromise = restClient.getProjectClient().getProject(statusDTO.getC_jira_project_key());
                Project project = projectPromise.claim();

                Promise<IssueType> issueTypePromise = restClient.getMetadataClient().getIssueType(new URI(ArmsSchedulerUtil.issueType_link));
                IssueType issueType = issueTypePromise.claim();

                Promise<Version> versionPromise = restClient.getVersionRestClient().getVersion(new URI(statusDTO.getC_jira_version_url()));
                Version version = versionPromise.claim();

                String summary = statusDTO.getC_req_name();
                IssueInputBuilder issueInputBuilder = new IssueInputBuilder(project, issueType, summary);
                issueInputBuilder.setFixVersions(Collections.singleton(version));
                issueInputBuilder.setPriorityId(6L);
                DateTime dueDate = new DateTime("2022-12-30");
                issueInputBuilder.setDueDate(dueDate);
                issueInputBuilder.setFieldValue(IssueFieldId.LABELS_FIELD.id, Collections.singleton(new String("a-RMS_요구사항")));
                issueInputBuilder.setDescription(
                        "a-RMS 에서 제공하는 요구사항 이슈 타입입니다.\n" +
                                "자동으로 관리되므로 이슈를 강제로 삭제하지 마세요\n" +
                                "아래 링크에서 요구사항을 확인 할 수 있습니다.\n" +
                                "=========================================\n" +
                                //BaseURL + /auth-anon/api/arms/reqAdd/테이블명/요구사항아이디
                                "http://www.a-rms.net/auth-user/api/arms/reqSearch/" + reqaddTableName + "/" + statusDTO.getC_req_link() + "\n" +
                                "=========================================\n" +
                                "본 이슈 하위로 Sub-Task를 만들어서 개발을 하시거나\n" +
                                "관련한 이슈를 연결 하세요");
                IssueInput issueInput = issueInputBuilder.build();

                Promise<BasicIssue> promise = restClient.getIssueClient().createIssue(issueInput);
                BasicIssue issue = promise.claim();
                logger.info("issue = " + issue.getKey());
                logger.info("issue = " + issue.getId());
                logger.info("issue = " + issue.getSelf());


                logger.info("reqStatusTableName ====> " + reqStatusTableName);
                statusDTO.setC_jira_req_issue_key(issue.getKey());
                statusDTO.setC_jira_req_issue_id(issue.getId().toString());
                statusDTO.setC_jira_req_issue_link(issue.getSelf().toString());
                this.updateNode(statusDTO);

            }else{
                //이슈가 있으면?
            }
        }

    }

    @Override
    public void updateJiraIssueCrawl(String reqStatusTableName) throws Exception {

        ReqStatusDTO searchStatusDTO = new ReqStatusDTO();
        searchStatusDTO.setOrder(Order.asc("c_id"));
        Criterion criterion = Restrictions.not(
                // replace "id" below with property name, depending on what you're filtering against
                Restrictions.in("c_id", new Object[]{1L, 2L})
        );
        searchStatusDTO.getCriterions().add(criterion);

        List<ReqStatusDTO> allList = this.getChildNode(searchStatusDTO);

        for (ReqStatusDTO statusDTO : allList) {
            logger.info("statusDTO = " + statusDTO.getC_id());
            logger.info("statusDTO = " + statusDTO.getC_req_name());

            String jiraIssueLink = statusDTO.getC_jira_req_issue_link();
            if (StringUtility.isNotEmpty(jiraIssueLink)) {
                //이슈가 있다는 뜻이니까.
                //이슈와 연관된 데이터 수집 및 업데이트

                final JiraRestClient restClient = ArmsSchedulerUtil.getJiraRestClient();

                logger.info("statusDTO.getC_jira_req_issue_key() => " + statusDTO.getC_jira_req_issue_key());
                Issue issue = restClient.getIssueClient().getIssue(statusDTO.getC_jira_req_issue_key()).claim();
                logger.info("issue = " + issue.getSubtasks());
                logger.info("issue = " + issue.getIssueLinks());

                statusDTO.setC_jira_req_subtaskissue(issue.getSubtasks().toString());
                statusDTO.setC_jira_req_linkingissue(issue.getIssueLinks().toString());

                this.updateNode(statusDTO);

            }
        }

    }

    @Override
    public List<Long> disableJiraIssue(String reqStatusTableName) throws Exception {
        ReqStatusDTO searchStatusDTO = new ReqStatusDTO();
        searchStatusDTO.setOrder(Order.asc("c_id"));
        Criterion criterion = Restrictions.not(
                // replace "id" below with property name, depending on what you're filtering against
                Restrictions.in("c_id", new Object[]{1L, 2L})
        );
        searchStatusDTO.setWhere("c_title", "disable");
        searchStatusDTO.getCriterions().add(criterion);

        List<ReqStatusDTO> disableList = this.getChildNode(searchStatusDTO);
        List<Long> disableIDs = new ArrayList<>();

        for (ReqStatusDTO statusDTO : disableList) {
            logger.info("statusDTO = " + statusDTO.getC_id());
            logger.info("statusDTO = " + statusDTO.getC_req_name());

            String jiraIssueLink = statusDTO.getC_jira_req_issue_link();
            if (StringUtility.isNotEmpty(jiraIssueLink)) {
                //이슈가 있다는 뜻이니까.
                //이슈 업데이트

                //disable 되었다는 것은.
                //Status : Closed -- 완료
                //Label : 삭제 혹은 관리되지 않은 요구사항 이라고 적어주고
                //comment : 더이상 연관된 이슈를 업데이트 하여 반영하지 않는다고 이야기 해줘야 한다.
                //resolution 처리도 해야 한다.

                final JiraRestClient restClient = ArmsSchedulerUtil.getJiraRestClient();

                Issue issue = getIssue(statusDTO.getC_jira_req_issue_key());

                String status = "Reopen Issue";
                updateIssueStatus(issue, status);

                IssueInput input = new IssueInputBuilder()
                        .setDescription("본 요구사항 이슈는 더이상 관리되지 않습니다.")
                        .setFieldValue(IssueFieldId.LABELS_FIELD.id, Collections.singleton(new String("DISABLED_요구사항")))
                        .build();
                restClient.getIssueClient()
                        .updateIssue(statusDTO.getC_jira_req_issue_key(), input)
                        .claim();

                Collection<FieldInput> fieldInputs = Collections.EMPTY_LIST;

                updateIssueStatus(issue, "Close Issue", fieldInputs, Comment.valueOf("본 이슈는 더이상 수집되어 성과에 반영되지 않는다."));

                //이슈를 disable 처리 하였는데,
                //요구사항에서는 이 이슈를 지웠겠지 ( 아이디에서 )
                //그럼 이 이슈의 링크도 지워줘야 해
                //다시 이으려고 했을 때, 구분자로 처리 해야 하니까
                //이슈를 만들려고 보니까 이미 제품(서비스)-버전-지라-지라버전의 정보가 있는 이슈가 있다?
                //요구사항 아이디랑 타이틀이 없네? STATUS 업데이트 하고
                //요구사항 REQ ADD 도 업데이트 해줘야 한다.
                disableIDs.add(statusDTO.getC_id());
            }
        }

        return disableIDs;
    }

    public void updateIssueStatus(Issue issue, String status) throws IOException, URISyntaxException {
        IssueRestClient issueClient = ArmsSchedulerUtil.getJiraRestClient().getIssueClient();


        Iterable<Transition> transitions = issueClient.getTransitions(issue).claim();

        for(Transition t : transitions){
            logger.info(t.getName() + "===" + t.getId() + "===" + t.getFields().toString());
            if(t.getName().equals(status)) {
                logger.info(t.getName() + "---" + t.getId() + "---" + t.getFields().toString());
                TransitionInput input = new TransitionInput(t.getId());
                issueClient.transition(issue, input).claim();

                return;
            }
        }
    }

    public void updateIssueStatus(Issue issue, String status, Collection<FieldInput> fieldInputs, Comment comment) throws IOException, URISyntaxException {
        IssueRestClient issueClient = ArmsSchedulerUtil.getJiraRestClient().getIssueClient();


        Iterable<Transition> transitions = issueClient.getTransitions(issue).claim();

        for(Transition t : transitions){
            logger.info(t.getName() + "~~~" + t.getId() + "~~~" + t.getFields().toString());
            if(t.getName().equals(status)) {
                logger.info(t.getName() + "___" + t.getId() + "___" + t.getFields().toString());
                TransitionInput input = new TransitionInput(t.getId(), fieldInputs, comment);
                issueClient.transition(issue, input).claim();

                return;
            }
        }
    }

    public Issue getIssue(String issueKey) throws IOException, URISyntaxException {
        IssueRestClient client = ArmsSchedulerUtil.getJiraRestClient().getIssueClient();
        return client.getIssue(issueKey).claim();
    }

    private Transition getTransitionByName(Iterable<Transition> transitions, String transitionName) {
        for (Transition transition : transitions) {

            logger.info(transition.getName() + "===" + transition.getId() + "===" + transition.getFields().toString());

//            if (transition.getName().equals(transitionName)) {
//                logger.info(transition.getName() + "---" + transition.getId() + "---" + transition.getFields().toString());
//                return transition;
//            }
        }
        return null;
    }
}