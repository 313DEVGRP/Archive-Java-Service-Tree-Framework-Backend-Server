package egovframework.com.cop.cmy.service;

import java.util.Map;


/**
 * 승인정보를 관리하기 위한 서비스 인테페이스 클래스
 * @author 공통서비스개발팀 이삼섭
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.4.7  이삼섭          최초 생성
 *
 * </pre>
 */
public interface EgovConfirmManageService {

    /**
     * 승인(탈퇴)요청에 대한 등록을 처리한다.
     * 
     * @param history
     * @throws Exception
     */
    public void insertConfirmRequest(ConfirmHistory history) throws Exception;

    /**
     * 승인(탈퇴)요청에 대한 목록을 조회한다.
     * 
     * @param historyVO
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectConfirmRequest(ConfirmHistoryVO historyVO) throws Exception;

    /**
     * 승인(탈퇴)요청에 대한 확인을 처리한다.
     * 
     * @param history
     * @throws Exception
     */
    public void updateConfirmRequest(ConfirmHistory history) throws Exception;

    /**
     * 승인(탈퇴)요청에 대한 상세내용을 조회한다.
     * 
     * @param historyVO
     * @return
     * @throws Exception
     */
    public ConfirmHistoryVO selectSingleConfirmRequest(ConfirmHistoryVO historyVO) throws Exception;

    /**
     * 현재 승인 요청된 건수를 조회한다.
     */
    public int countConfirmRequest(ConfirmHistory history) throws Exception;
}
