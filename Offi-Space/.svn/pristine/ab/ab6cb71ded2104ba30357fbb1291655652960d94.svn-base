package kr.co.offispace.command;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.co.offispace.dto.NoticeVO;
import kr.co.offispace.dto.TeamNoticeVO;

public class TeamNoticeVOCommand {
	private String teamNoticeCode;
	private String teamNoticeTitle;
	private String teamNoticeContent;
	private String teamNoticeWriter;
	private String teamNoticeSdate;
	private String teamNoticeEdate;
	private String teamNoticeImportance;
	private List<MultipartFile> attached;

	private List<String> deleteFiles;


	public String getTeamNoticeCode() {
		return teamNoticeCode;
	}


	public void setTeamNoticeCode(String teamNoticeCode) {
		this.teamNoticeCode = teamNoticeCode;
	}


	public String getTeamNoticeTitle() {
		return teamNoticeTitle;
	}


	public void setTeamNoticeTitle(String teamNoticeTitle) {
		this.teamNoticeTitle = teamNoticeTitle;
	}


	public String getTeamNoticeContent() {
		return teamNoticeContent;
	}


	public void setTeamNoticeContent(String teamNoticeContent) {
		this.teamNoticeContent = teamNoticeContent;
	}


	public String getTeamNoticeWriter() {
		return teamNoticeWriter;
	}


	public void setTeamNoticeWriter(String teamNoticeWriter) {
		this.teamNoticeWriter = teamNoticeWriter;
	}


	public String getTeamNoticeSdate() {
		return teamNoticeSdate;
	}


	public void setTeamNoticeSdate(String teamNoticeSdate) {
		this.teamNoticeSdate = teamNoticeSdate;
	}


	public String getTeamNoticeEdate() {
		return teamNoticeEdate;
	}


	public void setTeamNoticeEdate(String teamNoticeEdate) {
		this.teamNoticeEdate = teamNoticeEdate;
	}


	public String getTeamNoticeImportance() {
		return teamNoticeImportance;
	}


	public void setTeamNoticeImportance(String teamNoticeImportance) {
		this.teamNoticeImportance = teamNoticeImportance;
	}


	public List<MultipartFile> getAttached() {
		return attached;
	}


	public void setAttached(List<MultipartFile> attached) {
		this.attached = attached;
	}


	public List<String> getDeleteFiles() {
		return deleteFiles;
	}


	public void setDeleteFiles(List<String> deleteFiles) {
		this.deleteFiles = deleteFiles;
	}


	public TeamNoticeVO toTeamNoticeVO() throws Exception {
		TeamNoticeVO teamNotice = new TeamNoticeVO();

		teamNotice.setTeamNoticeTitle(this.teamNoticeTitle);
		teamNotice.setTeamNoticeCode(this.teamNoticeCode);
		teamNotice.setTeamNoticeContent(this.teamNoticeContent);
		teamNotice.setTeamNoticeWriter(this.teamNoticeWriter);
		teamNotice.setTeamNoticeImportance(this.teamNoticeImportance);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date sDate = sdf.parse(this.teamNoticeSdate);
		teamNotice.setTeamNoticeSdate(sDate);

		Date eDate = sdf.parse(this.teamNoticeEdate);
		teamNotice.setTeamNoticeEdate(eDate);

		return teamNotice;
	}
}
