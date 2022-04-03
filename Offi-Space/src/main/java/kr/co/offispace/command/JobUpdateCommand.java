package kr.co.offispace.command;


import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.co.offispace.dto.AttachmentVO;

import kr.co.offispace.dto.JobVO;

public class JobUpdateCommand {

	private String jobCode;
    private int jobProgress;
    private String jobNote;
    private List<MultipartFile> attached;
    private String jobChargerCode;
    List<AttachmentVO> attachList;
    List<String> deleteFiles;

    public JobVO getJobVO() {
    	JobVO job = new JobVO();
    	job.setJobCode(this.jobCode);
    	job.setJobProgress(this.jobProgress);
    	job.setJobNote(this.jobNote);
    	return job;
    }


	public String getJobCode() {
		return jobCode;
	}


	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}


	public int getJobProgress() {
		return jobProgress;
	}


	public void setJobProgress(int jobProgress) {
		this.jobProgress = jobProgress;
	}


	public String getJobNote() {
		return jobNote;
	}


	public void setJobNote(String jobNote) {
		this.jobNote = jobNote;
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


	public String getJobChargerCode() {
		return jobChargerCode;
	}


	public void setJobChargerCode(String jobChargerCode) {
		this.jobChargerCode = jobChargerCode;
	}


	public List<String> getDeleteFiles() {
		return deleteFiles;
	}


	public void setDeleteFiles(List<String> deleteFiles) {
		this.deleteFiles = deleteFiles;
	}



}
