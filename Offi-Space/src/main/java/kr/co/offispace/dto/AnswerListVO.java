package kr.co.offispace.dto;

import java.util.Date;
import java.util.List;

public class AnswerListVO {

	private String empCode;
	private Date wfhaDate;
	private List<Date> wfhaAnsTimeList;
	private List<Date> wfhaReceiveTimeList;
	private int receiveCnt;
	private int totalCnt;
	
	public String getEmpCode() {
		return empCode;
	}
	public void setEmpCode(String empCode) {
		this.empCode = empCode;
	}
	public Date getWfhaDate() {
		return wfhaDate;
	}
	public void setWfhaDate(Date wfhaDate) {
		this.wfhaDate = wfhaDate;
	}
	public List<Date> getWfhaAnsTimeList() {
		return wfhaAnsTimeList;
	}
	public void setWfhaAnsTimeList(List<Date> wfhaAnsTimeList) {
		this.wfhaAnsTimeList = wfhaAnsTimeList;
	}
	public List<Date> getWfhaReceiveTimeList() {
		return wfhaReceiveTimeList;
	}
	public void setWfhaReceiveTimeList(List<Date> wfhaReceiveTimeList) {
		this.wfhaReceiveTimeList = wfhaReceiveTimeList;
	}
	public int getReceiveCnt() {
		return receiveCnt;
	}
	public void setReceiveCnt(int receiveCnt) {
		this.receiveCnt = receiveCnt;
	}
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
}
