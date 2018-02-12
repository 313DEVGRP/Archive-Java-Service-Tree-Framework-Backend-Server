package egovframework.api.rivalWar.specHashTag.vo;

import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.*;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;

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

    private Long  tagSourceChatID;    //결국 chat 안으로 들어갈테니까
    @Column(name = "TAG_SOURCE_CHAT_ID")
    public Long getTagSourceChatID() {
        return tagSourceChatID;
    }

    public void setTagSourceChatID(Long tagSourceChatID) {
        this.tagSourceChatID = tagSourceChatID;
    }

    @Override
    public <T extends JsTreeHibernateSearchDTO> void setFieldFromNewInstance(T paramInstance) {
        if (paramInstance instanceof SpecHashTagDTO) {
            this.setTagName(((SpecHashTagDTO)paramInstance).getTagName());
            this.setTagSourceChatID(((SpecHashTagDTO)paramInstance).getTagSourceChatID());
        }
    }


}
