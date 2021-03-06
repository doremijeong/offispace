package kr.co.offispace.dto;

import java.util.Date;

public class SchedulerVO {

	private String scdCode;			//일정코드
	private String scdTitle;		//일정제목
	private String scdContent;		//일정 내용
	private Date scdStartDt;		//일정시작일
	private Date scdEndDt;			//일정종료일
	
	private String scdImport;		//일정중요여부
	private String scdAllday;		//종일여부
	private String scdHollyday = "N";		//휴일여부
	private String scdGrCode;		//일정분류코드
	private String empCode;			//사원코드
	
	private String scdName;			//일정이름
	private String scdColor;		//일정분류색
	private String scdDptCode;		//부서코드
	
	
	
	
	
	public String getScdName() {
		return scdName;
	}
	public void setScdName(String scdName) {
		this.scdName = scdName;
	}
	public String getScdColor() {
		return scdColor;
	}
	public void setScdColor(String scdColor) {
		this.scdColor = scdColor;
	}
	public String getScdDptCode() {
		return scdDptCode;
	}
	public void setScdDptCode(String scdDptCode) {
		this.scdDptCode = scdDptCode;
	}
	public void setScdContent(String scdContent) {
		this.scdContent = scdContent; 
	}
	public String getScdContent() {
		return scdContent; 
	}
	public void setScdAllday(String scdAllday) {
		this.scdAllday = scdAllday; 
	}
	public String getScdAllday() {
		return scdAllday; 
	}
	public void setScdHollyday(String scdHollyday) {
		this.scdHollyday = scdHollyday; 
	}
	public String getScdHollyday() {
		return scdHollyday; 
	}
	public void setScdStartDt(Date scdStartDt) {
		this.scdStartDt = scdStartDt; 
	}
	public Date getScdStartDt() {
		return scdStartDt; 
	}
	public void setScdTitle(String scdTitle) {
		this.scdTitle = scdTitle; 
	}
	public String getScdTitle() {
		return scdTitle; 
	}
	public void setEmpCode(String empCode) {
		this.empCode = empCode; 
	}
	public String getEmpCode() {
		return empCode; 
	}
	public void setScdGrCode(String scdGrCode) {
		this.scdGrCode = scdGrCode; 
	}
	public String getScdGrCode() {
		return scdGrCode; 
	}
	public void setScdEndDt(Date scdEndDt) {
		this.scdEndDt = scdEndDt; 
	}
	public Date getScdEndDt() {
		return scdEndDt; 
	}
	public void setScdImport(String scdImport) {
		this.scdImport = scdImport; 
	}
	public String getScdImport() {
		return scdImport; 
	}
	public void setScdCode(String scdCode) {
		this.scdCode = scdCode; 
	}
	public String getScdCode() {
		return scdCode; 
	}
	

}
