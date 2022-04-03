package kr.co.offispace.command;

import java.io.File;
import java.util.Date;

public class RegisterEmployeeCommand {
	
	public String empCode="";
	public String empId="";
	public String empPassword="";
	public String empName="";
	public String empReginum="";
	public String empHireDt="";
	public String headOfficeCode="";
	public String groupCode="";
	public String teamCode="";
	public String positionCode="";
	public String chargeCode="";
	public String authorityCode="";
	public String empPicture;
	
	
	
	
	public RegisterEmployeeCommand() {}
	
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
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getEmpReginum() {
		return empReginum;
	}
	public void setEmpReginum(String empReginum) {
		this.empReginum = empReginum;
	}
	public String getEmpHireDt() {
		return empHireDt;
	}
	public void setEmpHireDt(String empHireDt) {
		this.empHireDt = empHireDt;
	}
	public String getHeadOfficeCode() {
		return headOfficeCode;
	}
	public void setHeadOfficeCode(String headOfficeCode) {
		this.headOfficeCode = headOfficeCode;
	}
	public String getGroupCode() {
		return groupCode;
	}
	public void setGroupCode(String groupCode) {
		this.groupCode = groupCode;
	}
	public String getTeamCode() {
		return teamCode;
	}
	public void setTeamCode(String teamCode) {
		this.teamCode = teamCode;
	}
	public String getPositionCode() {
		return positionCode;
	}
	public void setPositionCode(String positionCode) {
		this.positionCode = positionCode;
	}
	public String getChargeCode() {
		return chargeCode;
	}
	public void setChargeCode(String chargeCode) {
		this.chargeCode = chargeCode;
	}
	public String getAuthorityCode() {
		return authorityCode;
	}
	public void setAuthorityCode(String authorityCode) {
		this.authorityCode = authorityCode;
	}
	
	
	public String getEmpPicture() {
		return empPicture;
	}
	public void setEmpPicture(String empPicture) {
		this.empPicture = empPicture;
	}

	@Override
	public String toString() {
		return "RegisterEmployeeCommand [empCode=" + empCode + ", empId=" + empId + ", empPassword=" + empPassword
				+ ", empName=" + empName + ", empReginum=" + empReginum + ", empHireDt=" + empHireDt
				+ ", headOfficeCode=" + headOfficeCode + ", groupCode=" + groupCode + ", teamCode=" + teamCode
				+ ", positionCode=" + positionCode + ", chargeCode=" + chargeCode + ", authorityCode=" + authorityCode
				+ ", empPicture=" + empPicture + "]";
	}
	
	
	
}
