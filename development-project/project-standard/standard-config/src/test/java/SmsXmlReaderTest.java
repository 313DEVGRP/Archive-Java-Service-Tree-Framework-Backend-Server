import static org.junit.Assert.assertNotNull;

import java.util.List;

import javax.annotation.Resource;

import org.jdom.Document;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import egovframework.oe1.sms.com.file.EgovOe1SmsConfigReader;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:egovframework/spring/context-*" })
@TransactionConfiguration(transactionManager = "txManager", defaultRollback = false)
@Transactional
public class SmsXmlReaderTest {
	
	
	@Resource(name = "configReader")
	EgovOe1SmsConfigReader readerService;
	

    @Test
    public void testReader() throws Exception {
    	
    	Document jdoc = null;
    	jdoc = readerService.readConfigFile("cache");
        
       assertNotNull(jdoc);
        
    }

}
