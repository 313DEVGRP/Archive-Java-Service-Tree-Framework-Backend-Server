package egovframework.com.ext.jstree.support.security.database.model;

import egovframework.com.ext.jstree.support.security.database.model.User;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.SelectBeforeUpdate;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;

/**
 * @author <a href="mailto:psunil1278@gmail.com">Sunil Kumar</a>
 * @since 25/12/15
 */
@Entity
@Table(name = "TEST_DB.T_ROLE")
@SelectBeforeUpdate(value=true)
@DynamicInsert(value=true)
@DynamicUpdate(value=true)
@SequenceGenerator(name = "RoleSequence", sequenceName = "TEST_DB.S_ROLE_HIBER", allocationSize = 1)
public class Role implements Serializable {

    @Id
    @GeneratedValue(strategy= GenerationType.SEQUENCE, generator="RoleSequence")
    @Column(name = "ROLE_ID", unique = true, nullable = false)
    private Integer roleId;

    @Column(name = "NAME", nullable = false, length = 32)
    private String name;

    @ManyToMany(mappedBy = "roles")
    private Set<User> users = new HashSet<>();

    public Role() {
    }

    public Role(final Integer roleId, final String name, final Set<User> users) {
        this.roleId = roleId;
        this.name = name;
        this.users = users;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(final Integer roleId) {
        this.roleId = roleId;
    }

    public String getName() {
        return name;
    }

    public void setName(final String name) {
        this.name = name;
    }

    public Set<User> getUsers() {
        return users;
    }

    public void setUsers(final Set<User> users) {
        this.users = users;
    }

    public void addUser(final User user)
    {
        this.users.add(user);
    }
}
