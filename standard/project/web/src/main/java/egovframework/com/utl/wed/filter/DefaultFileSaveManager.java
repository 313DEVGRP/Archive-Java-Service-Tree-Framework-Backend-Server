/*
 * CKEditor image upload module for Java.
 * Copyright guavatak (https://github.com/guavatak/ckeditor-upload-filter-java)
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
 * @author guavatak (https://github.com/guavatak/ckeditor-upload-filter-java)
 */
package egovframework.com.utl.wed.filter;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

import java.io.File;
import java.io.IOException;

public class DefaultFileSaveManager implements FileSaveManager {

	static Logger logger = Logger.getLogger(DefaultFileSaveManager.class);

	@Override
	public String saveFile(FileItem fileItem, String imageBaseDir, String imageDomain) {
		String originalFileName = FilenameUtils.getName(fileItem.getName());
		String relUrl;
		// filename
		String subDir = File.separator + DirectoryPathManager.getDirectoryPathByDateType(DirectoryPathManager.DIR_DATE_TYPE.DATE_POLICY_YYYY_MM);
		String fileName = RandomStringUtils.randomAlphanumeric(20) + "." + StringUtils.lowerCase(StringUtils.substringAfterLast(originalFileName, "."));

		File newFile = new File(imageBaseDir + subDir + fileName);
		File fileToSave = DirectoryPathManager.getUniqueFile(newFile.getAbsoluteFile());

		try {
			FileUtils.writeByteArrayToFile(fileToSave, fileItem.get());
		} catch (IOException e) {
			logger.error(e);
		}

		String savedFileName = FilenameUtils.getName(fileToSave.getAbsolutePath());
		relUrl = StringUtils.replace(subDir, "\\", "/") + savedFileName;

		return imageDomain + relUrl;
	}
}
