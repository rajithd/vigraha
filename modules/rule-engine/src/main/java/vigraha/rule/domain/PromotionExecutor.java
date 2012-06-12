package vigraha.rule.domain;


public class PromotionExecutor {
    
    private int id;
    private int promotionRuleId;
    private String executeTime;
    private String promotionNumber;
    private String startDate;
    private String endDate;
    private String basedOn;

    public String getBasedOn() {
        return basedOn;
    }

    public void setBasedOn(String basedOn) {
        this.basedOn = basedOn;
    }

    public int getPromotionRuleId() {
        return promotionRuleId;
    }

    public void setPromotionRuleId(int promotionRuleId) {
        this.promotionRuleId = promotionRuleId;
    }

    public String getExecuteTime() {
        return executeTime;
    }

    public void setExecuteTime(String executeTime) {
        this.executeTime = executeTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPromotionNumber() {
        return promotionNumber;
    }

    public void setPromotionNumber(String promotionNumber) {
        this.promotionNumber = promotionNumber;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }
}
