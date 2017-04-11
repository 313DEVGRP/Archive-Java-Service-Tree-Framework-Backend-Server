package egovframework.com.cop.adb.service.impl;

import java.util.List;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.cop.adb.service.AdressBook;
import egovframework.com.cop.adb.service.AdressBookUser;
import egovframework.com.cop.adb.service.AdressBookUserVO;
import egovframework.com.cop.adb.service.AdressBookVO;

import org.springframework.stereotype.Repository;


/**
 * @Class Name : AdressBookDAO.java
 * @Description : 주소록을 관리하는 서비스를 정의하기위한 데이터 접근 클래스
 * @Modification Information
 *
 *    수정일       수정자         수정내용
 *    -------        -------     -------------------
 *    2009. 9. 25.     윤성록
 *
 * @author 공통 컴포넌트 개발팀 윤성록
 * @since 2009. 9. 25.
 * @version
 * @see
 *
 */
@SuppressWarnings("unchecked")
@Repository("AdressBookDAO")
public class AdressBookDAO extends EgovComAbstractDAO{
    
    /**
     * 주어진 조건에 따른 주소록목록을 불러온다.
     * 
     * @param AdressBookVO
     * @return
     * @throws Exception
     */
	public List<AdressBookVO> selectAdressBookList(AdressBookVO adbkVO) throws Exception {
        return (List<AdressBookVO>) list("AdressBookDAO.selectAdressBookList", adbkVO);
    }
    
    /**
     * 주어진 조건에 따라 주소록에 추가할 사용자목록을 불러온다.
     * 
     * @param AdressBookUserVO
     * @return
     * @throws Exception
     */
    public List<AdressBookUserVO> selectManList(AdressBookUserVO adbkUserVO) throws Exception {
        return (List<AdressBookUserVO>) list("AdressBookDAO.selectManList", adbkUserVO);
    }
    
    /**
     * 주어진 조건에 따라 주소록에 추가할 명함목록을 불러온다.
     * 
     * @param AdressBookUserVO
     * @return
     * @throws Exception
     */
    public List<AdressBookUserVO> selectCardList(AdressBookUserVO adbkUserVO) throws Exception {
        return (List<AdressBookUserVO>) list("AdressBookDAO.selectCardList", adbkUserVO);
    }
    
    /**
     * 주어진 조건에 따라 주소록에 기등록된 구성원의 목록을 불러온다.
     * 
     * @param AdressBookVO
     * @return
     * @throws Exception
     */
    public List<AdressBookUser> selectUserList(AdressBookVO adbkVO) throws Exception {
        return (List<AdressBookUser>) list("AdressBookDAO.selectUserList", adbkVO);
    }  

    /**
     * 주어진 조건에 맞는 주소록을 불러온다.
     * 
     * @param AdressBookVO
     * @return
     * @throws Exception
     */
    public AdressBookVO selectAdressBook(AdressBookVO adbkVO) throws Exception {
        return (AdressBookVO)select("AdressBookDAO.selectAdressBook", adbkVO);
    }        
    
    /**
     * 주소록 정보를 등록한다.
     * 
     * @param AdressBook
     * @throws Exception
     */
    public void insertAdressBook(AdressBook adressBook) throws Exception {
        insert("AdressBookDAO.insertAdressBook", adressBook);
    }
    
    /**
     * 주소록을 구성하는 구성원을 등록한다.
     * 
     * @param AdressBookUser
     * @throws Exception
     */
    public void insertAdressBookUser(AdressBookUser adressBookUser) throws Exception {
        insert("AdressBookDAO.insertAdressBookUser", adressBookUser);
    }

    /**
     * 주소록 정보를 수정한다.
     * 
     * @param AdressBook
     * @throws Exception
     */
    public void updateAdressBook(AdressBook adressBook) throws Exception {
        update("AdressBookDAO.updateAdressBook", adressBook);
    }
    
    /**
     * 주소록 구성원을 삭제한다.
     * 
     * @param AdressBookUser
     * @throws Exception
     */
    public void deleteAdressBookUser(AdressBookUser adbkUser) throws Exception {
        delete("AdressBookDAO.deleteAdressBookUser", adbkUser);
    }    
    
    /**
     * 주소록 목록에 대한 전체 건수를 조회한다.
     * 
     * @param AdressBookUser
     * @throws Exception
     */
    public int selectAdressBookListCnt(AdressBookVO adbkVO) throws Exception {
        return (Integer)select("AdressBookDAO.selectAdressBookListCnt", adbkVO);
    }
    
    /**
     * 사용자 목록에 대한 전체 건수를 조회한다.
     * 
     * @param AdressBookUser
     * @throws Exception
     */
    public int selectManListCnt(AdressBookUserVO adbkUserVO) throws Exception {
        return (Integer)select("AdressBookDAO.selectManListCnt", adbkUserVO);
    }
    
    /**
     * 명함 목록에 대한 전체 건수를 조회한다.
     * 
     * @param AdressBookUser
     * @throws Exception
     */
    public int selectCardListCnt(AdressBookUserVO adbkUserVO) throws Exception {
        return (Integer)select("AdressBookDAO.selectCardListCnt", adbkUserVO);
    }
    
    /**
     * 주소록을 구성할 사용자의 정보를 조회한다.
     * 
     * @param AdressBookUser
     * @throws Exception
     */
    public AdressBookUser selectManUser(String id) throws Exception {
        return (AdressBookUser)select("AdressBookDAO.selectManUser", id);
    }
    
    /**
     * 주소록을 구성할 명함의 정보를 조회한다.
     * 
     * @param AdressBookUser
     * @throws Exception
     */
    public AdressBookUser selectCardUser(String id) throws Exception {
        return (AdressBookUser)select("AdressBookDAO.selectCardUser", id);
    }

}

