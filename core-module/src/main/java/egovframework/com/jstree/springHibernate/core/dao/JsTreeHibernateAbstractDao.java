package egovframework.com.jstree.springHibernate.core.dao;

import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.collections.CollectionUtils;
import org.hibernate.*;
import org.hibernate.criterion.*;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.*;

@SuppressWarnings("unchecked")
public abstract class JsTreeHibernateAbstractDao<T extends JsTreeHibernateSearchDTO, ID extends Serializable> extends HibernateDaoSupport {

	@Resource(name = "sessionFactory")
    public void init(SessionFactory sessionFactory) {
        this.setSessionFactory(sessionFactory);
    }
	protected abstract Class<T> getEntityClass();
	
	protected Session getCurrentSession() {
        return getHibernateTemplate().getSessionFactory().getCurrentSession();
    }

	public DetachedCriteria createDetachedCriteria(Class<?> clazz) {
		return DetachedCriteria.forClass(clazz);
	}

	public DetachedCriteria createDetachedCriteria() {
		return DetachedCriteria.forClass(getEntityClass());
	}

	private DetachedCriteria getCriteria(T extractSearchDTO) {
		DetachedCriteria criteria = DetachedCriteria.forClass(getEntityClass());
		for (Criterion criterion : extractSearchDTO.getCriterions()) {
			criteria.add(criterion);
		}
		return criteria;
	}

	public T getUnique(Long id) {
		return getHibernateTemplate().get(getEntityClass(), id);
	}

	public T getUnique(Criterion criterion) {
		DetachedCriteria detachedCriteria = createDetachedCriteria();
		detachedCriteria.add(criterion);
		List<T> list = (List<T>) getHibernateTemplate().findByCriteria(detachedCriteria);
		if (list.isEmpty()) {
			return null;
		}
		return (T) list.get(0);
	}

	public T getUnique(T extractSearchDTO) {
		DetachedCriteria detachedCriteria = createDetachedCriteria();
		for (Criterion c : extractSearchDTO.getCriterions()) {
			detachedCriteria.add(c);
		}
		List<T> list = (List<T>) getHibernateTemplate().findByCriteria(detachedCriteria);
		if (list.isEmpty()) {
			return null;
		}
		return (T) list.get(0);
	}

	public T getUnique(Criterion... criterions) {
		DetachedCriteria detachedCriteria = createDetachedCriteria();
		for (Criterion c : criterions) {
			detachedCriteria.add(c);
		}
		List<T> list = (List<T>) getHibernateTemplate().findByCriteria(detachedCriteria);
		if (list.isEmpty()) {
			return null;
		}
		return (T) list.get(0);
	}

	public T getUnique(List<Criterion> criterion) {
		DetachedCriteria detachedCriteria = createDetachedCriteria();
		for (Criterion c : criterion) {
			detachedCriteria.add(c);
		}
		List<T> list = (List<T>) getHibernateTemplate().findByCriteria(detachedCriteria);
		if (list.isEmpty()) {
			return null;
		}
		return (T) list.get(0);
	}

	public List<T> getList() {
		DetachedCriteria criteria = DetachedCriteria.forClass(getEntityClass());
		List<T> list = (List<T>) getHibernateTemplate().findByCriteria(criteria);
		if (list.isEmpty()) {
			return null;
		}
		return list;
	}

	public List<T> getList(DetachedCriteria detachedCriteria, int limit, int offset) {
		return (List<T>) getHibernateTemplate().findByCriteria(detachedCriteria, offset, limit);
	}

	public List<T> getList(T extractSearchDTO) {
		DetachedCriteria detachedCriteria = createDetachedCriteria();
		for (Order order : extractSearchDTO.getOrder()) {
			detachedCriteria.addOrder(order);
		}
		for (Criterion criterion : extractSearchDTO.getCriterions()) {
			detachedCriteria.add(criterion);
		}
		List<T> list = (List<T>) getHibernateTemplate().findByCriteria(detachedCriteria, extractSearchDTO.getFirstIndex(),
				extractSearchDTO.getLastIndex());
		if (list.isEmpty()) {
			return new ArrayList<>();
		}
		return list;
	}

	public List<T> getList(T extractSearchDTO, Criterion... criterion) {
		DetachedCriteria detachedCriteria = createDetachedCriteria();
		for (Criterion c : criterion) {
			detachedCriteria.add(c);
		}
		for (Order order : extractSearchDTO.getOrder()) {
			detachedCriteria.addOrder(order);
		}
		return (List<T>) getHibernateTemplate().findByCriteria(detachedCriteria, extractSearchDTO.getFirstIndex(),
				extractSearchDTO.getLastIndex());
	}

	public List<T> getList(Criterion... criterions) {
		DetachedCriteria criteria = createDetachedCriteria();
		for (Criterion criterion : criterions) {
			criteria.add(criterion);
		}
		List<T> list = (List<T>) getHibernateTemplate().findByCriteria(criteria);
		if (list.isEmpty()) {
			return new ArrayList<>();
		}
		return list;
	}

	public List<T> getList(List<Criterion> criterions, List<Order> orders) {
		DetachedCriteria criteria = createDetachedCriteria();
		for (Criterion criterion : criterions) {
			criteria.add(criterion);
		}
		for (Order order : orders) {
			criteria.addOrder(order);
		}
		List<T> list = (List<T>) getHibernateTemplate().findByCriteria(criteria);
		if (list.isEmpty()) {
			return new ArrayList<>();
		}
		return list;
	}

	public List<T> getGroupByList(T extractSearchDTO, String target) {
		DetachedCriteria detachedCriteria = createDetachedCriteria();
		for (Order order : extractSearchDTO.getOrder()) {
			detachedCriteria.addOrder(order);
		}
		for (Criterion criterion : extractSearchDTO.getCriterions()) {
			detachedCriteria.add(criterion);
		}
		ProjectionList projectList = Projections.projectionList();
		projectList.add(Projections.groupProperty(target));
		detachedCriteria.setProjection(projectList);
		return (List<T>) getHibernateTemplate().findByCriteria(detachedCriteria, extractSearchDTO.getFirstIndex(),
				extractSearchDTO.getLastIndex());
	}
	
	public Map<String, Long> getGroupByList(T extractSearchDTO, String groupProperty, String sumProperty) {
		DetachedCriteria detachedCriteria = createDetachedCriteria();
		Map<String, Long> result = new HashMap<String, Long>();
		for (Criterion criterion : extractSearchDTO.getCriterions()) {
			detachedCriteria.add(criterion);
		}
		ProjectionList projectList = Projections.projectionList();
		projectList.add(Projections.property(groupProperty));
		projectList.add(Projections.sum(sumProperty));
		projectList.add(Projections.groupProperty(groupProperty));
		detachedCriteria.setProjection(projectList);
		List<?> l = getHibernateTemplate().findByCriteria(detachedCriteria);
		detachedCriteria.setProjection(null);
		if (null == l || l.size() == 0) {
			return result;
		} else {
			Iterator<?> ite = l.iterator();
			while (ite.hasNext()) {
				Object[] objects = (Object[]) ite.next();
				result.put((String) objects[0], (Long) objects[1]);
			}
		}
		return result;
	}

	public int getGroupByCount(T extractSearchDTO, String tagert) {
		DetachedCriteria detachedCriteria = createDetachedCriteria();
		for (Criterion criterion : extractSearchDTO.getCriterions()) {
			detachedCriteria.add(criterion);
		}
		ProjectionList projectList = Projections.projectionList();
		projectList.add(Projections.groupProperty(tagert));
		detachedCriteria.setProjection(projectList);
		List<?> l = getHibernateTemplate().findByCriteria(detachedCriteria);
		detachedCriteria.setProjection(null);
		if (null == l || l.size() == 0) {
			return 0;
		} else {
			return l.size();
		}
	}


	public List<T> getListWithoutPaging(Order order) {
		DetachedCriteria detachedCriteria = createDetachedCriteria();
		detachedCriteria.addOrder(order);

		return (List<T>) getHibernateTemplate().findByCriteria(detachedCriteria);
	}

	public List<T> getListWithoutPaging(Order order, Criterion... criterion) {
		DetachedCriteria detachedCriteria = createDetachedCriteria();
		for (Criterion c : criterion) {
			detachedCriteria.add(c);
		}
		detachedCriteria.addOrder(order);

		return (List<T>) getHibernateTemplate().findByCriteria(detachedCriteria);
	}

	public List<T> getListWithoutPaging(DetachedCriteria detachedCriteria) {
		return (List<T>) getHibernateTemplate().findByCriteria(detachedCriteria);
	}

	public int getCount(Criterion... criterions) {
		DetachedCriteria detachedCriteria = createDetachedCriteria();
		for (Criterion c : criterions) {
			detachedCriteria.add(c);
		}

		detachedCriteria.setProjection(Projections.rowCount());
		List<?> l = getHibernateTemplate().findByCriteria(detachedCriteria);

		if (l.size() == 0) {
			return 0;
		}

		Long total = (Long) l.get(0);
		detachedCriteria.setProjection(null);
		return total.intValue();
	}

	public int getCount(T extractSearchDTO) {
		DetachedCriteria detachedCriteria = createDetachedCriteria();

		for (Criterion c : extractSearchDTO.getCriterions()) {
			detachedCriteria.add(c);
		}

		detachedCriteria.setProjection(Projections.rowCount());
		List<?> l = getHibernateTemplate().findByCriteria(detachedCriteria);

		if (null == l || l.size() == 0) {
			return 0;
		}

		Long total = (Long) l.get(0);
		detachedCriteria.setProjection(null);
		return total.intValue();
	}

	public int getCount(T extractSearchDTO, List<Criterion> criterions) {
		DetachedCriteria detachedCriteria = createDetachedCriteria();

		for (Criterion c : criterions) {
			detachedCriteria.add(c);
		}

		detachedCriteria.setProjection(Projections.rowCount());
		List<?> l = getHibernateTemplate().findByCriteria(detachedCriteria);

		Long total = (Long) l.get(0);
		detachedCriteria.setProjection(null);
		return total.intValue();
	}

	public int getCount(List<Criterion> criterions) {
		DetachedCriteria detachedCriteria = createDetachedCriteria();
		for (Criterion c : criterions) {
			detachedCriteria.add(c);
		}

		detachedCriteria.setProjection(Projections.rowCount());
		List<?> l = getHibernateTemplate().findByCriteria(detachedCriteria);

		Long total = (Long) l.get(0);
		detachedCriteria.setProjection(null);
		return total.intValue();
	}

	public int getSum(List<Criterion> criterions, String propertyName) {
		DetachedCriteria detachedCriteria = createDetachedCriteria();
		detachedCriteria.add(Restrictions.isNotNull(propertyName));

		for (Criterion c : criterions) {
			detachedCriteria.add(c);
		}

		detachedCriteria.setProjection(Projections.sum(propertyName));
		List<?> l = getHibernateTemplate().findByCriteria(detachedCriteria);

		if (l.size() == 0) {
			return 0;
		}

		Long sum = (Long) l.get(0);
		detachedCriteria.setProjection(null);
		return sum != null ? sum.intValue() : 0;
	}

	public int getSum(T extractSearchDTO, String propertyName) {
		DetachedCriteria criteria = getCriteria(extractSearchDTO);
		criteria.add(Restrictions.isNotNull(propertyName));
		criteria.setProjection(Projections.sum(propertyName));
		List<?> l = getHibernateTemplate().findByCriteria(criteria);

		if (CollectionUtils.isEmpty(l)) {
			return 0;
		}

		Long total = (Long) l.get(0);
		criteria.setProjection(null);
		return total != null ? total.intValue() : 0;
	}
	
	public T find(ID id, LockMode lockMode) {
        return (T) getHibernateTemplate().get(getEntityClass(), id, lockMode);
    }

	public T find(ID id, LockMode lockMode, boolean enableCache) {
        Object obj = getHibernateTemplate().get(getEntityClass(), id, lockMode);
        if (null != obj && !enableCache) {
            getHibernateTemplate().refresh(obj);
        }
        
        return (T) obj;
    }

	public void refresh(Object entity) {
		getHibernateTemplate().refresh(entity);
	}

	public ID store(T newInstance) {
		return (ID) getHibernateTemplate().save(newInstance);
	}

	public void storeOrUpdate(T newInstance) {
		getHibernateTemplate().saveOrUpdate(newInstance);
	}

	public void storeOrUpdateAdvanced(T newInstance, String columId) {
		getHibernateTemplate().saveOrUpdate(newInstance);
	}

	public void update(T transientObject) {
		getHibernateTemplate().update(transientObject);
	}

	public void merge(T transientObject) {
		getHibernateTemplate().merge(transientObject);
	}

	public int bulkUpdate(String queryString, Object... value) {
		return getHibernateTemplate().bulkUpdate(queryString, value);
	}

	public void flush() {
		getHibernateTemplate().flush();
	}

	public void delete(T persistentObject) {
		getHibernateTemplate().delete(persistentObject);
	}

	public void deleteAll(Collection<T> entities) {
		getHibernateTemplate().deleteAll(entities);
	}

	public void bulkInsert(Collection<T> entities) {
		Session session = getHibernateTemplate().getSessionFactory().openSession();
		session.setCacheMode(CacheMode.IGNORE);
		Transaction tx = session.beginTransaction();

		int i = 0;
		for (T t : entities) {
			session.save(t);

			if (i % 50 == 0) { // batch size
				session.flush();
				session.clear();
			}
			i++;
		}

		tx.commit();
		session.close();
	}

	public T excute(HibernateCallback<T> callback) {
		return getHibernateTemplate().execute(callback);
	}

	@SuppressWarnings("unused")
	private Long getId(Object object) {
		String value = "";
		try {
			value = BeanUtils.getProperty(object, "id");
		} catch (Exception e) {
			logger.error("no search instace class id");
		}

		if( null == value){
			throw new RuntimeException("getId value is null");
		}
		return Long.parseLong(value);
	}

	@SuppressWarnings("unused")
	private Long getId(Object object, String columId) {
		String value = "";
		try {
			value = BeanUtils.getProperty(object, columId);
		} catch (Exception e) {
			logger.error("no search instace class id");
		}

		if( null == value){
			throw new RuntimeException("getId value is null");
		}
		return Long.parseLong(value);
	}
	
	public T getByID(ID id) {
        return (T) getCurrentSession().get(getEntityClass(), id);
    }
 
    @SuppressWarnings("rawtypes")
	public List search(Map<String, Object> parameterMap) {
        Criteria criteria = getCurrentSession().createCriteria(getEntityClass());

		/* coveriry 처리.
		Set<String> fieldName = parameterMap.keySet();
		for (String field : fieldName) {
            criteria.add(Restrictions.ilike(field, parameterMap.get(field)));
        }
        */

		for (Map.Entry<String, Object> entry : parameterMap.entrySet()) {
			criteria.add(Restrictions.ilike(entry.getKey(), entry.getValue()));
		}

        return criteria.list();
    }
 
    public ID insert(T entity) {
        return (ID) store(entity);
    }
 
    public void deleteById(ID id) {
		if(null != getByID(id)){
			delete(getByID(id));
		}else{
			throw new RuntimeException("getByID(id) is null");
		}
    }
 
}
