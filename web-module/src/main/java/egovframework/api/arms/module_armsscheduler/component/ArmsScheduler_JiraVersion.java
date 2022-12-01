package egovframework.api.arms.module_armsscheduler.component;

import com.atlassian.jira.rest.client.api.JiraRestClient;
import com.atlassian.jira.rest.client.api.domain.Version;
import com.atlassian.jira.rest.client.api.domain.input.VersionInput;
import com.atlassian.util.concurrent.Promise;
import egovframework.api.arms.module_pdservice.model.PdServiceDTO;
import egovframework.api.arms.module_pdservice.service.PdService;
import egovframework.api.arms.module_pdserviceconnect.model.PdServiceConnectDTO;
import egovframework.api.arms.module_pdserviceconnect.service.PdServiceConnect;
import egovframework.api.arms.module_pdservicejira.model.PdServiceJiraDTO;
import egovframework.api.arms.module_pdservicejira.service.PdServiceJira;
import egovframework.api.arms.module_pdserviceversion.model.PdServiceVersionDTO;
import egovframework.api.arms.module_pdserviceversion.service.PdServiceVersion;
import egovframework.api.arms.util.StringUtility;
import egovframework.com.cmm.util.string.StringUtil;
import egovframework.com.ext.jstree.support.util.StringUtils;
import org.hibernate.criterion.Order;
import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.net.URISyntaxException;
import java.sql.Timestamp;
import java.util.List;

@Component
public class ArmsScheduler_JiraVersion {

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

    @Scheduled(initialDelay = 9 * 60 * 1000, fixedDelay = 3 * 60 * 1000) //9m 딜레이, 3m 단위
    public void set_PdServiceVersion_toJiraProjectVersion() throws Exception {

        final JiraRestClient restClient = ArmsScheduler.getJiraRestClient();

        PdServiceConnectDTO pdServiceConnectDTOList = new PdServiceConnectDTO();
        pdServiceConnectDTOList.setOrder(Order.asc("c_id"));
        List<PdServiceConnectDTO> list = pdServiceConnect.getChildNode(pdServiceConnectDTOList);

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
            if(StringUtils.isNotEmpty(pdServiceVersionStr)){

                PdServiceVersionDTO pdServiceVersionDTO = new PdServiceVersionDTO();
                pdServiceVersionDTO.setC_id(StringUtility.toLong(pdServiceVersionStr));
                PdServiceVersionDTO returnPdServiceVersionDTO = pdServiceVersion.getNode(pdServiceVersionDTO);
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

                    //찾은 정보를 기반으로 지라에 등록한다.
                    String projectKey = returnPdServiceJiraDTO.getC_jira_key();
                    String versionStr = "[a-RMS]_" + StringUtility.deleteWhitespace(pdServiceName) + "_" + StringUtility.deleteWhitespace(pdServiceVersionName);
                    String description = "[a-RMS] 에서 관리하는 버전 정보 :: " + pdServiceVersionStart + "~" + pdServiceVersionEnd;
                    //DateTime releaseDate = new DateTime(pdServiceVersionEnd);
                    DateTime releaseDate = new DateTime("2022-12-31");
                    boolean isArchived = false;
                    boolean isReleased = false;

                    VersionInput createVersionTest = new VersionInput(projectKey, versionStr, description, releaseDate, isArchived, isReleased);
                    Version version = restClient.getVersionRestClient().createVersion(createVersionTest).claim();
                    logger.info("version getName = " + version.getName());
                    logger.info("version getDescription = " + version.getDescription());
                    logger.info("version getId = " + version.getId());
                    logger.info("version getReleaseDate = " + version.getReleaseDate());
                    logger.info("version getSelf = " + version.getSelf());
                }
            }

        }
    }

}
