package egovframework.com.ext.jstree.springiBatis.core.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections15.CollectionUtils;
import org.apache.commons.collections15.Transformer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import egovframework.com.ext.jstree.springiBatis.core.dao.CoreDao;
import egovframework.com.ext.jstree.springiBatis.core.vo.ComprehensiveTree;
import egovframework.com.ext.jstree.springiBatis.core.vo.PaginatedComprehensiveTree;

@Service("CoreService")
public class CoreServiceImpl implements CoreService {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Resource(name = "CoreDao")
	private CoreDao coreDao;

	public <T extends ComprehensiveTree> T getNode(T comprehensiveTree) throws Exception {
		T getNode = ((T) coreDao.getNode(comprehensiveTree));
		return getNode;
	}

	public <T extends ComprehensiveTree> List<T> getChildNode(T comprehensiveTree) throws Exception {
		List<T> childNode = null;

		if (comprehensiveTree instanceof PaginatedComprehensiveTree) {
			PaginatedComprehensiveTree paginatedComprehensiveTree = (PaginatedComprehensiveTree) comprehensiveTree;

			ComprehensiveTree baseLineNode = coreDao.getNode(paginatedComprehensiveTree);
			paginatedComprehensiveTree.setC_left(baseLineNode.getC_left());
			paginatedComprehensiveTree.setC_right(baseLineNode.getC_right());
			paginatedComprehensiveTree.setC_level(baseLineNode.getC_level() + 1);

			childNode = (List<T>) coreDao.getDescendantNodesPaginated(comprehensiveTree);
		} else {
			childNode = (List<T>) coreDao.getChildNode(comprehensiveTree);
		}

		return childNode;
	}

	public <T extends ComprehensiveTree> List<String> searchNode(T comprehensiveTree) throws Exception {
		List<T> searchNodeByStrings = (List<T>) coreDao.searchNodeByString(comprehensiveTree);

		if (searchNodeByStrings.isEmpty()) {
			return new ArrayList<String>();
		} else {
			List<String> rowDatas = coreDao.searchNodeByPosition(searchNodeByStrings);
			List<String> returnList = new ArrayList<String>();

			for (String rowData : rowDatas) {
				rowData = "#node_" + rowData;
				returnList.add(rowData);
			}
			return returnList;
		}
	}

	@Transactional(readOnly = false, rollbackFor = { Exception.class }, propagation = Propagation.REQUIRED)
	public <T extends ComprehensiveTree> int removeNode(T comprehensiveTree) throws Exception {
		T removeNode = ((T) coreDao.getNode(comprehensiveTree));

		int spaceOfTargetNode = removeNode.getC_right() - removeNode.getC_left() + 1;

		removeNode.setSpaceOfTargetNode(spaceOfTargetNode);

		coreDao.removeNode(removeNode);

		return 0;
	}

	@Transactional(readOnly = false, rollbackFor = { Exception.class }, propagation = Propagation.REQUIRED)
	public <T extends ComprehensiveTree> int alterNode(T comprehensiveTree) throws Exception {
		return coreDao.alterNode(comprehensiveTree);
	}

	@Transactional(readOnly = false, rollbackFor = { Exception.class }, propagation = Propagation.REQUIRED)
	public <T extends ComprehensiveTree> int alterNodeType(T comprehensiveTree) throws Exception {
		final int FAILURE = 0;
		final int SUCCESS = 1;

		int returnStatus = FAILURE;

		T nodeById = ((T) coreDao.getNode(comprehensiveTree));

		if (nodeById.getC_type().equals(comprehensiveTree.getC_type())) {
			returnStatus = SUCCESS;
		} else if ("default".equals(comprehensiveTree.getC_type())) {
			List<T> childNodesFromNodeById = ((List<T>) coreDao.getChildNode(nodeById));

			if (childNodesFromNodeById.size() != 0) {
				throw new RuntimeException("하위에 노드가 있는데 디폴트로 바꾸려고 함");
			} else {
				int alterCountResult = coreDao.alterNodeType(comprehensiveTree);

				if (alterCountResult == 1) {
					returnStatus = SUCCESS;
				} else {
					throw new RuntimeException("여러개의 노드가 업데이트 되었음");
				}
			}
		} else if ("folder".equals(comprehensiveTree.getC_type())) {
			returnStatus = coreDao.alterNodeType(comprehensiveTree);
		}

		return returnStatus;
	}

	@Transactional(readOnly = false, rollbackFor = { Exception.class }, propagation = Propagation.REQUIRED)
	public <T extends ComprehensiveTree> T addNode(T comprehensiveTree) throws Exception {
		T nodeByRef = ((T) coreDao.getNodeByRef(comprehensiveTree));

		if (nodeByRef == null) {
			throw new RuntimeException("nodeByRef is null");
		}

		if ("default".equals(nodeByRef.getC_type())) {
			throw new RuntimeException("nodeByRef is default Type");
		}

		T t_ComprehensiveTree = newInstance(comprehensiveTree);

		final int lastPosiotionOfNodeByRef = coreDao.getChildCountByParentId(nodeByRef);

		t_ComprehensiveTree.setC_position(lastPosiotionOfNodeByRef);
		comprehensiveTree.setC_position(lastPosiotionOfNodeByRef);

		int rightPointFromNodeByRef = nodeByRef.getC_right();
		rightPointFromNodeByRef = Math.max(rightPointFromNodeByRef, 1);

		int spaceOfTargetNode = 2;

		this.stretchLeftRightForMyselfFromJstree(spaceOfTargetNode, rightPointFromNodeByRef,
				comprehensiveTree.getCopy(), null, comprehensiveTree);

		int targetNodeLevel = comprehensiveTree.getRef() == 0 ? 0 : nodeByRef.getC_level() + 1;

		comprehensiveTree.setC_parentid(comprehensiveTree.getRef());
		comprehensiveTree.setC_left(rightPointFromNodeByRef);
		comprehensiveTree.setC_right(rightPointFromNodeByRef + 1);
		comprehensiveTree.setC_level(targetNodeLevel);

		int insertSeqResult = coreDao.addMyselfFromJstree(comprehensiveTree);

		t_ComprehensiveTree.setId(insertSeqResult);
		comprehensiveTree.setC_id(insertSeqResult);

		int alterCountResult = coreDao.alterNode(comprehensiveTree);

		if (insertSeqResult > 0 && alterCountResult == 1) {
			final int SUCCESS = 1;
			t_ComprehensiveTree.setStatus(SUCCESS);
		} else {
			throw new RuntimeException("심각한 오류 발생 - 삽입 노드");
		}

		return t_ComprehensiveTree;
	}

	private <T extends ComprehensiveTree> void stretchLeftRightForMyselfFromJstree(int spaceOfTargetNode,
			int rightPositionFromNodeByRef, int copy, Collection<Integer> c_idsByChildNodeFromNodeById,
			T comprehensiveTree) throws Exception {
		T onlyStretchLeftRightForMyselfFromJstree = newInstance(comprehensiveTree);

		onlyStretchLeftRightForMyselfFromJstree.setSpaceOfTargetNode(spaceOfTargetNode);
		onlyStretchLeftRightForMyselfFromJstree.setRightPositionFromNodeByRef(rightPositionFromNodeByRef);
		onlyStretchLeftRightForMyselfFromJstree.setC_idsByChildNodeFromNodeById(c_idsByChildNodeFromNodeById);
		onlyStretchLeftRightForMyselfFromJstree.setCopy(copy);

		coreDao.stretchLeftRightForMyselfFromJstree(onlyStretchLeftRightForMyselfFromJstree);
	}

	@Transactional(readOnly = false, rollbackFor = { Exception.class }, propagation = Propagation.REQUIRED)
	public <T extends ComprehensiveTree> T moveNode(T comprehensiveTree, HttpServletRequest request) throws Exception {
		T nodeById = (T) coreDao.getNode(comprehensiveTree);

		if (nodeById == null) {
			throw new RuntimeException("nodeById is null");
		}

		List<T> childNodesFromNodeById = ((List<T>) coreDao.getChildNodeByLeftRight(nodeById));

		T nodeByRef = (T) coreDao.getNodeByRef(comprehensiveTree);
		List<T> childNodesFromNodeByRef = ((List<T>) coreDao.getChildNode(nodeByRef));

		T t_ComprehensiveTree = newInstance(comprehensiveTree);

		int spaceOfTargetNode = 2;
		Collection<Integer> c_idsByChildNodeFromNodeById = null;

		c_idsByChildNodeFromNodeById = CollectionUtils.collect(childNodesFromNodeById, new Transformer<T, Integer>() {
			@Override
			public Integer transform(T childNodePerNodeById) {
				return childNodePerNodeById.getC_id();
			}
		});

		if (c_idsByChildNodeFromNodeById.contains(comprehensiveTree.getRef())) {
			throw new RuntimeException("myself contains already refTargetNode");
		}

		spaceOfTargetNode = nodeById.getC_right() - nodeById.getC_left() + 1;

		if (!comprehensiveTree.isCopied()) {
			this.cutMyself(nodeById, spaceOfTargetNode, c_idsByChildNodeFromNodeById);
		}

		this.calculatePostion(comprehensiveTree, nodeById, childNodesFromNodeByRef, request);

		int rightPointFromNodeByRef = nodeByRef.getC_right();
		rightPointFromNodeByRef = Math.max(rightPointFromNodeByRef, 1);

		if (!comprehensiveTree.isCopied()) {
			this.stretchPositionForMyselfFromJstree(c_idsByChildNodeFromNodeById, comprehensiveTree);

			int selfPosition = (nodeById.getC_parentid() == comprehensiveTree.getRef() && comprehensiveTree
					.getC_position() > nodeById.getC_position()) ? 1 : 0;

			for (T child : childNodesFromNodeByRef) {
				if (child.getC_position() - selfPosition == comprehensiveTree.getC_position()) {
					rightPointFromNodeByRef = child.getC_left();
					break;
				}
			}

			if (nodeById.getC_left() < rightPointFromNodeByRef) {
				rightPointFromNodeByRef -= spaceOfTargetNode;
			}
		}

		this.stretchLeftRightForMyselfFromJstree(spaceOfTargetNode, rightPointFromNodeByRef,
				comprehensiveTree.getCopy(), c_idsByChildNodeFromNodeById, comprehensiveTree);

		if (logger.isDebugEnabled()) {
			logger.debug(">>>>>>>>>>>>>>>>>>>>" + rightPointFromNodeByRef);
		}

		int targetNodeLevel = nodeById.getC_level() - (nodeByRef.getC_level() + 1);
		int comparePoint = nodeById.getC_left() - rightPointFromNodeByRef;

		if (logger.isDebugEnabled()) {
			logger.debug(">>>>>>>>>>>>>>>>>>>>" + comparePoint);
		}

		if (comprehensiveTree.isCopied()) {
			int insertSeqResult = this
					.pasteMyselfFromJstree(comprehensiveTree.getRef(), comparePoint, spaceOfTargetNode,
							targetNodeLevel, c_idsByChildNodeFromNodeById, rightPointFromNodeByRef, nodeById);
			t_ComprehensiveTree.setId(insertSeqResult);
			this.fixPositionParentIdOfCopyNodes(insertSeqResult, comprehensiveTree.getC_position(), comprehensiveTree);
		} else {
			this.enterMyselfFromJstree(comprehensiveTree.getRef(), comprehensiveTree.getC_position(),
					comprehensiveTree.getC_id(), comparePoint, targetNodeLevel, c_idsByChildNodeFromNodeById,
					comprehensiveTree);
		}
		return t_ComprehensiveTree;
	}

	private <T extends ComprehensiveTree> void cutMyself(T nodeById, int spaceOfTargetNode,
			Collection<Integer> c_idsByChildNodeFromNodeById) throws Exception {
		nodeById.setSpaceOfTargetNode(spaceOfTargetNode);
		nodeById.setC_idsByChildNodeFromNodeById(c_idsByChildNodeFromNodeById);

		coreDao.cutMyself(nodeById);
	}

	private <T extends ComprehensiveTree> void calculatePostion(T comprehensiveTree, T nodeById,
			List<T> childNodesFromNodeByRef, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();

		final boolean isMoveNodeInMyParent = (comprehensiveTree.getRef() == nodeById.getC_parentid());
		final boolean isMultiCounterZero = (comprehensiveTree.getMultiCounter() == 0);
		final boolean isBeyondTheCurrentToMoveNodes = (comprehensiveTree.getC_position() > nodeById.getC_position());

		if (isMoveNodeInMyParent) {
			if (logger.isDebugEnabled()) {
				logger.debug(">>>>>>>>>>>>>>>이동할 노드가 내 부모안에서 움직일때");
			}

			if (isMultiCounterZero) {
				if (isBeyondTheCurrentToMoveNodes) {
					if (logger.isDebugEnabled()) {
						logger.debug(">>>>>>>>>>>>>>>이동 할 노드가 현재보다 뒤일때");
						logger.debug("노드값=" + nodeById.getC_title());
						logger.debug("노드의 초기 위치값=" + nodeById.getC_position());
						logger.debug("노드의 요청받은 위치값=" + comprehensiveTree.getC_position());
						logger.debug("노드의 요청받은 멀티카운터=" + comprehensiveTree.getMultiCounter());
					}

					final boolean isFolderToMoveNodes = (comprehensiveTree.getC_position() > childNodesFromNodeByRef
							.size());

					if (isFolderToMoveNodes) {
						if (logger.isDebugEnabled()) {
							logger.debug("노드 이동시 폴더를 대상으로 했을때 생기는 버그 발생 =" + comprehensiveTree.getC_position());
						}
						comprehensiveTree.setC_position(childNodesFromNodeByRef.size());
					} else {
						comprehensiveTree.setC_position(comprehensiveTree.getC_position() - 1);
					}
				}

				if (logger.isDebugEnabled()) {
					logger.debug("노드의 최종 위치값=" + comprehensiveTree.getC_position());
				}
				session.setAttribute("settedPosition", comprehensiveTree.getC_position());
			} else {
				if (logger.isDebugEnabled()) {
					logger.debug(">>>>>>>>>>>>>>>멀티 카운터가 0 이 아닐때");
					logger.debug("노드값=" + nodeById.getC_title());
					logger.debug("노드의 초기 위치값=" + nodeById.getC_position());
					logger.debug("노드의 요청받은 위치값=" + comprehensiveTree.getC_position());
					logger.debug("노드의 요청받은 멀티카운터=" + comprehensiveTree.getMultiCounter());
					logger.debug("0번 노드의 위치값=" + session.getAttribute("settedPosition"));
				}

				int increasePosition = 0;

				final boolean isMultiNodeOfPositionsAtZeroThanBehind = ((Integer) session
						.getAttribute("settedPosition") < nodeById.getC_position());

				if (isMultiNodeOfPositionsAtZeroThanBehind) {
					if (logger.isDebugEnabled()) {
						logger.debug(">>>>>>>>>>>>>>>멀티 노드의 위치가 0번 노드보다 뒤일때");
					}

					increasePosition = (Integer) session.getAttribute("settedPosition") + 1;
				} else {
					if (logger.isDebugEnabled()) {
						logger.debug(">>>>>>>>>>>>>>>멀티 노드의 위치가 0번 노드보다 앞일때");
					}

					if (comprehensiveTree.isCopied()) {
						increasePosition = (Integer) session.getAttribute("settedPosition") + 1;
					} else {
						increasePosition = (Integer) session.getAttribute("settedPosition");
					}

				}
				session.setAttribute("settedPosition", increasePosition);

				comprehensiveTree.setC_position(increasePosition);

				final boolean isSamePosition = (nodeById.getC_position() == comprehensiveTree.getC_position());

				if (isSamePosition) {
					if (logger.isDebugEnabled()) {
						logger.debug(">>>>>>>>>>>>>>>원래 노드 위치값과 최종 계산된 노드의 위치값이 동일한 경우");
					}

					session.setAttribute("settedPosition", increasePosition - 1);
				}

				if (logger.isDebugEnabled()) {
					logger.debug("노드의 최종 위치값=" + comprehensiveTree.getC_position());
				}
			}
		} else {
			if (logger.isDebugEnabled()) {
				logger.debug(">>>>>>>>>>>>>>>이동할 노드가 내 부모밖으로 움직일때");
			}

			if (isMultiCounterZero) {
				if (logger.isDebugEnabled()) {
					logger.debug(">>>>>>>>>>>>>>>멀티 카운터가 0 일때");
					logger.debug("노드값=" + nodeById.getC_title());
					logger.debug("노드의 초기 위치값=" + nodeById.getC_position());
					logger.debug("노드의 요청받은 위치값=" + comprehensiveTree.getC_position());
					logger.debug("노드의 요청받은 멀티카운터=" + comprehensiveTree.getMultiCounter());
					logger.debug("노드의 최종 위치값=" + comprehensiveTree.getC_position());
				}

				session.setAttribute("settedPosition", comprehensiveTree.getC_position());
			} else {
				if (logger.isDebugEnabled()) {
					logger.debug(">>>>>>>>>>>>>>>멀티 카운터가 0 이 아닐때");
					logger.debug("노드값=" + nodeById.getC_title());
					logger.debug("노드의 초기 위치값=" + nodeById.getC_position());
					logger.debug("노드의 요청받은 위치값=" + comprehensiveTree.getC_position());
					logger.debug("노드의 요청받은 멀티카운터=" + comprehensiveTree.getMultiCounter());
				}

				int increasePosition = 0;
				increasePosition = (Integer) session.getAttribute("settedPosition") + 1;
				comprehensiveTree.setC_position(increasePosition);
				session.setAttribute("settedPosition", increasePosition);

				if (logger.isDebugEnabled()) {
					logger.debug("노드의 최종 위치값=" + comprehensiveTree.getC_position());
				}
			}
		}
	}

	private <T extends ComprehensiveTree> void stretchPositionForMyselfFromJstree(
			Collection<Integer> c_idsByChildNodeFromNodeById, T comprehensiveTree) throws Exception {
		comprehensiveTree.setC_idsByChildNodeFromNodeById(c_idsByChildNodeFromNodeById);

		coreDao.stretchPositionForMyselfFromJstree(comprehensiveTree);
	}

	private <T extends ComprehensiveTree> int pasteMyselfFromJstree(int ref, int idif, int spaceOfTargetNode, int ldif,
			Collection<Integer> c_idsByChildNodeFromNodeById, int rightPositionFromNodeByRef, T nodeById)
			throws Exception {
		T onlyPasteMyselfFromJstree = newInstance(nodeById);

		onlyPasteMyselfFromJstree.setRef(ref);
		onlyPasteMyselfFromJstree.setIdif(idif);
		onlyPasteMyselfFromJstree.setSpaceOfTargetNode(spaceOfTargetNode);
		onlyPasteMyselfFromJstree.setLdif(ldif);
		onlyPasteMyselfFromJstree.setC_idsByChildNodeFromNodeById(c_idsByChildNodeFromNodeById);
		onlyPasteMyselfFromJstree.setRightPositionFromNodeByRef(rightPositionFromNodeByRef);
		onlyPasteMyselfFromJstree.setNodeById(nodeById);

		onlyPasteMyselfFromJstree.setIdifLeft(idif
				+ (nodeById.getC_left() >= rightPositionFromNodeByRef ? spaceOfTargetNode : 0));
		onlyPasteMyselfFromJstree.setIdifRight(idif
				+ (nodeById.getC_left() >= rightPositionFromNodeByRef ? spaceOfTargetNode : 0));

		return coreDao.pasteMyselfFromJstree(onlyPasteMyselfFromJstree);
	}

	private <T extends ComprehensiveTree> void enterMyselfFromJstree(int ref, int c_position, int c_id, int idif,
			int ldif, Collection<Integer> c_idsByChildNodeFromNodeById, T comprehensiveTree) throws Exception {
		T onlyPasteMyselfFromJstree = newInstance(comprehensiveTree);

		onlyPasteMyselfFromJstree.setRef(ref);
		onlyPasteMyselfFromJstree.setC_position(c_position);
		onlyPasteMyselfFromJstree.setC_id(c_id);
		onlyPasteMyselfFromJstree.setIdif(idif);
		onlyPasteMyselfFromJstree.setLdif(ldif);
		onlyPasteMyselfFromJstree.setC_idsByChildNodeFromNodeById(c_idsByChildNodeFromNodeById);

		coreDao.enterMyselfFixPosition(onlyPasteMyselfFromJstree);
		coreDao.enterMyselfFixLeftRight(onlyPasteMyselfFromJstree);
	}

	private <T extends ComprehensiveTree> void fixPositionParentIdOfCopyNodes(int insertSeqResult, int position,
			T t_comprehensiveTree) throws Exception {
		T comprehensiveTree = newInstance(t_comprehensiveTree);
		comprehensiveTree.setC_id(insertSeqResult);

		T node = ((T) coreDao.getNode(comprehensiveTree));

		List<T> children = ((List<T>) coreDao.getChildNodeByLeftRight(node));

		Map<Integer, Integer> parentIds = new HashMap<Integer, Integer>();

		for (T child : children) {
			for (int i = child.getC_left() + 1; i < child.getC_right(); i++) {
				final int parentId = child.getC_id();
				parentIds.put(i, parentId);
			}

			if (child.getC_id() == insertSeqResult) {
				if (logger.isDebugEnabled()) {
					logger.debug(">>>>>>>>>>>>>>>>> 기준노드가 잡혔음.");
					logger.debug("C_TITLE    = " + child.getC_title());
					logger.debug("C_ID       = " + insertSeqResult);
					logger.debug("C_POSITION = " + position);
				}

				T onlyFixCopyFromJstree = newInstance(t_comprehensiveTree);
				onlyFixCopyFromJstree.setFixCopyId(insertSeqResult);
				onlyFixCopyFromJstree.setFixCopyPosition(position);

				coreDao.fixCopyIF(onlyFixCopyFromJstree);
				continue;
			}

			if (logger.isDebugEnabled()) {
				logger.debug(">>>>>>>>>>>>>>>>> 기준노드 아래 있는 녀석임");
				logger.debug("C_TITLE    = " + child.getC_title());
				logger.debug("C_ID       = " + child.getC_id());
				logger.debug("C_POSITION = " + child.getC_position());
				logger.debug("부모아이디값 = " + parentIds.get(child.getC_left()));
			}

			child.setFixCopyId(parentIds.get(child.getC_left()));

			coreDao.fixCopy(child);
		}
	}

	@SuppressWarnings("unchecked")
	private <T extends ComprehensiveTree> T newInstance(T comprehensiveTree) throws Exception {
		Class<T> target = (Class<T>) Class.forName(comprehensiveTree.getClass().getCanonicalName());
		return target.newInstance();
	}
}