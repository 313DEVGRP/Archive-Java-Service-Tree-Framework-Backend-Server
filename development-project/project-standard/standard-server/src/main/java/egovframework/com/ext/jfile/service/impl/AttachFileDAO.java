/*
 * eGovFrame JFile
 * Copyright The eGovFrame Open Community (http://open.egovframe.go.kr)).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * @author 정호열 커미터(표준프레임워크 오픈커뮤니티 리더)
 */
package egovframework.com.ext.jfile.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.ext.jfile.service.JFileDetails;

import org.springframework.stereotype.Repository;
import org.springframework.util.CollectionUtils;

/**
 *  클래스
 * @author 정호열
 * @since 2010.10.17
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일        수정자       수정내용
 *  -------       --------    ---------------------------
 *   2010.10.17   정호열       최초 생성
 *   2013.12.19	표준프레임워크	공통컴포넌트 추가 적용 (패키지 변경)
 *
 * </pre>
 */
@Repository
public class AttachFileDAO extends EgovComAbstractDAO {

	/**
	 * 첨부파일 정보를 저장한다.
	 * @param fileId 파일 아이디.
	 * @param fileName 파일 명.
	 * @param fileSize 파일 사이즈.
	 * @param maskingFileName 마스킹 파일명.
	 * @param expireDate 폐기 일자.
	 * @param limitCount 첨부파일 제한 갯수.
	 */
	public void addAttachFile(JFileDetails fileVo) {
		insert("AttachFileDAO.addAttachFile", fileVo);
	}

	/**
	 * 파일아이디와 파일 시퀀스로 첨부 파일 정보를 조회한다.
	 * @param fileId 파일 아이디.
	 * @param fileSeq 파일 시퀀스.
	 * @return JFileVO 첨부파일 정보.
	 */

	@SuppressWarnings({ "serial" })
	public JFileVO selectAttachFile(final String fileId, final String fileSeq) {
		return (JFileVO) select("AttachFileDAO.getAttachFileToMap", new HashMap<String, Object>(){{
			put("fileId", fileId);
			put("fileSeq", fileSeq);
		}});
	}

	/**
	 * 파일아이디로 첨부파일 정보를 조회한다.
	 * @param fileId 파일 아이디.
	 * @return List<JFileVO> 첨부파일 목록 정보.
	 */
	@SuppressWarnings({ "unchecked", "serial"})
	public List<JFileDetails> selectAttachFiles(final String fileId) {
		return (List<JFileDetails>) list("AttachFileDAO.getAttachFileToMap", new HashMap<String, Object>(){{
			put("fileId", fileId);
		}});
	}

	/**
	 * 파일아이디로 삭제여부 컬럼을 변경한다.
	 * @param fileId 파일 아이디.
	 * @param deleteYn 삭제 여부.
	 */
	@SuppressWarnings({ "serial" })
	public void updateAttachFileDeleteYnByFileId(final String fileId, final String deleteYn) {
		update("AttachFileDAO.updateAttachFileDeleteYnByFileId", new HashMap<String, Object>(){{
			put("fileId", fileId);
			put("deleteYn", deleteYn);
		}});
	}

	/**
	 * 파일 아이디로 파일 다운로드시 다운로드 건수를 변경한다.
	 * @param fileId 파일 아이디.
	 */
	@SuppressWarnings({ "serial" })
	public void updateAttachFileDownloadCount(final String fileId) {
		update("AttachFileDAO.updateAttachFileDownloadCount", new HashMap<String, Object>(){{
			put("fileId", fileId);
		}});
	}

	/**
	 * 파일 아이디와 파일 시퀀스로 다운로드 건수를 변경한다.
	 * @param fileId 파일 아이디.
	 * @param fileSeq 파일 시퀀스.
	 */
	@SuppressWarnings({ "serial" })
	public void updateAttachFileDownloadCount(final String fileId, final String fileSeq) {
		update("AttachFileDAO.updateAttachFileDownloadCount", new HashMap<String, Object>(){{
			put("fileId", fileId);
			put("fileSeq", fileSeq);
		}});
	}

	/**
	 * 파일 아이디와 파일 시퀀스로 첨부파일 정보를 삭제한다.
	 * @param fileId 파일 아이디.
	 * @param fileSeqs 파일 시퀀스 목록.
	 */
	@SuppressWarnings({"serial" })
	public void removeAttachFile(final String fileId, final List<Object> fileSeqs) {
		if(fileSeqs != null) {
			for(Object o : fileSeqs) {
				System.out.println("fileSeq : "+o);
			}
		}
		delete("AttachFileDAO.removeAttachFile", new HashMap<String, Object>(){{
			put("fileId", fileId);
			put("fileSeqs", fileSeqs);
		}});
	}

	/**
	 * 파일 아이디로 파일 시퀀스 목록을 조회한다.
	 * @param fileId 파일아이디.
	 * @return Object[] 파일 시퀀스 목록.
	 */
	public Object[] getAttachFileSeqs(String fileId) {
		@SuppressWarnings("unchecked")
		List<Object> list = (List<Object>) list("AttachFileDAO.getAttachFileSeqs", fileId);
		return list != null ? list.toArray() : null;
	}

	/**
	 * 파일 아이디와 파일 시퀀스로 파일삭제여부를 변경한다.
	 * @param fileId 파일 아이디.
	 * @param fileSeqs 파일 시퀀스 목록.
	 * @param deleteYn 파일 삭제 여부.
	 */
	@SuppressWarnings({"serial" })
	public void updateAttachFileDeleteYn(final String fileId, final Object[] fileSeqs, final String deleteYn) {
		if(fileId == null || fileSeqs == null)
			return;
		update("AttachFileDAO.updateAttachFileDeleteYn", new HashMap<String, Object>(){{
			put("fileId", fileId);
			put("fileSeqs", CollectionUtils.arrayToList(fileSeqs));
			put("deleteYn", deleteYn);
		}});
	}

	/**
	 * 파일 아이디와 파일 시퀀스 목록으로 첨부파일 목록이 존재하는 지 여부를 조회한다.
	 * @param fileId 파일 아이디.
	 * @param fileSeqs 파일 시퀀스 목록.
	 * @return isExistingAttachFileInfo 파일목록 존재 여부.
	 */
	@SuppressWarnings({"serial"})
	public boolean isExistingAttachFileInfo(final String fileId, final List<Object> fileSeqs) {
		Map<String, Object> paramMap = new HashMap<String, Object>(){{
			put("fileId", fileId);
			put("fileSeqs", fileSeqs);
		}};
		return list("AttachFileDAO.isExistingAttachFileInfo", paramMap).size() != 0;
	}

	/**
	 * 파일 아이디와 파일 시퀀스로 다운로드한 건수를 변경한다.
	 * @param fileId 파일 아이디.
	 * @param fileSeq 파일 시퀀스.
	 */
	@SuppressWarnings({"serial"})
	public void updateAttachFileDownloadCountBySequence(final String fileId, final String fileSeq) {
		update("AttachFileDAO.updateAttachFileDownloadCountBySequence", new HashMap<String ,Object>(){{
			put("fileId", fileId);
			put("fileSeq", fileSeq);
		}});
	}

	/**
	 * 파일아이디로 다운로드 한 건수를 변경한다.
	 * @param fileId 파일아이디.
	 */
	public void updateAttachFileDownloadCountByFileId(String fileId) {
		update("AttachFileDAO.updateAttachFileDownloadCountByFileId", fileId);
	}
}
