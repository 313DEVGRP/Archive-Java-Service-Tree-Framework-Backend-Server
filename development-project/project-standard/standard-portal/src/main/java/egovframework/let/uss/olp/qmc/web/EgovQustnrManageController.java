package egovframework.let.uss.olp.qmc.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.let.uss.olp.qmc.service.EgovQustnrManageService;
import egovframework.let.uss.olp.qmc.service.QustnrManageVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
/**
 * 설문관리를 처리하는 Controller Class 구현
 * @author 공통서비스 장동한
 * @since 2009.03.20
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.03.20  장동한          최초 생성
 *   2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 * </pre>
 */ 
@Controller
public class EgovQustnrManageController {
	
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Autowired
	private DefaultBeanValidator beanValidator;
    
	/** EgovMessageSource */
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;
    
	@Resource(name = "egovQustnrManageService")
	private EgovQustnrManageService egovQustnrManageService;
	 
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
    
	@Resource(name="EgovCmmUseService")
	private EgovCmmUseService cmmUseService;
    
	/**
	 * 설문관리 팝업 목록을 조회한다. 
	 * @param searchVO
	 * @param commandMap
	 * @param qustnrManageVO
	 * @param model
	 * @return "/uss/olp/qmc/EgovQustnrManageListPopup"
	 * @throws Exception
	 */
	@RequestMapping(value="/uss/olp/qmc/EgovQustnrManageListPopup.do")
	public String EgovQustnrManageListPopup(
			@ModelAttribute("searchVO") ComDefaultVO searchVO, 
			Map commandMap, 
			QustnrManageVO qustnrManageVO,
    		ModelMap model)
    throws Exception {

		String sCmd = commandMap.get("cmd") == null ? "" : (String)commandMap.get("cmd");		
		if(sCmd.equals("del")){
			egovQustnrManageService.deleteQustnrManage(qustnrManageVO);
		}

    	/** EgovPropertyService.sample */
    	searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
    	searchVO.setPageSize(propertiesService.getInt("pageSize"));
    	
    	/** pageing */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
        model.addAttribute("resultList", egovQustnrManageService.selectQustnrManageList(searchVO));
        
        model.addAttribute("searchKeyword", commandMap.get("searchKeyword") == null ? "" : (String)commandMap.get("searchKeyword"));
        model.addAttribute("searchCondition", commandMap.get("searchCondition") == null ? "" : (String)commandMap.get("searchCondition"));
        
        int totCnt = (Integer)egovQustnrManageService.selectQustnrManageListCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
		
        
		return "/uss/olp/qmc/EgovQustnrManageListPopup"; 
	}
	
	/**
	 * 설문관리 목록을 조회한다. 
	 * @param searchVO
	 * @param commandMap
	 * @param qustnrManageVO
	 * @param model
	 * @return  "/uss/olp/qmc/EgovQustnrManageList"
	 * @throws Exception
	 */
	@RequestMapping(value="/uss/olp/qmc/EgovQustnrManageList.do")
	public String EgovQustnrManageList(
			@ModelAttribute("searchVO") ComDefaultVO searchVO, 
			Map commandMap, 
			QustnrManageVO qustnrManageVO,
    		ModelMap model)
    throws Exception {

		String sCmd = commandMap.get("cmd") == null ? "" : (String)commandMap.get("cmd");		
		if(sCmd.equals("del")){
			egovQustnrManageService.deleteQustnrManage(qustnrManageVO);
		}

    	/** EgovPropertyService.sample */
    	searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
    	searchVO.setPageSize(propertiesService.getInt("pageSize"));
    	
    	/** pageing */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
        model.addAttribute("resultList", egovQustnrManageService.selectQustnrManageList(searchVO));
        
        model.addAttribute("searchKeyword", commandMap.get("searchKeyword") == null ? "" : (String)commandMap.get("searchKeyword"));
        model.addAttribute("searchCondition", commandMap.get("searchCondition") == null ? "" : (String)commandMap.get("searchCondition"));
        
        int totCnt = (Integer)egovQustnrManageService.selectQustnrManageListCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
		
		return "/uss/olp/qmc/EgovQustnrManageList"; 
	}
	
	/**
	 * 설문관리 목록을 상세조회 조회한다. 
	 * @param searchVO
	 * @param qustnrManageVO
	 * @param commandMap
	 * @param model
	 * @return "/uss/olp/qmc/EgovQustnrManageDetail"; 
	 * @throws Exception
	 */
	@RequestMapping(value="/uss/olp/qmc/EgovQustnrManageDetail.do")
	public String EgovQustnrManageDetail(
			@ModelAttribute("searchVO") ComDefaultVO searchVO, 
			QustnrManageVO qustnrManageVO,
			Map commandMap,
    		ModelMap model)
    throws Exception {
		
		String sLocationUrl = "/uss/olp/qmc/EgovQustnrManageDetail";
		
		String sCmd = commandMap.get("cmd") == null ? "" : (String)commandMap.get("cmd");
		
		if(sCmd.equals("del")){
			egovQustnrManageService.deleteQustnrManage(qustnrManageVO);
			sLocationUrl = "redirect:/uss/olp/qmc/EgovQustnrManageList.do";
		}else{
			
	     	//공통코드  직업유형 조회
	    	ComDefaultCodeVO voComCode = new ComDefaultCodeVO(); 
	    	voComCode.setCodeId("COM034"); 
	    	model.addAttribute("comCode034", cmmUseService.selectCmmCodeDetail(voComCode));
	    	
	        model.addAttribute("resultList", egovQustnrManageService.selectQustnrManageDetail(qustnrManageVO));
		}
        
		return sLocationUrl; 	
	}
	
	/**
	 * 설문관리를 수정한다. 
	 * @param searchVO
	 * @param commandMap
	 * @param qustnrManageVO
	 * @param bindingResult
	 * @param model
	 * @return "/uss/olp/qmc/EgovQustnrManageModify"
	 * @throws Exception
	 */
	@RequestMapping(value="/uss/olp/qmc/EgovQustnrManageModify.do")
	public String QustnrManageModify(
			@ModelAttribute("searchVO") ComDefaultVO searchVO, 
			Map commandMap,
			QustnrManageVO qustnrManageVO,
			BindingResult bindingResult,
    		ModelMap model)
    throws Exception {
    	// 0. Spring Security 사용자권한 처리
    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "uat/uia/EgovLoginUsr";
    	}
    	
		//로그인 객체 선언
		LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		String sLocationUrl = "/uss/olp/qmc/EgovQustnrManageModify"; 

		String sCmd = commandMap.get("cmd") == null ? "" : (String)commandMap.get("cmd");
		
     	//공통코드  직업유형 조회
    	ComDefaultCodeVO voComCode = new ComDefaultCodeVO(); 
    	voComCode.setCodeId("COM034"); 
    	model.addAttribute("comCode034", cmmUseService.selectCmmCodeDetail(voComCode)); 
    	
        if(sCmd.equals("save")){
        	
            beanValidator.validate(qustnrManageVO, bindingResult);
    		if (bindingResult.hasErrors()){
    			
                model.addAttribute("resultList", egovQustnrManageService.selectQustnrManageDetail(qustnrManageVO));
                
            	//설문템플릿 정보 불러오기
                model.addAttribute("listQustnrTmplat", egovQustnrManageService.selectQustnrTmplatManageList(qustnrManageVO));
                
    			return sLocationUrl;
    		}
    		
    		//아이디 설정
    		qustnrManageVO.setFrstRegisterId((String)loginVO.getUniqId());
    		qustnrManageVO.setLastUpdusrId((String)loginVO.getUniqId());
    		
        	egovQustnrManageService.updateQustnrManage(qustnrManageVO);
        	sLocationUrl = "redirect:/uss/olp/qmc/EgovQustnrManageList.do"; 
        }else{
            model.addAttribute("resultList", egovQustnrManageService.selectQustnrManageDetail(qustnrManageVO));
            
            QustnrManageVO newQustnrManageVO =  egovQustnrManageService.selectQustnrManageDetailModel(qustnrManageVO);
            model.addAttribute("qustnrManageVO", newQustnrManageVO);
            
        	//설문템플릿 정보 불러오기
            model.addAttribute("listQustnrTmplat", egovQustnrManageService.selectQustnrTmplatManageList(qustnrManageVO));
        }

		return sLocationUrl; 	
	}
	
	/**
	 * 설문관리를 등록한다. 
	 * @param searchVO
	 * @param commandMap
	 * @param qustnrManageVO
	 * @param bindingResult
	 * @param model
	 * @return "/uss/olp/qmc/EgovQustnrManageRegist"
	 * @throws Exception
	 */
	@RequestMapping(value="/uss/olp/qmc/EgovQustnrManageRegist.do")
	public String QustnrManageRegist(
			@ModelAttribute("searchVO") ComDefaultVO searchVO, 
			Map commandMap,  
			@ModelAttribute("qustnrManageVO") QustnrManageVO qustnrManageVO, 
			BindingResult bindingResult,
    		ModelMap model)
    throws Exception {
    	// 0. Spring Security 사용자권한 처리
    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "uat/uia/EgovLoginUsr";
    	}
    	
		//로그인 객체 선언
		LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		String sLocationUrl = "/uss/olp/qmc/EgovQustnrManageRegist"; 
		
		String sCmd = commandMap.get("cmd") == null ? "" : (String)commandMap.get("cmd");
		log.info("cmd =>" + sCmd);

     	//공통코드  직업유형 조회
    	ComDefaultCodeVO voComCode = new ComDefaultCodeVO(); 
    	voComCode.setCodeId("COM034"); 
    	model.addAttribute("comCode034", cmmUseService.selectCmmCodeDetail(voComCode));
    	
        if(sCmd.equals("save")){

            beanValidator.validate(qustnrManageVO, bindingResult);
    		if (bindingResult.hasErrors()){
            	//설문템플릿 정보 불러오기
                model.addAttribute("listQustnrTmplat", egovQustnrManageService.selectQustnrTmplatManageList(qustnrManageVO));
    			return sLocationUrl;
    		}
        
    		//아이디 설정
    		qustnrManageVO.setFrstRegisterId((String)loginVO.getUniqId());
    		qustnrManageVO.setLastUpdusrId((String)loginVO.getUniqId());
    		
        	egovQustnrManageService.insertQustnrManage(qustnrManageVO);
        	sLocationUrl = "redirect:/uss/olp/qmc/EgovQustnrManageList.do"; 
        }else{    		
        	//설문템플릿 정보 불러오기
            model.addAttribute("listQustnrTmplat", egovQustnrManageService.selectQustnrTmplatManageList(qustnrManageVO));
         System.out.println("???:::"+(egovframework.rte.psl.dataaccess.util.EgovMap)(egovQustnrManageService.selectQustnrTmplatManageList(qustnrManageVO)).get(0));   
        }
        
		return sLocationUrl; 
	}
}


