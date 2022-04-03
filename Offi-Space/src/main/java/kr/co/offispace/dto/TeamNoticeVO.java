package kr.co.offispace.dto;

import java.util.Date;
import java.util.List;

public class TeamNoticeVO {
	
	private String teamNoticeCode;
	private String teamNoticeTitle;
	private String teamNoticeContent;
	private String teamNoticeWriter;
	private String teamNoticeTeamcode;
	private Date teamNoticeDate;
	private Date teamNoticeUpdate;
	private Date teamNoticeSdate;
	private Date teamNoticeEdate;
	private String teamNoticeImportance;
	private int teamNoticeViewcnt=0;
	
	private EmployeeVO teamNoticeEmp;
	private List<AttachmentVO> attachList;
	
	
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
	public String getTeamNoticeTeamcode() {
		return teamNoticeTeamcode;
	}
	public void setTeamNoticeTeamcode(String teamNoticeTeamcode) {
		this.teamNoticeTeamcode = teamNoticeTeamcode;
	}
	public Date getTeamNoticeDate() {
		return teamNoticeDate;
	}
	public void setTeamNoticeDate(Date teamNoticeDate) {
		this.teamNoticeDate = teamNoticeDate;
	}
	public Date getTeamNoticeUpdate() {
		return teamNoticeUpdate;
	}
	public void setTeamNoticeUpdate(Date teamNoticeUpdate) {
		this.teamNoticeUpdate = teamNoticeUpdate;
	}
	public Date getTeamNoticeSdate() {
		return teamNoticeSdate;
	}
	public void setTeamNoticeSdate(Date teamNoticeSdate) {
		this.teamNoticeSdate = teamNoticeSdate;
	}
	public Date getTeamNoticeEdate() {
		return teamNoticeEdate;
	}
	public void setTeamNoticeEdate(Date teamNoticeEdate) {
		this.teamNoticeEdate = teamNoticeEdate;
	}
	public String getTeamNoticeImportance() {
		return teamNoticeImportance;
	}
	public void setTeamNoticeImportance(String teamNoticeImportance) {
		this.teamNoticeImportance = teamNoticeImportance;
	}
	public EmployeeVO getTeamNoticeEmp() {
		return teamNoticeEmp;
	}
	public void setTeamNoticeEmp(EmployeeVO teamNoticeEmp) {
		this.teamNoticeEmp = teamNoticeEmp;
	}
	public List<AttachmentVO> getAttachList() {
		return attachList;
	}
	public void setAttachList(List<AttachmentVO> attachList) {
		this.attachList = attachList;
	}
	public int getTeamNoticeViewcnt() {
		return teamNoticeViewcnt;
	}
	public void setTeamNoticeViewcnt(int teamNoticeViewcnt) {
		this.teamNoticeViewcnt = teamNoticeViewcnt;
	}
	
}
