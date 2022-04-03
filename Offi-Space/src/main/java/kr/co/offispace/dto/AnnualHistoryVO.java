package kr.co.offispace.dto;

import java.util.Date;

public class AnnualHistoryVO {
	
	private String annHistoryCode;
	private String empCode;
	private String empName;
	private String teamValue;
	private Date annStartDt;
	private Date annEndDt;
	private int annUsedCnt;
	private String annReason;
	private Date annYear;
	
	public String getAnnHistoryCode() {
		return annHistoryCode;
	}
	public void setAnnHistoryCode(String annHistoryCode) {
		this.annHistoryCode = annHistoryCode;
	}
	public String getEmpCode() {
		return empCode;
	}
	public void setEmpCode(String empCode) {
		this.empCode = empCode;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getTeamValue() {
		return teamValue;
	}
	public void setTeamValue(String teamValue) {
		this.teamValue = teamValue;
	}
	public Date getAnnStartDt() {
		return annStartDt;
	}
	public void setAnnStartDt(Date annStartDt) {
		this.annStartDt = annStartDt;
	}
	public Date getAnnEndDt() {
		return annEndDt;
	}
	public void setAnnEndDt(Date annEndDt) {
		this.annEndDt = annEndDt;
	}
	public int getAnnUsedCnt() {
		return annUsedCnt;
	}
	public void setAnnUsedCnt(int annUsedCnt) {
		this.annUsedCnt = annUsedCnt;
	}
	public String getAnnReason() {
		return annReason;
	}
	public void setAnnReason(String annReason) {
		this.annReason = annReason;
	}
	public Date getAnnYear() {
		return annYear;
	}
	public void setAnnYear(Date annYear) {
		this.annYear = annYear;
	}
	
}                                    
