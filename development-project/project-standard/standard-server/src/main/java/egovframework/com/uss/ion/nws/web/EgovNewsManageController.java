package egovframework.com.uss.ion.nws.web;

import java.util.List;
import java.util.Map;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.uss.ion.nws.service.EgovNewsManageService;
import egovframework.com.uss.ion.nws.service.NewsManageDefaultVO;
import egovframework.com.uss.ion.nws.service.NewsManageVO;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springmodules.validation.commons.DefaultBeanValidator;


 /**
  *
  * 뉴스정보를 처리하는 Controller 클래스
  * @author 공통서비스 개발팀 박정규
  * @since 2009.04.01
  * @version 1.0
  * @see
  *
  * <pre>
  * << 개정이력(Modification Information) >>
  *
  *   수정일      수정자           수정내용
  *  -------    --------    ---------------------------
  *   2009.04.01  박정규          최초 생성
  *    2011.8.26	정진오			IncludedInfo annotation 추가
  *
  * </pre>
  */

@Controller
public class EgovNewsManageController {

    @Resource(name = "NewsManageService")
    private EgovNewsManageService newsManageService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

	// 첨부파일 관련
	@Resource(name="EgovFileMngService")
	private EgovFileMngService fileMngService;

	@Resource(name="EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;

	/** EgovMessageSource */
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    // Validation 관련
	@Autowired
	private DefaultBeanValidator beanValidator;


    /**
     * 개별 배포시 메인메뉴를 조회한다.
     * @param model
     * @return	"/uss/ion/nws/"
     * @throws Exception
     */
    @RequestMapping(value="/uss/ion/nws/EgovMain.do")
    public String egovMain(ModelMap model) throws Exception {
    	return "egovframework/com/uss/ion/nws/EgovMain";
    }

    /**
     * 메뉴를 조회한다.
     * @param model
     * @return	"/uss/ion/nws/EgovLeft"
     * @throws Exception
     */
    @RequestMapping(value="/uss/ion/nws/EgovLeft.do")
    public String egovLeft(ModelMap model) throws Exception {
    	return "egovframework/com/uss/ion/nws/EgovLeft";
    }

    /**
     * 뉴스정보 목록을 조회한다.
     * @param searchVO
     * @param model
     * @return	"/uss/ion/nws/EgovNewsInfoListInqire"
     * @throws Exception
     */
    @IncludedInfo(name="뉴스관리",order = 670 ,gid = 50)
    @RequestMapping(value="/uss/ion/nws/NewsInfoListInqire.do")
    public String selectNewsList(@ModelAttribute("searchVO") NewsManageDefaultVO searchVO, ModelMap model) throws Exception {

    	/** EgovPropertyService.SiteList */
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

        List<?> NewsList = newsManageService.selectNewsList(searchVO);
        model.addAttribute("resultList", NewsList);

        int totCnt = newsManageService.selectNewsListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);

        return "egovframework/com/uss/ion/nws/EgovNewsInfoListInqire";
    }

    /**
     * 뉴스정보 목록에 대한 상세정보를 조회한다.
     * @param newsManageVO
     * @param searchVO
     * @param model
     * @return	"/uss/ion/nws/EgovNewsInfoDetailInqire"
     * @throws Exception
     */
    @RequestMapping("/uss/ion/nws/NewsInfoDetailInqire.do")
    public String	selectNewsDetail(NewsManageVO newsManageVO,
            @ModelAttribute("searchVO") NewsManageDefaultVO searchVO,
            ModelMap model) throws Exception {

		NewsManageVO vo = newsManageService.selectNewsDetail(newsManageVO);

		model.addAttribute("result", vo);

        return	"egovframework/com/uss/ion/nws/EgovNewsInfoDetailInqire";
    }

    /**
     * 뉴스정보를 등록 전 단계처리
     * @param searchVO
     * @param model
     * @return	"/uss/ion/nws/EgovNewsInfoRegist"
     * @throws Exception
     */
    @RequestMapping("/uss/ion/nws/NewsInfoRegistView.do")
    public String insertNewsInfoView(
            @ModelAttribute("searchVO") NewsManageDefaultVO searchVO, Model model)
            throws Exception {

        model.addAttribute("newsManageVO", new NewsManageVO());

        return "egovframework/com/uss/ion/nws/EgovNewsInfoRegist";

    }

    /**
     * 뉴스정보를 등록한다.
     * @param multiRequest
     * @param searchVO
     * @param newsManageVO
     * @param bindingResult
     * @return	"forward:/uss/ion/nws/NewsInfoListInqire.do"
     * @throws Exception
     */
    @RequestMapping("/uss/ion/nws/NewsInfoRegist.do")
    public String insertNewsInfo(
    		final MultipartHttpServletRequest multiRequest,		// 첨부파일을 위한...
            @ModelAttribute("searchVO") NewsManageDefaultVO searchVO,
            @ModelAttribute("newsManageVO") NewsManageVO newsManageVO,
            BindingResult bindingResult)
            throws Exception {


    	// 첨부파일 관련 첨부파일ID 생성
		List<FileVO> _result = null;
		String _atchFileId = "";

		final Map<String, MultipartFile> files = multiRequest.getFileMap();

		if(!files.isEmpty()){
		 _result = fileUtil.parseFileInf(files, "NEWS_", 0, "", "");
		 _atchFileId = fileMngService.insertFileInfs(_result);  //파일이 생성되고나면 생성된 첨부파일 ID를 리턴한다.
		}

    	// 리턴받은 첨부파일ID를 셋팅한다..
		newsManageVO.setAtchFileId(_atchFileId);			// 첨부파일 ID

    	beanValidator.validate(newsManageVO, bindingResult);

		if(bindingResult.hasErrors()){

			return "egovframework/com/uss/olh/wor/EgovNewsInfoRegist";

		}

    	// 로그인VO에서  사용자 정보 가져오기
    	LoginVO	loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

    	String	frstRegisterId = loginVO.getUniqId();

    	newsManageVO.setFrstRegisterId(frstRegisterId);		// 최초등록자ID
    	newsManageVO.setLastUpdusrId(frstRegisterId);    	// 최종수정자ID

        newsManageService.insertNewsInfo(newsManageVO);

        return "forward:/uss/ion/nws/NewsInfoListInqire.do";
    }

    /**
     * 뉴스정보를 수정하기 전 단계처리
     * @param newsId
     * @param searchVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/uss/ion/nws/NewsInfoUpdtView.do")
    public String updateNewsInfoView(@RequestParam("newsId") String newsId ,
            @ModelAttribute("searchVO") NewsManageDefaultVO searchVO, ModelMap model)
            throws Exception {


        NewsManageVO newsManageVO = new NewsManageVO();

        // Primary Key 값 세팅
        newsManageVO.setNewsId(newsId);

        // 변수명은 CoC 에 따라
        model.addAttribute(selectNewsDetail(newsManageVO, searchVO, model));

        // 변수명은 CoC 에 따라 JSTL사용을 위해
        model.addAttribute("newsManageVO", newsManageService.selectNewsDetail(newsManageVO));


        return "egovframework/com/uss/ion/nws/EgovNewsInfoUpdt";
    }

    /**
     * 뉴스정보를 수정 처리한다
     * @param atchFileAt
     * @param multiRequest
     * @param searchVO
     * @param newsManageVO
     * @param bindingResult
     * @param model
     * @return	"forward:/uss/ion/nws/NewsInfoListInqire.do"
     * @throws Exception
     */
    @RequestMapping("/uss/ion/nws/NewsInfoUpdt.do")
    public String updateNewsInfo(@RequestParam("atchFileAt") String atchFileAt ,
    		final MultipartHttpServletRequest multiRequest,
            @ModelAttribute("searchVO") NewsManageDefaultVO searchVO,
            @ModelAttribute("newsManageVO") NewsManageVO newsManageVO,
            BindingResult bindingResult,
            ModelMap model)
            throws Exception {

    	// Validation
    	beanValidator.validate(newsManageVO, bindingResult);

		if(bindingResult.hasErrors()){

			return "egovframework/com/uss/olh/wor/EgovNewsInfoUpdt";

		}


    	// 첨부파일 관련 ID 생성 start....
		String _atchFileId = newsManageVO.getAtchFileId();

		final Map<String, MultipartFile> files = multiRequest.getFileMap();

		if(!files.isEmpty()){

			if("N".equals(atchFileAt)){
				List<FileVO> _result = fileUtil.parseFileInf(files, "NEWS_", 0, _atchFileId, "");
				_atchFileId = fileMngService.insertFileInfs(_result);

				// 첨부파일 ID 셋팅
				newsManageVO.setAtchFileId(_atchFileId);    	// 첨부파일 ID

			}else{
				FileVO fvo = new FileVO();
				fvo.setAtchFileId(_atchFileId);
				int _cnt = fileMngService.getMaxFileSN(fvo);
				List<FileVO> _result = fileUtil.parseFileInf(files, "NEWS_", _cnt, _atchFileId, "");
				fileMngService.updateFileInfs(_result);
			}
		}
		// 첨부파일 관련 ID 생성 end...


    	// 로그인VO에서  사용자 정보 가져오기
    	LoginVO	loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

    	String	lastUpdusrId = loginVO.getUniqId();

    	newsManageVO.setLastUpdusrId(lastUpdusrId);    	// 최종수정자ID

    	newsManageService.updateNewsInfo(newsManageVO);

        return "forward:/uss/ion/nws/NewsInfoListInqire.do";

    }

    /**
     * 뉴스정보를 삭제한다.
     * @param newsManageVO
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping("/uss/ion/nws/NewsInfoDelete.do")
    public String deleteNewsInfo(
            NewsManageVO newsManageVO,
            @ModelAttribute("searchVO") NewsManageDefaultVO searchVO)
            throws Exception {

    	newsManageService.deleteNewsInfo(newsManageVO);

        return "forward:/uss/ion/nws/NewsInfoListInqire.do";
    }

}
