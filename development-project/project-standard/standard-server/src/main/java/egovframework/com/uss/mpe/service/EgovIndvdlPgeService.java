package egovframework.com.uss.mpe.service;
import java.util.List;

/**
 * 개요
 * - 마이페이지에 대한 Service Interface를 정의한다.
 * 
 * 상세내용
 * - 마이페이지 콘텐츠의 등록, 수정, 삭제, 조회, 반영확인 기능을 제공한다.
 * - 마이페이지 콘텐츠의 조회기능은 목록조회, 상세조회로 구분된다.
 * - 등록된 콘텐츠를 마이페이지에 추가, 삭제, 조회 기능을 제공한다.
 * @author 이창원
 * @version 1.0
 * @created 05-8-2009 오후 2:19:28
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일          수정자           수정내용
 *  -----------    --------    ---------------------------
 *  2009.08.04      이창원          최초 생성
 *
 * Copyright (C) 2009 by MOPAS  All right reserved.
 * </pre>
 */
public interface EgovIndvdlPgeService {

	/**
	 * 기 등록된 마이페이지 정보를 조회한다.
	 * @param indvdlPgeVO - 마이페이지 VO
	 * @return indvdlPgeVO - 마이페이지 VO
	 
	public IndvdlPgeVO selectIndvdlpgeResult(IndvdlPgeVO indvdlPgeVO);
*/
	/**
	 * 기 등록된 마이페이지 컨텐츠정보를 삭제한다.
	 * @param indvdlPge - 마이페이지 model
	 * @return boolean - 반영성공 여부
	 */
	public boolean deleteIndvdlpgeCntnts(IndvdlPge indvdlPge) throws Exception;
	
	/**
	 * 기 등록된 마이페이지 컨텐츠정보를 DB에서 완전 삭제한다.
	 * @param indvdlPge - 마이페이지 model
	 * @return boolean - 반영성공 여부
	 */
	public boolean deleteIndvdlpgeCntntsDB(IndvdlPge indvdlPge) throws Exception;

	/**
	 * 마이페이지 컨텐츠정보를 신규로 등록한다.
	 * @param indvdlPge - 마이페이지 model
	 * @return boolean - 반영성공 여부
	 */
	public boolean insertIndvdlpgeCntnts(IndvdlPge indvdlPge) throws Exception;

	/**
	 * 등록된 마이페이지 컨텐츠의 상세정보를 조회한다.
	 * @param indvdlPgeCntntsVO - 마이페이지 콘텐츠 Vo
	 * @return indvdlPgeCntntsVO - 마이페이지 콘텐츠 Vo
	 */
	public IndvdlPge selectIndvdlpgeCntnts(IndvdlPge indvdlPge);

	/**
	 * 마이페이지 컨텐츠를 관리하기 위해 등록된 마이페이지 컨텐츠 목록을 조회한다.
	 * @param indvdlPgeCntntsVO - 마이페이지 콘텐츠 Vo
	 * @return List - 마이페이지 컨텐츠 목록
	 */
	public List<IndvdlPgeCntntsVO> selectIndvdlpgeCntntsList(IndvdlPgeCntntsVO indvdlPgeCntntsVO);
	
	/**
	 * 마이페이지에 컨텐츠를 추가하기 위해 컨텐츠 목록을 조회한다.
	 * @param indvdlPgeCntntsVO - 마이페이지 콘텐츠 Vo
	 * @return List - 마이페이지 컨텐츠 목록
	 */
	public List<IndvdlPgeCntntsVO> addIndvdlpgeCntntsList(IndvdlPgeCntntsVO indvdlPgeCntntsVO);
	
	/**
	 * 마이페이지 컨텐츠가 등록된 개수를 조회한다.
	 * @param indvdlPgeCntntsVO - 마이페이지 콘텐츠 Vo
	 * @return int - 마이페이지 컨텐츠 개수
	 */	
	public int selectIndvdlpgeCntntsTotCnt(IndvdlPgeCntntsVO indvdlPgeCntntsVO);
	
	/**
	 * 마이페이지에 등록 가능한 컨텐츠 개수를 조회한다.
	 * @param indvdlPgeCntntsVO - 마이페이지 콘텐츠 Vo
	 * @return int - 마이페이지 컨텐츠 개수
	 */	
	public int selectIndvdlpgeAddCntntsTotCnt(IndvdlPgeCntntsVO indvdlPgeCntntsVO);
	
	/**
	 * 기 등록된 마이페이지 컨텐츠정보를 수정한다.
	 * @param indvdlPge - 마이페이지 model
	 * @return boolean - 반영성공 여부
	 */
	public boolean updateIndvdlpgeCntnts(IndvdlPge indvdlPge);
	
	/**
	 * 마이페이지 설정정보 유무 확인한다.
	 * @param indvdlPgeVO - 마이페이지 콘텐츠 Vo
	 * @return int - 마이페이지 컨텐츠 개수
	 */	
	public int selectIndvdlpgeResultCnt(IndvdlPgeVO indvdlPgeVO);
	
	/**
	 * 마이페이지 설정정보를 수정한다.
	 * @param indvdlPgeVO - 마이페이지 콘텐츠 Vo
	 * @return boolean - 작업성공 여부
	 */	
	public boolean updateIndvdlpgeConf(IndvdlPgeVO indvdlPgeVO);

	/**
	 * 마이페이지 설정정보를 추가한다.
	 * @param indvdlPgeVO - 마이페이지 콘텐츠 Vo
	 * @return boolean - 작업성공 여부
	 * @throws Exception 
	 */	
	public boolean insertIndvdlpgeConf(IndvdlPgeVO indvdlPgeVO) throws Exception;
	
	/**
	 * 기 등록된 마이페이지 텝 정보를 조회한다.
	 * @param indvdlPgeVO - 마이페이지 VO
	 * @return indvdlPgeVO - 마이페이지 VO
	 */
	public IndvdlPgeVO selectIndvdlpgeResultView(IndvdlPgeVO indvdlPgeVO) throws Exception;
	
	/**
	 * 기 등록된 마이페이지 텝 정보의 카운트를 조회한다.
	 * @param indvdlPgeVO - 마이페이지 VO
	 * @return int
	 */
	public int selectIndvdlpgeResultTotCnt(IndvdlPgeVO indvdlPgeVO) throws Exception ;
	
	/**
	 * 기 등록된 마이페이지 정보를 조회한다.
	 * @param indvdlPgeVO - 마이페이지 VO
	 * @return indvdlPgeVO - 마이페이지 VO
	 */
	public List<IndvdlPgeVO> selectIndvdlpgeResultDetail(IndvdlPgeVO indvdlPgeVO) throws Exception;	
	
	/**
	 * 기 등록된 마이페이지 정보의 카운트를 조회한다.
	 * @param indvdlPgeVO - 마이페이지 VO
	 * @return int
	 */
	public int selectIndvdlpgeResultDetailTotCnt(IndvdlPgeVO indvdlPgeVO) throws Exception;
	
	/**
	 * 마이페이지에 컨텐츠를 바로추가한다.
	 * @param indvdlPgeCntntsVO - 마이페이지 콘텐츠 Vo
	 * @return boolean - 성공여부
	 */
	public boolean addIndvdlpgeCntnts(IndvdlPgeCntntsVO indvdlPgeCntntsVO) throws Exception;
	
	/**
	 * 마이페이지에서 컨텐츠를 바로 삭제한다.
	 * @param indvdlPgeCntntsVO - 마이페이지 콘텐츠 Vo
	 * @return boolean - 성공여부
	 */
	public boolean delIndvdlpgeCntnts(IndvdlPgeCntntsVO indvdlPgeCntntsVO) throws Exception;
}