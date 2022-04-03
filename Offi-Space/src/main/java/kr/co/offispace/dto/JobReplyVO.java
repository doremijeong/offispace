package kr.co.offispace.dto;

import java.util.Date;

public class JobReplyVO {
	
	private String jobReplyCode;
	private String jobReplyWriter;
	private String jobReplyContent;
	private Date replyWriteDt;
	private Date replyModifyDt;
	private String jobCode;
	
	private String replyModifyDate;
	
	private EmployeeVO jobReplier;
	
	
	public String getJobReplyCode() {
		return jobReplyCode;
	}
	public void setJobReplyCode(String jobReplyCode) {
		this.jobReplyCode = jobReplyCode;
	}
	public String getJobReplyWriter() {
		return jobReplyWriter;
	}
	public void setJobReplyWriter(String jobReplyWriter) {
		this.jobReplyWriter = jobReplyWriter;
	}
	public String getJobReplyContent() {
		return jobReplyContent;
	}
	public void setJobReplyContent(String jobReplyContent) {
		this.jobReplyContent = jobReplyContent;
	}
	public Date getReplyWriteDt() {
		return replyWriteDt;
	}
	public void setReplyWriteDt(Date replyWriteDt) {
		this.replyWriteDt = replyWriteDt;
	}
	public Date getReplyModifyDt() {
		return replyModifyDt;
	}
	public void setReplyModifyDt(Date replyModifyDt) {
		this.replyModifyDt = replyModifyDt;
	}
	public String getJobCode() {
		return jobCode;
	}
	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}
	public EmployeeVO getJobReplier() {
		return jobReplier;
	}
	public void setJobReplier(EmployeeVO jobReplier) {
		this.jobReplier = jobReplier;
	}
	public String getReplyModifyDate() {
		return replyModifyDate;
	}
	public void setReplyModifyDate(String replyModifyDate) {
		this.replyModifyDate = replyModifyDate;
	}
	
	
	
}
