package egovframework.com.ext.jstree.strutsiBatis.core.service;

import egovframework.com.ext.jstree.strutsiBatis.core.dto.P_ComprehensiveTree;
import egovframework.com.ext.jstree.strutsiBatis.core.vo.T_ComprehensiveTree;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import java.lang.reflect.InvocationTargetException;

/**
 * Modification Information
 *
 * @author 이동민
 * @version 1.0
 * @see <pre>
 *
 * Class Name 	: Util_SwapNode.java
 * Description 	: bean과 bean의 데이터를 복사하는 메소드들의 집합 클래스
 * Infomation	:
 *
 * P_ComprehensiveTree 와 T_ComprehensiveTree는 거의 동일한 형태의 dto(Data transfer object), vo (Value Object) 이다
 * 비슷하지만 따로 나눈것은 parameter 와 signature 의 차이를 명확히 하기 위해 선언하였다.
 * P_ComprehensiveTree는 parameter 즉, dto로서 데이터가 포함된 객체를  한 시스템에서 다른 시스템으로 전달하는 작업을 처리하는 객체로 레이어간의 통신용도로 사용된다.
 * T_ComprehensiveTree는 signature 즉, vo로서 특정한 비지니스 값이 담겨있는 객체이다.
 * 즉 메소드 입장에서 넘겨주는값은 parameter 넘겨받은 값은 signature라고 할수있다.
 * vo 와 dto 의 차이점은 vo는 read only이다.
 *
 * 위와 같은 이유로 기능을 동작함에 있어서 두개의 bean이 바뀌는 경우가 발생되어 생긴 utill 클래스
 *
 *  << 개정이력(Modification Information) >>
 *
 *  수정일         수정자             수정내용
 *  -------      ------------   -----------------------
 *  2014.07.25    Dongmin.Lee      최초 생성
 *
 *  Copyright (C) 2007 by 313 DeveloperGroup  All right reserved.
 * </pre>
 * @since 2014.07.25
 */
public class Util_SwapNode {

    static Logger logger = Logger.getLogger(Util_SwapNode.class);

    /**
     * bean을 복사하는 메소드
     *
     * @param T_ComprehensiveTree(originNode)
     * @return P_ComprehensiveTree(destNode)
     */
    public static P_ComprehensiveTree swapTtoP(T_ComprehensiveTree originNode) {

        P_ComprehensiveTree destNode = new P_ComprehensiveTree();

        try {
            BeanUtils.copyProperties(destNode, originNode);
        } catch (IllegalAccessException e) {
            logger.error(e);
        } catch (InvocationTargetException e) {
            logger.error(e);
        }

        return destNode;
    }

    /**
     * bean을 복사하는 메소드
     *
     * @param P_ComprehensiveTree(originNode)
     * @return T_ComprehensiveTree(destNode)
     */
    public static T_ComprehensiveTree swapPtoT(P_ComprehensiveTree originNode) {

        T_ComprehensiveTree destNode = new T_ComprehensiveTree();

        try {
            BeanUtils.copyProperties(destNode, originNode);
        } catch (IllegalAccessException e) {
            logger.error(e);
        } catch (InvocationTargetException e) {
            logger.error(e);
        }

        return destNode;
    }

    /**
     * bean을 복사하는 메소드
     *
     * @param T_ComprehensiveTree(originNode)
     * @return T_ComprehensiveTree(destNode)
     */
    public static T_ComprehensiveTree copyTtoT(T_ComprehensiveTree originNode, T_ComprehensiveTree destNode) {

        try {
            BeanUtils.copyProperties(destNode, originNode);
        } catch (IllegalAccessException e) {
            logger.error(e);
        } catch (InvocationTargetException e) {
            logger.error(e);
        }

        return destNode;
    }

}