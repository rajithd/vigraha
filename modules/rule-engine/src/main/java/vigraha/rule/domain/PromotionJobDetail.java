package vigraha.rule.domain;


import org.quartz.JobDetail;

public class PromotionJobDetail extends JobDetail {

    private long jobId = 0;

    public PromotionJobDetail(String name, String group, Class jobClass) {
        super(name, group, jobClass);
    }

    public long getJobId() {
        return jobId;
    }

    public void setJobId(long jobId) {
        this.jobId = jobId;
    }
}
