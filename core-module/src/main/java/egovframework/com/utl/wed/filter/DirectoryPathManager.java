package egovframework.com.utl.wed.filter;

import java.io.File;
import java.util.Calendar;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;

import com.sun.star.auth.InvalidArgumentException;

public class DirectoryPathManager {
	public enum DIR_DATE_TYPE {
		DATE_POLICY_YYYY_MM_DD, DATE_POLICY_YYYY_MM, DATE_POLICY_YYYY
	};

	public static String getDirectoryPathByDateType(DIR_DATE_TYPE policy) {

		Calendar calendar = Calendar.getInstance();
		StringBuffer sb = new StringBuffer();
		sb.append(calendar.get(Calendar.YEAR)).append(File.separator);
		if (policy.ordinal() <= DIR_DATE_TYPE.DATE_POLICY_YYYY_MM.ordinal()) {
			sb.append(StringUtils.leftPad(String.valueOf(calendar.get(Calendar.MONTH)), 2, '0')).append(File.separator);
		}
		if (policy.ordinal() <= DIR_DATE_TYPE.DATE_POLICY_YYYY_MM_DD.ordinal()) {
			sb.append(StringUtils.leftPad(String.valueOf(calendar.get(Calendar.DATE)), 2, '0')).append(File.separator);
		}

		return sb.toString();
	}

	public static File getUniqueFile(final File file) {
		if (!file.exists())
			return file;

		File tmpFile = new File(file.getAbsolutePath());
		File parentDir = tmpFile.getParentFile();
		int count = 1;
		String extension = FilenameUtils.getExtension(tmpFile.getName());
		String baseName = FilenameUtils.getBaseName(tmpFile.getName());
		do {
			tmpFile = new File(parentDir, baseName + "_" + count++ + "_." + extension);
		} while (tmpFile.exists());
		return tmpFile;
	}

}
