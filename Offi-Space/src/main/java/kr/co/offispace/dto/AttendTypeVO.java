package kr.co.offispace.dto;

import java.util.Date;

public class AttendTypeVO {
	
	private String attTypeCode;
	private String attName;
	private Date attCoreStartTime;
	private Date attCoreEndTime;
	private Date attLeavTime;
	private Date attTime;
	
	
	public String getAttTypeCode() {
		return attTypeCode;
	}
	public void setAttTypeCode(String attTypeCode) {
		this.attTypeCode = attTypeCode;
	}
	public String getAttName() {
		return attName;
	}
	public void setAttName(String attName) {
		this.attName = attName;
	}
	public Date getAttCoreStartTime() {
		return attCoreStartTime;
	}
	public void setAttCoreStartTime(Date attCoreStartTime) {
		this.attCoreStartTime = attCoreStartTime;
	}
	public Date getAttCoreEndTime() {
		return attCoreEndTime;
	}
	public void setAttCoreEndTime(Date attCoreEndTime) {
		this.attCoreEndTime = attCoreEndTime;
	}
	public Date getAttLeavTime() {
		return attLeavTime;
	}
	public void setAttLeavTime(Date attLeavTime) {
		this.attLeavTime = attLeavTime;
	}
	public Date getAttTime() {
		return attTime;
	}
	public void setAttTime(Date attTime) {
		this.attTime = attTime;
	}
	
}
