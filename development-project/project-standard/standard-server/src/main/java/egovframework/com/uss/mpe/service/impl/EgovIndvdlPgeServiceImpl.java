package egovframework.com.uss.mpe.service.impl;
import java.util.List;

import egovframework.com.uss.mpe.service.EgovIndvdlPgeService;
import egovframework.com.uss.mpe.service.IndvdlPge;
import egovframework.com.uss.mpe.service.IndvdlPgeCntntsVO;
import egovframework.com.uss.mpe.service.IndvdlPgeVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

/**
 * 개요
 * - 마이페이지에 대한 ServiceImpl을 정의한다.
 *
 * 상세내용
 * - 마이페이지 콘텐츠의 등록, 수정, 삭제, 조회, 반영확인 기능을 제공한다.
 * - 마이페이지 콘텐츠의 조회기능은 목록조회, 상세조회로 구분된다.
 * - 등록된 콘텐츠를 마이페이지에 추가, 삭제, 조회 기능을 제공한다.
 * @author 이창원
 * @version 1.0
 * @created 05-8-2009 오후 2:19:28
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일        수정자           수정내용
 *  ----------  ----------    ---------------------------
 *  2009.08.04  이창원          최초 생성
 *
 * Copyright (C) 2009 by MOPAS  All right reserved.
 * </pre>
 */
@Service("EgovIndvdlPgeService")
public class EgovIndvdlPgeServiceImpl extends EgovAbstractServiceImpl implements EgovIndvdlPgeService {

	@Resource(name="IndvdlPgeDAO")
    private IndvdlPgeDAO indvdlPgeDAO;

	public EgovIndvdlPgeServiceImpl(){

	}
	/**
	 * 기 등록된 마이페이지 정보를 조회한다.
	 * @param indvdlPgeVO - 마이페이지 VO
	 * @return indvdlPgeVO - 마이페이지 VO
	 *
	 * @param indvdlPgeVO

	public IndvdlPgeVO selectIndvdlpgeResult(IndvdlPgeVO indvdlPgeVO){
		return indvdlPgeDAO.selectIndvdlpgeResultV(indvdlPgeVO);
	}
	*/
	/**
	 * 기 등록된 마이페이지 컨텐츠정보를 삭제한다.
	 * @param indvdlPge - 마이페이지 model
	 * @return boolean - 반영성공 여부
	 *
	 * @param indvdlPge
	 */
	public boolean deleteIndvdlpgeCntnts(IndvdlPge indvdlPge) throws Exception {
		return indvdlPgeDAO.deleteIndvdlpgeCntnts(indvdlPge);
	}

	/**
	 * 기 등록된 마이페이지 컨텐츠정보를 DB에서 완전 삭제한다.
	 * @param indvdlPge - 마이페이지 model
	 * @return boolean - 반영성공 여부
	 *
	 * @param indvdlPge
	 */
	public boolean deleteIndvdlpgeCntntsDB(IndvdlPge indvdlPge) throws Exception {
		return indvdlPgeDAO.deleteIndvdlpgeCntntsDB(indvdlPge);
	}

	/**
	 * 마이페이지 컨텐츠정보를 신규로 등록한다.
	 * @param indvdlPge - 마이페이지 model
	 * @return boolean - 반영성공 여부
	 *
	 * @param indvdlPge
	 */
	public boolean insertIndvdlpgeCntnts(IndvdlPge indvdlPge) throws Exception{
		return indvdlPgeDAO.insertIndvdlpgeCntnts(indvdlPge);
	}

	/**
	 * 등록된 마이페이지 컨텐츠의 상세정보를 조회한다.
	 * @param indvdlPgeCntntsVO - 마이페이지 콘텐츠 Vo
	 * @return indvdlPgeCntntsVO - 마이페이지 콘텐츠 Vo
	 *
	 * @param indvdlPgeCntntsVO
	 */
	public IndvdlPge selectIndvdlpgeCntnts(IndvdlPge indvdlPge){
		return indvdlPgeDAO.selectIndvdlpgeCntnts(indvdlPge);
	}

	/**
	 * 마이페이지 컨텐츠를 관리하기 위해 등록된 마이페이지 컨텐츠 목록을 조회한다.
	 * @param indvdlPgeCntntsVO - 마이페이지 콘텐츠 Vo
	 * @return List - 마이페이지 컨텐츠 목록
	 *
	 * @param indvdlPgeCntntsVO
	 */
	public List<IndvdlPgeCntntsVO> selectIndvdlpgeCntntsList(IndvdlPgeCntntsVO indvdlPgeCntntsVO){
		return indvdlPgeDAO.selectIndvdlpgeCntntsList(indvdlPgeCntntsVO);
	}

	/**
	 * 마이페이지에 컨텐츠를 추가하기 위해 등록된 마이페이지 컨텐츠 목록을 조회한다.
	 * @param indvdlPgeCntntsVO - 마이페이지 콘텐츠 Vo
	 * @return List - 마이페이지 컨텐츠 목록
	 *
	 * @param indvdlPgeCntntsVO
	 */
	public List<IndvdlPgeCntntsVO> addIndvdlpgeCntntsList(IndvdlPgeCntntsVO indvdlPgeCntntsVO){
		return indvdlPgeDAO.addIndvdlpgeCntntsList(indvdlPgeCntntsVO);
	}

	/**
	 * 마이페이지에 등록 가능한 컨텐츠 개수를 조회한다.
	 * @param indvdlPgeCntntsVO - 마이페이지 콘텐츠 Vo
	 * @return int - 마이페이지 컨텐츠 개수
	 */
	public int selectIndvdlpgeAddCntntsTotCnt(IndvdlPgeCntntsVO indvdlPgeCntntsVO){
		return indvdlPgeDAO.selectIndvdlpgeAddCntntsListTotCnt(indvdlPgeCntntsVO);
	}

	/**
	 * 마이페이지에 컨텐츠를 바로추가한다.
	 * @param indvdlPgeCntntsVO - 마이페이지 콘텐츠 Vo
	 * @return boolean - 성공여부
	 */
	public boolean addIndvdlpgeCntnts(IndvdlPgeCntntsVO indvdlPgeCntntsVO){
		return indvdlPgeDAO.addIndvdlpgeCntnts(indvdlPgeCntntsVO);
	}

	/**
	 * 마이페이지에 컨텐츠를 바로 삭제한다.
	 * @param indvdlPgeCntntsVO - 마이페이지 콘텐츠 Vo
	 * @return boolean - 성공여부
	 */
	public boolean delIndvdlpgeCntnts(IndvdlPgeCntntsVO indvdlPgeCntntsVO){
		return indvdlPgeDAO.delIndvdlpgeCntnts(indvdlPgeCntntsVO);
	}

	/**
	 * 마이페이지 컨텐츠가 등록된 개수를 조회한다.
	 * @param indvdlPgeCntntsVO - 마이페이지 콘텐츠 Vo
	 * @return int - 마이페이지 컨텐츠 개수
	 */
	public int selectIndvdlpgeCntntsTotCnt(IndvdlPgeCntntsVO indvdlPgeCntntsVO){
		return indvdlPgeDAO.selectIndvdlpgeCntntsListTotCnt(indvdlPgeCntntsVO);
	}

	/**
	 * 기 등록된 마이페이지 컨텐츠정보를 수정한다.
	 * @param indvdlPge - 마이페이지 model
	 * @return boolean - 반영성공 여부
	 *
	 * @param indvdlPge
	 */
	public boolean updateIndvdlpgeCntnts(IndvdlPge indvdlPge){
		return indvdlPgeDAO.updateIndvdlpgeCntnts(indvdlPge);
	}
	/**
	 * 마이페이지 설정여부를 조회한다.
	 * @param indvdlPgeCntntsVO - 마이페이지 콘텐츠 Vo
	 * @return int - 마이페이지 컨텐츠 개수
	 */
	public int selectIndvdlpgeResultCnt(IndvdlPgeVO indvdlPgeVO){
		return indvdlPgeDAO.selectIndvdlpgeResultCnt(indvdlPgeVO);
	}

	/**
	 * 마이페이지 설정정보를 수정한다.
	 * @param indvdlPgeVO - 마이페이지 콘텐츠 Vo
	 * @return boolean - 작업성공 여부
	 */
	public boolean updateIndvdlpgeConf(IndvdlPgeVO indvdlPgeVO){
		return indvdlPgeDAO.updateIndvdlpgeConf(indvdlPgeVO);
	}

	/**
	 * 마이페이지 설정정보를 추가한다.
	 * @param indvdlPgeVO - 마이페이지 콘텐츠 Vo
	 * @return boolean - 작업성공 여부
	 */
	public boolean insertIndvdlpgeConf(IndvdlPgeVO indvdlPgeVO) throws Exception{
		return indvdlPgeDAO.insertIndvdlpgeConf(indvdlPgeVO);
	}

	/**
	 * 기 등록된 마이페이지 텝 정보를 조회한다.
	 * @param indvdlPgeVO - 마이페이지 VO
	 * @return indvdlPgeVO - 마이페이지 VO
	 */
	public IndvdlPgeVO selectIndvdlpgeResultView(IndvdlPgeVO indvdlPgeVO) throws Exception {
		return indvdlPgeDAO.selectIndvdlpgeResultView(indvdlPgeVO);
	}

	/**
	 * 기 등록된 마이페이지 텝 정보의 카운트를 조회한다.
	 * @param indvdlPgeVO - 마이페이지 VO
	 * @return int
	 */
	public int selectIndvdlpgeResultTotCnt(IndvdlPgeVO indvdlPgeVO) throws Exception {
		return indvdlPgeDAO.selectIndvdlpgeResultTotCnt(indvdlPgeVO);
	}

	/**
	 * 기 등록된 마이페이지 정보를 조회한다.
	 * @param indvdlPgeVO - 마이페이지 VO
	 * @return indvdlPgeVO - 마이페이지 VO
	 */
	public List<IndvdlPgeVO> selectIndvdlpgeResultDetail(IndvdlPgeVO indvdlPgeVO) throws Exception {
		return indvdlPgeDAO.selectIndvdlpgeResultDetail(indvdlPgeVO);
	}

	/**
	 * 기 등록된 마이페이지 정보의 카운트를 조회한다.
	 * @param indvdlPgeVO - 마이페이지 VO
	 * @return int
	 */
	public int selectIndvdlpgeResultDetailTotCnt(IndvdlPgeVO indvdlPgeVO) throws Exception {
		return indvdlPgeDAO.selectIndvdlpgeResultDetailTotCnt(indvdlPgeVO);
	}


}