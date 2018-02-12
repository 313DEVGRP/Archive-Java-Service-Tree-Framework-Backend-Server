package egovframework.api.rivalWar.aggregateResult.vo;

import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;
import org.hibernate.annotations.*;
import org.hibernate.annotations.Cache;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;

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

    //우위 스펙 갯수: 6, 좋아요 획득 갯수 : 3133,총 등록 글 : 10,490, 총 등록된 해시 태그 : 4300
    //graph percent: 15%, score point: 21304 point,
    private String calTime;
    @Column(name = "cal_time")
    public String getCalTime() {
        return calTime;
    }

    public void setCalTime(String calTime) {
        this.calTime = calTime;
    }

    private String topName;
    private Long topNumberOfAdvantages;
    private Long topVersusScore;
    private Long topLikeCount;
    private Long topTotalRegisteredPosts;
    private Long topRegisteredHashTag;
    private Long topGraphPercent;

    private String midName;
    private Long midNumberOfAdvantages;
    private Long midLikeCount;
    private Long midTotalRegisteredPosts;
    private Long midRegisteredHashTag;
    private Long midGraphPercent;
    private Long midVersusScore;

    private String botName;
    private Long botNumberOfAdvantages;
    private Long botLikeCount;
    private Long botTotalRegisteredPosts;
    private Long botRegisteredHashTag;
    private Long botGraphPercent;
    private Long botVersusScore;

    @Column(name = "top_name")
    public String getTopName() {
        return topName;
    }

    public void setTopName(String topName) {
        this.topName = topName;
    }

    @Column(name = "top_number_of_advantages")
    public Long getTopNumberOfAdvantages() {
        return topNumberOfAdvantages;
    }

    public void setTopNumberOfAdvantages(Long topNumberOfAdvantages) {
        this.topNumberOfAdvantages = topNumberOfAdvantages;
    }

    @Column(name = "top_like_count")
    public Long getTopLikeCount() {
        return topLikeCount;
    }

    public void setTopLikeCount(Long topLikeCount) {
        this.topLikeCount = topLikeCount;
    }

    @Column(name = "top_total_registered_posts")
    public Long getTopTotalRegisteredPosts() {
        return topTotalRegisteredPosts;
    }

    public void setTopTotalRegisteredPosts(Long topTotalRegisteredPosts) {
        this.topTotalRegisteredPosts = topTotalRegisteredPosts;
    }

    @Column(name = "top_registered_hash_tag")
    public Long getTopRegisteredHashTag() {
        return topRegisteredHashTag;
    }

    public void setTopRegisteredHashTag(Long topRegisteredHashTag) {
        this.topRegisteredHashTag = topRegisteredHashTag;
    }

    @Column(name = "top_graph_percent")
    public Long getTopGraphPercent() {
        return topGraphPercent;
    }

    public void setTopGraphPercent(Long topGraphPercent) {
        this.topGraphPercent = topGraphPercent;
    }

    @Column(name = "top_versus_score")
    public Long getTopVersusScore() {
        return topVersusScore;
    }

    public void setTopVersusScore(Long topVersusScore) {
        this.topVersusScore = topVersusScore;
    }

    @Column(name = "mid_name")
    public String getMidName() {
        return midName;
    }

    public void setMidName(String midName) {
        this.midName = midName;
    }

    @Column(name = "mid_number_of_advantages")
    public Long getMidNumberOfAdvantages() {
        return midNumberOfAdvantages;
    }

    public void setMidNumberOfAdvantages(Long midNumberOfAdvantages) {
        this.midNumberOfAdvantages = midNumberOfAdvantages;
    }

    @Column(name = "mid_like_count")
    public Long getMidLikeCount() {
        return midLikeCount;
    }

    public void setMidLikeCount(Long midLikeCount) {
        this.midLikeCount = midLikeCount;
    }

    @Column(name = "mid_total_registered_posts")
    public Long getMidTotalRegisteredPosts() {
        return midTotalRegisteredPosts;
    }

    public void setMidTotalRegisteredPosts(Long midTotalRegisteredPosts) {
        this.midTotalRegisteredPosts = midTotalRegisteredPosts;
    }

    @Column(name = "mid_registered_hash_tag")
    public Long getMidRegisteredHashTag() {
        return midRegisteredHashTag;
    }

    public void setMidRegisteredHashTag(Long midRegisteredHashTag) {
        this.midRegisteredHashTag = midRegisteredHashTag;
    }

    @Column(name = "mid_graph_percent")
    public Long getMidGraphPercent() {
        return midGraphPercent;
    }

    public void setMidGraphPercent(Long midGraphPercent) {
        this.midGraphPercent = midGraphPercent;
    }

    @Column(name = "mid_versus_score")
    public Long getMidVersusScore() {
        return midVersusScore;
    }

    public void setMidVersusScore(Long midVersusScore) {
        this.midVersusScore = midVersusScore;
    }

    @Column(name = "bot_name")
    public String getBotName() {
        return botName;
    }

    public void setBotName(String botName) {
        this.botName = botName;
    }

    @Column(name = "bot_number_of_advantages")
    public Long getBotNumberOfAdvantages() {
        return botNumberOfAdvantages;
    }

    public void setBotNumberOfAdvantages(Long botNumberOfAdvantages) {
        this.botNumberOfAdvantages = botNumberOfAdvantages;
    }

    @Column(name = "bot_like_count")
    public Long getBotLikeCount() {
        return botLikeCount;
    }

    public void setBotLikeCount(Long botLikeCount) {
        this.botLikeCount = botLikeCount;
    }

    @Column(name = "bot_total_registered_posts")
    public Long getBotTotalRegisteredPosts() {
        return botTotalRegisteredPosts;
    }

    public void setBotTotalRegisteredPosts(Long botTotalRegisteredPosts) {
        this.botTotalRegisteredPosts = botTotalRegisteredPosts;
    }

    @Column(name = "bot_registered_hash_tag")
    public Long getBotRegisteredHashTag() {
        return botRegisteredHashTag;
    }

    public void setBotRegisteredHashTag(Long botRegisteredHashTag) {
        this.botRegisteredHashTag = botRegisteredHashTag;
    }

    @Column(name = "bot_graph_percent")
    public Long getBotGraphPercent() {
        return botGraphPercent;
    }

    public void setBotGraphPercent(Long botGraphPercent) {
        this.botGraphPercent = botGraphPercent;
    }

    @Column(name = "bot_versus_score")
    public Long getBotVersusScore() {
        return botVersusScore;
    }

    public void setBotVersusScore(Long botVersusScore) {
        this.botVersusScore = botVersusScore;
    }

    //Total Traffic : 24 541, Unique Visits : 14 778, Revenue : $3 583.18, Total Sales : $59 871.12
    private Long totalTraffic;
    private Long uniqueVisit;
    private Long revisitCount;
    private Long pageView;

    @Column(name = "total_traffic")
    public Long getTotalTraffic() {
        return totalTraffic;
    }

    public void setTotalTraffic(Long totalTraffic) {
        this.totalTraffic = totalTraffic;
    }

    @Column(name = "unique_visit")
    public Long getUniqueVisit() {
        return uniqueVisit;
    }

    public void setUniqueVisit(Long uniqueVisit) {
        this.uniqueVisit = uniqueVisit;
    }

    @Column(name = "revisit_count")
    public Long getRevisitCount() {
        return revisitCount;
    }

    public void setRevisitCount(Long revisitCount) {
        this.revisitCount = revisitCount;
    }

    @Column(name = "page_view")
    public Long getPageView() {
        return pageView;
    }

    public void setPageView(Long pageView) {
        this.pageView = pageView;
    }

    //등록된 글 총합: 19,23 좋아요 선택 총합: 2,443(21.2%) 추가된 스펙개수: 7개 등록된 해시태그 총합: 13,233개
    private Long totalArticle;
    private Long totalLikeCount;
    private Long totalSpecCount;
    private Long totalHashCount;

    @Column(name = "total_article")
    public Long getTotalArticle() {
        return totalArticle;
    }

    public void setTotalArticle(Long totalArticle) {
        this.totalArticle = totalArticle;
    }

    @Column(name = "total_like_count")
    public Long getTotalLikeCount() {
        return totalLikeCount;
    }

    public void setTotalLikeCount(Long totalLikeCount) {
        this.totalLikeCount = totalLikeCount;
    }

    @Column(name = "total_spec_count")
    public Long getTotalSpecCount() {
        return totalSpecCount;
    }

    public void setTotalSpecCount(Long totalSpecCount) {
        this.totalSpecCount = totalSpecCount;
    }

    @Column(name = "total_hash_count")
    public Long getTotalHashCount() {
        return totalHashCount;
    }

    public void setTotalHashCount(Long totalHashCount) {
        this.totalHashCount = totalHashCount;
    }

    // 표준오차: 64821, 등분상 가정 유의확률: 124 유의확률: 823, 99% 신뢰구간 하한: -23134 상한: 235421 T분포결과: 8.423
    private Double standardError;
    private Double equilibriumAssumption;
    private Double probability;
    private Double lowerLimit;
    private Double higherLimit;
    private Double distributionTResult;

    @Column(name = "standard_error")
    public Double getStandardError() {
        return standardError;
    }

    public void setStandardError(Double standardError) {
        this.standardError = standardError;
    }

    @Column(name = "equilibrium_assumption")
    public Double getEquilibriumAssumption() {
        return equilibriumAssumption;
    }

    public void setEquilibriumAssumption(Double equilibriumAssumption) {
        this.equilibriumAssumption = equilibriumAssumption;
    }

    @Column(name = "probability")
    public Double getProbability() {
        return probability;
    }

    public void setProbability(Double probability) {
        this.probability = probability;
    }

    @Column(name = "lower_limit")
    public Double getLowerLimit() {
        return lowerLimit;
    }

    public void setLowerLimit(Double lowerLimit) {
        this.lowerLimit = lowerLimit;
    }

    @Column(name = "higher_limit")
    public Double getHigherLimit() {
        return higherLimit;
    }

    public void setHigherLimit(Double higherLimit) {
        this.higherLimit = higherLimit;
    }

    @Column(name = "distribution_t_result")
    public Double getDistributionTResult() {
        return distributionTResult;
    }

    public void setDistributionTResult(Double distributionTResult) {
        this.distributionTResult = distributionTResult;
    }

    @Override
    public <T extends JsTreeHibernateSearchDTO> void setFieldFromNewInstance(T paramInstance) {
        if (paramInstance instanceof AggregateResultDTO) {

            this.setCalTime(((AggregateResultDTO) paramInstance).getCalTime());

            this.setTopName(((AggregateResultDTO) paramInstance).getTopName());
            this.setTopNumberOfAdvantages(((AggregateResultDTO) paramInstance).getTopNumberOfAdvantages());
            this.setTopLikeCount(((AggregateResultDTO) paramInstance).getTopLikeCount());
            this.setTopTotalRegisteredPosts(((AggregateResultDTO) paramInstance).getTopTotalRegisteredPosts());
            this.setTopRegisteredHashTag(((AggregateResultDTO) paramInstance).getTopRegisteredHashTag());
            this.setTopGraphPercent(((AggregateResultDTO) paramInstance).getTopGraphPercent());
            this.setTopVersusScore(((AggregateResultDTO) paramInstance).getTopVersusScore());

            this.setMidName(((AggregateResultDTO) paramInstance).getMidName());
            this.setMidNumberOfAdvantages(((AggregateResultDTO) paramInstance).getMidNumberOfAdvantages());
            this.setMidLikeCount(((AggregateResultDTO) paramInstance).getMidLikeCount());
            this.setMidTotalRegisteredPosts(((AggregateResultDTO) paramInstance).getMidTotalRegisteredPosts());
            this.setMidRegisteredHashTag(((AggregateResultDTO) paramInstance).getMidRegisteredHashTag());
            this.setMidGraphPercent(((AggregateResultDTO) paramInstance).getMidGraphPercent());
            this.setMidVersusScore(((AggregateResultDTO) paramInstance).getMidVersusScore());

            this.setBotName(((AggregateResultDTO) paramInstance).getBotName());
            this.setBotNumberOfAdvantages(((AggregateResultDTO) paramInstance).getBotNumberOfAdvantages());
            this.setBotLikeCount(((AggregateResultDTO) paramInstance).getBotLikeCount());
            this.setBotTotalRegisteredPosts(((AggregateResultDTO) paramInstance).getBotTotalRegisteredPosts());
            this.setBotRegisteredHashTag(((AggregateResultDTO) paramInstance).getBotRegisteredHashTag());
            this.setBotGraphPercent(((AggregateResultDTO) paramInstance).getBotGraphPercent());
            this.setBotVersusScore(((AggregateResultDTO) paramInstance).getBotVersusScore());

            this.setTotalTraffic(((AggregateResultDTO) paramInstance).getTotalTraffic());
            this.setUniqueVisit(((AggregateResultDTO) paramInstance).getUniqueVisit());
            this.setRevisitCount(((AggregateResultDTO) paramInstance).getRevisitCount());
            this.setPageView(((AggregateResultDTO) paramInstance).getPageView());

            this.setTotalArticle(((AggregateResultDTO) paramInstance).getTotalArticle());
            this.setTotalLikeCount(((AggregateResultDTO) paramInstance).getTotalLikeCount());
            this.setTotalSpecCount(((AggregateResultDTO) paramInstance).getTotalSpecCount());
            this.setTotalHashCount(((AggregateResultDTO) paramInstance).getTotalHashCount());

            this.setStandardError(((AggregateResultDTO) paramInstance).getStandardError());
            this.setEquilibriumAssumption(((AggregateResultDTO) paramInstance).getEquilibriumAssumption());
            this.setProbability(((AggregateResultDTO) paramInstance).getProbability());
            this.setLowerLimit(((AggregateResultDTO) paramInstance).getLowerLimit());
            this.setHigherLimit(((AggregateResultDTO) paramInstance).getHigherLimit());

            this.setDistributionTResult(((AggregateResultDTO) paramInstance).getDistributionTResult());
        }
    }
}
