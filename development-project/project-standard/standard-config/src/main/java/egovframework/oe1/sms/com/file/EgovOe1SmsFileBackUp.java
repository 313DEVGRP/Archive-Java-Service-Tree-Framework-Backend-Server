/*
 * Copyright 2010 MOPAS(Ministry of Public Administration and Security).
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
 */
package egovframework.oe1.sms.com.file;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.nio.channels.FileChannel;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

/**
 * 수정된 설정파일을 다른 이름으로 백업 하는 유틸 클래스
 * @author 운영환경개발팀
 * @since 2010.06.29
 * @version 1.0
 * @see <pre>
 * &lt;&lt; 개정이력(Modification Information) &gt;&gt;
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2010.06.29   운영환경개발팀                최초 생성
 * 
 * </pre>
 */

@Service("configBackUp")
public class EgovOe1SmsFileBackUp {

    Logger log = Logger.getLogger(this.getClass());
    /**
     * 설정 파일 백업
     * @param String
     *        , String
     * @return void
     * @exception Exception
     */
    public void copy(String source, String target) throws Exception {
        // 복사 대상이 되는 파일 생성
        // File sourceFile = new File( source ); //스트림,
        // 채널 선언
        // File targetFile = new File( target ); //스트림,
        // 채널 선언
        FileInputStream inputStream = null;
        FileOutputStream outputStream = null;
        FileChannel fcin = null;
        FileChannel fcout = null;
        try { // 스트림 생성
            inputStream = new FileInputStream(source);
            outputStream = new FileOutputStream(target); // 채널
                                                         // 생성
            fcin = inputStream.getChannel();
            fcout = outputStream.getChannel(); // 채널을
                                               // 통한
                                               // 스트림
                                               // 전송
            long size = fcin.size();
            fcin.transferTo(0, size, fcout);
        } catch (Exception e) {
            log.debug(e.getMessage());           
        } finally { // 자원 해제
            try { 
                fcout.close();
            }catch(Exception e){
                log.debug(e.getMessage());                
            }
            
            try { 
                fcin.close();
            }catch(Exception e){
                log.debug(e.getMessage());
            }
            
            try { 
                outputStream.close();
            }catch(Exception e){
                log.debug(e.getMessage());
            }
            
            try { 
                inputStream.close();
            }catch(Exception e){
                log.debug(e.getMessage());
            }
        }
    }
}
