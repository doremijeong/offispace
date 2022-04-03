package kr.co.offispace.dto;

import java.util.Date;

public class AttendVO {

	private String attCode; 		//출퇴근 코드
	private Date attDt;				//날짜
	private Date attTime;			//출근시간
	private Date attLeavTime;		//퇴근시간
	private Date attRealWorkTime;	//실제근무시간

	private Date attExWorkTime;		//연장근무시간
	private Date attTotalWorkTime;	//총근무시간
	private String attTlcomSt;		//재택근무여부
	private String attJobStCode;	//업무상태코드
	private String attPerStCode;	//개인근태상태코드

	private String attTypeCode;		//근무타입코드
	private String empCode;			//사원코드
	private String apvCode;			//결재코드
	private String yearVacEmpCode;	//연차사원코드
	private String teamCode;		//팀코드
	private String teamValue;		//팀이름

	private String empName;			//사원이름

	private String dt; 				//부서근태 날짜맞춰서 출력하기위한 날짜

	//출력을 위한 멤버변수 (Wed Jan 26 16:21:17 KST 2022 -> 2022/01/26 16:21:17)
	private String attDtSt;
	private String attTimeSt;
	private String attLeavTimeSt;

	private String attRealWorkTimeSt;
	private String attExWorkTimeSt;
	private String attTotalWorkTimeSt;


	public String getDt() {
		return dt;
	}
	public void setDt(String dt) {
		this.dt = dt;
	}
	public String getTeamValue() {
		return teamValue;
	}
	public void setTeamValue(String teamValue) {
		this.teamValue = teamValue;
	}
	public String getAttCode() {
		return attCode;
	}
	public void setAttCode(String attCode) {
		this.attCode = attCode;
	}
	public Date getAttDt() {
		return attDt;
	}
	public void setAttDt(Date attDt) {
		this.attDt = attDt;
	}
	public Date getAttTime() {
		return attTime;
	}
	public void setAttTime(Date attTime) {
		this.attTime = attTime;
	}
	public Date getAttLeavTime() {
		return attLeavTime;
	}
	public void setAttLeavTime(Date attLeavTime) {
		this.attLeavTime = attLeavTime;
	}
	public Date getAttRealWorkTime() {
		return attRealWorkTime;
	}
	public void setAttRealWorkTime(Date attRealWorkTime) {
		this.attRealWorkTime = attRealWorkTime;
	}
	public Date getAttExWorkTime() {
		return attExWorkTime;
	}
	public void setAttExWorkTime(Date attExWorkTime) {
		this.attExWorkTime = attExWorkTime;
	}
	public Date getAttTotalWorkTime() {
		return attTotalWorkTime;
	}
	public void setAttTotalWorkTime(Date attTotalWorkTime) {
		this.attTotalWorkTime = attTotalWorkTime;
	}
	public String getAttTlcomSt() {
		return attTlcomSt;
	}
	public void setAttTlcomSt(String attTlcomSt) {
		this.attTlcomSt = attTlcomSt;
	}
	public String getAttJobStCode() {
		return attJobStCode;
	}
	public void setAttJobStCode(String attJobStCode) {
		this.attJobStCode = attJobStCode;
	}
	public String getAttPerStCode() {
		return attPerStCode;
	}
	public void setAttPerStCode(String attPerCode) {
		this.attPerStCode = attPerCode;
	}
	public String getAttTypeCode() {
		return attTypeCode;
	}
	public void setAttTypeCode(String attTypeCode) {
		this.attTypeCode = attTypeCode;
	}
	public String getEmpCode() {
		return empCode;
	}
	public void setEmpCode(String empCode) {
		this.empCode = empCode;
	}
	public String getApvCode() {
		return apvCode;
	}
	public void setApvCode(String apvCode) {
		this.apvCode = apvCode;
	}
	public String getYearVacEmpCode() {
		return yearVacEmpCode;
	}
	public void setYearVacEmpCode(String yearVacEmpCode) {
		this.yearVacEmpCode = yearVacEmpCode;
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



	public String getAttDtSt() {
		return attDtSt;
	}
	public void setAttDtSt(String attDtSt) {
		this.attDtSt = attDtSt;
	}
	public String getAttTimeSt() {
		return attTimeSt;
	}
	public void setAttTimeSt(String attTimeSt) {
		this.attTimeSt = attTimeSt;
	}
	public String getAttLeavTimeSt() {
		return attLeavTimeSt;
	}
	public void setAttLeavTimeSt(String attLeavTimeSt) {
		this.attLeavTimeSt = attLeavTimeSt;
	}
	public String getAttRealWorkTimeSt() {
		return attRealWorkTimeSt;
	}
	public void setAttRealWorkTimeSt(String attRealWorkTimeSt) {
		this.attRealWorkTimeSt = attRealWorkTimeSt;
	}
	public String getAttExWorkTimeSt() {
		return attExWorkTimeSt;
	}
	public void setAttExWorkTimeSt(String attExWorkTimeSt) {
		this.attExWorkTimeSt = attExWorkTimeSt;
	}
	public String getAttTotalWorkTimeSt() {
		return attTotalWorkTimeSt;
	}
	public void setAttTotalWorkTimeSt(String attTotalWorkTimeSt) {
		this.attTotalWorkTimeSt = attTotalWorkTimeSt;
	}

}
