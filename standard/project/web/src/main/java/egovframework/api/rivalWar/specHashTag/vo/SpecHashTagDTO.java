package egovframework.api.rivalWar.specHashTag.vo;

import com.fasterxml.jackson.annotation.JsonBackReference;
import egovframework.api.rivalWar.compareItem.vo.CompareItemDTO;
import egovframework.api.rivalWar.menu.vo.MenuDTO;
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
@Table(name = "T_JSTREE_SPEC_HASH_TAG")
@SelectBeforeUpdate(value = true)
@DynamicInsert(value = true)
@DynamicUpdate(value = true)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SequenceGenerator(name = "JsTreeSequence", sequenceName = "S_JSTREE_SPEC_HASH_TAG", allocationSize = 1)
public class SpecHashTagDTO extends JsTreeHibernateSearchDTO implements Serializable {

    private static final long serialVersionUID = 4641920583190357882L;

    public SpecHashTagDTO() {
        super();
    }

    public SpecHashTagDTO(Boolean copyBooleanValue) {
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

    private String  tagName; //해시태그 이름
    @Column(name = "TAG_NAME")
    public String getTagName() {
        return tagName;
    }

    public void setTagName(String tagName) {
        this.tagName = tagName;
    }

    private String  tagSourceChatID;    //결국 chat 안으로 들어갈테니까
    @Column(name = "TAG_SOURCE_CHAT_ID")
    public String getTagSourceChatID() {
        return tagSourceChatID;
    }

    public void setTagSourceChatID(String tagSourceChatID) {
        this.tagSourceChatID = tagSourceChatID;
    }

    @Override
    public <T extends JsTreeHibernateSearchDTO> void setFieldFromNewInstance(T paramInstance) {
        if (paramInstance instanceof SpecHashTagDTO) {

        }
    }

    private CompareItemDTO  compareItemDTO;
    //영속성 전이 설정, 어떤 아이템에 해당하는 해쉬태그인지 구분
    @JsonBackReference
    @ManyToOne(fetch=FetchType.LAZY)   //Lazy Loading 설정
    @JoinColumn(name="MAPPING_COMPARE_ID") //조인 컬럼 설정
    public CompareItemDTO getCompareItemDTO() {
        return compareItemDTO;
    }

    public void setCompareItemDTO(CompareItemDTO compareItemDTO) {
        this.compareItemDTO = compareItemDTO;
    }
}
