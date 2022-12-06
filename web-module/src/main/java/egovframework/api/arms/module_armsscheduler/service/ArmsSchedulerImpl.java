/*
 * @author Dongmin.lee
 * @since 2022-12-02
 * @version 22.12.02
 * @see <pre>
 *  Copyright (C) 2007 by 313 DEV GRP, Inc - All Rights Reserved
 *  Unauthorized copying of this file, via any medium is strictly prohibited
 *  Proprietary and confidential
 *  Written by 313 developer group <313@313.co.kr>, December 2010
 * </pre>
 */
package egovframework.api.arms.module_armsscheduler.service;

import com.atlassian.jira.rest.client.api.JiraRestClient;
import com.atlassian.jira.rest.client.api.domain.BasicProject;
import com.atlassian.jira.rest.client.api.domain.Priority;
import com.atlassian.jira.rest.client.api.domain.Project;
import com.atlassian.jira.rest.client.api.domain.Version;
import com.atlassian.jira.rest.client.api.domain.input.VersionInput;
import egovframework.api.arms.module_armsscheduler.component.ArmsSchedulerUtil;
import egovframework.api.arms.module_pdservice.model.PdServiceDTO;
import egovframework.api.arms.module_pdservice.service.PdService;
import egovframework.api.arms.module_pdserviceconnect.model.PdServiceConnectDTO;
import egovframework.api.arms.module_pdserviceconnect.service.PdServiceConnect;
import egovframework.api.arms.module_pdservicejira.model.PdServiceJiraDTO;
import egovframework.api.arms.module_pdservicejira.service.PdServiceJira;
import egovframework.api.arms.module_pdservicejirapri.model.PdServiceJiraPriDTO;
import egovframework.api.arms.module_pdservicejirapri.service.PdServiceJiraPri;
import egovframework.api.arms.module_pdservicejiraver.model.PdServiceJiraVerDTO;
import egovframework.api.arms.module_pdservicejiraver.service.PdServiceJiraVer;
import egovframework.api.arms.module_pdserviceversion.model.PdServiceVersionDTO;
import egovframework.api.arms.module_pdserviceversion.service.PdServiceVersion;
import egovframework.api.arms.util.StringUtility;
import egovframework.com.ext.jstree.springHibernate.core.service.JsTreeHibernateServiceImpl;
import egovframework.com.ext.jstree.support.util.StringUtils;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("armsScheduler")
public class ArmsSchedulerImpl extends JsTreeHibernateServiceImpl implements ArmsScheduler{

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    @Qualifier("pdServiceConnect")
    private PdServiceConnect pdServiceConnect;

    @Autowired
    @Qualifier("pdServiceJira")
    private PdServiceJira pdServiceJira;

    @Autowired
    @Qualifier("pdServiceVersion")
    private PdServiceVersion pdServiceVersion;

    @Autowired
    @Qualifier("pdService")
    private PdService pdService;

    @Autowired
    @Qualifier("pdServiceJiraVer")
    private PdServiceJiraVer pdServiceJiraVer;

    @Autowired
    @Qualifier("pdServiceJiraPri")
    private PdServiceJiraPri pdServiceJiraPri;

    @Override
    public void set_jiraProject_toPdServiceJira() throws Exception {
        final JiraRestClient restClient = ArmsSchedulerUtil.getJiraRestClient();
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

    @Override
    public void set_PdServiceVersion_toJiraProjectVersion() throws Exception {

        final JiraRestClient restClient = ArmsSchedulerUtil.getJiraRestClient();

        // 연결정보 리스트를 가져온다.
        PdServiceConnectDTO pdServiceConnectDTOList = new PdServiceConnectDTO();
        pdServiceConnectDTOList.setOrder(Order.asc("c_id"));
        Criterion criterion = Restrictions.not(
                // replace "id" below with property name, depending on what you're filtering against
                Restrictions.in("c_id", new Object[] {1L, 2L})
        );
        pdServiceConnectDTOList.getCriterions().add(criterion);
        List<PdServiceConnectDTO> list = pdServiceConnect.getChildNode(pdServiceConnectDTOList);

        for( PdServiceConnectDTO pdServiceConnectDTO : list){
            String pdServiceId = pdServiceConnectDTO.getC_pdservice_id();
            String pdServiceVersionStr = pdServiceConnectDTO.getC_pdservice_version_id();
            String pdServiceJiraList = pdServiceConnectDTO.getC_pdservice_jira_ids();

            pdServiceJiraList = StringUtils.remove(pdServiceJiraList, "\"");
            pdServiceJiraList = StringUtils.remove(pdServiceJiraList, "]");
            pdServiceJiraList = StringUtils.remove(pdServiceJiraList, "[");

            //제품(서비스) 정보를 가져온다
            String pdServiceName = "";
            if(StringUtils.isNotEmpty(pdServiceId)){

                PdServiceDTO pdServiceDTO = new PdServiceDTO();
                pdServiceDTO.setC_id(StringUtility.toLong(pdServiceId));
                PdServiceDTO returnPdServiceDTO = pdService.getNode(pdServiceDTO);
                pdServiceName = returnPdServiceDTO.getC_title();
            }

            //버전 정보를 가져온다.
            String pdServiceVersionName = "";
            String pdServiceVersionStart = "";
            String pdServiceVersionEnd = "";
            PdServiceVersionDTO returnPdServiceVersionDTO = new PdServiceVersionDTO();
            if(StringUtils.isNotEmpty(pdServiceVersionStr)){

                PdServiceVersionDTO pdServiceVersionDTO = new PdServiceVersionDTO();
                pdServiceVersionDTO.setC_id(StringUtility.toLong(pdServiceVersionStr));
                returnPdServiceVersionDTO = pdServiceVersion.getNode(pdServiceVersionDTO);
                pdServiceVersionName = returnPdServiceVersionDTO.getC_title();
                pdServiceVersionStart = returnPdServiceVersionDTO.getC_start_date();
                pdServiceVersionEnd = returnPdServiceVersionDTO.getC_end_date();
            }

            //지라 연결 정보가 있다는건
            if(StringUtils.isNotEmpty(pdServiceJiraList)){
                String[] pdServiceJiraArr = StringUtils.split(pdServiceJiraList, ",");

                //지라 연결 정보를 분리해서
                for (String pdServiceJiraID :pdServiceJiraArr) {

                    PdServiceJiraDTO pdServiceJiraDTO = new PdServiceJiraDTO();
                    pdServiceJiraDTO.setC_id(StringUtility.toLong(pdServiceJiraID));

                    //지라 정보를 찾고
                    PdServiceJiraDTO returnPdServiceJiraDTO = pdServiceJira.getNode(pdServiceJiraDTO);

                    //찾은 정보를 기반으로 지라프로젝트에 버전정보를 셋팅한다.
                    String projectKey = returnPdServiceJiraDTO.getC_jira_key();
                    String projectLink = returnPdServiceJiraDTO.getC_jira_link();
                    String projectName = returnPdServiceJiraDTO.getC_jira_name();

                    String versionStr = "[a-RMS]_" + StringUtility.replace(pdServiceName, " ", "_") + "_" + projectKey + "_" + StringUtility.deleteWhitespace(pdServiceVersionName);
                    String description = "[a-RMS] 에서 관리하는 버전 정보 :: " + pdServiceVersionStart + "~" + pdServiceVersionEnd;
                    //DateTime releaseDate = new DateTime(pdServiceVersionEnd);
                    DateTime releaseDate = new DateTime("2022-12-31");
                    boolean isArchived = false;
                    boolean isReleased = false;

                    //지라 프로젝트 하위의 버전을 가져온다. ( 중복으로 등록 방지 차원 )
                    boolean checker = false;
                    String already_JiraVersion_Name = "";
                    String already_JiraVersion_Desc = "";
                    String already_JiraVersion_ID = "";
                    String already_JiraVersion_RelDate = "";
                    String already_JiraVersion_Link = "";
                    Iterable<Version> iterable = restClient.getProjectClient().getProject(projectKey).get().getVersions();
                    for( Version version : iterable){
                        if(StringUtility.equals(versionStr, version.getName())){

                            already_JiraVersion_Name = version.getName();
                            already_JiraVersion_Desc = version.getDescription();
                            already_JiraVersion_ID = version.getId().toString();
                            already_JiraVersion_RelDate = version.getReleaseDate().toString();
                            already_JiraVersion_Link = version.getSelf().toString();

                            checker = true;
                        }
                    }

                    //이미 지라에 등록되어 있다고 한다.
                    if (checker) {
                        //a-RMS에 등록되어 있는지는 모른다. 체크하자
                        PdServiceJiraVerDTO checkDTO = checkPdServiceJiraVerDTO(pdServiceId, pdServiceVersionStr, pdServiceJiraID, versionStr);

                        if(checkDTO == null){
                            //없다면 만들어야 한다.
                            PdServiceJiraVerDTO pdServiceJiraVerDTO = new PdServiceJiraVerDTO();
                            pdServiceJiraVerDTO.setRef(2L);
                            pdServiceJiraVerDTO.setC_type("default");
                            pdServiceJiraVerDTO.setC_title(pdServiceId + "-" + pdServiceVersionStr + "-" + pdServiceJiraID);

                            alreadyDataSetting(pdServiceId, pdServiceName,
                                    pdServiceVersionStr, pdServiceVersionName,
                                    pdServiceJiraID, projectName, projectKey, projectLink,
                                    already_JiraVersion_Name, already_JiraVersion_Desc, already_JiraVersion_ID,
                                    already_JiraVersion_RelDate, already_JiraVersion_Link, pdServiceJiraVerDTO);

                            pdServiceJiraVer.addNode(pdServiceJiraVerDTO);
                        }else{
                            //이미 등록되 있다고 한다. 업데이트 될 수도 있으니까

                            checkDTO.setC_title(pdServiceId + "-" + pdServiceVersionStr + "-" + pdServiceJiraID);
                            alreadyDataSetting(pdServiceId, pdServiceName,
                                    pdServiceVersionStr, pdServiceVersionName,
                                    pdServiceJiraID, projectName, projectKey, projectLink,
                                    already_JiraVersion_Name, already_JiraVersion_Desc, already_JiraVersion_ID,
                                    already_JiraVersion_RelDate, already_JiraVersion_Link, checkDTO);

                            pdServiceJiraVer.updateNode(checkDTO);
                        }

                    //지라에 등록된게 없을 때. ( 지라에 등록시켜야 한다 )
                    }else{
                        //지라 등록
                        VersionInput createVersionTest = new VersionInput(projectKey, versionStr, description, releaseDate, isArchived, isReleased);
                        Version version = restClient.getVersionRestClient().createVersion(createVersionTest).claim();

                        //근데 a-RMS에는 등록되어 있을 수도 있으니까. ( 지라는 등록해야 하지만 말이야 )
                        PdServiceJiraVerDTO checkDTO = checkPdServiceJiraVerDTO(pdServiceId, pdServiceVersionStr, pdServiceJiraID, versionStr);

                        //정상적으로 지라에 버전을 등록을 했고, a-RMS에는 없는 ( 아주 정상적인 케이스 )
                        if(checkDTO == null){

                            PdServiceJiraVerDTO pdServiceJiraVerDTO = new PdServiceJiraVerDTO();
                            pdServiceJiraVerDTO.setRef(2L);
                            pdServiceJiraVerDTO.setC_type("default");
                            pdServiceJiraVerDTO.setC_title(pdServiceId + "-" + pdServiceVersionStr + "-" + pdServiceJiraID);

                            setData(pdServiceId, pdServiceName,
                                    pdServiceVersionStr, pdServiceVersionName,
                                    pdServiceJiraID, projectName, projectKey, projectLink,
                                    version, pdServiceJiraVerDTO);

                            pdServiceJiraVer.addNode(pdServiceJiraVerDTO);

                        //정상적으로 지라에 버전을 등록을 했지만 a-RMS에 버전이 있다는거잖아 말이 안되지만 업데이트 해주자
                        }else{

                            checkDTO.setC_title(pdServiceId + "-" + pdServiceVersionStr + "-" + pdServiceJiraID);
                            setData(pdServiceId, pdServiceName,
                                    pdServiceVersionStr, pdServiceVersionName,
                                    pdServiceJiraID, projectName, projectKey, projectLink,
                                    version, checkDTO);

                            pdServiceJiraVer.updateNode(checkDTO);

                        }
                    }
                }
            }

        }
    }

    @Override
    public void set_jiraPriority_toPdServiceJiraPriority() throws Exception {

        final JiraRestClient restClient = ArmsSchedulerUtil.getJiraRestClient();
        Iterable<Priority> priorities = restClient.getMetadataClient().getPriorities().claim();

        for ( Priority priority : priorities ){
            logger.info( "priority = " + priority.getSelf());
            logger.info( "priority = " + priority.getId());
            logger.info( "priority = " + priority.getName());
            logger.info( "priority = " + priority.getDescription());

            PdServiceJiraPriDTO pdServiceJiraPriDTO = new PdServiceJiraPriDTO();
            pdServiceJiraPriDTO.setWhere("c_jirapriority_link", priority.getSelf().toString());
            PdServiceJiraPriDTO checkNode = pdServiceJiraPri.getNode(pdServiceJiraPriDTO);
            //링크가 없다면 추가.
            if( checkNode == null ){
                PdServiceJiraPriDTO addTargetNode = new PdServiceJiraPriDTO();
                addTargetNode.setRef(2L);
                addTargetNode.setC_type("default");
                addTargetNode.setC_jirapriority_desc(priority.getDescription());
                addTargetNode.setC_jirapriority_id(priority.getId().toString());
                addTargetNode.setC_jirapriority_name(priority.getName());
                addTargetNode.setC_jirapriority_link(priority.getSelf().toString());
                pdServiceJiraPri.addNode(addTargetNode);
            }else{
                //있어도 변경 가능하니까 업데이트
                checkNode.setC_jirapriority_desc(priority.getDescription());
                checkNode.setC_jirapriority_id(priority.getId().toString());
                checkNode.setC_jirapriority_name(priority.getName());
                checkNode.setC_jirapriority_link(priority.getSelf().toString());
                pdServiceJiraPri.updateNode(checkNode);
            }
        }
    }

    public PdServiceJiraVerDTO checkPdServiceJiraVerDTO(String pdServiceId, String pdServiceVersionStr, String pdServiceJiraID, String versionStr) throws Exception {
        PdServiceJiraVerDTO searchDTO = new PdServiceJiraVerDTO();
        searchDTO.setWhere("c_pdservice_id", StringUtility.toLong(pdServiceId));
        searchDTO.setWhere("c_pdservice_version_id", StringUtility.toLong(pdServiceVersionStr));
        searchDTO.setWhere("c_pdservice_jira_id", StringUtility.toLong(pdServiceJiraID));
        searchDTO.setWhere("c_jiraversion_name", versionStr);
        return pdServiceJiraVer.getNode(searchDTO);
    }

    public void alreadyDataSetting(String pdServiceId, String pdServiceName,
                                   String pdServiceVersionStr, String pdServiceVersionName,
                                   String pdServiceJiraID, String projectName, String projectKey, String projectLink,
                                   String already_JiraVersion_Name, String already_JiraVersion_Desc,
                                   String already_JiraVersion_ID, String already_JiraVersion_RelDate,
                                   String already_JiraVersion_Link, PdServiceJiraVerDTO checkDTO) {

        checkDTO.setC_pdservice_id(StringUtility.toLong(pdServiceId));
        checkDTO.setC_pdservice_name(pdServiceName);

        checkDTO.setC_pdservice_version_id(StringUtility.toLong(pdServiceVersionStr));
        checkDTO.setC_pdservice_version_name(pdServiceVersionName);

        checkDTO.setC_pdservice_jira_id(StringUtility.toLong(pdServiceJiraID));
        checkDTO.setC_pdservice_jira_name(projectName);
        checkDTO.setC_pdservice_jira_key(projectKey);
        checkDTO.setC_pdservice_jira_link(projectLink);

        checkDTO.setC_jiraversion_name(already_JiraVersion_Name);
        checkDTO.setC_jiraversion_desc(already_JiraVersion_Desc);
        checkDTO.setC_jiraversion_id(already_JiraVersion_ID);
        checkDTO.setC_jiraversion_releasedate(already_JiraVersion_RelDate);
        checkDTO.setC_jiraversion_link(already_JiraVersion_Link);
    }

    public void setData(String pdServiceId, String pdServiceName,
                        String pdServiceVersionStr, String pdServiceVersionName,
                        String pdServiceJiraID, String projectName, String projectKey, String projectLink,
                        Version version, PdServiceJiraVerDTO checkDTO) {

        checkDTO.setC_pdservice_id(StringUtility.toLong(pdServiceId));
        checkDTO.setC_pdservice_name(pdServiceName);

        checkDTO.setC_pdservice_version_id(StringUtility.toLong(pdServiceVersionStr));
        checkDTO.setC_pdservice_version_name(pdServiceVersionName);

        checkDTO.setC_pdservice_jira_id(StringUtility.toLong(pdServiceJiraID));
        checkDTO.setC_pdservice_jira_name(projectName);
        checkDTO.setC_pdservice_jira_key(projectKey);
        checkDTO.setC_pdservice_jira_link(projectLink);

        checkDTO.setC_jiraversion_name(version.getName());
        checkDTO.setC_jiraversion_desc(version.getDescription());
        checkDTO.setC_jiraversion_id(version.getId().toString());
        checkDTO.setC_jiraversion_releasedate(version.getReleaseDate().toString());
        checkDTO.setC_jiraversion_link(version.getSelf().toString());
    }
}