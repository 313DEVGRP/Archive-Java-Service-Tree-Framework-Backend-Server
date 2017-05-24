package egovframework.com.cmm.web;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.SessionVO;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.FileVO;


/**
 * @Class Name : EgovImageProcessController.java
 * @Description : 
 * @Modification Information
 *
 *    수정일       수정자         수정내용
 *    -------        -------     -------------------
 *    2009. 4. 2.     이삼섭
 *    2011.08.31.     JJY        경량환경 템플릿 커스터마이징버전 생성
 *
 * @author 공통 서비스 개발팀 이삼섭
 * @since 2009. 4. 2.
 * @version
 * @see
 *
 */
@SuppressWarnings("serial")
@Controller
public class EgovImageProcessController extends HttpServlet {

    @Resource(name = "EgovFileMngService")
    private EgovFileMngService fileService;

    Logger log = Logger.getLogger(this.getClass());

    /**
     * 첨부된 이미지에 대한 미리보기 기능을 제공한다.
     * 
     * @param atchFileId
     * @param fileSn
     * @param sessionVO
     * @param model
     * @param response
     * @throws Exception
     */
    @RequestMapping("/cmm/fms/getImage.do")
    public void getImageInf(SessionVO sessionVO, ModelMap model, Map<String, Object> commandMap, HttpServletResponse response) throws Exception {

		//@RequestParam("atchFileId") String atchFileId,
		//@RequestParam("fileSn") String fileSn,
		String atchFileId = (String)commandMap.get("atchFileId");
		String fileSn = (String)commandMap.get("fileSn");
	
		FileVO vo = new FileVO();
	
		vo.setAtchFileId(atchFileId);
		vo.setFileSn(fileSn);
	
		FileVO fvo = fileService.selectFileInf(vo);
	
		//String fileLoaction = fvo.getFileStreCours() + fvo.getStreFileNm();
	
		File file = new File(fvo.getFileStreCours(), fvo.getStreFileNm());
		FileInputStream fis = null; new FileInputStream(file);
	
		BufferedInputStream in = null;
		ByteArrayOutputStream bStream = null;
		try{
			fis = new FileInputStream(file);
			in = new BufferedInputStream(fis);
			bStream = new ByteArrayOutputStream();
			int imgByte;
			while ((imgByte = in.read()) != -1) {
			    bStream.write(imgByte);
			}
			
			String type = "";
	
			if (fvo.getFileExtsn() != null && !"".equals(fvo.getFileExtsn())) {
			    if ("jpg".equals(fvo.getFileExtsn().toLowerCase())) {
				type = "image/jpeg"; //TODO 정말 이런걸까?
			    } else {
				type = "image/" + fvo.getFileExtsn().toLowerCase();
			    }
			    type = "image/" + fvo.getFileExtsn().toLowerCase();
	
			} else {
			    log.debug("Image fileType is null.");
			}
			
			response.setHeader("Content-Type", type);
			response.setContentLength(bStream.size());
			
			bStream.writeTo(response.getOutputStream());
			
			response.getOutputStream().flush();
			response.getOutputStream().close();
	
		    
		}catch(Exception e){
			log.debug(e);//e.printStackTrace();
		}finally{
			if (bStream != null) {
				try {
					bStream.close();
				} catch (Exception est) {
				    log.debug("IGNORED: " + est.getMessage());
				}
			}
			if (in != null) {
				try {
					in.close();
				} catch (Exception ei) {
				    log.debug("IGNORED: " + ei.getMessage());
				}
			}
			if (fis != null) {
				try {
					fis.close();
				} catch (Exception efis) {
				    log.debug("IGNORED: " + efis.getMessage());
				}
			}
		}
    }
}
