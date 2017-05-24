package egovframework.let.sym.mnu.mcm.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.let.sym.mnu.mcm.service.MenuCreatVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

/**
 * 메뉴생성, 사이트맵 생성에 대한 DAO 클래스를 정의한다. * 
 * @author 공통컴포넌트 개발팀 서준식
 * @since 2011.06.30
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2011.06.30  서 준 식   최초 생성(MenuManageDAO 클래스로 부터 분리
 *   					   메소드들을 MenuManageDAO 클래스에서 분리해옮)
 *   2011.08.31  JJY       경량환경 템플릿 커스터마이징버전 생성 
 * </pre>
 */

@Repository("menuCreateManageDAO")
public class MenuCreateManageDAO extends EgovAbstractDAO{
	
	
	
	/**
	 * ID 존재여부를 조회
	 * @param vo MenuManageVO 
	 * @return int 
	 * @exception Exception
	 */
	public int selectUsrByPk(ComDefaultVO vo) throws Exception{
		return (Integer)selectByPk("menuManageDAO.selectUsrByPk", vo);  
	}
	
	/**
	 * ID에 대한 권한코드를 조회
	 * @param vo MenuCreatVO
	 * @return int 	 
	 * @exception Exception
	 */
	public MenuCreatVO selectAuthorByUsr(ComDefaultVO vo) throws Exception{
		return (MenuCreatVO)getSqlMapClientTemplate().queryForObject("menuManageDAO.selectAuthorByUsr", vo);
	}
	
	/**
	 * 메뉴생성관리 내역을 조회
	 * @param vo ComDefaultVO 
	 * @return List
	 * @exception Exception
	 */
	@SuppressWarnings("unchecked")
	public List selectMenuCreatManagList(ComDefaultVO vo) throws Exception{
		return list("menuManageDAO.selectMenuCreatManageList_D", vo);
	}
	
	/**
	 * 메뉴생성관리 총건수를 조회한다.
	 * @param vo ComDefaultVO 
	 * @return int 
	 * @exception Exception
	 */
    public int selectMenuCreatManagTotCnt(ComDefaultVO vo) {
        return (Integer)getSqlMapClientTemplate().queryForObject("menuManageDAO.selectMenuCreatManageTotCnt_S", vo);
    }
    
    /*********** 메뉴 생성 관리 ***************/
	/**
	 * 메뉴생성 내역을 조회
	 * @param vo MenuCreatVO
	 * @return List 
	 * @exception Exception
	 */
	@SuppressWarnings("unchecked")
	public List selectMenuCreatList(MenuCreatVO vo) throws Exception{
		return list("menuManageDAO.selectMenuCreatList_D", vo);
	}
	
	/**
	 * 메뉴생성내역 등록
	 * @param vo MenuCreatVO
	 * @exception Exception
	 */
	public void insertMenuCreat(MenuCreatVO vo){
		insert("menuManageDAO.insertMenuCreat_S", vo);
	}
	

	/**
	 * 메뉴생성내역 존재여부 조회한다.
	 * @param vo MenuCreatVO
	 * @return int 
	 * @exception Exception
	 */
    public int selectMenuCreatCnt(MenuCreatVO vo) {
        return (Integer)getSqlMapClientTemplate().queryForObject("menuManageDAO.selectMenuCreatCnt_S", vo);
    }

    
	/**
	 * 메뉴생성내역 수정
	 * @param vo MenuCreatVO
	 * @exception Exception
	 */
	public void updateMenuCreat(MenuCreatVO vo){
		update("menuManageDAO.updateMenuCreat_S", vo);
	}

	/**
	 * 메뉴생성내역 삭제
	 * @param vo MenuCreatVO
	 * @exception Exception
	 */
	public void deleteMenuCreat(MenuCreatVO vo){
		delete("menuManageDAO.deleteMenuCreat_S", vo);
	}
	

}
