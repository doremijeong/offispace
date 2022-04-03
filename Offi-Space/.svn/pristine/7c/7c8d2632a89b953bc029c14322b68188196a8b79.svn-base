package kr.co.offispace.command;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import kr.co.offispace.dto.AttendTypeVO;

public class AttendCommand {
	private String attCode; 			//출퇴근 코드
	private String attDt;				//날짜
	private String attTime;				//출근시간
	private String attLeavTime;			//퇴근시간
	private String attRealWorkTime;		//실제근무시간
	
	private String attExWorkTime;		//연장근무시간
	private String attTotalWorkTime;	//총근무시간
	private String attTlcomSt;			//재택근무여부
	private String attJobStCode;		//업무상태코드
	private String attPerStCode;		//개인근태상태코드
	
	private String attTypeCode;			//근무타입코드
	private String empCode;				//사원코드
	private String apvCode;				//결재코드
	private String yearVacEmpCode;		//연차사원코드
	private String empName;				//사원이름
	private String teamValue;			//부서명(팀코드)
	
	private String attCoreStartTime;	//코어시작시간
	private String attCoreEndTime;		//코어종료시간
	private String attName;				//근무유형
	
	
	
	public String getAttName() {
		return attName;
	}
	public void setAttName(String attName) {
		this.attName = attName;
	}
	public String getAttCoreStartTime() {
		return attCoreStartTime;
	}
	public void setAttCoreStartTime(String attCoreStartTime) {
		this.attCoreStartTime = attCoreStartTime;
	}
	public String getAttCoreEndTime() {
		return attCoreEndTime;
	}
	public void setAttCoreEndTime(String attCoreEndTime) {
		this.attCoreEndTime = attCoreEndTime;
	}
	public String getTeamValue() {
		return teamValue;
	}
	public void setTeamValue(String teamValue) {
		this.teamValue = teamValue;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getAttCode() {
		return attCode;
	}
	public void setAttCode(String attCode) {
		this.attCode = attCode;
	}
	public String getAttDt() {
		return attDt;
	}
	public void setAttDt(String attDt) {
		this.attDt = attDt;
	}
	public String getAttTime() {
		return attTime;
	}
	public void setAttTime(String attTime) {
		this.attTime = attTime;
	}
	public String getAttLeavTime() {
		return attLeavTime;
	}
	public void setAttLeavTime(String attLeavTime) {
		this.attLeavTime = attLeavTime;
	}
	public String getAttRealWorkTime() {
		return attRealWorkTime;
	}
	public void setAttRealWorkTime(String attRealWorkTime) {
		this.attRealWorkTime = attRealWorkTime;
	}
	public String getAttExWorkTime() {
		return attExWorkTime;
	}
	public void setAttExWorkTime(String attExWorkTime) {
		this.attExWorkTime = attExWorkTime;
	}
	public String getAttTotalWorkTime() {
		return attTotalWorkTime;
	}
	public void setAttTotalWorkTime(String attTotalWorkTime) {
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
	public void setAttPerStCode(String attPerStCode) {
		this.attPerStCode = attPerStCode;
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
	
	public AttendTypeVO toAttendTypeVO() throws ParseException {

		AttendTypeVO attendType = new AttendTypeVO();
		
		System.out.println("____________________________________");
		
		System.out.println(attendType.getAttTime());
		System.out.println(attendType.getAttLeavTime());
		System.out.println(attendType.getAttCoreStartTime());
		System.out.println(attendType.getAttCoreEndTime());
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH24:mm:ss");
		
		Date today = new Date();
		Date attStartTime = sdf.parse(today+ " " +attTime +":00");
		Date attEndTime = sdf.parse(today+ " " +attLeavTime +":00");
		Date attCoreStTime = sdf.parse(today+ " " +attCoreStartTime +":00");
		Date attCoreEnTime = sdf.parse(today+ " " +attCoreEndTime +":00");
		
		attendType.setAttTime(attStartTime);
		attendType.setAttLeavTime(attEndTime);
		attendType.setAttCoreStartTime(attCoreStTime);
		attendType.setAttCoreEndTime(attCoreEnTime);
		
		
		return attendType;
	}
}
