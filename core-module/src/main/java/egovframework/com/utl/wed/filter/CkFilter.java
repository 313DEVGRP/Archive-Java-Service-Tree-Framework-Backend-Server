package egovframework.com.utl.wed.filter;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class CkFilter implements Filter {
    private static final Log log = LogFactory.getLog(CkFilter.class);

    private static final String IMAGE_BASE_DIR_KEY = "ck.image.dir";
    private static final String IMAGE_BASE_URL_KEY = "ck.image.url";
    private static final String IMAGE_ALLOW_TYPE_KEY = "ck.image.type.allow";
    private static final String IMAGE_SAVE_CLASS_KEY = "ck.image.save.class";

    private CkImageSaver ckImageSaver;

	public void init(FilterConfig filterConfig) throws ServletException {
		String properties = filterConfig.getInitParameter("properties");
		InputStream inStream = Thread.currentThread().getContextClassLoader()	.getResourceAsStream(properties);
		Properties props = new Properties();
		try {
			props.load(inStream);
		} catch (IOException e) {
            log.error(e);
		}

		String imageBaseDir = (String) props.get(IMAGE_BASE_DIR_KEY);
		String imageDomain = (String) props.get(IMAGE_BASE_URL_KEY);

		String[] allowFileTypeArr = null;
		String allowFileType = (String) props.get(IMAGE_ALLOW_TYPE_KEY);
		if (StringUtils.isNotBlank(allowFileType)) {
			allowFileTypeArr = StringUtils.split(allowFileType, ",");
		}

        String saveManagerClass = (String) props.get(IMAGE_SAVE_CLASS_KEY);

        ckImageSaver = new CkImageSaver(imageBaseDir, imageDomain, allowFileTypeArr, saveManagerClass);

	}

	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;

		if (request.getContentType() == null || request.getContentType().indexOf("multipart") == -1) {
			// contentType 이 multipart 가 아니라면 스킵한다.
			chain.doFilter(request, response);
		} else {
            ckImageSaver.saveAndReturnUrlToClient(request, response);

        }
	}

    public void destroy() {
    	// no-op
	}
}
