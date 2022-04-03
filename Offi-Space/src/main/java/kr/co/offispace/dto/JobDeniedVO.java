package kr.co.offispace.dto;

import java.util.Date;

public class JobDeniedVO {

    private String jobCode;
    private Date jobDeniedDate;
    private String jobDeniedReason;

	public String getJobCode() {
		return jobCode;
	}
	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}
	public Date getJobDeniedDate() {
		return jobDeniedDate;
	}
	public void setJobDeniedDate(Date jobDeniedDate) {
		this.jobDeniedDate = jobDeniedDate;
	}
	public String getJobDeniedReason() {
		return jobDeniedReason;
	}
	public void setJobDeniedReason(String jobDeniedReason) {
		this.jobDeniedReason = jobDeniedReason;
	}
	@Override
	public String toString() {
		return "JobDeniedVO [jobCode=" + jobCode + ", jobDeniedDate=" + jobDeniedDate + ", jobDeniedReason="
				+ jobDeniedReason + "]";
	}


}
