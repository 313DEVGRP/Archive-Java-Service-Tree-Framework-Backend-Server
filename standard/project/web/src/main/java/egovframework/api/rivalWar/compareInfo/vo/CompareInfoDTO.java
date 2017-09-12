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
    private String topVenderText;

    private String topPost1Icon;
    private String topPost1Url;
    private String topPost1Text;

    private String topPost2Icon;
    private String topPost2Url;
    private String topPost2Text;

    private String topPost3Icon;
    private String topPost3Url;
    private String topPost3Text;

    private String topPost4Icon;
    private String topPost4Url;
    private String topPost4Text;

    private String topPost5Icon;
    private String topPost5Url;
    private String topPost5Text;

    @Column(name = "top_image_url_1")
    public String getTopImageUrl1() {
        return topImageUrl1;
    }

    public void setTopImageUrl1(String topImageUrl1) {
        this.topImageUrl1 = topImageUrl1;
    }

    @Column(name = "top_image_url_2")
    public String getTopImageUrl2() {
        return topImageUrl2;
    }

    public void setTopImageUrl2(String topImageUrl2) {
        this.topImageUrl2 = topImageUrl2;
    }

    @Column(name = "top_image_url_3")
    public String getTopImageUrl3() {
        return topImageUrl3;
    }

    public void setTopImageUrl3(String topImageUrl3) {
        this.topImageUrl3 = topImageUrl3;
    }

    @Column(name = "top_vender_url")
    public String getTopVenderUrl() {
        return topVenderUrl;
    }

    public void setTopVenderUrl(String topVenderUrl) {
        this.topVenderUrl = topVenderUrl;
    }

    @Column(name = "top_vender_text")
    public String getTopVenderText() {
        return topVenderText;
    }

    public void setTopVenderText(String topVenderText) {
        this.topVenderText = topVenderText;
    }

    @Column(name = "top_post1_icon")
    public String getTopPost1Icon() {
        return topPost1Icon;
    }

    public void setTopPost1Icon(String topPost1Icon) {
        this.topPost1Icon = topPost1Icon;
    }

    @Column(name = "top_post1_url")
    public String getTopPost1Url() {
        return topPost1Url;
    }

    public void setTopPost1Url(String topPost1Url) {
        this.topPost1Url = topPost1Url;
    }

    @Column(name = "top_post1_text")
    public String getTopPost1Text() {
        return topPost1Text;
    }

    public void setTopPost1Text(String topPost1Text) {
        this.topPost1Text = topPost1Text;
    }

    @Column(name = "top_post2_icon")
    public String getTopPost2Icon() {
        return topPost2Icon;
    }

    public void setTopPost2Icon(String topPost2Icon) {
        this.topPost2Icon = topPost2Icon;
    }

    @Column(name = "top_post2_url")
    public String getTopPost2Url() {
        return topPost2Url;
    }

    public void setTopPost2Url(String topPost2Url) {
        this.topPost2Url = topPost2Url;
    }

    @Column(name = "top_post2_text")
    public String getTopPost2Text() {
        return topPost2Text;
    }

    public void setTopPost2Text(String topPost2Text) {
        this.topPost2Text = topPost2Text;
    }

    @Column(name = "top_post3_icon")
    public String getTopPost3Icon() {
        return topPost3Icon;
    }

    public void setTopPost3Icon(String topPost3Icon) {
        this.topPost3Icon = topPost3Icon;
    }

    @Column(name = "top_post3_url")
    public String getTopPost3Url() {
        return topPost3Url;
    }

    public void setTopPost3Url(String topPost3Url) {
        this.topPost3Url = topPost3Url;
    }

    @Column(name = "top_post3_text")
    public String getTopPost3Text() {
        return topPost3Text;
    }

    public void setTopPost3Text(String topPost3Text) {
        this.topPost3Text = topPost3Text;
    }

    @Column(name = "top_post4_icon")
    public String getTopPost4Icon() {
        return topPost4Icon;
    }

    public void setTopPost4Icon(String topPost4Icon) {
        this.topPost4Icon = topPost4Icon;
    }

    @Column(name = "top_post4_url")
    public String getTopPost4Url() {
        return topPost4Url;
    }

    public void setTopPost4Url(String topPost4Url) {
        this.topPost4Url = topPost4Url;
    }

    @Column(name = "top_post4_text")
    public String getTopPost4Text() {
        return topPost4Text;
    }

    public void setTopPost4Text(String topPost4Text) {
        this.topPost4Text = topPost4Text;
    }

    @Column(name = "top_post5_icon")
    public String getTopPost5Icon() {
        return topPost5Icon;
    }

    public void setTopPost5Icon(String topPost5Icon) {
        this.topPost5Icon = topPost5Icon;
    }

    @Column(name = "top_post5_url")
    public String getTopPost5Url() {
        return topPost5Url;
    }

    public void setTopPost5Url(String topPost5Url) {
        this.topPost5Url = topPost5Url;
    }

    @Column(name = "top_post5_text")
    public String getTopPost5Text() {
        return topPost5Text;
    }

    public void setTopPost5Text(String topPost5Text) {
        this.topPost5Text = topPost5Text;
    }

    private String midImageUrl1;
    private String midImageUrl2;
    private String midImageUrl3;

    private String midVenderUrl;
    private String midVenderText;

    private String midPost1Icon;
    private String midPost1Url;
    private String midPost1Text;

    private String midPost2Icon;
    private String midPost2Url;
    private String midPost2Text;

    private String midPost3Icon;
    private String midPost3Url;
    private String midPost3Text;

    private String midPost4Icon;
    private String midPost4Url;
    private String midPost4Text;

    private String midPost5Icon;
    private String midPost5Url;
    private String midPost5Text;

    @Column(name = "mid_image_url_1")
    public String getMidImageUrl1() {
        return midImageUrl1;
    }

    public void setMidImageUrl1(String midImageUrl1) {
        this.midImageUrl1 = midImageUrl1;
    }

    @Column(name = "mid_image_url_2")
    public String getMidImageUrl2() {
        return midImageUrl2;
    }

    public void setMidImageUrl2(String midImageUrl2) {
        this.midImageUrl2 = midImageUrl2;
    }

    @Column(name = "mid_image_url_3")
    public String getMidImageUrl3() {
        return midImageUrl3;
    }

    public void setMidImageUrl3(String midImageUrl3) {
        this.midImageUrl3 = midImageUrl3;
    }

    @Column(name = "mid_vender_url")
    public String getMidVenderUrl() {
        return midVenderUrl;
    }

    public void setMidVenderUrl(String midVenderUrl) {
        this.midVenderUrl = midVenderUrl;
    }

    @Column(name = "mid_vender_text")
    public String getMidVenderText() {
        return midVenderText;
    }

    public void setMidVenderText(String midVenderText) {
        this.midVenderText = midVenderText;
    }

    @Column(name = "mid_post1_icon")
    public String getMidPost1Icon() {
        return midPost1Icon;
    }

    public void setMidPost1Icon(String midPost1Icon) {
        this.midPost1Icon = midPost1Icon;
    }

    @Column(name = "mid_post1_url")
    public String getMidPost1Url() {
        return midPost1Url;
    }

    public void setMidPost1Url(String midPost1Url) {
        this.midPost1Url = midPost1Url;
    }

    @Column(name = "mid_post1_text")
    public String getMidPost1Text() {
        return midPost1Text;
    }

    public void setMidPost1Text(String midPost1Text) {
        this.midPost1Text = midPost1Text;
    }

    @Column(name = "mid_post2_icon")
    public String getMidPost2Icon() {
        return midPost2Icon;
    }

    public void setMidPost2Icon(String midPost2Icon) {
        this.midPost2Icon = midPost2Icon;
    }

    @Column(name = "mid_post2_url")
    public String getMidPost2Url() {
        return midPost2Url;
    }

    public void setMidPost2Url(String midPost2Url) {
        this.midPost2Url = midPost2Url;
    }

    @Column(name = "mid_post2_text")
    public String getMidPost2Text() {
        return midPost2Text;
    }

    public void setMidPost2Text(String midPost2Text) {
        this.midPost2Text = midPost2Text;
    }

    @Column(name = "mid_post3_icon")
    public String getMidPost3Icon() {
        return midPost3Icon;
    }

    public void setMidPost3Icon(String midPost3Icon) {
        this.midPost3Icon = midPost3Icon;
    }

    @Column(name = "mid_post3_url")
    public String getMidPost3Url() {
        return midPost3Url;
    }

    public void setMidPost3Url(String midPost3Url) {
        this.midPost3Url = midPost3Url;
    }

    @Column(name = "mid_post3_text")
    public String getMidPost3Text() {
        return midPost3Text;
    }

    public void setMidPost3Text(String midPost3Text) {
        this.midPost3Text = midPost3Text;
    }

    @Column(name = "mid_post4_icon")
    public String getMidPost4Icon() {
        return midPost4Icon;
    }

    public void setMidPost4Icon(String midPost4Icon) {
        this.midPost4Icon = midPost4Icon;
    }

    @Column(name = "mid_post4_url")
    public String getMidPost4Url() {
        return midPost4Url;
    }

    public void setMidPost4Url(String midPost4Url) {
        this.midPost4Url = midPost4Url;
    }

    @Column(name = "mid_post4_text")
    public String getMidPost4Text() {
        return midPost4Text;
    }

    public void setMidPost4Text(String midPost4Text) {
        this.midPost4Text = midPost4Text;
    }

    @Column(name = "mid_post5_icon")
    public String getMidPost5Icon() {
        return midPost5Icon;
    }

    public void setMidPost5Icon(String midPost5Icon) {
        this.midPost5Icon = midPost5Icon;
    }

    @Column(name = "mid_post5_url")
    public String getMidPost5Url() {
        return midPost5Url;
    }

    public void setMidPost5Url(String midPost5Url) {
        this.midPost5Url = midPost5Url;
    }

    @Column(name = "mid_post5_text")
    public String getMidPost5Text() {
        return midPost5Text;
    }

    public void setMidPost5Text(String midPost5Text) {
        this.midPost5Text = midPost5Text;
    }

    private String botImageUrl1;
    private String botImageUrl2;
    private String botImageUrl3;

    private String botVenderUrl;
    private String botVenderText;

    private String botPost1Icon;
    private String botPost1Url;
    private String botPost1Text;

    private String botPost2Icon;
    private String botPost2Url;
    private String botPost2Text;

    private String botPost3Icon;
    private String botPost3Url;
    private String botPost3Text;

    private String botPost4Icon;
    private String botPost4Url;
    private String botPost4Text;

    private String botPost5Icon;
    private String botPost5Url;
    private String botPost5Text;

    @Column(name = "bot_image_url_1")
    public String getBotImageUrl1() {
        return botImageUrl1;
    }

    public void setBotImageUrl1(String botImageUrl1) {
        this.botImageUrl1 = botImageUrl1;
    }

    @Column(name = "bot_image_url_2")
    public String getBotImageUrl2() {
        return botImageUrl2;
    }

    public void setBotImageUrl2(String botImageUrl2) {
        this.botImageUrl2 = botImageUrl2;
    }

    @Column(name = "bot_image_url_3")
    public String getBotImageUrl3() {
        return botImageUrl3;
    }

    public void setBotImageUrl3(String botImageUrl3) {
        this.botImageUrl3 = botImageUrl3;
    }

    @Column(name = "bot_vender_url")
    public String getBotVenderUrl() {
        return botVenderUrl;
    }

    public void setBotVenderUrl(String botVenderUrl) {
        this.botVenderUrl = botVenderUrl;
    }

    @Column(name = "bot_vender_text")
    public String getBotVenderText() {
        return botVenderText;
    }

    public void setBotVenderText(String botVenderText) {
        this.botVenderText = botVenderText;
    }

    @Column(name = "bot_post1_icon")
    public String getBotPost1Icon() {
        return botPost1Icon;
    }

    public void setBotPost1Icon(String botPost1Icon) {
        this.botPost1Icon = botPost1Icon;
    }

    @Column(name = "bot_post1_url")
    public String getBotPost1Url() {
        return botPost1Url;
    }

    public void setBotPost1Url(String botPost1Url) {
        this.botPost1Url = botPost1Url;
    }

    @Column(name = "bot_post1_text")
    public String getBotPost1Text() {
        return botPost1Text;
    }

    public void setBotPost1Text(String botPost1Text) {
        this.botPost1Text = botPost1Text;
    }

    @Column(name = "bot_post2_icon")
    public String getBotPost2Icon() {
        return botPost2Icon;
    }

    public void setBotPost2Icon(String botPost2Icon) {
        this.botPost2Icon = botPost2Icon;
    }

    @Column(name = "bot_post2_url")
    public String getBotPost2Url() {
        return botPost2Url;
    }

    public void setBotPost2Url(String botPost2Url) {
        this.botPost2Url = botPost2Url;
    }

    @Column(name = "bot_post2_text")
    public String getBotPost2Text() {
        return botPost2Text;
    }

    public void setBotPost2Text(String botPost2Text) {
        this.botPost2Text = botPost2Text;
    }

    @Column(name = "bot_post3_icon")
    public String getBotPost3Icon() {
        return botPost3Icon;
    }

    public void setBotPost3Icon(String botPost3Icon) {
        this.botPost3Icon = botPost3Icon;
    }

    @Column(name = "bot_post3_url")
    public String getBotPost3Url() {
        return botPost3Url;
    }

    public void setBotPost3Url(String botPost3Url) {
        this.botPost3Url = botPost3Url;
    }

    @Column(name = "bot_post3_text")
    public String getBotPost3Text() {
        return botPost3Text;
    }

    public void setBotPost3Text(String botPost3Text) {
        this.botPost3Text = botPost3Text;
    }

    @Column(name = "bot_post4_icon")
    public String getBotPost4Icon() {
        return botPost4Icon;
    }

    public void setBotPost4Icon(String botPost4Icon) {
        this.botPost4Icon = botPost4Icon;
    }

    @Column(name = "bot_post4_url")
    public String getBotPost4Url() {
        return botPost4Url;
    }

    public void setBotPost4Url(String botPost4Url) {
        this.botPost4Url = botPost4Url;
    }

    @Column(name = "bot_post4_text")
    public String getBotPost4Text() {
        return botPost4Text;
    }

    public void setBotPost4Text(String botPost4Text) {
        this.botPost4Text = botPost4Text;
    }

    @Column(name = "bot_post5_icon")
    public String getBotPost5Icon() {
        return botPost5Icon;
    }

    public void setBotPost5Icon(String botPost5Icon) {
        this.botPost5Icon = botPost5Icon;
    }

    @Column(name = "bot_post5_url")
    public String getBotPost5Url() {
        return botPost5Url;
    }

    public void setBotPost5Url(String botPost5Url) {
        this.botPost5Url = botPost5Url;
    }

    @Column(name = "bot_post5_text")
    public String getBotPost5Text() {
        return botPost5Text;
    }

    public void setBotPost5Text(String botPost5Text) {
        this.botPost5Text = botPost5Text;
    }

    @Override
    public <T extends JsTreeHibernateSearchDTO> void setFieldFromNewInstance(T paramInstance) {
        if (paramInstance instanceof CompareInfoDTO) {
            //top
            this.setTopImageUrl1(((CompareInfoDTO) paramInstance).getTopImageUrl1());
            this.setTopImageUrl2(((CompareInfoDTO) paramInstance).getTopImageUrl2());
            this.setTopImageUrl3(((CompareInfoDTO) paramInstance).getTopImageUrl3());

            this.setTopVenderUrl(((CompareInfoDTO) paramInstance).getTopVenderUrl());
            this.setTopVenderText(((CompareInfoDTO) paramInstance).getTopVenderText());

            this.setTopPost1Icon(((CompareInfoDTO) paramInstance).getTopPost1Icon());
            this.setTopPost1Url(((CompareInfoDTO) paramInstance).getTopPost1Url());
            this.setTopPost1Text(((CompareInfoDTO) paramInstance).getTopPost1Text());

            this.setTopPost2Icon(((CompareInfoDTO) paramInstance).getTopPost2Icon());
            this.setTopPost2Url(((CompareInfoDTO) paramInstance).getTopPost2Url());
            this.setTopPost2Text(((CompareInfoDTO) paramInstance).getTopPost2Text());

            this.setTopPost3Icon(((CompareInfoDTO) paramInstance).getTopPost3Icon());
            this.setTopPost3Url(((CompareInfoDTO) paramInstance).getTopPost3Url());
            this.setTopPost3Text(((CompareInfoDTO) paramInstance).getTopPost3Text());

            this.setTopPost4Icon(((CompareInfoDTO) paramInstance).getTopPost4Icon());
            this.setTopPost4Url(((CompareInfoDTO) paramInstance).getTopPost4Url());
            this.setTopPost4Text(((CompareInfoDTO) paramInstance).getTopPost4Text());

            this.setTopPost5Icon(((CompareInfoDTO) paramInstance).getTopPost5Icon());
            this.setTopPost5Url(((CompareInfoDTO) paramInstance).getTopPost5Url());
            this.setTopPost5Text(((CompareInfoDTO) paramInstance).getTopPost5Text());

            //mid
            this.setMidImageUrl1(((CompareInfoDTO) paramInstance).getMidImageUrl1());
            this.setMidImageUrl2(((CompareInfoDTO) paramInstance).getMidImageUrl2());
            this.setMidImageUrl3(((CompareInfoDTO) paramInstance).getMidImageUrl3());

            this.setMidVenderUrl(((CompareInfoDTO) paramInstance).getMidVenderUrl());
            this.setMidVenderText(((CompareInfoDTO) paramInstance).getMidVenderText());

            this.setMidPost1Icon(((CompareInfoDTO) paramInstance).getMidPost1Icon());
            this.setMidPost1Url(((CompareInfoDTO) paramInstance).getMidPost1Url());
            this.setMidPost1Text(((CompareInfoDTO) paramInstance).getMidPost1Text());

            this.setMidPost2Icon(((CompareInfoDTO) paramInstance).getMidPost2Icon());
            this.setMidPost2Url(((CompareInfoDTO) paramInstance).getMidPost2Url());
            this.setMidPost2Text(((CompareInfoDTO) paramInstance).getMidPost2Text());

            this.setMidPost3Icon(((CompareInfoDTO) paramInstance).getMidPost3Icon());
            this.setMidPost3Url(((CompareInfoDTO) paramInstance).getMidPost3Url());
            this.setMidPost3Text(((CompareInfoDTO) paramInstance).getMidPost3Text());

            this.setMidPost4Icon(((CompareInfoDTO) paramInstance).getMidPost4Icon());
            this.setMidPost4Url(((CompareInfoDTO) paramInstance).getMidPost4Url());
            this.setMidPost4Text(((CompareInfoDTO) paramInstance).getMidPost4Text());

            this.setMidPost5Icon(((CompareInfoDTO) paramInstance).getMidPost5Icon());
            this.setMidPost5Url(((CompareInfoDTO) paramInstance).getMidPost5Url());
            this.setMidPost5Text(((CompareInfoDTO) paramInstance).getMidPost5Text());

            //bot
            this.setBotImageUrl1(((CompareInfoDTO) paramInstance).getBotImageUrl1());
            this.setBotImageUrl2(((CompareInfoDTO) paramInstance).getBotImageUrl2());
            this.setBotImageUrl3(((CompareInfoDTO) paramInstance).getBotImageUrl3());

            this.setBotVenderUrl(((CompareInfoDTO) paramInstance).getBotVenderUrl());
            this.setBotVenderText(((CompareInfoDTO) paramInstance).getBotVenderText());

            this.setBotPost1Icon(((CompareInfoDTO) paramInstance).getBotPost1Icon());
            this.setBotPost1Url(((CompareInfoDTO) paramInstance).getBotPost1Url());
            this.setBotPost1Text(((CompareInfoDTO) paramInstance).getBotPost1Text());

            this.setBotPost2Icon(((CompareInfoDTO) paramInstance).getBotPost2Icon());
            this.setBotPost2Url(((CompareInfoDTO) paramInstance).getBotPost2Url());
            this.setBotPost2Text(((CompareInfoDTO) paramInstance).getBotPost2Text());

            this.setBotPost3Icon(((CompareInfoDTO) paramInstance).getBotPost3Icon());
            this.setBotPost3Url(((CompareInfoDTO) paramInstance).getBotPost3Url());
            this.setBotPost3Text(((CompareInfoDTO) paramInstance).getBotPost3Text());

            this.setBotPost4Icon(((CompareInfoDTO) paramInstance).getBotPost4Icon());
            this.setBotPost4Url(((CompareInfoDTO) paramInstance).getBotPost4Url());
            this.setBotPost4Text(((CompareInfoDTO) paramInstance).getBotPost4Text());

            this.setBotPost5Icon(((CompareInfoDTO) paramInstance).getBotPost5Icon());
            this.setBotPost5Url(((CompareInfoDTO) paramInstance).getBotPost5Url());
            this.setBotPost5Text(((CompareInfoDTO) paramInstance).getBotPost5Text());
        }
    }
}
