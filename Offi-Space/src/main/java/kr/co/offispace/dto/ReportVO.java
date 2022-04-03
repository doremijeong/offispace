package kr.co.offispace.dto;

import java.util.Date;
import java.util.List;

public class ReportVO {

	private String reportCode;
	private String reportTitle;
	private String reportDetail;
	private String reportManager;
	private String reportMarkup;
	private String reportType;
	private String reportTeamCode;
	private String jobCode;
	private String reportOpen;
	private List<String> reportDay;

	private String reportManagerName;
	private String reportManagerPosition;
	private String reportTeamName;




	public String getReportCode() {
		return reportCode;
	}

	public void setReportCode(String reportCode) {
		this.reportCode = reportCode;
	}

	public String getReportTitle() {
		return reportTitle;
	}

	public void setReportTitle(String reportTitle) {
		this.reportTitle = reportTitle;
	}

	public String getReportDetail() {
		return reportDetail;
	}

	public void setReportDetail(String reportDetail) {
		this.reportDetail = reportDetail;
	}

	public String getReportManager() {
		return reportManager;
	}

	public void setReportManager(String reportManager) {
		this.reportManager = reportManager;
	}

	public String getReportMarkup() {
		return reportMarkup;
	}

	public void setReportMarkup(String reportMarkup) {
		this.reportMarkup = reportMarkup;
	}

	public String getReportType() {
		return reportType;
	}

	public void setReportType(String reportType) {
		this.reportType = reportType;
	}

	public String getReportTeamCode() {
		return reportTeamCode;
	}

	public void setReportTeamCode(String reportTeamCode) {
		this.reportTeamCode = reportTeamCode;
	}

	public String getJobCode() {
		return jobCode;
	}

	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}
	public String getReportOpen() {
		return reportOpen;
	}

	public void setReportOpen(String reportOpen) {
		this.reportOpen = reportOpen;
	}

	public String getReportManagerName() {
		return reportManagerName;
	}

	public void setReportManagerName(String reportManagerName) {
		this.reportManagerName = reportManagerName;
	}


	public String getReportManagerPosition() {
		return reportManagerPosition;
	}

	public void setReportManagerPosition(String reportManagerPosition) {
		this.reportManagerPosition = reportManagerPosition;
	}

	public String getReportTeamName() {
		return reportTeamName;
	}

	public void setReportTeamName(String reportTeamName) {
		this.reportTeamName = reportTeamName;
	}


	//보고서 양식 관리로 인해 추가 생성
	public List<String> getReportDay() {
		return reportDay;
	}

	public void setReportDay(List<String> reportDay) {
		this.reportDay = reportDay;
	}

	public RegularReportStakeholersDTO setRegularReportStakeholdersDTO() {
		RegularReportStakeholersDTO dto = new RegularReportStakeholersDTO();
		dto.setReportCode(this.reportCode);
		dto.setReportTitle(this.reportTitle);
		dto.setReportDetail(this.reportDetail);
		dto.setReportMarkup(this.reportMarkup);
		dto.setReportType(this.reportType);
		dto.setReportTeamCode(this.reportTeamCode);
		dto.setJobCode(this.jobCode);
		dto.setReportOpen(this.reportOpen);
		dto.setReportTeamName(this.reportTeamName);
		return dto;
	}

	public IrregularReportStakeholersDTO setIrregularReportStakeholersDTO() {
		IrregularReportStakeholersDTO dto = new IrregularReportStakeholersDTO();
		dto.setReportCode(this.reportCode);
		dto.setReportTitle(this.reportTitle);
		dto.setReportDetail(this.reportDetail);
		dto.setReportMarkup(this.reportMarkup);
		dto.setReportType(this.reportType);
		dto.setReportTeamCode(this.reportTeamCode);
		dto.setJobCode(this.jobCode);
		dto.setReportOpen(this.reportOpen);
		return dto;
	}

}
