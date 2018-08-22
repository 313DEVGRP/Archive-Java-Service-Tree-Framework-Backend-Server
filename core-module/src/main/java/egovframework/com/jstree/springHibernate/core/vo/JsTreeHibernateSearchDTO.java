package egovframework.com.jstree.springHibernate.core.vo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernatePaginatedDTO;
import egovframework.com.ext.jstree.support.util.StringUtils;
import egovframework.com.ext.jstree.support.util.Text;
import org.hibernate.criterion.*;

import javax.persistence.Transient;
import java.io.Serializable;
import java.util.*;

public abstract class JsTreeHibernateSearchDTO extends JsTreeHibernatePaginatedDTO implements Serializable {

	private static final long serialVersionUID = 2591336265806317114L;
	@JsonIgnore
	private List<Order> order = new ArrayList<>();
	@JsonIgnore
	private List<Criterion> criterions = new ArrayList<>();
	@JsonIgnore
	private Projection projection;
	@JsonIgnore
	private Map<String, Object> whereMap = new HashMap<>();
	@JsonIgnore
	private int whereCount = 0;

	public JsTreeHibernateSearchDTO() {
		super();
	}

	public JsTreeHibernateSearchDTO(List<Order> order, List<Criterion> criterions, Projection projection,
			Map<String, Object> whereMap, int whereCount) {
		super();
		this.order = order;
		this.criterions = criterions;
		this.projection = projection;
		this.whereMap = whereMap;
		this.whereCount = whereCount;
	}
	
	public abstract <T extends JsTreeHibernateSearchDTO> void setFieldFromNewInstance(T paramInstance);

	@Transient
	public List<Order> getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order.add(order);
	}

	@Transient
	public List<Criterion> getCriterions() {
		return criterions;
	}

	@Transient
	public String getWhereMap(String key) {
		if (this.whereMap.containsKey(key)) {
			String value = (String) whereMap.get(key);

			return " \"" + StringUtils.replace(value, "\"", "\\\"") + "\"";
		}
		return " \"\"";
	}

	@Transient
	public int getWhereCount() {
		return whereCount;
	}

	public void setWhere(String propertyName, Object value) {
		if (null == value) {
			return;
		}

		this.whereMap.put(propertyName, value);
		this.whereCount++;

		if (value instanceof String) {
			String str = (String) value;

			if (!StringUtils.isEmpty(str)) {
				if (StringUtils.startsWith(str, "*") && StringUtils.endsWith(str, "*")) {
					str = StringUtils.removeEnd(str, "*");
					str = StringUtils.removeStart(str, "*");
					criterions.add(Restrictions.like(propertyName, str, MatchMode.ANYWHERE));
				} else if (StringUtils.startsWith(str, "*")) {
					str = StringUtils.removeStart(str, "*");
					criterions.add(Restrictions.like(propertyName, str, MatchMode.END));
				} else if (StringUtils.endsWith(str, "*")) {
					str = StringUtils.removeEnd(str, "*");
					criterions.add(Restrictions.like(propertyName, str, MatchMode.START));
				} else if (StringUtils.startsWith(str, "isNotNull")) {
					criterions.add(Restrictions.isNotNull(propertyName));
				} else {
					criterions.add(Restrictions.eq(propertyName, str));
				}
			}
		} else {
			criterions.add(Restrictions.eq(propertyName, value));
		}
	}

	public void setWhereLike(String propertyName, String str) {
		if (!StringUtils.isEmpty(str)) {
			if (!StringUtils.startsWith(str, "*")) {
				str = "*" + str;
			}

			if (!StringUtils.endsWith(str, "*")) {
				str = str + "*";
			}

			setWhere(propertyName, str);
		}
	}

	public void setWhereOr(Criterion... criterions) {
		Disjunction or = Restrictions.disjunction();
		for (Criterion criterion : criterions) {
			or.add(criterion);
		}
		this.criterions.add(or);
	}

	public void setWhereOr(List<Criterion> criterions) {
		Disjunction or = Restrictions.disjunction();
		for (Criterion criterion : criterions) {
			or.add(criterion);
		}
		this.criterions.add(or);
	}

	public void setWhere(Criterion criterion) {
		criterions.add(criterion);
	}

	public void setWhere(Projection projection) {
		this.projection = projection;
	}

	@Transient
	public Projection getProjection() {
		return projection;
	}

	public void setWhereBetween(String propertyName, Object lo, Object hi) {
		if (null != lo && null != hi) {
			criterions.add(Restrictions.between(propertyName, lo, hi));
		}
	}

	public void setWhereIn(String propertyName, Collection<?> values) {
		criterions.add(Restrictions.in(propertyName, values));
	}

	public void setWhereIn(String propertyName, Object[] values) {
		criterions.add(Restrictions.in(propertyName, values));
	}

	public void setWhereIp(String propertyName, String value, String propertyIpStartName, String propertyIpEndName) {
		if (null == value) {
			return;
		}

		boolean flag = Text.isIpv4(value);
		if (flag) {
			long[] ipLong = Text.ipToLong2(value);
			criterions.add(Restrictions.or(
					Restrictions.eq(propertyName, value),
					Restrictions.and(Restrictions.le(propertyIpStartName, ipLong[0]),
							Restrictions.ge(propertyIpEndName, ipLong[1]))));
		} else {
			setWhere(propertyName, value);
		}

	}

	@Transient
	public List<Criterion> getMembersCriterions(String propertyName, Object value, String seperator) {
		List<Criterion> criterionLists = new ArrayList<>();

		if (value instanceof String) {
			String str = (String) value;

			if (!StringUtils.isEmpty(str)) {
				if (StringUtils.startsWith(str, "*") || StringUtils.endsWith(str, "*")) {
					str = StringUtils.removeEnd(str, "*");
					str = StringUtils.removeStart(str, "*");
					criterionLists.add(Restrictions.like(propertyName, str, MatchMode.ANYWHERE));
				} else {
					String strValue = seperator + str + seperator;
					criterionLists.add(Restrictions.sqlRestriction("'" + seperator + "' || " + propertyName + " || '"
							+ seperator + "' like '%" + strValue + "%'"));
				}
			}
		}

		return criterionLists;
	}
}
