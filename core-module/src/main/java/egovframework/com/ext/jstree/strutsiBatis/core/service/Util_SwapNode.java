package egovframework.com.ext.jstree.strutsiBatis.core.service;

import egovframework.com.ext.jstree.strutsiBatis.core.dto.P_ComprehensiveTree;
import egovframework.com.ext.jstree.strutsiBatis.core.vo.T_ComprehensiveTree;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import java.lang.reflect.InvocationTargetException;

public class Util_SwapNode {

    static Logger logger = Logger.getLogger(Util_SwapNode.class);

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