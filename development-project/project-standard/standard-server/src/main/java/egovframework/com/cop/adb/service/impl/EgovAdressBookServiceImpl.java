package egovframework.com.cop.adb.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.com.cop.adb.service.AdressBook;
import egovframework.com.cop.adb.service.AdressBookUser;
import egovframework.com.cop.adb.service.AdressBookUserVO;
import egovframework.com.cop.adb.service.AdressBookVO;
import egovframework.com.cop.adb.service.EgovAdressBookService;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

/**
 * 주소록정보를 관리하기 위한 서비스 구현  클래스
 * @author 공통컴포넌트팀 윤성록
 * @since 2009.09.25
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.9.25  윤성록          최초 생성
 *
 * </pre>
 */
@Service("EgovAdressBookService")
public class EgovAdressBookServiceImpl extends EgovAbstractServiceImpl implements EgovAdressBookService{

    
    @Resource(name = "AdressBookDAO")
    private AdressBookDAO adbkDAO;
    
    @Resource(name = "egovAdbkIdGnrService")
    private EgovIdGnrService idgenService;
    
    @Resource(name = "egovAdbkUserIdGnrService")
    private EgovIdGnrService idgenService2;
    
    /**
     * 주소록 목록을 조회한다.
     * @param AdressBookVO
     * @return  Map<String, Object>
     * @exception Exception
     */
    public Map<String, Object> selectAdressBookList(AdressBookVO adbkVO) throws Exception {
     
        List<AdressBookVO> result = adbkDAO.selectAdressBookList(adbkVO);

        int cnt = adbkDAO.selectAdressBookListCnt(adbkVO);

        Map<String, Object> map = new HashMap<String, Object>();

        map.put("resultList", result);
        map.put("resultCnt", Integer.toString(cnt));

        return map;    
    }    
    
    /**
     * 주소록 정보를 조회한다.
     * @param AdressBookVO
     * @return  AdressBookVO
     * @exception Exception
     */
    public AdressBookVO selectAdressBook(AdressBookVO adressBookVO)throws Exception {

       
        AdressBookVO adbkVO = adbkDAO.selectAdressBook(adressBookVO); 
        
        adbkVO.setAdbkMan(adbkDAO.selectUserList(adbkVO));
        return  adbkVO;        
    }    
    
    /**
     * 주소록 정보를 삭제한다.
     * @param AdressBook
     * @return 
     * @exception Exception
     */
    public void deleteAdressBook(AdressBook adressBook) throws Exception {        
        adbkDAO.updateAdressBook(adressBook);        
    }
    
    /**
     * 사용자 목록을 조회한다.
     * @param AdressBookUserVO
     * @return Map<String, Object>
     * @exception Exception
     */
    public Map<String, Object> selectManList(AdressBookUserVO adressBookUserVO) throws Exception{
      
        List<AdressBookUserVO> result = adbkDAO.selectManList(adressBookUserVO);
        int cnt = adbkDAO.selectManListCnt(adressBookUserVO);
        
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("resultList", result);
        map.put("resultCnt", Integer.toString(cnt));

        return map;
    }
    
    /**
     * 명함 목록을 조회한다.
     * @param AdressBookUserVO
     * @return Map<String, Object>
     * @exception Exception
     */
    public Map<String, Object> selectCardList(AdressBookUserVO adressBookUserVO) throws Exception {
     
        List<AdressBookUserVO> result = adbkDAO.selectCardList(adressBookUserVO);
        int cnt = adbkDAO.selectCardListCnt(adressBookUserVO);

        Map<String, Object> map = new HashMap<String, Object>();

        map.put("resultList", result);
        map.put("resultCnt", Integer.toString(cnt));

        return map;
    }    

    /**
     * 주소록 정보를 등록한다.
     * @param AdressBookVO
     * @return M
     * @exception Exception
     */
    public void insertAdressBook(AdressBookVO adbkVO) throws Exception {
           
        adbkVO.setAdbkId(idgenService.getNextStringId());
        adbkVO.setUseAt("Y");
           
        adbkDAO.insertAdressBook(adbkVO);       
        
        for(int i = 0; i < adbkVO.getAdbkMan().size(); i++){            
            adbkVO.getAdbkMan().get(i).setAdbkUserId(idgenService2.getNextStringId());
            adbkVO.getAdbkMan().get(i).setAdbkId(adbkVO.getAdbkId());
            adbkDAO.insertAdressBookUser(adbkVO.getAdbkMan().get(i));
        }        
    }   
    
    /**
     * 주소록 정보를 수정한다.
     * @param AdressBookVO
     * @return 
     * @exception Exception
     */
    public void updateAdressBook(AdressBookVO adbkVO) throws Exception {
           
        adbkDAO.updateAdressBook(adbkVO);
        
        List<AdressBookUser> temp = adbkDAO.selectUserList(adbkVO);
                 
        
        for(int i = 0; i < temp.size(); i++){
            if(temp.get(i).getEmplyrId() == null)
                temp.get(i).setEmplyrId("");
            
            if(temp.get(i).getNcrdId() == null)
                temp.get(i).setNcrdId("");            
        }
        
        for(int i = 0; i < adbkVO.getAdbkMan().size(); i++){
            if(adbkVO.getAdbkMan().get(i).getEmplyrId() == null)
                adbkVO.getAdbkMan().get(i).setEmplyrId("");
            
            if(adbkVO.getAdbkMan().get(i).getNcrdId() == null)
                adbkVO.getAdbkMan().get(i).setNcrdId("");            
        }
        
        
        for(int i = 0; i < adbkVO.getAdbkMan().size(); i++){
            
            boolean check = false;
            
            for(int j = 0; j < temp.size(); j++){
                if(adbkVO.getAdbkMan().get(i).getEmplyrId().equals(temp.get(j).getEmplyrId())  &&
                        adbkVO.getAdbkMan().get(i).getNcrdId().equals(temp.get(j).getNcrdId()) ) {
                    check = true;
                    break;
                }
            }
            if(!check){
                adbkVO.getAdbkMan().get(i).setAdbkUserId(idgenService2.getNextStringId());
                adbkVO.getAdbkMan().get(i).setAdbkId(adbkVO.getAdbkId());
                adbkDAO.insertAdressBookUser(adbkVO.getAdbkMan().get(i));
            }            
        }
            
        for(int i = 0; i < temp.size(); i++){
            
            boolean check = false;
            
            for(int j = 0; j <  adbkVO.getAdbkMan().size(); j++){
                if(temp.get(i).getEmplyrId().equals(adbkVO.getAdbkMan().get(j).getEmplyrId())  &&
                        temp.get(i).getNcrdId().equals(adbkVO.getAdbkMan().get(j).getNcrdId()) ) {
                    check = true;
                    break;
                }
            }
            if(!check){               
                adbkDAO.deleteAdressBookUser(temp.get(i));
            }            
        }             
    }

    /**
     * 주소록 구성원 정보를 불러온다.
     * @param String
     * @return 
     * @exception Exception
     */
    public AdressBookUser selectAdbkUser(String id)
            throws Exception {
        
        AdressBookUser adbkUser = new AdressBookUser();
        
        if(id.length() > 4 && id.substring(0,4).equals("NCRD") ){
            adbkUser = adbkDAO.selectCardUser(id);
        }else{
            adbkUser = adbkDAO.selectManUser(id);
        }
        
        return adbkUser;
    }
}
