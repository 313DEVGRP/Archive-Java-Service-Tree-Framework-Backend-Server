package egovframework.com.sym.ccm.ccc.web;

import java.util.List;
import java.util.Map;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.sym.ccm.ccc.service.CmmnClCode;
import egovframework.com.sym.ccm.ccc.service.CmmnClCodeVO;
import egovframework.com.sym.ccm.ccc.service.EgovCcmCmmnClCodeManageService;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springmodules.validation.commons.DefaultBeanValidator;
/**
 *
 * 공통분류코드에 관한 요청을 받아 서비스 클래스로 요청을 전달하고 서비스클래스에서 처리한 결과를 웹 화면으로 전달을 위한 Controller를 정의한다
 * @author 공통서비스 개발팀 이중호
 * @since 2009.04.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.04.01  이중호          최초 생성
 *   2011.8.26	정진오			IncludedInfo annotation 추가
 *
 * </pre>
 */

@Controller
public class EgovCcmCmmnClCodeManageController {
	@Resource(name = "CmmnClCodeManageService")
    private EgovCcmCmmnClCodeManageService cmmnClCodeManageService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

	@Autowired
	private DefaultBeanValidator beanValidator;

	/**
	 * 공통분류코드를 삭제한다.
	 * @param loginVO
	 * @param cmmnClCode
	 * @param model
	 * @return "forward:/sym/ccm/ccc/EgovCcmCmmnClCodeList.do"
	 * @throws Exception
	 */
    @RequestMapping(value="/sym/ccm/ccc/EgovCcmCmmnClCodeRemove.do")
	public String deleteCmmnClCode (@ModelAttribute("loginVO") LoginVO loginVO
			, CmmnClCode cmmnClCode
			, ModelMap model
			) throws Exception {
    	 cmmnClCodeManageService.deleteCmmnClCode(cmmnClCode);
        return "forward:/sym/ccm/ccc/EgovCcmCmmnClCodeList.do";
	}

	/**
	 * 공통분류코드를 등록한다.
	 * @param loginVO
	 * @param cmmnClCode
	 * @param bindingResult
	 * @return "egovframework/com/sym/ccm/ccc/EgovCcmCmmnClCodeRegist"
	 * @throws Exception
	 */
    @RequestMapping(value="/sym/ccm/ccc/EgovCcmCmmnClCodeRegist.do")
	public String insertCmmnClCode (@ModelAttribute("loginVO") LoginVO loginVO
			, @ModelAttribute("cmmnClCode") CmmnClCode cmmnClCode
			, BindingResult bindingResult , ModelMap model
			) throws Exception {
    	if   (cmmnClCode.getClCode() == null
    		||cmmnClCode.getClCode().equals("")) {
    		return "egovframework/com/sym/ccm/ccc/EgovCcmCmmnClCodeRegist";
    	}

        beanValidator.validate(cmmnClCode, bindingResult);
		if (bindingResult.hasErrors()){
    		return "egovframework/com/sym/ccm/ccc/EgovCcmCmmnClCodeRegist";
		}

		if(cmmnClCode.getClCode() != null){
			CmmnClCode vo = cmmnClCodeManageService.selectCmmnClCodeDetail(cmmnClCode);
			if(vo != null){
				model.addAttribute("message", "이미 등록된 분류코드가 존재합니다.");
				return "egovframework/com/sym/ccm/ccc/EgovCcmCmmnClCodeRegist";
			}
		}

		cmmnClCode.setFrstRegisterId(loginVO.getUniqId());
		cmmnClCodeManageService.insertCmmnClCode(cmmnClCode);
		return "forward:/sym/ccm/ccc/EgovCcmCmmnClCodeList.do";
    }

	/**
	 * 공통분류코드 상세항목을 조회한다.
	 * @param loginVO
	 * @param cmmnClCode
	 * @param model
	 * @return "egovframework/com/sym/ccm/ccc/EgovCcmCmmnClCodeDetail"
	 * @throws Exception
	 */
	@RequestMapping(value="/sym/ccm/ccc/EgovCcmCmmnClCodeDetail.do")
 	public String selectCmmnClCodeDetail (@ModelAttribute("loginVO") LoginVO loginVO
 			, CmmnClCode cmmnClCode
 			, ModelMap model
 			) throws Exception {
		CmmnClCode vo = cmmnClCodeManageService.selectCmmnClCodeDetail(cmmnClCode);
		model.addAttribute("result", vo);

		return "egovframework/com/sym/ccm/ccc/EgovCcmCmmnClCodeDetail";
	}

    /**
	 * 공통분류코드 목록을 조회한다.
     * @param loginVO
     * @param searchVO
     * @param model
     * @return "egovframework/com/sym/ccm/ccc/EgovCcmCmmnClCodeList"
     * @throws Exception
     */
	@IncludedInfo(name="공통분류코드", listUrl="/sym/ccm/ccc/EgovCcmCmmnClCodeList.do", order = 960 ,gid = 60)
    @RequestMapping(value="/sym/ccm/ccc/EgovCcmCmmnClCodeList.do")
	public String selectCmmnClCodeList (@ModelAttribute("loginVO") LoginVO loginVO
			, @ModelAttribute("searchVO") CmmnClCodeVO searchVO
			, ModelMap model
			) throws Exception {
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

        List<?> CmmnCodeList = cmmnClCodeManageService.selectCmmnClCodeList(searchVO);
        model.addAttribute("resultList", CmmnCodeList);

        int totCnt = cmmnClCodeManageService.selectCmmnClCodeListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);

        return "egovframework/com/sym/ccm/ccc/EgovCcmCmmnClCodeList";
	}

	/**
	 * 공통분류코드를 수정한다.
	 * @param loginVO
	 * @param cmmnClCode
	 * @param bindingResult
	 * @param commandMap
	 * @param model
	 * @return "egovframework/com/sym/ccm/ccc/EgovCcmCmmnClCodeModify"
	 * @throws Exception
	 */
    @RequestMapping(value="/sym/ccm/ccc/EgovCcmCmmnClCodeModify.do")
	public String updateCmmnClCode (@ModelAttribute("loginVO") LoginVO loginVO
			, @ModelAttribute("administCode") CmmnClCode cmmnClCode
			, BindingResult bindingResult
			, @RequestParam Map<?, ?> commandMap
			, ModelMap model
			) throws Exception {
		String sCmd = commandMap.get("cmd") == null ? "" : (String)commandMap.get("cmd");
    	if (sCmd.equals("")) {
    		CmmnClCode vo = cmmnClCodeManageService.selectCmmnClCodeDetail(cmmnClCode);
    		model.addAttribute("cmmnClCode", vo);

    		return "egovframework/com/sym/ccm/ccc/EgovCcmCmmnClCodeModify";
    	} else if (sCmd.equals("Modify")) {
            beanValidator.validate(cmmnClCode, bindingResult);
    		if (bindingResult.hasErrors()){
        		CmmnClCode vo = cmmnClCodeManageService.selectCmmnClCodeDetail(cmmnClCode);
        		model.addAttribute("cmmnClCode", vo);

        		return "egovframework/com/sym/ccm/ccc/EgovCcmCmmnClCodeModify";
    		}
    		cmmnClCode.setLastUpdusrId(loginVO.getUniqId());
	    	cmmnClCodeManageService.updateCmmnClCode(cmmnClCode);
	        return "forward:/sym/ccm/ccc/EgovCcmCmmnClCodeList.do";
    	} else {
    		return "forward:/sym/ccm/ccc/EgovCcmCmmnClCodeList.do";
    	}
    }

}