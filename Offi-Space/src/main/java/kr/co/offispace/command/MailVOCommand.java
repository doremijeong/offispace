package kr.co.offispace.command;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.co.offispace.dto.AttachmentVO;
import kr.co.offispace.dto.MailVO;

public class MailVOCommand {

	private String mailCode;
	private String mailTitle;
	private String mailCont;
	private String mailTemp;
	private String mailImportance;
	private String mailDate;
	private String[] mailTo;
	private String mailFrom;
	private String[] mailRef;

	private String[] deleteFiles;
	private List<String> attached;

	private List<MultipartFile> uploadFiles;

	public List<String> getAttached() {
		return attached;
	}

	public void setAttached(List<String> attached) {
		this.attached = attached;
	}

	public String getMailCode() {
		return mailCode;
	}

	public void setMailCode(String mailCode) {
		this.mailCode = mailCode;
	}

	public String getMailTitle() {
		return mailTitle;
	}

	public void setMailTitle(String mailTitle) {
		this.mailTitle = mailTitle;
	}

	public String getMailCont() {
		return mailCont;
	}

	public void setMailCont(String mailCont) {
		this.mailCont = mailCont;
	}

	public String getMailTemp() {
		return mailTemp;
	}

	public void setMailTemp(String mailTemp) {
		this.mailTemp = mailTemp;
	}

	public String getMailImportance() {
		return mailImportance;
	}

	public void setMailImportance(String mailImportance) {
		this.mailImportance = mailImportance;
	}

	public String getMailDate() {
		return mailDate;
	}

	public void setMailDate(String mailDate) {
		this.mailDate = mailDate;
	}

	public String[] getMailTo() {
		return mailTo;
	}

	public void setMailTo(String[] mailTo) {
		this.mailTo = mailTo;
	}

	public String getMailFrom() {
		return mailFrom;
	}

	public void setMailFrom(String mailFrom) {
		this.mailFrom = mailFrom;
	}

	public String[] getMailRef() {
		return mailRef;
	}

	public void setMailRef(String[] mailRef) {
		this.mailRef = mailRef;
	}

	public String[] getDeleteFiles() {
		return deleteFiles;
	}

	public void setDeleteFiles(String[] deleteFiles) {
		this.deleteFiles = deleteFiles;
	}

	public List<MultipartFile> getUploadFiles() {
		return uploadFiles;
	}

	public void setUploadFiles(List<MultipartFile> uploadFiles) {
		this.uploadFiles = uploadFiles;
	}

	public MailVO toMailVO() {
		MailVO mail = new MailVO();

		mail.setMailCode(this.mailCode);
		mail.setMailTitle(this.mailTitle);
		mail.setMailCont(this.mailCont);
		mail.setMailFrom(this.mailFrom);
		mail.setMailImportance(this.mailImportance);
		mail.setMailTemp(this.mailTemp);

		if(this.mailTo != null && this.mailTo.length > 0) {
			List<String> mailToList = new ArrayList<String>();
			for (String mailto : this.mailTo) {
				mailToList.add(mailto);
			}
			mail.setMailToEmpCodeList(mailToList);
		}

		if(this.mailRef != null && this.mailRef.length > 0) {
			List<String> mailRefList = new ArrayList<String>();
			for (String mailRef : this.mailRef) {
				mailRefList.add(mailRef);
			}
			mail.setMailRefEmpCodeList(mailRefList);
		}

		return mail;
	}
}
