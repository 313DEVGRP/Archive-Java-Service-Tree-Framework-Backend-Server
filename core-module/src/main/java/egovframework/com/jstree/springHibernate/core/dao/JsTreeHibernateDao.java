package egovframework.com.jstree.springHibernate.core.dao;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.hibernate.LockMode;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.springframework.orm.hibernate4.HibernateCallback;

import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;

public interface JsTreeHibernateDao<T extends JsTreeHibernateSearchDTO, ID extends Serializable> {
	
	public Class<T> getClazz();
	public void setClazz(Class<T> clazzToSet);
	public DetachedCriteria createDetachedCriteria(Class<?> clazz);
	public DetachedCriteria createDetachedCriteria();
	public T getUnique(Long id);
	public T getUnique(Criterion criterion);
	public T getUnique(T extractSearchDTO);
	public T getUnique(Criterion... criterions);
	public T getUnique(List<Criterion> criterion);
	public List<T> getList();
	public List<T> getList(DetachedCriteria detachedCriteria, int limit, int offset);
	public List<T> getList(T extractSearchDTO);
	public List<T> getList(T extractSearchDTO, Criterion... criterion);
	public List<T> getList(Criterion... criterions);
	public List<T> getList(List<Criterion> criterions, List<Order> orders);
	public List<T> getGroupByList(T extractSearchDTO, String target);
	public Map<String, Long> getGroupByList(T extractSearchDTO, String groupProperty, String sumProperty);
	public int getGroupByCount(T extractSearchDTO, String tagert);
	public List<T> getListWithoutPaging(Order order);
	public List<T> getListWithoutPaging(Order order, Criterion... criterion);
	public List<T> getListWithoutPaging(DetachedCriteria detachedCriteria);
	public int getCount(Criterion... criterions);
	public int getCount(T extractSearchDTO);
	public int getCount(T extractSearchDTO, List<Criterion> criterions);
	public int getCount(List<Criterion> criterions);
	public int getSum(List<Criterion> criterions, String propertyName);
	public int getSum(T extractSearchDTO, String propertyName);
	public T find(ID id, LockMode lockMode);
	public T find(ID id, LockMode lockMode, boolean enableCache);
	public void refresh(Object entity);
	public ID store(T newInstance);
	public void storeOrUpdate(T newInstance);
	public void storeOrUpdateAdvanced(T newInstance, String columId);
	public void update(T transientObject);
	public void merge(T transientObject);
	public int bulkUpdate(String queryString, Object... value);
	public void flush();
	public void delete(T persistentObject);
	public void deleteAll(Collection<T> entities);
	public void bulkInsert(Collection<T> entities);
	public T excute(HibernateCallback<T> callback);
	public List<T> search(Map<String, Object> parameterMap);
    public ID insert(T entity);
    public void deleteById(ID id);
}
