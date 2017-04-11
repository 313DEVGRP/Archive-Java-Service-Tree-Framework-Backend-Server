package egovframework.com.uss.cmt.web;

import java.util.List;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.uss.cmt.service.CmtDefaultVO;
import egovframework.com.uss.cmt.service.CmtManageVO;
import egovframework.com.uss.cmt.service.EgovCmtManageService;
import egovframework.com.utl.fcc.service.EgovDateUtil;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springmodules.validation.commons.DefaultBeanValidator;

/**
 * 업무사용자관련 요청을  비지니스 클래스로 전달하고 처리된결과를  해당
 * 웹 화면으로 전달하는  Controller를 정의한다
 * @author 표준프레임워크 개발팀
 * @since 2014.08.29
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2014.08.29  개발팀          최초 생성
 *
 * </pre>
 */

@Controller
public class EgovCmtManageController {

	/** cmtManageService */
	@Resource(name = "cmtManageService")
	private EgovCmtManageService cmtManageService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** DefaultBeanValidator beanValidator */
	@Autowired
	private DefaultBeanValidator beanValidator;

	/** egovCmtManageIdGnrService */
	@Resource(name = "egovCmtManageIdGnrService")
	private EgovIdGnrService idgenService;

	private LoginVO user;

	/**
	 * 출근 정보를 등록한다.
	 * @param cmtManageVO 사용자등록정보
	 * @param bindingResult 입력값검증용 bindingResult
	 * @param model 화면모델
	 * @return forward:/uss/cmt/EgovCmtMange.do
	 * @throws Exception
	 */
	@RequestMapping(value = "/uss/cmt/EgovCmtWrkStartInsert.do")
	public String insertWrkStartCmtInfo(@ModelAttribute("cmtManageVO") CmtManageVO cmtManageVO, BindingResult bindingResult, Model model) throws Exception {

		user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		// login data
		if (user.getUniqId() != null)
			cmtManageVO.setEmplyrId(user.getUniqId());
		if (user.getOrgnztId() != null)
			cmtManageVO.setOrgnztId(user.getOrgnztId());
		cmtManageVO.setWrktDt(EgovDateUtil.getToday());

		cmtManageService.insertWrkStartCmtInfo(cmtManageVO);

		return "forward:/uss/cmt/EgovCmtManageList.do";
	}

	/**
	 * 퇴근 정보를 등록한다.
	 * @param cmtManageVO 사용자등록정보
	 * @param bindingResult 입력값검증용 bindingResult
	 * @param model 화면모델
	 * @return forward:/uss/cmt/EgovCmtMange.do
	 * @throws Exception
	 */
	@RequestMapping(value = "/uss/cmt/EgovCmtWrkEndInsert.do")
	public String insertWrkEndCmtInfo(@ModelAttribute("cmtManageVO") CmtManageVO cmtManageVO, BindingResult bindingResult, Model model) throws Exception {
		//사용자정보
		user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		if (user.getUniqId() != null)
			cmtManageVO.setEmplyrId(user.getUniqId());
		if (user.getOrgnztId() != null)
			cmtManageVO.setOrgnztId(user.getOrgnztId());

		cmtManageVO.setWrktDt(EgovDateUtil.getToday());

		cmtManageService.insertWrkEndCmtInfo(cmtManageVO);

		return "forward:/uss/cmt/EgovCmtManageList.do";
	}

	/**
	 * 출퇴근목록을 조회한다. (paging)
	 * @param userSearchVO 검색조건정보
	 * @param model 화면모델
	 * @return cmm/uss/umt/EgovCmtManageList
	 * @throws Exception
	 */
	@IncludedInfo(name = "출퇴근관리", order = 950, gid = 50)
	@RequestMapping(value = "/uss/cmt/EgovCmtManageList.do")
	public String selectUserCmtList(@ModelAttribute("cmtSearchVO") CmtDefaultVO cmtSearchVO, ModelMap model) throws Exception {

		List<?> cmtManageList = cmtManageService.selectCmtInfoList(cmtSearchVO);
		model.addAttribute("resultList", cmtManageList);

		return "egovframework/com/uss/cmt/EgovCmtManageList";
	}

}
