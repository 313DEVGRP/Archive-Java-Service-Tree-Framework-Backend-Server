package egovframework.api.rivalWar.compareInfo.vo;

/**
 * Created by Administrator on 2017-09-03.
 */

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
@Table(name = "T_JSTREE_COMPARE_INFO")
@SelectBeforeUpdate(value = true)
@DynamicInsert(value = true)
@DynamicUpdate(value = true)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SequenceGenerator(name = "JsTreeSequence", sequenceName = "S_JSTREE_COMPARE_INFO", allocationSize = 1)
public class CompareInfoDTO extends JsTreeHibernateSearchDTO implements Serializable {


    private static final long serialVersionUID = 4641929581490357882L;

    /*
	 * Extend Bean Field
	 */
    private Boolean copyBooleanValue;

    public CompareInfoDTO() {
        super();
    }

    public CompareInfoDTO(Boolean copyBooleanValue) {
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

    //image url, vender info ( etc ),
    //link url 1 ~ 5
    private String topImageUrl1;
    private String topImageUrl2;
    private String topImageUrl3;

    private String topVenderUrl;

    private String topPostUrl1;
    private String topPostUrl2;
    private String topPostUrl3;
    private String topPostUrl4;
    private String topPostUrl5;

    public String getTopImageUrl1() {
        return topImageUrl1;
    }

    public void setTopImageUrl1(String topImageUrl1) {
        this.topImageUrl1 = topImageUrl1;
    }

    public String getTopImageUrl2() {
        return topImageUrl2;
    }

    public void setTopImageUrl2(String topImageUrl2) {
        this.topImageUrl2 = topImageUrl2;
    }

    public String getTopImageUrl3() {
        return topImageUrl3;
    }

    public void setTopImageUrl3(String topImageUrl3) {
        this.topImageUrl3 = topImageUrl3;
    }

    public String getTopPostUrl1() {
        return topPostUrl1;
    }

    public void setTopPostUrl1(String topPostUrl1) {
        this.topPostUrl1 = topPostUrl1;
    }

    public String getTopPostUrl2() {
        return topPostUrl2;
    }

    public void setTopPostUrl2(String topPostUrl2) {
        this.topPostUrl2 = topPostUrl2;
    }

    public String getTopPostUrl3() {
        return topPostUrl3;
    }

    public void setTopPostUrl3(String topPostUrl3) {
        this.topPostUrl3 = topPostUrl3;
    }

    public String getTopPostUrl4() {
        return topPostUrl4;
    }

    public void setTopPostUrl4(String topPostUrl4) {
        this.topPostUrl4 = topPostUrl4;
    }

    public String getTopPostUrl5() {
        return topPostUrl5;
    }

    public void setTopPostUrl5(String topPostUrl5) {
        this.topPostUrl5 = topPostUrl5;
    }

    private String midImageUrl1;
    private String midImageUrl2;
    private String midImageUrl3;

    private String midVenderUrl;

    private String midPostUrl1;
    private String midPostUrl2;
    private String midPostUrl3;
    private String midPostUrl4;
    private String midPostUrl5;

    public String getMidImageUrl1() {
        return midImageUrl1;
    }

    public void setMidImageUrl1(String midImageUrl1) {
        this.midImageUrl1 = midImageUrl1;
    }

    public String getMidImageUrl2() {
        return midImageUrl2;
    }

    public void setMidImageUrl2(String midImageUrl2) {
        this.midImageUrl2 = midImageUrl2;
    }

    public String getMidImageUrl3() {
        return midImageUrl3;
    }

    public void setMidImageUrl3(String midImageUrl3) {
        this.midImageUrl3 = midImageUrl3;
    }

    public String getMidPostUrl1() {
        return midPostUrl1;
    }

    public void setMidPostUrl1(String midPostUrl1) {
        this.midPostUrl1 = midPostUrl1;
    }

    public String getMidPostUrl2() {
        return midPostUrl2;
    }

    public void setMidPostUrl2(String midPostUrl2) {
        this.midPostUrl2 = midPostUrl2;
    }

    public String getMidPostUrl3() {
        return midPostUrl3;
    }

    public void setMidPostUrl3(String midPostUrl3) {
        this.midPostUrl3 = midPostUrl3;
    }

    public String getMidPostUrl4() {
        return midPostUrl4;
    }

    public void setMidPostUrl4(String midPostUrl4) {
        this.midPostUrl4 = midPostUrl4;
    }

    public String getMidPostUrl5() {
        return midPostUrl5;
    }

    public void setMidPostUrl5(String midPostUrl5) {
        this.midPostUrl5 = midPostUrl5;
    }

    private String botImageUrl1;
    private String botImageUrl2;
    private String botImageUrl3;

    private String botVenderUrl;

    private String botPostUrl1;
    private String botPostUrl2;
    private String botPostUrl3;
    private String botPostUrl4;
    private String botPostUrl5;

    public String getBotImageUrl1() {
        return botImageUrl1;
    }

    public void setBotImageUrl1(String botImageUrl1) {
        this.botImageUrl1 = botImageUrl1;
    }

    public String getBotImageUrl2() {
        return botImageUrl2;
    }

    public void setBotImageUrl2(String botImageUrl2) {
        this.botImageUrl2 = botImageUrl2;
    }

    public String getBotImageUrl3() {
        return botImageUrl3;
    }

    public void setBotImageUrl3(String botImageUrl3) {
        this.botImageUrl3 = botImageUrl3;
    }

    public String getBotPostUrl1() {
        return botPostUrl1;
    }

    public void setBotPostUrl1(String botPostUrl1) {
        this.botPostUrl1 = botPostUrl1;
    }

    public String getBotPostUrl2() {
        return botPostUrl2;
    }

    public void setBotPostUrl2(String botPostUrl2) {
        this.botPostUrl2 = botPostUrl2;
    }

    public String getBotPostUrl3() {
        return botPostUrl3;
    }

    public void setBotPostUrl3(String botPostUrl3) {
        this.botPostUrl3 = botPostUrl3;
    }

    public String getBotPostUrl4() {
        return botPostUrl4;
    }

    public void setBotPostUrl4(String botPostUrl4) {
        this.botPostUrl4 = botPostUrl4;
    }

    public String getBotPostUrl5() {
        return botPostUrl5;
    }

    public void setBotPostUrl5(String botPostUrl5) {
        this.botPostUrl5 = botPostUrl5;
    }

    @Override
    public <T extends JsTreeHibernateSearchDTO> void setFieldFromNewInstance(T paramInstance) {
        if (paramInstance instanceof CompareInfoDTO) {
        }
    }
}
