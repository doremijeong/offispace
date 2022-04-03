package kr.co.offispace.dto;

import java.util.Date;

public class YearVacationVO {

	private String YearVacCode;		//연차코드
	private String empCode;			//사원코드
	private int totalYearVac;		//총연차
	private int occurYearVac;		//발생연차
	private int totalUsedYearVac;	//총사용연차
	
	private int remainYearVac;		//남은연차
	private String empName;			//사원이름
	private String teamValue;		//부서이름
	private String yearVacKinds;	//연차종류
	private Date usedStartDt;		//연차사용시작일
	
	private Date usedEndDt;			//연차사용종료일
	private int yearVacUsed;		//사용연차(낱개) : 사용내역에 상세내용으로 들어갈 사용연차
	private Date registerDt;		//연차등록일
	private int occurCnt;			//연차발생수
	private String content;			//내용
	
	
	public String getYearVacCode() {
		return YearVacCode;
	}
	public void setYearVacCode(String yearVacCode) {
		YearVacCode = yearVacCode;
	}
	public String getEmpCode() {
		return empCode;
	}
	public void setEmpCode(String empCode) {
		this.empCode = empCode;
	}
	public int getTotalYearVac() {
		return totalYearVac;
	}
	public void setTotalYearVac(int totalYearVac) {
		this.totalYearVac = totalYearVac;
	}
	public int getOccurYearVac() {
		return occurYearVac;
	}
	public void setOccurYearVac(int occurYearVac) {
		this.occurYearVac = occurYearVac;
	}
	public int getTotalUsedYearVac() {
		return totalUsedYearVac;
	}
	public void setTotalUsedYearVac(int totalUsedYearVac) {
		this.totalUsedYearVac = totalUsedYearVac;
	}
	public int getRemainYearVac() {
		return remainYearVac;
	}
	public void setRemainYearVac(int remainYearVac) {
		this.remainYearVac = remainYearVac;
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
	public String getYearVacKinds() {
		return yearVacKinds;
	}
	public void setYearVacKinds(String yearVacKinds) {
		this.yearVacKinds = yearVacKinds;
	}
	public Date getUsedStartDt() {
		return usedStartDt;
	}
	public void setUsedStartDt(Date usedStartDt) {
		this.usedStartDt = usedStartDt;
	}
	public Date getUsedEndDt() {
		return usedEndDt;
	}
	public void setUsedEndDt(Date usedEndDt) {
		this.usedEndDt = usedEndDt;
	}
	public int getYearVacUsed() {
		return yearVacUsed;
	}
	public void setYearVacUsed(int yearVacUsed) {
		this.yearVacUsed = yearVacUsed;
	}
	public Date getRegisterDt() {
		return registerDt;
	}
	public void setRegisterDt(Date registerDt) {
		this.registerDt = registerDt;
	}
	public int getOccurCnt() {
		return occurCnt;
	}
	public void setOccurCnt(int occurCnt) {
		this.occurCnt = occurCnt;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
}
