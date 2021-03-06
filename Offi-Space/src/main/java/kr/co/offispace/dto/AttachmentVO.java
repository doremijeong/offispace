package kr.co.offispace.dto;

import java.util.Date;

public class AttachmentVO {

	private String attachRegister;		// 첨부파일 등록자
	private String attachCode;			// 첨부파일 코드
	private String attachSavename;		// 첨부파일 저장이름
	private String attachSavepath;		// 첨부파일 저장경로
	private String attachExtension;		// 첨부파일 확장자
	private String attachGroup;			// 첨부파일을 가지고 있는 PK
	private Date attachRegdate;			// 첨부파일 등록 날짜

	public void setAttachRegister(String attachRegister) {
		this.attachRegister = attachRegister;
	}

	public String getAttachRegister() {
		return attachRegister;
	}

	public void setAttachCode(String attachCode) {
		this.attachCode = attachCode;
	}

	public String getAttachCode() {
		return attachCode;
	}

	public void setAttachSavename(String attachSavename) {
		this.attachSavename = attachSavename;
	}

	public String getAttachSavename() {
		return attachSavename;
	}

	public void setAttachSavepath(String attachSavepath) {
		this.attachSavepath = attachSavepath;
	}

	public String getAttachSavepath() {
		return attachSavepath;
	}

	public void setAttachExtension(String attachExtension) {
		this.attachExtension = attachExtension;
	}

	public String getAttachExtension() {
		return attachExtension;
	}

	public void setAttachGroup(String attachGroup) {
		this.attachGroup = attachGroup;
	}

	public String getAttachGroup() {
		return attachGroup;
	}

	public Date getAttachRegdate() {
		return attachRegdate;
	}

	public void setAttachRegdate(Date attachRegdate) {
		this.attachRegdate = attachRegdate;
	}

	@Override
	public String toString() {
		return "AttachmentVO [attachRegister=" + attachRegister + ", attachCode=" + attachCode + ", attachSavename="
				+ attachSavename + ", attachSavepath=" + attachSavepath + ", attachExtension=" + attachExtension
				+ ", attachGroup=" + attachGroup + ", attachRegdate=" + attachRegdate + "]";
	}

}
