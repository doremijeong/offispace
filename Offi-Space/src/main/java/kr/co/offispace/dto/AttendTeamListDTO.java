package kr.co.offispace.dto;

import java.util.Date;

public class AttendTeamListDTO {

	private String empCode;
	private String empName;
	private String positionValue;
	private String attachSavename;
	private String attJobStCode;



	public AttendTeamListDTO() {}

	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getPositionValue() {
		return positionValue;
	}
	public void setPositionValue(String positionValue) {
		this.positionValue = positionValue;
	}
	public String getEmpCode() {
		return empCode;
	}
	public void setEmpCode(String empCode) {
		this.empCode = empCode;
	}

	public String getAttJobStCode() {
		return attJobStCode;
	}

	public void setAttJobStCode(String attJobStCode) {
		this.attJobStCode = attJobStCode;
	}

	public String getAttachSavename() {
		return attachSavename;
	}
	public void setAttachSavename(String attachSavename) {
		this.attachSavename = attachSavename;
	}



}

