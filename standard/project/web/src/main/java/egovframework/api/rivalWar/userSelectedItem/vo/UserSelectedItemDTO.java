package egovframework.api.rivalWar.userSelectedItem.vo;

import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;
import org.hibernate.annotations.*;
import org.hibernate.annotations.Cache;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * Created by Administrator on 2017-10-14.
 */
@Entity
@Table(name = "T_USER_SELECTED_ITEM")
@SelectBeforeUpdate(value = true)
@DynamicInsert(value = true)
@DynamicUpdate(value = true)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SequenceGenerator(name = "JsTreeSequence", sequenceName = "S_USER_SELECTED_ITEM", allocationSize = 1)
public class UserSelectedItemDTO extends JsTreeHibernateSearchDTO implements Serializable {

    private static final long serialVersionUID = 4641920581390357828L;

    public UserSelectedItemDTO() {
        super();
    }

    public UserSelectedItemDTO(Boolean copyBooleanValue) {
        super();
        this.copyBooleanValue = copyBooleanValue;
    }

    /*
	 * Extend Bean Field
	 */
    private Boolean copyBooleanValue;

    @Transient
    public Boolean getCopyBooleanValue() {
        copyBooleanValue = false;
        if (this.getCopy() == 0) {
            copyBooleanValue = false;
        } else {
            copyBooleanValue = true;
        }
        return copyBooleanValue;
    }

    public void setCopyBooleanValue(Boolean copyBooleanValue) {
        this.copyBooleanValue = copyBooleanValue;
    }

    private String  userCID;         // 사용자 아이디
    @Column(name = "USER_CID")
    public String getUserCID() {
        return userCID;
    }
    public void setUserCID(String userCID) {
        this.userCID = userCID;
    }

    private Number  menuCID;         // 사용자가 선택한 아이템의 메뉴
    @Column(name = "MENU_CID")
    public Number getMenuCID() {
        return menuCID;
    }

    public void setMenuCID(Number menuCID) {
        this.menuCID = menuCID;
    }

    private Number  compareItemCID;  // 사용자 선택 아이템(진영)
    @Column(name = "COMPARE_ITEM_CID")
    public Number getCompareItemCID() {
        return compareItemCID;
    }

    public void setCompareItemCID(Number compareItemCID) {
        this.compareItemCID = compareItemCID;
    }

    @Override
    public <T extends JsTreeHibernateSearchDTO> void setFieldFromNewInstance(T paramInstance) {
        if (paramInstance instanceof UserSelectedItemDTO) {

        }
    }
}
