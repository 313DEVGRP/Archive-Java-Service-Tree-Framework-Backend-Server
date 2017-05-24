package egovframework.let.sym.ccm.zip.service.impl;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;

import egovframework.let.sym.ccm.zip.service.Zip;
import egovframework.rte.fdl.excel.EgovExcelMapping;
import egovframework.rte.fdl.excel.util.EgovExcelUtil;

/**
 * 
 * Excel 우편번호 매핑 클래스
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
 *
 * </pre>
 */
public class EgovCcmExcelZipMapping extends EgovExcelMapping {

	/**
	 * 우편번호 엑셀파일 맵핑
	 */
	@SuppressWarnings("deprecation")
	@Override
	public Object mappingColumn(HSSFRow row) {
		HSSFCell cell0 = row.getCell((short) 0);
    	HSSFCell cell1 = row.getCell((short) 1);
    	HSSFCell cell2 = row.getCell((short) 2);
    	HSSFCell cell3 = row.getCell((short) 3);
    	HSSFCell cell4 = row.getCell((short) 4);
    	HSSFCell cell5 = row.getCell((short) 5);
    	HSSFCell cell6 = row.getCell((short) 6);
    	HSSFCell cell7 = row.getCell((short) 7);

		Zip vo = new Zip();

		vo.setZip            (EgovExcelUtil.getValue(cell0));
		vo.setSn             (Integer.parseInt(EgovExcelUtil.getValue(cell1)));
		vo.setCtprvnNm       (EgovExcelUtil.getValue(cell2));
		vo.setSignguNm       (EgovExcelUtil.getValue(cell3));
		vo.setEmdNm          (EgovExcelUtil.getValue(cell4));
		vo.setFrstRegisterId (EgovExcelUtil.getValue(cell7));

		if (cell5 != null) {vo.setLiBuldNm   (EgovExcelUtil.getValue(cell5));}
		if (cell6 != null) {vo.setLnbrDongHo (EgovExcelUtil.getValue(cell6));}
		
		
		return vo;
	}
}
