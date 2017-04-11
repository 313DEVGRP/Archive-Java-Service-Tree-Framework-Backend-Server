package egovframework.com.uss.mpe.web;
import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.uss.mpe.service.EgovIndvdlPgeService;
import egovframework.com.uss.mpe.service.IndvdlPge;
import egovframework.com.uss.mpe.service.IndvdlPgeCntntsVO;
import egovframework.com.uss.mpe.service.IndvdlPgeVO;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springmodules.validation.commons.DefaultBeanValidator;


/**
 * 개요
 * - 마이페이지에 대한 Controller 클래스를 정의한다.
 *
 * 상세내용
 * - 마이페이지 콘텐츠의 등록, 수정, 삭제, 조회, 반영확인 기능을 제공한다.
 * - 마이페이지 콘텐츠의 조회기능은 목록조회, 상세조회로 구분된다.
 * - 등록된 콘텐츠를 마이페이지에 추가, 삭제, 조회 기능을 제공한다.
 * @author 이창원
 * @version 1.0
 * @created 05-8-2009 오후 2:19:27
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일        수정자           수정내용
 *  ----------  ----------    ---------------------------
 *  2009.08.04  이창원          최초 생성
 *  2011.8.26	정진오			IncludedInfo annotation 추가
 *
 * Copyright (C) 2009 by MOPAS  All right reserved.
 * </pre>
 */

@Controller
public class EgovIndvdlPgeController {

	@Autowired
	private DefaultBeanValidator beanValidator;

	/** EgovMessageSource */
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    @Resource(name = "EgovIndvdlPgeService")
    private EgovIndvdlPgeService egovIndvdlPgeSVC;

    /** ID Generation */
	@Resource(name="egovIndvdlPgeIdGnrService")
	private EgovIdGnrService idgenService;


    //처리 후 이동 페이지 URL
    String sLocationUrl;

	/**
	 * 기 생성한 마이페이지 설정 정보를 수정한다.
	 * @param indvdlPgeVO - 마이페이지 VO
	 * @return String - 리턴 Url
	 *
	 * @param indvdlPgeVO
	 */
	public boolean updateIndvdlpgeConf(IndvdlPgeVO indvdlPgeVO){
		return egovIndvdlPgeSVC.updateIndvdlpgeConf(indvdlPgeVO);
	}

	/**
	 *  마이페이지 설정 정보를 추가한다.
	 * @param indvdlPgeVO - 마이페이지 VO
	 * @return String - 리턴 Url
	 *
	 * @param indvdlPgeVO
	 */
	public boolean insertIndvdlpgeConf(IndvdlPgeVO indvdlPgeVO) throws Exception{
		return egovIndvdlPgeSVC.insertIndvdlpgeConf(indvdlPgeVO);
	}

	/**
	 * 사용자가 마에페이지를 조회한다.
	 * @param indvdlPgeVO - 마이페이지 VO
	 * @return indvdlPgeVO - 마이페이지 VO
	 */
	@RequestMapping(value="/uss/mpe/selectIndvdlpgeResult.do")
	public String selectIndvdlpgeResult(@ModelAttribute("indvdlPgeVO") IndvdlPgeVO indvdlPgeVO,
			                             ModelMap model) throws Exception {

    	/** paging */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(indvdlPgeVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(indvdlPgeVO.getPageUnit());
		paginationInfo.setPageSize(indvdlPgeVO.getPageSize());

		indvdlPgeVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		indvdlPgeVO.setLastIndex(paginationInfo.getLastRecordIndex());
		indvdlPgeVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		indvdlPgeVO.setUserId(user.getId());

		IndvdlPgeVO indvdlpgeResultVO = egovIndvdlPgeSVC.selectIndvdlpgeResultView(indvdlPgeVO);

		// 마이페이지 상세목록설정
        model.addAttribute("indvdlPgeDetailList", egovIndvdlPgeSVC.selectIndvdlpgeResultDetail(indvdlPgeVO));

        // 마이페이지 상세목록 카운트 설정
        int totDetailCnt = egovIndvdlPgeSVC.selectIndvdlpgeResultDetailTotCnt(indvdlPgeVO);

        if(this.configurationProcessedYN(user.getId())==0){
        	sLocationUrl = this.nextLocationURL("view_conf");
        	model.addAttribute("message", "마이페이지 설정 후 마이페이지를 확인 가능합니다.");
        }else{
        model.addAttribute("indvdlPgeDetailListCount", totDetailCnt);

        // 기준개수별 사이즈를 구한다.
        int sideCnt = indvdlpgeResultVO.getSortCnt();
        int typeByCnt = (totDetailCnt % sideCnt) == 0 ? totDetailCnt / sideCnt : totDetailCnt / sideCnt + 1;
        indvdlpgeResultVO.setSortLineCnt(typeByCnt);

        // 마이페이지 기본정보 설정
	        model.addAttribute("indvdlpgeResult", indvdlpgeResultVO);
	        //model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
	        sLocationUrl = this.nextLocationURL("view_mypage");
        }
        return sLocationUrl;
	}

	/**
	 * 마이페이지를 신규 생성 혹은 설정정보를 수정하기 위해 설정 정보를 확인한다.
	 * @param indvdlPgeVO - 마이페이지 VO
	 * @return String - 리턴 Url
	 *
	 * @param indvdlPgeVO
	 */
	@RequestMapping(value="/uss/mpe/EgovIndvdlpgeConfRegist.do")
	public String selectIndvdlpgeResult(@ModelAttribute("indvdlPgeVO") IndvdlPgeVO indvdlPgeVO,
			@ModelAttribute("defaultVO") ComDefaultVO defaultVO,
			ModelMap model) throws Exception{
		//ID를 받아서 VO에 설정한다.
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		indvdlPgeVO.setUserId(user.getId());
		//기존 생성한 정보가 있을 경우 화면에 보여준다.
		model.addAttribute("indvdlConf", egovIndvdlPgeSVC.selectIndvdlpgeResultView(indvdlPgeVO));
		sLocationUrl = this.nextLocationURL("view_conf");

		return sLocationUrl;

	}

	/**
	 * 마이페이지설정 정보 존재 유무를 확인하여 수정 혹은 추가를 결정한다.
	 * @param indvdlPgeVO - 마이페이지 VO
	 * @return boolean - 설정 존재 유무
	 *
	 */
	@RequestMapping(value="/uss/mpe/EgovIndvdlpgeConfSave.do")
	public String checkIndvdlConf(@ModelAttribute("indvdlPgeVO") IndvdlPgeVO indvdlPgeVO,
			@ModelAttribute("defaultVO") ComDefaultVO defaultVO,
			BindingResult bindingResult, ModelMap model) throws Exception{

		beanValidator.validate(indvdlPgeVO, bindingResult);
		if (bindingResult.hasErrors()){
			sLocationUrl = this.nextLocationURL("error");
		}else{
			boolean jobResult=false;
			//ID를 받아서 VO에 설정한다.
			LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
			indvdlPgeVO.setUserId(user.getId());
			// 기존에 설정한 정보가 있는지 확인한다.
			int cnt = egovIndvdlPgeSVC.selectIndvdlpgeResultCnt(indvdlPgeVO);
			//기존 설정 정보 존재시 수정 메서드를 호출하고 비존재 시 추가 메서드를 호출한다.
			if(cnt<1) jobResult = this.insertIndvdlpgeConf(indvdlPgeVO);
			else jobResult = this.updateIndvdlpgeConf(indvdlPgeVO);
			//디비 작업 성공여부에 따라 메세지 설정 및 이동 페이지를 결정한다.
			if(jobResult){
				model.addAttribute("message", egovMessageSource.getMessage("success.request.msg"));
				//sLocationUrl = new StringBuffer("forward:").append(this.nextLocationURL("view_conf_save")).toString();
				sLocationUrl = new StringBuffer("forward:").append(this.nextLocationURL("view_mypage_action")).toString();
			}else{
				model.addAttribute("message", egovMessageSource.getMessage("fail.request.msg"));
				sLocationUrl = this.nextLocationURL("error");
			}
		}
		return sLocationUrl;
	}

	/**
	 * 기 등록된 마이페이지 컨텐츠정보를 삭제한다.
	 * @param indvdlPge - 마이페이지 model
	 * @return String - 리턴 Url
	 *
	 * @param indvdlPge
	 */
	@RequestMapping(value="/uss/mpe/EgovIndvdlpgeCntntsDel.do")
	public String deleteIndvdlpgeCntnts(@ModelAttribute("indvdlPge") IndvdlPge indvdlPge,
			 ModelMap model)throws Exception{
		//디비 작업 성공여부에 따라 메세지 설정 및 이동 페이지를 결정한다.
		if(egovIndvdlPgeSVC.deleteIndvdlpgeCntnts(indvdlPge)){
			model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
			model.addAttribute("cntnts_model", indvdlPge);
			sLocationUrl = new StringBuffer("forward:").append(this.nextLocationURL("search_cntnts_action")).toString();
		}else{
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
			sLocationUrl = this.nextLocationURL("error");
		}

		return sLocationUrl;
	}

	/**
	 * 기 등록된 마이페이지 컨텐츠정보를 DB에서 완전 삭제한다.
	 * @param indvdlPge - 마이페이지 model
	 * @return String - 리턴 Url
	 *
	 * @param indvdlPge
	 */
	@RequestMapping(value="/uss/mpe/EgovIndvdlpgeCntntsDelDB.do")
	public String deleteIndvdlpgeCntntsDB(@ModelAttribute("indvdlPge") IndvdlPge indvdlPge,
			@ModelAttribute("defaultVO") ComDefaultVO defaultVO,
			ModelMap model)throws Exception{
		//디비 작업 성공여부에 따라 메세지 설정 및 이동 페이지를 결정한다.
		if(egovIndvdlPgeSVC.deleteIndvdlpgeCntntsDB(indvdlPge)){
			model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
			sLocationUrl = new StringBuffer("forward:").append(this.nextLocationURL("search_cntnts_action")).toString();

		}else{
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
			sLocationUrl = this.nextLocationURL("error");
		}

		return sLocationUrl;//+"?pageIndex="+indvdlPge.getPageIndex();
	}

    /**
	 * 마이페이지 컨텐츠정보 등록 화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/uss/mpe/EgovIndvdlpgeCntntsRegistView.do")
    public String insertIndvdlpgeCntntsView()
            throws Exception {
        return "egovframework/com/uss/mpe/EgovIndvdlpgeCntntsRegist";
    }

	/**
	 * 마이페이지 컨텐츠정보를 신규로 등록한다.
	 * @param indvdlPge - 마이페이지 model
	 * @param BindingResult bindingResult
	 * @param ModelMap model
	 * @return String - 리턴 Url
	 * @throws Exception
	 * @param indvdlPge
	 */
	@RequestMapping(value="/uss/mpe/EgovIndvdlpgeCntntsRegist.do")
	public String insertIndvdlpgeCntnts(@ModelAttribute("IndvdlPgeManage") IndvdlPge indvdlPge,
			@ModelAttribute("defaultVO") ComDefaultVO defaultVO,
			BindingResult bindingResult, ModelMap model) throws Exception{
		//validation 수행
		beanValidator.validate(indvdlPge, bindingResult);
		if (bindingResult.hasErrors()){
			sLocationUrl = this.nextLocationURL("error");
		}else{
			//컨텐츠를 신규 등록 시 ID Generation 기능을 이용해 디비에서 ID값을 받아온다.
			indvdlPge.setCntntsId(idgenService.getNextStringId());
			//디비 작업 성공여부에 따라 메세지 설정 및 이동 페이지를 결정한다.
			if(egovIndvdlPgeSVC.insertIndvdlpgeCntnts(indvdlPge)){
				model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
				model.addAttribute("cntnts_model", indvdlPge);
				//sLocationUrl = this.nextLocationURL("insert_cntnts");
				sLocationUrl = new StringBuffer("forward:").append(this.nextLocationURL("search_cntnts_action")).toString();
			}else{
				model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
				sLocationUrl = this.nextLocationURL("error");
			}
		}

		return sLocationUrl;
	}

	/**
	 * 등록된 마이페이지 컨텐츠의 상세정보를 조회한다.
	 * @param indvdlPgeCntntsVO - 마이페이지 콘텐츠 Vo
	 * @return String - 리턴 Url
	 *
	 * @param indvdlPgeVO
	 */
	@RequestMapping(value="/uss/mpe/EgovIndvdlpgeCntntsDetail.do")
	public String selectIndvdlpgeCntnts(@ModelAttribute("indvdlPge") IndvdlPge indvdlPge,
			@ModelAttribute("defaultVO") ComDefaultVO defaultVO,
			ModelMap model) throws Exception{
				model.addAttribute("cntnts_model", egovIndvdlPgeSVC.selectIndvdlpgeCntnts(indvdlPge));
				sLocationUrl = this.nextLocationURL("view_cntnts");
		return sLocationUrl;
	}

	/**
	 * 마이페이지 컨텐츠를 관리하기 위해 등록된 마이페이지 컨텐츠 목록을 조회한다.
	 * @param indvdlPgeCntntsVO - 마이페이지 콘텐츠 Vo
	 * @return String - 리턴 Url
	 *
	 * @param indvdlPgeVO
	 */
	@IncludedInfo(name="마이페이지관리", order = 480 ,gid = 50)
	@RequestMapping(value="/uss/mpe/EgovIndvdlpgeCntntsList.do")
	public String selectIndvdlpgeCntntsList(@ModelAttribute("indvdlPgeVO") IndvdlPgeCntntsVO indvdlPgeCntntsVO,
			ModelMap model) throws Exception {

    	/** pageing */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(indvdlPgeCntntsVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(indvdlPgeCntntsVO.getPageUnit());
		paginationInfo.setPageSize(indvdlPgeCntntsVO.getPageSize());
		indvdlPgeCntntsVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		indvdlPgeCntntsVO.setLastIndex(paginationInfo.getLastRecordIndex());
		indvdlPgeCntntsVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		// 컨텐츠 목록을 조회한다.
		indvdlPgeCntntsVO.setIndvdlPgeList(egovIndvdlPgeSVC.selectIndvdlpgeCntntsList(indvdlPgeCntntsVO));
		model.addAttribute("indvdlCntntsList", indvdlPgeCntntsVO.getIndvdlPgeList());
        // 컨텐츠의 개수를 조회한다.
        int totCnt = egovIndvdlPgeSVC.selectIndvdlpgeCntntsTotCnt(indvdlPgeCntntsVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        model.addAttribute("searchcondition",indvdlPgeCntntsVO.getSearchCondition());
        //model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

        sLocationUrl = this.nextLocationURL("search_cntnts");
        return sLocationUrl;
	}

	/**
	 * 기 등록된 마이페이지 컨텐츠정보를 수정한다.
	 * @param indvdlPge - 마이페이지 model
	 * @return String - 리턴 Url
	 *
	 * @param indvdlPge
	 */
	@RequestMapping(value="/uss/mpe/EgovIndvdlpgeCntntsForUpdt.do", method=RequestMethod.POST)
	public String updateIndvdlpgeCntnts(@ModelAttribute("indvdlPge") IndvdlPge indvdlPge,
			@ModelAttribute("defaultVO") ComDefaultVO defaultVO,
			ModelMap model) throws Exception{
				model.addAttribute("cntnts_model", egovIndvdlPgeSVC.selectIndvdlpgeCntnts(indvdlPge));
				sLocationUrl = this.nextLocationURL("update_cntnts");
		return sLocationUrl;
	}

	@RequestMapping(value="/uss/mpe/EgovIndvdlpgeCntntsUpdt.do", method=RequestMethod.POST)
	public String updateIndvdlpgeCntnts(@ModelAttribute("indvdlPge") IndvdlPge indvdlPge,
			@ModelAttribute("defaultVO") ComDefaultVO defaultVO,
			BindingResult bindingResult, ModelMap model) throws Exception{
		beanValidator.validate(indvdlPge, bindingResult);
		if (bindingResult.hasErrors()){
			sLocationUrl = this.nextLocationURL("error");
		}else{
		//디비 작업 성공여부에 따라 메세지 설정 및 이동 페이지를 결정한다.
				if(egovIndvdlPgeSVC.updateIndvdlpgeCntnts(indvdlPge)){
					model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));
					model.addAttribute("cntnts_model", indvdlPge);
					//sLocationUrl = this.nextLocationURL("update_cntnts");
					sLocationUrl = new StringBuffer("forward:").append(this.nextLocationURL("search_cntnts_action")).toString();
				}else{
					model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
					sLocationUrl = this.nextLocationURL("error");
				}
		}
		return sLocationUrl;
	}

	/**
	 * 마이페이지에 컨텐츠를 추가 위해 등록된 마이페이지 컨텐츠 목록을 조회한다.
	 * @param indvdlPgeCntntsVO - 마이페이지 콘텐츠 Vo
	 * @return String - 리턴 Url
	 *
	 * @param indvdlPgeVO
	 */
	@RequestMapping(value="/uss/mpe/EgovIndvdlpgeAddCntntsList.do")
	public String addIndvdlpgeCntntsList(@ModelAttribute("indvdlPgeVO") IndvdlPgeCntntsVO indvdlPgeCntntsVO,
			ModelMap model) throws Exception {
		//ID를 받아서 VO에 설정한다.
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		indvdlPgeCntntsVO.setUserId(user.getId());

    	/** paging */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(indvdlPgeCntntsVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(indvdlPgeCntntsVO.getPageUnit());
		paginationInfo.setPageSize(indvdlPgeCntntsVO.getPageSize());

		indvdlPgeCntntsVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		indvdlPgeCntntsVO.setLastIndex(paginationInfo.getLastRecordIndex());
		indvdlPgeCntntsVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		// 사용자가 마이페이지에 컨텐츠를 추가하기 위해 등록되어 있는 마이페이지 목록을 조회한다.
		indvdlPgeCntntsVO.setIndvdlPgeList(egovIndvdlPgeSVC.addIndvdlpgeCntntsList(indvdlPgeCntntsVO));
        model.addAttribute("indvdlCntntsList", indvdlPgeCntntsVO.getIndvdlPgeList());
        // 목록의 페이징을 위해 등록되어 있는 마이페이지 개수를 조회한다.
        int totCnt = egovIndvdlPgeSVC.selectIndvdlpgeAddCntntsTotCnt(indvdlPgeCntntsVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

        sLocationUrl = this.nextLocationURL("add_list_mypage");
        return sLocationUrl;
	}

	/**
	 * 마이페이지에  컨텐츠를 바로 추가한다.
	 * @param indvdlPge - 마이페이지 model
	 * @param BindingResult bindingResult
	 * @param ModelMap model
	 * @return String - 리턴 Url
	 * @throws Exception
	 * @param indvdlPge
	 */
	@RequestMapping(value="/uss/mpe/EgovIndvdlpgeAddCntnts.do")
	public String addIndvdlpgeCntnts(@ModelAttribute("indvdlPgeCntntsVO") IndvdlPgeCntntsVO indvdlPgeCntntsVO,
			@ModelAttribute("defaultVO") ComDefaultVO defaultVO,
			ModelMap model) throws Exception{
		//ID를 받아서 VO에 설정한다.
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		indvdlPgeCntntsVO.setUserId(user.getId());

        if(this.configurationProcessedYN(user.getId())==0){
        	sLocationUrl = this.nextLocationURL("view_conf");
        	model.addAttribute("message", "마이페이지 환경 설정부터 하셔야 합니다.");
        }else{
		//디비 작업 성공여부에 따라 메세지 설정 및 이동 페이지를 결정한다.
			if(egovIndvdlPgeSVC.addIndvdlpgeCntnts(indvdlPgeCntntsVO)){
				model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
				model.addAttribute("cntnts_model", indvdlPgeCntntsVO);
				sLocationUrl = new StringBuffer("forward:").append(this.nextLocationURL("add_mypage")).toString();
			}else{
				model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
				sLocationUrl = this.nextLocationURL("error");
			}
        }
		return sLocationUrl;
	}

	/**
	 * 마이페이지에서  컨텐츠를 바로 삭제한다.
	 * @param indvdlPge - 마이페이지 model
	 * @param BindingResult bindingResult
	 * @param ModelMap model
	 * @return String - 리턴 Url
	 * @throws Exception
	 * @param indvdlPge
	 */
	@RequestMapping(value="/uss/mpe/EgovIndvdlpgeDelCntnts.do")
	public String deleteIndvdlpgeCntnts(@ModelAttribute("indvdlPgeCntntsVO") IndvdlPgeCntntsVO indvdlPgeCntntsVO,
			@ModelAttribute("defaultVO") ComDefaultVO defaultVO,
			ModelMap model) throws Exception{
		//ID를 받아서 VO에 설정한다.
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		indvdlPgeCntntsVO.setUserId(user.getId());
		//디비 작업 성공여부에 따라 메세지 설정 및 이동 페이지를 결정한다.
			if(egovIndvdlPgeSVC.delIndvdlpgeCntnts(indvdlPgeCntntsVO)){
				model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
				model.addAttribute("cntnts_model", indvdlPgeCntntsVO);
				sLocationUrl = new StringBuffer("forward:").append(this.nextLocationURL("view_mypage_action")).toString();
			}else{
				model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
				sLocationUrl = this.nextLocationURL("error");
			}

		return sLocationUrl;
	}

	/**
	 * 마이페이지 설정 정보 존재 유무를 체크한다.
	 * @param user_id - 사용자 아이디
	 * @param cnt - 환경설정 값 존재 카운트
	 */
	public int configurationProcessedYN(String user_id){
	    IndvdlPgeVO indvdlPgeVO = new IndvdlPgeVO();
	    indvdlPgeVO.setUserId(user_id);
		int cnt = egovIndvdlPgeSVC.selectIndvdlpgeResultCnt(indvdlPgeVO);
		return cnt;
	}

	/**
	 * 마이페이지 컨텐츠의 미리보기를 위한 jsp URL을 리턴한다.
	 * @param indvdlPgeCntntsVO - 마이페이지 VO
	 * @param ModelMap model
	 * @return String - 리턴 Url
	 * @throws Exception
	 */
	@RequestMapping(value="/uss/mpe/indvdlCntntsPreview.do")
	public String indvdlCntntsPreview(@ModelAttribute("indvdlPgeCntntsVO") IndvdlPgeCntntsVO indvdlPgeCntntsVO,
			@ModelAttribute("defaultVO") ComDefaultVO defaultVO,
			ModelMap model) throws Exception{
		model.addAttribute("linkto", indvdlPgeCntntsVO.getCntcUrl());
		return "egovframework/com/uss/mpe/EgovIndvdlpgeTmp";
	}

	/**
	 * 기능처리 후 이동할 페이지 URL을 지정한다.
	 * @param cmd - 이동할 화면을 판별할 구분자 명
	 * @return String - 리턴 Url
	 */
	public String nextLocationURL(String cmd){
		if(cmd.equals("insert_cntnts")) sLocationUrl = "egovframework/com/uss/mpe/EgovIndvdlpgeCntntsUpdt";//관리자가 마이페이지에 추가 가능한 컨텐츠를 등록한다.
		else if(cmd.equals("update_cntnts")) sLocationUrl = "egovframework/com/uss/mpe/EgovIndvdlpgeCntntsUpdt";//관리자가 등록된 컨텐츠의 정보를 수정한다.
		else if(cmd.equals("search_cntnts_action")) sLocationUrl = "/uss/mpe/EgovIndvdlpgeCntntsList.do";//관리자가 등록된 컨텐츠를 조회한다(ACTION).
		else if(cmd.equals("search_cntnts")) sLocationUrl = "egovframework/com/uss/mpe/EgovIndvdlpgeCntntsList";//관리자가 등록된 컨텐츠를 조회한다(URL).
		else if(cmd.equals("view_cntnts")) sLocationUrl = "egovframework/com/uss/mpe/EgovIndvdlpgeCntntsDetail";//관리자가 등록된 컨텐츠를 상세조회한다.
		else if(cmd.equals("view_conf")) sLocationUrl = "egovframework/com/uss/mpe/EgovIndvdlpgeConfRegist";//사용자가 마이페이지 구성을 위한 설정을 조회한다.
		else if(cmd.equals("view_conf_save")) sLocationUrl = "egovframework/com/uss/mpe/EgovIndvdlpgeConfRegist.do";//사용자가 마이페이지 구성을 위한 설정 정보를 수정/등록한다.
		else if(cmd.equals("view_mypage_action")) sLocationUrl = "/uss/mpe/selectIndvdlpgeResult.do";//사용자가 마이페이지를 조회한다(ACTION).
		else if(cmd.equals("view_mypage")) sLocationUrl = "egovframework/com/uss/mpe/EgovIndvdlpgeDetail";//사용자가 마이페이지를 조회한다.
		else if(cmd.equals("add_list_mypage")) sLocationUrl = "egovframework/com/uss/mpe/EgovIndvdlpgeList";//사용자가 마이페이지에 컨텐츠를 추가하기 위해 추가 가능한 컨텐츠 목록을 조회한다.
		else if (cmd.equals("add_mypage"))
			sLocationUrl = "/uss/mpe/EgovIndvdlpgeAddCntntsList.do";//사용자가 마이페이지에 컨텐츠를 추가한다.
		else sLocationUrl = "egovframework/com/cmm/egovError";//에러 혹은 잘못된 명령 실행시 페이지 이동
		return sLocationUrl;
	}

}