package kr.co.offispace.dto;

import java.util.Date;

public class WorkFromHomeVO {

	private String wfhCode;				//재택근무코드
	private String empCode;				//사원코드
	private String empName;				//사원이름
	private String teamValue;			//부서이름(팀)
	private Date applicationDt;			//신청일
	private Date startDt;				//재택근무시작일
	private Date endDt;					//재택근무종료일
	private String applicationReason;	//신청사유
	private String apvCode;				//전자결재코드
	private String attCode;				//출퇴근코드
	private String teamCode;			//부서코드
	
	private String attDtSt;				
	
	public String getTeamCode() {
		return teamCode;
	}
	public void setTeamCode(String teamCode) {
		this.teamCode = teamCode;
	}
	public String getAttDtSt() {
		return attDtSt;
	}
	public void setAttDtSt(String attDtSt) {
		this.attDtSt = attDtSt;
	}
	public String getWfhCode() {
		return wfhCode;
	}
	public void setWfhCode(String wfhCode) {
		this.wfhCode = wfhCode;
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
	public Date getApplicationDt() {
		return applicationDt;
	}
	public void setApplicationDt(Date applicationDt) {
		this.applicationDt = applicationDt;
	}
	public Date getStartDt() {
		return startDt;
	}
	public void setStartDt(Date startDt) {
		this.startDt = startDt;
	}
	public Date getEndDt() {
		return endDt;
	}
	public void setEndDt(Date endDt) {
		this.endDt = endDt;
	}
	public String getApplicationReason() {
		return applicationReason;
	}
	public void setApplicationReason(String applicationReason) {
		this.applicationReason = applicationReason;
	}
	public String getApvCode() {
		return apvCode;
	}
	public void setApvCode(String apvCode) {
		this.apvCode = apvCode;
	}
	public String getAttCode() {
		return attCode;
	}
	public void setAttCode(String attCode) {
		this.attCode = attCode;
	}
	
	
	
}
