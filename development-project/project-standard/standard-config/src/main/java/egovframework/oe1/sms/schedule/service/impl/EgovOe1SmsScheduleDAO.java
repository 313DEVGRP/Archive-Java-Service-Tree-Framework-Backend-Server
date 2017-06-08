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
package egovframework.oe1.sms.schedule.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.oe1.sms.schedule.service.EgovOe1SmsSchedulerVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

/**
 * 스케줄링 Job 이력 관리를 위한 DAO 클래스
 * @author 운영환경개발팀
 * @since 2010.06.29
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2010.06.29   운영환경개발팀                최초 생성
 *
 * </pre>
 */

@Repository("egovScheduleDAO")
public class EgovOe1SmsScheduleDAO extends EgovAbstractDAO{
	
	/**
	 * 스케줄 실행 로그를 입력 한다
	 * @param EgovOe1SmsSchedulerVO
	 * @return void
	 * @exception Exception
	 */
	public void insertScheduleLog(EgovOe1SmsSchedulerVO schedulerVO) throws Exception {
		insert("EgovOe1SmsScheduleDAO.insertScheduleLog", schedulerVO);
	}

	
	/**
	 * 스케줄 실행 로그를 조회한다
	 * @param EgovOe1SmsSchedulerVO
	 * @return EgovOe1SmsSchedulerVO
	 * @exception Exception
	 */
    public EgovOe1SmsSchedulerVO selectScheduleLog(EgovOe1SmsSchedulerVO schedulerVO) throws Exception {
        return (EgovOe1SmsSchedulerVO) selectByPk("EgovOe1SmsScheduleDAO.selectScheduleLog", schedulerVO);
    }

    /**
	 * 스케줄 실행 로그 목록을 조회한다.
	 * @param EgovOe1SmsSchedulerVO
	 * @return List
	 * @exception Exception
	 */
    public List selectScheduleLogList(EgovOe1SmsSchedulerVO schedulerVO) throws Exception {
        return list("EgovOe1SmsScheduleDAO.selectScheduleLogList", schedulerVO);
    }

    /**
	 * 스케줄 실행 로그 총갯수를 조회한다
	 * @param EgovOe1SmsSchedulerVO
	 * @return int
	 * @exception Exception
	 */
    public int selectScheduleLogListTotCnt(EgovOe1SmsSchedulerVO schedulerVO) {
        return (Integer)getSqlMapClientTemplate().queryForObject("EgovOe1SmsScheduleDAO.selectScheduleLogListTotCnt", schedulerVO);
    }
    
}
