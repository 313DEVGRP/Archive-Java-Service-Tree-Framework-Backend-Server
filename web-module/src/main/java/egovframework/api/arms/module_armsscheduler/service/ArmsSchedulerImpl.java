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
import java.util.Spliterator;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.stream.StreamSupport;

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

        PdServiceConnectDTO pdServiceConnectDTOList = new PdServiceConnectDTO();
        pdServiceConnectDTOList.setOrder(Order.asc("c_id"));
        Criterion criterion = Restrictions.not(
                // replace "id" below with property name, depending on what you're filtering against
                Restrictions.in("c_id", new Object[] {1L, 2L})
        );
        pdServiceConnectDTOList.getCriterions().add(criterion);
        List<PdServiceConnectDTO> list = pdServiceConnect.getChildNode(pdServiceConnectDTOList);

        PdServiceJiraVerDTO pdServiceJiraVerDTOList = new PdServiceJiraVerDTO();
        pdServiceJiraVerDTOList.setOrder(Order.asc("c_id"));
        List<PdServiceJiraVerDTO> checkJiraVerList = pdServiceJiraVer.getChildNode(pdServiceJiraVerDTOList);

        for( PdServiceConnectDTO pdServiceConnectDTO : list){
            String pdServiceId = pdServiceConnectDTO.getC_pdservice_id();
            String pdServiceVersionStr = pdServiceConnectDTO.getC_pdservice_version_id();
            String pdServiceJiraList = pdServiceConnectDTO.getC_pdservice_jira_ids();

            pdServiceJiraList = StringUtils.remove(pdServiceJiraList, "\"");
            pdServiceJiraList = StringUtils.remove(pdServiceJiraList, "]");
            pdServiceJiraList = StringUtils.remove(pdServiceJiraList, "[");

            logger.info("pdServiceJiraList => " + pdServiceJiraList);

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

                    //찾은 정보를 기반으로 지라프로젝트에 버전정보를 등록한다.
                    String projectKey = returnPdServiceJiraDTO.getC_jira_key();
                    String versionStr = "[a-RMS]_" + StringUtility.replace(pdServiceName, " ", "_") + "_" + StringUtility.deleteWhitespace(pdServiceVersionName);
                    String description = "[a-RMS] 에서 관리하는 버전 정보 :: " + pdServiceVersionStart + "~" + pdServiceVersionEnd;
                    //DateTime releaseDate = new DateTime(pdServiceVersionEnd);
                    DateTime releaseDate = new DateTime("2022-12-31");
                    boolean isArchived = false;
                    boolean isReleased = false;

                    AtomicBoolean checker = new AtomicBoolean(false);
                    Iterable<Version> iterable = restClient.getProjectClient().getProject(projectKey).get().getVersions();
                    Spliterator<Version> spliterator = iterable.spliterator();
                    StreamSupport.stream(spliterator, false)
                            .forEach(version -> {
                                if ( StringUtility.equals(versionStr, version.getName())){
                                    logger.info("project version getName = " + version.getName());
                                    logger.info("project version getDescription = " + version.getDescription());
                                    logger.info("project version getId = " + version.getId());
                                    logger.info("project version getReleaseDate = " + version.getReleaseDate());
                                    logger.info("project version getSelf = " + version.getSelf());
                                    checker.set(true);
                                }
                            });

                    if (checker.get()) {
                        logger.info("이미 존재하는 버전 -> " + projectKey + "::" + versionStr);
                    }else{
                        VersionInput createVersionTest = new VersionInput(projectKey, versionStr, description, releaseDate, isArchived, isReleased);
                        Version version = restClient.getVersionRestClient().createVersion(createVersionTest).claim();
                        logger.info("version getName = " + version.getName());
                        logger.info("version getDescription = " + version.getDescription());
                        logger.info("version getId = " + version.getId());
                        logger.info("version getReleaseDate = " + version.getReleaseDate());
                        logger.info("version getSelf = " + version.getSelf());


                        boolean anyMatch = checkJiraVerList.stream().anyMatch(dto ->
                                StringUtils.equals(dto.getC_jiraversion_link(), version.getSelf().toString())
                        );

                        if(anyMatch){
                            logger.info("already registerd jira version = " + version.getSelf().toString());
                        }else{
                            PdServiceJiraVerDTO searchDTO = new PdServiceJiraVerDTO();
                            searchDTO.setWhere("c_jiraversion_name", version.getName());
                            PdServiceJiraVerDTO checkDTO = pdServiceJiraVer.getNode(searchDTO);

                            if(StringUtility.isEmpty(checkDTO.getC_jiraversion_name())){

                                PdServiceJiraVerDTO pdServiceJiraVerDTO = new PdServiceJiraVerDTO();
                                pdServiceJiraVerDTO.setRef(2L);
                                pdServiceJiraVerDTO.setC_type("default");

                                setData(pdServiceId, pdServiceVersionStr, pdServiceJiraID, version, pdServiceJiraVerDTO);


                                pdServiceJiraVer.addNode(pdServiceJiraVerDTO);

                            }else{

                                setData(pdServiceId, pdServiceVersionStr, pdServiceJiraID, version, checkDTO);

                                pdServiceJiraVer.updateNode(checkDTO);

                            }
                        }
                    }
                }
            }

        }
    }

    public void setData(String pdServiceId, String pdServiceVersionStr, String pdServiceJiraID, Version version, PdServiceJiraVerDTO checkDTO) {
        checkDTO.setC_pdservice_id(pdServiceId);
        checkDTO.setC_pdservice_version_id(pdServiceVersionStr);
        checkDTO.setC_pdservice_jira_id(pdServiceJiraID);
        checkDTO.setC_jiraversion_name(version.getName());
        checkDTO.setC_jiraversion_desc(version.getDescription());
        checkDTO.setC_jiraversion_id(version.getId().toString());
        checkDTO.setC_jiraversion_releasedate(version.getReleaseDate().toString());
        checkDTO.setC_jiraversion_link(version.getSelf().toString());
    }
}