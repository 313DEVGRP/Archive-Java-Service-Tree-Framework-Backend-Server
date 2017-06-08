/*
 * Copyright 2010 MOPAS(Ministry of Public Administration and Security).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.oe1.sms.schedule.service;

/**
 * 스케줄링 서비스의 이력관리를 위한 VO 클래스
 * @author 운영환경개발팀
 * @since 2010.06.29
 * @version 1.0
 * @see <pre>
 * &lt;&lt; 개정이력(Modification Information) &gt;&gt;
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2010.06.29   운영환경개발팀                최초 생성
 * 
 * </pre>
 */

public class EgovOe1SmsSchedulerVO {

    /** job 명 */
    private String jobNm;

    /** 그룹 명 */
    private String jobGroupNm;
    /** job 설명 */
    private String jobDescription;
    /** job 실행 클래스 */
    private String jobClass;
    /** 시작 시간 */
    private String startDate;
    /** 종료 시간 */
    private String endDate;
    /** 트리거 타입 */
    private String triggerType;
    /** 반복 시간 */
    private String repeatInterval;
    /** 크론 표현식 */
    private String cronExp;
    /** 전 실행 시간 */
    private String previousFireTime;
    /** 다음 실행 시간 */
    private String nextFireTime;
    /** 상태 */
    private String status;

    /** 로그 구분 */
    private String logSe;
    /** 로그 메시지 */
    private String logMssage;
    /** 발생일자 */
    private String occurDate;
    /** 로그 아이디 */
    private String logId;
    /** 실행 시간 */
    private String jobExecutTime;

    /** 검색조건 */
    private String searchCondition = "";

    /** 검색Keyword */
    private String searchKeyword = "";

    /** 검색사용여부 */
    private String searchUseYn = "";

    /** 현재페이지 */
    private int pageIndex = 1;

    /** 페이지갯수 */
    private int pageUnit = 10;

    /** 페이지사이즈 */
    private int pageSize = 10;

    /** firstIndex */
    private int firstIndex = 1;

    /** lastIndex */
    private int lastIndex = 1;

    /** recordCountPerPage */
    private int recordCountPerPage = 10;

    /**
     * 검색사용여부 Getter 메소드
     * @return String
     */
    public String getSearchUseYn() {
        return searchUseYn;
    }

    /**
     * 검색사용여부 setter 메소드
     * @return void
     */
    public void setSearchUseYn(String searchUseYn) {
        this.searchUseYn = searchUseYn;
    }

    /**
     * 현재페이지 Getter 메소드
     * @return int
     */
    public int getPageIndex() {
        return pageIndex;
    }

    /**
     * 현재페이지 setter 메소드
     * @return void
     */
    public void setPageIndex(int pageIndex) {
        this.pageIndex = pageIndex;
    }

    /**
     * 페이지갯수 Getter 메소드
     * @return int
     */
    public int getPageUnit() {
        return pageUnit;
    }

    /**
     * 페이지갯수 setter 메소드
     * @return void
     */
    public void setPageUnit(int pageUnit) {
        this.pageUnit = pageUnit;
    }

    /**
     * 페이지 사이즈 Getter 메소드
     * @return int
     */
    public int getPageSize() {
        return pageSize;
    }

    /**
     * 페이지 사이즈 setter 메소드
     * @return void
     */
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    /**
     * firstIndex Getter 메소드
     * @return int
     */
    public int getFirstIndex() {
        return firstIndex;
    }

    /**
     * firstIndex setter 메소드
     * @return void
     */
    public void setFirstIndex(int firstIndex) {
        this.firstIndex = firstIndex;
    }

    /**
     * lastIndex Getter 메소드
     * @return int
     */
    public int getLastIndex() {
        return lastIndex;
    }

    /**
     * lastIndex setter 메소드
     * @return void
     */
    public void setLastIndex(int lastIndex) {
        this.lastIndex = lastIndex;
    }

    /**
     * recordCountPerPage Getter 메소드
     * @return int
     */
    public int getRecordCountPerPage() {
        return recordCountPerPage;
    }

    /**
     * recordCountPerPage setter 메소드
     * @return void
     */
    public void setRecordCountPerPage(int recordCountPerPage) {
        this.recordCountPerPage = recordCountPerPage;
    }

    /**
     * 검색조건 Getter 메소드
     * @return String
     */
    public String getSearchCondition() {
        return searchCondition;
    }

    /**
     * 검색조건 setter 메소드
     * @return void
     */
    public void setSearchCondition(String searchCondition) {
        this.searchCondition = searchCondition;
    }

    /**
     * searchKeyword Getter 메소드
     * @return String
     */
    public String getSearchKeyword() {
        return searchKeyword;
    }

    /**
     * searchKeyword setter 메소드
     * @return void
     */
    public void setSearchKeyword(String searchKeyword) {
        this.searchKeyword = searchKeyword;
    }

    // /**
    // * jobEctTime Getter 메소드
    // * @return String
    // */
    // public String getJobEctTime() {
    // return jobEctTime;
    // }
    //
    // /**
    // * jobEctTime setter 메소드
    // * @return void
    // */
    // public void setJobEctTime(String jobEctTime) {
    // this.jobEctTime = jobEctTime;
    // }

    /**
     * logId Getter 메소드
     * @return String
     */
    public String getLogId() {
        return logId;
    }

    /**
     * logId setter 메소드
     * @return void
     */
    public void setLogId(String logId) {
        this.logId = logId;
    }

    // /**
    // * logGbn Getter 메소드
    // * @return String
    // */
    // public String getLogGbn() {
    // return logGbn;
    // }
    //
    // /**
    // * logGbn setter 메소드
    // * @return void
    // */
    // public void setLogGbn(String logGbn) {
    // this.logGbn = logGbn;
    // }

    // /**
    // * logMsg Getter 메소드
    // * @return String
    // */
    // public String getLogMsg() {
    // return logMsg;
    // }
    //
    // /**
    // * logMsg setter 메소드
    // * @return void
    // */
    // public void setLogMsg(String logMsg) {
    // this.logMsg = logMsg;
    // }

    /**
     * occurDate Getter 메소드
     * @return String
     */
    public String getOccurDate() {
        return occurDate;
    }

    /**
     * occurDate setter 메소드
     * @return void
     */
    public void setOccurDate(String occurDate) {
        this.occurDate = occurDate;
    }

    // /**
    // * jobName Getter 메소드
    // * @return String
    // */
    // public String getJobName() {
    // return jobName;
    // }
    //
    // /**
    // * jobName setter 메소드
    // * @return void
    // */
    // public void setJobName(String jobName) {
    // this.jobName = jobName;
    // }
    //
    // /**
    // * groupName Getter 메소드
    // * @return String
    // */
    // public String getGroupName() {
    // return groupName;
    // }
    //
    // /**
    // * groupName setter 메소드
    // * @return void
    // */
    // public void setGroupName(String groupName) {
    // this.groupName = groupName;
    // }

    /**
     * jobDescription Getter 메소드
     * @return String
     */
    public String getJobDescription() {
        return jobDescription;
    }

    /**
     * jobNm Getter 메소드
     * @return String
     */
    public String getJobNm() {
        return jobNm;
    }

    /**
     * jobNm setter 메소드
     * @return void
     */
    public void setJobNm(String jobNm) {
        this.jobNm = jobNm;
    }

    /**
     * jobGroupNm Getter 메소드
     * @return String
     */
    public String getJobGroupNm() {
        return jobGroupNm;
    }

    /**
     * jobGroupNm setter 메소드
     * @return void
     */
    public void setJobGroupNm(String jobGroupNm) {
        this.jobGroupNm = jobGroupNm;
    }

    /**
     * logSe Getter 메소드
     * @return String
     */
    public String getLogSe() {
        return logSe;
    }

    /**
     * logSe setter 메소드
     * @return void
     */
    public void setLogSe(String logSe) {
        this.logSe = logSe;
    }

    /**
     * logMssage Getter 메소드
     * @return String
     */
    public String getLogMssage() {
        return logMssage;
    }

    /**
     * logMssage setter 메소드
     * @return void
     */
    public void setLogMssage(String logMssage) {
        this.logMssage = logMssage;
    }

    /**
     * jobExecutTime Getter 메소드
     * @return String
     */
    public String getJobExecutTime() {
        return jobExecutTime;
    }

 
    /**
     * jobExecutTime setter 메소드
     * @return void
     */public void setJobExecutTime(String jobExecutTime) {
        this.jobExecutTime = jobExecutTime;
    }

    /**
     * jobDescription setter 메소드
     * @return void
     */
    public void setJobDescription(String jobDescription) {
        this.jobDescription = jobDescription;
    }

    /**
     * jobClass Getter 메소드
     * @return String
     */
    public String getJobClass() {
        return jobClass;
    }

    /**
     * jobClass setter 메소드
     * @return void
     */
    public void setJobClass(String jobClass) {
        this.jobClass = jobClass;
    }

    /**
     * startDate Getter 메소드
     * @return String
     */
    public String getStartDate() {
        return startDate;
    }

    /**
     * startDate setter 메소드
     * @return void
     */
    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    /**
     * endDate Getter 메소드
     * @return String
     */
    public String getEndDate() {
        return endDate;
    }

    /**
     * endDate setter 메소드
     * @return void
     */
    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    /**
     * triggerType Getter 메소드
     * @return String
     */
    public String getTriggerType() {
        return triggerType;
    }

    /**
     * triggerType setter 메소드
     * @return void
     */
    public void setTriggerType(String triggerType) {
        this.triggerType = triggerType;
    }

    /**
     * repeatInterval Getter 메소드
     * @return String
     */
    public String getRepeatInterval() {
        return repeatInterval;
    }

    /**
     * repeatInterval setter 메소드
     * @return void
     */
    public void setRepeatInterval(String repeatInterval) {
        this.repeatInterval = repeatInterval;
    }

    /**
     * occurDate Getter 메소드
     * @return String
     */
    public String getCronExp() {
        return cronExp;
    }

    /**
     * quartzPropValue setter 메소드
     * @return void
     */
    public void setCronExp(String cronExp) {
        this.cronExp = cronExp;
    }

    /**
     * occurDate Getter 메소드
     * @return String
     */
    public String getPreviousFireTime() {
        return previousFireTime;
    }

    /**
     * previousFireTime setter 메소드
     * @return void
     */
    public void setPreviousFireTime(String previousFireTime) {
        this.previousFireTime = previousFireTime;
    }

    /**
     * nextFireTime Getter 메소드
     * @return String
     */
    public String getNextFireTime() {
        return nextFireTime;
    }

    /**
     * nextFireTime setter 메소드
     * @return void
     */
    public void setNextFireTime(String nextFireTime) {
        this.nextFireTime = nextFireTime;
    }

    /**
     * status Getter 메소드
     * @return String
     */
    public String getStatus() {
        return status;
    }

    /**
     * status setter 메소드
     * @return void
     */
    public void setStatus(String status) {
        this.status = status;
    }

}
