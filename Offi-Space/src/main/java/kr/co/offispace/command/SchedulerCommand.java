package kr.co.offispace.command;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import kr.co.offispace.dto.SchedulerVO;

public class SchedulerCommand {
	
	private String scdCode;			//일정코드
	private String scdTitle;		//일정제목
	private String scdContent;		//일정 내용
	private String scdStartDt;		//일정시작일 //약속 : 22/02/03 19:19:19.0 //Wed Dec 01 00:00:00 KST 2021
	private String scdEndDt;		//일정종료일
	private String scdStartTime;	//일정시작시간
	private String scdEndTime;		//일정종료시간
	private String scdImport;		//일정중요여부 
	private String scdAllday;		//종일여부
	private String scdGrCode;		//일정분류코드
	private String empCode;			//사원코드
	
	private String scdHollyday;		//휴일여부
	private String scdName;			//일정이름
	private String scdColor;		//일정분류색
	private String scdDptCode;		//부서코드
	
	
	public String getScdStartTime() {
		return scdStartTime;
	}
	public void setScdStartTime(String scdStartTime) {
		this.scdStartTime = scdStartTime;
	}
	public String getScdEndTime() {
		return scdEndTime;
	}
	public void setScdEndTime(String scdEndTime) {
		this.scdEndTime = scdEndTime;
	}
	public String getScdCode() {
		return scdCode;
	}
	public void setScdCode(String scdCode) {
		this.scdCode = scdCode;
	}
	public String getScdTitle() {
		return scdTitle;
	}
	public void setScdTitle(String scdTitle) {
		this.scdTitle = scdTitle;
	}
	public String getScdContent() {
		return scdContent;
	}
	public void setScdContent(String scdContent) {
		this.scdContent = scdContent;
	}
	public String getScdStartDt() {
		return scdStartDt;
	}
	public void setScdStartDt(String scdStartDt) {
		this.scdStartDt = scdStartDt;
	}
	public String getScdEndDt() {
		return scdEndDt;
	}
	public void setScdEndDt(String scdEndDt) {
		this.scdEndDt = scdEndDt;
	}
	public String getScdImport() {
		return scdImport;
	}
	public void setScdImport(String scdImport) {
		this.scdImport = scdImport;
	}
	public String getScdAllday() {
		return scdAllday;
	}
	public void setScdAllday(String scdAllday) {
		this.scdAllday = scdAllday;
	}
	public String getScdHollyday() {
		return scdHollyday;
	}
	public void setScdHollyday(String scdHollyday) {
		this.scdHollyday = scdHollyday;
	}
	public String getScdGrCode() {
		return scdGrCode;
	}
	public void setScdGrCode(String scdGrCode) {
		this.scdGrCode = scdGrCode;
	}
	public String getEmpCode() {
		return empCode;
	}
	public void setEmpCode(String empCode) {
		this.empCode = empCode;
	}
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
	
	public SchedulerVO toScheduler() throws ParseException {
		
		SchedulerVO scheduler = new SchedulerVO();
		
		scheduler.setScdCode(scdCode);
		scheduler.setScdTitle(scdTitle);
		scheduler.setScdContent(scdContent);
		scheduler.setScdGrCode(scdGrCode);
		scheduler.setEmpCode(empCode);
		scheduler.setScdDptCode(scdDptCode);
		if(scdImport != null) {
			scheduler.setScdImport("Y");
		}else {
			scheduler.setScdImport("N");
		}
		if(scdAllday != null) {
			scheduler.setScdAllday("Y");
		}else {
			scheduler.setScdAllday("N");
		}
		
//		String temp=scdStartDt+" "+scdStartTime+".0";
//		String temp2=scdEndDt+" "+scdEndTime+".0";
		//Wed Dec 01 00:00:00 KST 2021
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		if(scdEndTime == null && scdStartTime == null) //종일일때 (시간이 없을때)
		if(scdAllday != null && scdAllday.equals("Y")) //종일일때 (시간이 없을때)
		{
			Date startDate = sdf.parse(scdStartDt + " 00:00:00");
            Date endDate = sdf.parse(scdEndDt + " 23:59:00");
            
			scheduler.setScdStartDt(startDate);
			scheduler.setScdEndDt(endDate);
			
		}
		else /*if(scdAllday.equals("N"))*/ //시간이 있을때.
		{
            Date startDate = sdf.parse(scdStartDt +" "+scdStartTime+":00"); //2022-01-1716:20
            Date endDate = sdf.parse(scdEndDt +" "+ scdEndTime+":00");
            
			scheduler.setScdStartDt(startDate);
			scheduler.setScdEndDt(endDate);
		}
		
		return scheduler;
		
	}
}
