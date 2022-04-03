package kr.co.offispace.command;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.co.offispace.dto.NoticeVO;

public class NoticeVOCommand {
	private String noticeCode;
	private String noticeTitle;
	private String noticeContent;
	private String noticeWriter;
	private String noticeSdate;
	private String noticeEdate;
	private String noticeImportance;
	private List<MultipartFile> attached;

	private List<String> deleteFiles;

	public List<String> getDeleteFiles() {
		return deleteFiles;
	}
	public void setDeleteFiles(List<String> deleteFiles) {
		this.deleteFiles = deleteFiles;
	}
	public List<MultipartFile> getAttached() {
		return attached;
	}
	public void setAttached(List<MultipartFile> attached) {
		this.attached = attached;
	}
	public String getNoticeCode() {
		return noticeCode;
	}
	public void setNoticeCode(String noticeCode) {
		this.noticeCode = noticeCode;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public String getNoticeWriter() {
		return noticeWriter;
	}
	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}
	public String getNoticeSdate() {
		return noticeSdate;
	}
	public void setNoticeSdate(String noticeSdate) {
		this.noticeSdate = noticeSdate;
	}
	public String getNoticeEdate() {
		return noticeEdate;
	}
	public void setNoticeEdate(String noticeEdate) {
		this.noticeEdate = noticeEdate;
	}
	public String getNoticeImportance() {
		return noticeImportance;
	}
	public void setNoticeImportance(String noticeImportance) {
		this.noticeImportance = noticeImportance;
	}

	public NoticeVO toNoticeVO() throws Exception {
		NoticeVO notice = new NoticeVO();

		notice.setNoticeTitle(this.noticeTitle);
		notice.setNoticeCode(this.noticeCode);
		notice.setNoticeContent(this.noticeContent);
		notice.setNoticeWriter(this.noticeWriter);
		notice.setNoticeImportance(this.noticeImportance);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date sDate = sdf.parse(this.noticeSdate);
		notice.setNoticeSdate(sDate);

		Date eDate = sdf.parse(this.noticeEdate);
		notice.setNoticeEdate(eDate);

		return notice;
	}
}
