package egovframework.api.rivalWar.aggregateResult.vo;

import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;

import javax.persistence.Transient;
import java.io.Serializable;

/**
 * Created by Administrator on 2017-08-29.
 */
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

    @Override
    public <T extends JsTreeHibernateSearchDTO> void setFieldFromNewInstance(T paramInstance) {
        if (paramInstance instanceof AggregateResultDTO) {
            //this.setC_vote_start_date(this.getC_vote_start_date());
        }
    }
}
