package vigraha.rule.domain;


public class Promotion {
    
    private int promotionId;
    private String startDate;
    private String endDate;
    private String executeTime;
    private String promotionNumber;

    public int getPromotionId() {
        return promotionId;
    }

    public void setPromotionId(int promotionId) {
        this.promotionId = promotionId;
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

    public String getExecuteTime() {
        return executeTime;
    }

    public void setExecuteTime(String executeTime) {
        this.executeTime = executeTime;
    }

    public String getPromotionNumber() {
        return promotionNumber;
    }

    public void setPromotionNumber(String promotionNumber) {
        this.promotionNumber = promotionNumber;
    }
}
