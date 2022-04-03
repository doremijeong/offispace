package kr.co.offispace.command;

import java.util.List;

public class ReportRegisterCommand {
	private String reportCode;
	private String reportTitle;
	private String reportDetail;
	private String reportManager;
	private String reportMarkup;
	private String reportType;
	private String reportTeamCode;
	private String reportOpen = "Y";
	private List<String> reportDay;

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
	public String getReportOpen() {
		return reportOpen;
	}
	public void setReportOpen(String reportOpen) {
		this.reportOpen = reportOpen;
	}
	public List<String> getReportDay() {
		return reportDay;
	}
	public void setReportDay(List<String> reportDay) {
		this.reportDay = reportDay;
	}
	@Override
	public String toString() {
		return "ReportRegisterCommand [reportCode=" + reportCode + ", reportTitle=" + reportTitle + ", reportDetail="
				+ reportDetail + ", reportManager=" + reportManager + ", reportMarkup=" + reportMarkup + ", reportType="
				+ reportType + ", reportTeamCode=" + reportTeamCode + ", reportOpen=" + reportOpen + ", reportDay="
				+ reportDay + "]";
	}








}
