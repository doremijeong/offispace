package kr.co.offispace.command;

import java.util.List;

public class JobRemoveCommand {
	private String jobCode;
	private String jobIssue;
	private String jobDenied;
	private List<String> attachList;
	private List<String> attachListByJobCharger;

	public String getJobCode() {
		return jobCode;
	}
	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}
	public String getJobIssue() {
		return jobIssue;
	}
	public void setJobIssue(String jobIssue) {
		this.jobIssue = jobIssue;
	}
	public String getJobDenied() {
		return jobDenied;
	}
	public void setJobDenied(String jobDenied) {
		this.jobDenied = jobDenied;
	}
	public List<String> getAttachList() {
		return attachList;
	}
	public void setAttachList(List<String> attachList) {
		this.attachList = attachList;
	}
	public List<String> getAttachListByJobCharger() {
		return attachListByJobCharger;
	}
	public void setAttachListByJobCharger(List<String> attachListByJobCharger) {
		this.attachListByJobCharger = attachListByJobCharger;
	}



}
