package egovframework.com.ext.jstree.support.security.database.dao;

import egovframework.com.ext.jstree.support.security.database.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

@Service
public class UserDAO implements GenericDao<User,String> {

    @Autowired
    private HibernateTemplate template;

    @Override
    public User load(final String id) {
        return template.load(User.class,id);
    }

    @Override
    public User get(final String id) {
        return template.get(User.class,id);
    }

    @Override
    public List<User> getAll() {
        return template.loadAll(User.class);
    }

    @Override
    public Serializable save(final User object) {
        return template.save(object);
    }

    @Override
    public void saveOrUpdate(final User object) {
        template.saveOrUpdate(object);
    }

    @Override
    public void delete(final User object) {
        template.delete(object);
    }

    @Override
    public Long count() {
        return new Long(template.loadAll(User.class).size());
    }

    @Override
    public void flush() {
        template.flush();
    }

}
