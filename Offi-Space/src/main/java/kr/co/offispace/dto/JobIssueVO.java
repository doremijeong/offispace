package kr.co.offispace.dto;

import java.util.Date;

public class JobIssueVO {
	private Date jobIssueDate;
	private String jobIssueReason;
	private String jobIssueEmpCode;
	private String jobCode;
	
	public Date getJobIssueDate() {
		return jobIssueDate;
	}
	public void setJobIssueDate(Date jobIssueDate) {
		this.jobIssueDate = jobIssueDate;
	}
	public String getJobIssueReason() {
		return jobIssueReason;
	}
	public void setJobIssueReason(String jobIssueReason) {
		this.jobIssueReason = jobIssueReason;
	}
	public String getJobIssueEmpCode() {
		return jobIssueEmpCode;
	}
	public void setJobIssueEmpCode(String jobIssueEmpCode) {
		this.jobIssueEmpCode = jobIssueEmpCode;
	}
	public String getJobCode() {
		return jobCode;
	}
	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}
	@Override
	public String toString() {
		return "jobIssue [jobIssueDate=" + jobIssueDate + ", jobIssueReason=" + jobIssueReason + ", jobIssueEmpCode="
				+ jobIssueEmpCode + ", jobCode=" + jobCode + "]";
	}

	

}
