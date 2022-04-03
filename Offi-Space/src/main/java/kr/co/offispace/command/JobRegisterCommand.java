package kr.co.offispace.command;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.co.offispace.dto.AttachmentVO;

public class JobRegisterCommand {

    private String jobCode;
    private String jobTitle;
    private String jobImportance;
    private String jobContent;
    private String jobStatus;
    private String jobStartDt="";
    private String jobClosingDt="";
    private String jobcodeCode;
    private String jobChargerCode;
    private String jobRequesterCode;
    private List<String> jobReferences;
    private List<MultipartFile> attached;


    List<AttachmentVO> attachList;


	public String getJobCode() {
		return jobCode;
	}
	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}
	public String getJobTitle() {
		return jobTitle;
	}
	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}

	public String getJobImportance() {
		return jobImportance;
	}
	public void setJobImportance(String jobImportance) {
		this.jobImportance = jobImportance;
	}
	public String getJobContent() {
		return jobContent;
	}
	public void setJobContent(String jobContent) {
		this.jobContent = jobContent;
	}
	public String getJobStatus() {
		return jobStatus;
	}
	public void setJobStatus(String jobStatus) {
		this.jobStatus = jobStatus;
	}
	public String getJobStartDt() {
		return jobStartDt;
	}
	public void setJobStartDt(String jobStartDt) {
		this.jobStartDt = jobStartDt;
	}
	public String getJobClosingDt() {
		return jobClosingDt;
	}
	public void setJobClosingDt(String jobClosingDt) {
		this.jobClosingDt = jobClosingDt;
	}
	public String getJobcodeCode() {
		return jobcodeCode;
	}
	public void setJobcodeCode(String jobcodeCode) {
		this.jobcodeCode = jobcodeCode;
	}
	public String getJobChargerCode() {
		return jobChargerCode;
	}
	public void setJobChargerCode(String jobChargerCode) {
		this.jobChargerCode = jobChargerCode;
	}
	public String getJobRequesterCode() {
		return jobRequesterCode;
	}
	public void setJobRequesterCode(String jobRequesterCode) {
		this.jobRequesterCode = jobRequesterCode;
	}

	public List<String> getJobReferences() {
		return jobReferences;
	}
	public void setJobReferences(List<String> jobReferences) {
		this.jobReferences = jobReferences;
	}
	public List<MultipartFile> getAttached() {
		return attached;
	}
	public void setAttached(List<MultipartFile> attached) {
		this.attached = attached;
	}

	public List<AttachmentVO> getAttachList() {
		return attachList;
	}
	public void setAttachList(List<AttachmentVO> attachList) {
		this.attachList = attachList;
	}
	@Override
	public String toString() {
		return "JobRegisterCommand [jobCode=" + jobCode + ", jobTitle=" + jobTitle + ", jobImportant=" + jobImportance
				+ ", jobContent=" + jobContent + ", jobStatus=" + jobStatus + ", jobStartDt=" + jobStartDt
				+ ", jobClosingDt=" + jobClosingDt + ", jobcodeCode=" + jobcodeCode + ", jobChargerCode="
				+ jobChargerCode + ", jobRequesterCode=" + jobRequesterCode + ", jobReferences=" + jobReferences
				+ ", attached=" + attached + ", getJobCode()=" + getJobCode() + ", getJobTitle()=" + getJobTitle()
				+ ", getJobImportant()=" + getJobImportance() + ", getJobContent()=" + getJobContent()
				+ ", getJobStatus()=" + getJobStatus() + ", getJobStartDt()=" + getJobStartDt() + ", getJobClosingDt()="
				+ getJobClosingDt() + ", getJobcodeCode()=" + getJobcodeCode() + ", getJobChargerCode()="
				+ getJobChargerCode() + ", getJobRequesterCode()=" + getJobRequesterCode() + ", getJobReferences()="
				+ getJobReferences() + ", getAttached()=" + getAttached() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}







}
