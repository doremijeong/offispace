package kr.co.offispace.dto;

import java.util.Base64;
import java.util.Date;
import java.util.List;

public class WorkFromHomeAnswerVO {
	private String answerCode;
	private String observerCode;
	private Date wfhaDate;
	private Date wfhaAnsTime;
	private Date wfhaReceiveTime;
	private String empCode;
	private String teamValue;
	private String teamCode;
	private String empName;
	
	private String ansTime;
	private String dt;
	private int total;
	private int cnt;
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	private List<WorkFromHomeAnswerVO> context;
	public List<WorkFromHomeAnswerVO> getContext() {
		return context;
	}
	public void setContext(List<WorkFromHomeAnswerVO> context) {
		this.context = context;
	}
	
	
	public String getDt() {
		return dt;
	}
	public void setDt(String dt) {
		this.dt = dt;
	}
	
	
	public String getAnsTime() {
		return ansTime;
	}
	public void setAnsTime(String ansTime) {
		this.ansTime = ansTime;
	}
	public String getTeamCode() {
		return teamCode;
	}
	public void setTeamCode(String teamCode) {
		this.teamCode = teamCode;
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
	public String getAnswerCode() {
		return answerCode;
	}
	public void setAnswerCode(String answerCode) {
		this.answerCode = answerCode;
	}
	public String getObserverCode() {
		return observerCode;
	}
	public void setObserverCode(String observerCode) {
		this.observerCode = observerCode;
	}
	public Date getWfhaDate() {
		return wfhaDate;
	}
	public void setWfhaDate(Date wfhaDate) {
		this.wfhaDate = wfhaDate;
	}
	public Date getWfhaAnsTime() {
		return wfhaAnsTime;
	}
	public void setWfhaAnsTime(Date wfhaAnsTime) {
		this.wfhaAnsTime = wfhaAnsTime;
	}
	public Date getWfhaReceiveTime() {
		return wfhaReceiveTime;
	}
	public void setWfhaReceiveTime(Date wfhaReceiveTime) {
		this.wfhaReceiveTime = wfhaReceiveTime;
	}
	public String getEmpCode() {
		return empCode;
	}
	public void setEmpCode(String empCode) {
		this.empCode = empCode;
	}
	
	

}
