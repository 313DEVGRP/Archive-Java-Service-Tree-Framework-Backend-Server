package egovframework.api.rivalWar.compareSpec.vo;

import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;
import org.hibernate.annotations.*;
import org.hibernate.annotations.Cache;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "T_JSTREE_COMPARE_SPEC")
@SelectBeforeUpdate(value = true)
@DynamicInsert(value = true)
@DynamicUpdate(value = true)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SequenceGenerator(name = "JsTreeSequence", sequenceName = "S_JSTREE_COMPARE_SPEC", allocationSize = 1)
public class CompareSpecDTO extends JsTreeHibernateSearchDTO implements Serializable {

    private static final long serialVersionUID = 4641920581390357882L;

    /*
	 * Extend Bean Field
	 */
    private Boolean copyBooleanValue;

    public CompareSpecDTO() {
        super();
    }

    public CompareSpecDTO(Boolean copyBooleanValue) {
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

    private String calTime;
    @Column(name = "cal_time")
    public String getCalTime() {
        return calTime;
    }

    public void setCalTime(String calTime) {
        this.calTime = calTime;
    }

    @Override
    public <T extends JsTreeHibernateSearchDTO> void setFieldFromNewInstance(T paramInstance) {
        if (paramInstance instanceof CompareSpecDTO) {
            this.setCalTime(((CompareSpecDTO) paramInstance).getCalTime());

            this.setTopSpecName(((CompareSpecDTO) paramInstance).getTopSpecName());

            this.setTopSpec1Title(((CompareSpecDTO) paramInstance).getTopSpec1Title());
            this.setTopSpec1Amount(((CompareSpecDTO) paramInstance).getTopSpec1Amount());
            this.setTopSpec1Percent(((CompareSpecDTO) paramInstance).getTopSpec1Percent());
            this.setTopSpec1Trend(((CompareSpecDTO) paramInstance).getTopSpec1Trend());
            this.setTopSpec1Graph(((CompareSpecDTO) paramInstance).getTopSpec1Graph());

            this.setTopSpec2Title(((CompareSpecDTO) paramInstance).getTopSpec2Title());
            this.setTopSpec2Amount(((CompareSpecDTO) paramInstance).getTopSpec2Amount());
            this.setTopSpec2Percent(((CompareSpecDTO) paramInstance).getTopSpec2Percent());
            this.setTopSpec2Trend(((CompareSpecDTO) paramInstance).getTopSpec2Trend());
            this.setTopSpec2Graph(((CompareSpecDTO) paramInstance).getTopSpec2Graph());

            this.setTopSpec3Title(((CompareSpecDTO) paramInstance).getTopSpec3Title());
            this.setTopSpec3Amount(((CompareSpecDTO) paramInstance).getTopSpec3Amount());
            this.setTopSpec3Percent(((CompareSpecDTO) paramInstance).getTopSpec3Percent());
            this.setTopSpec3Trend(((CompareSpecDTO) paramInstance).getTopSpec3Trend());
            this.setTopSpec3Graph(((CompareSpecDTO) paramInstance).getTopSpec3Graph());

            this.setTopSpec4Title(((CompareSpecDTO) paramInstance).getTopSpec4Title());
            this.setTopSpec4Amount(((CompareSpecDTO) paramInstance).getTopSpec4Amount());
            this.setTopSpec4Percent(((CompareSpecDTO) paramInstance).getTopSpec4Percent());
            this.setTopSpec4Trend(((CompareSpecDTO) paramInstance).getTopSpec4Trend());
            this.setTopSpec4Graph(((CompareSpecDTO) paramInstance).getTopSpec4Graph());

            this.setTopSpec5Title(((CompareSpecDTO) paramInstance).getTopSpec5Title());
            this.setTopSpec5Amount(((CompareSpecDTO) paramInstance).getTopSpec5Amount());
            this.setTopSpec5Percent(((CompareSpecDTO) paramInstance).getTopSpec5Percent());
            this.setTopSpec5Trend(((CompareSpecDTO) paramInstance).getTopSpec5Trend());
            this.setTopSpec5Graph(((CompareSpecDTO) paramInstance).getTopSpec5Graph());



            this.setMidSpec1Title(((CompareSpecDTO) paramInstance).getMidSpec1Title());
            this.setMidSpec1Amount(((CompareSpecDTO) paramInstance).getMidSpec1Amount());
            this.setMidSpec1Percent(((CompareSpecDTO) paramInstance).getMidSpec1Percent());
            this.setMidSpec1Trend(((CompareSpecDTO) paramInstance).getMidSpec1Trend());
            this.setMidSpec1Graph(((CompareSpecDTO) paramInstance).getMidSpec1Graph());

            this.setMidSpec2Title(((CompareSpecDTO) paramInstance).getMidSpec2Title());
            this.setMidSpec2Amount(((CompareSpecDTO) paramInstance).getMidSpec2Amount());
            this.setMidSpec2Percent(((CompareSpecDTO) paramInstance).getMidSpec2Percent());
            this.setMidSpec2Trend(((CompareSpecDTO) paramInstance).getMidSpec2Trend());
            this.setMidSpec2Graph(((CompareSpecDTO) paramInstance).getMidSpec2Graph());

            this.setMidSpec3Title(((CompareSpecDTO) paramInstance).getMidSpec3Title());
            this.setMidSpec3Amount(((CompareSpecDTO) paramInstance).getMidSpec3Amount());
            this.setMidSpec3Percent(((CompareSpecDTO) paramInstance).getMidSpec3Percent());
            this.setMidSpec3Trend(((CompareSpecDTO) paramInstance).getMidSpec3Trend());
            this.setMidSpec3Graph(((CompareSpecDTO) paramInstance).getMidSpec3Graph());

            this.setMidSpec4Title(((CompareSpecDTO) paramInstance).getMidSpec4Title());
            this.setMidSpec4Amount(((CompareSpecDTO) paramInstance).getMidSpec4Amount());
            this.setMidSpec4Percent(((CompareSpecDTO) paramInstance).getMidSpec4Percent());
            this.setMidSpec4Trend(((CompareSpecDTO) paramInstance).getMidSpec4Trend());
            this.setMidSpec4Graph(((CompareSpecDTO) paramInstance).getMidSpec4Graph());

            this.setMidSpec5Title(((CompareSpecDTO) paramInstance).getMidSpec5Title());
            this.setMidSpec5Amount(((CompareSpecDTO) paramInstance).getMidSpec5Amount());
            this.setMidSpec5Percent(((CompareSpecDTO) paramInstance).getMidSpec5Percent());
            this.setMidSpec5Trend(((CompareSpecDTO) paramInstance).getMidSpec5Trend());
            this.setMidSpec5Graph(((CompareSpecDTO) paramInstance).getMidSpec5Graph());



            this.setBotSpec1Title(((CompareSpecDTO) paramInstance).getBotSpec1Title());
            this.setBotSpec1Amount(((CompareSpecDTO) paramInstance).getBotSpec1Amount());
            this.setBotSpec1Percent(((CompareSpecDTO) paramInstance).getBotSpec1Percent());
            this.setBotSpec1Trend(((CompareSpecDTO) paramInstance).getBotSpec1Trend());
            this.setBotSpec1Graph(((CompareSpecDTO) paramInstance).getBotSpec1Graph());

            this.setBotSpec2Title(((CompareSpecDTO) paramInstance).getBotSpec2Title());
            this.setBotSpec2Amount(((CompareSpecDTO) paramInstance).getBotSpec2Amount());
            this.setBotSpec2Percent(((CompareSpecDTO) paramInstance).getBotSpec2Percent());
            this.setBotSpec2Trend(((CompareSpecDTO) paramInstance).getBotSpec2Trend());
            this.setBotSpec2Graph(((CompareSpecDTO) paramInstance).getBotSpec2Graph());

            this.setBotSpec3Title(((CompareSpecDTO) paramInstance).getBotSpec3Title());
            this.setBotSpec3Amount(((CompareSpecDTO) paramInstance).getBotSpec3Amount());
            this.setBotSpec3Percent(((CompareSpecDTO) paramInstance).getBotSpec3Percent());
            this.setBotSpec3Trend(((CompareSpecDTO) paramInstance).getBotSpec3Trend());
            this.setBotSpec3Graph(((CompareSpecDTO) paramInstance).getBotSpec3Graph());

            this.setBotSpec4Title(((CompareSpecDTO) paramInstance).getBotSpec4Title());
            this.setBotSpec4Amount(((CompareSpecDTO) paramInstance).getBotSpec4Amount());
            this.setBotSpec4Percent(((CompareSpecDTO) paramInstance).getBotSpec4Percent());
            this.setBotSpec4Trend(((CompareSpecDTO) paramInstance).getBotSpec4Trend());
            this.setBotSpec4Graph(((CompareSpecDTO) paramInstance).getBotSpec4Graph());

            this.setBotSpec5Title(((CompareSpecDTO) paramInstance).getBotSpec5Title());
            this.setBotSpec5Amount(((CompareSpecDTO) paramInstance).getBotSpec5Amount());
            this.setBotSpec5Percent(((CompareSpecDTO) paramInstance).getBotSpec5Percent());
            this.setBotSpec5Trend(((CompareSpecDTO) paramInstance).getBotSpec5Trend());
            this.setBotSpec5Graph(((CompareSpecDTO) paramInstance).getBotSpec5Graph());
        }
    }

    private String topSpecName;

    private String topSpec1Title;
    private Long topSpec1Amount;
    private Double topSpec1Percent;
    private Long topSpec1Trend;
    private Double topSpec1Graph;

    private String topSpec2Title;
    private Long topSpec2Amount;
    private Double topSpec2Percent;
    private Long topSpec2Trend;
    private Double topSpec2Graph;

    private String topSpec3Title;
    private Long topSpec3Amount;
    private Double topSpec3Percent;
    private Long topSpec3Trend;
    private Double topSpec3Graph;

    private String topSpec4Title;
    private Long topSpec4Amount;
    private Double topSpec4Percent;
    private Long topSpec4Trend;
    private Double topSpec4Graph;

    private String topSpec5Title;
    private Long topSpec5Amount;
    private Double topSpec5Percent;
    private Long topSpec5Trend;
    private Double topSpec5Graph;

    @Column(name = "top_spec_name")
    public String getTopSpecName() {
        return topSpecName;
    }

    public void setTopSpecName(String topSpecName) {
        this.topSpecName = topSpecName;
    }

    @Column(name = "top_spec1_title")
    public String getTopSpec1Title() {
        return topSpec1Title;
    }

    public void setTopSpec1Title(String topSpec1Title) {
        this.topSpec1Title = topSpec1Title;
    }

    @Column(name = "top_spec1_amount")
    public Long getTopSpec1Amount() {
        return topSpec1Amount;
    }

    public void setTopSpec1Amount(Long topSpec1Amount) {
        this.topSpec1Amount = topSpec1Amount;
    }

    @Column(name = "top_spec1_percent")
    public Double getTopSpec1Percent() {
        return topSpec1Percent;
    }

    public void setTopSpec1Percent(Double topSpec1Percent) {
        this.topSpec1Percent = topSpec1Percent;
    }

    @Column(name = "top_spec1_trend")
    public Long getTopSpec1Trend() {
        return topSpec1Trend;
    }

    public void setTopSpec1Trend(Long topSpec1Trend) {
        this.topSpec1Trend = topSpec1Trend;
    }

    @Column(name = "top_spec1_graph")
    public Double getTopSpec1Graph() {
        return topSpec1Graph;
    }

    public void setTopSpec1Graph(Double topSpec1Graph) {
        this.topSpec1Graph = topSpec1Graph;
    }

    @Column(name = "top_spec2_title")
    public String getTopSpec2Title() {
        return topSpec2Title;
    }

    public void setTopSpec2Title(String topSpec2Title) {
        this.topSpec2Title = topSpec2Title;
    }

    @Column(name = "top_spec2_amount")
    public Long getTopSpec2Amount() {
        return topSpec2Amount;
    }

    public void setTopSpec2Amount(Long topSpec2Amount) {
        this.topSpec2Amount = topSpec2Amount;
    }

    @Column(name = "top_spec2_percent")
    public Double getTopSpec2Percent() {
        return topSpec2Percent;
    }

    public void setTopSpec2Percent(Double topSpec2Percent) {
        this.topSpec2Percent = topSpec2Percent;
    }

    @Column(name = "top_spec2_trend")
    public Long getTopSpec2Trend() {
        return topSpec2Trend;
    }

    public void setTopSpec2Trend(Long topSpec2Trend) {
        this.topSpec2Trend = topSpec2Trend;
    }

    @Column(name = "top_spec2_graph")
    public Double getTopSpec2Graph() {
        return topSpec2Graph;
    }

    public void setTopSpec2Graph(Double topSpec2Graph) {
        this.topSpec2Graph = topSpec2Graph;
    }

    @Column(name = "top_spec3_title")
    public String getTopSpec3Title() {
        return topSpec3Title;
    }

    public void setTopSpec3Title(String topSpec3Title) {
        this.topSpec3Title = topSpec3Title;
    }

    @Column(name = "top_spec3_amount")
    public Long getTopSpec3Amount() {
        return topSpec3Amount;
    }

    public void setTopSpec3Amount(Long topSpec3Amount) {
        this.topSpec3Amount = topSpec3Amount;
    }

    @Column(name = "top_spec3_percent")
    public Double getTopSpec3Percent() {
        return topSpec3Percent;
    }

    public void setTopSpec3Percent(Double topSpec3Percent) {
        this.topSpec3Percent = topSpec3Percent;
    }

    @Column(name = "top_spec3_trend")
    public Long getTopSpec3Trend() {
        return topSpec3Trend;
    }

    public void setTopSpec3Trend(Long topSpec3Trend) {
        this.topSpec3Trend = topSpec3Trend;
    }

    @Column(name = "top_spec3_graph")
    public Double getTopSpec3Graph() {
        return topSpec3Graph;
    }

    public void setTopSpec3Graph(Double topSpec3Graph) {
        this.topSpec3Graph = topSpec3Graph;
    }

    @Column(name = "top_spec4_title")
    public String getTopSpec4Title() {
        return topSpec4Title;
    }

    public void setTopSpec4Title(String topSpec4Title) {
        this.topSpec4Title = topSpec4Title;
    }

    @Column(name = "top_spec4_amount")
    public Long getTopSpec4Amount() {
        return topSpec4Amount;
    }

    public void setTopSpec4Amount(Long topSpec4Amount) {
        this.topSpec4Amount = topSpec4Amount;
    }

    @Column(name = "top_spec4_percent")
    public Double getTopSpec4Percent() {
        return topSpec4Percent;
    }

    public void setTopSpec4Percent(Double topSpec4Percent) {
        this.topSpec4Percent = topSpec4Percent;
    }

    @Column(name = "top_spec4_trend")
    public Long getTopSpec4Trend() {
        return topSpec4Trend;
    }

    public void setTopSpec4Trend(Long topSpec4Trend) {
        this.topSpec4Trend = topSpec4Trend;
    }

    @Column(name = "top_spec4_graph")
    public Double getTopSpec4Graph() {
        return topSpec4Graph;
    }

    public void setTopSpec4Graph(Double topSpec4Graph) {
        this.topSpec4Graph = topSpec4Graph;
    }

    @Column(name = "top_spec5_title")
    public String getTopSpec5Title() {
        return topSpec5Title;
    }

    public void setTopSpec5Title(String topSpec5Title) {
        this.topSpec5Title = topSpec5Title;
    }

    @Column(name = "top_spec5_amount")
    public Long getTopSpec5Amount() {
        return topSpec5Amount;
    }

    public void setTopSpec5Amount(Long topSpec5Amount) {
        this.topSpec5Amount = topSpec5Amount;
    }

    @Column(name = "top_spec5_percent")
    public Double getTopSpec5Percent() {
        return topSpec5Percent;
    }

    public void setTopSpec5Percent(Double topSpec5Percent) {
        this.topSpec5Percent = topSpec5Percent;
    }

    @Column(name = "top_spec5_trend")
    public Long getTopSpec5Trend() {
        return topSpec5Trend;
    }

    public void setTopSpec5Trend(Long topSpec5Trend) {
        this.topSpec5Trend = topSpec5Trend;
    }

    @Column(name = "top_spec5_graph")
    public Double getTopSpec5Graph() {
        return topSpec5Graph;
    }

    public void setTopSpec5Graph(Double topSpec5Graph) {
        this.topSpec5Graph = topSpec5Graph;
    }

    private String midSpecName;

    private String midSpec1Title;
    private Long midSpec1Amount;
    private Double midSpec1Percent;
    private Long midSpec1Trend;
    private Double midSpec1Graph;

    private String midSpec2Title;
    private Long midSpec2Amount;
    private Double midSpec2Percent;
    private Long midSpec2Trend;
    private Double midSpec2Graph;

    private String midSpec3Title;
    private Long midSpec3Amount;
    private Double midSpec3Percent;
    private Long midSpec3Trend;
    private Double midSpec3Graph;

    private String midSpec4Title;
    private Long midSpec4Amount;
    private Double midSpec4Percent;
    private Long midSpec4Trend;
    private Double midSpec4Graph;

    private String midSpec5Title;
    private Long midSpec5Amount;
    private Double midSpec5Percent;
    private Long midSpec5Trend;
    private Double midSpec5Graph;

    @Column(name = "mid_spec_name")
    public String getMidSpecName() {
        return midSpecName;
    }

    public void setMidSpecName(String midSpecName) {
        this.midSpecName = midSpecName;
    }

    @Column(name = "mid_spec1_title")
    public String getMidSpec1Title() {
        return midSpec1Title;
    }

    public void setMidSpec1Title(String midSpec1Title) {
        this.midSpec1Title = midSpec1Title;
    }

    @Column(name = "mid_spec1_amount")
    public Long getMidSpec1Amount() {
        return midSpec1Amount;
    }

    public void setMidSpec1Amount(Long midSpec1Amount) {
        this.midSpec1Amount = midSpec1Amount;
    }

    @Column(name = "mid_spec1_percent")
    public Double getMidSpec1Percent() {
        return midSpec1Percent;
    }

    public void setMidSpec1Percent(Double midSpec1Percent) {
        this.midSpec1Percent = midSpec1Percent;
    }

    @Column(name = "mid_spec1_trend")
    public Long getMidSpec1Trend() {
        return midSpec1Trend;
    }

    public void setMidSpec1Trend(Long midSpec1Trend) {
        this.midSpec1Trend = midSpec1Trend;
    }

    @Column(name = "mid_spec1_graph")
    public Double getMidSpec1Graph() {
        return midSpec1Graph;
    }

    public void setMidSpec1Graph(Double midSpec1Graph) {
        this.midSpec1Graph = midSpec1Graph;
    }

    @Column(name = "mid_spec2_title")
    public String getMidSpec2Title() {
        return midSpec2Title;
    }

    public void setMidSpec2Title(String midSpec2Title) {
        this.midSpec2Title = midSpec2Title;
    }

    @Column(name = "mid_spec2_amount")
    public Long getMidSpec2Amount() {
        return midSpec2Amount;
    }

    public void setMidSpec2Amount(Long midSpec2Amount) {
        this.midSpec2Amount = midSpec2Amount;
    }

    @Column(name = "mid_spec2_percent")
    public Double getMidSpec2Percent() {
        return midSpec2Percent;
    }

    public void setMidSpec2Percent(Double midSpec2Percent) {
        this.midSpec2Percent = midSpec2Percent;
    }

    @Column(name = "mid_spec2_trend")
    public Long getMidSpec2Trend() {
        return midSpec2Trend;
    }

    public void setMidSpec2Trend(Long midSpec2Trend) {
        this.midSpec2Trend = midSpec2Trend;
    }

    @Column(name = "mid_spec2_graph")
    public Double getMidSpec2Graph() {
        return midSpec2Graph;
    }

    public void setMidSpec2Graph(Double midSpec2Graph) {
        this.midSpec2Graph = midSpec2Graph;
    }

    @Column(name = "mid_spec3_title")
    public String getMidSpec3Title() {
        return midSpec3Title;
    }

    public void setMidSpec3Title(String midSpec3Title) {
        this.midSpec3Title = midSpec3Title;
    }

    @Column(name = "mid_spec3_amount")
    public Long getMidSpec3Amount() {
        return midSpec3Amount;
    }

    public void setMidSpec3Amount(Long midSpec3Amount) {
        this.midSpec3Amount = midSpec3Amount;
    }

    @Column(name = "mid_spec3_percent")
    public Double getMidSpec3Percent() {
        return midSpec3Percent;
    }

    public void setMidSpec3Percent(Double midSpec3Percent) {
        this.midSpec3Percent = midSpec3Percent;
    }

    @Column(name = "mid_spec3_trend")
    public Long getMidSpec3Trend() {
        return midSpec3Trend;
    }

    public void setMidSpec3Trend(Long midSpec3Trend) {
        this.midSpec3Trend = midSpec3Trend;
    }

    @Column(name = "mid_spec3_graph")
    public Double getMidSpec3Graph() {
        return midSpec3Graph;
    }

    public void setMidSpec3Graph(Double midSpec3Graph) {
        this.midSpec3Graph = midSpec3Graph;
    }

    @Column(name = "mid_spec4_title")
    public String getMidSpec4Title() {
        return midSpec4Title;
    }

    public void setMidSpec4Title(String midSpec4Title) {
        this.midSpec4Title = midSpec4Title;
    }

    @Column(name = "mid_spec4_amount")
    public Long getMidSpec4Amount() {
        return midSpec4Amount;
    }

    public void setMidSpec4Amount(Long midSpec4Amount) {
        this.midSpec4Amount = midSpec4Amount;
    }

    @Column(name = "mid_spec4_percent")
    public Double getMidSpec4Percent() {
        return midSpec4Percent;
    }

    public void setMidSpec4Percent(Double midSpec4Percent) {
        this.midSpec4Percent = midSpec4Percent;
    }

    @Column(name = "mid_spec4_trend")
    public Long getMidSpec4Trend() {
        return midSpec4Trend;
    }

    public void setMidSpec4Trend(Long midSpec4Trend) {
        this.midSpec4Trend = midSpec4Trend;
    }

    @Column(name = "mid_spec4_graph")
    public Double getMidSpec4Graph() {
        return midSpec4Graph;
    }

    public void setMidSpec4Graph(Double midSpec4Graph) {
        this.midSpec4Graph = midSpec4Graph;
    }

    @Column(name = "mid_spec5_title")
    public String getMidSpec5Title() {
        return midSpec5Title;
    }

    public void setMidSpec5Title(String midSpec5Title) {
        this.midSpec5Title = midSpec5Title;
    }

    @Column(name = "mid_spec5_amount")
    public Long getMidSpec5Amount() {
        return midSpec5Amount;
    }

    public void setMidSpec5Amount(Long midSpec5Amount) {
        this.midSpec5Amount = midSpec5Amount;
    }

    @Column(name = "mid_spec5_percent")
    public Double getMidSpec5Percent() {
        return midSpec5Percent;
    }

    public void setMidSpec5Percent(Double midSpec5Percent) {
        this.midSpec5Percent = midSpec5Percent;
    }

    @Column(name = "mid_spec5_trend")
    public Long getMidSpec5Trend() {
        return midSpec5Trend;
    }

    public void setMidSpec5Trend(Long midSpec5Trend) {
        this.midSpec5Trend = midSpec5Trend;
    }

    @Column(name = "mid_spec5_graph")
    public Double getMidSpec5Graph() {
        return midSpec5Graph;
    }

    public void setMidSpec5Graph(Double midSpec5Graph) {
        this.midSpec5Graph = midSpec5Graph;
    }

    private String botSpecName;

    private String botSpec1Title;
    private Long botSpec1Amount;
    private Double botSpec1Percent;
    private Long botSpec1Trend;
    private Double botSpec1Graph;

    private String botSpec2Title;
    private Long botSpec2Amount;
    private Double botSpec2Percent;
    private Long botSpec2Trend;
    private Double botSpec2Graph;

    private String botSpec3Title;
    private Long botSpec3Amount;
    private Double botSpec3Percent;
    private Long botSpec3Trend;
    private Double botSpec3Graph;

    private String botSpec4Title;
    private Long botSpec4Amount;
    private Double botSpec4Percent;
    private Long botSpec4Trend;
    private Double botSpec4Graph;

    private String botSpec5Title;
    private Long botSpec5Amount;
    private Double botSpec5Percent;
    private Long botSpec5Trend;
    private Double botSpec5Graph;

    @Column(name = "bot_spec_name")
    public String getBotSpecName() {
        return botSpecName;
    }

    public void setBotSpecName(String botSpecName) {
        this.botSpecName = botSpecName;
    }

    @Column(name = "bot_spec1_title")
    public String getBotSpec1Title() {
        return botSpec1Title;
    }

    public void setBotSpec1Title(String botSpec1Title) {
        this.botSpec1Title = botSpec1Title;
    }

    @Column(name = "bot_spec1_amount")
    public Long getBotSpec1Amount() {
        return botSpec1Amount;
    }

    public void setBotSpec1Amount(Long botSpec1Amount) {
        this.botSpec1Amount = botSpec1Amount;
    }

    @Column(name = "bot_spec1_percent")
    public Double getBotSpec1Percent() {
        return botSpec1Percent;
    }

    public void setBotSpec1Percent(Double botSpec1Percent) {
        this.botSpec1Percent = botSpec1Percent;
    }

    @Column(name = "bot_spec1_trend")
    public Long getBotSpec1Trend() {
        return botSpec1Trend;
    }

    public void setBotSpec1Trend(Long botSpec1Trend) {
        this.botSpec1Trend = botSpec1Trend;
    }

    @Column(name = "bot_spec1_graph")
    public Double getBotSpec1Graph() {
        return botSpec1Graph;
    }

    public void setBotSpec1Graph(Double botSpec1Graph) {
        this.botSpec1Graph = botSpec1Graph;
    }

    @Column(name = "bot_spec2_title")
    public String getBotSpec2Title() {
        return botSpec2Title;
    }

    public void setBotSpec2Title(String botSpec2Title) {
        this.botSpec2Title = botSpec2Title;
    }

    @Column(name = "bot_spec2_amount")
    public Long getBotSpec2Amount() {
        return botSpec2Amount;
    }

    public void setBotSpec2Amount(Long botSpec2Amount) {
        this.botSpec2Amount = botSpec2Amount;
    }

    @Column(name = "bot_spec2_percent")
    public Double getBotSpec2Percent() {
        return botSpec2Percent;
    }

    public void setBotSpec2Percent(Double botSpec2Percent) {
        this.botSpec2Percent = botSpec2Percent;
    }

    @Column(name = "bot_spec2_trend")
    public Long getBotSpec2Trend() {
        return botSpec2Trend;
    }

    public void setBotSpec2Trend(Long botSpec2Trend) {
        this.botSpec2Trend = botSpec2Trend;
    }

    @Column(name = "bot_spec2_graph")
    public Double getBotSpec2Graph() {
        return botSpec2Graph;
    }

    public void setBotSpec2Graph(Double botSpec2Graph) {
        this.botSpec2Graph = botSpec2Graph;
    }

    @Column(name = "bot_spec3_title")
    public String getBotSpec3Title() {
        return botSpec3Title;
    }

    public void setBotSpec3Title(String botSpec3Title) {
        this.botSpec3Title = botSpec3Title;
    }

    @Column(name = "bot_spec3_amount")
    public Long getBotSpec3Amount() {
        return botSpec3Amount;
    }

    public void setBotSpec3Amount(Long botSpec3Amount) {
        this.botSpec3Amount = botSpec3Amount;
    }

    @Column(name = "bot_spec3_percent")
    public Double getBotSpec3Percent() {
        return botSpec3Percent;
    }

    public void setBotSpec3Percent(Double botSpec3Percent) {
        this.botSpec3Percent = botSpec3Percent;
    }

    @Column(name = "bot_spec3_trend")
    public Long getBotSpec3Trend() {
        return botSpec3Trend;
    }

    public void setBotSpec3Trend(Long botSpec3Trend) {
        this.botSpec3Trend = botSpec3Trend;
    }

    @Column(name = "bot_spec3_graph")
    public Double getBotSpec3Graph() {
        return botSpec3Graph;
    }

    public void setBotSpec3Graph(Double botSpec3Graph) {
        this.botSpec3Graph = botSpec3Graph;
    }

    @Column(name = "bot_spec4_title")
    public String getBotSpec4Title() {
        return botSpec4Title;
    }

    public void setBotSpec4Title(String botSpec4Title) {
        this.botSpec4Title = botSpec4Title;
    }

    @Column(name = "bot_spec4_amount")
    public Long getBotSpec4Amount() {
        return botSpec4Amount;
    }

    public void setBotSpec4Amount(Long botSpec4Amount) {
        this.botSpec4Amount = botSpec4Amount;
    }

    @Column(name = "bot_spec4_percent")
    public Double getBotSpec4Percent() {
        return botSpec4Percent;
    }

    public void setBotSpec4Percent(Double botSpec4Percent) {
        this.botSpec4Percent = botSpec4Percent;
    }

    @Column(name = "bot_spec4_trend")
    public Long getBotSpec4Trend() {
        return botSpec4Trend;
    }

    public void setBotSpec4Trend(Long botSpec4Trend) {
        this.botSpec4Trend = botSpec4Trend;
    }

    @Column(name = "bot_spec4_graph")
    public Double getBotSpec4Graph() {
        return botSpec4Graph;
    }

    public void setBotSpec4Graph(Double botSpec4Graph) {
        this.botSpec4Graph = botSpec4Graph;
    }

    @Column(name = "bot_spec5_title")
    public String getBotSpec5Title() {
        return botSpec5Title;
    }

    public void setBotSpec5Title(String botSpec5Title) {
        this.botSpec5Title = botSpec5Title;
    }

    @Column(name = "bot_spec5_amount")
    public Long getBotSpec5Amount() {
        return botSpec5Amount;
    }

    public void setBotSpec5Amount(Long botSpec5Amount) {
        this.botSpec5Amount = botSpec5Amount;
    }

    @Column(name = "bot_spec5_percent")
    public Double getBotSpec5Percent() {
        return botSpec5Percent;
    }

    public void setBotSpec5Percent(Double botSpec5Percent) {
        this.botSpec5Percent = botSpec5Percent;
    }

    @Column(name = "bot_spec5_trend")
    public Long getBotSpec5Trend() {
        return botSpec5Trend;
    }

    public void setBotSpec5Trend(Long botSpec5Trend) {
        this.botSpec5Trend = botSpec5Trend;
    }

    @Column(name = "bot_spec5_graph")
    public Double getBotSpec5Graph() {
        return botSpec5Graph;
    }

    public void setBotSpec5Graph(Double botSpec5Graph) {
        this.botSpec5Graph = botSpec5Graph;
    }
}
