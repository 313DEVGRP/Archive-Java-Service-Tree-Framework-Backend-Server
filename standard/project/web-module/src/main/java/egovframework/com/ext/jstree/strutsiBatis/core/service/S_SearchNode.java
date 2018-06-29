package egovframework.com.ext.jstree.strutsiBatis.core.service;

import egovframework.com.ext.jstree.strutsiBatis.core.dao.I_DB_SearchNode;
import egovframework.com.ext.jstree.strutsiBatis.core.dto.P_ComprehensiveTree;
import egovframework.com.ext.jstree.strutsiBatis.core.vo.T_ComprehensiveTree;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Service("S_SearchNode")
public class S_SearchNode implements I_S_SearchNode {

    HttpServletRequest request;
    static Logger logger = Logger.getLogger(S_SearchNode.class);

    P_ComprehensiveTree p_SearchNodeByPosition;
    List<T_ComprehensiveTree> t_SearchNodeByStrings;
    List<P_ComprehensiveTree> p_SearchNodeByPositions;

    @Resource(name = "DB_SearchNode")
    I_DB_SearchNode i_DB_SearchNode;

    public S_SearchNode() {
        p_SearchNodeByPosition = new P_ComprehensiveTree();
        t_SearchNodeByStrings = new ArrayList<T_ComprehensiveTree>();
        p_SearchNodeByPositions = new ArrayList<P_ComprehensiveTree>();
    }

    @Override
    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    @Override
    public List<String> searchNode(P_ComprehensiveTree p_ComprehensiveTree) {
        t_SearchNodeByStrings.addAll(searchNodeByString(p_ComprehensiveTree));
        for (T_ComprehensiveTree nodeByString : t_SearchNodeByStrings) {
            p_SearchNodeByPositions.add(Util_SwapNode.swapTtoP(nodeByString));
        }
        return searchNodeByPosition(p_SearchNodeByPositions);
    }

    @Override
    public List<T_ComprehensiveTree> searchNodeByString(P_ComprehensiveTree p_ComprehensiveTree) {
        String determineDBSetting = selectDBSetting("step1");
        return i_DB_SearchNode.searchNodeByString(p_ComprehensiveTree, determineDBSetting);
    }

    @Override
    public List<String> searchNodeByPosition(List<P_ComprehensiveTree> p_SearchNodeByPositions) {
        String determineDBSetting = selectDBSetting("step2");
        return i_DB_SearchNode.searchNodeByPosition(p_SearchNodeByPositions, determineDBSetting);
    }

    public String selectDBSetting(String step) {
        String returnStr = "";
        if ("/com/ext/jstree/strutsiBatis/core/searchNode.action".equals(request.getRequestURI()) && "step1".equals(step)) {
            returnStr = "jstreeStrutsiBatis.searchNodeByString";
        } else if ("/com/ext/jstree/strutsiBatis/core/searchNode.action".equals(request.getRequestURI()) && "step2".equals(step)) {
            returnStr = "jstreeStrutsiBatis.searchNodeByPosition";
        } else {
            logger.debug(request.getRequestURI());
        }
        return returnStr;
    }

}
