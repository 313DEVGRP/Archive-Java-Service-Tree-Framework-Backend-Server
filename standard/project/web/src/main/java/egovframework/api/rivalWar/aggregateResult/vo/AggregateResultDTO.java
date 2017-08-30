package egovframework.api.rivalWar.aggregateResult.vo;

import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;
import org.hibernate.annotations.*;
import org.hibernate.annotations.Cache;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * Created by Administrator on 2017-08-29.
 */
@Entity
@Table(name = "T_JSTREE_AGGREGATE_RESULT")
@SelectBeforeUpdate(value = true)
@DynamicInsert(value = true)
@DynamicUpdate(value = true)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SequenceGenerator(name = "JsTreeSequence", sequenceName = "S_JSTREE_AGGREGATE_RESULT", allocationSize = 1)
public class AggregateResultDTO extends JsTreeHibernateSearchDTO implements Serializable {


    private static final long serialVersionUID = 3641929581490357881L;

    /*
	 * Extend Bean Field
	 */
    private Boolean copyBooleanValue;

    public AggregateResultDTO() {
        super();
    }

    public AggregateResultDTO(Boolean copyBooleanValue) {
        super();
        this.copyBooleanValue = copyBooleanValue;
    }

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

    //우위 스펙 갯수: 6 좋아요 획득 갯수 : 3133<br>총 등록 글 : 10,490 총 등록된 해시 태그 : 4300
    private Long numberOfAdvantages;
    private Long likeCount;
    private Long totalRegisteredPosts;
    private Long registeredHashTag;

    @Column(name = "c_number_of_advantages")
    public Long getNumberOfAdvantages() {
        return numberOfAdvantages;
    }

    public void setNumberOfAdvantages(Long numberOfAdvantages) {
        this.numberOfAdvantages = numberOfAdvantages;
    }

    @Column(name = "c_like_count")
    public Long getLikeCount() {
        return likeCount;
    }

    public void setLikeCount(Long likeCount) {
        this.likeCount = likeCount;
    }

    @Column(name = "c_total_registered_posts")
    public Long getTotalRegisteredPosts() {
        return totalRegisteredPosts;
    }

    public void setTotalRegisteredPosts(Long totalRegisteredPosts) {
        this.totalRegisteredPosts = totalRegisteredPosts;
    }

    @Column(name = "c_registered_hash_tag")
    public Long getRegisteredHashTag() {
        return registeredHashTag;
    }

    public void setRegisteredHashTag(Long registeredHashTag) {
        this.registeredHashTag = registeredHashTag;
    }

    @Override
    public <T extends JsTreeHibernateSearchDTO> void setFieldFromNewInstance(T paramInstance) {
        if (paramInstance instanceof AggregateResultDTO) {
            this.setNumberOfAdvantages(this.getNumberOfAdvantages());
            this.setLikeCount(this.getLikeCount());
            this.setTotalRegisteredPosts(this.getTotalRegisteredPosts());
            this.setRegisteredHashTag(this.getRegisteredHashTag());
        }
    }
}
