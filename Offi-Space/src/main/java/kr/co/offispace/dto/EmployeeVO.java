package kr.co.offispace.dto;

import java.util.Date;

public class EmployeeVO {

	private String empCode=""; 		//사원 코드
	private String empId=""; 			//사원 아이디
	private String empPassword="";		//사원 비밀번호
	private String empName=""; 		//사원 이름
	private String empTelephone="";	//사원 전화번호
	private String empReginum=""; 		//사원 주민등록번호
	private String empEmail=""; 		//사원 이메일
	private String empAddress=""; 		//사원 주소
	private Date empHireDt; 		//사원 입사일
	private String statusCode=""; 		//사원 상태코드
	private Date empStUpdateDt; 	//사원 상태코드 수정일
	private String headOfficeCode=""; 	//사원 본부코드
	private String groupCode=""; 		//사원 그룹코드
	private String teamCode=""; 		//사원 팀코드
	private String positionCode="";	//사원 직급
	private String chargeCode=""; 		//사원 직책
	private String authorityCode=""; 	//사원 권한코드

	//해당 코드 값을 저장할 변수
	private String statusValue="";
	private String headOfficeValue="";
	private String groupValue="";
	private String teamValue="";
	private String positionValue="";
	private String chargeValue="";
	private String authorityValue="";

	//사원의 사진이름을 저장할 변수
	private String attachSavename="";

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
	public String getEmpTelephone() {
		return empTelephone;
	}
	public void setEmpTelephone(String empTelephone) {
		this.empTelephone = empTelephone;
	}
	public String getEmpReginum() {
		return empReginum;
	}
	public void setEmpReginum(String empReginum) {
		this.empReginum = empReginum;
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
	public Date getEmpHireDt() {
		return empHireDt;
	}
	public void setEmpHireDt(Date empHireDt) {
		this.empHireDt = empHireDt;
	}
	public String getStatusCode() {
		return statusCode;
	}
	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}
	public Date getEmpStUpdateDt() {
		return empStUpdateDt;
	}
	public void setEmpStUpdateDt(Date empStUpdateDt) {
		this.empStUpdateDt = empStUpdateDt;
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

	public String getStatusValue() {
		return statusValue;
	}
	public void setStatusValue(String statusValue) {
		this.statusValue = statusValue;
	}
	public String getHeadOfficeValue() {
		return headOfficeValue;
	}
	public void setHeadOfficeValue(String headOfficeValue) {
		this.headOfficeValue = headOfficeValue;
	}
	public String getGroupValue() {
		return groupValue;
	}
	public void setGroupValue(String groupValue) {
		this.groupValue = groupValue;
	}
	public String getTeamValue() {
		return teamValue;
	}
	public void setTeamValue(String teamValue) {
		this.teamValue = teamValue;
	}
	public String getPositionValue() {
		return positionValue;
	}
	public void setPositionValue(String positionValue) {
		this.positionValue = positionValue;
	}
	public String getChargeValue() {
		return chargeValue;
	}
	public void setChargeValue(String chargeValue) {
		this.chargeValue = chargeValue;
	}
	public String getAuthorityValue() {
		return authorityValue;
	}
	public void setAuthorityValue(String authorityValue) {
		this.authorityValue = authorityValue;
	}
	public String getAttachSavename() {
		return attachSavename;
	}
	public void setAttachSavename(String attachSavename) {
		this.attachSavename = attachSavename;
	}



}
