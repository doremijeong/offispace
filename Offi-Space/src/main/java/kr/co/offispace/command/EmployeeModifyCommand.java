package kr.co.offispace.command;

import org.springframework.web.multipart.MultipartFile;

import kr.co.offispace.dto.EmployeeVO;

public class EmployeeModifyCommand {
	private String empCode="";
	private String empId=""; 			//사원 아이디
	private String empPassword="";
	private String empTelephone="";
	private String empEmail=""; 		//사원 이메일
	private String empAddress=""; 		//사원 주소

	private String oldPicture;
	private MultipartFile picture;


	public String getEmpCode() {
		return empCode;
	}
	public void setEmpCode(String empCode) {
		this.empCode = empCode;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getEmpPassword() {
		return empPassword;
	}
	public void setEmpPassword(String empPassword) {
		this.empPassword = empPassword;
	}
	public String getEmpTelephone() {
		return empTelephone;
	}
	public void setEmpTelephone(String empTelephone) {
		this.empTelephone = empTelephone;
	}
	public String getEmpEmail() {
		return empEmail;
	}
	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}
	public String getEmpAddress() {
		return empAddress;
	}
	public void setEmpAddress(String empAddress) {
		this.empAddress = empAddress;
	}
	public String getOldPicture() {
		return oldPicture;
	}
	public void setOldPicture(String oldPicture) {
		this.oldPicture = oldPicture;
	}
	public MultipartFile getPicture() {
		return picture;
	}
	public void setPicture(MultipartFile picture) {
		this.picture = picture;
	}

	public EmployeeVO toEmployeeVO() {
		EmployeeVO emp = new EmployeeVO();
		emp.setEmpCode(this.empCode);
		emp.setEmpId(this.empId);
		emp.setEmpPassword(this.empPassword);
		emp.setEmpEmail(this.empEmail);
		emp.setEmpAddress(this.empAddress);
		emp.setEmpTelephone(this.empTelephone);

		return emp;
	}
}
